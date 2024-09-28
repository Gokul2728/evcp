// ignore_for_file: prefer_const_constructors, file_names, camel_case_types
// ignore_for_file: deprecated_member_use

import 'dart:core';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:evcp/confing/colors.dart';
import 'package:evcp/confing/image.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../confing/notifier.dart';
import '../../controller/page_controller.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool light = false;
  late ColorNotifier notifire;

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
  final List<ChartData1> chartData1 = [
    ChartData1(1, 120),
    ChartData1(2, 120),
    ChartData1(3, 170),
    ChartData1(4, 130),
  ];
  final List<ChartData2> chartData2 = [
    ChartData2(1, 120),
    ChartData2(2, 120),
    ChartData2(3, 170),
    ChartData2(4, 130),
    ChartData2(5, 150),
    ChartData2(6, 160),
  ];
  bool open = false;

  @override
  Widget build(
    BuildContext context,
  ) {
    notifire = Provider.of<ColorNotifier>(context, listen: true);
    return GetBuilder<InboxController>(builder: (inboxController) {
      return LayoutBuilder(
        builder: (BuildContext context, constraints) {
          if (constraints.maxWidth < 600) {
            return Container(
              decoration: BoxDecoration(
                color: notifire.getbgcolor10,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // appbar(size: constraints.maxWidth),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          dashboard(context, constraints.maxWidth),
                          const SizedBox(
                            height: 20,
                          ),
                          dashboard1(context, constraints.maxWidth),
                          const SizedBox(
                            height: 20,
                          ),
                          dashboard2(context, constraints.maxWidth),
                          const SizedBox(
                            height: 20,
                          ),
                          dashboard3(context, constraints.maxWidth),
                          const SizedBox(
                            height: 20,
                          ),
                          dashboard4(context, constraints.maxWidth),
                          const SizedBox(
                            height: 20,
                          ),
                          chart(context, constraints.maxWidth),
                          const SizedBox(
                            height: 25,
                          ),
                          chart1(context, constraints.maxWidth, constraints),
                          const SizedBox(
                            height: 20,
                          ),
                          chart2(context, constraints.maxWidth),
                          const SizedBox(
                            height: 20,
                          ),
                          table(context, constraints.maxWidth, constraints),
                          // const Spacer(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (constraints.maxWidth < 1200) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(color: notifire.getbgcolor10),
                      child: Row(
                        children: [
                          dashboard(context, constraints.maxWidth),
                          const SizedBox(
                            width: 20,
                          ),
                          dashboard1(context, constraints.maxWidth),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        dashboard2(context, constraints.maxWidth),
                        const SizedBox(
                          width: 20,
                        ),
                        dashboard3(context, constraints.maxWidth),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        dashboard4(context, constraints.maxWidth),
                        const SizedBox(
                          width: 20,
                        ),
                        dashboard(context, constraints.maxWidth),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        chart(context, constraints.maxWidth),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: SizedBox(
                                height: 300,
                                child: chart1(context, constraints.maxWidth,
                                    constraints))),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(child: chart2(context, constraints.maxWidth)),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    table(context, constraints.maxWidth, constraints),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ListView.builder(
                      itemCount: 1,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              right: 20, left: 20, bottom: 20),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  dashboard(context, constraints.maxWidth),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  dashboard1(context, constraints.maxWidth),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  dashboard2(context, constraints.maxWidth),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  dashboard3(context, constraints.maxWidth),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  dashboard4(context, constraints.maxWidth),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  chart(context, constraints.maxWidth),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    children: [
                                      chart1(context, constraints.maxWidth,
                                          constraints),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      chart2(
                                        context,
                                        constraints.maxWidth,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              table(context, constraints.maxWidth, constraints),
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

  Widget dashboard(BuildContext context, double size) {
    return FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance.collection('stations').get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Text('No stations found');
        } else {
          // Get the number of stations
          int numberOfStations = snapshot.data!.docs.length;

          return size < 600
              ? Container(
                  decoration: BoxDecoration(
                    color: notifire.getbgcolor11,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Station',
                          style: TextStyle(
                            fontSize: 18,
                            color: notifire.getblackcolor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                            height:
                                10), // Adjust the height value here to increase space
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '${numberOfStations}',
                              style: TextStyle(
                                fontSize: 20,
                                color: notifire.getblackcolor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'No of Stations: $numberOfStations',
                              style: TextStyle(
                                fontSize: 15,
                                color: notifire.getblackcolor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              : Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: notifire.getbgcolor11,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Station',
                            style: TextStyle(
                              fontSize: 18,
                              color: notifire.getblackcolor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                              height:
                                  10), // Adjust the height value here to increase space
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '${numberOfStations}',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: notifire.getblackcolor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'No of Stations: $numberOfStations',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: notifire.getblackcolor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
        }
      },
    );
  }

  Widget dashboard1(BuildContext context, double size) {
    return FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance.collection('chargepoints').get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Text('No chargepoints found');
        } else {
          // Get the number of chargepoints
          int numberOfChargepoints = snapshot.data!.docs.length;

          return size < 600
              ? Container(
                  decoration: BoxDecoration(
                    color: notifire.getbgcolor11,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Chargepoints',
                          style: TextStyle(
                            fontSize: 18,
                            color: notifire.getblackcolor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                            height:
                                10), // Adjust the height value here to increase space
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '${numberOfChargepoints}',
                              style: TextStyle(
                                fontSize: 20,
                                color: notifire.getblackcolor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'No of Chargepoints: $numberOfChargepoints',
                              style: TextStyle(
                                fontSize: 15,
                                color: notifire.getblackcolor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              : Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: notifire.getbgcolor11,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Chargepoints',
                            style: TextStyle(
                              fontSize: 18,
                              color: notifire.getblackcolor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                              height:
                                  10), // Adjust the height value here to increase space
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '${numberOfChargepoints}',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: notifire.getblackcolor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'No of Chargepoints: $numberOfChargepoints',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: notifire.getblackcolor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
        }
      },
    );
  }

  Widget dashboard2(BuildContext context, double size) {
    return FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance.collection('accounttransaction').get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Text('No transactions found');
        } else {
          // Get the number of transactions
          int numberOfTransactions = snapshot.data!.docs.length;

          return size < 600
              ? Container(
                  decoration: BoxDecoration(
                    color: notifire.getbgcolor11,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Transaction',
                          style: TextStyle(
                            fontSize: 18,
                            color: notifire.getblackcolor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                            height:
                                10), // Adjust the height value here to increase space
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '${numberOfTransactions}',
                              style: TextStyle(
                                fontSize: 20,
                                color: notifire.getblackcolor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 18),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'No of Transactions: $numberOfTransactions',
                              style: TextStyle(
                                fontSize: 15,
                                color: notifire.getblackcolor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              : Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: notifire.getbgcolor11,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Transaction',
                            style: TextStyle(
                              fontSize: 18,
                              color: notifire.getblackcolor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                              height:
                                  10), // Adjust the height value here to increase space
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '$numberOfTransactions',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: notifire.getblackcolor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 18),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'No of Transactions: $numberOfTransactions',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: notifire.getblackcolor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
        }
      },
    );
  }

  Widget dashboard3(BuildContext context, size) {
    return GetBuilder<InboxController>(
      builder: (controller) {
        return size < 600
            ? Container(
                decoration: BoxDecoration(
                  color: notifire.getbgcolor11,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Power Sold',
                        style: TextStyle(
                          fontSize: 18,
                          color: notifire.getblackcolor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                          height:
                              10), // Adjust the height value here to increase space
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '\$797.033K',
                            style: TextStyle(
                              fontSize: 20,
                              color: notifire.getblackcolor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 18,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Total Power Sold',
                            style: TextStyle(
                              fontSize: 15,
                              color: notifire.getblackcolor,
                            ),
                          ),
                          const Spacer(),
                          Text('Kw/h',
                              style: TextStyle(
                                  color: notifire.getblackcolor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600)),
                          // const SizedBox(width: 5),
                          // Image.asset(
                          //   'assets/trend-up.png',
                          //   color: notifire.getblackcolor,
                          //   scale: 3,
                          // )
                        ],
                      )
                    ],
                  ),
                ),
              )
            : Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: notifire.getbgcolor11,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Power Sold',
                          style: TextStyle(
                            fontSize: 18,
                            color: notifire.getblackcolor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                            height:
                                10), // Adjust the height value here to increase space
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '\$797.033K',
                              style: TextStyle(
                                fontSize: 20,
                                color: notifire.getblackcolor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 18,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Total Power Sold',
                              style: TextStyle(
                                fontSize: 15,
                                color: notifire.getblackcolor,
                              ),
                            ),
                            const Spacer(),
                            Text('Kw/h',
                                style: TextStyle(
                                    color: notifire.getblackcolor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600)),
                            // const SizedBox(width: 5),
                            // Image.asset(
                            //   'assets/trend-up.png',
                            //   scale: 3,
                            //   color: notifire.getblackcolor,
                            // )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }

  Widget dashboard4(BuildContext context, size) {
    return GetBuilder<InboxController>(
      builder: (controller) {
        return size < 600
            ? Container(
                decoration: BoxDecoration(
                  color: notifire.getbgcolor11,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Earnings',
                        style: TextStyle(
                          fontSize: 18,
                          color: notifire.getblackcolor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                          height:
                              10), // Adjust the height value here to increase space
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '\$797.033K',
                            style: TextStyle(
                              fontSize: 20,
                              color: notifire.getblackcolor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 18,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            ' Total Earnings',
                            style: TextStyle(
                              fontSize: 15,
                              color: notifire.getblackcolor,
                            ),
                          ),
                          const Spacer(),
                          Text('INR',
                              style: TextStyle(
                                  color: notifire.getblackcolor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600)),
                          // const SizedBox(width: 5),
                          // Image.asset(
                          //   'assets/trend-up.png',
                          //   color: notifire.getblackcolor,
                          //   scale: 3,
                          // )
                        ],
                      )
                    ],
                  ),
                ),
              )
            : Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: notifire.getbgcolor11,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Earnings',
                          style: TextStyle(
                            fontSize: 18,
                            color: notifire.getblackcolor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                            height:
                                10), // Adjust the height value here to increase space
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '\$797.033K',
                              style: TextStyle(
                                fontSize: 20,
                                color: notifire.getblackcolor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 18,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Total Earnings',
                              style: TextStyle(
                                fontSize: 15,
                                color: notifire.getblackcolor,
                              ),
                            ),
                            const Spacer(),
                            Text('INR',
                                style: TextStyle(
                                    color: notifire.getblackcolor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600)),
                            // const SizedBox(width: 5),
                            // Image.asset(
                            //   'assets/trend-up.png',
                            //   scale: 3,
                            //   color: notifire.getblackcolor,
                            // )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }

  Widget chart(BuildContext context, size) {
    return GetBuilder<InboxController>(
      builder: (controller) {
        return size < 600
            ? Container(
                decoration: BoxDecoration(
                    color: notifire.getbgcolor11,
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Revenue',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: notifire.getbgcolor1),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadiusDirectional.circular(15),
                              color: notifire.getbgcolor10,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      width: 1,
                                    ),
                                    TextButton(
                                      style: const ButtonStyle(
                                          shape: MaterialStatePropertyAll(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  15),
                                                          topLeft:
                                                              Radius.circular(
                                                                  15))))),
                                      child: Text(
                                        '1 Month',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: notifire.getbgcolor1),
                                      ),
                                      onPressed: () {},
                                    ),
                                    Container(
                                      height: 48,
                                      width: 1,
                                      decoration: BoxDecoration(
                                        color: notifire.getgrey1,
                                      ),
                                    ),
                                    TextButton(
                                      style: const ButtonStyle(),
                                      child: Text(
                                        '6 Month',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: notifire.getbgcolor1),
                                      ),
                                      onPressed: () {},
                                    ),
                                    Container(
                                      height: 48,
                                      width: 1,
                                      decoration: BoxDecoration(
                                        color: notifire.getgrey1,
                                      ),
                                    ),
                                    TextButton(
                                      style: const ButtonStyle(),
                                      child: Text(
                                        '1 year',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: notifire.getbgcolor1),
                                      ),
                                      onPressed: () {},
                                    ),
                                    Container(
                                      height: 48,
                                      width: 1,
                                      decoration: BoxDecoration(
                                        color: notifire.getgrey1,
                                      ),
                                    ),
                                    TextButton(
                                      style: const ButtonStyle(
                                          shape: MaterialStatePropertyAll(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topRight:
                                                              Radius.circular(
                                                                  15),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  15))))),
                                      child: Text(
                                        'All',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: notifire.getbgcolor1),
                                      ),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.all(12),
                      //   child: SizedBox(
                      //     height: Get.height * 0.39,
                      //     child: SfCartesianChart(
                      //       primaryXAxis: NumericAxis(
                      //         majorTickLines: MajorTickLines(
                      //             width: 0, color: Colors.transparent),
                      //         axisBorderType:
                      //             AxisBorderType.withoutTopAndBottom,
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
                      //         axisBorderType:
                      //             AxisBorderType.withoutTopAndBottom,
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
                      //           dataSource: chartData2,
                      //           xValueMapper: (ChartData2 data, _) => data.x,
                      //           yValueMapper: (ChartData2 datum, int index) {
                      //             return null;
                      //           },
                      //           // yValueMapper: (ChartData data, _) => data.y
                      //         ),
                      //         ColumnSeries<ChartData2, double>(
                      //             dataSource: chartData2,
                      //             borderRadius: const BorderRadius.all(
                      //                 Radius.circular(10)),
                      //             color: const Color(0xff595FE5),
                      //             xValueMapper: (ChartData2 data, _) => data.x,
                      //             yValueMapper: (ChartData2 data, _) =>
                      //                 data.y1),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              )
            : Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: notifire.getbgcolor11,
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Revenue',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: notifire.getbgcolor1),
                            ),
                            const Spacer(),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadiusDirectional.circular(15),
                                color: notifire.getbgcolor10,
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 1,
                                      ),
                                      TextButton(
                                        style: const ButtonStyle(
                                            shape: MaterialStatePropertyAll(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            bottomLeft: Radius
                                                                .circular(15),
                                                            topLeft:
                                                                Radius.circular(
                                                                    15))))),
                                        child: Text(
                                          '1 Month',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: notifire.getblackcolor,
                                          ),
                                        ),
                                        onPressed: () {},
                                      ),
                                      Container(
                                        height: 30,
                                        width: 1,
                                        decoration: BoxDecoration(
                                          color: notifire.getgrey1,
                                        ),
                                      ),
                                      TextButton(
                                        style: const ButtonStyle(),
                                        child: Text(
                                          '6 Month',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: notifire.getblackcolor,
                                          ),
                                        ),
                                        onPressed: () {},
                                      ),
                                      Container(
                                        height: 30,
                                        width: 1,
                                        decoration: BoxDecoration(
                                          color: notifire.getgrey1,
                                        ),
                                      ),
                                      TextButton(
                                        style: const ButtonStyle(),
                                        child: Text(
                                          '1 year',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: notifire.getblackcolor,
                                          ),
                                        ),
                                        onPressed: () {},
                                      ),
                                      Container(
                                        height: 30,
                                        width: 1,
                                        decoration: BoxDecoration(
                                          color: notifire.getgrey1,
                                        ),
                                      ),
                                      TextButton(
                                        style: const ButtonStyle(
                                            shape: MaterialStatePropertyAll(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(15),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    15))))),
                                        child: Text(
                                          'All',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: notifire.getblackcolor,
                                          ),
                                        ),
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // SizedBox(
                        //   height: Get.height * 0.6,
                        //   child: SfCartesianChart(
                        //     primaryXAxis: NumericAxis(
                        //       isVisible: true,
                        //       majorTickLines: MajorTickLines(
                        //           width: 0, color: Colors.transparent),
                        //       axisBorderType:
                        //           AxisBorderType.withoutTopAndBottom,
                        //       axisLine:
                        //           AxisLine(color: Colors.transparent, width: 0),
                        //       borderColor: Colors.transparent,
                        //       borderWidth: 0,
                        //       minorGridLines: MinorGridLines(
                        //           color: Colors.transparent, width: 0),
                        //       majorGridLines: MajorGridLines(
                        //         width: 0,
                        //         color: Colors.transparent,
                        //       ),
                        //     ),
                        //     primaryYAxis: NumericAxis(
                        //       isVisible: true,
                        //       majorTickLines: MajorTickLines(
                        //           width: 0, color: Colors.transparent),
                        //       axisLine:
                        //           AxisLine(color: Colors.transparent, width: 0),
                        //       axisBorderType:
                        //           AxisBorderType.withoutTopAndBottom,
                        //       borderColor: Colors.transparent,
                        //       borderWidth: 0,
                        //     ),
                        //     series: [
                        //       // Renders column chart
                        //       ColumnSeries<ChartData, double>(
                        //         color: const Color(0xff595FE5),
                        //         borderRadius:
                        //             const BorderRadius.all(Radius.circular(10)),
                        //         dataSource: chartData,
                        //         xValueMapper: (ChartData data, _) => data.x,
                        //         yValueMapper: (ChartData datum, int index) {
                        //           return null;
                        //         },
                        //         // yValueMapper: (ChartData data, _) => data.y
                        //       ),
                        //       ColumnSeries<ChartData, double>(
                        //           dataSource: chartData,
                        //           borderRadius: const BorderRadius.all(
                        //               Radius.circular(10)),
                        //           color: const Color(0xff595FE5),
                        //           xValueMapper: (ChartData data, _) => data.x,
                        //           yValueMapper: (ChartData data, _) => data.y1),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }

  Widget chart1(BuildContext context, size, constraints) {
    return GetBuilder<InboxController>(
      builder: (controller) {
        return size < 600
            ? Container(
                decoration: BoxDecoration(
                    color: const Color(0xff595FE5),
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Transform.translate(
                                      offset: const Offset(10, 0),
                                      child: Text('Unlock Pro\nInsights',
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontFamily: 'InterRegular',
                                              fontWeight: FontWeight.bold,
                                              color: notifire.getblackcolor)),
                                    ),
                                    Transform.translate(
                                      offset: const Offset(10, 10),
                                      child: InkWell(
                                        onTap: () {},
                                        child: Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.black),
                                          child: Center(
                                            child: Row(
                                              children: [
                                                const Text('View earning',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontFamily:
                                                            'InterRegular',
                                                        fontSize: 12)),
                                                Image.asset(
                                                  'assets/ArrowLineRight-s.png',
                                                  height: 20,
                                                  color: Colors.white,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Stack(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Transform.translate(
                                      offset: const Offset(-20, -30),
                                      child: Image.asset(
                                        'assets/image-removebg-preview 1.png',
                                        width: size < 1500
                                            ? 100
                                            : size > 1500
                                                ? 180
                                                : null,
                                        height: size < 1500
                                            ? 164
                                            : size > 1500
                                                ? 200
                                                : size > 2200
                                                    ? 350
                                                    : null,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: notifire.getbgcolor10),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Active user',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: notifire.getbgcolor1,
                                        fontFamily: 'InterRegular',
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Row(
                                    children: [
                                      Text('589',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: notifire.getbgcolor1,
                                              fontFamily: 'InterRegular',
                                              fontWeight: FontWeight.w600)),
                                      Transform.translate(
                                          offset: const Offset(0, -5),
                                          child: Image.asset(
                                              'assets/arrow-up.png',
                                              height: 15,
                                              color: const Color(0xff7DC066))),
                                      Transform.translate(
                                          offset: const Offset(0, -5),
                                          child: const Text(
                                            '34%',
                                            style: TextStyle(
                                                fontSize: 8,
                                                color: Color(0xff7DC066),
                                                fontFamily: 'InterRegular'),
                                          ))
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'New',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: notifire.getbgcolor1,
                                        fontFamily: 'InterRegular',
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Row(
                                    children: [
                                      Text('295',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: notifire.getbgcolor1,
                                              fontFamily: 'InterRegular',
                                              fontWeight: FontWeight.w600)),
                                      Transform.translate(
                                          offset: const Offset(0, -5),
                                          child: Image.asset(
                                              'assets/arrow-up.png',
                                              height: 15,
                                              color: const Color(0xff7DC066))),
                                      Transform.translate(
                                          offset: const Offset(0, -5),
                                          child: const Text(
                                            '23%',
                                            style: TextStyle(
                                                fontSize: 8,
                                                color: Color(0xff7DC066),
                                                fontFamily: 'InterRegular'),
                                          ))
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Cancelled',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: notifire.getbgcolor1,
                                        fontFamily: 'InterRegular',
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Row(
                                    children: [
                                      Text('58',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: notifire.getbgcolor1,
                                              fontFamily: 'InterRegular',
                                              fontWeight: FontWeight.w600)),
                                      Transform.translate(
                                          offset: const Offset(0, -5),
                                          child: Image.asset(
                                              'assets/arrow-up.png',
                                              height: 15,
                                              color: const Color(0xffE5646C))),
                                      Transform.translate(
                                          offset: const Offset(0, -5),
                                          child: const Text(
                                            '4%',
                                            style: TextStyle(
                                                fontSize: 8,
                                                color: Color(0xffE5646C),
                                                fontFamily: 'InterRegular'),
                                          ))
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            : Container(
                height: size < 1500
                    ? 249
                    : size > 1500
                        ? 285
                        : null,
                width: Get.width * 0.2,
                decoration: BoxDecoration(
                    color: const Color(0xff595FE5),
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                const Text('Unlock Pro\nInsights',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontFamily: 'InterRegular',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.black),
                                    child: Center(
                                      child: Row(
                                        children: [
                                          const Text('View earning',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'InterRegular',
                                                  fontSize: 12)),
                                          Image.asset(
                                            'assets/ArrowLineRight-s.png',
                                            height: 20,
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Stack(
                              children: [
                                Transform.translate(
                                  offset: const Offset(-20, -30),
                                  child: Image.asset(
                                    'assets/image-removebg-preview 1.png',
                                    width: size < 1500
                                        ? 100
                                        : size > 1500
                                            ? 180
                                            : null,
                                    height: size < 1500
                                        ? 164
                                        : size > 1500
                                            ? 200
                                            : size > 2200
                                                ? 350
                                                : null,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: notifire.getbgcolor10),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Active user',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: notifire.getbgcolor1,
                                        fontFamily: 'InterRegular',
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Row(
                                    children: [
                                      Text('589',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: notifire.getbgcolor1,
                                              fontFamily: 'InterRegular',
                                              fontWeight: FontWeight.w600)),
                                      Transform.translate(
                                          offset: const Offset(0, -5),
                                          child: Image.asset(
                                              'assets/arrow-up.png',
                                              height: 15,
                                              color: const Color(0xff7DC066))),
                                      Transform.translate(
                                          offset: const Offset(0, -5),
                                          child: const Text(
                                            '34%',
                                            style: TextStyle(
                                                fontSize: 8,
                                                color: Color(0xff7DC066),
                                                fontFamily: 'InterRegular'),
                                          ))
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'New',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: notifire.getbgcolor1,
                                        fontFamily: 'InterRegular',
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Row(
                                    children: [
                                      Text('295',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: notifire.getbgcolor1,
                                              fontFamily: 'InterRegular',
                                              fontWeight: FontWeight.w600)),
                                      Transform.translate(
                                          offset: const Offset(0, -5),
                                          child: Image.asset(
                                              'assets/arrow-up.png',
                                              height: 15,
                                              color: const Color(0xff7DC066))),
                                      Transform.translate(
                                          offset: const Offset(0, -5),
                                          child: const Text(
                                            '23%',
                                            style: TextStyle(
                                                fontSize: 8,
                                                color: Color(0xff7DC066),
                                                fontFamily: 'InterRegular'),
                                          ))
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Cancelled',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: notifire.getbgcolor1,
                                        fontFamily: 'InterRegular',
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Row(
                                    children: [
                                      Text('58',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: notifire.getbgcolor1,
                                              fontFamily: 'InterRegular',
                                              fontWeight: FontWeight.w600)),
                                      Transform.translate(
                                          offset: const Offset(0, -5),
                                          child: Image.asset(
                                              'assets/arrow-up.png',
                                              height: 15,
                                              color: const Color(0xffE5646C))),
                                      Transform.translate(
                                          offset: const Offset(0, -5),
                                          child: const Text(
                                            '4%',
                                            style: TextStyle(
                                                fontSize: 8,
                                                color: Color(0xffE5646C),
                                                fontFamily: 'InterRegular'),
                                          ))
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
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
                // height: size > 1500 ? 300 : null ,

                decoration: BoxDecoration(
                    color: notifire.getbgcolor11,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      SizedBox(
                        height: Get.height * 0.335,
                        child: Stack(
                          children: [
                            PieChart(
                              PieChartData(
                                startDegreeOffset: 120,
                                sectionsSpace: 0,
                                centerSpaceRadius: 80,
                                sections: [
                                  PieChartSectionData(
                                    value: 40,
                                    color: const Color(0xff595FE5),
                                    radius: 40,
                                    showTitle: false,
                                  ),
                                  PieChartSectionData(
                                    value: 35,
                                    color: const Color(0xff7DC066),
                                    radius: 35,
                                    showTitle: false,
                                  ),
                                  PieChartSectionData(
                                    value: 35,
                                    color: const Color(0xffE5646C),
                                    radius: 25,
                                    showTitle: false,
                                  ),
                                  PieChartSectionData(
                                    value: 20,
                                    color: White1,
                                    radius: 20,
                                    showTitle: false,
                                  ),
                                ],
                              ),
                            ),
                            Positioned.fill(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: notifire.getbgcolor11,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: notifire.Getblg2,
                                          blurRadius: 5,
                                          spreadRadius: 5,
                                          offset: const Offset(3.0, 3.0),
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Orders",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontFamily: 'InterRegular',
                                            color: notifire.getblackcolor),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Container(
                // height: size > 1500 ? 300 : null ,
                width: Get.width * 0.2,
                decoration: BoxDecoration(
                    color: notifire.getbgcolor11,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: Get.height * 0.335,
                          child: Stack(
                            children: [
                              PieChart(
                                PieChartData(
                                  startDegreeOffset: 120,
                                  sectionsSpace: 0,
                                  centerSpaceRadius: 80,
                                  sections: [
                                    PieChartSectionData(
                                      value: 40,
                                      color: const Color(0xff595FE5),
                                      radius: 40,
                                      showTitle: false,
                                    ),
                                    PieChartSectionData(
                                      value: 35,
                                      color: const Color(0xff7DC066),
                                      radius: 35,
                                      showTitle: false,
                                    ),
                                    PieChartSectionData(
                                      value: 35,
                                      color: const Color(0xffE5646C),
                                      radius: 25,
                                      showTitle: false,
                                    ),
                                    PieChartSectionData(
                                      value: 20,
                                      color: White1,
                                      radius: 20,
                                      showTitle: false,
                                    ),
                                  ],
                                ),
                              ),
                              Positioned.fill(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        color: notifire.getbgcolor11,
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: notifire.Getblg2,
                                            blurRadius: 5,
                                            spreadRadius: 5,
                                            offset: const Offset(3.0, 3.0),
                                          ),
                                        ],
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Orders",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontFamily: 'InterRegular',
                                              color: notifire.getblackcolor),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }

  Widget table(BuildContext context, size, constraints) {
    return GetBuilder<InboxController>(
      builder: (controller) {
        return Container(
          padding: const EdgeInsets.all(15),
          width: Get.width,
          decoration: BoxDecoration(
              color: notifire.getbgcolor11,
              // color: Colors.red,
              borderRadius: BorderRadius.circular(15)),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Transform.translate(
                  offset: const Offset(8, 0),
                  child: Row(
                    children: [
                      Text(
                        'Latest Orders',
                        style: TextStyle(
                            fontSize: 16,
                            color: notifire.getbgcolor1,
                            fontFamily: 'InterRegular',
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: constraints.maxWidth < 1400 ? 1500 : Get.width,
                  child: Table(
                    border: TableBorder.all(color: Colors.transparent),
                    columnWidths: const <int, TableColumnWidth>{
                      0: FixedColumnWidth(150),
                      1: FixedColumnWidth(200),
                      2: FixedColumnWidth(50),
                      3: FixedColumnWidth(300),
                      4: FixedColumnWidth(150),
                      5: FixedColumnWidth(100),
                      6: FixedColumnWidth(115),
                      7: FixedColumnWidth(110),
                    },
                    children: <TableRow>[
                      TableRow(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 8),
                            child: Text(
                              'ODSP29475',
                              style: TextStyle(
                                  fontFamily: 'InterRegular',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: notifire.getbgcolor1),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 8),
                            child: Row(
                              children: [
                                Text(
                                  '11 Sep 2022',
                                  style: TextStyle(
                                      fontFamily: 'InterRegular',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: notifire.getbgcolor1),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  '10:09 am',
                                  style: TextStyle(
                                      color: Color(0xff9DA2A7),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'InterRegular'),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 13, left: 3),
                            child: Image.asset(
                              AppContent.Brand,
                              height: 40,
                              width: 40,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 8),
                            child: Text(
                              'Magnetic Paper Clip',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: notifire.getbgcolor1,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'InterRegular'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 8),
                            child: Text(
                              'Bank Transfer',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: notifire.getbgcolor1,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'InterRegular'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5, top: 13),
                            child: SizedBox(
                              width: 30,
                              height: 35,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: const Color(0xffE6F9EF)),
                                child: const Center(
                                    child: Text(
                                  'Paid',
                                  style: TextStyle(
                                      color: Color(0xff7DC066),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      fontFamily: 'InterRegular'),
                                )),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 8),
                            child: Center(
                              child: Text('4',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: notifire.getbgcolor1,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'InterRegular')),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 8),
                            child: Text(
                              '\$293.01',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: notifire.getbgcolor1,
                                  fontFamily: 'InterRegular'),
                            ),
                          )
                        ],
                      ),
                      dividerTable(context, size),
                      TableRow(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 8),
                            child: Text(
                              'ODSP75849',
                              style: TextStyle(
                                  fontFamily: 'InterRegular',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: notifire.getbgcolor1),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 8),
                            child: Row(
                              children: [
                                Text(
                                  '11 Sep 2022',
                                  style: TextStyle(
                                      fontFamily: 'InterRegular',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: notifire.getbgcolor1),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  '10:09 am',
                                  style: TextStyle(
                                      color: Color(0xff9DA2A7),
                                      fontSize: 14,
                                      fontFamily: 'InterRegular',
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 13, left: 3),
                            child: Image.asset(
                              AppContent.Brand1,
                              height: 40,
                              width: 40,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 8),
                            child: Text(
                              'Easy Cheese',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'InterRegular',
                                  color: notifire.getbgcolor1,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 8),
                            child: Text(
                              'Bank Transfer',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'InterRegular',
                                  color: notifire.getbgcolor1,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 13, left: 5),
                            child: Container(
                              width: 50,
                              height: 35,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: const Color(0xffFDF0E9)),
                              child: const Center(
                                  child: Text(
                                'Pending',
                                style: TextStyle(
                                    color: Color(0xffF3935D),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    fontFamily: 'InterRegular'),
                              )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 8),
                            child: Center(
                              child: Text('3',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: notifire.getbgcolor1,
                                    fontFamily: 'InterRegular',
                                    fontWeight: FontWeight.w500,
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 8),
                            child: Text(
                              '\$293.01',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'InterRegular',
                                  fontWeight: FontWeight.w600,
                                  color: notifire.getbgcolor1),
                            ),
                          )
                        ],
                      ),
                      dividerTable(context, size),
                      TableRow(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 8),
                            child: Text(
                              'ODSP29475',
                              style: TextStyle(
                                  fontFamily: 'InterRegular',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: notifire.getbgcolor1),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 8),
                            child: Row(
                              children: [
                                Text(
                                  '11 Sep 2022',
                                  style: TextStyle(
                                      fontFamily: 'InterRegular',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: notifire.getbgcolor1),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  '10:09 am',
                                  style: TextStyle(
                                      color: Color(0xff9DA2A7),
                                      fontSize: 14,
                                      fontFamily: 'InterRegular',
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 13, left: 3),
                            child: Image.asset(
                              AppContent.Brand2,
                              height: 40,
                              width: 40,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 8),
                            child: Text(
                              'Quaker Instant Oatmeal',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: notifire.getbgcolor1,
                                  fontFamily: 'InterRegular',
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 8),
                            child: Text(
                              'Visa Card',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'InterRegular',
                                  color: notifire.getbgcolor1,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 13, left: 3),
                            child: Container(
                              width: 50,
                              height: 35,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: const Color(0xffFAEBEC)),
                              child: const Center(
                                  child: Text(
                                'Cancled',
                                style: TextStyle(
                                    color: Color(0xffE5646C),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    fontFamily: 'InterRegular'),
                              )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 8),
                            child: Center(
                              child: Text('9',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'InterRegular',
                                    color: notifire.getbgcolor1,
                                    fontWeight: FontWeight.w500,
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 8),
                            child: Text(
                              '\$293.01',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'InterRegular',
                                  fontWeight: FontWeight.w600,
                                  color: notifire.getbgcolor1),
                            ),
                          )
                        ],
                      ),
                      dividerTable(context, size),
                      TableRow(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 8),
                            child: Text(
                              'ODSP29475',
                              style: TextStyle(
                                  fontFamily: 'InterRegular',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: notifire.getbgcolor1),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 8),
                            child: Row(
                              children: [
                                Text(
                                  '11 Sep 2022',
                                  style: TextStyle(
                                      fontFamily: 'InterRegular',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: notifire.getbgcolor1),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  '10:09 am',
                                  style: TextStyle(
                                      color: Color(0xff9DA2A7),
                                      fontSize: 14,
                                      fontFamily: 'InterRegular',
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 13, left: 3),
                            child: Image.asset(
                              AppContent.Brand3,
                              height: 40,
                              width: 40,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 8),
                            child: Text(
                              'Ruffles',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'InterRegular',
                                  color: notifire.getbgcolor1,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 8),
                            child: Text(
                              'Bitcoin',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'InterRegular',
                                  color: notifire.getbgcolor1,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5, top: 13),
                            child: SizedBox(
                              width: 30,
                              height: 35,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: const Color(0xffE6F9EF)),
                                child: const Center(
                                    child: Text(
                                  'Paid',
                                  style: TextStyle(
                                      color: Color(0xff7DC066),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      fontFamily: 'InterRegular'),
                                )),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 8),
                            child: Center(
                              child: Text('2',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: notifire.getbgcolor1,
                                    fontFamily: 'InterRegular',
                                    fontWeight: FontWeight.w500,
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 8),
                            child: Text(
                              '\$293.01',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'InterRegular',
                                  fontWeight: FontWeight.w600,
                                  color: notifire.getbgcolor1),
                            ),
                          )
                        ],
                      ),
                      dividerTable(context, size),
                      TableRow(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 8),
                            child: Text(
                              'ODSP29475',
                              style: TextStyle(
                                  fontFamily: 'InterRegular',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: notifire.getbgcolor1),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 8),
                            child: Row(
                              children: [
                                Text(
                                  '11 Sep 2022',
                                  style: TextStyle(
                                      fontFamily: 'InterRegular',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: notifire.getbgcolor1),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  '10:09 am',
                                  style: TextStyle(
                                      color: Color(0xff9DA2A7),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'InterRegular'),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 13, left: 3),
                            child: Image.asset(
                              AppContent.Brand,
                              height: 40,
                              width: 40,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 8),
                            child: Text(
                              'Magnetic Paper Clip',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: notifire.getbgcolor1,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'InterRegular'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 8),
                            child: Text(
                              'Bank Transfer',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: notifire.getbgcolor1,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'InterRegular'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5, top: 13),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: const Color(0xffE6F9EF)),
                              child: const Center(
                                  child: Text(
                                'Paid',
                                style: TextStyle(
                                    color: Color(0xff7DC066),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    fontFamily: 'InterRegular'),
                              )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 8),
                            child: Center(
                              child: Text('4',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: notifire.getbgcolor1,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'InterRegular')),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 8),
                            child: Text(
                              '\$293.01',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: notifire.getbgcolor1,
                                  fontFamily: 'InterRegular'),
                            ),
                          )
                        ],
                      ),
                      dividerTable(context, size),
                      TableRow(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 8),
                            child: Text(
                              'ODSP75849',
                              style: TextStyle(
                                  fontFamily: 'InterRegular',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: notifire.getbgcolor1),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 8),
                            child: Row(
                              children: [
                                Text(
                                  '11 Sep 2022',
                                  style: TextStyle(
                                      fontFamily: 'InterRegular',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: notifire.getbgcolor1),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  '10:09 am',
                                  style: TextStyle(
                                      color: Color(0xff9DA2A7),
                                      fontSize: 14,
                                      fontFamily: 'InterRegular',
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 13, left: 3),
                            child: Image.asset(
                              AppContent.Brand1,
                              height: 40,
                              width: 40,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 8),
                            child: Text(
                              'Easy Cheese',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'InterRegular',
                                  color: notifire.getbgcolor1,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 8),
                            child: Text(
                              'Bank Transfer',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'InterRegular',
                                  color: notifire.getbgcolor1,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 13, left: 5),
                            child: Container(
                              width: 50,
                              height: 35,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: const Color(0xffFDF0E9)),
                              child: const Center(
                                  child: Text(
                                'Pending',
                                style: TextStyle(
                                    color: Color(0xffF3935D),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    fontFamily: 'InterRegular'),
                              )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 8),
                            child: Center(
                              child: Text('3',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: notifire.getbgcolor1,
                                    fontFamily: 'InterRegular',
                                    fontWeight: FontWeight.w500,
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 8),
                            child: Text(
                              '\$293.01',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'InterRegular',
                                  fontWeight: FontWeight.w600,
                                  color: notifire.getbgcolor1),
                            ),
                          )
                        ],
                      ),
                      dividerTable(context, size),
                      TableRow(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 8),
                            child: Text(
                              'ODSP29475',
                              style: TextStyle(
                                  fontFamily: 'InterRegular',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: notifire.getbgcolor1),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 8),
                            child: Row(
                              children: [
                                Text(
                                  '11 Sep 2022',
                                  style: TextStyle(
                                      fontFamily: 'InterRegular',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: notifire.getbgcolor1),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  '10:09 am',
                                  style: TextStyle(
                                      color: Color(0xff9DA2A7),
                                      fontSize: 14,
                                      fontFamily: 'InterRegular',
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 13, left: 3),
                            child: Image.asset(
                              AppContent.Brand2,
                              height: 40,
                              width: 40,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 8),
                            child: Text(
                              'Quaker Instant Oatmeal',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: notifire.getbgcolor1,
                                  fontFamily: 'InterRegular',
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 8),
                            child: Text(
                              'Visa Card',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'InterRegular',
                                  color: notifire.getbgcolor1,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 13, left: 3),
                            child: Container(
                              width: 50,
                              height: 35,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: const Color(0xffFAEBEC)),
                              child: const Center(
                                  child: Text(
                                'Cancled',
                                style: TextStyle(
                                    color: Color(0xffE5646C),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    fontFamily: 'InterRegular'),
                              )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 8),
                            child: Center(
                              child: Text('9',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: notifire.getbgcolor1,
                                    fontFamily: 'InterRegular',
                                    fontWeight: FontWeight.w500,
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 8),
                            child: Text(
                              '\$293.01',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'InterRegular',
                                  fontWeight: FontWeight.w600,
                                  color: notifire.getbgcolor1),
                            ),
                          )
                        ],
                      ),
                      dividerTable(context, size),
                      TableRow(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 8),
                            child: Text(
                              'ODSP29475',
                              style: TextStyle(
                                  fontFamily: 'InterRegular',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: notifire.getbgcolor1),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 8),
                            child: Row(
                              children: [
                                Text(
                                  '11 Sep 2022',
                                  style: TextStyle(
                                      fontFamily: 'InterRegular',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: notifire.getbgcolor1),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  '10:09 am',
                                  style: TextStyle(
                                      color: Color(0xff9DA2A7),
                                      fontSize: 14,
                                      fontFamily: 'InterRegular',
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 13, left: 3),
                            child: Image.asset(
                              AppContent.Brand3,
                              height: 40,
                              width: 40,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 8),
                            child: Text(
                              'Ruffles',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'InterRegular',
                                  color: notifire.getbgcolor1,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 8),
                            child: Text(
                              'Bitcoin',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'InterRegular',
                                  color: notifire.getbgcolor1,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5, top: 13),
                            child: SizedBox(
                              width: 30,
                              height: 35,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: const Color(0xffE6F9EF)),
                                child: const Center(
                                    child: Text(
                                  'Paid',
                                  style: TextStyle(
                                      color: Color(0xff7DC066),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      fontFamily: 'InterRegular'),
                                )),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 8),
                            child: Center(
                              child: Text('2',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: notifire.getbgcolor1,
                                    fontFamily: 'InterRegular',
                                    fontWeight: FontWeight.w500,
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 8),
                            child: Text(
                              '\$293.01',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'InterRegular',
                                fontWeight: FontWeight.w600,
                                color: notifire.getbgcolor1,
                              ),
                            ),
                          )
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
              ],
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

  bool isdark = true;

  Widget switchButton() {
    return Transform.scale(
      scale: 0.8,
      child: CupertinoSwitch(
        value: previusstate,
        activeColor: Colors.black,
        onChanged: (bool value) async {
          setState(() {
            isdark = value;
          });

          setState(() {
            if (previusstate == false) {
              previusstate = true;
            } else {
              previusstate = false;
            }
            light = value;
            notifire.setIsDark = value;
          });
        },
      ),
    );
  }
}

bool previusstate = false;

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
  ChartData1(
    this.x,
    this.y1,
  );

  final double x;

  // final double y;
  final double y1;
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
