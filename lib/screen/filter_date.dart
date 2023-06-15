import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fms_ho/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../utils/alerts.dart';

class FilterDate extends StatefulWidget {
  const FilterDate({Key? key}) : super(key: key);

  @override
  State<FilterDate> createState() => _FilterDateState();
}

class _FilterDateState extends State<FilterDate> {
  String? startDate;
  String? endDate;


  bool isEnabled = false;
  bool isButtonEnabled = false;

  DateFormat format = DateFormat('yyyy-MM-dd');

  DateTimeRange? selectedDateRange;


  selectDate(){
    // String fixDate = "${startDate} - ${endDate}";
    List finalDate = [startDate,endDate];
    // print("kok ga muncul");
    Navigator.pop(context,finalDate ?? []);
  }

  void _show() async {
    final DateTimeRange? result = await showDateRangePicker(
      context: context,
      firstDate: DateTime(1945),
      lastDate: DateTime.now(),
      currentDate: DateTime.now(),
      saveText: 'Done',
    );

    if (result != null) {
      print(result.start.toString());
      setState(() {
        selectedDateRange = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pilih Tanggal"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    "Tanggal Awal",
                  ),
                  titleTextStyle: Constants.title,
                  titleAlignment: ListTileTitleAlignment.center,
                  leading: FaIcon(FontAwesomeIcons.calendarDays,
                      size: 40, color: Colors.blueAccent),
                  trailing: Icon(Icons.arrow_drop_down_outlined),
                  subtitle: Text( (startDate != null) ? "$startDate" : "Pilih Tanggal"),
                  subtitleTextStyle: Constants.subtitleListTile,
                  onTap: () {
                    showDatePicker(
                      context: context,
                      initialDate: startDate != null ? format.parse(startDate!) : DateTime.now() ,
                      firstDate: DateTime(1945),
                      lastDate: DateTime.now(),
                      initialEntryMode: DatePickerEntryMode.calendarOnly,
                    ).then((value) {
                      if (value != null) {
                        String formatDate = DateFormat('yyyy-MM-dd').format(value);
                        setState(() {
                          startDate = formatDate;
                          isEnabled = true;
                        });
                      }
                    });
                  },
                ),
                ListTile(
                  title: Text(
                    "Tanggal Akhir",
                  ),
                  titleTextStyle: Constants.title,
                  titleAlignment: ListTileTitleAlignment.center,
                  leading: FaIcon(FontAwesomeIcons.calendarDays,
                      size: 40, color: Colors.blueAccent),
                  trailing: Icon(Icons.arrow_drop_down_outlined),
                  subtitle: Text((endDate != null) ? "$endDate" : "Pilih Tanggal"),
                  subtitleTextStyle: Constants.subtitleListTile,
                  onTap: () {
                    isEnabled ? showDatePicker(
                        context: context,
                        initialDate: endDate != null ? format.parse(endDate!) : DateTime.now(),
                    firstDate: format.parse(startDate!),
                    lastDate: DateTime.now(),
                    initialEntryMode: DatePickerEntryMode.calendarOnly,
                    ).then((value) {
                    if (value != null) {
                    String formatDate = DateFormat('yyyy-MM-dd').format(value);
                    setState(() {
                    endDate = formatDate;
                    });
                    }
                    if (startDate != null && endDate != null) {
                    setState(() {
                    isButtonEnabled = true;
                    });
                    }
                    }

                    )
                    : Alerts.showMessage("Silahkan Pilih Tanggal Awal", context);
                  },
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Container(
              width: double.infinity,
              height: 110.h,
              decoration: BoxDecoration(
                color: isButtonEnabled ? Colors.blue: Color.fromRGBO(37, 97, 194, 150),
                borderRadius: BorderRadius.circular(13),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                onPressed: () {
                  isButtonEnabled ? selectDate() : null;
                },
                child: Text(
                  "Pilih",
                  style: Constants.textbutton1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
