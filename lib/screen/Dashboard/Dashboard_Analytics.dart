// ignore_for_file: deprecated_member_use, unused_element, non_constant_identifier_names
// ignore_for_file: prefer_const_constructors, file_names, camel_case_types

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';

import 'package:evcp/confing/list.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

import '../../confing/notifier.dart';
import '../../controller/page_controller.dart';

class Analytics extends StatefulWidget {
  const Analytics({super.key});

  @override
  State<Analytics> createState() => _AnalyticsState();
}

class _AnalyticsState extends State<Analytics> {
  final List<ChartData> chartData = [
    ChartData(1, 620),
    ChartData(2, 420),
    ChartData(3, 870),
    ChartData(4, 630),
    ChartData(5, 800),
    ChartData(6, 460),
    ChartData(7, 280),
    ChartData(8, 380),
    ChartData(9, 580),
    ChartData(10, 280),
    ChartData(11, 880),
    ChartData(12, 450),
    ChartData(13, 860),
    ChartData(14, 340),
    ChartData(15, 670),
    ChartData(16, 240),
    ChartData(17, 420),
    ChartData(18, 390),
    ChartData(19, 340),
    ChartData(20, 250),
  ];
  final List<ChartData2> chartData1 = [
    ChartData2(1, 620),
    ChartData2(2, 420),
    ChartData2(3, 870),
    ChartData2(4, 630),
    ChartData2(5, 800),
    ChartData2(6, 460),
  ];
  late List<_ChartData> data;
  late List<ChartData1> data1;
  // late TooltipBehavior _tooltip;

  @override
  void initState() {
    data1 = [
      ChartData1('a', 10),
      ChartData1('b', 30),
      ChartData1('c', 40),
      ChartData1('d', 20),
      ChartData1('e', 50),
      ChartData1('f', 20),
      ChartData1('g', 50),
      ChartData1('h', 30),
      ChartData1('i', 20),
      ChartData1('j', 40),
    ];
    data1 = [
      ChartData1('a', 10),
      ChartData1('b', 30),
      ChartData1('c', 40),
      ChartData1('d', 20),
      ChartData1('e', 50),
      ChartData1('f', 20),
      ChartData1('g', 50),
      ChartData1('h', 30),
      ChartData1('i', 20),
      ChartData1('j', 40),
    ];
    data = [
      _ChartData('CHN', 20, 20, 35, 29),
      _ChartData('GER', 30, 12, 35, 40),
      _ChartData('RUS', 37, 7, 17, 24),
      _ChartData('BRZ', 34, 9, 16, 27),
      _ChartData('IND', 40, 20, 25, 31)
    ];
    // _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  Map<String, double> dataMap = {
    "Google.com": 5,
    "Youtube.com": 7,
    "Medium.com": 4,
    "WhatsApp.com": 3,
    "Others": 2,
  };
  final legendLabels = <String, String>{
    "Google.com": "Google.com",
    "Youtube.com": "Youtube.com",
    "Medium.com": "Medium.com",
    "WhatsApp.com": "WhatsApp.com",
    "Others": "Others",
  };
  final colorList = <Color>[
    const Color(0xff595FE5),
    const Color(0xff7DC066),
    const Color(0xff59B4D1),
    const Color(0xffE5646C),
    const Color(0xff9E57E5),
  ];

  Map<String, double> dataMap1 = {
    "IOS Mobile": 8,
    "Android Mobile": 6,
    "Desktop": 2,
    "Others": 7,
  };
  final legendLabels1 = <String, String>{
    "IOS Mobile": "IOS Mobile",
    "Android Mobile": "Android Mobile",
    "Desktop": "Desktop",
    "Others": "Others",
  };

  final colorList1 = <Color>[
    const Color(0xffADB0ED),
    const Color(0xffB0E4C8),
    const Color(0xff59B4D1),
    const Color(0xffE5646C),
    const Color(0xff9E57E5),
    const Color(0xffFFC9AC),
  ];

