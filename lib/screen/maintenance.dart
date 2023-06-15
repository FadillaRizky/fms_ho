import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fms_ho/screen/filter_date.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../api/GetAllSpkListResponse.dart';
import '../api/api.dart';
import '../constants.dart';
import '../models/nopol.dart';
import '../utils/alerts.dart';
import '../utils/currency.dart';
import '../utils/shared_pref.dart';
import 'auth/login_screen.dart';
import 'detail_spk.dart';

class Maintenance extends StatefulWidget {
  const Maintenance({Key? key}) : super(key: key);

  @override
  State<Maintenance> createState() => _MaintenanceState();
}

class _MaintenanceState extends State<Maintenance> {
  TextEditingController spkNumberController = TextEditingController();
  TextEditingController nopolController = TextEditingController();
  TextEditingController filterDateController = TextEditingController();
  RefreshController refreshC = RefreshController();

  List<Data> result = [];
  List? fixdate = [];

  // num? totalSpk;
  int? idNopol;
  int currentPage = 1;
  String? spkNumber;
  String? nopol;
  String? status;
  String? startDate;
  String? endDate;
  num? totalPages;

  bool loading = true;

  bool isSpkNumber = false;
  bool isNopol = false;
  bool isStatus = false;
  bool isClear = false;
  bool isDate = false;

  void loadData() async {
    // await Api.getAllSpkList(
    //         currentPage, spkNumber ?? "", nopol ?? "", status ?? "")
    //     .then((value) {
    //   if (value.message == "Token is Expired") {
    //     Alerts.showMessage(
    //         "Waktu Sesi Telah Habis,Silahkan Login Kembali..", context);
    //     Navigator.of(context)
    //         .pushReplacement(MaterialPageRoute(builder: (context) => Login()));
    //   } else {
    //     totalPages = value.totalSpk!;
    //   }
    // });
    try {
      if (result.length >= totalPages!) {
        refreshC.loadNoData();
      } else {
        currentPage++;
        await Api.getAllSpkList(
                currentPage, spkNumber ?? "", nopol ?? "", status ?? "",startDate ?? "",endDate ?? "")
            .then((value) {
          result.addAll(value.data!);
          setState(() {});
        });
        setState(() {});
        refreshC.loadComplete();
      }
    } catch (e) {
      print(e);
      refreshC.loadFailed();
    }
  }

  refreshSpklist() {
    try {
      setState(() {});
      loading = true;
      initSpklist();
      refreshC.refreshCompleted();
    } catch (e) {
      refreshC.refreshFailed();
    }
  }

  initSpklist() async {
    result.clear();
    setState(() {
      loading = true;
    });
    Api.getAllSpkList(currentPage, spkNumberController.text ?? "",
            nopolController.text ?? "", status ?? "",startDate ?? "",endDate ?? "")
        .then((value) {
      print(value.totalSpk);
      if (value.totalSpk! == 0) {
        loading = false;
        result = [];
        totalPages = value.totalSpk;
      }
      if (value.totalSpk! > 0) {
        loading = false;
        result = value.data!;
        totalPages = value.totalSpk;
      }
      setState(() {});
    });
  }

