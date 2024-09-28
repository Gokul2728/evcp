// ignore_for_file: file_names, non_constant_identifier_names, deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:evcp/confing/list.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../confing/image.dart';
import '../../confing/notifier.dart';
import '../../controller/page_controller.dart';

class ProjectManager extends StatefulWidget {
  const ProjectManager({super.key});

  @override
  State<ProjectManager> createState() => _ProjectManagerState();
}

class _ProjectManagerState extends State<ProjectManager> {
  final List<ChartData> chartData = [
    ChartData('12.Sep', 30, 20, 24, 30),
    ChartData('13.Sep', 40, 15, 18, 23),
    ChartData('14.Sep', 16, 40, 15, 20),
    ChartData('15.Sep', 18, 23, 18, 30),
    ChartData('16.Sep', 18, 26, 18, 22),
    ChartData('17.Sep', 18, 36, 18, 32),
    ChartData('18.Sep', 18, 56, 18, 45),
    ChartData('19.Sep', 18, 35, 18, 20),
    ChartData('20.Sep', 18, 45, 18, 45),
    ChartData('21.Sep', 18, 43, 18, 35),
    ChartData('22.Sep', 18, 26, 18, 44),
    ChartData('23.Sep', 18, 50, 18, 35),
    ChartData('24.Sep', 18, 34, 18, 57),
    ChartData('25.Sep', 18, 30, 18, 48),
  ];
  final List<ChartData1> chartData1 = [
    ChartData1('12.Sep', 30, 20, 24, 30),
    ChartData1('13.Sep', 40, 15, 18, 23),
    ChartData1('14.Sep', 16, 40, 15, 20),
    ChartData1('15.Sep', 18, 23, 18, 30),
    ChartData1('16.Sep', 18, 26, 18, 22),
    ChartData1('17.Sep', 18, 36, 18, 32),
  ];