  late ColorNotifier notifire;

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifier>(context, listen: true);
    return GetBuilder<InboxController>(builder: (inboxController) {
      return LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return Container(
              color: notifire.getbgcolor10,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Analytics(context, constraints.maxWidth),
                          const SizedBox(
                            height: 10,
                          ),
                          chart(context, constraints.maxWidth),
                          const SizedBox(
                            height: 10,
                          ),
                          chart1(context, constraints.maxWidth),
                          const SizedBox(
                            height: 10,
                          ),
                          chart2(context, constraints.maxWidth),
                          const SizedBox(
                            height: 10,
                          ),
                          chart3(context, constraints.maxWidth),
                          const SizedBox(
                            height: 10,
                          ),
                          TopPages(context, constraints.maxWidth),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (constraints.maxWidth < 1000) {
            return Container(
              decoration: BoxDecoration(color: notifire.getbgcolor10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 20, right: 20, left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Analytics(context, constraints.maxWidth),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    chart(context, constraints.maxWidth),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    chart2(context, constraints.maxWidth),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    chart1(context, constraints.maxWidth),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    chart3(context, constraints.maxWidth),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TopPages(context, constraints.maxWidth),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Container(
              decoration: BoxDecoration(
                color: notifire.getbgcolor10,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: 1,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              right: 20, left: 20, bottom: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Analytics(context, constraints.maxWidth),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child:
                                          chart(context, constraints.maxWidth)),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                      child: chart1(
                                          context, constraints.maxWidth)),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: chart2(
                                          context, constraints.maxWidth)),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                      child: chart3(
                                          context, constraints.maxWidth)),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                      child: TopPages(
                                          context, constraints.maxWidth)),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            );
          }
        },
      );
    });
  }

  bool light = true;
  bool isdark = false;

  Widget Analytics(BuildContext context, size) =>
      GetBuilder<InboxController>(builder: (controller) {
        return size < 600
            ? Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                        image: AssetImage('assets/Supehub_banner 1.png'),
                        fit: BoxFit.cover)),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Analytics with AI & Big Data',
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontFamily: 'InterMedium',
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        children: [
                          Expanded(
                            child: Text(
                              'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'InterMedium'),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 35,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                  child: Text(
                                '   Register   ',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15),
                              )),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 35,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                  child: Text(
                                '   Demo Data   ',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              )),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            : Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                        image: AssetImage('assets/Supehub_banner 1.png'),
                        fit: BoxFit.cover)),
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Text(
                            'Analytics with AI & Big Data',
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontFamily: 'InterMedium',
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        children: [
                          Text(
                            'It has survived not only five centuries, but\nalso the leap into electronic typesetting,\nremaining essentially unchanged',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'InterMedium'),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 35,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                  child: Text(
                                '   Register   ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'InterRegular'),
                              )),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 35,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                  child: Text(
                                '   Demo Data   ',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              )),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
      });

  Widget chart(BuildContext context, size) {
    return GetBuilder<InboxController>(
      builder: (controller) {
        return size < 600
            ? Container(
                decoration: BoxDecoration(
                    color: notifire.getbgcolor11,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Text(
                            'Visitors',
                            style: TextStyle(
                                fontSize: 16,
                                color: notifire.getblackcolor,
                                fontFamily: 'InterMedium',
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                    // SfCartesianChart(
                    //     primaryXAxis:  CategoryAxis(),
                    //     primaryYAxis:  NumericAxis(
                    //         minimum: 0, maximum: 60, interval: 20),
                    //     tooltipBehavior: _tooltip,
                    //     series: <CartesianSeries<ChartData1, String>>[
                    //       BubbleSeries<ChartData1, String>(
                    //           dataSource: data1,
                    //           xValueMapper: (ChartData1 data, _) => data.x,
                    //           yValueMapper: (ChartData1 data, _) => data.y,
                    //           name: 'Visitors',
                    //           minimumRadius: 18,
                    //           color: const Color.fromRGBO(8, 142, 255, 1))
                    //     ])
                  ],
                ),
              )
            : Container(
                // width: Get.width * 0.395,
                decoration: BoxDecoration(
                    color: notifire.getbgcolor11,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Text(
                            'Visitors',
                            style: TextStyle(
                                fontSize: 16,
                                color: notifire.getblackcolor,
                                fontFamily: 'InterMedium',
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                    // SfCartesianChart(
                    //     primaryXAxis:  CategoryAxis(),
                    //     primaryYAxis:  NumericAxis(
                    //         minimum: 0, maximum: 60, interval: 20),
                    //     tooltipBehavior: _tooltip,
                    //     series: <CartesianSeries<ChartData1, String>>[
                    //       BubbleSeries<ChartData1, String>(
                    //           dataSource: data1,
                    //           xValueMapper: (ChartData1 data, _) => data.x,
                    //           yValueMapper: (ChartData1 data, _) => data.y,
                    //           name: 'Visitors'
                    //               '',
                    //           minimumRadius: 18,
                    //           color: const Color.fromRGBO(8, 142, 255, 1))
                    //     ])
                  ],
                ),
              );
      },
    );
  }

  Widget chart1(BuildContext context, size) {
    return GetBuilder<InboxController>(
      builder: (controller) {
        return size < 600
            ? Container(
                height: Get.height * 0.5,
                decoration: BoxDecoration(
                    color: notifire.getbgcolor11,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Text(
                            'Audiences ',
                            style: TextStyle(
                                fontSize: 16,
                                color: notifire.getblackcolor,
                                fontFamily: 'InterMedium',
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                    // Center(
                    //   child: SizedBox(
                    //     height: Get.height * 0.4,
                    //     child: SfCartesianChart(
                    //       primaryXAxis: NumericAxis(
                    //         majorTickLines: MajorTickLines(
                    //             width: 0, color: Colors.transparent),
                    //         axisBorderType: AxisBorderType.withoutTopAndBottom,
                    //         axisLine:
                    //             AxisLine(color: Colors.transparent, width: 0),
                    //         borderColor: Colors.transparent,
                    //         borderWidth: 0,
                    //         minorGridLines: MinorGridLines(
                    //             color: Colors.transparent, width: 0),
                    //         majorGridLines: MajorGridLines(
                    //           width: 0,
                    //           color: Colors.transparent,
                    //         ),
                    //       ),
                    //       primaryYAxis: NumericAxis(
                    //         majorTickLines: MajorTickLines(
                    //             width: 0, color: Colors.transparent),
                    //         axisLine:
                    //             AxisLine(color: Colors.transparent, width: 0),
                    //         axisBorderType: AxisBorderType.withoutTopAndBottom,
                    //         isVisible: false,
                    //         borderColor: Colors.transparent,
                    //         borderWidth: 0,
                    //       ),
                    //       series: [
                    //         // Renders column chart
                    //         ColumnSeries<ChartData2, double>(
                    //           color: const Color(0xff595FE5),
                    //           borderRadius:
                    //               const BorderRadius.all(Radius.circular(10)),
                    //           dataSource: chartData1,
                    //           xValueMapper: (ChartData2 data, _) => data.x,
                    //           yValueMapper: (ChartData2 datum, int index) {
                    //             return null;
                    //           },
                    //           // yValueMapper: (ChartData data, _) => data.y
                    //         ),
                    //         ColumnSeries<ChartData2, double>(
                    //             dataSource: chartData1,
                    //             borderRadius:
                    //                 const BorderRadius.all(Radius.circular(10)),
                    //             color: const Color(0xff595FE5),
                    //             xValueMapper: (ChartData2 data, _) => data.x,
                    //             yValueMapper: (ChartData2 data, _) => data.y1),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              )
            : Container(
                decoration: BoxDecoration(
                    color: notifire.getbgcolor11,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Text(
                            'Audiences ',
                            style: TextStyle(
                                fontSize: 16,
                                color: notifire.getblackcolor,
                                fontFamily: 'InterMedium',
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                    // SfCartesianChart(
                    //   primaryXAxis: NumericAxis(
                    //     majorTickLines:
                    //         MajorTickLines(width: 0, color: Colors.transparent),
                    //     axisBorderType: AxisBorderType.rectangle,
                    //     axisLine: AxisLine(color: Colors.transparent, width: 0),
                    //     borderColor: Colors.transparent,
                    //     borderWidth: 0,
                    //     minorGridLines:
                    //         MinorGridLines(color: Colors.transparent, width: 0),
                    //     majorGridLines: MajorGridLines(
                    //       width: 0,
                    //       color: Colors.transparent,
                    //     ),
                    //   ),
                    //   primaryYAxis: NumericAxis(
                    //     majorTickLines:
                    //         MajorTickLines(width: 0, color: Colors.transparent),
                    //     axisLine: AxisLine(color: Colors.transparent, width: 0),
                    //     axisBorderType: AxisBorderType.withoutTopAndBottom,
                    //     borderColor: Colors.transparent,
                    //     borderWidth: 0,
                    //   ),
                    //   series: [
                    //     // Renders column chart
                    //     ColumnSeries<ChartData, double>(
                    //       color: const Color(0xff595FE5),
                    //       borderRadius:
                    //           const BorderRadius.all(Radius.circular(10)),
                    //       dataSource: chartData,
                    //       xValueMapper: (ChartData data, _) => data.x,
                    //       yValueMapper: (ChartData datum, int index) {
                    //         return null;
                    //       },
                    //       // yValueMapper: (ChartData data, _) => data.y
                    //     ),
                    //     ColumnSeries<ChartData, double>(
                    //         dataSource: chartData,
                    //         borderRadius:
                    //             const BorderRadius.all(Radius.circular(10)),
                    //         color: const Color(0xff595FE5),
                    //         xValueMapper: (ChartData data, _) => data.x,
                    //         yValueMapper: (ChartData data, _) => data.y1),
                    //   ],
                    // ),
                  ],
                ),
              );
      },
    );
  }

  Widget chart2(BuildContext context, size) {
    return GetBuilder<InboxController>(
      builder: (controller) {
        return size < 600
            ? Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: notifire.getbgcolor11,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Referrals Links',
                          style: TextStyle(
                              fontSize: 16,
                              color: notifire.getblackcolor,
                              fontFamily: 'InterMedium',
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    PieChart(
                      dataMap: dataMap,
                      baseChartColor: notifire.getblackcolor,
                      animationDuration: const Duration(milliseconds: 800),
                      chartLegendSpacing: 32,
                      chartRadius: MediaQuery.of(context).size.width / 3.2,
                      colorList: colorList,
                      initialAngleInDegree: 0,
                      chartType: ChartType.ring,
                      ringStrokeWidth: 20,
                      centerText: "Links",
                      legendOptions: LegendOptions(
                        showLegendsInRow: false,

                        // legendPosition: LegendPosition.right,
                        showLegends: true,
                        legendShape: BoxShape.circle,
                        legendTextStyle: TextStyle(
                          color: notifire.getblackcolor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      chartValuesOptions: const ChartValuesOptions(
                        showChartValueBackground: true,
                        showChartValues: true,
                        showChartValuesInPercentage: false,
                        showChartValuesOutside: false,
                        decimalPlaces: 1,
                      ),
                    )
                  ],
                ),
              )
            : Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: notifire.getbgcolor11,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Text(
                            'Referrals Links',
                            style: TextStyle(
                                fontSize: 16,
                                color: notifire.getblackcolor,
                                fontFamily: 'InterMedium',
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Transform.translate(
                      offset: const Offset(0, -5),
                      child: SizedBox(
                        height: Get.height * 0.26,
                        child: PieChart(
                          dataMap: dataMap,
                          animationDuration: const Duration(milliseconds: 800),
                          chartLegendSpacing: 30,
                          colorList: colorList,
                          initialAngleInDegree: 0,
                          chartType: ChartType.ring,
                          ringStrokeWidth: 20,
                          centerText: "Links",
                          legendOptions: LegendOptions(
                            showLegendsInRow: false,
                            // legendPosition: LegendPosition.right,
                            showLegends: true,
                            legendShape: BoxShape.circle,
                            legendTextStyle: TextStyle(
                              color: notifire.getblackcolor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          chartValuesOptions: const ChartValuesOptions(
                            showChartValueBackground: true,
                            showChartValues: true,
                            showChartValuesInPercentage: false,
                            showChartValuesOutside: false,
                            decimalPlaces: 1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }

  Widget chart3(BuildContext context, size) {
    return GetBuilder<InboxController>(
      builder: (controller) {
        return size < 600
            ? Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: notifire.getbgcolor11,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Devices',
                          style: TextStyle(
                              fontSize: 16,
                              color: notifire.getblackcolor,
                              fontFamily: 'InterMedium',
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    PieChart(
                      dataMap: dataMap1,
                      chartRadius: MediaQuery.of(context).size.width / 3.2,
                      animationDuration: const Duration(milliseconds: 1000),
                      chartLegendSpacing: 32,
                      colorList: colorList1,
                      initialAngleInDegree: 0,
                      chartType: ChartType.disc,
                      ringStrokeWidth: 20,
                      legendOptions: LegendOptions(
                        showLegendsInRow: false,
                        // legendPosition: LegendPosition.right,
                        showLegends: true,
                        legendShape: BoxShape.circle,
                        legendTextStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: notifire.getblackcolor,
                        ),
                      ),
                      chartValuesOptions: const ChartValuesOptions(
                        showChartValueBackground: true,
                        showChartValues: true,
                        showChartValuesInPercentage: false,
                        showChartValuesOutside: false,
                        decimalPlaces: 1,
                      ),
                    )
                  ],
                ),
              )
            : Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: notifire.getbgcolor11,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Text(
                            'Devices',
                            style: TextStyle(
                                fontSize: 16,
                                color: notifire.getblackcolor,
                                fontFamily: 'InterMedium',
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: SizedBox(
                        height: Get.height * 0.26,
                        child: PieChart(
                          dataMap: dataMap1,
                          animationDuration: const Duration(milliseconds: 800),
                          chartLegendSpacing: 32,
                          colorList: colorList1,
                          initialAngleInDegree: 0,
                          chartType: ChartType.disc,
                          ringStrokeWidth: 20,
                          legendOptions: LegendOptions(
                            showLegendsInRow: false,
                            // legendPosition: LegendPosition.right,
                            showLegends: true,
                            legendShape: BoxShape.circle,
                            legendTextStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: notifire.getblackcolor,
                            ),
                          ),
                          chartValuesOptions: const ChartValuesOptions(
                            showChartValueBackground: true,
                            showChartValues: true,
                            showChartValuesInPercentage: false,
                            showChartValuesOutside: false,
                            decimalPlaces: 1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }

  Widget TopPages(BuildContext context, size) => GetBuilder<InboxController>(
        builder: (controller) {
          return size < 600
              ? Container(
                  height: Get.height * 0.4,
                  decoration: BoxDecoration(
                      color: notifire.getbgcolor11,
                      borderRadius: BorderRadius.circular(10)),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Text('Top Pages',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: notifire.getblackcolor,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'InterBold')),
                          ],
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: model().Analytics.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Text(model().Analytics[index],
                                    style: const TextStyle(
                                        color: Color(0xff727880),
                                        fontFamily: 'InterRegular',
                                        fontSize: 14)),
                                const Spacer(),
                                Text(
                                  model().Analytics1[index],
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'InterRegular',
                                      color: notifire.getblackcolor,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ]),
                  ),
                )
              : Container(
                  height: size < 1500
                      ? Get.height * 0.335
                      : size > 1500
                          ? Get.height * 0.325
                          : null,
                  decoration: BoxDecoration(
                      color: notifire.getbgcolor11,
                      borderRadius: BorderRadius.circular(10)),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Text('Top Pages',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: notifire.getblackcolor,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'InterBold')),
                          ],
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: model().Analytics.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Text(model().Analytics[index],
                                    style: const TextStyle(
                                        color: Color(0xff727880),
                                        fontFamily: 'InterRegular',
                                        fontSize: 14)),
                                const Spacer(),
                                Text(
                                  model().Analytics1[index],
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'InterRegular',
                                      color: notifire.getblackcolor,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ]),
                  ),
                );
        },
      );
}

class _ChartData {
  _ChartData(this.x, this.high, this.low, this.open, this.close);

  final String x;
  final double high;
  final double low;
  final double open;
  final double close;
}

class ChartData {
  ChartData(
    this.x,
    this.y1,
  );

  final double x;

  // final double y;
  final double y1;
}

class ChartData1 {
  ChartData1(this.x, this.y);

  final String x;
  final double y;
}

class _ChartData2 {
  _ChartData2(this.x, this.high, this.low, this.open, this.close);

  final String x;
  final double high;
  final double low;
  final double open;
  final double close;
}

class ChartData2 {
  ChartData2(
    this.x,
    this.y1,
  );

  final double x;

  // final double y;
  final double y1;
}