  @override
  void initState() {
    initSpklist();
    // spkNumberController.text = spkNumber ?? "";
    // nopolController.text = nopol ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
              color: Color.fromARGB(1000, 0, 111, 186),
              height: height,
              width: width,
              child: Align(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  'assets/logo_utilizes3.png',
                  width: 440.w,
                  height: 77.h,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Container(
                    height: constraints.maxHeight * 0.9,
                    width: width,
                    padding: EdgeInsets.fromLTRB(41, 42, 41, 0).r,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          " SPK List",
                          style: TextStyle(
                              fontSize: 55.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Text(
                          " Total Spk : ${totalPages ?? "-"} ",
                          style: TextStyle(
                              fontSize: 50.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        /// Filter Bar
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              barrierDismissible: true,
                              builder: (BuildContext context) {
                                return StatefulBuilder(
                                    builder: (context, setState) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    insetPadding: EdgeInsets.all(10),
                                    backgroundColor: Colors.white,
                                    elevation: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Filter",
                                            style: TextStyle(
                                                fontSize: 60.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black54),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                    vertical: 5)
                                                .r,
                                            width: width,
                                            height: 100.h,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: TextFormField(
                                              controller: spkNumberController,
                                              // initialValue: spkNumber ?? "Nomorspk",
                                              decoration: InputDecoration(
                                                  hintText:
                                                      "SPK/YYYY/MM/DD/XXX",
                                                  hintStyle:
                                                      Constants.hintStyle,
                                                  labelText: "Nomor SPK",
                                                  labelStyle:
                                                      Constants.labelstyle,
                                                  floatingLabelBehavior:
                                                      FloatingLabelBehavior
                                                          .always,
                                                  contentPadding:
                                                      EdgeInsets.fromLTRB(
                                                          10, 3, 1, 3),
                                                  border: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        width: 1,
                                                        style:
                                                            BorderStyle.none),
                                                  ),
                                                  filled: true,
                                                  fillColor: Colors.white),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                    vertical: 5)
                                                .r,
                                            width: width,
                                            height: 100.h,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: TextFormField(
                                              controller: nopolController,
                                              // initialValue: nopol ?? "Nopol",
                                              decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.fromLTRB(
                                                          10, 3, 1, 3),
                                                  hintText: "X 1234 XX",
                                                  hintStyle:
                                                      Constants.hintStyle,
                                                  labelText: "Nopol",
                                                  labelStyle:
                                                      Constants.labelstyle,
                                                  floatingLabelBehavior:
                                                      FloatingLabelBehavior
                                                          .always,
                                                  border: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        width: 1,
                                                        style:
                                                            BorderStyle.none),
                                                  ),
                                                  filled: true,
                                                  fillColor: Colors.white),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          GestureDetector(
                                            onTap: () async {
                                              showModalBottomSheet(
                                                backgroundColor: Colors.transparent,
                                                context: context,
                                                builder: (BuildContext context) {
                                                  return Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius.vertical(
                                                        top: Radius.circular(20.0),
                                                      ),
                                                    ),
                                                    padding: EdgeInsets.all(16.0),
                                                    child: Column(
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: <Widget>[
                                                        GestureDetector(
                                                          onTap: (){
                                                            String formatnow =
                                                            DateFormat('yyyy-MM-dd').format(DateTime.now());
                                                            List finalDate = [formatnow,formatnow];
                                                            Navigator.of(context).pop(finalDate);
                                                          },
                                                          child: Text(
                                                            'Hari Ini',
                                                            style: TextStyle(fontSize: 18.0),
                                                          ),
                                                        ),
                                                        Divider(),
                                                        GestureDetector(
                                                          onTap: (){
                                                            String formatnow =
                                                            DateFormat('yyyy-MM-dd').format(DateTime.now());
                                                            String formatYesterday = DateFormat('yyyy-MM-dd')
                                                                .format(DateTime.now().subtract(Duration(days: 1)));
                                                            List finalDate = [formatYesterday,formatnow];
                                                            Navigator.of(context).pop(finalDate);
                                                          },
                                                          child: Text(
                                                            'Kemarin',
                                                            style: TextStyle(fontSize: 18.0),
                                                          ),
                                                        ),
                                                        Divider(),
                                                        GestureDetector(
                                                          onTap: (){
                                                            String formatnow =
                                                            DateFormat('yyyy-MM-dd').format(DateTime.now());
                                                            String formatOneWeek = DateFormat('yyyy-MM-dd')
                                                                .format(DateTime.now().subtract(Duration(days: 7)));
                                                            List finalDate = [formatOneWeek,formatnow];
                                                            Navigator.of(context).pop(finalDate);
                                                          },
                                                          child: Text(
                                                            'Minggu Ini',
                                                            style: TextStyle(fontSize: 18.0),
                                                          ),
                                                        ),
                                                        Divider(),
                                                        GestureDetector(
                                                          onTap: (){
                                                            String formatnow =
                                                            DateFormat('yyyy-MM-dd').format(DateTime.now());
                                                            String formatOneMonth = DateFormat('yyyy-MM-dd')
                                                                .format(DateTime.now().subtract(Duration(days: 30)));
                                                            List finalDate = [formatOneMonth,formatnow];
                                                            Navigator.of(context).pop(finalDate);
                                                          },
                                                          child: Text(
                                                            'Bulan Ini',
                                                            style: TextStyle(fontSize: 18.0),
                                                          ),
                                                        ),
                                                        Divider(),
                                                        GestureDetector(
                                                          onTap: () async {
                                                             try{
                                                               List finalDate = await Navigator.push(
                                                                 context,
                                                                 MaterialPageRoute(
                                                                   builder: (context) => FilterDate(),
                                                                 ),
                                                               );
                                                               if (finalDate != []) {
                                                                 Navigator.of(context).pop(finalDate);
                                                               }
                                                             }catch(e){
                                                               print(e);
                                                             }



                                                          },
                                                          child: Text(
                                                            'Pilih Tanggal Sendiri',
                                                            style: TextStyle(fontSize: 18.0),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ).then((value) {
                                                if (value != null) {
                                                  startDate = value[0];
                                                  endDate = value[1];
                                                  filterDateController.text = "${value[0]} - ${value[1]}";
                                                  print(' ${value[0]} - ${value[1]}');
                                                }
                                              });
                                            },
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                      vertical: 5)
                                                  .r,
                                              width: width,
                                              height: 100.h,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: TextFormField(
                                                controller:
                                                    filterDateController,
                                                enabled: false,
                                                decoration: InputDecoration(
                                                    contentPadding:
                                                        EdgeInsets.fromLTRB(
                                                            10, 3, 1, 3),
                                                    hintText:
                                                        "Silahkan Pilih Tanggal",
                                                    hintStyle:
                                                        Constants.hintStyle,
                                                    labelText: "Tanggal",
                                                    labelStyle:
                                                        Constants.labelstyle,
                                                    floatingLabelBehavior:
                                                        FloatingLabelBehavior
                                                            .always,
                                                    suffixIcon: Icon(
                                                        Icons.calendar_month),
                                                    // border: OutlineInputBorder(
                                                    //   borderSide: BorderSide(
                                                    //       width: 1,
                                                    //       style:
                                                    //       BorderStyle.none),
                                                    // ),
                                                    disabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          width: 1,
                                                          style: BorderStyle
                                                              .solid),
                                                    ),
                                                    filled: true,
                                                    fillColor: Colors.white),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          DropdownSearch<String>(
                                            items: [
                                              "OPEN",
                                              "CLOSED",
                                              "INSPECT",
                                              "PROGRESS",
                                              "CANCEL",
                                              "TEMPORARY"
                                            ],
                                            clearButtonProps: ClearButtonProps(
                                                isVisible: true,
                                                onPressed: () {
                                                  setState(() {
                                                    status = null;
                                                  });
                                                }),
                                            popupProps:
                                                PopupPropsMultiSelection.menu(
                                              fit: FlexFit.loose,
                                              showSearchBox: false,
                                              itemBuilder:
                                                  (context, item, isSelected) =>
                                                      ListTile(
                                                title: Text(item),
                                              ),
                                            ),
                                            dropdownBuilder:
                                                (context, selectedItem) => Text(
                                              status ?? "Status",
                                              style: TextStyle(
                                                  fontSize: 45.sp,
                                                  color: Colors.black87),
                                            ),
                                            onChanged: (value) {
                                              status = value!;
                                            },
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  spkNumberController.clear();
                                                  nopolController.clear();
                                                  filterDateController.clear();
                                                  status = null;
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text("Batal"),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  if (spkNumberController
                                                          .text !=
                                                      "") {
                                                    isSpkNumber = true;
                                                    isClear = true;
                                                  } else {
                                                    isSpkNumber = false;
                                                  }

                                                  if (nopolController.text !=
                                                      "") {
                                                    isNopol = true;
                                                    isClear = true;
                                                  } else {
                                                    isNopol = false;
                                                  }

                                                  if (status != null) {
                                                    isStatus = true;
                                                    isClear = true;
                                                  } else {
                                                    isStatus = false;
                                                  }
                                                  if (filterDateController.text != "") {
                                                    isDate = true;
                                                    isClear = true;
                                                  } else {
                                                    isDate = false;
                                                  }
                                                  Navigator.pop(context);
                                                  initSpklist();
                                                },
                                                child: Text("Cari"),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                });
                              },
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(20, 0, 15, 0),
                            height: 113.h,
                            width: width,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0.5, color: Colors.black54),
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Filter",
                                    style: TextStyle(
                                        fontSize: 55.sp, color: Colors.black54),
                                  ),
                                  Icon(
                                    Icons.filter_alt_sharp,
                                    color: Colors.blue,
                                    size: 23,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        /// Indicator Filter
                        Row(
                          children: [
                            Expanded(
                              child: Visibility(
                                visible: isClear,
                                child: SizedBox(
                                  height: 110.h,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      Visibility(
                                        visible: isSpkNumber,
                                        child: FittedBox(
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                            elevation: 2,
                                            child: Center(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                        vertical: 5),
                                                child: Row(
                                                  children: [
                                                    Text("No Spk"),
                                                    SizedBox(
                                                      width: 50.w,
                                                    ),
                                                    Icon(
                                                      Icons.check_box,
                                                      color: Colors.blue,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Visibility(
                                        visible: isNopol,
                                        child: FittedBox(
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                            elevation: 2,
                                            child: Center(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                        vertical: 5),
                                                child: Row(
                                                  children: [
                                                    Text("Nopol"),
                                                    SizedBox(
                                                      width: 50.w,
                                                    ),
                                                    Icon(Icons.check_box,
                                                        color: Colors.blue)
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Visibility(
                                        visible: isStatus,
                                        child: FittedBox(
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                            elevation: 2,
                                            child: Center(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                        vertical: 5),
                                                child: Row(
                                                  children: [
                                                    Text("Status"),
                                                    SizedBox(
                                                      width: 50.w,
                                                    ),
                                                    Icon(Icons.check_box,
                                                        color: Colors.blue)
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Visibility(
                                        visible: isDate,
                                        child: FittedBox(
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                            elevation: 2,
                                            child: Center(
                                              child: Padding(
                                                padding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                    vertical: 5),
                                                child: Row(
                                                  children: [
                                                    Text("Tanggal"),
                                                    SizedBox(
                                                      width: 50.w,
                                                    ),
                                                    Icon(Icons.check_box,
                                                        color: Colors.blue)
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Visibility(
                              visible: isClear,
                              child: SizedBox(
                                  width: 50,
                                  child: IconButton(
                                      onPressed: () {
                                        // spkNumber
                                        spkNumberController.clear();
                                        nopolController.clear();
                                        filterDateController.clear();
                                        startDate = null;
                                        endDate = null;
                                        status = null;
                                        isClear = false;
                                        isSpkNumber = false;
                                        isNopol = false;
                                        isStatus = false;
                                        initSpklist();
                                      },
                                      icon: Icon(Icons.clear))),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        (loading == true)
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : (result.isNotEmpty)
                                ? Expanded(
                                    child: SmartRefresher(
                                      controller: refreshC,
                                      enablePullDown: true,
                                      enablePullUp: true,
                                      onRefresh: refreshSpklist,
                                      onLoading: loadData,
                                      child: ListView.builder(
                                          itemCount: result.length,
                                          itemBuilder: (context, index) {
                                            final order = result[index];
                                            return AnimationConfiguration
                                                .staggeredList(
                                              position: index,
                                              duration:
                                                  const Duration(seconds: 1),
                                              child: SlideAnimation(
                                                verticalOffset: 44.0,
                                                child: FadeInAnimation(
                                                  child: Container(
                                                    child: Column(
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            Navigator.of(
                                                                    context)
                                                                .push(
                                                              MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        DetailSpk(
                                                                  spkId: order
                                                                      .spkId!,
                                                                  noSpk: order
                                                                      .spkNumber!,
                                                                  createAt: order
                                                                      .createdAt!,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                          child: Container(
                                                            padding: EdgeInsets
                                                                    .fromLTRB(
                                                                        36,
                                                                        26,
                                                                        36,
                                                                        26)
                                                                .r,
                                                            decoration: BoxDecoration(
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .black26),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      "SPK List No: ${order.spkNumber}",
                                                                      style: TextStyle(
                                                                          fontSize: 40
                                                                              .sp,
                                                                          color: Colors
                                                                              .black87,
                                                                          fontWeight:
                                                                              FontWeight.w700),
                                                                    ),
                                                                    Text(
                                                                      "Status",
                                                                      style: TextStyle(
                                                                          fontSize: 45
                                                                              .sp,
                                                                          color: Colors
                                                                              .black87,
                                                                          fontWeight:
                                                                              FontWeight.w700),
                                                                    )
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: 9.h,
                                                                ),
                                                                Text(
                                                                    "Nopol : ${order.policeNumber ?? "-"} ",
                                                                    style: TextStyle(
                                                                        fontSize: 40
                                                                            .sp,
                                                                        color: Colors
                                                                            .black87,
                                                                        fontWeight:
                                                                            FontWeight.w700)),
                                                                SizedBox(
                                                                  height: 9.h,
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      Formathari
                                                                          .formatHari(
                                                                              order.updatedAt!),
                                                                      style: TextStyle(
                                                                          fontSize: 46
                                                                              .sp,
                                                                          color:
                                                                              Colors.black54),
                                                                    ),
                                                                    Container(
                                                                      width:
                                                                          290.w,
                                                                      height:
                                                                          58.h,
                                                                      decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(
                                                                              3),
                                                                          color: Color.fromARGB(
                                                                              225,
                                                                              195,
                                                                              229,
                                                                              255)),
                                                                      child: Center(
                                                                          child: Text(
                                                                        order
                                                                            .status!,
                                                                        maxLines:
                                                                            1,
                                                                        style:
                                                                            TextStyle(
                                                                          overflow:
                                                                              TextOverflow.fade,
                                                                          color:
                                                                              Colors.blue,
                                                                          fontSize:
                                                                              45.sp,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      )),
                                                                    )
                                                                  ],
                                                                ),
                                                                Divider(
                                                                  color: Colors
                                                                      .black26,
                                                                ),
                                                                Text(
                                                                    order.serviceType ??
                                                                        "-",
                                                                    style: TextStyle(
                                                                        fontSize: 45
                                                                            .sp,
                                                                        color: Colors
                                                                            .black87,
                                                                        fontWeight:
                                                                            FontWeight.w700)),
                                                                Text(
                                                                  "Keterangan:",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          43.sp,
                                                                      color: Colors
                                                                          .black54),
                                                                ),
                                                                SizedBox(
                                                                  height: 130.h,
                                                                  width: double
                                                                      .infinity,
                                                                  child: Text(
                                                                    order.problemDetail ??
                                                                        "-",
                                                                    maxLines: 3,
                                                                    style: TextStyle(
                                                                        fontSize: 40
                                                                            .sp,
                                                                        overflow:
                                                                            TextOverflow
                                                                                .ellipsis,
                                                                        color: Colors
                                                                            .black54),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: height / 60,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                    ),
                                  )
                                : Center(
                                    child: Column(
                                    children: [
                                      Text("BELUM ADA DATA"),
                                    ],
                                  )),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
