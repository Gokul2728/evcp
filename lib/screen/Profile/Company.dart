// ignore_for_file: file_names

import 'dart:math';
// ignore_for_file: deprecated_member_use
import 'package:fl_chart/fl_chart.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:textfield_tags/textfield_tags.dart';


import '../../confing/colors.dart';

import '../../confing/list.dart';
import '../../confing/notifier.dart';
import '../../controller/page_controller.dart';
import '../Dashboard/Dashboard_main.dart';

class _LineChart extends StatelessWidget {
  const _LineChart({required this.isShowingMainData});

  final bool isShowingMainData;

  @override
  Widget build(BuildContext context) {
    return LineChart(
      isShowingMainData ? sampleData1 : sampleData2,
      duration: const Duration(milliseconds: 250),
    );
  }

  LineChartData get sampleData1 => LineChartData(
    lineTouchData: lineTouchData1,
    gridData: gridData,
    titlesData: titlesData1,
    borderData: borderData,
    lineBarsData: lineBarsData1,
    minX: 0,
    maxX: 14,
    maxY: 4,
    minY: 0,
  );

  LineChartData get sampleData2 => LineChartData(
    lineTouchData: lineTouchData2,
    gridData: gridData,
    titlesData: titlesData2,
    borderData: borderData,
    lineBarsData: lineBarsData2,
    minX: 0,
    maxX: 14,
    maxY: 6,
    minY: 0,
  );

  LineTouchData get lineTouchData1 => LineTouchData(
    handleBuiltInTouches: true,
    touchTooltipData: LineTouchTooltipData(
      tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
    ),
  );

  FlTitlesData get titlesData1 => FlTitlesData(
    bottomTitles: AxisTitles(
      sideTitles: bottomTitles,
    ),
    rightTitles: const AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
    topTitles: const AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
    leftTitles: AxisTitles(
      sideTitles: leftTitles(),
    ),
  );

  List<LineChartBarData> get lineBarsData1 => [
    lineChartBarData1_1,
    lineChartBarData1_2,
    lineChartBarData1_3,
  ];

  LineTouchData get lineTouchData2 => const LineTouchData(
    enabled: false,
  );

  FlTitlesData get titlesData2 => FlTitlesData(
    bottomTitles: AxisTitles(
      sideTitles: bottomTitles,
    ),
    rightTitles: const AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
    topTitles: const AxisTitles(
      sideTitles: SideTitles(showTitles: false),
    ),
    leftTitles: AxisTitles(
      sideTitles: leftTitles(),
    ),
  );

  List<LineChartBarData> get lineBarsData2 => [
    lineChartBarData2_1,
    lineChartBarData2_2,
    lineChartBarData2_3,
  ];

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    String text;
    switch (value.toInt()) {
      case 1:
        text = 'Y 01';
        break;
      case 2:
        text = 'Y 02';
        break;
      case 3:
        text = 'Y 03';
        break;
      case 4:
        text = 'Y 04';
        break;
      case 5:
        text = 'Y 05';
        break;
      default:
        return Container();
    }

    return Text(text,
        style: const TextStyle(
            color: Color(0XFF9DA2A7), fontSize: 10, fontFamily: 'InterRegular'),
        textAlign: TextAlign.center);
  }

  SideTitles leftTitles() => SideTitles(
    getTitlesWidget: leftTitleWidgets,
    showTitles: true,
    interval: 1,
    reservedSize: 40,
  );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = const Text('X 01',
            style: TextStyle(
                color: Color(0XFF9DA2A7),
                fontSize: 10,
                fontFamily: 'InterRegular'));
        break;
      case 7:
        text = const Text('X 02',
            style: TextStyle(
                color: Color(0XFF9DA2A7),
                fontSize: 10,
                fontFamily: 'InterRegular'));
        break;
      case 12:
        text = const Text('X 03',
            style: TextStyle(
                color: Color(0XFF9DA2A7),
                fontSize: 10,
                fontFamily: 'InterRegular'));
        break;
      default:
        text = const Text(
          '',
        );
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }

  SideTitles get bottomTitles => SideTitles(
    showTitles: true,
    reservedSize: 32,
    interval: 1,
    getTitlesWidget: bottomTitleWidgets,
  );

  FlGridData get gridData => const FlGridData(show: false);

  FlBorderData get borderData => FlBorderData(
    show: true,
    border: const Border(
      bottom: BorderSide(color: Colors.grey),
      left: BorderSide(color: Colors.transparent),
      right: BorderSide(color: Colors.transparent),
      top: BorderSide(color: Colors.transparent),
    ),
  );

  LineChartBarData get lineChartBarData1_1 => LineChartBarData(
    isCurved: true,
    color: const Color(0xff9E57E5),
    barWidth: 4,
    isStrokeCapRound: true,
    dotData: const FlDotData(show: false),
    belowBarData: BarAreaData(show: false),
    spots: const [
      FlSpot(1, 1),
      FlSpot(3, 1.5),
      FlSpot(5, 1.4),
      FlSpot(7, 3.4),
      FlSpot(10, 2),
      FlSpot(12, 2.2),
      FlSpot(13, 1.8),
    ],
  );

  LineChartBarData get lineChartBarData1_2 => LineChartBarData(
    isCurved: true,
    color: const Color(0xff718fdd),
    barWidth: 4,
    isStrokeCapRound: true,
    dotData: const FlDotData(show: false),
    belowBarData: BarAreaData(
      show: false,
      color: Colors.yellow,
    ),
    spots: const [
      FlSpot(1, 1),
      FlSpot(3, 2.8),
      FlSpot(7, 1.2),
      FlSpot(10, 2.8),
      FlSpot(12, 2.6),
      FlSpot(13, 3.9),
    ],
  );

  LineChartBarData get lineChartBarData1_3 => LineChartBarData(
    isCurved: true,
    color: const Color(0xff59b4d1),
    barWidth: 4,
    isStrokeCapRound: true,
    dotData: const FlDotData(show: false),
    belowBarData: BarAreaData(show: false),
    spots: const [
      FlSpot(1, 2.8),
      FlSpot(3, 1.9),
      FlSpot(6, 3),
      FlSpot(10, 1.3),
      FlSpot(13, 2.5),
    ],
  );

  LineChartBarData get lineChartBarData2_1 => LineChartBarData(
    isCurved: true,
    curveSmoothness: 0,
    color: const Color(0xff59b4d1),
    barWidth: 2,
    isStrokeCapRound: true,
    dotData: const FlDotData(show: false),
    belowBarData: BarAreaData(
      show: true,
      color: const Color(0xff59b4d1).withOpacity(0.5),
    ),
    spots: const [
      FlSpot(1, 1),
      FlSpot(3, 4),
      FlSpot(5, 1.8),
      FlSpot(7, 5),
      FlSpot(10, 2),
      FlSpot(12, 2.2),
      FlSpot(13, 1.8),
    ],
  );

  LineChartBarData get lineChartBarData2_2 => LineChartBarData(
    isCurved: true,
    color: const Color(0xff9E57E5),
    barWidth: 2,
    isStrokeCapRound: true,
    dotData: const FlDotData(show: false),
    belowBarData: BarAreaData(
      show: true,
      color: const Color(0xff9E57E5).withOpacity(0.5),
    ),
    spots: const [
      FlSpot(1, 1),
      FlSpot(3, 2.8),
      FlSpot(7, 1.2),
      FlSpot(10, 2.8),
      FlSpot(12, 2.6),
      FlSpot(13, 3.9),
    ],
  );

  LineChartBarData get lineChartBarData2_3 => LineChartBarData(
    isCurved: true,
    color: const Color(0xff718fdd),
    barWidth: 2,
    isStrokeCapRound: true,
    dotData: const FlDotData(show: true),
    belowBarData: BarAreaData(
      show: true,
      color: const Color(0xff718fdd).withOpacity(0.5),
    ),
    spots: const [
      FlSpot(1, 3.8),
      FlSpot(3, 1.9),
      FlSpot(6, 5),
      FlSpot(10, 3.3),
      FlSpot(13, 4.5),
    ],
  );
}

class Company extends StatefulWidget {
  const Company({super.key});

