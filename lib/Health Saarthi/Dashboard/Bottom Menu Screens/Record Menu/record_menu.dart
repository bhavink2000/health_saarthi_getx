import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_saarthi_getx/Health%20Saarthi/App%20Helper/Netwok%20Helper/Chart%20Api%20Call/chart_api_call.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../App Helper/Model Helper/Dashboard Model/Reports Model/day_report_model.dart';
import '../../../App Helper/Model Helper/Dashboard Model/Reports Model/month_report_model.dart';
import '../../../App Helper/Model Helper/Dashboard Model/Reports Model/yers_report_model.dart';
import '../../../App Helper/Model Helper/day_month_year_entry_model.dart';
import '../../../App Helper/app_text_helper.dart';
import '../../../App Helper/font_&_color_helper.dart';
import '../../../App Helper/snakebar_helper.dart';

class ReportMenu extends StatefulWidget {
  final bool? isFromDrawer;
  const ReportMenu({Key? key, this.isFromDrawer = false}) : super(key: key);

  @override
  State<ReportMenu> createState() => _ReportMenuState();
}

class _ReportMenuState extends State<ReportMenu> {
  final monthYear = TextEditingController();
  final year = TextEditingController();
  final fromYear = TextEditingController();
  final toYear = TextEditingController();

  TooltipBehavior? _tooltipBehavior;
  List<DayData>? dayData;
  List<MonthData>? monthData;
  List<YearData>? yearData;
  @override
  void initState() {
    super.initState();
    fetchDay('');
    fetchMonth('');
    fetchYear('', '');
  }

