import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../api/GetDetailSpkResponse.dart';
import '../../api/api.dart';
import '../../constants.dart';
import '../../utils/alerts.dart';
import '../../utils/currency.dart';

class DetailSpk extends StatefulWidget {
  final num spkId;
  final String noSpk, createAt;

  const DetailSpk(
      {Key? key,
      required this.spkId,
      required this.noSpk,
      required this.createAt})
      : super(key: key);

  @override
  State<DetailSpk> createState() => _DetailSpkState();
}

class _DetailSpkState extends State<DetailSpk> {
  bool isLoading = false;
  TextEditingController noteController = TextEditingController();
  TextEditingController kilometerController = TextEditingController();

  // late VideoPlayerController _controller;
  String? jenisPerbaikan;
  File? fileKerusakanDepan;
  File? fileKerusakanKanan;
  File? fileKerusakanKiri;
  File? fileSelvi;
  File? fileVideo;
  String? image64;

  int vehicleId = 1;
  int driverId = 1;
  String location = "jl. Mangga Raya Jakarta";

  Future<GetDetailSpkResponse>? listDetailSpk;

  showDialogFoto(String pathFoto) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
            insetPadding: EdgeInsets.all(10),
            backgroundColor: Colors.white,
            elevation: 1,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Image.network(pathFoto),
            ));
      },
    );
  }

  String formatCurrency(num amount) {
    final formatCurrency = NumberFormat.simpleCurrency(locale: 'id_ID');
    return formatCurrency.format(amount).replaceAll(",00", "");
  }

  String _videoDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final second = twoDigits(duration.inSeconds.remainder(60));

    return [if (duration.inHours > 0) hours, minutes, second].join(":");
  }

  @override
  void initState() {
    super.initState();
    listDetailSpk = Api.getDetailSpk(widget.spkId);
    // _controller = VideoPlayerController.network(widget.videoPath)
    //   ..initialize().then((_) {
    //     // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
    //     setState(() {});
    //   });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(50, 50, 0, 0).r,
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
                    padding: EdgeInsets.fromLTRB(30, 30, 30, 0).r,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                    ),
                    child: FutureBuilder(
                      future: listDetailSpk,
                      builder: (context,
                          AsyncSnapshot<GetDetailSpkResponse> snapshot) {
                        if (snapshot.hasData) {
                          return detailItemSpk(snapshot.data!.data!);
                        }
                        if (snapshot.hasError) {
                          print(widget.spkId);
                          // print(snapshot.data!.data!.spkDetail!.spkId);
                          print(snapshot.error);
                          return Center(child: Text("Coba Lagi.."));
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
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

  Widget detailItemSpk(Data data) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(25.r),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black26),
                borderRadius: BorderRadius.circular(5)),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("No Spk", style: Constants.subtitle2),
                    Text("Spk dibuat", style: Constants.subtitle2),
                    Text("Nopol", style: Constants.subtitle2),
                  ],
                ),
                SizedBox(
                  width: 50.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(": ", style: Constants.subtitle2),
                    Text(": ", style: Constants.subtitle2),
                    Text(": ", style: Constants.subtitle2),
                  ],
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.noSpk,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Constants.subtitle2),
                      Text(Formathari.formatHari(widget.createAt),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Constants.subtitle2),
                      Text(data.spkDetail!.policeNumber ?? "-",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Constants.subtitle2),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 47.h,
          ),
          SizedBox(
            height: 110.h,
            child: DropdownSearch<String>(
              popupProps: PopupPropsMultiSelection.menu(),
              dropdownDecoratorProps: DropDownDecoratorProps(
                baseStyle: Constants.labelstyle,
                dropdownSearchDecoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(15, 3, 5, 3),
                    border: OutlineInputBorder(),
                    labelText: "Jenis Kerusakan",
                    labelStyle: Constants.labelstyle),
              ),

              selectedItem: data.spkDetail!.serviceType ?? "-",
              enabled: false,
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(36, 26, 36, 26).r,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black26),
                borderRadius: BorderRadius.circular(5)),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Foto Lampiran  :",
                      style: TextStyle(
                        fontSize: 40.sp,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Column(
                      children: [
                        Text(
                          "Foto Selfie",
                          style: Constants.textbutton1,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Stack(children: [
                          SizedBox(
                            height: 300.w,
                            width: 300.w,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(1000),
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl: data.spkDetail!.driverImage ??
                                    "https://www.atlantawatershed.org/wp-content/uploads/2017/06/default-placeholder.png",
                                placeholder: (context, url) =>
                                    new CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    new Icon(Icons.error),
                              ),
                            ),
                          ),
                          Alerts.iconPreview(
                              CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl: data.spkDetail!.driverImage ??
                                    "https://www.atlantawatershed.org/wp-content/uploads/2017/06/default-placeholder.png",
                                placeholder: (context, url) =>
                                    new CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    new Icon(Icons.error),
                              ),
                              context)
                        ]),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Foto Kerusakan",
                                  style: Constants.textbutton1,
                                ),
                                Stack(children: [
                                  Container(
                                    height: 250.w,
                                    width: 250.w,
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black54, width: 2),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      imageUrl: data.spkDetail!.image1 ??
                                          "https://www.atlantawatershed.org/wp-content/uploads/2017/06/default-placeholder.png",
                                      placeholder: (context, url) =>
                                          new CircularProgressIndicator(),
                                      errorWidget: (context, url, error) =>
                                          new Icon(Icons.error),
                                    ),
                                  ),
                                  Alerts.iconPreview(
                                      CachedNetworkImage(
                                        fit: BoxFit.cover,
                                        imageUrl: data.spkDetail!.image1 ??
                                            "https://www.atlantawatershed.org/wp-content/uploads/2017/06/default-placeholder.png",
                                        placeholder: (context, url) =>
                                            new CircularProgressIndicator(),
                                        errorWidget: (context, url, error) =>
                                            new Icon(Icons.error),
                                      ),
                                      context)
                                ]),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "Foto Kerusakan",
                                  style: Constants.textbutton1,
                                ),
                                Stack(children: [
                                  Container(
                                    height: 250.w,
                                    width: 250.w,
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black54, width: 2),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      imageUrl: data.spkDetail!.image2 ??
                                          "https://www.atlantawatershed.org/wp-content/uploads/2017/06/default-placeholder.png",
                                      placeholder: (context, url) =>
                                          new CircularProgressIndicator(),
                                      errorWidget: (context, url, error) =>
                                          new Icon(Icons.error),
                                    ),
                                  ),
                                  Alerts.iconPreview(
                                      CachedNetworkImage(
                                        fit: BoxFit.cover,
                                        imageUrl: data.spkDetail!.image2 ??
                                            "https://www.atlantawatershed.org/wp-content/uploads/2017/06/default-placeholder.png",
                                        placeholder: (context, url) =>
                                            new CircularProgressIndicator(),
                                        errorWidget: (context, url, error) =>
                                            new Icon(Icons.error),
                                      ),
                                      context)
                                ]),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Column(
                          children: [
                            Text(
                              "Foto Kilometer",
                              style: Constants.textbutton1,
                            ),
                            Stack(children: [
                              Container(
                                height: 250.w,
                                width: 250.w,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black54, width: 2),
                                    borderRadius: BorderRadius.circular(10)),
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: data.spkDetail!.image3 ??
                                      "https://www.atlantawatershed.org/wp-content/uploads/2017/06/default-placeholder.png",
                                  placeholder: (context, url) =>
                                      new CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      new Icon(Icons.error),
                                ),
                              ),
                              Alerts.iconPreview(
                                  CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl: data.spkDetail!.image3 ??
                                        "https://www.atlantawatershed.org/wp-content/uploads/2017/06/default-placeholder.png",
                                    placeholder: (context, url) =>
                                        new CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        new Icon(Icons.error),
                                  ),
                                  context)
                            ]),
                          ],
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          TextField(
            style: Constants.labelstyle,
            keyboardType: TextInputType.number,
            controller: TextEditingController(
                text: data.spkDetail!.km.toString() ?? "-"),
            enabled: false,
            decoration: InputDecoration(
              suffixText: "KM",
              suffixStyle: TextStyle(
                  fontSize: 50.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38),
              labelText: "Kilometer Kendaraan",
              labelStyle: Constants.labelstyle,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding: EdgeInsets.fromLTRB(8, 20, 10, 3),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          TextField(
            style: Constants.labelstyle,
            maxLines: 5,
            controller:
                TextEditingController(text: data.spkDetail!.problemDetail),
            enabled: false,
            decoration: InputDecoration(
              labelText: "Detail Kerusakan",
              labelStyle: Constants.labelstyle,

              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding: EdgeInsets.fromLTRB(8, 20, 5, 3),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          TextField(
            style: Constants.labelstyle,
            controller:
                TextEditingController(text: data.spkDetail!.location ?? "-"),
            decoration: InputDecoration(
              enabled: false,
              labelText: "Lokasi",
              labelStyle: Constants.labelstyle,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding: EdgeInsets.all(8),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: Colors.black38)),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20.r),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black26),
                borderRadius: BorderRadius.circular(5)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Biaya Perbaikan :",
                  style: TextStyle(
                    fontSize: 40.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),

                /// FIELD JASA
                Text(
                  "1. Jasa :",
                  style: Constants.subtitle3
                ),
                SizedBox(
                  height: 10.h,
                ),
                for (var i = 0; i < data.additionalCost!.length; i++)
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 30.w,
                          ),
                          Container(
                              width: 600.w,
                              child: Text(
                                "${data.additionalCost![i].additionalType!}",
                                style: TextStyle(fontSize: 35.sp),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              )),
                          Text(" :  ", style: TextStyle(fontSize: 35.sp)),
                          Expanded(
                            child: Text(
                              (data.additionalCost![i].additionalCost != null)
                                  ? "${Currency.rupiah.format(data.additionalCost![i].additionalCost)}"
                                  : "null",
                              style: TextStyle(fontSize: 35.sp),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      )
                    ],
                  ),
                SizedBox(
                  height: 15.h,
                ),

                /// FIELD SPAREPART
                Text(
                  "2. Sparepart :",
                  style: Constants.subtitle3
                ),
                SizedBox(
                  height: 10.h,
                ),
                for (var i = 0; i < data.sparepartList!.length; i++)
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 30.w,
                          ),
                          Container(
                              width: 600.w,
                              child: Text(
                                "${data.sparepartList![i].sparepartName!}",
                                style: TextStyle(fontSize: 35.sp),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              )),
                          Text(" :  ", style: TextStyle(fontSize: 35.sp)),
                          Expanded(
                            child: Text(
                              (data.sparepartList![i].totalPrice != null)
                                  ? "${Currency.rupiah.format(data.sparepartList![i].totalPrice)}"
                                  : "null",
                              style: TextStyle(fontSize: 35.sp),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      )
                    ],
                  ),
                SizedBox(
                  height: 15.h,
                ),

                /// FIELD SUBCON
                Text(
                  "3. Subcon :",
                  style: Constants.subtitle3
                ),
                SizedBox(
                  height: 10.h,
                ),
                for (var i = 0; i < data.subcon!.length; i++)
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 30.w,
                          ),
                          Container(
                              width: 600.w,
                              child: Text(
                                "${data.subcon![i].subconDescription!}",
                                style: TextStyle(fontSize: 35.sp),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              )),
                          Text(" :  ", style: TextStyle(fontSize: 35.sp)),
                          Expanded(
                            child: Text(
                              (data.subcon![i].subconCost != null)
                                  ? "${Currency.rupiah.format(data.subcon![i].subconCost)}"
                                  : "null",
                              style: TextStyle(fontSize: 35.sp),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      )
                    ],
                  ),
                SizedBox(
                  height: 20.h,
                ),
                Divider(),
                Row(
                  children: [
                    SizedBox(
                      width: 30.w,
                    ),
                    Container(
                        width: 600.w,
                        child: Text(
                          "TOTAL",
                          style: TextStyle(fontSize: 35.sp),
                        )),
                    Text(" :  ", style: TextStyle(fontSize: 35.sp)),
                    Expanded(
                      child: Text(
                        (data.spkDetail!.totalAmount != null)
                            ? "${Currency.rupiah.format(data.spkDetail!.totalAmount)}"
                            : "Rp.0",
                        style: TextStyle(fontSize: 35.sp),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),

          SizedBox(
            height: 30.h,
          ),

          ///HANDLE VIDEO
          //video
          // Text(
          //   "Video Kerusakan",
          //   style: TextStyle(fontSize: 25),
          // ),
          // // _controller.value.isInitialized
          // //     ? (widget.videoPath != "")
          // //         ? Column(
          // //             children: [
          // //               AspectRatio(
          // //                 aspectRatio: _controller.value.aspectRatio,
          // //                 child: VideoPlayer(_controller),
          // //               ),
          // //               SizedBox(
          // //                 height: 5,
          // //               ),
          // //               Row(
          // //                 crossAxisAlignment: CrossAxisAlignment.center,
          // //                 children: [
          // //                   ValueListenableBuilder(
          // //                     valueListenable: _controller,
          // //                     builder: (context, value, child) {
          // //                       return Text(
          // //                         _videoDuration(value.position),
          // //                         style: TextStyle(
          // //                             color: Colors.black, fontSize: 20),
          // //                       );
          // //                     },
          // //                   ),
          // //                   Expanded(
          // //                     child: SizedBox(
          // //                       height: 20,
          // //                       child: VideoProgressIndicator(
          // //                         _controller,
          // //                         allowScrubbing: true,
          // //                         padding: EdgeInsets.symmetric(
          // //                             vertical: 0, horizontal: 12),
          // //                       ),
          // //                     ),
          // //                   ),
          // //                   Text(
          // //                     _videoDuration(_controller.value.duration),
          // //                     style:
          // //                         TextStyle(color: Colors.black, fontSize: 20),
          // //                   )
          // //                 ],
          // //               ),
          // //               SizedBox(
          // //                 height: 5,
          // //               ),
          // //               IconButton(
          // //                 onPressed: () {
          // //                   setState(() {
          // //                     _controller.value.isPlaying
          // //                         ? _controller.pause()
          // //                         : _controller.play();
          // //                   });
          // //                 },
          // //                 icon: Icon(
          // //                   _controller.value.isPlaying
          // //                       ? Icons.pause
          // //                       : Icons.play_arrow,
          // //                 ),
          // //               )
          // //             ],
          // //           )
          // //         : Image.asset("assets/place_holder.jpeg")
          // //     : Container(
          // //         height: 100,
          // //         child: Center(
          // //           child: CircularProgressIndicator(),
          // //         )),
          // (widget.videoPath != "")
          //     ? _controller.value.isInitialized
          //         ? Column(
          //             children: [
          //               AspectRatio(
          //                 aspectRatio: _controller.value.aspectRatio,
          //                 child: VideoPlayer(_controller),
          //               ),
          //               SizedBox(
          //                 height: 5,
          //               ),
          //               Row(
          //                 crossAxisAlignment: CrossAxisAlignment.center,
          //                 children: [
          //                   ValueListenableBuilder(
          //                     valueListenable: _controller,
          //                     builder: (context, value, child) {
          //                       return Text(
          //                         _videoDuration(value.position),
          //                         style: TextStyle(
          //                             color: Colors.black, fontSize: 20),
          //                       );
          //                     },
          //                   ),
          //                   Expanded(
          //                     child: SizedBox(
          //                       height: 20,
          //                       child: VideoProgressIndicator(
          //                         _controller,
          //                         allowScrubbing: true,
          //                         padding: EdgeInsets.symmetric(
          //                             vertical: 0, horizontal: 12),
          //                       ),
          //                     ),
          //                   ),
          //                   Text(
          //                     _videoDuration(_controller.value.duration),
          //                     style:
          //                         TextStyle(color: Colors.black, fontSize: 20),
          //                   )
          //                 ],
          //               ),
          //               SizedBox(
          //                 height: 5,
          //               ),
          //               IconButton(
          //                 onPressed: () {
          //                   setState(() {
          //                     _controller.value.isPlaying
          //                         ? _controller.pause()
          //                         : _controller.play();
          //                   });
          //                 },
          //                 icon: Icon(
          //                   _controller.value.isPlaying
          //                       ? Icons.pause
          //                       : Icons.play_arrow,
          //                 ),
          //               )
          //             ],
          //           )
          //         : Container(
          //             height: 100,
          //             child: Center(
          //               child: CircularProgressIndicator(),
          //             ))
          //     : Image.asset("assets/place_holder.jpeg"),
          Container(
            width: double.infinity,
            height: 113.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(225, 0, 111, 186),
                Color.fromARGB(225, 58, 171, 249)
              ]),
              borderRadius: BorderRadius.circular(13),
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Kembali",
                style: Constants.textbutton1,
              ),
            ),
          ),
        ],
      ),
    );
  }

//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//   }
}
