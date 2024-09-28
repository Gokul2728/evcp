// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:evcp/confing/list.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
// ignore_for_file: deprecated_member_use
import 'package:timeline_tile/timeline_tile.dart';

import '../../confing/Rtl.dart';
import '../../confing/colors.dart';

import '../../confing/notifier.dart';
import '../../controller/page_controller.dart';
import '../Dashboard/Dashboard_Crypto.dart';
import '../Dashboard/Dashboard_main.dart';
import '../login/login.dart';

class Member extends StatefulWidget {
  const Member({super.key});

  @override
  State<Member> createState() => _MemberState();
}

class _MemberState extends State<Member> {
  late bool _toggleVisibility;
  // TrackballBehavior? _trackballBehavior;
  SampleItem? selectedMenu;
  InboxController inboxController = Get.put(InboxController());

  late ColorNotifier notifire;
  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifier>(context, listen: true);
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return Container(
            color: notifire.getbgcolor10,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  container(constraints.maxWidth),
                ],
              ),
            ),
          );
        } else if (constraints.maxWidth < 1000) {
          return Theme(
            data: Theme.of(context).copyWith(
                scrollbarTheme: const ScrollbarThemeData(
                    trackVisibility: MaterialStatePropertyAll(false),
                    thumbVisibility: MaterialStatePropertyAll(false),
                    thickness: MaterialStatePropertyAll(0),
                    thumbColor: MaterialStatePropertyAll(
                      Color(0xff883DCF),
                    ))),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: notifire.getbgcolor10,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            firstContainer(
                              constraints: constraints.maxWidth,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Theme(
            data: Theme.of(context).copyWith(
                scrollbarTheme: const ScrollbarThemeData(
                    thickness: MaterialStatePropertyAll(4),
                    thumbColor: MaterialStatePropertyAll(
                      Colors.grey,
                    ))),
            child: Container(
              decoration: BoxDecoration(color: notifire.getbgcolor10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          firstContainer(
                            constraints: constraints.maxWidth,
                          )
                        ],
                      ),
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

  bool isdark = false;
  Widget firstContainer({constraints}) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
      child: Column(
        children: [
          Row(
            children: [
              const Spacer(),
              SvgPicture.asset(
                'assets/house-door.svg',
                height: 16,
                color: Colors.blue,
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                  onTap: () {
                    inboxController.setTextIsTrue(1);
                  },
                  child: Text('Dashboard',
                      style: TextStyle(
                        fontFamily: 'InterRegular',
                        fontSize: 14,
                        color: greyy,
                      ))),
              const SizedBox(
                width: 10,
              ),
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: greyy,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Profile',
                style: TextStyle(
                    color: greyy, fontSize: 14, fontFamily: 'InterRegular'),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: greyy,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Member',
                style: TextStyle(
                    color: notifire.getblackcolor,
                    fontSize: 14,
                    fontFamily: 'InterRegular'),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              container(constraints),
              const SizedBox(
                width: 10,
              ),
              container1(constraints),
            ],
          ),
        ],
      ),
    );
  }

  Widget container(constraints) {
    if (constraints < 600) {
      return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Spacer(),
                SvgPicture.asset(
                  'assets/house-door.svg',
                  height: 16,
                  color: Colors.blue,
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                    onTap: () {
                      inboxController.setTextIsTrue(1);
                    },
                    child: Text('Dashboard',
                        style: TextStyle(
                          fontFamily: 'InterRegular',
                          fontSize: 14,
                          color: greyy,
                        ))),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: greyy,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Profile',
                  style: TextStyle(
                      color: greyy, fontSize: 14, fontFamily: 'InterRegular'),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: greyy,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Member',
                  style: TextStyle(
                      color: notifire.getblackcolor,
                      fontSize: 14,
                      fontFamily: 'InterRegular'),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: notifire.getbgcolor11,
              ),
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Image.asset(
                    'assets/Avatar62.png',
                    height: 50,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Leslie Alexander',
                            style: TextStyle(
                              fontFamily: 'InterRegular',
                              fontSize: 20,
                              color: notifire.getblackcolor,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: const Color(0xffFDF0E9),
                            ),
                            padding: const EdgeInsets.all(2),
                            child: const Center(
                                child: Text('Art Director',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontFamily: 'InterRegular',
                                      color: Color(0xffF3935D),
                                    ))),
                          ),
                        ],
                      ),
                      const Text(
                        '@lesliealexander_art',
                        style: TextStyle(
                            fontFamily: 'InterRegular',
                            fontSize: 14,
                            color: Color(0xff727880)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: notifire.getbgcolor11,
                  ),
                  child: Center(
                      child: Image.asset('assets/sms-tracking1.png',
                          height: 20, color: const Color(0xff727880))),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => container1(constraints),
                      )),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: notifire.getbgcolor11,
                    ),
                    child: Image.asset('assets/more.png',
                        height: 20, color: const Color(0xff727880)),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xff595FE5),
                  ),
                  child: const Text('Message',
                      style: TextStyle(
                          fontFamily: 'InterRegular',
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w500)),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),

            Text(
              'All Taks of Sprint',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: 'InterRegular',
                color: notifire.getblackcolor,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: notifire.getbgcolor11),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          CircularPercentIndicator(
                            radius: 50,
                            circularStrokeCap: CircularStrokeCap.round,
                            lineWidth: 10,
                            animation: true,
                            percent: 0.7,
                            center: Text("75%",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: notifire.getblackcolor,
                                    fontFamily: 'InterRegular',
                                    fontWeight: FontWeight.w600)),
                            progressColor: const Color(0xff7DC066),
                            backgroundColor: const Color(0xffEEEEEE),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Completed',
                            style: TextStyle(
                                fontFamily: 'InterRegular',
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                color: Color(0xff727880)),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          CircularPercentIndicator(
                            radius: 50,
                            circularStrokeCap: CircularStrokeCap.round,
                            lineWidth: 10,
                            animation: true,
                            percent: 0.2,
                            center: Text("34.3%",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: notifire.getblackcolor,
                                    fontFamily: 'InterRegular',
                                    fontWeight: FontWeight.w600)),
                            progressColor: const Color(0xffE5646C),
                            backgroundColor: const Color(0xffEEEEEE),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Overdued',
                            style: TextStyle(
                                fontFamily: 'InterRegular',
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff727880)),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          CircularPercentIndicator(
                            radius: 50,
                            circularStrokeCap: CircularStrokeCap.round,
                            lineWidth: 10,
                            animation: true,
                            percent: 0.6,
                            center: Text("30%",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: notifire.getblackcolor,
                                    fontFamily: 'InterRegular',
                                    fontWeight: FontWeight.w600)),
                            progressColor: const Color(0xff59B4D1),
                            backgroundColor: const Color(0xffEEEEEE),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Opened',
                            style: TextStyle(
                                fontFamily: 'InterRegular',
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                color: Color(0xff727880)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: notifire.getbgcolor11),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          CircularPercentIndicator(
                            radius: 50,
                            circularStrokeCap: CircularStrokeCap.round,
                            lineWidth: 10,
                            animation: true,
                            percent: 0.9,
                            center: Text("90%",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: notifire.getblackcolor,
                                    fontFamily: 'InterRegular',
                                    fontWeight: FontWeight.w600)),
                            progressColor: const Color(0xffF3935D),
                            backgroundColor: const Color(0xffEEEEEE),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Moved',
                            style: TextStyle(
                                fontFamily: 'InterRegular',
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff727880)),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          CircularPercentIndicator(
                            radius: 50,
                            circularStrokeCap: CircularStrokeCap.round,
                            lineWidth: 10,
                            animation: true,
                            percent: 0.8,
                            center: Text("34%",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: notifire.getblackcolor,
                                    fontFamily: 'InterRegular',
                                    fontWeight: FontWeight.w600)),
                            progressColor: const Color(0xff727880),
                            backgroundColor: const Color(0xffEEEEEE),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Completed',
                            style: TextStyle(
                                fontFamily: 'InterRegular',
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                color: Color(0xff727880)),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          CircularPercentIndicator(
                            radius: 50,
                            circularStrokeCap: CircularStrokeCap.round,
                            lineWidth: 10,
                            animation: true,
                            percent: 0.45,
                            center: Text("55%",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: notifire.getblackcolor,
                                    fontFamily: 'InterRegular',
                                    fontWeight: FontWeight.w600)),
                            progressColor: const Color(0xff7DC066),
                            backgroundColor: const Color(0xffEEEEEE),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Completed',
                            style: TextStyle(
                                fontFamily: 'InterRegular',
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                color: Color(0xff727880)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text('Performance on Week',
                style: TextStyle(
                  fontFamily: 'InterRegular',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: notifire.getblackcolor,
                )),
            const SizedBox(
              height: 10,
            ),
            // Container(
            //     decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: notifire.getbgcolor11,),
            //   padding: const EdgeInsets.all(12),
            //   child: SfCartesianChart(
            //     plotAreaBorderWidth: 0,

            //     primaryXAxis: DateTimeAxis(
            //         dateFormat: DateFormat.MMM(),
            //         interval: 3,
            //         intervalType: DateTimeIntervalType.months,
            //         minimum: DateTime(2016),
            //         maximum: DateTime(2017),
            //         majorGridLines: const MajorGridLines(width: 0)),
            //     primaryYAxis:  const NumericAxis(
            //         minimum: 60,
            //         maximum: 140,
            //         interval: 20,
            //         labelFormat: r'${value}',
            //         axisLine: AxisLine(width: 0)),
            //     series: _getHiloOpenCloseSeries(),
            //     trackballBehavior: _trackballBehavior,
            //   ),
            // ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Upcomming Tasks',
              style: TextStyle(
                fontFamily: 'InterRegular',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: notifire.getblackcolor,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: Get.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: notifire.getbgcolor11,
              ),
              padding: const EdgeInsets.all(12),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: constraints < 1400 ? 1500 : Get.width,
                      child: Table(
                        border: TableBorder.all(color: Colors.transparent),
                        columnWidths: const <int, TableColumnWidth>{
                          0: FixedColumnWidth(0),
                          1: FixedColumnWidth(400),
                          2: FixedColumnWidth(100),
                          3: FixedColumnWidth(10),
                          4: FixedColumnWidth(10),
                        },
                        children: <TableRow>[
                          TableRow(
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 25, left: 8),
                                child: Image.asset(
                                  'assets/Media(2).png',
                                  height: 64,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 25, left: 8),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Comment by Leslie Alexander ',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'InterRegular',
                                            fontWeight: FontWeight.w600,
                                            color: notifire.getblackcolor,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          'on Update splash animate IOS',
                                          style: TextStyle(
                                            fontFamily: 'InterRegular',
                                            fontSize: 14,
                                            color: notifire.getblackcolor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: const Color(0xffF8BEC1)),
                                          padding: const EdgeInsets.all(6),
                                          child: const Text('Highest',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'InterRegular',
                                                  fontWeight: FontWeight.w600)),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Text(
                                          'In',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xff727880),
                                              fontFamily: 'InterRegular'),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        const Text(
                                          'IOS Mobile Ver 2.0',
                                          style: TextStyle(
                                            fontFamily: 'InterRegular',
                                            fontSize: 14,
                                            color: Color(0xff595FE5),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 25, left: 8),
                                child: Text(
                                  '2 July 2022',
                                  style: TextStyle(
                                    color: Color(0xff727880),
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 8),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.white, width: 2),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: const DecorationImage(
                                                image: AssetImage(
                                                    'assets/avatar-6 1.png'))),
                                      ),
                                      Transform.translate(
                                        offset: const Offset(-10, 0),
                                        child: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.white,
                                                  width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              image: const DecorationImage(
                                                  image: AssetImage(
                                                      'assets/avatar-7 1.png'))),
                                        ),
                                      ),
                                      Transform.translate(
                                        offset: const Offset(-20, 0),
                                        child: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.white,
                                                  width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              image: const DecorationImage(
                                                  image: AssetImage(
                                                      'assets/avatar-8 1.png'))),
                                        ),
                                      ),
                                      Transform.translate(
                                        offset: const Offset(-30, 0),
                                        child: Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            image: const DecorationImage(
                                                image: AssetImage(
                                                    'assets/User Read.png')),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: const Color(0xffEEEEEE),
                                            border: Border.all(
                                                color: Colors.white, width: 2),
                                          ),
                                          child: const Center(
                                              child: Text(
                                            '+5',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14),
                                          )),
                                        ),
                                      ),
                                    ],
                                  )),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, top: 30),
                                child: Image.asset('assets/more.png',
                                    height: 20, color: const Color(0xff727880)),
                              ),
                            ],
                          ),
                          dividerTable(context),
                          TableRow(
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 25, left: 8),
                                child: Image.asset(
                                  'assets/Media(4).png',
                                  height: 64,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 25, left: 8),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Comment by Leslie Alexander ',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'InterRegular',
                                            fontWeight: FontWeight.w600,
                                            color: notifire.getblackcolor,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          'on Update splash animate IOS',
                                          style: TextStyle(
                                            fontFamily: 'InterRegular',
                                            fontSize: 14,
                                            color: notifire.getblackcolor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: const Color(0xffF8BEC1)),
                                          padding: const EdgeInsets.all(6),
                                          child: const Text('Highest',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'InterRegular',
                                                  fontWeight: FontWeight.w600)),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Text(
                                          'In',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xff727880),
                                              fontFamily: 'InterRegular'),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        const Text(
                                          'IOS Mobile Ver 2.0',
                                          style: TextStyle(
                                            fontFamily: 'InterRegular',
                                            fontSize: 14,
                                            color: Color(0xff595FE5),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 25, left: 8),
                                child: Text(
                                  '2 July 2022',
                                  style: TextStyle(
                                    color: Color(0xff727880),
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 8),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.white, width: 2),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: const DecorationImage(
                                                image: AssetImage(
                                                    'assets/avatar-6 1.png'))),
                                      ),
                                      Transform.translate(
                                        offset: const Offset(-10, 0),
                                        child: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.white,
                                                  width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              image: const DecorationImage(
                                                  image: AssetImage(
                                                      'assets/avatar-7 1.png'))),
                                        ),
                                      ),
                                      Transform.translate(
                                        offset: const Offset(-20, 0),
                                        child: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.white,
                                                  width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              image: const DecorationImage(
                                                  image: AssetImage(
                                                      'assets/avatar-8 1.png'))),
                                        ),
                                      ),
                                    ],
                                  )),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, top: 30),
                                child: Image.asset('assets/more.png',
                                    height: 20, color: const Color(0xff727880)),
                              ),
                            ],
                          ),
                          dividerTable(context),
                          TableRow(
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 25, left: 8),
                                child: Image.asset(
                                  'assets/Media.png',
                                  height: 64,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 25, left: 8),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Comment by Leslie Alexander ',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'InterRegular',
                                            fontWeight: FontWeight.w600,
                                            color: notifire.getblackcolor,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          'on Update splash animate IOS',
                                          style: TextStyle(
                                            fontFamily: 'InterRegular',
                                            fontSize: 14,
                                            color: notifire.getblackcolor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: const Color(0xffA9DDF5)),
                                          padding: const EdgeInsets.all(6),
                                          child: const Text('Normal',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'InterRegular',
                                                  fontWeight: FontWeight.w600)),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Text(
                                          'In',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xff727880),
                                              fontFamily: 'InterRegular'),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        const Text(
                                          'IOS Mobile Ver 2.0',
                                          style: TextStyle(
                                            fontFamily: 'InterRegular',
                                            fontSize: 14,
                                            color: Color(0xff595FE5),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 25, left: 8),
                                child: Text(
                                  '2 July 2022',
                                  style: TextStyle(
                                    color: Color(0xff727880),
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 8),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.white, width: 2),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: const DecorationImage(
                                                image: AssetImage(
                                                    'assets/avatar-6 1.png'))),
                                      ),
                                      Transform.translate(
                                        offset: const Offset(-10, 0),
                                        child: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.white,
                                                  width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              image: const DecorationImage(
                                                  image: AssetImage(
                                                      'assets/avatar-7 1.png'))),
                                        ),
                                      ),
                                    ],
                                  )),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, top: 30),
                                child: Image.asset('assets/more.png',
                                    height: 20, color: const Color(0xff727880)),
                              ),
                            ],
                          ),
                          dividerTable(context),
                          TableRow(
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 25, left: 8),
                                child: Image.asset(
                                  'assets/Media2.png',
                                  height: 64,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 25, left: 8),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Comment by Leslie Alexander ',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'InterRegular',
                                            fontWeight: FontWeight.w600,
                                            color: notifire.getblackcolor,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          'on Update splash animate IOS',
                                          style: TextStyle(
                                            fontFamily: 'InterRegular',
                                            fontSize: 14,
                                            color: notifire.getblackcolor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: const Color(0xffA9DDF5)),
                                          padding: const EdgeInsets.all(6),
                                          child: const Text('Normal',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'InterRegular',
                                                  fontWeight: FontWeight.w600)),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Text(
                                          'In',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xff727880),
                                              fontFamily: 'InterRegular'),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        const Text(
                                          'IOS Mobile Ver 2.0',
                                          style: TextStyle(
                                            fontFamily: 'InterRegular',
                                            fontSize: 14,
                                            color: Color(0xff595FE5),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 25, left: 8),
                                child: Text(
                                  '2 July 2022',
                                  style: TextStyle(
                                    color: Color(0xff727880),
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 8),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.white, width: 2),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: const DecorationImage(
                                                image: AssetImage(
                                                    'assets/avatar-6 1.png'))),
                                      ),
                                    ],
                                  )),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, top: 30),
                                child: Image.asset('assets/more.png',
                                    height: 20, color: const Color(0xff727880)),
                              ),
                            ],
                          ),
                          dividerTable(context),
                          TableRow(
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 25, left: 8),
                                child: Image.asset(
                                  'assets/Media(4).png',
                                  height: 64,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 25, left: 8),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Comment by Leslie Alexander ',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'InterRegular',
                                            fontWeight: FontWeight.w600,
                                            color: notifire.getblackcolor,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          'on Update splash animate IOS',
                                          style: TextStyle(
                                            fontFamily: 'InterRegular',
                                            fontSize: 14,
                                            color: notifire.getblackcolor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: const Color(0xffA9DDF5)),
                                          padding: const EdgeInsets.all(6),
                                          child: const Text('Normal',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'InterRegular',
                                                  fontWeight: FontWeight.w600)),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Text(
                                          'In',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xff727880),
                                              fontFamily: 'InterRegular'),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        const Text(
                                          'IOS Mobile Ver 2.0',
                                          style: TextStyle(
                                            fontFamily: 'InterRegular',
                                            fontSize: 14,
                                            color: Color(0xff595FE5),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 25, left: 8),
                                child: Text(
                                  '2 July 2022',
                                  style: TextStyle(
                                    color: Color(0xff727880),
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 8),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.white, width: 2),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: const DecorationImage(
                                                image: AssetImage(
                                                    'assets/avatar-6 1.png'))),
                                      ),
                                      Transform.translate(
                                        offset: const Offset(-10, 0),
                                        child: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.white,
                                                  width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              image: const DecorationImage(
                                                  image: AssetImage(
                                                      'assets/avatar-7 1.png'))),
                                        ),
                                      ),
                                    ],
                                  )),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, top: 30),
                                child: Image.asset('assets/more.png',
                                    height: 20, color: const Color(0xff727880)),
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
                  ],
                ),
              ),
            )
          ],
        ),
      );
    } else {
      return Flexible(
        flex: 6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: notifire.getbgcolor11,
              ),
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Image.asset(
                    'assets/Avatar62.png',
                    height: 80,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Leslie Alexander',
                            style: TextStyle(
                              fontFamily: 'InterRegular',
                              fontSize: 28,
                              color: notifire.getblackcolor,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: const Color(0xffFDF0E9),
                            ),
                            padding: const EdgeInsets.all(4),
                            child: const Center(
                                child: Text('Art Director',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'InterRegular',
                                      color: Color(0xffF3935D),
                                    ))),
                          ),
                        ],
                      ),
                      const Text(
                        '@lesliealexander_art',
                        style: TextStyle(
                            fontFamily: 'InterRegular',
                            fontSize: 14,
                            color: Color(0xff727880)),
                      ),
                    ],
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: notifire.getbgcolor10,
                      ),
                      child: Center(
                          child: Image.asset('assets/sms-tracking1.png',
                              height: 20, color: const Color(0xff727880))),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: notifire.getbgcolor10,
                      ),
                      child: Image.asset('assets/more.png',
                          height: 20, color: const Color(0xff727880)),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color(0xff595FE5),
                      ),
                      child: const Text('Message',
                          style: TextStyle(
                              fontFamily: 'InterRegular',
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w500)),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'All Taks of Sprint',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: 'InterRegular',
                color: notifire.getblackcolor,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  color: notifire.getbgcolor11,
                  borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.all(12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CircularPercentIndicator(
                        radius: 45,
                        circularStrokeCap: CircularStrokeCap.round,
                        lineWidth: 10,
                        animation: true,
                        percent: 0.7,
                        center: Text("75%",
                            style: TextStyle(
                                fontSize: 18,
                                color: notifire.getblackcolor,
                                fontFamily: 'InterRegular',
                                fontWeight: FontWeight.w600)),
                        progressColor: const Color(0xff7DC066),
                        backgroundColor: const Color(0xffEEEEEE),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Completed',
                        style: TextStyle(
                            fontFamily: 'InterRegular',
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: Color(0xff727880)),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      CircularPercentIndicator(
                        radius: 45,
                        circularStrokeCap: CircularStrokeCap.round,
                        lineWidth: 10,
                        animation: true,
                        percent: 0.2,
                        center: Text("34.3%",
                            style: TextStyle(
                                fontSize: 18,
                                color: notifire.getblackcolor,
                                fontFamily: 'InterRegular',
                                fontWeight: FontWeight.w600)),
                        progressColor: const Color(0xffE5646C),
                        backgroundColor: const Color(0xffEEEEEE),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Overdued',
                        style: TextStyle(
                            fontFamily: 'InterRegular',
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff727880)),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      CircularPercentIndicator(
                        radius: 45,
                        circularStrokeCap: CircularStrokeCap.round,
                        lineWidth: 10,
                        animation: true,
                        percent: 0.6,
                        center: Text("30%",
                            style: TextStyle(
                                fontSize: 18,
                                color: notifire.getblackcolor,
                                fontFamily: 'InterRegular',
                                fontWeight: FontWeight.w600)),
                        progressColor: const Color(0xff59B4D1),
                        backgroundColor: const Color(0xffEEEEEE),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Opened',
                        style: TextStyle(
                            fontFamily: 'InterRegular',
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: Color(0xff727880)),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      CircularPercentIndicator(
                        radius: 45,
                        circularStrokeCap: CircularStrokeCap.round,
                        lineWidth: 10,
                        animation: true,
                        percent: 0.9,
                        center: Text("90%",
                            style: TextStyle(
                                fontSize: 18,
                                color: notifire.getblackcolor,
                                fontFamily: 'InterRegular',
                                fontWeight: FontWeight.w600)),
                        progressColor: const Color(0xffF3935D),
                        backgroundColor: const Color(0xffEEEEEE),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Moved',
                        style: TextStyle(
                            fontFamily: 'InterRegular',
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff727880)),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      CircularPercentIndicator(
                        radius: 45,
                        circularStrokeCap: CircularStrokeCap.round,
                        lineWidth: 10,
                        animation: true,
                        percent: 0.8,
                        center: Text("34%",
                            style: TextStyle(
                                fontSize: 18,
                                color: notifire.getblackcolor,
                                fontFamily: 'InterRegular',
                                fontWeight: FontWeight.w600)),
                        progressColor: const Color(0xff727880),
                        backgroundColor: const Color(0xffEEEEEE),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Completed',
                        style: TextStyle(
                            fontFamily: 'InterRegular',
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: Color(0xff727880)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text('Performance on Week',
                style: TextStyle(
                  fontFamily: 'InterRegular',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: notifire.getblackcolor,
                )),
            const SizedBox(
              height: 10,
            ),
            // Container(
            //   padding: const EdgeInsets.all(12),
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(12),
            //       color: notifire.getbgcolor11),
            //   child: SfCartesianChart(
            //     plotAreaBorderWidth: 0,
            //     primaryXAxis: DateTimeAxis(
            //         dateFormat: DateFormat.MMM(),
            //         interval: 3,
            //         intervalType: DateTimeIntervalType.months,
            //         minimum: DateTime(2016),
            //         maximum: DateTime(2017),
            //         majorGridLines: const MajorGridLines(width: 0)),
            //     primaryYAxis: const NumericAxis(
            //         minimum: 60,
            //         maximum: 140,
            //         interval: 20,
            //         labelFormat: r'${value}',
            //         axisLine: AxisLine(width: 0)),
            //     series: _getHiloOpenCloseSeries(),
            //     trackballBehavior: _trackballBehavior,
            //   ),
            // ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Upcomming Tasks',
              style: TextStyle(
                fontFamily: 'InterRegular',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: notifire.getblackcolor,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
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
                    SizedBox(
                      width: constraints < 1400 ? 1500 : Get.width,
                      child: Table(
                        border: TableBorder.all(color: Colors.transparent),
                        columnWidths: const <int, TableColumnWidth>{
                          0: FixedColumnWidth(1),
                          1: FixedColumnWidth(400),
                          2: FixedColumnWidth(100),
                          3: FixedColumnWidth(10),
                          4: FixedColumnWidth(10),
                        },
                        children: <TableRow>[
                          TableRow(
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 25, left: 8),
                                child: Image.asset(
                                  'assets/Media(2).png',
                                  height: 64,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 25, left: 8),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Comment by Leslie Alexander ',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'InterRegular',
                                            fontWeight: FontWeight.w600,
                                            color: notifire.getblackcolor,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          'on Update splash animate IOS',
                                          style: TextStyle(
                                            fontFamily: 'InterRegular',
                                            fontSize: 14,
                                            color: notifire.getblackcolor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(14),
                                              color: const Color(0xffF8BEC1)),
                                          padding: const EdgeInsets.all(6),
                                          child: const Text('Highest',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'InterRegular',
                                                  fontWeight: FontWeight.w600)),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Text(
                                          'In',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xff727880),
                                              fontFamily: 'InterRegular'),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        const Text(
                                          'IOS Mobile Ver 2.0',
                                          style: TextStyle(
                                            fontFamily: 'InterRegular',
                                            fontSize: 14,
                                            color: Color(0xff595FE5),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 25, left: 8),
                                child: Text(
                                  '2 July 2022',
                                  style: TextStyle(
                                    color: Color(0xff727880),
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 8),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.white, width: 2),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: const DecorationImage(
                                                image: AssetImage(
                                                    'assets/avatar-6 1.png'))),
                                      ),
                                      Transform.translate(
                                        offset: const Offset(-10, 0),
                                        child: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.white,
                                                  width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              image: const DecorationImage(
                                                  image: AssetImage(
                                                      'assets/avatar-7 1.png'))),
                                        ),
                                      ),
                                      Transform.translate(
                                        offset: const Offset(-20, 0),
                                        child: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.white,
                                                  width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              image: const DecorationImage(
                                                  image: AssetImage(
                                                      'assets/avatar-8 1.png'))),
                                        ),
                                      ),
                                      Transform.translate(
                                        offset: const Offset(-30, 0),
                                        child: Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            image: const DecorationImage(
                                                image: AssetImage(
                                                    'assets/User Read.png')),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: const Color(0xffEEEEEE),
                                            border: Border.all(
                                                color: Colors.white, width: 2),
                                          ),
                                          child: const Center(
                                              child: Text(
                                            '+5',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14),
                                          )),
                                        ),
                                      ),
                                    ],
                                  )),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, top: 30),
                                child: Image.asset('assets/more.png',
                                    height: 20, color: const Color(0xff727880)),
                              ),
                            ],
                          ),
                          dividerTable(context),
                          TableRow(
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 25, left: 8),
                                child: Image.asset(
                                  'assets/Media(4).png',
                                  height: 64,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 25, left: 8),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Comment by Leslie Alexander ',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'InterRegular',
                                            fontWeight: FontWeight.w600,
                                            color: notifire.getblackcolor,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          'on Update splash animate IOS',
                                          style: TextStyle(
                                            fontFamily: 'InterRegular',
                                            fontSize: 14,
                                            color: notifire.getblackcolor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(14),
                                              color: const Color(0xffF8BEC1)),
                                          padding: const EdgeInsets.all(6),
                                          child: const Text('Highest',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'InterRegular',
                                                  fontWeight: FontWeight.w600)),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Text(
                                          'In',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xff727880),
                                              fontFamily: 'InterRegular'),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        const Text(
                                          'IOS Mobile Ver 2.0',
                                          style: TextStyle(
                                            fontFamily: 'InterRegular',
                                            fontSize: 14,
                                            color: Color(0xff595FE5),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 25, left: 8),
                                child: Text(
                                  '2 July 2022',
                                  style: TextStyle(
                                    color: Color(0xff727880),
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 8),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.white, width: 2),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: const DecorationImage(
                                                image: AssetImage(
                                                    'assets/avatar-6 1.png'))),
                                      ),
                                      Transform.translate(
                                        offset: const Offset(-10, 0),
                                        child: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.white,
                                                  width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              image: const DecorationImage(
                                                  image: AssetImage(
                                                      'assets/avatar-7 1.png'))),
                                        ),
                                      ),
                                      Transform.translate(
                                        offset: const Offset(-20, 0),
                                        child: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.white,
                                                  width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              image: const DecorationImage(
                                                  image: AssetImage(
                                                      'assets/avatar-8 1.png'))),
                                        ),
                                      ),
                                    ],
                                  )),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, top: 30),
                                child: Image.asset('assets/more.png',
                                    height: 20, color: const Color(0xff727880)),
                              ),
                            ],
                          ),
                          dividerTable(context),
                          TableRow(
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 25, left: 8),
                                child: Image.asset(
                                  'assets/Media.png',
                                  height: 64,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 25, left: 8),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Comment by Leslie Alexander ',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'InterRegular',
                                            fontWeight: FontWeight.w600,
                                            color: notifire.getblackcolor,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          'on Update splash animate IOS',
                                          style: TextStyle(
                                            fontFamily: 'InterRegular',
                                            fontSize: 14,
                                            color: notifire.getblackcolor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(14),
                                              color: const Color(0xffA9DDF5)),
                                          padding: const EdgeInsets.all(6),
                                          child: const Text('Normal',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'InterRegular',
                                                  fontWeight: FontWeight.w600)),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Text(
                                          'In',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xff727880),
                                              fontFamily: 'InterRegular'),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        const Text(
                                          'IOS Mobile Ver 2.0',
                                          style: TextStyle(
                                            fontFamily: 'InterRegular',
                                            fontSize: 14,
                                            color: Color(0xff595FE5),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 25, left: 8),
                                child: Text(
                                  '2 July 2022',
                                  style: TextStyle(
                                    color: Color(0xff727880),
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 8),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.white, width: 2),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: const DecorationImage(
                                                image: AssetImage(
                                                    'assets/avatar-6 1.png'))),
                                      ),
                                      Transform.translate(
                                        offset: const Offset(-10, 0),
                                        child: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.white,
                                                  width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              image: const DecorationImage(
                                                  image: AssetImage(
                                                      'assets/avatar-7 1.png'))),
                                        ),
                                      ),
                                    ],
                                  )),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, top: 30),
                                child: Image.asset('assets/more.png',
                                    height: 20, color: const Color(0xff727880)),
                              ),
                            ],
                          ),
                          dividerTable(context),
                          TableRow(
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 25, left: 8),
                                child: Image.asset(
                                  'assets/Media2.png',
                                  height: 64,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 25, left: 8),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Comment by Leslie Alexander ',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'InterRegular',
                                            fontWeight: FontWeight.w600,
                                            color: notifire.getblackcolor,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          'on Update splash animate IOS',
                                          style: TextStyle(
                                            fontFamily: 'InterRegular',
                                            fontSize: 14,
                                            color: notifire.getblackcolor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(14),
                                              color: const Color(0xffA9DDF5)),
                                          padding: const EdgeInsets.all(6),
                                          child: const Text('Normal',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'InterRegular',
                                                  fontWeight: FontWeight.w600)),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Text(
                                          'In',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xff727880),
                                              fontFamily: 'InterRegular'),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        const Text(
                                          'IOS Mobile Ver 2.0',
                                          style: TextStyle(
                                            fontFamily: 'InterRegular',
                                            fontSize: 14,
                                            color: Color(0xff595FE5),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 25, left: 8),
                                child: Text(
                                  '2 July 2022',
                                  style: TextStyle(
                                    color: Color(0xff727880),
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 8),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.white, width: 2),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: const DecorationImage(
                                                image: AssetImage(
                                                    'assets/avatar-6 1.png'))),
                                      ),
                                    ],
                                  )),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, top: 30),
                                child: Image.asset('assets/more.png',
                                    height: 20, color: const Color(0xff727880)),
                              ),
                            ],
                          ),
                          dividerTable(context),
                          TableRow(
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 25, left: 8),
                                child: Image.asset(
                                  'assets/Media(4).png',
                                  height: 64,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 25, left: 8),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Comment by Leslie Alexander ',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'InterRegular',
                                            fontWeight: FontWeight.w600,
                                            color: notifire.getblackcolor,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          'on Update splash animate IOS',
                                          style: TextStyle(
                                            fontFamily: 'InterRegular',
                                            fontSize: 14,
                                            color: notifire.getblackcolor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(14),
                                              color: const Color(0xffA9DDF5)),
                                          padding: const EdgeInsets.all(6),
                                          child: const Text('Normal',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'InterRegular',
                                                  fontWeight: FontWeight.w600)),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Text(
                                          'In',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xff727880),
                                              fontFamily: 'InterRegular'),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        const Text(
                                          'IOS Mobile Ver 2.0',
                                          style: TextStyle(
                                            fontFamily: 'InterRegular',
                                            fontSize: 14,
                                            color: Color(0xff595FE5),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 25, left: 8),
                                child: Text(
                                  '2 July 2022',
                                  style: TextStyle(
                                    color: Color(0xff727880),
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, left: 8),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.white, width: 2),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: const DecorationImage(
                                                image: AssetImage(
                                                    'assets/avatar-6 1.png'))),
                                      ),
                                      Transform.translate(
                                        offset: const Offset(-10, 0),
                                        child: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.white,
                                                  width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              image: const DecorationImage(
                                                  image: AssetImage(
                                                      'assets/avatar-7 1.png'))),
                                        ),
                                      ),
                                    ],
                                  )),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, top: 30),
                                child: Image.asset('assets/more.png',
                                    height: 20, color: const Color(0xff727880)),
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
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }
  }

  // List<HiloOpenCloseSeries<ChartSampleData, DateTime>>
  //     _getHiloOpenCloseSeries() {
  //   return <HiloOpenCloseSeries<ChartSampleData, DateTime>>[
  //     HiloOpenCloseSeries<ChartSampleData, DateTime>(
  //         dataSource: <ChartSampleData>[
  //           ChartSampleData(
  //               x: DateTime(2016, 01, 11),
  //               open: 98.97,
  //               high: 101.19,
  //               low: 95.36,
  //               close: 97.13),
  //           ChartSampleData(
  //               x: DateTime(2016, 01, 18),
  //               open: 98.41,
  //               high: 101.46,
  //               low: 93.42,
  //               close: 101.42),
  //           ChartSampleData(
  //               x: DateTime(2016, 01, 25),
  //               open: 101.52,
  //               high: 101.53,
  //               low: 92.39,
  //               close: 97.34),
  //           ChartSampleData(
  //               x: DateTime(2016, 02),
  //               open: 96.47,
  //               high: 97.33,
  //               low: 93.69,
  //               close: 94.02),
  //           ChartSampleData(
  //               x: DateTime(2016, 02, 08),
  //               open: 93.13,
  //               high: 96.35,
  //               low: 92.59,
  //               close: 93.99),
  //           ChartSampleData(
  //               x: DateTime(2016, 02, 15),
  //               open: 91.02,
  //               high: 94.89,
  //               low: 90.61,
  //               close: 92.04),
  //           ChartSampleData(
  //               x: DateTime(2016, 02, 22),
  //               open: 98.0237,
  //               high: 98.0237,
  //               low: 98.0237,
  //               close: 98.0237),
  //           ChartSampleData(
  //               x: DateTime(2016, 02, 29),
  //               open: 99.86,
  //               high: 106.75,
  //               low: 99.65,
  //               close: 106.01),
  //           ChartSampleData(
  //               x: DateTime(2016, 03, 07),
  //               open: 102.39,
  //               high: 102.83,
  //               low: 100.15,
  //               close: 102.26),
  //           ChartSampleData(
  //               x: DateTime(2016, 03, 14),
  //               open: 101.91,
  //               high: 106.5,
  //               low: 101.78,
  //               close: 105.92),
  //           ChartSampleData(
  //               x: DateTime(2016, 03, 21),
  //               open: 105.93,
  //               high: 107.65,
  //               low: 104.89,
  //               close: 105.67),
  //           ChartSampleData(
  //               x: DateTime(2016, 03, 28),
  //               open: 106,
  //               high: 110.42,
  //               low: 104.88,
  //               close: 109.99),
  //           ChartSampleData(
  //               x: DateTime(2016, 04, 04),
  //               open: 110.42,
  //               high: 112.19,
  //               low: 108.121,
  //               close: 108.66),
  //           ChartSampleData(
  //               x: DateTime(2016, 04, 11),
  //               open: 108.97,
  //               high: 112.39,
  //               low: 108.66,
  //               close: 109.85),
  //           ChartSampleData(
  //               x: DateTime(2016, 04, 18),
  //               open: 108.89,
  //               high: 108.95,
  //               low: 104.62,
  //               close: 105.68),
  //           ChartSampleData(
  //               x: DateTime(2016, 04, 25),
  //               open: 105,
  //               high: 105.65,
  //               low: 92.51,
  //               close: 93.74),
  //           ChartSampleData(
  //               x: DateTime(2016, 05, 02),
  //               open: 93.965,
  //               high: 95.9,
  //               low: 91.85,
  //               close: 92.72),
  //           ChartSampleData(
  //               x: DateTime(2016, 05, 09),
  //               open: 93,
  //               high: 93.77,
  //               low: 89.47,
  //               close: 90.52),
  //           ChartSampleData(
  //               x: DateTime(2016, 05, 16),
  //               open: 92.39,
  //               high: 95.43,
  //               low: 91.65,
  //               close: 95.22),
  //           ChartSampleData(
  //               x: DateTime(2016, 05, 23),
  //               open: 95.87,
  //               high: 100.73,
  //               low: 95.67,
  //               close: 100.35),
  //           ChartSampleData(
  //               x: DateTime(2016, 05, 30),
  //               open: 99.6,
  //               high: 100.4,
  //               low: 96.63,
  //               close: 97.92),
  //           ChartSampleData(
  //               x: DateTime(2016, 06, 06),
  //               open: 97.99,
  //               high: 101.89,
  //               low: 97.55,
  //               close: 98.83),
  //           ChartSampleData(
  //               x: DateTime(2016, 06, 13),
  //               open: 98.69,
  //               high: 99.12,
  //               low: 95.3,
  //               close: 95.33),
  //           ChartSampleData(
  //               x: DateTime(2016, 06, 20),
  //               open: 96,
  //               high: 96.89,
  //               low: 92.65,
  //               close: 93.4),
  //           ChartSampleData(
  //               x: DateTime(2016, 06, 27),
  //               open: 93,
  //               high: 96.465,
  //               low: 91.5,
  //               close: 95.89),
  //           ChartSampleData(
  //               x: DateTime(2016, 07, 04),
  //               open: 95.39,
  //               high: 96.89,
  //               low: 94.37,
  //               close: 96.68),
  //           ChartSampleData(
  //               x: DateTime(2016, 07, 11),
  //               open: 96.75,
  //               high: 99.3,
  //               low: 96.73,
  //               close: 98.78),
  //           ChartSampleData(
  //               x: DateTime(2016, 07, 18),
  //               open: 98.7,
  //               high: 101,
  //               low: 98.31,
  //               close: 98.66),
  //           ChartSampleData(
  //               x: DateTime(2016, 07, 25),
  //               open: 98.25,
  //               high: 104.55,
  //               low: 96.42,
  //               close: 104.21),
  //           ChartSampleData(
  //               x: DateTime(2016, 08),
  //               open: 104.41,
  //               high: 107.65,
  //               low: 104,
  //               close: 107.48),
  //           ChartSampleData(
  //               x: DateTime(2016, 08, 08),
  //               open: 107.52,
  //               high: 108.94,
  //               low: 107.16,
  //               close: 108.18),
  //           ChartSampleData(
  //               x: DateTime(2016, 08, 15),
  //               open: 108.14,
  //               high: 110.23,
  //               low: 108.08,
  //               close: 109.36),
  //           ChartSampleData(
  //               x: DateTime(2016, 08, 22),
  //               open: 108.86,
  //               high: 109.32,
  //               low: 106.31,
  //               close: 106.94),
  //           ChartSampleData(
  //               x: DateTime(2016, 08, 29),
  //               open: 106.62,
  //               high: 108,
  //               low: 105.5,
  //               close: 107.73),
  //           ChartSampleData(
  //               x: DateTime(2016, 09, 05),
  //               open: 107.9,
  //               high: 108.76,
  //               low: 103.13,
  //               close: 103.13),
  //           ChartSampleData(
  //               x: DateTime(2016, 09, 12),
  //               open: 102.65,
  //               high: 116.13,
  //               low: 102.53,
  //               close: 114.92),
  //           ChartSampleData(
  //               x: DateTime(2016, 09, 19),
  //               open: 115.19,
  //               high: 116.18,
  //               low: 111.55,
  //               close: 112.71),
  //           ChartSampleData(
  //               x: DateTime(2016, 09, 26),
  //               open: 111.64,
  //               high: 114.64,
  //               low: 111.55,
  //               close: 113.05),
  //           ChartSampleData(
  //               x: DateTime(2016, 10, 03),
  //               open: 112.71,
  //               high: 114.56,
  //               low: 112.28,
  //               close: 114.06),
  //           ChartSampleData(
  //               x: DateTime(2016, 10, 10),
  //               open: 115.02,
  //               high: 118.69,
  //               low: 114.72,
  //               close: 117.63),
  //           ChartSampleData(
  //               x: DateTime(2016, 10, 17),
  //               open: 117.33,
  //               high: 118.21,
  //               low: 113.8,
  //               close: 116.6),
  //           ChartSampleData(
  //               x: DateTime(2016, 10, 24),
  //               open: 117.1,
  //               high: 118.36,
  //               low: 113.31,
  //               close: 113.72),
  //           ChartSampleData(
  //               x: DateTime(2016, 10, 31),
  //               open: 113.65,
  //               high: 114.23,
  //               low: 108.11,
  //               close: 108.84),
  //           ChartSampleData(
  //               x: DateTime(2016, 11, 07),
  //               open: 110.08,
  //               high: 111.72,
  //               low: 105.83,
  //               close: 108.43),
  //           ChartSampleData(
  //               x: DateTime(2016, 11, 14),
  //               open: 107.71,
  //               high: 110.54,
  //               low: 104.08,
  //               close: 110.06),
  //           ChartSampleData(
  //               x: DateTime(2016, 11, 21),
  //               open: 115.42,
  //               high: 115.42,
  //               low: 115.42,
  //               close: 115.42),
  //           ChartSampleData(
  //               x: DateTime(2016, 11, 28),
  //               open: 111.43,
  //               high: 112.465,
  //               low: 108.85,
  //               close: 109.9),
  //           ChartSampleData(
  //               x: DateTime(2016, 12, 05),
  //               open: 110,
  //               high: 114.7,
  //               low: 108.25,
  //               close: 113.95),
  //           ChartSampleData(
  //               x: DateTime(2016, 12, 12),
  //               open: 113.29,
  //               high: 116.73,
  //               low: 112.49,
  //               close: 115.97),
  //           ChartSampleData(
  //               x: DateTime(2016, 12, 19),
  //               open: 115.8,
  //               high: 117.5,
  //               low: 115.59,
  //               close: 116.52),
  //           ChartSampleData(
  //               x: DateTime(2016, 12, 26),
  //               open: 116.52,
  //               high: 118.0166,
  //               low: 115.43,
  //               close: 115.82),
  //         ],
  //         name: 'AAPL',
  //         showIndicationForSameValues: _toggleVisibility,
  //         xValueMapper: (ChartSampleData sales, _) => sales.x as DateTime,

  //         /// High, low, open and close values used to render the HLOC series.
  //         lowValueMapper: (ChartSampleData sales, _) => sales.low,
  //         highValueMapper: (ChartSampleData sales, _) => sales.high,
  //         openValueMapper: (ChartSampleData sales, _) => sales.open,
  //         closeValueMapper: (ChartSampleData sales, _) => sales.close)
  //   ];
  // }

  Widget container1(constraints) {
    return constraints < 600
        ? StatefulBuilder(
            builder: (context, setState) {
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: notifire.getbgcolor11,
                  elevation: 0,
                  iconTheme: IconThemeData(color: notifire.getblackcolor),
                  leading: SizedBox(
                    height: 20,
                    child: Builder(
                      builder: (BuildContext context) {
                        return Container(
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: notifire.getgrey1)),
                          child: Center(
                            child: IconButton(
                              icon: Icon(
                                Icons.arrow_back_outlined, size: 18,
                                color: notifire
                                    .getblackcolor, // Change Custom Drawer Icon Color
                              ),
                              onPressed: () {
                                Get.back();
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  actions: [
                    PopupMenuButton(
                      tooltip: '',
                      offset: const Offset(0, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      initialValue: selectedMenu,
                      elevation: 1,
                      splashRadius: 1,
                      constraints: const BoxConstraints(
                        maxWidth: 200,
                        minWidth: 200,
                      ),
                      shadowColor: Colors.grey,
                      color: notifire.getbgcolor11,
                      child: SvgPicture.asset('assets/globe 01.svg',
                          height: 20, color: Neutral),
                      itemBuilder: (context) => <PopupMenuEntry<SampleItem>>[
                        PopupMenuItem(
                            height: 35,
                            padding: const EdgeInsets.all(12),
                            enabled: false,
                            value: SampleItem.itemOne,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  'Choose Language',
                                  style: TextStyle(
                                      fontFamily: 'InterRegular',
                                      fontSize: 14,
                                      color: Color(0xff727880),
                                      fontWeight: FontWeight.w600),
                                ),
                                Divider(
                                  color: notifire.getgrey1,
                                ),
                                ListView.separated(
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {},
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  model().Popo2[index],
                                                  style: TextStyle(
                                                    color:
                                                        notifire.getblackcolor,
                                                    fontSize: 14,
                                                    fontFamily: 'InterRegular',
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return Divider(
                                        color: notifire.getgrey1,
                                      );
                                    },
                                    itemCount: model().Popo2.length)
                              ],
                            ))
                      ],
                    ),
                    const Flexible(child: SizedBox(width: 15)),
                    InkWell(
                        onTap: () {
                          setState(() {
                            if (notifire.isDark) {
                              notifire.setIsDark = isdark;
                            } else {
                              notifire.setIsDark = !isdark;
                            }
                          });
                        },
                        child: notifire.isDark
                            ? SvgPicture.asset(
                                'assets/sun.svg',
                                color: Neutral,
                                height: 20,
                              )
                            : SvgPicture.asset(
                                'assets/night mode.svg',
                                color: Neutral,
                                height: 20,
                              )),
                    const Flexible(child: SizedBox(width: 15)),
                    PopupMenuButton(
                      tooltip: '',
                      offset: const Offset(0, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      initialValue: selectedMenu,
                      elevation: 1,
                      splashRadius: 1,
                      constraints: const BoxConstraints(
                        maxWidth: 300,
                        minWidth: 300,
                      ),
                      shadowColor: Colors.grey,
                      color: notifire.getbgcolor11,
                      child: SvgPicture.asset('assets/envelope.svg',
                          height: 20, color: Neutral),
                      itemBuilder: (context) => <PopupMenuEntry<SampleItem>>[
                        PopupMenuItem(
                            height: 35,
                            padding: const EdgeInsets.all(12),
                            enabled: false,
                            value: SampleItem.itemOne,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      'Notifications (03)',
                                      style: TextStyle(
                                          fontFamily: 'InterRegular',
                                          fontSize: 14,
                                          color: Color(0xff727880)),
                                    ),
                                    const Spacer(),
                                    InkWell(
                                        onTap: () {},
                                        child: const Text(
                                          'Mark all as read',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'InterRegular',
                                            color: Color(0xff595FE5),
                                          ),
                                        ))
                                  ],
                                ),
                                const Divider(
                                  color: Color(0xffEEEEEE),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: ListView.separated(
                                      shrinkWrap: true,
                                      itemCount: model().Popo.length,
                                      itemBuilder: (context, index) {
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Image.asset(
                                              model().Popo[index],
                                              height: 32,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(model().Popo1[index],
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'InterRegular',
                                                          color: notifire
                                                              .getblackcolor,
                                                        )),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      model().popo2[index],
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        fontFamily:
                                                            'InterRegular',
                                                        color: notifire
                                                            .getblackcolor,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Text(model().popo1[index],
                                                    style: TextStyle(
                                                      fontFamily:
                                                          'InterRegular',
                                                      fontSize: 12,
                                                      color: notifire
                                                          .getblackcolor,
                                                    )),
                                              ],
                                            ),
                                            const Spacer(),
                                            Container(
                                              height: 10,
                                              width: 10,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                  color:
                                                      const Color(0xff595FE5)),
                                            )
                                          ],
                                        );
                                      },
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return Divider(
                                          color: notifire.getgrey1,
                                        );
                                      }),
                                ),
                                Divider(
                                  color: notifire.getgrey1,
                                ),
                                const Center(
                                    child: Text(
                                  'View All Messages',
                                  style: TextStyle(
                                      fontFamily: 'InterRegular',
                                      fontSize: 14,
                                      color: Color(0xff595FE5)),
                                )),
                              ],
                            ))
                      ],
                    ),
                    const Flexible(child: SizedBox(width: 15)),
                    PopupMenuButton(
                      tooltip: '',
                      offset: const Offset(0, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      initialValue: selectedMenu,
                      elevation: 1,
                      splashRadius: 1,
                      constraints: const BoxConstraints(
                        maxWidth: 300,
                        minWidth: 300,
                      ),
                      shadowColor: Colors.grey,
                      color: notifire.getbgcolor11,
                      child: SvgPicture.asset('assets/bell.svg',
                          color: Neutral, height: 20),
                      itemBuilder: (context) => <PopupMenuEntry<SampleItem>>[
                        PopupMenuItem(
                            height: 35,
                            padding: const EdgeInsets.all(12),
                            enabled: false,
                            value: SampleItem.itemOne,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      'Notifications (03)',
                                      style: TextStyle(
                                          fontFamily: 'InterRegular',
                                          fontSize: 14,
                                          color: Color(0xff727880)),
                                    ),
                                    const Spacer(),
                                    InkWell(
                                        onTap: () {},
                                        child: const Text(
                                          'Clear All',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'InterRegular',
                                            color: Color(0xff595FE5),
                                          ),
                                        ))
                                  ],
                                ),
                                Divider(
                                  color: notifire.getgrey1,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: ListView.separated(
                                      shrinkWrap: true,
                                      itemCount: model().popo.length,
                                      itemBuilder: (context, index) {
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(12),
                                              decoration: BoxDecoration(
                                                  color: notifire.getbgcolor10,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: Center(
                                                  child: Image.asset(
                                                model().popo[index],
                                                height: 16,
                                                color: notifire.getblackcolor,
                                              )),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(model().popo1[index],
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontFamily:
                                                          'InterRegular',
                                                      color: notifire
                                                          .getblackcolor,
                                                    )),
                                                Text(model().popo2[index],
                                                    style: TextStyle(
                                                      fontFamily:
                                                          'InterRegular',
                                                      fontSize: 12,
                                                      color: notifire
                                                          .getblackcolor,
                                                    )),
                                              ],
                                            ),
                                            const Spacer(),
                                            Container(
                                              height: 10,
                                              width: 10,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                  color:
                                                      const Color(0xff595FE5)),
                                            )
                                          ],
                                        );
                                      },
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return Divider(
                                          color: notifire.getgrey1,
                                        );
                                      }),
                                ),
                                Divider(
                                  color: notifire.getgrey1,
                                ),
                                const Center(
                                    child: Text(
                                  'See All Notifications',
                                  style: TextStyle(
                                      fontFamily: 'InterRegular',
                                      fontSize: 14,
                                      color: Color(0xff595FE5)),
                                )),
                              ],
                            ))
                      ],
                    ),
                    const Flexible(child: SizedBox(width: 10)),
                    PopupMenuButton<SampleItem>(
                      tooltip: '',
                      offset: const Offset(0, 40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      initialValue: selectedMenu,
                      elevation: 1,
                      constraints: const BoxConstraints(
                        maxWidth: 200,
                        minWidth: 200,
                      ),
                      shadowColor: Colors.grey,
                      color: notifire.getbgcolor11,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child:
                            Center(child: Image.asset('assets/avatar-6 1.png')),
                      ),
                      onSelected: (SampleItem item) {
                        setState(() {
                          selectedMenu = item;
                        });
                      },
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<SampleItem>>[
                        PopupMenuItem(
                            padding: EdgeInsets.zero,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        'assets/avatar-6 1.png',
                                        height: 40,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Ronald Richards',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'InterRegular',
                                              color: notifire.getblackcolor,
                                            ),
                                          ),
                                          const Text(
                                            'Admin',
                                            style: TextStyle(
                                                fontFamily: 'InterRegular',
                                                fontSize: 12,
                                                color: Color(0xff9DA2A7)),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Divider(
                                  color: notifire.getgrey1,
                                ),
                              ],
                            )),
                        PopupMenuItem<SampleItem>(
                          padding: const EdgeInsets.all(10),
                          height: 35,
                          enabled: false,
                          value: SampleItem.itemThree,
                          child: InkWell(
                            onTap: () {
                              inboxController.setTextIsTrue(34);
                            },
                            child: Row(
                              children: [
                                SvgPicture.asset('assets/user-alt.svg',
                                    color: notifire.getblackcolor, height: 18),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'My account',
                                  style: TextStyle(
                                      fontFamily: 'InterRegular',
                                      color: notifire.getblackcolor,
                                      fontSize: 15),
                                )
                              ],
                            ),
                          ),
                        ),
                        PopupMenuItem<SampleItem>(
                          padding: const EdgeInsets.all(10),
                          height: 35,
                          enabled: false,
                          value: SampleItem.itemTwo,
                          child: InkWell(
                            onTap: () {
                              inboxController.setTextIsTrue(37);
                            },
                            child: Row(
                              children: [
                                SvgPicture.asset('assets/settings.svg',
                                    color: notifire.getblackcolor, height: 18),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Setting',
                                  style: TextStyle(
                                      color: notifire.getblackcolor,
                                      fontSize: 15,
                                      fontFamily: 'InterRegular'),
                                )
                              ],
                            ),
                          ),
                        ),
                        PopupMenuItem<SampleItem>(
                          padding: const EdgeInsets.all(10),
                          height: 35,
                          enabled: false,
                          value: SampleItem.itemTwo,
                          child: InkWell(
                            onTap: () {
                              inboxController.setTextIsTrue(29);
                            },
                            child: Row(
                              children: [
                                SvgPicture.asset('assets/info-circle.svg',
                                    color: notifire.getblackcolor, height: 18),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Support',
                                  style: TextStyle(
                                      color: notifire.getblackcolor,
                                      fontSize: 15,
                                      fontFamily: 'InterRegular'),
                                )
                              ],
                            ),
                          ),
                        ),
                        PopupMenuItem<SampleItem>(
                          padding: const EdgeInsets.all(10),
                          height: 35,
                          enabled: false,
                          value: SampleItem.itemTwo,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const login(),
                                  ));
                            },
                            child: Row(
                              children: [
                                SvgPicture.asset('assets/log-out.svg',
                                    color: notifire.getblackcolor, height: 18),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Sign out',
                                  style: TextStyle(
                                      color: notifire.getblackcolor,
                                      fontSize: 15,
                                      fontFamily: 'InterRegular'),
                                )
                              ],
                            ),
                          ),
                        ),
                        PopupMenuItem<SampleItem>(
                          padding: const EdgeInsets.all(8),
                          enabled: false,
                          value: SampleItem.itemfive,
                          child: StatefulBuilder(builder: (context, setState) {
                            return InkWell(
                              child: Row(
                                children: [
                                  SvgPicture.asset('assets/globe 01.svg',
                                      height: 20,
                                      color: notifire.getblackcolor),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text('RTL',
                                      style: TextStyle(
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular')),
                                  const Spacer(),
                                  Transform.translate(
                                      offset: const Offset(12, 0),
                                      child: switchButton()),
                                ],
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                    const Flexible(child: SizedBox(width: 5)),
                  ],
                  title: PopupMenuButton(
                    tooltip: '',
                    offset: const Offset(0, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    initialValue: selectedMenu,
                    elevation: 1,
                    splashRadius: 1,
                    shadowColor: Colors.grey,
                    color: notifire.getbgcolor11,
                    child: Image.asset('assets/search-normal.png',
                        height: 18, color: Neutral),
                    itemBuilder: (context) => <PopupMenuEntry<SampleItem>>[
                      PopupMenuItem(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          enabled: false,
                          value: SampleItem.itemOne,
                          child: Container(
                            height: 45,
                            decoration: BoxDecoration(
                                color: notifire.Getblg2,
                                borderRadius: BorderRadius.circular(6)),
                            child: TextField(
                              style: TextStyle(color: notifire.getblackcolor),
                              decoration: InputDecoration(
                                hintText: 'Search',
                                prefixIcon: Image.asset(
                                    'assets/search-normal.png',
                                    scale: 4,
                                    color: const Color(0xff9DA2A7)),
                                hintStyle:
                                    TextStyle(color: notifire.getblackcolor),
                                contentPadding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: BorderSide(color: grey2)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(6)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: blue),
                                    borderRadius: BorderRadius.circular(6)),
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
                backgroundColor: notifire.getbgcolor10,
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: notifire.getbgcolor11,
                      ),
                      padding: const EdgeInsets.all(14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Text(' Activities',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: notifire.getblackcolor,
                                      fontFamily: 'InterRegular')),
                            ],
                          ),
                          Transform.translate(
                            offset: const Offset(0, -30),
                            child: Column(
                              children: [
                                TimelineTile(
                                  isFirst: true,
                                  hasIndicator: true,
                                  endChild: Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, top: 40),
                                          child: Transform.translate(
                                            offset: const Offset(0, 12),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Contrary to\npopular belief is\nnot simply",
                                                      style: TextStyle(
                                                        fontFamily:
                                                            "InterRegular",
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: notifire
                                                            .getblackcolor,
                                                      ),
                                                    ),
                                                    const Spacer(),
                                                    Transform.translate(
                                                      offset: const Offset(
                                                          -22, -15),
                                                      child: Container(
                                                        width: 40,
                                                        height: 40,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                            color: const Color(
                                                                0xffFAEBEC)),
                                                        child: const Center(
                                                            child: Text(
                                                          'FR',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontFamily:
                                                                  'InterRegular'),
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
                                                            color: Color(
                                                                0xff727880),
                                                            fontFamily:
                                                                'InterRegular')),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      'IOS Mobile Ver 2.0',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xff595FE5),
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'InterRegular'),
                                                    )
                                                  ],
                                                ),
                                                const Text(
                                                  "3 minutes ago",
                                                  style: TextStyle(
                                                      fontFamily:
                                                          "InterRegular",
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
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
                                  beforeLineStyle: LineStyle(
                                      color: notifire.getbgcolor10,
                                      thickness: 2),
                                  indicatorStyle: IndicatorStyle(
                                    height: 36,
                                    width: 36,
                                    indicator: Container(
                                        width: 60,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
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
                                TimelineTile(
                                  endChild: Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, top: 40),
                                          child: Transform.translate(
                                            offset: const Offset(0, 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "draft copy can\nsend your design\noff the rails ",
                                                      style: TextStyle(
                                                        fontFamily:
                                                            "InterRegular",
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: notifire
                                                            .getblackcolor,
                                                      ),
                                                    ),
                                                    const Spacer(),
                                                    Transform.translate(
                                                      offset: const Offset(
                                                          -22, -15),
                                                      child: Container(
                                                        width: 40,
                                                        height: 40,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                            color: const Color(
                                                                0xffFAEBEC)),
                                                        child: const Center(
                                                            child: Text(
                                                          'WR',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
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
                                                            color: Color(
                                                                0xff727880),
                                                            fontFamily:
                                                                'InterRegular')),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      'Web Demo',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xff595FE5),
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'InterRegular'),
                                                    )
                                                  ],
                                                ),
                                                const Text(
                                                  "3 minutes ago",
                                                  style: TextStyle(
                                                      fontFamily:
                                                          "InterRegular",
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Color(0xff9DA2A7)),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  beforeLineStyle: LineStyle(
                                      color: notifire.getbgcolor10,
                                      thickness: 2),
                                  indicatorStyle: IndicatorStyle(
                                    height: 36,
                                    width: 36,
                                    indicator: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            color: notifire.getbgcolor10,
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        child: Center(
                                            child: Image.asset(
                                          "assets/message-text.png",
                                          width: 16,
                                          height: 16,
                                        ))),
                                  ),
                                ),
                                TimelineTile(
                                  endChild: Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, top: 40),
                                          child: Transform.translate(
                                            offset: const Offset(0, 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "May a cusstums\noffficer somewon\nof a poison-filled ",
                                                      style: TextStyle(
                                                        fontFamily:
                                                            "InterRegular",
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: notifire
                                                            .getblackcolor,
                                                      ),
                                                    ),
                                                    const Spacer(),
                                                    Transform.translate(
                                                      offset: const Offset(
                                                          -22, -15),
                                                      child: Container(
                                                        width: 40,
                                                        height: 40,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                            color: const Color(
                                                                0xffFAEBEC)),
                                                        child: const Center(
                                                            child: Text(
                                                          'PR',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
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
                                                            color: Color(
                                                                0xff727880),
                                                            fontFamily:
                                                                'InterRegular')),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      'Android Mobile App',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xff595FE5),
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'InterRegular'),
                                                    )
                                                  ],
                                                ),
                                                const Text(
                                                  "3 minutes ago",
                                                  style: TextStyle(
                                                      fontFamily:
                                                          "InterRegular",
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Color(0xff9DA2A7)),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  beforeLineStyle: LineStyle(
                                      color: notifire.getbgcolor10,
                                      thickness: 2),
                                  indicatorStyle: IndicatorStyle(
                                    height: 36,
                                    width: 36,
                                    indicator: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            color: notifire.getbgcolor10,
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        child: Center(
                                            child: Image.asset(
                                                "assets/tick-circle.png",
                                                width: 16,
                                                height: 16))),
                                  ),
                                ),
                                TimelineTile(
                                  endChild: Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, top: 40),
                                          child: Transform.translate(
                                            offset: const Offset(0, 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "shoreditch direct\ntrade four dollar\ntoast copper mug",
                                                      style: TextStyle(
                                                        fontFamily:
                                                            "InterRegular",
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: notifire
                                                            .getblackcolor,
                                                      ),
                                                    ),
                                                    const Spacer(),
                                                    Transform.translate(
                                                      offset: const Offset(
                                                          -22, -15),
                                                      child: Container(
                                                        width: 40,
                                                        height: 40,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                            color: const Color(
                                                                0xffFAEBEC)),
                                                        child: const Center(
                                                            child: Text(
                                                          'PR',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
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
                                                            color: Color(
                                                                0xff727880),
                                                            fontFamily:
                                                                'InterRegular')),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      'IOS Mobile Ver 2.0',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xff595FE5),
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'InterRegular'),
                                                    )
                                                  ],
                                                ),
                                                const Text(
                                                  "3 minutes ago",
                                                  style: TextStyle(
                                                      fontFamily:
                                                          "InterRegular",
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Color(0xff9DA2A7)),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  beforeLineStyle: LineStyle(
                                      color: notifire.getbgcolor10,
                                      thickness: 2),
                                  indicatorStyle: IndicatorStyle(
                                    height: 36,
                                    width: 36,
                                    indicator: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            color: notifire.getbgcolor10,
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        child: Center(
                                            child: Image.asset(
                                                "assets/arrange-circle-2.png",
                                                width: 16,
                                                height: 16))),
                                  ),
                                ),
                                TimelineTile(
                                  endChild: Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, top: 40),
                                          child: Transform.translate(
                                            offset: const Offset(0, 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Fully unlicensed\nlegalese those times\ndon't want to pay ",
                                                      style: TextStyle(
                                                        fontFamily:
                                                            "InterRegular",
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: notifire
                                                            .getblackcolor,
                                                      ),
                                                    ),
                                                    const Spacer(),
                                                    Transform.translate(
                                                      offset: const Offset(
                                                          -22, -15),
                                                      child: Container(
                                                        width: 40,
                                                        height: 40,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                            color: const Color(
                                                                0xffFAEBEC)),
                                                        child: const Center(
                                                            child: Text(
                                                          'PR',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
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
                                                            color: Color(
                                                                0xff727880),
                                                            fontFamily:
                                                                'InterRegular')),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      'Android Mobile App',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xff595FE5),
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'InterRegular'),
                                                    )
                                                  ],
                                                ),
                                                const Text(
                                                  "3 minutes ago",
                                                  style: TextStyle(
                                                      fontFamily:
                                                          "InterRegular",
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Color(0xff9DA2A7)),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  beforeLineStyle: LineStyle(
                                      color: notifire.getbgcolor10,
                                      thickness: 2),
                                  indicatorStyle: IndicatorStyle(
                                    height: 36,
                                    width: 36,
                                    indicator: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            color: notifire.getbgcolor10,
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        child: Center(
                                            child: Image.asset(
                                                "assets/message-text.png",
                                                width: 16,
                                                height: 16))),
                                  ),
                                ),
                                TimelineTile(
                                  endChild: Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, top: 40),
                                          child: Transform.translate(
                                            offset: const Offset(0, 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      " Select how many\nparagraphs you want\ncopy paste",
                                                      style: TextStyle(
                                                        fontFamily:
                                                            "InterRegular",
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: notifire
                                                            .getblackcolor,
                                                      ),
                                                    ),
                                                    const Spacer(),
                                                    Transform.translate(
                                                      offset: const Offset(
                                                          -22, -15),
                                                      child: Container(
                                                        width: 40,
                                                        height: 40,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                            color: const Color(
                                                                0xffFAEBEC)),
                                                        child: const Center(
                                                            child: Text(
                                                          'WR',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
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
                                                            color: Color(
                                                                0xff727880),
                                                            fontFamily:
                                                                'InterRegular')),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      'Web Demo',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xff595FE5),
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'InterRegular'),
                                                    )
                                                  ],
                                                ),
                                                const Text(
                                                  "3 minutes ago",
                                                  style: TextStyle(
                                                      fontFamily:
                                                          "InterRegular",
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Color(0xff9DA2A7)),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  beforeLineStyle: LineStyle(
                                      color: notifire.getbgcolor10,
                                      thickness: 2),
                                  indicatorStyle: IndicatorStyle(
                                    height: 36,
                                    width: 36,
                                    indicator: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            color: notifire.getbgcolor10,
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        child: Center(
                                            child: Image.asset(
                                                "assets/message-text.png",
                                                width: 16,
                                                height: 16))),
                                  ),
                                ),
                                TimelineTile(
                                  endChild: Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, top: 40),
                                          child: Transform.translate(
                                            offset: const Offset(0, 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "May a cusstums\noffficer somewon\nof a poison-filled ",
                                                      style: TextStyle(
                                                        fontFamily:
                                                            "InterRegular",
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: notifire
                                                            .getblackcolor,
                                                      ),
                                                    ),
                                                    const Spacer(),
                                                    Transform.translate(
                                                      offset: const Offset(
                                                          -22, -15),
                                                      child: Container(
                                                        width: 40,
                                                        height: 40,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                            color: const Color(
                                                                0xffFAEBEC)),
                                                        child: const Center(
                                                            child: Text(
                                                          'PR',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
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
                                                            color: Color(
                                                                0xff727880),
                                                            fontFamily:
                                                                'InterRegular')),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      'Android Mobile App',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xff595FE5),
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'InterRegular'),
                                                    )
                                                  ],
                                                ),
                                                const Text(
                                                  "3 minutes ago",
                                                  style: TextStyle(
                                                      fontFamily:
                                                          "InterRegular",
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Color(0xff9DA2A7)),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  beforeLineStyle: LineStyle(
                                      color: notifire.getbgcolor10,
                                      thickness: 2),
                                  indicatorStyle: IndicatorStyle(
                                    height: 36,
                                    width: 36,
                                    indicator: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            color: notifire.getbgcolor10,
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        child: Center(
                                            child: Image.asset(
                                                "assets/tick-circle.png",
                                                width: 16,
                                                height: 16))),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          )
        : Flexible(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: notifire.getbgcolor11),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Text(' Activities',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: notifire.getblackcolor,
                                fontFamily: 'InterRegular')),
                      ],
                    ),
                    Transform.translate(
                      offset: const Offset(0, -30),
                      child: Column(
                        children: [
                          TimelineTile(
                            isFirst: true,
                            hasIndicator: true,
                            endChild: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 40),
                                    child: Transform.translate(
                                      offset: const Offset(0, 12),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                          BorderRadius.circular(
                                                              30),
                                                      color: const Color(
                                                          0xffFAEBEC)),
                                                  child: const Center(
                                                      child: Text(
                                                    'FR',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily:
                                                            'InterRegular'),
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
                                                      fontFamily:
                                                          'InterRegular')),
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
                            beforeLineStyle: LineStyle(
                                color: notifire.getbgcolor10, thickness: 2),
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
                          TimelineTile(
                            endChild: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 40),
                                    child: Transform.translate(
                                      offset: const Offset(0, 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                          BorderRadius.circular(
                                                              30),
                                                      color: const Color(
                                                          0xffFAEBEC)),
                                                  child: const Center(
                                                      child: Text(
                                                    'WR',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
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
                                                      fontFamily:
                                                          'InterRegular')),
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
                            beforeLineStyle: LineStyle(
                                color: notifire.getbgcolor10, thickness: 2),
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
                          TimelineTile(
                            endChild: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 40),
                                    child: Transform.translate(
                                      offset: const Offset(0, 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                          BorderRadius.circular(
                                                              30),
                                                      color: const Color(
                                                          0xffFAEBEC)),
                                                  child: const Center(
                                                      child: Text(
                                                    'PR',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
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
                                                      fontFamily:
                                                          'InterRegular')),
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
                            beforeLineStyle: LineStyle(
                                color: notifire.getbgcolor10, thickness: 2),
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
                                          "assets/tick-circle.png",
                                          width: 16,
                                          height: 16))),
                            ),
                          ),
                          TimelineTile(
                            endChild: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 40),
                                    child: Transform.translate(
                                      offset: const Offset(0, 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                          BorderRadius.circular(
                                                              30),
                                                      color: const Color(
                                                          0xffFAEBEC)),
                                                  child: const Center(
                                                      child: Text(
                                                    'PR',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
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
                                                      fontFamily:
                                                          'InterRegular')),
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
                            beforeLineStyle: LineStyle(
                                color: notifire.getbgcolor10, thickness: 2),
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
                          TimelineTile(
                            endChild: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 40),
                                    child: Transform.translate(
                                      offset: const Offset(0, 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                          BorderRadius.circular(
                                                              30),
                                                      color: const Color(
                                                          0xffFAEBEC)),
                                                  child: const Center(
                                                      child: Text(
                                                    'PR',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
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
                                                      fontFamily:
                                                          'InterRegular')),
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
                            beforeLineStyle: LineStyle(
                                color: notifire.getbgcolor10, thickness: 2),
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
                                          height: 16))),
                            ),
                          ),
                          TimelineTile(
                            endChild: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 40),
                                    child: Transform.translate(
                                      offset: const Offset(0, 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                          BorderRadius.circular(
                                                              30),
                                                      color: const Color(
                                                          0xffFAEBEC)),
                                                  child: const Center(
                                                      child: Text(
                                                    'WR',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
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
                                                      fontFamily:
                                                          'InterRegular')),
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
                            beforeLineStyle: LineStyle(
                                color: notifire.getbgcolor10, thickness: 2),
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
                                          height: 16))),
                            ),
                          ),
                          TimelineTile(
                            endChild: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 40),
                                    child: Transform.translate(
                                      offset: const Offset(0, 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                          BorderRadius.circular(
                                                              30),
                                                      color: const Color(
                                                          0xffFAEBEC)),
                                                  child: const Center(
                                                      child: Text(
                                                    'PR',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
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
                                                      fontFamily:
                                                          'InterRegular')),
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
                            beforeLineStyle: LineStyle(
                                color: notifire.getbgcolor10, thickness: 2),
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
                                          "assets/tick-circle.png",
                                          width: 16,
                                          height: 16))),
                            ),
                          ),
                          TimelineTile(
                            endChild: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 40),
                                    child: Transform.translate(
                                      offset: const Offset(0, 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                          BorderRadius.circular(
                                                              30),
                                                      color: const Color(
                                                          0xffFAEBEC)),
                                                  child: const Center(
                                                      child: Text(
                                                    'PR',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
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
                                                      fontFamily:
                                                          'InterRegular')),
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
                            beforeLineStyle: LineStyle(
                                color: notifire.getbgcolor10, thickness: 2),
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
                                          height: 16))),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }

  Widget switchButton() {
    return StatefulBuilder(
      builder: (context, setState) {
        return Transform.scale(
          scale: 0.6,
          child: CupertinoSwitch(
            trackColor: const Color(0xffE0E0E0),
            activeColor: const Color(0xff595FE5),
            thumbColor: Colors.white,
            value: rtl,
            onChanged: (bool value) {
              setState(() {
                rtl = value;
              });
              Future.delayed(
                const Duration(milliseconds: 300),
                () {
                  if (value == true) {
                    Get.updateLocale(const Locale('ur', 'PK'));
                    Get.back();
                  } else {
                    Get.updateLocale(const Locale('en', 'US'));
                    Get.back();
                  }
                },
              );
            },
          ),
        );
      },
    );
  }

  @override
  void initState() {
    _toggleVisibility = true;
    // _trackballBehavior = TrackballBehavior(
    //     enable: true, activationMode: ActivationMode.singleTap);
    super.initState();
  }

  TableRow dividerTable(
    BuildContext context,
  ) {
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