  @override
  Widget build(BuildContext context) {
    List<DayDataEntry> dayChartData = [];
    if (dayData != null) {
      dayChartData = dayData!.map((entry) {
        return DayDataEntry(
          date: entry.date!,
          amount: entry.amount.toString(),
          count: entry.count,
        );
      }).toList();
    }
    List<MonthDataEntry> monthChartData = [];
    if (monthData != null) {
      monthChartData = monthData!.map((entry) {
        return MonthDataEntry(
          month: entry.month!,
          amount: entry.amount.toString(),
          count: entry.count,
        );
      }).toList();
    }
    List<YearDataEntry> yearChartData = [];
    if (yearData != null) {
      yearChartData = yearData!.map((entry) {
        return YearDataEntry(
          month: entry.month!,
          amount: entry.amount.toString(),
          count: entry.count,
        );
      }).toList();
    }
    return Scaffold(
      appBar: widget.isFromDrawer!
          ? AppBar(
              backgroundColor: ColorHelper.hsPrimeOne,
              iconTheme: const IconThemeData(color: Colors.white),
              actions: const [
                Text(
                  'My Report',
                  style: TextStyle(
                      fontFamily: FontHelper.montserratMedium,
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 10)
              ],
            )
          : null,
      body: Container(
        width: Get.width,
        height: Get.height,
        padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
        color: Colors.white,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(height: 20, width: 2, color: ColorHelper.hsPrime),
                    const SizedBox(
                      width: 5,
                    ),
                    Text("Daily Report",
                        style: TextStyle(
                            fontFamily: FontHelper.montserratMedium,
                            color: ColorHelper.hsPrime,
                            letterSpacing: 1,
                            fontSize: 18)),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return StatefulBuilder(
                                builder: (context, setState) {
                                  return BackdropFilter(
                                    filter:
                                        ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                                    child: AlertDialog(
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(32.0))),
                                      contentPadding:
                                          const EdgeInsets.only(top: 10.0),
                                      content: Container(
                                        decoration: BoxDecoration(
                                          //color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        height: Get.height / 4.9,
                                        child: Column(
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      30, 5, 30, 5),
                                              child: TextField(
                                                controller: monthYear,
                                                readOnly: true,
                                                style: const TextStyle(
                                                    color: Colors.black),
                                                decoration: InputDecoration(
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: ColorHelper
                                                                  .hsPrimeOne
                                                                  .withOpacity(
                                                                      0.5))),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: ColorHelper
                                                                  .hsPrimeOne)),
                                                  fillColor:
                                                      Colors.lightBlueAccent,
                                                  labelText:
                                                      'Select Month Year',
                                                  labelStyle: TextStyle(
                                                    color: ColorHelper
                                                        .hsPrimeOne
                                                        .withOpacity(0.5),
                                                  ),
                                                ),
                                                onTap: () async {
                                                  DateTime? pickedDate =
                                                      await showDatePicker(
                                                          context: context,
                                                          initialDate:
                                                              DateTime.now(),
                                                          firstDate:
                                                              DateTime(1999),
                                                          lastDate:
                                                              DateTime.now());
                                                  if (pickedDate != null) {
                                                    String formattedDate =
                                                        DateFormat('yyyy-MM')
                                                            .format(pickedDate);
                                                    setState(() {
                                                      monthYear.text =
                                                          formattedDate;
                                                    });
                                                  } else {}
                                                },
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[
                                                Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color:
                                                          ColorHelper.hsPrime),
                                                  child: TextButton(
                                                    child: const Text(
                                                      "Cancel",
                                                      style: TextStyle(
                                                          fontFamily: FontHelper
                                                              .montserratMedium,
                                                          letterSpacing: 0.5,
                                                          color: Colors.white),
                                                    ),
                                                    onPressed: () {
                                                      monthYear.clear();
                                                      Navigator.pop(context);
                                                    },
                                                  ),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color:
                                                          ColorHelper.hsPrime),
                                                  child: TextButton(
                                                    child: const Text(
                                                      "Submit",
                                                      style: TextStyle(
                                                          fontFamily: FontHelper
                                                              .montserratMedium,
                                                          letterSpacing: 0.5,
                                                          color: Colors.white),
                                                    ),
                                                    onPressed: () {
                                                      if (monthYear
                                                          .text.isEmpty) {
                                                        SnackBarHelper
                                                            .getWarningMsg(
                                                                '${AppTextHelper.selectDay}');
                                                      } else {
                                                        fetchDay(
                                                            monthYear.text);
                                                        monthYear.clear();
                                                        Navigator.pop(context);
                                                      }
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 5),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            });
                      },
                      child: const Card(
                        elevation: 5,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          child: Row(
                            children: [
                              Text(
                                "Filter",
                                style: TextStyle(
                                    fontFamily: FontHelper.montserratMedium,
                                    letterSpacing: 0.5),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(Icons.filter_alt_rounded)
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                child: SizedBox(
                  width: Get.width,
                  height: Get.height / 4.07,
                  child: SfCartesianChart(
                    plotAreaBorderWidth: 0,
                    primaryXAxis: const CategoryAxis(
                      labelStyle: TextStyle(fontSize: 12),
                      maximumLabels: 100,
                      autoScrollingDelta: 4,
                      majorGridLines: MajorGridLines(width: 0),
                      majorTickLines: MajorTickLines(width: 0),
                    ),
                    primaryYAxis: const NumericAxis(
                      axisLine: AxisLine(width: 0),
                      labelFormat: '{value}',
                      majorTickLines: MajorTickLines(size: 0),
                    ),
                    zoomPanBehavior: ZoomPanBehavior(
                      enablePanning: true,
                    ),
                    series: <ColumnSeries<DayDataEntry, String>>[
                      ColumnSeries<DayDataEntry, String>(
                        dataSource: dayChartData,
                        xValueMapper: (DayDataEntry entry, _) => entry.date,
                        yValueMapper: (DayDataEntry entry, _) =>
                            double.parse(entry.amount),
                        dataLabelSettings: const DataLabelSettings(
                            isVisible: true, textStyle: TextStyle(fontSize: 8)),
                      ),
                    ],
                    tooltipBehavior: _tooltipBehavior,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(height: 20, width: 2, color: ColorHelper.hsPrime),
                    const SizedBox(
                      width: 5,
                    ),
                    Text("Monthly Report",
                        style: TextStyle(
                            fontFamily: FontHelper.montserratMedium,
                            color: ColorHelper.hsPrime,
                            letterSpacing: 1,
                            fontSize: 18)),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return StatefulBuilder(
                                builder: (context, setState) {
                                  return BackdropFilter(
                                    filter:
                                        ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                                    child: AlertDialog(
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(32.0))),
                                      contentPadding:
                                          const EdgeInsets.only(top: 10.0),
                                      content: Container(
                                        decoration: BoxDecoration(
                                          //color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        height: Get.height / 4.9,
                                        child: Column(
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      30, 5, 30, 5),
                                              child: TextField(
                                                controller: year,
                                                readOnly: true,
                                                style: const TextStyle(
                                                    color: Colors.black),
                                                decoration: InputDecoration(
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: ColorHelper
                                                                  .hsPrimeOne
                                                                  .withOpacity(
                                                                      0.5))),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: ColorHelper
                                                                  .hsPrimeOne)),
                                                  fillColor:
                                                      Colors.lightBlueAccent,
                                                  labelText: 'Select Year',
                                                  labelStyle: TextStyle(
                                                    color: ColorHelper
                                                        .hsPrimeOne
                                                        .withOpacity(0.5),
                                                  ),
                                                ),
                                                onTap: () async {
                                                  DateTime? pickedDate =
                                                      await showDatePicker(
                                                          context: context,
                                                          initialDate:
                                                              DateTime.now(),
                                                          firstDate:
                                                              DateTime(2000),
                                                          lastDate:
                                                              DateTime(2101),
                                                          initialDatePickerMode:
                                                              DatePickerMode
                                                                  .year);
                                                  if (pickedDate != null) {
                                                    String formattedDate =
                                                        DateFormat('yyyy')
                                                            .format(pickedDate);
                                                    setState(() {
                                                      year.text = formattedDate;
                                                    });
                                                  } else {}
                                                },
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[
                                                Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color:
                                                          ColorHelper.hsPrime),
                                                  child: TextButton(
                                                    child: const Text(
                                                      "Cancel",
                                                      style: TextStyle(
                                                          fontFamily: FontHelper
                                                              .montserratMedium,
                                                          letterSpacing: 0.5,
                                                          color: Colors.white),
                                                    ),
                                                    onPressed: () {
                                                      year.clear();
                                                      Navigator.pop(context);
                                                    },
                                                  ),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color:
                                                          ColorHelper.hsPrime),
                                                  child: TextButton(
                                                    child: const Text(
                                                      "Submit",
                                                      style: TextStyle(
                                                          fontFamily: FontHelper
                                                              .montserratMedium,
                                                          letterSpacing: 0.5,
                                                          color: Colors.white),
                                                    ),
                                                    onPressed: () {
                                                      if (year.text.isEmpty) {
                                                        SnackBarHelper
                                                            .getWarningMsg(
                                                                '${AppTextHelper.selectYear}');
                                                      } else {
                                                        fetchMonth(year.text);
                                                        year.clear();
                                                        Navigator.pop(context);
                                                      }
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 5),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            });
                      },
                      child: const Card(
                        elevation: 5,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          child: Row(
                            children: [
                              Text(
                                "Filter",
                                style: TextStyle(
                                    fontFamily: FontHelper.montserratMedium,
                                    letterSpacing: 0.5),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(Icons.filter_alt_rounded)
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                child: SizedBox(
                  width: Get.width,
                  height: Get.height / 4.07,
                  child: SfCartesianChart(
                    plotAreaBorderWidth: 0,
                    primaryXAxis: const CategoryAxis(
                      labelStyle: TextStyle(fontSize: 12),
                      maximumLabels: 100,
                      autoScrollingDelta: 4,
                      majorGridLines: MajorGridLines(width: 0),
                      majorTickLines: MajorTickLines(width: 0),
                    ),
                    primaryYAxis: const NumericAxis(
                      axisLine: AxisLine(width: 0),
                      labelFormat: '{value}',
                      majorTickLines: MajorTickLines(size: 0),
                    ),
                    zoomPanBehavior: ZoomPanBehavior(
                      enablePanning: true,
                    ),
                    series: <ColumnSeries<MonthDataEntry, String>>[
                      ColumnSeries<MonthDataEntry, String>(
                        dataSource: monthChartData,
                        xValueMapper: (MonthDataEntry entry, _) => entry.month,
                        yValueMapper: (MonthDataEntry entry, _) =>
                            double.parse(entry.amount),
                        dataLabelSettings: const DataLabelSettings(
                            isVisible: true, textStyle: TextStyle(fontSize: 8)),
                      ),
                    ],
                    tooltipBehavior: _tooltipBehavior,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(height: 20, width: 2, color: ColorHelper.hsPrime),
                    const SizedBox(
                      width: 5,
                    ),
                    Text("Yearly Report",
                        style: TextStyle(
                            fontFamily: FontHelper.montserratMedium,
                            color: ColorHelper.hsPrime,
                            letterSpacing: 1,
                            fontSize: 18)),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return StatefulBuilder(
                                builder: (context, setState) {
                                  return BackdropFilter(
                                    filter:
                                        ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                                    child: AlertDialog(
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(32.0))),
                                      contentPadding:
                                          const EdgeInsets.only(top: 10.0),
                                      content: Container(
                                        decoration: BoxDecoration(
                                          //color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        height: Get.height / 3.9,
                                        child: Column(
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      30, 5, 30, 5),
                                              child: TextField(
                                                controller: fromYear,
                                                readOnly: true,
                                                style: const TextStyle(
                                                    color: Colors.black),
                                                decoration: InputDecoration(
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: ColorHelper
                                                                  .hsPrimeOne
                                                                  .withOpacity(
                                                                      0.5))),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: ColorHelper
                                                                  .hsPrimeOne)),
                                                  fillColor:
                                                      Colors.lightBlueAccent,
                                                  labelText: 'Select From Year',
                                                  labelStyle: TextStyle(
                                                    color: ColorHelper
                                                        .hsPrimeOne
                                                        .withOpacity(0.5),
                                                  ),
                                                ),
                                                onTap: () async {
                                                  DateTime? pickedDate =
                                                      await showDatePicker(
                                                          context: context,
                                                          initialDate:
                                                              DateTime.now(),
                                                          firstDate:
                                                              DateTime(2000),
                                                          lastDate:
                                                              DateTime(2101),
                                                          initialDatePickerMode:
                                                              DatePickerMode
                                                                  .year);
                                                  if (pickedDate != null) {
                                                    String formattedDate =
                                                        DateFormat('yyyy')
                                                            .format(pickedDate);
                                                    setState(() {
                                                      fromYear.text =
                                                          formattedDate;
                                                    });
                                                  } else {}
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      30, 5, 30, 5),
                                              child: TextField(
                                                controller: toYear,
                                                readOnly: true,
                                                style: const TextStyle(
                                                    color: Colors.black),
                                                decoration: InputDecoration(
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: ColorHelper
                                                                  .hsPrimeOne
                                                                  .withOpacity(
                                                                      0.5))),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: ColorHelper
                                                                  .hsPrimeOne)),
                                                  fillColor:
                                                      Colors.lightBlueAccent,
                                                  labelText: 'Select To Year',
                                                  labelStyle: TextStyle(
                                                    color: ColorHelper
                                                        .hsPrimeOne
                                                        .withOpacity(0.5),
                                                  ),
                                                ),
                                                onTap: () async {
                                                  DateTime? pickedDate =
                                                      await showDatePicker(
                                                          context: context,
                                                          initialDate:
                                                              DateTime.now(),
                                                          firstDate:
                                                              DateTime(2000),
                                                          lastDate:
                                                              DateTime(2101),
                                                          initialDatePickerMode:
                                                              DatePickerMode
                                                                  .year);
                                                  if (pickedDate != null) {
                                                    String formattedDate =
                                                        DateFormat('yyyy')
                                                            .format(pickedDate);
                                                    setState(() {
                                                      toYear.text =
                                                          formattedDate;
                                                    });
                                                  } else {}
                                                },
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[
                                                Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color:
                                                          ColorHelper.hsPrime),
                                                  child: TextButton(
                                                    child: const Text(
                                                      "Cancel",
                                                      style: TextStyle(
                                                          fontFamily: FontHelper
                                                              .montserratMedium,
                                                          letterSpacing: 0.5,
                                                          color: Colors.white),
                                                    ),
                                                    onPressed: () {
                                                      fromYear.clear();
                                                      toYear.clear();
                                                      Navigator.pop(context);
                                                    },
                                                  ),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color:
                                                          ColorHelper.hsPrime),
                                                  child: TextButton(
                                                    child: const Text(
                                                      "Submit",
                                                      style: TextStyle(
                                                          fontFamily: FontHelper
                                                              .montserratMedium,
                                                          letterSpacing: 0.5,
                                                          color: Colors.white),
                                                    ),
                                                    onPressed: () {
                                                      if (fromYear
                                                              .text.isEmpty ||
                                                          toYear.text.isEmpty) {
                                                        SnackBarHelper
                                                            .getWarningMsg(
                                                                '${AppTextHelper.selectYear}');
                                                      } else {
                                                        fetchYear(fromYear.text,
                                                            toYear.text);
                                                        fromYear.clear();
                                                        toYear.clear();
                                                        Navigator.pop(context);
                                                      }
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 5),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            });
                      },
                      child: const Card(
                        elevation: 5,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                          child: Row(
                            children: [
                              Text(
                                "Filter",
                                style: TextStyle(
                                    fontFamily: FontHelper.montserratMedium,
                                    letterSpacing: 0.5),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(Icons.filter_alt_rounded)
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                child: SizedBox(
                  width: Get.width,
                  height: Get.height / 4.07,
                  child: SfCartesianChart(
                    plotAreaBorderWidth: 0,
                    primaryXAxis: const CategoryAxis(
                      labelStyle: TextStyle(fontSize: 12),
                      maximumLabels: 100,
                      autoScrollingDelta: 4,
                      majorGridLines: MajorGridLines(width: 0),
                      majorTickLines: MajorTickLines(width: 0),
                    ),
                    primaryYAxis: const NumericAxis(
                      axisLine: AxisLine(width: 0),
                      labelFormat: '{value}',
                      majorTickLines: MajorTickLines(size: 0),
                    ),
                    zoomPanBehavior: ZoomPanBehavior(
                      enablePanning: true,
                    ),
                    series: <ColumnSeries<YearDataEntry, String>>[
                      ColumnSeries<YearDataEntry, String>(
                        dataSource: yearChartData,
                        xValueMapper: (YearDataEntry entry, _) => entry.month,
                        yValueMapper: (YearDataEntry entry, _) =>
                            double.parse(entry.amount),
                        dataLabelSettings: const DataLabelSettings(
                            isVisible: true, textStyle: TextStyle(fontSize: 8)),
                      ),
                    ],
                    tooltipBehavior: _tooltipBehavior,
                  ),
                ),
              ),
              // const SizedBox(height: 10),
              widget.isFromDrawer! ? Container() : const SizedBox(height: 70)
            ],
          ),
        ),
      ),
    );
  }

  Future<void> fetchDay(var monthYear) async {
    try {
      final value = await ChartApiCall.fetchDayData(monthYear ?? '');
      setState(() {
        dayData = value.dayData;
      });
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<void> fetchMonth(var yearDate) async {
    try {
      final value = await ChartApiCall.fetchMonthData(yearDate ?? '');
      setState(() {
        monthData = value.monthData;
      });
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<void> fetchYear(fromD, toD) async {
    try {
      final value = await ChartApiCall.fetchYearData(fromD ?? '', toD ?? '');
      setState(() {
        yearData = value.yearData;
      });
    } catch (error) {
      print('Error: $error');
    }
  }
}