  final blue1 = Colors.blue;
  final blue2 = Colors.blueAccent;

  @override
  State<Company> createState() => _CompanyState();
}

class _CompanyState extends State<Company> {
  late bool isShowingMainData;

  @override
  void initState() {
    super.initState();
    isShowingMainData = true;
  }
  final maxX = 50.0;
  final maxY = 50.0;
  final radius = 8.0;
  SampleItem? selectedMenu;
  InboxController inboxController = Get.put(InboxController());


  bool showFlutter = true;
  late ColorNotifier notifire;
  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifier>(context, listen: true);
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return  Container(
              color: notifire.getbgcolor10,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      container(constraints.maxWidth)
                    ],
                  ),
                ),
              ),

          );
        }
        else if (constraints.maxWidth < 1000) {
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
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          firstContainer(
                              constraints: constraints.maxWidth,
                              context: context),
                        ],
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
              decoration:  BoxDecoration(
                  color: notifire.getbgcolor10
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          firstContainer(context: context,
                              constraints: constraints.maxWidth),
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
  final _stringTagController = StringTagController();
  Widget firstContainer({context, constraints}) {
    return Padding(
      padding: const EdgeInsets.only(right: 20,left: 20,bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Spacer(),
              SvgPicture.asset('assets/house-door.svg',height: 16,color: Colors.blue,),
              const SizedBox(width: 10,),
              InkWell(
                  onTap: () {
                    inboxController.setTextIsTrue(1);
                  },
                  child: Text('Dashboard',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: greyy,))),
              const SizedBox(width: 10,),
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: greyy,),),
              const SizedBox(width: 10,),
              Text('Profile',style: TextStyle(color: greyy,fontSize: 14,fontFamily: 'InterRegular'),),
              const SizedBox(width: 10,),
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: greyy,),),
              const SizedBox(width: 10,),
              Text('Company',style: TextStyle(color: notifire.getblackcolor,fontSize: 14,fontFamily: 'InterRegular'),),
            ],
          ),
          const SizedBox(height: 20,),
          container(constraints),
        ],),
    );
  }

  Widget container(constraints) {
    if (constraints < 600) {
      return Column(
      children: [
        Row(
          children: [
            const Spacer(),
            SvgPicture.asset('assets/house-door.svg',height: 16,color: Colors.blue,),
            const SizedBox(width: 10,),
            InkWell(
                onTap: () {
                  inboxController.setTextIsTrue(1);
                },
                child: Text('Dashboard',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: greyy,))),
            const SizedBox(width: 10,),
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: greyy,),),
            const SizedBox(width: 10,),
            Text('Profile',style: TextStyle(color: greyy,fontSize: 14,fontFamily: 'InterRegular'),),
            const SizedBox(width: 10,),
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: greyy,),),
            const SizedBox(width: 10,),
            Text('Company',style: TextStyle(color: notifire.getblackcolor,fontSize: 14,fontFamily: 'InterRegular'),),
          ],
        ),
        const SizedBox(height: 20,),
        Stack(
          children: [
            Column(
              children: [
                Container(
                  width: Get.width,
                  height: 160,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12)),
                      image: DecorationImage(
                          image: AssetImage('assets/Supehub_banner 1.png'),
                          fit: BoxFit.cover)),),
                Container(
                  padding: const EdgeInsets.all(20),
                  width: Get.width,
                  decoration:  BoxDecoration(
                      color: notifire.getbgcolor11,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),)
                  ),
                  child: Column(
                    children: [

                      const SizedBox(height: 30,),
                       Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Corporation', style: TextStyle(
                                  fontSize: 20,color: notifire.getblackcolor,
                                  fontFamily: 'InterRegular',
                                  fontWeight: FontWeight.w600),),
                              const Text('Freight and Package Transportation',
                                style: TextStyle(fontSize: 12,
                                    fontFamily: 'InterRegular',
                                    color: Color(0xff727880)),)
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                           Text('1,280,910 followers',
                              style: TextStyle(color: notifire.getblackcolor,
                                fontSize: 14, fontFamily: 'InterRegular',),textAlign: TextAlign.end),
                          const SizedBox(height: 10,),
                          Row(
                             mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {

                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: const Color(0xff595FE5),),
                                  child: const Text('All Jobs', style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'InterRegular',
                                      color: Colors.white,
                                      fontSize: 14)),
                                ),
                              ),
                              const SizedBox(width: 10,),
                              InkWell(
                                onTap: () {

                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                    color: notifire.getbgcolor10,),
                                  child: const Text('Follow', style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff727880),
                                    fontFamily: 'InterRegular',
                                    fontWeight: FontWeight.w500,)),
                                ),
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: () {

                                },
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                    color: notifire.getbgcolor10),
                                  child: Center(child: Image.asset(
                                      'assets/sms-tracking1.png', height: 16)),
                                ),
                              ),
                              const SizedBox(width: 10,),
                              InkWell(
                                onTap: () {

                                },
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                    color: notifire.getbgcolor10,),
                                  child: Center(child: Image.asset(
                                    'assets/more.png', height: 16,
                                    color: const Color(0xff727880),)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 105),
                  child: Image.asset(
                    'assets/Brand Logo24.png', height: 100,),
                ),
              ],
            )
          ],
        ),
        const SizedBox(height: 20,),
          Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

              Container( padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(color: notifire.getbgcolor11,borderRadius: BorderRadius.circular(12)),
                   child: Column(           mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text('Our Stories', style: TextStyle(
                        fontWeight: FontWeight.w600,color: notifire.getblackcolor,
                        fontFamily: 'InterRegular',
                        fontSize: 16,),),
                       const SizedBox(height: 10,),
                       Text(
                         'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.',
                         style: TextStyle(fontSize: 14,
                           fontFamily: 'InterRegular',
                           fontWeight: FontWeight.w400,
                           color: notifire.getblackcolor,),),
                       const SizedBox(height: 10,),
                       Text(
                         'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.',
                         style: TextStyle(fontSize: 14,
                           fontFamily: 'InterRegular',
                           fontWeight: FontWeight.w400,
                           color: notifire.getblackcolor,),),
                     ],
                   ),
                 ),

                const SizedBox(height: 20,),
                Container( padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(color: notifire.getbgcolor11,borderRadius: BorderRadius.circular(12)),
                   child: Column(           mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text('Employees', style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'InterRegular',color: notifire.getblackcolor,
                          fontSize: 16),),
                       const SizedBox(height: 20,),

                       GridView.builder(
                         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                           mainAxisExtent: 130,
                           crossAxisCount: 2,
                           crossAxisSpacing: 15,
                           mainAxisSpacing: 15,
                         ),
                         itemCount: model().so6.length,
                         shrinkWrap: true,
                         physics: const NeverScrollableScrollPhysics(),
                         itemBuilder: (context, index) {
                           return SizedBox(
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               mainAxisAlignment: MainAxisAlignment.start,
                               children: [
                                 SizedBox(
                                   width: 60,
                                   height: 60,
                                   child: CircleAvatar(
                                     backgroundImage: AssetImage(
                                         model().so6[index]),),
                                 ),
                                 const SizedBox(height: 10,),
                                 Text(model().so7[index], style:  TextStyle(
                                   fontSize: 14,color: notifire.getblackcolor,
                                   fontFamily: 'InterRegular',
                                   fontWeight: FontWeight.w500,),),
                                 // SizedBox(height: 10,),
                                 Text(model().so8[index], style: const TextStyle(
                                   fontFamily: 'InterRegular',
                                   fontSize: 12,
                                   color: Color(0xff9DA2A7),),),
                                 // Text()
                               ],
                             ),
                           );
                         },
                       ),
                       const SizedBox(height: 20,),
                       Container(
                         decoration: BoxDecoration(
    color: notifire.getbgcolor10,
                           borderRadius: BorderRadius.circular(12),),
                         width: 110,
                         padding: const EdgeInsets.all(12),
                         child: const Center(
                             child: Text('View More', style: TextStyle(
                                 fontWeight: FontWeight.w600,
                                 fontFamily: 'InterRegular',
                                 color: Color(0xff727880),
                                 fontSize: 12))),
                       ),
                     ],
                   ),
                 ),

                const SizedBox(height: 20,),
                Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      color: notifire.getbgcolor11,
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Row(
                            children: [
                              Text('Our growth',
                                  style: TextStyle(
                                    fontSize: 16,color: notifire.getblackcolor,
                                    fontFamily: 'InterRegular',
                                    fontWeight: FontWeight.w600,
                                  )),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'USD',
                            style: TextStyle(
                                fontFamily: 'InterRegular',
                                fontSize: 12,
                                color: Color(0xff727880)),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: Get.height * 0.4,
                            child: AspectRatio(
                              aspectRatio: 1.23,
                              child: Stack(
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .stretch,
                                    children: <Widget>[
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets
                                              .only(
                                              right: 16, left: 6),
                                          child: _LineChart(
                                              isShowingMainData: isShowingMainData),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.refresh,
                                      color: Colors.white.withOpacity(
                                          isShowingMainData
                                              ? 1.0
                                              : 0.5),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        isShowingMainData =
                                        !isShowingMainData;
                                      });
                                    },
                                  )
                                ],
                              ),
                            ),
                          ),
                        ])
                ),
                const SizedBox(height: 20,),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    color: notifire.getbgcolor11,
                  ),
                  child: SizedBox(
                    height: Get.height * 0.5,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          showFlutter = !showFlutter;
                        });
                      },
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: ScatterChart(
                          ScatterChartData(
                            scatterSpots: showFlutter ? flutterLogoData() : randomData(),
                            minX: 0,
                            maxX: maxX,
                            minY: 0,
                            maxY: maxY,
                            borderData: FlBorderData(
                              show: false,
                            ),
                            gridData: const FlGridData(
                              show: false,
                            ),
                            titlesData: const FlTitlesData(
                              show: false,
                            ),
                            scatterTouchData: ScatterTouchData(
                              enabled: false,
                            ),
                          ),
                          swapAnimationDuration: const Duration(milliseconds: 600),
                          swapAnimationCurve: Curves.fastOutSlowIn,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                 Text('Affiliated pages', style: TextStyle(
                    fontSize: 16,color: notifire.getblackcolor,
                    fontFamily: 'InterRegular',
                    fontWeight: FontWeight.w600),),
                const SizedBox(height: 10,),
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 110,
                    crossAxisCount: 1,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemCount: model().com1.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: notifire.getbgcolor11,),
                      child: Row(
                        children: [
                          Image.asset(model().com1[index], height: 64),
                          const SizedBox(width: 10,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(model().com2[index],
                                style:  TextStyle(
                                    fontFamily: 'InterRegular',
                                    fontSize: 16,color: notifire.getblackcolor,
                                    fontWeight: FontWeight.w600),),
                              Text(model().com3[index],
                                style: const TextStyle(
                                  fontFamily: 'InterRegular',
                                  fontSize: 14,
                                  color: Color(0xff727880),),),
                              const Text('Coraopolis, Pennsylvania ',
                                style: TextStyle(fontSize: 12,
                                  fontFamily: 'InterRegular',
                                  color: Color(0xff727880),),),
                            ],),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20,),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: notifire.getbgcolor11,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/avatar-6 1.png', height: 45,),
                          const SizedBox(width: 10,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Text('ABC Offical', style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontFamily: 'InterRegular',color: notifire.getblackcolor,
                                fontSize: 14,),),
                              Row(
                                children: [
                                  Image.asset('assets/location-tick.png',
                                    height: 12,),
                                  const SizedBox(width: 5,),
                                  const Text('Memphis', style: TextStyle(
                                    fontFamily: 'InterRegular',
                                    fontSize: 12,
                                    color: Color(0xff9DA2A7),),),
                                  const SizedBox(width: 5,),
                                  Image.asset(
                                      'assets/Ellipse 88.png', height: 5,
                                      color: const Color(0xffC6C8CB)),
                                  const SizedBox(width: 5,),
                                  const Text('23 March', style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'InterRegular',
                                      color: Color(0xff9DA2A7)),),

                                ],
                              ),
                            ],),
                          const Spacer(),
                          Image.asset('assets/more.png', height: 16,
                            color: const Color(0xffC6C8CB),),
                        ],),
                      const SizedBox(height: 10,),
                       Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                        style: TextStyle(color: notifire.getblackcolor,
                          fontFamily: 'InterRegular', fontSize: 14,),),
                      const SizedBox(height: 20,),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {

                            },
                            child: Container(
                                padding: const EdgeInsets.all(13),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        20),
                                  color: notifire.getbgcolor10,),
                                child: Center(
                                  child: Image.asset(
                                      'assets/angry-face.png',
                                      height: 18),
                                )),
                          ),
                          const SizedBox(width: 10,),
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: notifire.getbgcolor10,
                            ),
                            child: Center(
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/sms1.png', height: 20,
                                    color: const Color(0xff727880),),
                                  const SizedBox(width: 10,),
                                  const Text('1.2 K', style: TextStyle(
                                      fontFamily: 'InterRegular',
                                      fontSize: 12,
                                      color: Color(0xff727880),
                                      fontWeight: FontWeight.w600),)
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: notifire.getbgcolor10,
                            ),
                            child: Center(
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/share.png', height: 20,
                                    color: const Color(0xff727880),),
                                  const SizedBox(width: 10,),
                                  const Text('4.2 K', style: TextStyle(
                                      fontFamily: 'InterRegular',
                                      fontSize: 12,
                                      color: Color(0xff727880),
                                      fontWeight: FontWeight.w600),)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: notifire.getbgcolor11,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/avatar-6 1.png', height: 45,),
                          const SizedBox(width: 10,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Text('ABC Offical', style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontFamily: 'InterRegular',color: notifire.getblackcolor,
                                fontSize: 14,),),
                              Row(
                                children: [
                                  Image.asset('assets/location-tick.png',
                                    height: 12,),
                                  const SizedBox(width: 5,),
                                  const Text('Memphis', style: TextStyle(
                                    fontFamily: 'InterRegular',
                                    fontSize: 12,
                                    color: Color(0xff9DA2A7),),),
                                  const SizedBox(width: 5,),
                                  Image.asset(
                                      'assets/Ellipse 88.png', height: 5,
                                      color: const Color(0xffC6C8CB)),
                                  const SizedBox(width: 5,),
                                  const Text('23 March', style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'InterRegular',
                                      color: Color(0xff9DA2A7)),),

                                ],
                              ),
                            ],),
                          const Spacer(),
                          Image.asset('assets/more.png', height: 16,
                            color: const Color(0xffC6C8CB),),
                        ],),
                      const SizedBox(height: 10,),
                      Image.asset('assets/Media12.png'),
                      const SizedBox(height: 20,),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {

                            },
                            child: Container(
                                padding: const EdgeInsets.all(13),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        20),
                                  color: notifire.getbgcolor10,),
                                child: Center(
                                  child: Image.asset(
                                      'assets/angry-face.png',
                                      height: 18),
                                )),
                          ),
                          const SizedBox(width: 10,),
                          InkWell(
                            onTap: () {

                            },
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: notifire.getbgcolor10,
                              ),
                              child: Center(
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/sms1.png', height: 20,
                                      color: const Color(0xff727880),),
                                    const SizedBox(width: 10,),
                                    const Text('1.2 K', style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        fontSize: 12,
                                        color: Color(0xff727880),
                                        fontWeight: FontWeight.w600),)
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () {

                            },
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: notifire.getbgcolor10,
                              ),
                              child: Center(
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/share.png', height: 20,
                                      color: const Color(0xff727880),),
                                    const SizedBox(width: 10,),
                                    const Text('4.2 K', style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        fontSize: 12,
                                        color: Color(0xff727880),
                                        fontWeight: FontWeight.w600),)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container( padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(color: notifire.getbgcolor11,borderRadius: BorderRadius.circular(12)),
                  child: Column(  crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Overview', style: TextStyle(fontSize: 16,
                        fontFamily: 'InterRegular',
                        fontWeight: FontWeight.w600,
                        color: notifire.getblackcolor,),),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset('assets/briefcase.png', height: 16,),
                          const SizedBox(width: 10,),
                          Text('Freight and Package Transportation',
                            style: TextStyle(color: notifire.getblackcolor,
                              fontFamily: 'InterRegular', fontSize: 14,),),

                        ],
                      ),
                      const SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset('assets/buliding.png', height: 16,),
                          const SizedBox(width: 10,),
                          Text('Memphis, TN', style: TextStyle(color: notifire.getblackcolor,
                            fontFamily: 'InterRegular', fontSize: 14,),),

                        ],
                      ),
                      const SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset('assets/people.png', height: 16,),
                          const SizedBox(width: 10,),
                          Text('10,001+ employees', style: TextStyle(color: notifire.getblackcolor,
                            fontFamily: 'InterRegular', fontSize: 14,),),

                        ],
                      ),
                      const SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset('assets/global1.png', height: 16,),
                          const SizedBox(width: 10,),
                          Text('Public Company', style: TextStyle(color: notifire.getblackcolor,
                            fontFamily: 'InterRegular', fontSize: 14,),),

                        ],
                      ),
                      const SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset('assets/flag-2.png', height: 16,),
                          const SizedBox(width: 10,),
                          Text('1973', style: TextStyle(color: notifire.getblackcolor,
                            fontFamily: 'InterRegular', fontSize: 14,),),

                        ],
                      ),
                      const SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset('assets/direct-right.png', height: 16,),
                          const SizedBox(width: 10,),
                          const Text('http://careers.fedex.com ',
                            style: TextStyle(fontFamily: 'InterRegular',
                                fontSize: 14,
                                color: Color(0xff595FE5)),),

                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20,),


                Container( padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(color: notifire.getbgcolor11,borderRadius: BorderRadius.circular(12)),
                  child:  SizedBox(

                    width: Get.width *  1 ,
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: notifire.getbgcolor10),
                      child: TextFieldTags<String>(
                          textfieldTagsController: _stringTagController,
                          initialTags:const ['python','java'],
                          textSeparators: const [' ', ','],
                          inputFieldBuilder: (context, inputFieldValues){
                            return TextField(
                              onTap: () {
                                _stringTagController.getFocusNode?.requestFocus();
                              },
                              // maxLines: 6,
                              decoration:

                              InputDecoration(

                                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide:BorderSide.none),
                                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color: notifire.getgrey1)),
                                disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide.none),

                                hintText: inputFieldValues.tags.isNotEmpty ? '' : "Enter tag...".tr,
                                prefixIcon: inputFieldValues.tags.isNotEmpty ? SingleChildScrollView(
                                  controller: inputFieldValues.tagScrollController,
                                  scrollDirection: Axis.vertical,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Wrap(
                                        runSpacing: 4.0,
                                        spacing: 4.0,
                                        children: inputFieldValues.tags.map((String tag) {
                                          return Container(
                                            decoration:  BoxDecoration(
                                              borderRadius:  const BorderRadius.all(Radius.circular(15)),
                                              color: notifire.getbgcolor11,
                                            ),
                                            margin: const EdgeInsets.only(right: 10),
                                            padding: const EdgeInsets.all(8),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Center(child: Text('#$tag', style:  TextStyle(color: notifire.getblackcolor,fontFamily: 'InterRegular'))),
                                                const SizedBox(width: 5),
                                                InkWell(
                                                  child: const Icon(Icons.cancel_outlined, size: 18, color: Color(0xff595FE5)),
                                                  onTap: () {
                                                    inputFieldValues.onTagRemoved(tag);
                                                  },
                                                )
                                              ],
                                            ),
                                          );
                                        }).toList()),
                                  ),
                                ) : null,
                                suffixIcon: inputFieldValues.tags.isNotEmpty ? InkWell(
                                    onTap: () {
                                      _stringTagController.clearTags();
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 10, right: 10),
                                      child: Text('All Clear'.tr,style: TextStyle(color: notifire.getblackcolor,fontFamily: 'InterRegular')),
                                    )) : Padding(
                                  padding: const EdgeInsets.only(top: 10, right: 10),
                                  child: Text('All Clear'.tr,style: TextStyle(color: notifire.getblackcolor, fontFamily:'InterRegular')),
                                ),
                              ),
                              controller: inputFieldValues.textEditingController,
                              focusNode: inputFieldValues.focusNode,
                              onChanged: inputFieldValues.onTagChanged,
                              onSubmitted: inputFieldValues.onTagSubmitted,
                            );
                          }
                      ),
                    ),
                  ),
                ),


                const SizedBox(height: 20,),

                Container( padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(color: notifire.getbgcolor11,borderRadius: BorderRadius.circular(12)),
                  child: Column(   mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Latest Jobs', style: TextStyle(fontSize: 16,
                        fontFamily: 'InterRegular',color: notifire.getblackcolor,
                        fontWeight: FontWeight.w600,),),
                      const SizedBox(height: 10,),
                      SizedBox(

                        child: ListView.builder(
                          shrinkWrap: true,
physics: const NeverScrollableScrollPhysics(),
                          itemCount: model().com.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    'assets/Brand Logo25.png', height: 45,),
                                  const SizedBox(width: 10,),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      mainAxisAlignment: MainAxisAlignment
                                          .start,
                                      children: [
                                        Text(model().com[index],
                                          style:  TextStyle(color: notifire.getblackcolor,
                                            fontFamily: 'InterRegular',
                                            fontSize: 14,),),
                                        Row(children: [
                                          Image.asset(
                                            'assets/location-tick.png',
                                            height: 12,),
                                          const SizedBox(width: 5,),
                                          const Text('Bellevue, WA',
                                            style: TextStyle(fontSize: 14,
                                              color: Color(0xff727880),
                                              fontFamily: 'InterRegular',),),
                                          const SizedBox(width: 5,),
                                          Image.asset('assets/Ellipse 88.png',
                                            height: 4,),
                                          const SizedBox(width: 5,),
                                          const Text('FedEx Services ',
                                            style: TextStyle(
                                              color: Color(0xff727880),
                                              fontFamily: 'InterRegular',
                                              fontSize: 14,),),
                                        ],)
                                      ],
                                    ),
                                  )
                                ],),
                            );
                          },),
                      ),
                      const SizedBox(height: 20,),
                      Container(
                        decoration: BoxDecoration(color: notifire.getbgcolor10,
                          borderRadius: BorderRadius.circular(12),),
                        width: 110,
                        padding: const EdgeInsets.all(12),
                        child: const Center(child: Text('View More',
                            style: TextStyle(fontWeight: FontWeight.w600,
                                fontFamily: 'InterRegular',
                                color: Color(0xff727880),
                                fontSize: 12))),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ],
                    )
      ],
    );
    } else {
      return Column(
        children: [
          Stack(
            children: [
              Column(
                children: [
                  Container(
                    width: Get.width,
                    height: 160,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12)),
                        image: DecorationImage(
                            image: AssetImage('assets/Supehub_banner 1.png'),
                            fit: BoxFit.cover)),),
                  Container(
                    padding: const EdgeInsets.all(20),
                    width: Get.width,
                    decoration:  BoxDecoration(
                        color: notifire.getbgcolor11,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                         Text('1,280,910 followers', style: TextStyle(color: notifire.getblackcolor,
                          fontSize: 14, fontFamily: 'InterRegular',),),


                        const SizedBox(height: 20,),
                        Row(
                          children: [
                             Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Corporation', style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'InterRegular',color: notifire.getblackcolor,
                                    fontWeight: FontWeight.w600),),
                                const Text('Freight and Package Transportation',
                                  style: TextStyle(fontSize: 12,
                                      fontFamily: 'InterRegular',
                                      color: Color(0xff727880)),)
                              ],
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () {

                              },
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: const Color(0xff595FE5),),
                                child: const Text('All Jobs', style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'InterRegular',
                                    color: Colors.white,
                                    fontSize: 14)),
                              ),
                            ),
                            const SizedBox(width: 20,),
                            InkWell(
                              onTap: () {

                              },
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                  color: notifire.getbgcolor10,),
                                child: const Text('Follow', style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff727880),
                                  fontFamily: 'InterRegular',
                                  fontWeight: FontWeight.w500,)),
                              ),
                            ),
                            const SizedBox(width: 20,),
                            InkWell(
                              onTap: () {

                              },
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                  color: notifire.getbgcolor10,),
                                child: Center(child: Image.asset(
                                    'assets/sms-tracking1.png', height: 16)),
                              ),
                            ),
                            const SizedBox(width: 20,),
                            InkWell(
                              onTap: () {

                              },
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                  color: notifire.getbgcolor10),
                                child: Center(child: Image.asset(
                                  'assets/more.png', height: 16,
                                  color: const Color(0xff727880),)),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 105),
                    child: Image.asset(
                      'assets/Brand Logo24.png', height: 100,),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 20,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                flex: 7,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                       Container(
                         padding: const EdgeInsets.all(12),
                         decoration: BoxDecoration(color: notifire.getbgcolor11,borderRadius: BorderRadius.circular(12)),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                             Text('Our Stories', style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontFamily: 'InterRegular',color: notifire.getblackcolor,
                              fontSize: 16,),),
                             const SizedBox(height: 10,),
                             Text(
                               'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.',
                               style: TextStyle(fontSize: 14,
                                 fontFamily: 'InterRegular',
                                 fontWeight: FontWeight.w400,
                                 color: notifire.getblackcolor,),),
                             const SizedBox(height: 10,),
                             Text(
                               'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.',
                               style: TextStyle(fontSize: 14,
                                 fontFamily: 'InterRegular',
                                 fontWeight: FontWeight.w400,
                                 color: notifire.getblackcolor,),),

                           ],
                         ),
                       ),
                      const SizedBox(height: 20,),
                       Container(
                           padding: const EdgeInsets.all(12),
                         decoration: BoxDecoration(color: notifire.getbgcolor11,borderRadius: BorderRadius.circular(12)),
                         child: Column(    crossAxisAlignment: CrossAxisAlignment.start,
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                             Text('Employees', style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontFamily: 'InterRegular',color: notifire.getblackcolor,
                                fontSize: 16),),
                             const SizedBox(height: 20,),

                             GridView.builder(
                               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                 mainAxisExtent: 110,
                                 crossAxisCount: 4,
                                 crossAxisSpacing: 15,
                                 mainAxisSpacing: 15,
                               ),
                               itemCount: model().so6.length,
                               shrinkWrap: true,
                               itemBuilder: (context, index) {
                                 return SizedBox(
                                   child: Column(
                                     children: [
                                       SizedBox(
                                         width: 60,
                                         height: 60,
                                         child: CircleAvatar(
                                           backgroundImage: AssetImage(
                                               model().so6[index]),),
                                       ),
                                       const SizedBox(height: 10,),
                                       Text(model().so7[index], style:  TextStyle(
                                         fontSize: 14,color: notifire.getblackcolor,
                                         fontFamily: 'InterRegular',
                                         fontWeight: FontWeight.w500,),),
                                       // SizedBox(height: 10,),
                                       Text(model().so8[index], style: const TextStyle(
                                         fontFamily: 'InterRegular',
                                         fontSize: 12,
                                         color: Color(0xff9DA2A7),),),
                                       // Text()
                                     ],
                                   ),
                                 );
                               },
                             ),
                             const SizedBox(height: 10,),
                             InkWell(
                               onTap: () {

                               },
                               child: Container(
                                 decoration: BoxDecoration(
                                   color: notifire.getbgcolor10,
                                   borderRadius: BorderRadius.circular(12),),
                                 width: 110,
                                 padding: const EdgeInsets.all(12),
                                 child: const Center(
                                     child: Text('View More', style: TextStyle(
                                         fontWeight: FontWeight.w600,
                                         fontFamily: 'InterRegular',
                                         color: Color(0xff727880),
                                         fontSize: 12))),
                               ),
                             ),
                             const SizedBox(height: 20,),
                           ],
                         ),
                       ),
                      const SizedBox(height: 20,),
                      Row(children: [
                        Expanded(
                          child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                color: notifire.getbgcolor11,
                              ),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                     Row(
                                      children: [
                                        Text('Our growth',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: 'InterRegular',
                                              fontWeight: FontWeight.w600,color: notifire.getblackcolor,
                                            )),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      'USD',
                                      style: TextStyle(
                                          fontFamily: 'InterRegular',
                                          fontSize: 12,
                                          color: Color(0xff727880)),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.4,
                                      child: AspectRatio(
                                        aspectRatio: 1.23,
                                        child: Stack(
                                          children: <Widget>[
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .stretch,
                                              children: <Widget>[
                                                Expanded(
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .only(
                                                        right: 16, left: 6),
                                                    child: _LineChart(
                                                        isShowingMainData: isShowingMainData),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                              ],
                                            ),
                                            IconButton(
                                              icon: Icon(
                                                Icons.refresh,
                                                color: Colors.white.withOpacity(
                                                    isShowingMainData
                                                        ? 1.0
                                                        : 0.5),
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  isShowingMainData =
                                                  !isShowingMainData;
                                                });
                                              },
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ])
                          ),
                        ),
                        const SizedBox(width: 20,),
                        Expanded(
                          child: Container(
                              padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                              color: notifire.getbgcolor11,
                            ),
                            child: SizedBox(
                              height: Get.height * 0.5,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    showFlutter = !showFlutter;
                                  });
                                },
                                child: AspectRatio(
                                  aspectRatio: 1,
                                  child: ScatterChart(
                                    ScatterChartData(
                                      scatterSpots: showFlutter ? flutterLogoData() : randomData(),
                                      minX: 0,
                                      maxX: maxX,
                                      minY: 0,
                                      maxY: maxY,
                                      borderData: FlBorderData(
                                        show: false,
                                      ),
                                      gridData: const FlGridData(
                                        show: false,
                                      ),
                                      titlesData: const FlTitlesData(
                                        show: false,
                                      ),
                                      scatterTouchData: ScatterTouchData(
                                        enabled: false,
                                      ),
                                    ),
                                    swapAnimationDuration: const Duration(milliseconds: 600),
                                    swapAnimationCurve: Curves.fastOutSlowIn,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                      ),
                      const SizedBox(height: 20,),
                       Text('Affiliated pages', style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'InterRegular',color: notifire.getblackcolor,
                          fontWeight: FontWeight.w600),),
                      const SizedBox(height: 10,),
                      GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent: 110,
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                        ),
                        itemCount: model().com1.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: notifire.getbgcolor11,),
                            child: Row(
                              children: [
                                Image.asset(model().com1[index], height: 64),
                                const SizedBox(width: 10,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(model().com2[index],
                                      style:  TextStyle(
                                          fontFamily: 'InterRegular',
                                          fontSize: 16,color: notifire.getblackcolor,
                                          fontWeight: FontWeight.w600),),
                                    Text(model().com3[index],
                                      style: const TextStyle(
                                        fontFamily: 'InterRegular',
                                        fontSize: 14,
                                        color: Color(0xff727880),),),
                                    const Text('Coraopolis, Pennsylvania ',
                                      style: TextStyle(fontSize: 12,
                                        fontFamily: 'InterRegular',
                                        color: Color(0xff727880),),),
                                  ],),
                              ],
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 20,),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: notifire.getbgcolor11,
                        ),
                        child: Column(    crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/avatar-6 1.png', height: 45,),
                                const SizedBox(width: 10,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                     Text('ABC Offical', style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'InterRegular',color: notifire.getblackcolor,
                                      fontSize: 14,),),
                                    Row(
                                      children: [
                                        Image.asset('assets/location-tick.png',
                                          height: 12,),
                                        const SizedBox(width: 5,),
                                        const Text('Memphis', style: TextStyle(
                                          fontFamily: 'InterRegular',
                                          fontSize: 12,
                                          color: Color(0xff9DA2A7),),),
                                        const SizedBox(width: 5,),
                                        Image.asset(
                                            'assets/Ellipse 88.png', height: 5,
                                            color: const Color(0xffC6C8CB)),
                                        const SizedBox(width: 5,),
                                        const Text('23 March', style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'InterRegular',
                                            color: Color(0xff9DA2A7)),),

                                      ],
                                    ),
                                  ],),
                                const Spacer(),
                                Image.asset('assets/more.png', height: 16,
                                  color: const Color(0xffC6C8CB),),
                              ],),
                            const SizedBox(height: 10,),
                             Text(
                              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                              style: TextStyle(
                                fontFamily: 'InterRegular', fontSize: 14,color: notifire.getblackcolor,),),
                            const SizedBox(height: 20,),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {

                                  },
                                  child: Container(
                                      padding: const EdgeInsets.all(13),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              20),
                                        color: notifire.getbgcolor10,),
                                      child: Center(
                                        child: Image.asset(
                                            'assets/angry-face.png',
                                            height: 18),
                                      )),
                                ),
                                const SizedBox(width: 10,),
                                InkWell(
                                  onTap: () {

                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: notifire.getbgcolor10,
                                    ),
                                    child: Center(
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'assets/sms1.png', height: 20,
                                            color: const Color(0xff727880),),
                                          const SizedBox(width: 10,),
                                          const Text('1.2 K', style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              fontSize: 12,
                                              color: Color(0xff727880),
                                              fontWeight: FontWeight.w600),)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                InkWell(
                                  onTap: () {

                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: notifire.getbgcolor10,
                                    ),
                                    child: Center(
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'assets/share.png', height: 20,
                                            color: const Color(0xff727880),),
                                          const SizedBox(width: 10,),
                                          const Text('4.2 K', style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              fontSize: 12,
                                              color: Color(0xff727880),
                                              fontWeight: FontWeight.w600),)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: notifire.getbgcolor11,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/avatar-6 1.png', height: 45,),
                                const SizedBox(width: 10,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                     Text('ABC Offical', style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'InterRegular',color: notifire.getblackcolor,
                                      fontSize: 14,),),
                                    Row(
                                      children: [
                                        Image.asset('assets/location-tick.png',
                                          height: 12,),
                                        const SizedBox(width: 5,),
                                        const Text('Memphis', style: TextStyle(
                                          fontFamily: 'InterRegular',
                                          fontSize: 12,
                                          color: Color(0xff9DA2A7),),),
                                        const SizedBox(width: 5,),
                                        Image.asset(
                                            'assets/Ellipse 88.png', height: 5,
                                            color: const Color(0xffC6C8CB)),
                                        const SizedBox(width: 5,),
                                        const Text('23 March', style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'InterRegular',
                                            color: Color(0xff9DA2A7)),),

                                      ],
                                    ),
                                  ],),
                                const Spacer(),
                                Image.asset('assets/more.png', height: 16,
                                  color: const Color(0xffC6C8CB),),
                              ],),
                            const SizedBox(height: 10,),
                            Image.asset('assets/Media12.png'),
                            const SizedBox(height: 20,),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {

                                  },
                                  child: Container(
                                      padding: const EdgeInsets.all(13),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              20),
                                        color: notifire.getbgcolor10,),
                                      child: Center(
                                        child: Image.asset(
                                            'assets/angry-face.png',
                                            height: 18),
                                      )),
                                ),
                                const SizedBox(width: 10,),
                                InkWell(
                                  onTap: () {

                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
          color: notifire.getbgcolor10
                                    ),
                                    child: Center(
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'assets/sms1.png', height: 20,
                                            color: const Color(0xff727880),),
                                          const SizedBox(width: 10,),
                                          const Text('1.2 K', style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              fontSize: 12,
                                              color: Color(0xff727880),
                                              fontWeight: FontWeight.w600),)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                InkWell(
                                  onTap: () {

                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: notifire.getbgcolor10,
                                    ),
                                    child: Center(
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'assets/share.png', height: 20,
                                            color: const Color(0xff727880),),
                                          const SizedBox(width: 10,),
                                          const Text('4.2 K', style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              fontSize: 12,
                                              color: Color(0xff727880),
                                              fontWeight: FontWeight.w600),)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: Container(
                  decoration: const BoxDecoration(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Container( padding: const EdgeInsets.all(12),
                         decoration: BoxDecoration(color: notifire.getbgcolor11,borderRadius: BorderRadius.circular(12)),
                         child: Column(  crossAxisAlignment: CrossAxisAlignment.start,
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                             Text('Overview', style: TextStyle(fontSize: 16,
                                fontFamily: 'InterRegular',
                                fontWeight: FontWeight.w600,
                              color: notifire.getblackcolor,),),
                             const SizedBox(height: 10,),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.start,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Image.asset('assets/briefcase.png', height: 16,),
                                 const SizedBox(width: 10,),
                                 Text('Freight and Package Transportation',
                                   style: TextStyle(color: notifire.getblackcolor,
                                     fontFamily: 'InterRegular', fontSize: 14,),),

                               ],
                             ),
                             const SizedBox(height: 5,),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.start,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Image.asset('assets/buliding.png', height: 16,),
                                 const SizedBox(width: 10,),
                                 Text('Memphis, TN', style: TextStyle(color: notifire.getblackcolor,
                                   fontFamily: 'InterRegular', fontSize: 14,),),

                               ],
                             ),
                             const SizedBox(height: 5,),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.start,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Image.asset('assets/people.png', height: 16,),
                                 const SizedBox(width: 10,),
                                 Text('10,001+ employees', style: TextStyle(color: notifire.getblackcolor,
                                   fontFamily: 'InterRegular', fontSize: 14,),),

                               ],
                             ),
                             const SizedBox(height: 5,),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.start,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Image.asset('assets/global1.png', height: 16,),
                                 const SizedBox(width: 10,),
                                 Text('Public Company', style: TextStyle(color: notifire.getblackcolor,
                                   fontFamily: 'InterRegular', fontSize: 14,),),

                               ],
                             ),
                             const SizedBox(height: 5,),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.start,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Image.asset('assets/flag-2.png', height: 16,),
                                 const SizedBox(width: 10,),
                                 Text('1973', style: TextStyle(color: notifire.getblackcolor,
                                   fontFamily: 'InterRegular', fontSize: 14,),),

                               ],
                             ),
                             const SizedBox(height: 5,),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.start,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Image.asset('assets/direct-right.png', height: 16,),
                                 const SizedBox(width: 10,),
                                 const Text('http://careers.fedex.com ',
                                   style: TextStyle(fontFamily: 'InterRegular',
                                       fontSize: 14,
                                       color: Color(0xff595FE5)),),

                               ],
                             ),
                           ],
                         ),
                       ),

                      const SizedBox(height: 20,),


                      Container( padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(color: notifire.getbgcolor11,borderRadius: BorderRadius.circular(12)),
                         child:  SizedBox(

                           width: Get.width  ,
                           child: Container(
                             decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: notifire.getbgcolor10),
                             child: TextFieldTags<String>(
                                 textfieldTagsController: _stringTagController,
                                 initialTags:const ['python','java'],
                                 textSeparators: const [' ', ','],
                                 inputFieldBuilder: (context, inputFieldValues){
                                   return TextField(
                                     onTap: () {
                                       _stringTagController.getFocusNode?.requestFocus();
                                     },
                                     // maxLines: 6,
                                     decoration:

                                     InputDecoration(

                                       enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide:BorderSide.none),
                                       focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color: notifire.getgrey1)),
                                       disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide.none),

                                       hintText: inputFieldValues.tags.isNotEmpty ? '' : "Enter tag...".tr,
                                       prefixIcon: inputFieldValues.tags.isNotEmpty ? SingleChildScrollView(
                                         controller: inputFieldValues.tagScrollController,
                                         scrollDirection: Axis.vertical,
                                         child: Padding(
                                           padding: const EdgeInsets.all(8),
                                           child: Wrap(
                                               runSpacing: 4.0,
                                               spacing: 4.0,
                                               children: inputFieldValues.tags.map((String tag) {
                                                 return Container(
                                                   decoration:  BoxDecoration(
                                                     borderRadius:  const BorderRadius.all(Radius.circular(15)),
                                                     color: notifire.getbgcolor11,
                                                   ),
                                                   margin: const EdgeInsets.only(right: 10),
                                                   padding: const EdgeInsets.all(8),
                                                   child: Row(
                                                     mainAxisAlignment: MainAxisAlignment.center,
                                                     mainAxisSize: MainAxisSize.min,
                                                     crossAxisAlignment: CrossAxisAlignment.center,
                                                     children: [
                                                       Center(child: Text('#$tag', style:  TextStyle(color: notifire.getblackcolor,fontFamily: 'InterRegular'))),
                                                       const SizedBox(width: 5),
                                                       InkWell(
                                                         child: const Icon(Icons.cancel_outlined, size: 18, color: Color(0xff595FE5)),
                                                         onTap: () {
                                                           inputFieldValues.onTagRemoved(tag);
                                                         },
                                                       )
                                                     ],
                                                   ),
                                                 );
                                               }).toList()),
                                         ),
                                       ) : null,
                                       suffixIcon: inputFieldValues.tags.isNotEmpty ? InkWell(
                                           onTap: () {
                                             _stringTagController.clearTags();
                                           },
                                           child: Padding(
                                             padding: const EdgeInsets.only(top: 10, right: 10),
                                             child: Text('All Clear'.tr,style: TextStyle(color: notifire.getblackcolor,fontFamily: 'InterRegular')),
                                           )) : Padding(
                                         padding: const EdgeInsets.only(top: 10, right: 10),
                                         child: Text('All Clear'.tr,style: TextStyle(color: notifire.getblackcolor, fontFamily:'InterRegular')),
                                       ),
                                     ),
                                     controller: inputFieldValues.textEditingController,
                                     focusNode: inputFieldValues.focusNode,
                                     onChanged: inputFieldValues.onTagChanged,
                                     onSubmitted: inputFieldValues.onTagSubmitted,
                                   );
                                 }
                             ),
                           ),
                         ),
                       ),


                      const SizedBox(height: 20,),

                      Container( padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(color: notifire.getbgcolor11,borderRadius: BorderRadius.circular(12)),
                         child: Column(   mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text('Latest Jobs', style: TextStyle(fontSize: 16,
                              fontFamily: 'InterRegular',color: notifire.getblackcolor,
                              fontWeight: FontWeight.w600,),),
                             const SizedBox(height: 10,),
                             SizedBox(
                               width: Get.width * 0.3,
                               height: Get.height * 0.4,
                               child: ListView.builder(
                                 shrinkWrap: true,
                                 physics: const NeverScrollableScrollPhysics(),
                                 itemCount: model().com.length,
                                 itemBuilder: (context, index) {
                                   return Padding(
                                     padding: const EdgeInsets.only(bottom: 20),
                                     child: Row(
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       children: [
                                         Image.asset(
                                           'assets/Brand Logo25.png', height: 45,),
                                         const SizedBox(width: 10,),
                                         Flexible(
                                           child: Column(
                                             crossAxisAlignment: CrossAxisAlignment
                                                 .start,
                                             mainAxisAlignment: MainAxisAlignment
                                                 .start,
                                             children: [
                                               Text(model().com[index],
                                                 style:  TextStyle(color: notifire.getblackcolor,
                                                   fontFamily: 'InterRegular',
                                                   fontSize: 14,),),
                                               Row(children: [
                                                 Image.asset(
                                                   'assets/location-tick.png',
                                                   height: 12,),
                                                 const SizedBox(width: 5,),
                                                 const Text('Bellevue, WA',
                                                   style: TextStyle(fontSize: 14,
                                                     color: Color(0xff727880),
                                                     fontFamily: 'InterRegular',),),
                                                 const SizedBox(width: 5,),
                                                 Image.asset('assets/Ellipse 88.png',
                                                   height: 4,),
                                                 const SizedBox(width: 5,),
                                                 const Text('FedEx Services ',
                                                   style: TextStyle(
                                                     color: Color(0xff727880),
                                                     fontFamily: 'InterRegular',
                                                     fontSize: 14,),),
                                               ],)
                                             ],
                                           ),
                                         )
                                       ],),
                                   );
                                 },),
                             ),
                             const SizedBox(height: 20,),
                             Container(
                               decoration: BoxDecoration(color: notifire.getbgcolor10,
                                 borderRadius: BorderRadius.circular(12),),
                               width: 110,
                               padding: const EdgeInsets.all(12),
                               child: const Center(child: Text('View More',
                                   style: TextStyle(fontWeight: FontWeight.w600,
                                       fontFamily: 'InterRegular',
                                       color: Color(0xff727880),
                                       fontSize: 12))),
                             ),
                           ],
                         ),
                       ),

                    ],
                  ),
                ),
              )
            ],
          )
        ],
      );
    }
  }

  List<ScatterSpot> flutterLogoData() {
    return [
      /// section 1
      ScatterSpot(
        20,
        14.5,
        dotPainter: FlDotCirclePainter(color: widget.blue1, radius: radius),
      ),
      ScatterSpot(
        20,
        14.5,
        dotPainter: FlDotCirclePainter(color: widget.blue1, radius: radius),
      ),
      ScatterSpot(
        22,
        16.5,
        dotPainter: FlDotCirclePainter(color: widget.blue1, radius: radius),
      ),
      ScatterSpot(
        24,
        18.5,
        dotPainter: FlDotCirclePainter(color: widget.blue1, radius: radius),
      ),

      ScatterSpot(
        22,
        12.5,
        dotPainter: FlDotCirclePainter(color: widget.blue1, radius: radius),
      ),
      ScatterSpot(
        24,
        14.5,
        dotPainter: FlDotCirclePainter(color: widget.blue1, radius: radius),
      ),
      ScatterSpot(
        26,
        16.5,
        dotPainter: FlDotCirclePainter(color: widget.blue1, radius: radius),
      ),

      ScatterSpot(
        24,
        10.5,
        dotPainter: FlDotCirclePainter(color: widget.blue1, radius: radius),
      ),
      ScatterSpot(
        26,
        12.5,
        dotPainter: FlDotCirclePainter(color: widget.blue1, radius: radius),
      ),
      ScatterSpot(
        28,
        14.5,
        dotPainter: FlDotCirclePainter(color: widget.blue1, radius: radius),
      ),

      ScatterSpot(
        26,
        8.5,
        dotPainter: FlDotCirclePainter(color: widget.blue1, radius: radius),
      ),
      ScatterSpot(
        28,
        10.5,
        dotPainter: FlDotCirclePainter(color: widget.blue1, radius: radius),
      ),
      ScatterSpot(
        30,
        12.5,
        dotPainter: FlDotCirclePainter(color: widget.blue1, radius: radius),
      ),

      ScatterSpot(
        28,
        6.5,
        dotPainter: FlDotCirclePainter(color: widget.blue1, radius: radius),
      ),
      ScatterSpot(
        30,
        8.5,
        dotPainter: FlDotCirclePainter(color: widget.blue1, radius: radius),
      ),
      ScatterSpot(
        32,
        10.5,
        dotPainter: FlDotCirclePainter(color: widget.blue1, radius: radius),
      ),

      ScatterSpot(
        30,
        4.5,
        dotPainter: FlDotCirclePainter(color: widget.blue1, radius: radius),
      ),
      ScatterSpot(
        32,
        6.5,
        dotPainter: FlDotCirclePainter(color: widget.blue1, radius: radius),
      ),
      ScatterSpot(
        34,
        8.5,
        dotPainter: FlDotCirclePainter(color: widget.blue1, radius: radius),
      ),

      ScatterSpot(
        34,
        4.5,
        dotPainter: FlDotCirclePainter(color: widget.blue1, radius: radius),
      ),
      ScatterSpot(
        36,
        6.5,
        dotPainter: FlDotCirclePainter(color: widget.blue1, radius: radius),
      ),

      ScatterSpot(
        38,
        4.5,
        dotPainter: FlDotCirclePainter(color: widget.blue1, radius: radius),
      ),

      /// section 2
      ScatterSpot(
        20,
        14.5,
        dotPainter: FlDotCirclePainter(color: widget.blue2, radius: radius),
      ),
      ScatterSpot(
        22,
        12.5,
        dotPainter: FlDotCirclePainter(color: widget.blue2, radius: radius),
      ),
      ScatterSpot(
        24,
        10.5,
        dotPainter: FlDotCirclePainter(color: widget.blue2, radius: radius),
      ),

      ScatterSpot(
        22,
        16.5,
        dotPainter: FlDotCirclePainter(color: widget.blue2, radius: radius),
      ),
      ScatterSpot(
        24,
        14.5,
        dotPainter: FlDotCirclePainter(color: widget.blue2, radius: radius),
      ),
      ScatterSpot(
        26,
        12.5,
        dotPainter: FlDotCirclePainter(color: widget.blue2, radius: radius),
      ),

      ScatterSpot(
        24,
        18.5,
        dotPainter: FlDotCirclePainter(color: widget.blue2, radius: radius),
      ),
      ScatterSpot(
        26,
        16.5,
        dotPainter: FlDotCirclePainter(color: widget.blue2, radius: radius),
      ),
      ScatterSpot(
        28,
        14.5,
        dotPainter: FlDotCirclePainter(color: widget.blue2, radius: radius),
      ),

      ScatterSpot(
        26,
        20.5,
        dotPainter: FlDotCirclePainter(color: widget.blue2, radius: radius),
      ),
      ScatterSpot(
        28,
        18.5,
        dotPainter: FlDotCirclePainter(color: widget.blue2, radius: radius),
      ),
      ScatterSpot(
        30,
        16.5,
        dotPainter: FlDotCirclePainter(color: widget.blue2, radius: radius),
      ),

      ScatterSpot(
        28,
        22.5,
        dotPainter: FlDotCirclePainter(color: widget.blue2, radius: radius),
      ),
      ScatterSpot(
        30,
        20.5,
        dotPainter: FlDotCirclePainter(color: widget.blue2, radius: radius),
      ),
      ScatterSpot(
        32,
        18.5,
        dotPainter: FlDotCirclePainter(color: widget.blue2, radius: radius),
      ),

      ScatterSpot(
        30,
        24.5,
        dotPainter: FlDotCirclePainter(color: widget.blue2, radius: radius),
      ),
      ScatterSpot(
        32,
        22.5,
        dotPainter: FlDotCirclePainter(color: widget.blue2, radius: radius),
      ),
      ScatterSpot(
        34,
        20.5,
        dotPainter: FlDotCirclePainter(color: widget.blue2, radius: radius),
      ),

      ScatterSpot(
        34,
        24.5,
        dotPainter: FlDotCirclePainter(color: widget.blue2, radius: radius),
      ),
      ScatterSpot(
        36,
        22.5,
        dotPainter: FlDotCirclePainter(color: widget.blue2, radius: radius),
      ),

      ScatterSpot(
        38,
        24.5,
        dotPainter: FlDotCirclePainter(color: widget.blue2, radius: radius),
      ),

      /// section 3
      ScatterSpot(
        10,
        25,
        dotPainter: FlDotCirclePainter(color: widget.blue2, radius: radius),
      ),
      ScatterSpot(
        12,
        23,
        dotPainter: FlDotCirclePainter(color: widget.blue2, radius: radius),
      ),
      ScatterSpot(
        14,
        21,
        dotPainter: FlDotCirclePainter(color: widget.blue2, radius: radius),
      ),

      ScatterSpot(
        12,
        27,
        dotPainter: FlDotCirclePainter(color: widget.blue2, radius: radius),
      ),
      ScatterSpot(
        14,
        25,
        dotPainter: FlDotCirclePainter(color: widget.blue2, radius: radius),
      ),
      ScatterSpot(
        16,
        23,
        dotPainter: FlDotCirclePainter(color: widget.blue2, radius: radius),
      ),

      ScatterSpot(
        14,
        29,
        dotPainter: FlDotCirclePainter(color: widget.blue2, radius: radius),
      ),
      ScatterSpot(
        16,
        27,
        dotPainter: FlDotCirclePainter(color: widget.blue2, radius: radius),
      ),
      ScatterSpot(
        18,
        25,
        dotPainter: FlDotCirclePainter(color: widget.blue2, radius: radius),
      ),

      ScatterSpot(
        16,
        31,
        dotPainter: FlDotCirclePainter(color: widget.blue2, radius: radius),
      ),
      ScatterSpot(
        18,
        29,
        dotPainter: FlDotCirclePainter(color: widget.blue2, radius: radius),
      ),
      ScatterSpot(
        20,
        27,
        dotPainter: FlDotCirclePainter(color: widget.blue2, radius: radius),
      ),

      ScatterSpot(
        18,
        33,
        dotPainter: FlDotCirclePainter(color: widget.blue2, radius: radius),
      ),
      ScatterSpot(
        20,
        31,
        dotPainter: FlDotCirclePainter(color: widget.blue2, radius: radius),
      ),
      ScatterSpot(
        22,
        29,
        dotPainter: FlDotCirclePainter(color: widget.blue2, radius: radius),
      ),

      ScatterSpot(
        20,
        35,
        dotPainter: FlDotCirclePainter(color: widget.blue2, radius: radius),
      ),
      ScatterSpot(
        22,
        33,
        dotPainter: FlDotCirclePainter(color: widget.blue2, radius: radius),
      ),
      ScatterSpot(
        24,
        31,
        dotPainter: FlDotCirclePainter(color: widget.blue2, radius: radius),
      ),

      ScatterSpot(
        22,
        37,
        dotPainter: FlDotCirclePainter(color: widget.blue2, radius: radius),
      ),
      ScatterSpot(
        24,
        35,
        dotPainter: FlDotCirclePainter(color: widget.blue2, radius: radius),
      ),
      ScatterSpot(
        26,
        33,
        dotPainter: FlDotCirclePainter(color: widget.blue2, radius: radius),
      ),

      ScatterSpot(
        24,
        39,
        dotPainter: FlDotCirclePainter(color: widget.blue2, radius: radius),
      ),
      ScatterSpot(
        26,
        37,
        dotPainter: FlDotCirclePainter(color: widget.blue2, radius: radius),
      ),
      ScatterSpot(
        28,
        35,
        dotPainter: FlDotCirclePainter(color: widget.blue2, radius: radius),
      ),

      ScatterSpot(
        26,
        41,
        dotPainter: FlDotCirclePainter(color: widget.blue2, radius: radius),
      ),
      ScatterSpot(
        28,
        39,
        dotPainter: FlDotCirclePainter(color: widget.blue2, radius: radius),
      ),
      ScatterSpot(
        30,
        37,
        dotPainter: FlDotCirclePainter(color: widget.blue2, radius: radius),
      ),

      ScatterSpot(
        28,
        43,
        dotPainter: FlDotCirclePainter(color: widget.blue2, radius: radius),
      ),
      ScatterSpot(
        30,
        41,
        dotPainter: FlDotCirclePainter(color: widget.blue2, radius: radius),
      ),
      ScatterSpot(
        32,
        39,
        dotPainter: FlDotCirclePainter(color: widget.blue2, radius: radius),
      ),

      ScatterSpot(
        30,
        45,
        dotPainter: FlDotCirclePainter(color: widget.blue2, radius: radius),
      ),
      ScatterSpot(
        32,
        43,
        dotPainter: FlDotCirclePainter(color: widget.blue2, radius: radius),
      ),
      ScatterSpot(
        34,
        41,
        dotPainter: FlDotCirclePainter(color: widget.blue2, radius: radius),
      ),

      ScatterSpot(
        34,
        45,
        dotPainter: FlDotCirclePainter(color: widget.blue2, radius: radius),
      ),
      ScatterSpot(
        36,
        43,
        dotPainter: FlDotCirclePainter(color: widget.blue2, radius: radius),
      ),

      ScatterSpot(
        38,
        45,
        dotPainter: FlDotCirclePainter(color: widget.blue2, radius: radius),
      ),
    ];
  }

  List<ScatterSpot> randomData() {
    const blue1Count = 21;
    const blue2Count = 57;
    return List.generate(blue1Count + blue2Count, (i) {
      Color color;
      if (i < blue1Count) {
        color = widget.blue1;
      } else {
        color = widget.blue2;
      }

      return ScatterSpot(
        (Random().nextDouble() * (maxX - 8)) + 4,
        (Random().nextDouble() * (maxY - 8)) + 4,
        dotPainter: FlDotCirclePainter(
          color: color,
          radius: (Random().nextDouble() * 16) + 4,
        ),
      );
    });
  }


}