  late ColorNotifier notifire;

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifier>(context, listen: true);
    return GetBuilder<InboxController>(builder: (inboxController) {
      return LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 700) {
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
                          Overview(context, constraints.maxWidth),
                          const SizedBox(
                            height: 10,
                          ),
                          Performance(context, constraints.maxWidth),
                          const SizedBox(
                            height: 10,
                          ),
                          Grid(context, constraints.maxWidth),
                          const SizedBox(
                            height: 10,
                          ),
                          Status(context, constraints.maxWidth, constraints),
                          const SizedBox(
                            height: 10,
                          ),
                          timeline(context, constraints.maxWidth),
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
                          Overview(context, constraints.maxWidth),
                          const SizedBox(
                            height: 10,
                          ),
                          Performance(context, constraints.maxWidth),
                          const SizedBox(
                            height: 10,
                          ),
                          Grid(context, constraints.maxWidth),
                          const SizedBox(
                            height: 10,
                          ),
                          Status(context, constraints.maxWidth, constraints),
                          const SizedBox(
                            height: 10,
                          ),
                          timeline(context, constraints.maxWidth),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(color: notifire.getbgcolor10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 20, left: 20, bottom: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Column(
                              children: [
                                Overview(context, constraints.maxWidth),
                                const SizedBox(height: 10),
                                Column(
                                  children: [
                                    Grid(context, constraints.maxWidth),
                                    const SizedBox(height: 10),
                                    Status(context, constraints.maxWidth,
                                        constraints)
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Performance(context, constraints.maxWidth),
                                const SizedBox(height: 10),
                                timeline(context, constraints.maxWidth),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      );
    });
  }

  Widget Overview(BuildContext context, size) {
    return GetBuilder<InboxController>(
      builder: (controller) {
        return size < 600
            ? Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: notifire.getbgcolor11,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Tasks Overview',
                            style: TextStyle(
                                color: notifire.getblackcolor,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'InterRegular',
                                fontSize: 16)),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadiusDirectional.circular(15),
                                  border: Border.all(
                                    color: notifire.getgrey1,
                                  )),
                              child: TextButton(
                                style: const ButtonStyle(
                                  padding:
                                      MaterialStatePropertyAll(EdgeInsets.zero),
                                  shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        topLeft: Radius.circular(15),
                                      ),
                                    ),
                                  ),
                                ),
                                child: Text(
                                  'Today',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: notifire.getblackcolor,
                                  ),
                                ),
                                onPressed: () {},
                              ),
                            ),
                            const SizedBox(width: 10),
                            IconButton(
                              icon: Icon(Icons.calendar_today,
                                  color: notifire.getblackcolor),
                              onPressed: () async {
                                DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2101),
                                );
                                if (pickedDate != null) {
                                  // Handle the picked date here
                                  print('Picked Date: $pickedDate');
                                }
                              },
                            ),
                            const SizedBox(width: 10),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: notifire.getgrey1),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: 'Phase Voltage',
                                  icon: Icon(Icons.arrow_drop_down,
                                      color: notifire.getblackcolor),
                                  items: ['Phase Voltage', 'Phase Current']
                                      .map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: notifire.getblackcolor,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    // Handle dropdown change
                                    print('Selected: $newValue');
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // SfCartesianChart(
                    //   primaryXAxis: const CategoryAxis(
                    //     isVisible: false,
                    //   ),
                    //   series: <CartesianSeries>[
                    //     LineSeries<ChartData1, String>(
                    //       color: const Color(0xff7DC066),
                    //       dataSource: chartData1,
                    //       xValueMapper: (ChartData1 data, _) => data.x,
                    //       yValueMapper: (ChartData1 data, _) => data.y1,
                    //     ),
                    //     LineSeries<ChartData1, String>(
                    //       color: const Color(0xffF3935D),
                    //       dataSource: chartData1,
                    //       xValueMapper: (ChartData1 data, _) => data.x,
                    //       yValueMapper: (ChartData1 data, _) => data.y2,
                    //     ),
                    //     LineSeries<ChartData1, String>(
                    //       color: const Color(0xff595FE5),
                    //       dataSource: chartData1,
                    //       xValueMapper: (ChartData1 data, _) => data.x,
                    //       yValueMapper: (ChartData1 data, _) => data.y3,
                    //     ),
                    //     LineSeries<ChartData1, String>(
                    //       color: const Color(0xffEEEEEE),
                    //       dataSource: chartData1,
                    //       xValueMapper: (ChartData1 data, _) => data.x,
                    //       yValueMapper: (ChartData1 data, _) => data.y4,
                    //     ),
                    //   ],
                    // ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                              color: const Color(0xff7DC066),
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          'Completed',
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'InterRegular',
                              color: Color(0xff727880)),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                              color: const Color(0xff595FE5),
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          'Working',
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'InterRegular',
                              color: Color(0xff727880)),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                              color: const Color(0xffF3935D),
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          'Pending',
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'InterRegular',
                              color: Color(0xff727880)),
                        ),
                      ],
                    )
                  ],
                ),
              )
            : Container(
                decoration: BoxDecoration(
                    color: notifire.getbgcolor11,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text('Tasks Overview',
                              style: TextStyle(
                                  color: notifire.getblackcolor,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'InterRegular',
                                  fontSize: 16)),
                          const Spacer(),
                          Container(
                            width: 75,
                            height: 32,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadiusDirectional.circular(15),
                                border: Border.all(
                                  color: notifire.getgrey1,
                                )),
                            child: TextButton(
                              style: const ButtonStyle(
                                padding:
                                    MaterialStatePropertyAll(EdgeInsets.zero),
                                shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        topLeft: Radius.circular(15)),
                                  ),
                                ),
                              ),
                              child: Text(
                                'Today',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: notifire.getblackcolor,
                                ),
                              ),
                              onPressed: () {},
                            ),
                          ),
                          const SizedBox(width: 10),
                          IconButton(
                            icon: Icon(Icons.calendar_today,
                                color: notifire.getblackcolor),
                            onPressed: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2101),
                              );
                              if (pickedDate != null) {
                                // Handle the picked date here
                                print('Picked Date: $pickedDate');
                              }
                            },
                          ),
                          const SizedBox(width: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: notifire.getgrey1),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: 'Phase Voltage',
                                icon: Icon(Icons.arrow_drop_down,
                                    color: notifire.getblackcolor),
                                items: ['Phase Voltage', 'Phase Current']
                                    .map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: notifire.getblackcolor,
                                      ),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                  // Handle dropdown change
                                  print('Selected: $newValue');
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // SfCartesianChart(
                      //   primaryXAxis: const CategoryAxis(
                      //     isVisible: false,
                      //   ),
                      //   series: <CartesianSeries>[
                      //     LineSeries<ChartData1, String>(
                      //       color: const Color(0xff7DC066),
                      //       dataSource: chartData1,
                      //       xValueMapper: (ChartData1 data, _) => data.x,
                      //       yValueMapper: (ChartData1 data, _) => data.y1,
                      //     ),
                      //     LineSeries<ChartData1, String>(
                      //       color: const Color(0xffF3935D),
                      //       dataSource: chartData1,
                      //       xValueMapper: (ChartData1 data, _) => data.x,
                      //       yValueMapper: (ChartData1 data, _) => data.y2,
                      //     ),
                      //     LineSeries<ChartData1, String>(
                      //       color: const Color(0xff595FE5),
                      //       dataSource: chartData1,
                      //       xValueMapper: (ChartData1 data, _) => data.x,
                      //       yValueMapper: (ChartData1 data, _) => data.y3,
                      //     ),
                      //     LineSeries<ChartData1, String>(
                      //       color: const Color(0xffEEEEEE),
                      //       dataSource: chartData1,
                      //       xValueMapper: (ChartData1 data, _) => data.x,
                      //       yValueMapper: (ChartData1 data, _) => data.y4,
                      //     ),
                      //   ],
                      // ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                                color: const Color(0xff7DC066),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            'Completed',
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'InterRegular',
                                color: Color(0xff727880)),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                                color: const Color(0xff595FE5),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            'Working',
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'InterRegular',
                                color: Color(0xff727880)),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                                color: const Color(0xffF3935D),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            'Pending',
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'InterRegular',
                                color: Color(0xff727880)),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
      },
    );
  }

  Widget Performance(BuildContext context, size) {
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
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Text(
                            'Performance this Week',
                            style: TextStyle(
                                fontSize: 16,
                                color: notifire.getblackcolor,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'InterRegular'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.28,
                      child: SfRadialGauge(axes: <RadialAxis>[
                        RadialAxis(
                            minimum: 0,
                            maximum: 150,
                            ranges: <GaugeRange>[
                              GaugeRange(
                                  startValue: 0,
                                  endValue: 50,
                                  color: Colors.green),
                              GaugeRange(
                                  startValue: 50,
                                  endValue: 100,
                                  color: Colors.orange),
                              GaugeRange(
                                  startValue: 100,
                                  endValue: 150,
                                  color: Colors.red)
                            ],
                            pointers: const <GaugePointer>[
                              NeedlePointer(value: 90)
                            ],
                            annotations: <GaugeAnnotation>[
                              GaugeAnnotation(
                                  widget: Text('90.0',
                                      style: TextStyle(
                                          color: notifire.getblackcolor,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold)),
                                  angle: 90,
                                  positionFactor: 0.5)
                            ])
                      ]),
                    )
                  ],
                ),
              )
            : Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: notifire.getbgcolor11,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Text(
                            'Performance this Week',
                            style: TextStyle(
                                fontSize: 16,
                                color: notifire.getblackcolor,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'InterRegular'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.28,
                      child: SfRadialGauge(axes: <RadialAxis>[
                        RadialAxis(
                            minimum: 0,
                            maximum: 150,
                            ranges: <GaugeRange>[
                              GaugeRange(
                                  startValue: 0,
                                  endValue: 50,
                                  color: Colors.green),
                              GaugeRange(
                                  startValue: 50,
                                  endValue: 100,
                                  color: Colors.orange),
                              GaugeRange(
                                  startValue: 100,
                                  endValue: 150,
                                  color: Colors.red)
                            ],
                            pointers: <GaugePointer>[
                              NeedlePointer(
                                value: 90,
                                needleColor: notifire.getblackcolor,
                              ),
                            ],
                            annotations: <GaugeAnnotation>[
                              GaugeAnnotation(
                                  widget: Text('90.0',
                                      style: TextStyle(
                                          color: notifire.getblackcolor,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold)),
                                  angle: 90,
                                  positionFactor: 0.5)
                            ])
                      ]),
                    )
                  ],
                ),
              );
      },
    );
  }

  Widget timeline(BuildContext context, size) {
    return size < 600
        ? Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: notifire.getbgcolor11,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Text(' Activities',
                          style: TextStyle(
                              color: notifire.getblackcolor,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'InterRegular')),
                    ],
                  ),
                ),
                Transform.translate(
                  offset: const Offset(10, -40),
                  child: TimelineTile(
                    isFirst: true,
                    hasIndicator: true,
                    endChild: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, top: 40),
                            child: Transform.translate(
                              offset: const Offset(0, 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Contrary to\npopular belief is\nnot simply",
                                        style: TextStyle(
                                          fontFamily: "InterRegular",
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: notifire.getblackcolor,
                                        ),
                                      ),
                                      const Spacer(),
                                      Transform.translate(
                                        offset: const Offset(-22, -15),
                                        child: Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color: const Color(0xffFAEBEC)),
                                          child: const Center(
                                              child: Text(
                                            'FR',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'InterRegular'),
                                          )),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Row(
                                    children: [
                                      Text('In',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xff727880),
                                              fontFamily: 'InterRegular')),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'IOS Mobile Ver 2.0',
                                        style: TextStyle(
                                            color: Color(0xff595FE5),
                                            fontSize: 14,
                                            fontFamily: 'InterRegular'),
                                      )
                                    ],
                                  ),
                                  const Text(
                                    "3 minutes ago",
                                    style: TextStyle(
                                        fontFamily: "InterRegular",
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff9DA2A7)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // isFirst: true,
                    beforeLineStyle:
                        LineStyle(color: notifire.getbgcolor10, thickness: 2),
                    indicatorStyle: IndicatorStyle(
                      height: 36,
                      width: 36,
                      indicator: Container(
                          width: 60,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: notifire.getbgcolor10,
                          ),
                          child: Center(
                              child: Image.asset(
                            "assets/tick-circle.png",
                            height: 16,
                            width: 16,
                          ))),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: const Offset(10, -40),
                  child: TimelineTile(
                    endChild: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, top: 40),
                            child: Transform.translate(
                              offset: const Offset(0, 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "draft copy can\nsend your design\noff the rails ",
                                        style: TextStyle(
                                          fontFamily: "InterRegular",
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: notifire.getblackcolor,
                                        ),
                                      ),
                                      const Spacer(),
                                      Transform.translate(
                                        offset: const Offset(-22, -15),
                                        child: Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color: const Color(0xffFAEBEC)),
                                          child: const Center(
                                              child: Text(
                                            'WR',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Row(
                                    children: [
                                      Text('In',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xff727880),
                                              fontFamily: 'InterRegular')),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Web Demo',
                                        style: TextStyle(
                                            color: Color(0xff595FE5),
                                            fontSize: 14,
                                            fontFamily: 'InterRegular'),
                                      )
                                    ],
                                  ),
                                  const Text(
                                    "3 minutes ago",
                                    style: TextStyle(
                                        fontFamily: "InterRegular",
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff9DA2A7)),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    beforeLineStyle:
                        LineStyle(color: notifire.getbgcolor10, thickness: 2),
                    indicatorStyle: IndicatorStyle(
                      height: 36,
                      width: 36,
                      indicator: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: notifire.getbgcolor10,
                              borderRadius: BorderRadius.circular(12)),
                          child: Center(
                              child: Image.asset(
                            "assets/message-text.png",
                            width: 16,
                            height: 16,
                          ))),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: const Offset(10, -40),
                  child: TimelineTile(
                    endChild: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, top: 40),
                            child: Transform.translate(
                              offset: const Offset(0, 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "May a cusstums\noffficer somewon\nof a poison-filled ",
                                        style: TextStyle(
                                          fontFamily: "InterRegular",
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: notifire.getblackcolor,
                                        ),
                                      ),
                                      const Spacer(),
                                      Transform.translate(
                                        offset: const Offset(-22, -15),
                                        child: Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color: const Color(0xffFAEBEC)),
                                          child: const Center(
                                              child: Text(
                                            'PR',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Row(
                                    children: [
                                      Text('In',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xff727880),
                                              fontFamily: 'InterRegular')),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Android Mobile App',
                                        style: TextStyle(
                                            color: Color(0xff595FE5),
                                            fontSize: 14,
                                            fontFamily: 'InterRegular'),
                                      )
                                    ],
                                  ),
                                  const Text(
                                    "3 minutes ago",
                                    style: TextStyle(
                                        fontFamily: "InterRegular",
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff9DA2A7)),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    beforeLineStyle:
                        LineStyle(color: notifire.getbgcolor10, thickness: 2),
                    indicatorStyle: IndicatorStyle(
                      height: 36,
                      width: 36,
                      indicator: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: notifire.getbgcolor10,
                              borderRadius: BorderRadius.circular(12)),
                          child: Center(
                              child: Image.asset("assets/tick-circle.png",
                                  width: 16, height: 16))),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: const Offset(10, -40),
                  child: TimelineTile(
                    endChild: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, top: 40),
                            child: Transform.translate(
                              offset: const Offset(0, 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "shoreditch direct\ntrade four dollar\ntoast copper mug",
                                        style: TextStyle(
                                          fontFamily: "InterRegular",
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: notifire.getblackcolor,
                                        ),
                                      ),
                                      const Spacer(),
                                      Transform.translate(
                                        offset: const Offset(-22, -15),
                                        child: Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color: const Color(0xffFAEBEC)),
                                          child: const Center(
                                              child: Text(
                                            'PR',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Row(
                                    children: [
                                      Text('In',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xff727880),
                                              fontFamily: 'InterRegular')),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'IOS Mobile Ver 2.0',
                                        style: TextStyle(
                                            color: Color(0xff595FE5),
                                            fontSize: 14,
                                            fontFamily: 'InterRegular'),
                                      )
                                    ],
                                  ),
                                  const Text(
                                    "3 minutes ago",
                                    style: TextStyle(
                                        fontFamily: "InterRegular",
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff9DA2A7)),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    beforeLineStyle:
                        LineStyle(color: notifire.getbgcolor10, thickness: 2),
                    indicatorStyle: IndicatorStyle(
                      height: 36,
                      width: 36,
                      indicator: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: notifire.getbgcolor10,
                              borderRadius: BorderRadius.circular(12)),
                          child: Center(
                              child: Image.asset("assets/arrange-circle-2.png",
                                  width: 16, height: 16))),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: const Offset(10, -40),
                  child: TimelineTile(
                    endChild: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, top: 40),
                            child: Transform.translate(
                              offset: const Offset(0, 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Fully unlicensed\nlegalese those times\ndon't want to pay ",
                                        style: TextStyle(
                                          fontFamily: "InterRegular",
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: notifire.getblackcolor,
                                        ),
                                      ),
                                      const Spacer(),
                                      Transform.translate(
                                        offset: const Offset(-22, -15),
                                        child: Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color: const Color(0xffFAEBEC)),
                                          child: const Center(
                                              child: Text(
                                            'PR',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Row(
                                    children: [
                                      Text('In',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xff727880),
                                              fontFamily: 'InterRegular')),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Android Mobile App',
                                        style: TextStyle(
                                            color: Color(0xff595FE5),
                                            fontSize: 14,
                                            fontFamily: 'InterRegular'),
                                      )
                                    ],
                                  ),
                                  const Text(
                                    "3 minutes ago",
                                    style: TextStyle(
                                        fontFamily: "InterRegular",
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff9DA2A7)),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    beforeLineStyle:
                        LineStyle(color: notifire.getbgcolor10, thickness: 2),
                    indicatorStyle: IndicatorStyle(
                      height: 36,
                      width: 36,
                      indicator: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: notifire.getbgcolor10,
                              borderRadius: BorderRadius.circular(12)),
                          child: Center(
                              child: Image.asset("assets/message-text.png",
                                  width: 16, height: 16))),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: const Offset(10, -40),
                  child: TimelineTile(
                    endChild: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, top: 40),
                            child: Transform.translate(
                              offset: const Offset(0, 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        " Select how many\nparagraphs you want\ncopy paste",
                                        style: TextStyle(
                                          fontFamily: "InterRegular",
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: notifire.getblackcolor,
                                        ),
                                      ),
                                      const Spacer(),
                                      Transform.translate(
                                        offset: const Offset(-22, -15),
                                        child: Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color: const Color(0xffFAEBEC)),
                                          child: const Center(
                                              child: Text(
                                            'WR',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Row(
                                    children: [
                                      Text('In',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xff727880),
                                              fontFamily: 'InterRegular')),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Web Demo',
                                        style: TextStyle(
                                            color: Color(0xff595FE5),
                                            fontSize: 14,
                                            fontFamily: 'InterRegular'),
                                      )
                                    ],
                                  ),
                                  const Text(
                                    "3 minutes ago",
                                    style: TextStyle(
                                        fontFamily: "InterRegular",
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff9DA2A7)),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    beforeLineStyle:
                        LineStyle(color: notifire.getbgcolor10, thickness: 2),
                    indicatorStyle: IndicatorStyle(
                      height: 36,
                      width: 36,
                      indicator: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: notifire.getbgcolor10,
                              borderRadius: BorderRadius.circular(12)),
                          child: Center(
                              child: Image.asset("assets/message-text.png",
                                  width: 16, height: 16))),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: const Offset(10, -40),
                  child: TimelineTile(
                    endChild: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, top: 40),
                            child: Transform.translate(
                              offset: const Offset(0, 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "May a cusstums\noffficer somewon\nof a poison-filled ",
                                        style: TextStyle(
                                          fontFamily: "InterRegular",
                                          fontSize: 16,
                                          color: notifire.getblackcolor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const Spacer(),
                                      Transform.translate(
                                        offset: const Offset(-22, -15),
                                        child: Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color: const Color(0xffFAEBEC)),
                                          child: const Center(
                                              child: Text(
                                            'PR',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Row(
                                    children: [
                                      Text('In',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xff727880),
                                              fontFamily: 'InterRegular')),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Android Mobile App',
                                        style: TextStyle(
                                            color: Color(0xff595FE5),
                                            fontSize: 14,
                                            fontFamily: 'InterRegular'),
                                      )
                                    ],
                                  ),
                                  const Text(
                                    "3 minutes ago",
                                    style: TextStyle(
                                        fontFamily: "InterRegular",
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff9DA2A7)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    beforeLineStyle:
                        LineStyle(color: notifire.getbgcolor10, thickness: 2),
                    indicatorStyle: IndicatorStyle(
                      height: 36,
                      width: 36,
                      indicator: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: notifire.getbgcolor10,
                              borderRadius: BorderRadius.circular(12)),
                          child: Center(
                              child: Image.asset("assets/tick-circle.png",
                                  width: 16, height: 16))),
                    ),
                  ),
                ),
              ],
            ),
          )
        : Container(
            // width: Get.width * 0.2,
            height: size > 1500
                ? Get.height * 1.325
                : size < 1650
                    ? Get.height * 1.555
                    : null,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: notifire.getbgcolor11,
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Text(' Activities',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: notifire.getblackcolor,
                                fontFamily: 'InterRegular')),
                      ],
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(10, -25),
                    child: TimelineTile(
                      isFirst: true,
                      hasIndicator: true,
                      endChild: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20, top: 40),
                              child: Transform.translate(
                                offset: const Offset(0, 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Contrary to\npopular belief is\nnot simply",
                                          style: TextStyle(
                                            fontFamily: "InterRegular",
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: notifire.getblackcolor,
                                          ),
                                        ),
                                        const Spacer(),
                                        Transform.translate(
                                          offset: const Offset(-22, -15),
                                          child: Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                color: const Color(0xffFAEBEC)),
                                            child: const Center(
                                                child: Text(
                                              'FR',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'InterRegular'),
                                            )),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Row(
                                      children: [
                                        Text('In',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xff727880),
                                                fontFamily: 'InterRegular')),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'IOS Mobile Ver 2.0',
                                          style: TextStyle(
                                              color: Color(0xff595FE5),
                                              fontSize: 14,
                                              fontFamily: 'InterRegular'),
                                        )
                                      ],
                                    ),
                                    const Text(
                                      "3 minutes ago",
                                      style: TextStyle(
                                          fontFamily: "InterRegular",
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff9DA2A7)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // isFirst: true,
                      beforeLineStyle:
                          LineStyle(color: notifire.getbgcolor10, thickness: 2),
                      indicatorStyle: IndicatorStyle(
                        height: 36,
                        width: 36,
                        indicator: Container(
                            width: 60,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: notifire.getbgcolor10,
                            ),
                            child: Center(
                                child: Image.asset(
                              "assets/tick-circle.png",
                              height: 16,
                              width: 16,
                            ))),
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(10, -30),
                    child: TimelineTile(
                      endChild: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20, top: 40),
                              child: Transform.translate(
                                offset: const Offset(0, 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "draft copy can\nsend your design\noff the rails ",
                                          style: TextStyle(
                                            fontFamily: "InterRegular",
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: notifire.getblackcolor,
                                          ),
                                        ),
                                        const Spacer(),
                                        Transform.translate(
                                          offset: const Offset(-22, -15),
                                          child: Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                color: const Color(0xffFAEBEC)),
                                            child: const Center(
                                                child: Text(
                                              'WR',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Row(
                                      children: [
                                        Text('In',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xff727880),
                                                fontFamily: 'InterRegular')),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'Web Demo',
                                          style: TextStyle(
                                              color: Color(0xff595FE5),
                                              fontSize: 14,
                                              fontFamily: 'InterRegular'),
                                        )
                                      ],
                                    ),
                                    const Text(
                                      "3 minutes ago",
                                      style: TextStyle(
                                          fontFamily: "InterRegular",
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff9DA2A7)),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      beforeLineStyle:
                          LineStyle(color: notifire.getbgcolor10, thickness: 2),
                      indicatorStyle: IndicatorStyle(
                        height: 36,
                        width: 36,
                        indicator: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: notifire.getbgcolor10,
                                borderRadius: BorderRadius.circular(12)),
                            child: Center(
                                child: Image.asset(
                              "assets/message-text.png",
                              width: 16,
                              height: 16,
                            ))),
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(10, -35),
                    child: TimelineTile(
                      endChild: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20, top: 40),
                              child: Transform.translate(
                                offset: const Offset(0, 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "May a cusstums\noffficer somewon\nof a poison-filled ",
                                          style: TextStyle(
                                            fontFamily: "InterRegular",
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: notifire.getblackcolor,
                                          ),
                                        ),
                                        const Spacer(),
                                        Transform.translate(
                                          offset: const Offset(-22, -15),
                                          child: Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                color: const Color(0xffFAEBEC)),
                                            child: const Center(
                                                child: Text(
                                              'PR',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Row(
                                      children: [
                                        Text('In',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xff727880),
                                                fontFamily: 'InterRegular')),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'Android Mobile App',
                                          style: TextStyle(
                                              color: Color(0xff595FE5),
                                              fontSize: 14,
                                              fontFamily: 'InterRegular'),
                                        )
                                      ],
                                    ),
                                    const Text(
                                      "3 minutes ago",
                                      style: TextStyle(
                                          fontFamily: "InterRegular",
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff9DA2A7)),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      beforeLineStyle:
                          LineStyle(color: notifire.getbgcolor10, thickness: 2),
                      indicatorStyle: IndicatorStyle(
                        height: 36,
                        width: 36,
                        indicator: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: notifire.getbgcolor10,
                                borderRadius: BorderRadius.circular(12)),
                            child: Center(
                                child: Image.asset("assets/tick-circle.png",
                                    width: 16, height: 16))),
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(10, -45),
                    child: TimelineTile(
                      endChild: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20, top: 40),
                              child: Transform.translate(
                                offset: const Offset(0, 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "shoreditch direct\ntrade four dollar\ntoast copper mug",
                                          style: TextStyle(
                                            fontFamily: "InterRegular",
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: notifire.getblackcolor,
                                          ),
                                        ),
                                        const Spacer(),
                                        Transform.translate(
                                          offset: const Offset(-22, -15),
                                          child: Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                color: const Color(0xffFAEBEC)),
                                            child: const Center(
                                                child: Text(
                                              'PR',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Row(
                                      children: [
                                        Text('In',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xff727880),
                                                fontFamily: 'InterRegular')),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'IOS Mobile Ver 2.0',
                                          style: TextStyle(
                                              color: Color(0xff595FE5),
                                              fontSize: 14,
                                              fontFamily: 'InterRegular'),
                                        )
                                      ],
                                    ),
                                    const Text(
                                      "3 minutes ago",
                                      style: TextStyle(
                                          fontFamily: "InterRegular",
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff9DA2A7)),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      beforeLineStyle:
                          LineStyle(color: notifire.getbgcolor10, thickness: 2),
                      indicatorStyle: IndicatorStyle(
                        height: 36,
                        width: 36,
                        indicator: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: notifire.getbgcolor10,
                                borderRadius: BorderRadius.circular(12)),
                            child: Center(
                                child: Image.asset(
                                    "assets/arrange-circle-2.png",
                                    width: 16,
                                    height: 16))),
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(10, -50),
                    child: TimelineTile(
                      endChild: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20, top: 40),
                              child: Transform.translate(
                                offset: const Offset(0, 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Fully unlicensed\nlegalese those times\ndon't want to pay ",
                                          style: TextStyle(
                                            fontFamily: "InterRegular",
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: notifire.getblackcolor,
                                          ),
                                        ),
                                        const Spacer(),
                                        Transform.translate(
                                          offset: const Offset(-22, -15),
                                          child: Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                color: const Color(0xffFAEBEC)),
                                            child: const Center(
                                                child: Text(
                                              'PR',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Row(
                                      children: [
                                        Text('In',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xff727880),
                                                fontFamily: 'InterRegular')),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'Android Mobile App',
                                          style: TextStyle(
                                              color: Color(0xff595FE5),
                                              fontSize: 14,
                                              fontFamily: 'InterRegular'),
                                        )
                                      ],
                                    ),
                                    const Text(
                                      "3 minutes ago",
                                      style: TextStyle(
                                          fontFamily: "InterRegular",
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff9DA2A7)),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      beforeLineStyle:
                          LineStyle(color: notifire.getbgcolor10, thickness: 2),
                      indicatorStyle: IndicatorStyle(
                        height: 36,
                        width: 36,
                        indicator: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: notifire.getbgcolor10,
                                borderRadius: BorderRadius.circular(12)),
                            child: Center(
                                child: Image.asset("assets/message-text.png",
                                    width: 16, height: 16))),
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(10, -55),
                    child: TimelineTile(
                      endChild: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20, top: 40),
                              child: Transform.translate(
                                offset: const Offset(0, 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Select how many\nparagraphs you want\ncopy paste",
                                          style: TextStyle(
                                            fontFamily: "InterRegular",
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: notifire.getblackcolor,
                                          ),
                                        ),
                                        const Spacer(),
                                        Transform.translate(
                                          offset: const Offset(-22, -15),
                                          child: Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                color: const Color(0xffFAEBEC)),
                                            child: const Center(
                                                child: Text(
                                              'WR',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Row(
                                      children: [
                                        Text('In',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xff727880),
                                                fontFamily: 'InterRegular')),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'Web Demo',
                                          style: TextStyle(
                                              color: Color(0xff595FE5),
                                              fontSize: 14,
                                              fontFamily: 'InterRegular'),
                                        )
                                      ],
                                    ),
                                    const Text(
                                      "3 minutes ago",
                                      style: TextStyle(
                                          fontFamily: "InterRegular",
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff9DA2A7)),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      beforeLineStyle:
                          LineStyle(color: notifire.getbgcolor10, thickness: 2),
                      indicatorStyle: IndicatorStyle(
                        height: 36,
                        width: 36,
                        indicator: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: notifire.getbgcolor10,
                                borderRadius: BorderRadius.circular(12)),
                            child: Center(
                                child: Image.asset("assets/message-text.png",
                                    width: 16, height: 16))),
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(10, -65),
                    child: TimelineTile(
                      endChild: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20, top: 40),
                              child: Transform.translate(
                                offset: const Offset(0, 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "May a cusstums\noffficer somewon\nof a poison-filled ",
                                          style: TextStyle(
                                            fontFamily: "InterRegular",
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: notifire.getblackcolor,
                                          ),
                                        ),
                                        const Spacer(),
                                        Transform.translate(
                                          offset: const Offset(-22, -15),
                                          child: Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                color: const Color(0xffFAEBEC)),
                                            child: const Center(
                                                child: Text(
                                              'PR',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Row(
                                      children: [
                                        Text('In',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xff727880),
                                                fontFamily: 'InterRegular')),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'Android Mobile App',
                                          style: TextStyle(
                                              color: Color(0xff595FE5),
                                              fontSize: 14,
                                              fontFamily: 'InterRegular'),
                                        )
                                      ],
                                    ),
                                    const Text(
                                      "3 minutes ago",
                                      style: TextStyle(
                                          fontFamily: "InterRegular",
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff9DA2A7)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      beforeLineStyle:
                          LineStyle(color: notifire.getbgcolor10, thickness: 2),
                      indicatorStyle: IndicatorStyle(
                        height: 36,
                        width: 36,
                        indicator: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: notifire.getbgcolor10,
                                borderRadius: BorderRadius.circular(12)),
                            child: Center(
                                child: Image.asset("assets/tick-circle.png",
                                    width: 16, height: 16))),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }

  Widget Grid(context, size) {
    return size < 600
        ? GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            scrollDirection: Axis.vertical,
            itemCount: model().pro.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: notifire.getbgcolor11,
                    borderRadius: const BorderRadius.all(Radius.circular(12))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(model().pro[index],
                            style: const TextStyle(
                                fontSize: 14,
                                color: Color(0xff9DA2A7),
                                fontFamily: 'InterRegular')),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(model().pro1[index],
                            style: TextStyle(
                                color: notifire.getblackcolor,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'InterRegular',
                                fontSize: 18)),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 20,
                          width: 60,
                          decoration: BoxDecoration(
                              color: model().pro2[index],
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: Text(model().pro3[index],
                                style: TextStyle(
                                    color: model().pro4[index],
                                    fontFamily: 'InterRegular',
                                    fontSize: 10)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
            primary: false,
            shrinkWrap: true,
          )
        : GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              mainAxisExtent: Get.height * 0.17,
            ),
            scrollDirection: Axis.vertical,
            itemCount: model().pro.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: notifire.getbgcolor11,
                    borderRadius: const BorderRadius.all(Radius.circular(12))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(model().pro[index],
                            style: const TextStyle(
                                fontSize: 14,
                                color: Color(0xff9DA2A7),
                                fontFamily: 'InterRegular')),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(model().pro1[index],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: notifire.getblackcolor,
                                fontFamily: 'InterRegular',
                                fontSize: 18)),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: model().pro2[index],
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: Text(model().pro3[index],
                                style: TextStyle(
                                    color: model().pro4[index],
                                    fontFamily: 'InterRegular',
                                    fontSize: 10)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
            primary: false,
            shrinkWrap: true,
          );
  }

  Widget Status(BuildContext context, size, constraints) {
    return GetBuilder<InboxController>(
      builder: (controller) {
        return Container(
          decoration: BoxDecoration(
              color: notifire.getbgcolor11,
              // color: Colors.red,
              borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Transform.translate(
                    offset: const Offset(25, 0),
                    child: Row(
                      children: [
                        Text(
                          'My Portfolio',
                          style: TextStyle(
                              fontSize: 16,
                              color: notifire.getblackcolor,
                              fontFamily: 'InterRegular',
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: constraints.maxWidth < 1400 ? 1400 : Get.width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Table(
                        border: TableBorder.all(color: Colors.transparent),
                        columnWidths: const <int, TableColumnWidth>{
                          0: FixedColumnWidth(50),
                          1: FixedColumnWidth(100),
                          2: FixedColumnWidth(100),
                          3: FixedColumnWidth(100),
                          4: FixedColumnWidth(100),
                          5: FixedColumnWidth(100),
                        },
                        children: <TableRow>[
                          const TableRow(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Text('Member',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'InterRegular',
                                        color: Color(0xff9DA2A7))),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Text('Status',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'InterRegular',
                                        color: Color(0xff9DA2A7))),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Text('Team Leader',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'InterRegular',
                                        color: Color(0xff9DA2A7))),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Text('Total Hours',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'InterRegular',
                                        color: Color(0xff9DA2A7))),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Row(
                                  children: [
                                    Text('Performance',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'InterRegular',
                                            color: Color(0xff9DA2A7))),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Stack(
                                  children: [
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Image.asset(AppContent.avatar,
                                            width: 40, height: 40),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'Oliver Williams',
                                          style: TextStyle(
                                            fontFamily: 'InterRegular',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                            color: notifire.getblackcolor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const Padding(
                                  padding: EdgeInsets.only(top: 20, left: 3),
                                  child: Text(
                                    'Onboarding',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff7DC066),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'InterRegular'),
                                  )),
                              Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 8),
                                  child: Text(
                                    'Wade Jones',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: notifire.getblackcolor,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'InterRegular'),
                                  )),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, top: 20),
                                child: Row(
                                  children: [
                                    Text(
                                      '400',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 10, left: 3),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CupertinoActivityIndicator(
                                      color: Color(0xff595FE5),
                                      radius: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          dividerTable(context, size),
                          TableRow(
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, left: 3),
                                child: Stack(
                                  children: [
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Image.asset(AppContent.avatar1,
                                            height: 40, width: 40),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'Smith Jones',
                                          style: TextStyle(
                                            fontFamily: 'InterRegular',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                            color: notifire.getblackcolor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const Padding(
                                  padding: EdgeInsets.only(top: 20, left: 3),
                                  child: Text(
                                    'Onboarding',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff7DC066),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'InterRegular'),
                                  )),
                              Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 8),
                                  child: Text(
                                    'Roberto Trivia',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: notifire.getblackcolor,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'InterRegular'),
                                  )),
                              Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 8),
                                  child: Row(
                                    children: [
                                      Text(
                                        '300',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: notifire.getblackcolor,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'InterRegular'),
                                      ),
                                    ],
                                  )),
                              const Padding(
                                padding: EdgeInsets.only(top: 10, left: 3),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CupertinoActivityIndicator(
                                      color: Color(0xff595FE5),
                                      radius: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          dividerTable(context, size),
                          TableRow(
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, left: 3),
                                child: Stack(
                                  children: [
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Image.asset(AppContent.avatar2,
                                            width: 40, height: 40),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'Amelia Jennifer',
                                          style: TextStyle(
                                            fontFamily: 'InterRegular',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                            color: notifire.getblackcolor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const Padding(
                                  padding: EdgeInsets.only(top: 20, left: 3),
                                  child: Text(
                                    'Pendding',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xffF3935D),
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'InterRegular'),
                                  )),
                              Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 8),
                                  child: Text(
                                    'Griffiths Johnson',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: notifire.getblackcolor,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'InterRegular'),
                                  )),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, left: 8),
                                child: Row(
                                  children: [
                                    Text(
                                      '900',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 10, left: 3),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CupertinoActivityIndicator(
                                      color: Color(0xff595FE5),
                                      radius: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          dividerTable(context, size),
                          TableRow(
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, left: 3),
                                child: Stack(
                                  children: [
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Image.asset(AppContent.avatar,
                                            height: 40, width: 40),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'Smith Anderson',
                                          style: TextStyle(
                                            fontFamily: 'InterRegular',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                            color: notifire.getblackcolor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const Padding(
                                  padding: EdgeInsets.only(top: 20, left: 3),
                                  child: Text(
                                    'Off this day',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xffE5646C),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'InterRegular'),
                                  )),
                              Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 8),
                                  child: Text(
                                    'Ricardo  Morgan',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: notifire.getblackcolor,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'InterRegular'),
                                  )),
                              Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 8),
                                  child: Row(
                                    children: [
                                      Text(
                                        '230',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: notifire.getblackcolor,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'InterRegular'),
                                      ),
                                    ],
                                  )),
                              const Padding(
                                padding: EdgeInsets.only(top: 10, left: 3),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CupertinoActivityIndicator(
                                      color: Color(0xff595FE5),
                                      radius: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          dividerTable(context, size),
                          TableRow(
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, left: 3),
                                child: Stack(
                                  children: [
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Image.asset(AppContent.avatar1,
                                            width: 40, height: 40),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'Jones Johnston',
                                          style: TextStyle(
                                            fontFamily: 'InterRegular',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                            color: notifire.getblackcolor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const Padding(
                                  padding: EdgeInsets.only(top: 20, left: 3),
                                  child: Text(
                                    'Off this day',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xffE5646C),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'InterRegular'),
                                  )),
                              Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 8),
                                  child: Text(
                                    'Phillips Alexis',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: notifire.getblackcolor,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'InterRegular'),
                                  )),
                              Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 8),
                                  child: Row(
                                    children: [
                                      Text(
                                        '195',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: notifire.getblackcolor,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'InterRegular'),
                                      ),
                                    ],
                                  )),
                              const Padding(
                                padding: EdgeInsets.only(top: 10, left: 3),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CupertinoActivityIndicator(
                                      color: Color(0xff595FE5),
                                      radius: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          dividerTable(context, size),
                          TableRow(
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, left: 3),
                                child: Stack(
                                  children: [
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Image.asset(AppContent.avatar2,
                                            height: 40, width: 40),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'Ailes Henderson',
                                          style: TextStyle(
                                            fontFamily: 'InterRegular',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                            color: notifire.getblackcolor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const Padding(
                                  padding: EdgeInsets.only(top: 20, left: 3),
                                  child: Text(
                                    'Onboarding',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff7DC066),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'InterRegular'),
                                  )),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, left: 8),
                                child: Text(
                                  'Henderson James',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'InterRegular',
                                      color: notifire.getblackcolor,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 8),
                                  child: Row(
                                    children: [
                                      Text(
                                        '150',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: notifire.getblackcolor,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'InterRegular'),
                                      ),
                                    ],
                                  )),
                              const Padding(
                                padding: EdgeInsets.only(top: 10, left: 3),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CupertinoActivityIndicator(
                                      color: Color(0xff595FE5),
                                      radius: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          dividerTable(context, size),
                          TableRow(
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, left: 3),
                                child: Stack(
                                  children: [
                                    Row(
                                      children: [
                                        Row(
                                          children: [
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Image.asset(AppContent.avatar,
                                                width: 40, height: 40),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              'James Buswell',
                                              style: TextStyle(
                                                fontFamily: 'InterRegular',
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14,
                                                color: notifire.getblackcolor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const Padding(
                                  padding: EdgeInsets.only(top: 20, left: 3),
                                  child: Text(
                                    'Onboarding',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff7DC066),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'InterRegular'),
                                  )),
                              Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 8),
                                  child: Text(
                                    'Devon Black',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: notifire.getblackcolor,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'InterRegular'),
                                  )),
                              Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 8),
                                  child: Row(
                                    children: [
                                      Text(
                                        '790',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: notifire.getblackcolor,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'InterRegular'),
                                      ),
                                    ],
                                  )),
                              const Padding(
                                padding: EdgeInsets.only(top: 10, left: 3),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CupertinoActivityIndicator(
                                      color: Color(0xff595FE5),
                                      radius: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          dividerTable(context, size),
                          TableRow(
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, left: 3),
                                child: Stack(
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(AppContent.avatar1,
                                            height: 40, width: 40),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'James Buswell',
                                          style: TextStyle(
                                            fontFamily: 'InterRegular',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                            color: notifire.getblackcolor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const Padding(
                                  padding: EdgeInsets.only(top: 20, left: 3),
                                  child: Text(
                                    'Pendding',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xffF3935D),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'InterRegular'),
                                  )),
                              Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 8),
                                  child: Text(
                                    'Annette Fisher',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: notifire.getblackcolor,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'InterRegular'),
                                  )),
                              Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 8),
                                  child: Row(
                                    children: [
                                      Text(
                                        '200',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: notifire.getblackcolor,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'InterRegular'),
                                      ),
                                    ],
                                  )),
                              const Padding(
                                padding: EdgeInsets.only(top: 10, left: 3),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CupertinoActivityIndicator(
                                      color: Color(0xff595FE5),
                                      radius: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          dividerTable(context, size),
                          TableRow(
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, left: 3),
                                child: Stack(
                                  children: [
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Image.asset(AppContent.avatar2,
                                            width: 40, height: 40),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'Lewis  Mitchell',
                                          style: TextStyle(
                                            fontFamily: 'InterRegular',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                            color: notifire.getblackcolor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const Padding(
                                  padding: EdgeInsets.only(top: 20, left: 3),
                                  child: Text(
                                    'Off this day',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xffE5646C),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'InterRegular'),
                                  )),
                              Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 8),
                                  child: Text(
                                    'Richards Pena',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: notifire.getblackcolor,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'InterRegular'),
                                  )),
                              Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 8),
                                  child: Row(
                                    children: [
                                      Text(
                                        '800',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: notifire.getblackcolor,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'InterRegular'),
                                      ),
                                    ],
                                  )),
                              const Padding(
                                padding: EdgeInsets.only(top: 10, left: 3),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CupertinoActivityIndicator(
                                      color: Color(0xff595FE5),
                                      radius: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const TableRow(children: [
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Divider(
                                height: 10,
                                color: Colors.transparent,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Divider(
                                height: 10,
                                color: Colors.transparent,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Divider(
                                height: 10,
                                color: Colors.transparent,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Divider(
                                height: 10,
                                color: Colors.transparent,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Divider(
                                height: 10,
                                color: Colors.transparent,
                              ),
                            ),
                          ]),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  TableRow dividerTable(BuildContext context, size) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Divider(
            height: 10,
            color: notifire.getgrey1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Divider(
            height: 10,
            color: notifire.getgrey1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Divider(
            height: 10,
            color: notifire.getgrey1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Divider(
            height: 10,
            color: notifire.getgrey1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Divider(
            height: 10,
            color: notifire.getgrey1,
          ),
        ),
      ],
    );
  }
}

class ChartData {
  ChartData(this.x, this.y1, this.y2, this.y3, this.y4);

  final String x;
  final double y1;
  final double y2;
  final double y3;
  final double y4;
}

class ChartData1 {
  ChartData1(this.x, this.y1, this.y2, this.y3, this.y4);

  final String x;
  final double y1;
  final double y2;
  final double y3;
  final double y4;
}
