// ignore_for_file: deprecated_member_use
// ignore_for_file: prefer_const_constructors, file_names, camel_case_types
import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';
import 'package:evcp/confing/list.dart';

import '../../confing/Rtl.dart';
import '../../confing/colors.dart';

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

class Finance extends StatefulWidget {
  const Finance({super.key});

  @override
  State<Finance> createState() => _FinanceState();
}

class _FinanceState extends State<Finance> {
  late bool isShowingMainData;

  @override
  void initState() {
    super.initState();
    isShowingMainData = true;
  }

  late ColorNotifier notifire;
  InboxController inboxController = Get.put(InboxController());
  SampleItem? selectedMenu;

  List checkBox = [];
  int selectIndex = 0;

  List abstract = [
    'Missed call',
    'omg, this is amazing',
    'Bell: woohoooo',
    'How are you?',
    'Call ended',
    'Wow, this is really epic',
    'perfect!',
    'Haha oh man',
    'just ideas for next time',
    'omg, this is amazing',
    'omg, this is amazing',
    'Bell: woohoooo',
    'How are you?',
    'Call ended',
    'Wow, this is really epic',
    'perfect!',
    'Haha oh man',
  ];
  List messages1 = [
    '8:20 AM',
    '4:39 PM',
    '02 July',
    '07 July',
    '09 July',
    '23 July',
    '08 July',
    '5:40 PM',
    '12 July',
    '4:33 PM',
    '4:39 PM',
    '02 July',
    '07 July',
    '09 July',
    '23 July',
    '08 July',
    '5:40 PM',
  ];
  int fin = 0;

  final List<String> list = [
    'India Bank',
    'Australia Bank',
    'Germany Bank',
    'Federal Bank',
    'Uk Bank',
  ];
  String? selectedValue;
  List list1 = [
    'assets/USD Coin.png',
    'assets/eCash.png',
    'assets/Shiba Inu SHIB.png',
    'assets/Tether.png',
    'assets/BNB.png',
  ];

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifier>(context, listen: true);
    return GetBuilder<InboxController>(
      builder: (inboxController) {
        return LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 600) {
              return Container(
                color: notifire.getbgcolor10,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, bottom: 20, top: 20),
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
                              'Finance',
                              style: TextStyle(
                                  color: greyy,
                                  fontSize: 14,
                                  fontFamily: 'InterRegular'),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 50,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: notifire.getbgcolor11),
                            // alignment: Alignment.center,
                            child: Row(children: [
                              const SizedBox(
                                width: 10,
                              ),
                              ListView.builder(
                                itemCount: model().fin.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        fin = index;
                                      });
                                    },
                                    child: Transform.translate(
                                      offset: const Offset(0, 7),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                fin = index;
                                              });
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.all(10),
                                              margin: const EdgeInsets.only(
                                                  right: 10),
                                              decoration: BoxDecoration(
                                                color: fin == index
                                                    ? notifire.Getblg2
                                                    : notifire.getbgcolor11,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset(
                                                      model().finan[index],
                                                      height: 18,
                                                      color: fin == index
                                                          ? const Color(
                                                              0xff2a70fe)
                                                          : const Color(
                                                              0xff738096)),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                              const Spacer(),
                              PopupMenuButton(
                                tooltip: '',
                                offset: const Offset(10, 50),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                elevation: 1,
                                splashRadius: 1,
                                constraints: const BoxConstraints(
                                  maxWidth: 360,
                                  minWidth: 360,
                                ),
                                shadowColor: Colors.grey,
                                color: notifire.getbgcolor11,
                                itemBuilder: (context) =>
                                    <PopupMenuEntry<SampleItem>>[
                                  PopupMenuItem(
                                      height: 30,
                                      padding: EdgeInsets.zero,
                                      enabled: false,
                                      child: SingleChildScrollView(
                                        child: StatefulBuilder(
                                          builder: (context, setState) {
                                            return Padding(
                                              padding: const EdgeInsets.all(14),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Send Money',
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontFamily:
                                                            'InterRegular',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: notifire
                                                            .getblackcolor),
                                                  ),
                                                  const SizedBox(
                                                    height: 15,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        height: 45,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                            border: Border.all(
                                                                color: notifire
                                                                    .getgrey1)),
                                                        child: TextField(
                                                          style: TextStyle(
                                                              color: notifire
                                                                  .getblackcolor),
                                                          decoration:
                                                              InputDecoration(
                                                            hintText:
                                                                'Enter the amount',
                                                            hintStyle:
                                                                const TextStyle(
                                                                    color: Color(
                                                                        0xffC6C8CB),
                                                                    fontSize:
                                                                        15),
                                                            contentPadding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    left: 20,
                                                                    right: 20),
                                                            border: OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12),
                                                                borderSide:
                                                                    BorderSide(
                                                                        color:
                                                                            grey2)),
                                                            enabledBorder: OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide
                                                                        .none,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12)),
                                                            focusedBorder: OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                        color:
                                                                            blue),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12)),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          const Text(
                                                            'Transfer Fee',
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                fontFamily:
                                                                    'InterRegular',
                                                                color: Color(
                                                                    0xff9DA2A7),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                          const Spacer(),
                                                          Text(
                                                            '+5.99 USD',
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                fontFamily:
                                                                    'InterRegular',
                                                                color: notifire
                                                                    .getblackcolor),
                                                          )
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 15,
                                                      ),
                                                      const Text(
                                                        'Sent to',
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontFamily:
                                                                'InterRegular',
                                                            color: Color(
                                                                0xff727880),
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      DropdownButtonHideUnderline(
                                                        child: DropdownButton2<
                                                            String>(
                                                          isExpanded: true,
                                                          hint: Row(
                                                            children: [
                                                              const SizedBox(
                                                                width: 4,
                                                              ),
                                                              Expanded(
                                                                child: Text(
                                                                  'Bank',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    fontFamily:
                                                                        'InterRegular',
                                                                    color: notifire
                                                                        .getblackcolor,
                                                                  ),
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          items: list
                                                              .map((String
                                                                      item) =>
                                                                  DropdownMenuItem<
                                                                      String>(
                                                                    value: item,
                                                                    child: Text(
                                                                      item,
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          color:
                                                                              notifire.getblackcolor),
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                    ),
                                                                  ))
                                                              .toList(),
                                                          value: selectedValue,
                                                          onChanged:
                                                              (String? value) {
                                                            setState(() {
                                                              selectedValue =
                                                                  value;
                                                            });
                                                          },
                                                          buttonStyleData:
                                                              ButtonStyleData(
                                                            height: 50,
                                                            width: Get.width,
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    left: 14,
                                                                    right: 14),
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          14),
                                                              border: Border.all(
                                                                  color: notifire
                                                                      .getgrey1),
                                                            ),
                                                            elevation: 0,
                                                          ),
                                                          iconStyleData:
                                                              IconStyleData(
                                                            icon: Icon(
                                                              Icons
                                                                  .keyboard_arrow_down,
                                                              size: 25,
                                                              color: notifire
                                                                  .getblackcolor,
                                                            ),
                                                            iconSize: 14,
                                                            iconEnabledColor:
                                                                Colors.black,
                                                            iconDisabledColor:
                                                                Colors.grey,
                                                          ),
                                                          dropdownStyleData:
                                                              DropdownStyleData(
                                                            maxHeight: 200,
                                                            width: 200,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          14),
                                                              color: notifire
                                                                  .getbgcolor11,
                                                            ),
                                                            offset:
                                                                const Offset(
                                                                    -20, 0),
                                                            scrollbarTheme:
                                                                ScrollbarThemeData(
                                                              radius:
                                                                  const Radius
                                                                      .circular(
                                                                      40),
                                                              thickness:
                                                                  MaterialStateProperty
                                                                      .all<double>(
                                                                          6),
                                                              thumbVisibility:
                                                                  MaterialStateProperty
                                                                      .all<bool>(
                                                                          true),
                                                            ),
                                                          ),
                                                          menuItemStyleData:
                                                              const MenuItemStyleData(
                                                            height: 40,
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 14,
                                                                    right: 14),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    'Choose Card',
                                                    style: TextStyle(
                                                        color: notifire
                                                            .getblackcolor,
                                                        fontFamily:
                                                            'InterRegular',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 14),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  ListView.builder(
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount: model().x.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return Container(
                                                        height: 80,
                                                        margin: const EdgeInsets
                                                            .all(5),
                                                        width: Get.width,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: value == index
                                                              ? notifire.Getblg2
                                                              : notifire
                                                                  .getbgcolor11,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                        ),
                                                        child: DottedBorder(
                                                          color: const Color(
                                                              0xffC6C8CB),
                                                          borderType:
                                                              BorderType.RRect,
                                                          radius: const Radius
                                                              .circular(12),
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(10),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(6),
                                                            child: SizedBox(
                                                              width: Get.width,
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    const BorderRadius
                                                                        .all(
                                                                        Radius.circular(
                                                                            12)),
                                                                child: Row(
                                                                  children: [
                                                                    InkWell(
                                                                      onTap:
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                          value =
                                                                              index;
                                                                        });
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        padding: const EdgeInsets
                                                                            .all(
                                                                            6),
                                                                        decoration: BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                            border: Border.all(color: value == index ? const Color(0xff595FE5) : const Color(0xffE2E8F0), width: 5)),
                                                                        child: Container(
                                                                            color:
                                                                                Colors.white),
                                                                      ),
                                                                    ),
                                                                    // radioButton(index),
                                                                    const SizedBox(
                                                                      width: 15,
                                                                    ),
                                                                    Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          model()
                                                                              .x[index],
                                                                          style: TextStyle(
                                                                              fontSize: 14,
                                                                              fontFamily: 'InterRegular',
                                                                              fontWeight: FontWeight.w500,
                                                                              color: value == index ? notifire.getblackcolor : const Color(0xff727880)),
                                                                        ),
                                                                        const SizedBox(
                                                                          height:
                                                                              5,
                                                                        ),
                                                                        Text(
                                                                          'Dianne Russell',
                                                                          style: TextStyle(
                                                                              fontSize: 12,
                                                                              fontFamily: 'InterRegular',
                                                                              fontWeight: FontWeight.w400,
                                                                              color: value == index ? notifire.getblackcolor : const Color(0xff727880)),
                                                                        )
                                                                      ],
                                                                    ),
                                                                    const Spacer(),
                                                                    Image.asset(
                                                                      model().fin2[
                                                                          index],
                                                                      height:
                                                                          30,
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                  const SizedBox(
                                                    height: 15,
                                                  ),
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          Get.back();
                                                        },
                                                        child: Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(12),
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                            color: notifire
                                                                .getbgcolor11,
                                                          ),
                                                          child: const Center(
                                                              child: Text(
                                                            'Cancel',
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontFamily:
                                                                    'InterRegular',
                                                                color: Color(
                                                                    0xff727880)),
                                                          )),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      InkWell(
                                                        onTap: () {},
                                                        child: Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(12),
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12),
                                                              color: const Color(
                                                                  0xff595FE5)),
                                                          child: const Center(
                                                              child: Text(
                                                                  'Countinue',
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          'InterRegular',
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600))),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      )),
                                ],
                                child: Container(
                                  height: 40,
                                  width: 35,
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: const Color(0xff595FE5)),
                                  child: Center(
                                    child: Row(
                                      children: [
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        SvgPicture.asset(
                                            'assets/money-send.svg',
                                            height: 16),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                            ]),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              firstContainer1(
                                  context: context, constraints: constraints),
                            ],
                          ),
                        ),
                      ],
                    ),
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
                        padding: const EdgeInsets.only(left: 20, right: 20),
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
                                    context: context, constraints: constraints),
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
                  decoration: BoxDecoration(
                    color: notifire.getbgcolor10,
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 20, left: 20, bottom: 20),
                      child: Column(
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
                                'Finance',
                                style: TextStyle(
                                    color: greyy,
                                    fontSize: 14,
                                    fontFamily: 'InterRegular'),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 50,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: notifire.getbgcolor11),
                              // alignment: Alignment.center,
                              child: Row(children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                ListView.builder(
                                  itemCount: model().fin.length,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        setState(() {
                                          fin = index;
                                        });
                                      },
                                      child: Transform.translate(
                                        offset: const Offset(0, 7),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  fin = index;
                                                });
                                              },
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                margin: const EdgeInsets.only(
                                                    right: 10),
                                                decoration: BoxDecoration(
                                                  color: fin == index
                                                      ? notifire.Getblg2
                                                      : notifire.getbgcolor11,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                        model().finan[index],
                                                        height: 18,
                                                        color: fin == index
                                                            ? const Color(
                                                                0xff2a70fe)
                                                            : const Color(
                                                                0xff738096)),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      model().fin[index],
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily:
                                                            'InterRegular',
                                                        color: fin == index
                                                            ? const Color(
                                                                0xff2a70fe)
                                                            : const Color(
                                                                0xff738096),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                const Spacer(),
                                PopupMenuButton(
                                  tooltip: '',
                                  offset: const Offset(10, 50),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  elevation: 1,
                                  splashRadius: 1,
                                  constraints: const BoxConstraints(
                                    maxWidth: 360,
                                    minWidth: 360,
                                  ),
                                  shadowColor: Colors.grey,
                                  color: notifire.getbgcolor11,
                                  itemBuilder: (context) =>
                                      <PopupMenuEntry<SampleItem>>[
                                    PopupMenuItem(
                                        height: 30,
                                        padding: EdgeInsets.zero,
                                        enabled: false,
                                        child: SingleChildScrollView(
                                          child: StatefulBuilder(
                                            builder: (context, setState) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.all(14),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Send Money',
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontFamily:
                                                              'InterRegular',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: notifire
                                                              .getblackcolor),
                                                    ),
                                                    const SizedBox(
                                                      height: 15,
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          height: 45,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12),
                                                              border: Border.all(
                                                                  color: notifire
                                                                      .getgrey1)),
                                                          child: TextField(
                                                            style: TextStyle(
                                                                color: notifire
                                                                    .getblackcolor),
                                                            decoration:
                                                                InputDecoration(
                                                              hintText:
                                                                  'Enter the amount',
                                                              hintStyle: const TextStyle(
                                                                  color: Color(
                                                                      0xffC6C8CB),
                                                                  fontSize: 15),
                                                              contentPadding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      left: 20,
                                                                      right:
                                                                          20),
                                                              border: OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12),
                                                                  borderSide:
                                                                      BorderSide(
                                                                          color:
                                                                              grey2)),
                                                              enabledBorder: OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide
                                                                          .none,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12)),
                                                              focusedBorder: OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                          color:
                                                                              blue),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12)),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            const Text(
                                                              'Transfer Fee',
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  fontFamily:
                                                                      'InterRegular',
                                                                  color: Color(
                                                                      0xff9DA2A7),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                            const Spacer(),
                                                            Text(
                                                              '+5.99 USD',
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  fontFamily:
                                                                      'InterRegular',
                                                                  color: notifire
                                                                      .getblackcolor),
                                                            )
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 15,
                                                        ),
                                                        const Text(
                                                          'Sent to',
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  'InterRegular',
                                                              color: Color(
                                                                  0xff727880),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        DropdownButtonHideUnderline(
                                                          child:
                                                              DropdownButton2<
                                                                  String>(
                                                            isExpanded: true,
                                                            hint: Row(
                                                              children: [
                                                                const SizedBox(
                                                                  width: 4,
                                                                ),
                                                                Expanded(
                                                                  child: Text(
                                                                    'Bank',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      fontFamily:
                                                                          'InterRegular',
                                                                      color: notifire
                                                                          .getblackcolor,
                                                                    ),
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            items: list
                                                                .map((String
                                                                        item) =>
                                                                    DropdownMenuItem<
                                                                        String>(
                                                                      value:
                                                                          item,
                                                                      child:
                                                                          Text(
                                                                        item,
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                14,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            color: notifire.getblackcolor),
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                      ),
                                                                    ))
                                                                .toList(),
                                                            value:
                                                                selectedValue,
                                                            onChanged: (String?
                                                                value) {
                                                              setState(() {
                                                                selectedValue =
                                                                    value;
                                                              });
                                                            },
                                                            buttonStyleData:
                                                                ButtonStyleData(
                                                              height: 50,
                                                              width: Get.width,
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      left: 14,
                                                                      right:
                                                                          14),
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            14),
                                                                border: Border.all(
                                                                    color: notifire
                                                                        .getgrey1),
                                                              ),
                                                              elevation: 0,
                                                            ),
                                                            iconStyleData:
                                                                IconStyleData(
                                                              icon: Icon(
                                                                Icons
                                                                    .keyboard_arrow_down,
                                                                size: 25,
                                                                color: notifire
                                                                    .getblackcolor,
                                                              ),
                                                              iconSize: 14,
                                                              iconEnabledColor:
                                                                  Colors.black,
                                                              iconDisabledColor:
                                                                  Colors.grey,
                                                            ),
                                                            dropdownStyleData:
                                                                DropdownStyleData(
                                                              maxHeight: 200,
                                                              width: 200,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            14),
                                                                color: notifire
                                                                    .getbgcolor11,
                                                              ),
                                                              offset:
                                                                  const Offset(
                                                                      -20, 0),
                                                              scrollbarTheme:
                                                                  ScrollbarThemeData(
                                                                radius:
                                                                    const Radius
                                                                        .circular(
                                                                        40),
                                                                thickness:
                                                                    MaterialStateProperty
                                                                        .all<double>(
                                                                            6),
                                                                thumbVisibility:
                                                                    MaterialStateProperty
                                                                        .all<bool>(
                                                                            true),
                                                              ),
                                                            ),
                                                            menuItemStyleData:
                                                                const MenuItemStyleData(
                                                              height: 40,
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 14,
                                                                      right:
                                                                          14),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      'Choose Card',
                                                      style: TextStyle(
                                                          color: notifire
                                                              .getblackcolor,
                                                          fontFamily:
                                                              'InterRegular',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 14),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    ListView.builder(
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          model().x.length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        return Container(
                                                          height: 80,
                                                          margin:
                                                              const EdgeInsets
                                                                  .all(5),
                                                          width: Get.width,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: value ==
                                                                    index
                                                                ? notifire
                                                                    .Getblg2
                                                                : notifire
                                                                    .getbgcolor11,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                          ),
                                                          child: DottedBorder(
                                                            color: const Color(
                                                                0xffC6C8CB),
                                                            borderType:
                                                                BorderType
                                                                    .RRect,
                                                            radius: const Radius
                                                                .circular(12),
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(10),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(6),
                                                              child: SizedBox(
                                                                width:
                                                                    Get.width,
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      const BorderRadius
                                                                          .all(
                                                                          Radius.circular(
                                                                              12)),
                                                                  child: Row(
                                                                    children: [
                                                                      InkWell(
                                                                        onTap:
                                                                            () {
                                                                          setState(
                                                                              () {
                                                                            value =
                                                                                index;
                                                                          });
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          padding: const EdgeInsets
                                                                              .all(
                                                                              6),
                                                                          decoration: BoxDecoration(
                                                                              shape: BoxShape.circle,
                                                                              border: Border.all(color: value == index ? const Color(0xff595FE5) : const Color(0xffE2E8F0), width: 5)),
                                                                          child:
                                                                              Container(color: Colors.white),
                                                                        ),
                                                                      ),
                                                                      // radioButton(index),
                                                                      const SizedBox(
                                                                        width:
                                                                            15,
                                                                      ),
                                                                      Column(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            model().x[index],
                                                                            style: TextStyle(
                                                                                fontSize: 14,
                                                                                fontFamily: 'InterRegular',
                                                                                fontWeight: FontWeight.w500,
                                                                                color: value == index ? notifire.getblackcolor : const Color(0xff727880)),
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                5,
                                                                          ),
                                                                          Text(
                                                                            'Dianne Russell',
                                                                            style: TextStyle(
                                                                                fontSize: 12,
                                                                                fontFamily: 'InterRegular',
                                                                                fontWeight: FontWeight.w400,
                                                                                color: value == index ? notifire.getblackcolor : const Color(0xff727880)),
                                                                          )
                                                                        ],
                                                                      ),
                                                                      const Spacer(),
                                                                      Image
                                                                          .asset(
                                                                        model().fin2[
                                                                            index],
                                                                        height:
                                                                            30,
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                    const SizedBox(
                                                      height: 15,
                                                    ),
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            Get.back();
                                                          },
                                                          child: Container(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(12),
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12),
                                                              color: notifire
                                                                  .getbgcolor11,
                                                            ),
                                                            child: const Center(
                                                                child: Text(
                                                              'Cancel',
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontFamily:
                                                                      'InterRegular',
                                                                  color: Color(
                                                                      0xff727880)),
                                                            )),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        InkWell(
                                                          onTap: () {},
                                                          child: Container(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(12),
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12),
                                                                color: const Color(
                                                                    0xff595FE5)),
                                                            child: const Center(
                                                                child: Text(
                                                                    'Countinue',
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            'InterRegular',
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight.w600))),
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        )),
                                  ],
                                  child: Container(
                                    height: 40,
                                    width: 128,
                                    padding: const EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: const Color(0xff595FE5)),
                                    child: Center(
                                      child: Row(
                                        children: [
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          SvgPicture.asset(
                                              'assets/money-send.svg',
                                              height: 16),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const Text(
                                            'Send Money',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: 'InterRegular',
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                              ]),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                firstContainer(
                                    context: context, constraints: constraints),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
          },
        );
      },
    );
  }

  Widget firstContainer({context, constraints}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 5,
          child: fin == 0
              ? container2(constraints.maxWidth)
              : fin == 1
                  ? screen(constraints.maxWidth)
                  : fin == 2
                      ? screen1(constraints.maxWidth)
                      : fin == 3
                          ? screen2(constraints)
                          : const SizedBox(),
        ),
        const SizedBox(
          width: 10,
        ),
        fin == 0 ? container3(constraints.maxWidth) : const SizedBox(),
      ],
    );
  }

  Widget firstContainer1({context, constraints}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 5,
          child: fin == 0
              ? container2(constraints.maxWidth)
              : fin == 1
                  ? screen(constraints.maxWidth)
                  : fin == 2
                      ? screen1(constraints.maxWidth)
                      : fin == 3
                          ? screen3(constraints)
                          : const SizedBox(),
        ),
      ],
    );
  }

  bool isdark = false;

  Widget container2(constraints) {
    return constraints < 600
        ? SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => container3(constraints),
                              )),
                          child: Container(
                            height: 120,
                            padding: const EdgeInsets.all(18),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: notifire.getbgcolor11,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Total Balance',
                                      style: TextStyle(
                                          fontFamily: 'InterRegular',
                                          fontSize: 12,
                                          color: notifire.getblackcolor,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const Spacer(),
                                    SvgPicture.asset('assets/moneys.svg',
                                        color: notifire.getblackcolor,
                                        height: 24),
                                  ],
                                ),
                                const Spacer(),
                                Row(
                                  children: [
                                    Text(
                                      '\$24,788',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'InterRegular',
                                        color: notifire.getblackcolor,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: notifire.getbgcolor10),
                                      child: Row(
                                        children: [
                                          const Text('+24%',
                                              style: TextStyle(
                                                color: Color(0xff7DC066),
                                                fontFamily: 'InterRegular',
                                                fontSize: 12,
                                              )),
                                          Image.asset('assets/trend-up.png',
                                              color: const Color(0xff7DC066),
                                              height: 16),
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 120,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: notifire.getbgcolor11,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Total Income',
                                style: TextStyle(
                                    fontFamily: 'InterRegular',
                                    fontSize: 12,
                                    color: notifire.getblackcolor,
                                    fontWeight: FontWeight.w600),
                              ),
                              const Spacer(),
                              SvgPicture.asset('assets/money-recive.svg',
                                  color: notifire.getblackcolor, height: 24),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Text(
                                '\$30,456',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: notifire.getblackcolor,
                                  fontFamily: 'InterRegular',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: notifire.getbgcolor10),
                                child: Row(
                                  children: [
                                    const Text('+24%',
                                        style: TextStyle(
                                          color: Color(0xff7DC066),
                                          fontFamily: 'InterRegular',
                                          fontSize: 12,
                                        )),
                                    Image.asset('assets/trend-up.png',
                                        color: const Color(0xff7DC066),
                                        height: 16),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 120,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: notifire.getbgcolor11,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Total Outcome',
                                style: TextStyle(
                                    fontFamily: 'InterRegular',
                                    fontSize: 12,
                                    color: notifire.getblackcolor,
                                    fontWeight: FontWeight.w600),
                              ),
                              const Spacer(),
                              SvgPicture.asset('assets/money-send(1).svg',
                                  color: notifire.getblackcolor, height: 24),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Text(
                                '\$7,888',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: notifire.getblackcolor,
                                  fontFamily: 'InterRegular',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: notifire.getbgcolor10),
                                child: Row(
                                  children: [
                                    const Text('+24%',
                                        style: TextStyle(
                                          color: Color(0xffE5646C),
                                          fontFamily: 'InterRegular',
                                          fontSize: 12,
                                        )),
                                    Image.asset('assets/trend-up.png',
                                        color: const Color(0xffE5646C),
                                        height: 16),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Latest Transactions',
                      style: TextStyle(
                        fontFamily: 'InterRegular',
                        fontSize: 16,
                        color: notifire.getblackcolor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: notifire.getbgcolor11,
                          // color: Colors.red,
                          borderRadius: BorderRadius.circular(15)),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: SizedBox(
                                  width: constraints < 1400 ? 1500 : Get.width,
                                  child: Table(
                                    border: TableBorder.all(
                                        color: Colors.transparent),
                                    columnWidths: const <int,
                                        TableColumnWidth>{},
                                    children: <TableRow>[
                                      TableRow(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Text(
                                              'ODSP29475',
                                              style: TextStyle(
                                                  fontFamily: 'InterRegular',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  color:
                                                      notifire.getblackcolor),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 20, left: 3),
                                            child: Row(
                                              children: [
                                                Image.asset(
                                                  'assets/Brand Logo11.png',
                                                  height: 40,
                                                  width: 40,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'McDonal Offical',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: notifire
                                                          .getblackcolor,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily:
                                                          'InterRegular'),
                                                ),
                                                const Text(
                                                  'Online Payment',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily:
                                                          'InterRegular',
                                                      color: Color(0xff727880)),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Row(
                                              children: [
                                                Text(
                                                  '15 Sep 2022 9:00 am',
                                                  style: TextStyle(
                                                    fontFamily: 'InterRegular',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color:
                                                        notifire.getblackcolor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Text(
                                              'Bank Transfer',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: notifire.getblackcolor,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'InterRegular'),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Center(
                                              child: Text('4',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: notifire
                                                          .getblackcolor,
                                                      fontFamily:
                                                          'InterRegular')),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Text(
                                              '\$293.01',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: notifire.getblackcolor,
                                                  fontFamily: 'InterRegular'),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Image.asset(
                                              'assets/more.png',
                                              height: 20,
                                            ),
                                          )
                                        ],
                                      ),
                                      dividerTable(context, constraints),
                                      TableRow(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Text(
                                              '0JG05JF44',
                                              style: TextStyle(
                                                fontFamily: 'InterRegular',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: notifire.getblackcolor,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 20, left: 3),
                                            child: Row(
                                              children: [
                                                Image.asset(
                                                  'assets/Brand Logo21.png',
                                                  height: 40,
                                                  width: 40,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Razer',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: notifire
                                                          .getblackcolor,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily:
                                                          'InterRegular'),
                                                ),
                                                const Text(
                                                  'Cash',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily:
                                                          'InterRegular',
                                                      color: Color(0xff727880)),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Row(
                                              children: [
                                                Text(
                                                  '25 Sep 2022 11:00 am',
                                                  style: TextStyle(
                                                    fontFamily: 'InterRegular',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color:
                                                        notifire.getblackcolor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Text(
                                              'Visa Card',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: notifire.getblackcolor,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'InterRegular'),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Center(
                                              child: Text('56',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: notifire
                                                          .getblackcolor,
                                                      fontFamily:
                                                          'InterRegular')),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Text(
                                              '\$666.81',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: notifire.getblackcolor,
                                                  fontFamily: 'InterRegular'),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Image.asset(
                                              'assets/more.png',
                                              height: 20,
                                            ),
                                          )
                                        ],
                                      ),
                                      dividerTable(context, constraints),
                                      TableRow(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Text(
                                              '0JG05JF44',
                                              style: TextStyle(
                                                fontFamily: 'InterRegular',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: notifire.getblackcolor,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 20, left: 3),
                                            child: Row(
                                              children: [
                                                Image.asset(
                                                  'assets/avatar-6 1.png',
                                                  height: 40,
                                                  width: 40,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Raj Agrawal',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: notifire
                                                          .getblackcolor,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily:
                                                          'InterRegular'),
                                                ),
                                                const Text(
                                                  'Online Payment',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily:
                                                          'InterRegular',
                                                      color: Color(0xff727880)),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Row(
                                              children: [
                                                Text(
                                                  '15 Nov 2024 17:00 am',
                                                  style: TextStyle(
                                                    fontFamily: 'InterRegular',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color:
                                                        notifire.getblackcolor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Text(
                                              'Visa Card',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: notifire.getblackcolor,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'InterRegular'),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Center(
                                              child: Text('100',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: notifire
                                                          .getblackcolor,
                                                      fontFamily:
                                                          'InterRegular')),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Text(
                                              '\$500.44',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: notifire.getblackcolor,
                                                  fontFamily: 'InterRegular'),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Image.asset(
                                              'assets/more.png',
                                              height: 20,
                                            ),
                                          )
                                        ],
                                      ),
                                      dividerTable(context, constraints),
                                      TableRow(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Text(
                                              '0IFHGU345',
                                              style: TextStyle(
                                                fontFamily: 'InterRegular',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: notifire.getblackcolor,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 20, left: 3),
                                            child: Row(
                                              children: [
                                                Image.asset(
                                                  'assets/avatar-7 1.png',
                                                  height: 40,
                                                  width: 40,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Ananya Ishana',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: notifire
                                                          .getblackcolor,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily:
                                                          'InterRegular'),
                                                ),
                                                const Text(
                                                  'Bank Transfer',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily:
                                                          'InterRegular',
                                                      color: Color(0xff727880)),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Row(
                                              children: [
                                                Text('26 Nov 2024 06:00 am',
                                                    style: TextStyle(
                                                      fontFamily:
                                                          'InterRegular',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14,
                                                      color: notifire
                                                          .getblackcolor,
                                                    )),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Text(
                                              'Bank Transfer',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: notifire.getblackcolor,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'InterRegular'),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Center(
                                              child: Text('10',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: notifire
                                                          .getblackcolor,
                                                      fontFamily:
                                                          'InterRegular')),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Text(
                                              '\$600',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: notifire.getblackcolor,
                                                  fontFamily: 'InterRegular'),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Image.asset(
                                              'assets/more.png',
                                              height: 20,
                                            ),
                                          )
                                        ],
                                      ),
                                      dividerTable(context, constraints),
                                      TableRow(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Text(
                                              '03JFGJ233',
                                              style: TextStyle(
                                                fontFamily: 'InterRegular',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: notifire.getblackcolor,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 20, left: 3),
                                            child: Row(
                                              children: [
                                                Image.asset(
                                                  'assets/Brand Logo22.png',
                                                  height: 40,
                                                  width: 40,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Microsoft',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: notifire
                                                          .getblackcolor,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily:
                                                          'InterRegular'),
                                                ),
                                                const Text(
                                                  'Online Payment',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily:
                                                          'InterRegular',
                                                      color: Color(0xff727880)),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Row(
                                              children: [
                                                Text(
                                                  '18 Nov 2023 12:00 am',
                                                  style: TextStyle(
                                                      fontFamily:
                                                          'InterRegular',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14,
                                                      color: notifire
                                                          .getblackcolor),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Text(
                                              'Visa Card',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: notifire.getblackcolor,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'InterRegular'),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Center(
                                              child: Text('100',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: notifire
                                                          .getblackcolor,
                                                      fontFamily:
                                                          'InterRegular')),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Text(
                                              '\$120.45',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: notifire.getblackcolor,
                                                  fontFamily: 'InterRegular'),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Image.asset(
                                              'assets/more.png',
                                              height: 20,
                                            ),
                                          )
                                        ],
                                      ),
                                      dividerTable(context, constraints),
                                      TableRow(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Text(
                                              '0THFH4857',
                                              style: TextStyle(
                                                  fontFamily: 'InterRegular',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  color:
                                                      notifire.getblackcolor),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 20, left: 3),
                                            child: Row(
                                              children: [
                                                Image.asset(
                                                  'assets/Store Avatar(1).png',
                                                  height: 40,
                                                  width: 40,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Netflix',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: notifire
                                                          .getblackcolor,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily:
                                                          'InterRegular'),
                                                ),
                                                const Text(
                                                  'Bank Transfer',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily:
                                                          'InterRegular',
                                                      color: Color(0xff727880)),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Row(
                                              children: [
                                                Text(
                                                  '12 AUG 2022 08:00 am',
                                                  style: TextStyle(
                                                      fontFamily:
                                                          'InterRegular',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14,
                                                      color: notifire
                                                          .getblackcolor),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Text(
                                              'Bitcoin',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: notifire.getblackcolor,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'InterRegular'),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Center(
                                              child: Text('18',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: notifire
                                                          .getblackcolor,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily:
                                                          'InterRegular')),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Text(
                                              '\$150.99',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: notifire.getblackcolor,
                                                  fontFamily: 'InterRegular'),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Image.asset(
                                              'assets/more.png',
                                              height: 20,
                                            ),
                                          )
                                        ],
                                      ),
                                      dividerTable(context, constraints),
                                      TableRow(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Text(
                                              '0NF945NFG',
                                              style: TextStyle(
                                                  fontFamily: 'InterRegular',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  color:
                                                      notifire.getblackcolor),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 20, left: 3),
                                            child: Row(
                                              children: [
                                                Image.asset(
                                                  'assets/avatar-8 1.png',
                                                  height: 40,
                                                  width: 40,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Sharma Strore',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: notifire
                                                          .getblackcolor,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily:
                                                          'InterRegular'),
                                                ),
                                                const Text(
                                                  'Bank Transfer',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily:
                                                          'InterRegular',
                                                      color: Color(0xff727880)),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Row(
                                              children: [
                                                Text(
                                                  '09 Nov 2024 05:00 am',
                                                  style: TextStyle(
                                                      fontFamily:
                                                          'InterRegular',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14,
                                                      color: notifire
                                                          .getblackcolor),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Text(
                                              'Visa Card',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: notifire.getblackcolor,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'InterRegular'),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Center(
                                              child: Text('20',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: notifire
                                                          .getblackcolor,
                                                      fontFamily:
                                                          'InterRegular')),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Text(
                                              '\$90.44',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: notifire.getblackcolor,
                                                  fontFamily: 'InterRegular'),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Image.asset(
                                              'assets/more.png',
                                              height: 20,
                                            ),
                                          )
                                        ],
                                      ),
                                      dividerTable(context, constraints),
                                      TableRow(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Text(
                                              '0JG05JF44',
                                              style: TextStyle(
                                                  fontFamily: 'InterRegular',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  color:
                                                      notifire.getblackcolor),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 20, left: 3),
                                            child: Row(
                                              children: [
                                                Image.asset(
                                                  'assets/Brand Logo21.png',
                                                  height: 40,
                                                  width: 40,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Razer',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: notifire
                                                          .getblackcolor,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily:
                                                          'InterRegular'),
                                                ),
                                                const Text(
                                                  'Cash',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily:
                                                          'InterRegular',
                                                      color: Color(0xff727880)),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Row(
                                              children: [
                                                Text(
                                                  '25 Sep 2022 11:00 am',
                                                  style: TextStyle(
                                                      fontFamily:
                                                          'InterRegular',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14,
                                                      color: notifire
                                                          .getblackcolor),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Text(
                                              'Visa Card',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: notifire.getblackcolor,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'InterRegular'),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Center(
                                              child: Text('56',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: notifire
                                                          .getblackcolor,
                                                      fontFamily:
                                                          'InterRegular')),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Text(
                                              '\$666.81',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: notifire.getblackcolor,
                                                  fontFamily: 'InterRegular'),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Image.asset(
                                              'assets/more.png',
                                              height: 20,
                                            ),
                                          )
                                        ],
                                      ),
                                      dividerTable(context, constraints),
                                      TableRow(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Text(
                                              '0JG05JF44',
                                              style: TextStyle(
                                                  fontFamily: 'InterRegular',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  color:
                                                      notifire.getblackcolor),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 20, left: 3),
                                            child: Row(
                                              children: [
                                                Image.asset(
                                                  'assets/avatar-6 1.png',
                                                  height: 40,
                                                  width: 40,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Raj Agrawal',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: notifire
                                                          .getblackcolor,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily:
                                                          'InterRegular'),
                                                ),
                                                const Text(
                                                  'Online Payment',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily:
                                                          'InterRegular',
                                                      color: Color(0xff727880)),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Row(
                                              children: [
                                                Text(
                                                  '15 Nov 2024 17:00 am',
                                                  style: TextStyle(
                                                      fontFamily:
                                                          'InterRegular',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14,
                                                      color: notifire
                                                          .getblackcolor),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Text(
                                              'Visa Card',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: notifire.getblackcolor,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'InterRegular'),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Center(
                                              child: Text('100',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: notifire
                                                          .getblackcolor,
                                                      fontFamily:
                                                          'InterRegular')),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Text(
                                              '\$500.44',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: notifire.getblackcolor,
                                                  fontFamily: 'InterRegular'),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Image.asset(
                                              'assets/more.png',
                                              height: 20,
                                            ),
                                          )
                                        ],
                                      ),
                                      dividerTable(context, constraints),
                                      TableRow(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Text(
                                              '0JG05JF44',
                                              style: TextStyle(
                                                fontFamily: 'InterRegular',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: notifire.getblackcolor,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 20, left: 3),
                                            child: Row(
                                              children: [
                                                Image.asset(
                                                  'assets/Brand Logo21.png',
                                                  height: 40,
                                                  width: 40,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Razer',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: notifire
                                                          .getblackcolor,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily:
                                                          'InterRegular'),
                                                ),
                                                const Text(
                                                  'Cash',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily:
                                                          'InterRegular',
                                                      color: Color(0xff727880)),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Row(
                                              children: [
                                                Text(
                                                  '25 Sep 2022 11:00 am',
                                                  style: TextStyle(
                                                    fontFamily: 'InterRegular',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color:
                                                        notifire.getblackcolor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Text(
                                              'Visa Card',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: notifire.getblackcolor,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'InterRegular'),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Center(
                                              child: Text('56',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: notifire
                                                          .getblackcolor,
                                                      fontFamily:
                                                          'InterRegular')),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Text(
                                              '\$666.81',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: notifire.getblackcolor,
                                                  fontFamily: 'InterRegular'),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Image.asset(
                                              'assets/more.png',
                                              height: 20,
                                            ),
                                          )
                                        ],
                                      ),
                                      dividerTable(context, constraints),
                                      TableRow(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Text(
                                              '0JG05JF44',
                                              style: TextStyle(
                                                fontFamily: 'InterRegular',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: notifire.getblackcolor,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 20, left: 3),
                                            child: Row(
                                              children: [
                                                Image.asset(
                                                  'assets/avatar-6 1.png',
                                                  height: 40,
                                                  width: 40,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Raj Agrawal',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: notifire
                                                          .getblackcolor,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily:
                                                          'InterRegular'),
                                                ),
                                                const Text(
                                                  'Online Payment',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily:
                                                          'InterRegular',
                                                      color: Color(0xff727880)),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Row(
                                              children: [
                                                Text(
                                                  '15 Nov 2024 17:00 am',
                                                  style: TextStyle(
                                                    fontFamily: 'InterRegular',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color:
                                                        notifire.getblackcolor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Text(
                                              'Visa Card',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: notifire.getblackcolor,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'InterRegular'),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Center(
                                              child: Text('100',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: notifire
                                                          .getblackcolor,
                                                      fontFamily:
                                                          'InterRegular')),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Text(
                                              '\$500.44',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: notifire.getblackcolor,
                                                  fontFamily: 'InterRegular'),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Image.asset(
                                              'assets/more.png',
                                              height: 20,
                                            ),
                                          )
                                        ],
                                      ),
                                      dividerTable(context, constraints),
                                      TableRow(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Text(
                                              '0IFHGU345',
                                              style: TextStyle(
                                                fontFamily: 'InterRegular',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: notifire.getblackcolor,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 20, left: 3),
                                            child: Row(
                                              children: [
                                                Image.asset(
                                                  'assets/avatar-7 1.png',
                                                  height: 40,
                                                  width: 40,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Ananya Ishana',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: notifire
                                                          .getblackcolor,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily:
                                                          'InterRegular'),
                                                ),
                                                const Text(
                                                  'Bank Transfer',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily:
                                                          'InterRegular',
                                                      color: Color(0xff727880)),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Row(
                                              children: [
                                                Text('26 Nov 2024 06:00 am',
                                                    style: TextStyle(
                                                      fontFamily:
                                                          'InterRegular',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14,
                                                      color: notifire
                                                          .getblackcolor,
                                                    )),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Text(
                                              'Bank Transfer',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: notifire.getblackcolor,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'InterRegular'),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Center(
                                              child: Text('10',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: notifire
                                                          .getblackcolor,
                                                      fontFamily:
                                                          'InterRegular')),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Text(
                                              '\$600',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: notifire.getblackcolor,
                                                  fontFamily: 'InterRegular'),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Image.asset(
                                              'assets/more.png',
                                              height: 20,
                                            ),
                                          )
                                        ],
                                      ),
                                      dividerTable(context, constraints),
                                      TableRow(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Text(
                                              '03JFGJ233',
                                              style: TextStyle(
                                                fontFamily: 'InterRegular',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: notifire.getblackcolor,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 20, left: 3),
                                            child: Row(
                                              children: [
                                                Image.asset(
                                                  'assets/Brand Logo22.png',
                                                  height: 40,
                                                  width: 40,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Microsoft',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: notifire
                                                          .getblackcolor,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily:
                                                          'InterRegular'),
                                                ),
                                                const Text(
                                                  'Online Payment',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily:
                                                          'InterRegular',
                                                      color: Color(0xff727880)),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Row(
                                              children: [
                                                Text(
                                                  '18 Nov 2023 12:00 am',
                                                  style: TextStyle(
                                                      fontFamily:
                                                          'InterRegular',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14,
                                                      color: notifire
                                                          .getblackcolor),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Text(
                                              'Visa Card',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: notifire.getblackcolor,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'InterRegular'),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Center(
                                              child: Text('100',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: notifire
                                                          .getblackcolor,
                                                      fontFamily:
                                                          'InterRegular')),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Text(
                                              '\$120.45',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: notifire.getblackcolor,
                                                  fontFamily: 'InterRegular'),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Image.asset(
                                              'assets/more.png',
                                              height: 20,
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
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 110,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: notifire.getbgcolor11,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Total Balance',
                                style: TextStyle(
                                    fontFamily: 'InterRegular',
                                    fontSize: 12,
                                    color: notifire.getblackcolor,
                                    fontWeight: FontWeight.w600),
                              ),
                              const Spacer(),
                              SvgPicture.asset('assets/moneys.svg',
                                  color: notifire.getblackcolor, height: 24),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Text(
                                '\$24,788',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'InterRegular',
                                  fontWeight: FontWeight.w600,
                                  color: notifire.getblackcolor,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: notifire.getbgcolor10),
                                child: Row(
                                  children: [
                                    const Text('+24%',
                                        style: TextStyle(
                                          color: Color(0xff7DC066),
                                          fontFamily: 'InterRegular',
                                          fontSize: 12,
                                        )),
                                    Image.asset('assets/trend-up.png',
                                        color: const Color(0xff7DC066),
                                        height: 16),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      height: 110,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: notifire.getbgcolor11,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Total Income',
                                style: TextStyle(
                                    fontFamily: 'InterRegular',
                                    fontSize: 12,
                                    color: notifire.getblackcolor,
                                    fontWeight: FontWeight.w600),
                              ),
                              const Spacer(),
                              SvgPicture.asset('assets/money-recive.svg',
                                  color: notifire.getblackcolor, height: 24),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Text(
                                '\$30,456',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'InterRegular',
                                  fontWeight: FontWeight.w600,
                                  color: notifire.getblackcolor,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: notifire.getbgcolor10),
                                child: Row(
                                  children: [
                                    const Text('+24%',
                                        style: TextStyle(
                                          color: Color(0xff7DC066),
                                          fontFamily: 'InterRegular',
                                          fontSize: 12,
                                        )),
                                    Image.asset('assets/trend-up.png',
                                        color: const Color(0xff7DC066),
                                        height: 16),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      height: 110,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: notifire.getbgcolor11,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Total Outcome',
                                style: TextStyle(
                                    fontFamily: 'InterRegular',
                                    fontSize: 12,
                                    color: notifire.getblackcolor,
                                    fontWeight: FontWeight.w600),
                              ),
                              const Spacer(),
                              SvgPicture.asset('assets/money-send(1).svg',
                                  color: notifire.getblackcolor, height: 24),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Text(
                                '\$7,888',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'InterRegular',
                                  fontWeight: FontWeight.w600,
                                  color: notifire.getblackcolor,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: notifire.getbgcolor10),
                                child: Row(
                                  children: [
                                    const Text('+24%',
                                        style: TextStyle(
                                          color: Color(0xffE5646C),
                                          fontFamily: 'InterRegular',
                                          fontSize: 12,
                                        )),
                                    Image.asset('assets/trend-up.png',
                                        color: const Color(0xffE5646C),
                                        height: 16),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Latest Transactions',
                style: TextStyle(
                  fontFamily: 'InterRegular',
                  fontSize: 16,
                  color: notifire.getblackcolor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    color: notifire.getbgcolor11,
                    // color: Colors.red,
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: SizedBox(
                          width: constraints < 1400 ? 1500 : Get.width,
                          child: Table(
                            border: TableBorder.all(color: Colors.transparent),
                            columnWidths: const <int, TableColumnWidth>{},
                            children: <TableRow>[
                              TableRow(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      '0JG05JF44',
                                      style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: notifire.getblackcolor,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 20, left: 3),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/avatar-6 1.png',
                                          height: 40,
                                          width: 40,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Raj Agrawal',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: notifire.getblackcolor,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'InterRegular'),
                                        ),
                                        const Text(
                                          'Online Payment',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: 'InterRegular',
                                              color: Color(0xff727880)),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Row(
                                      children: [
                                        Text(
                                          '15 Nov 2024 17:00 am',
                                          style: TextStyle(
                                            fontFamily: 'InterRegular',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: notifire.getblackcolor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      'Visa Card',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Center(
                                      child: Text('100',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: notifire.getblackcolor,
                                              fontFamily: 'InterRegular')),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      '\$500.44',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Image.asset(
                                      'assets/more.png',
                                      height: 20,
                                    ),
                                  )
                                ],
                              ),
                              dividerTable(context, constraints),
                              TableRow(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      '0IFHGU345',
                                      style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: notifire.getblackcolor,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 20, left: 3),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/avatar-7 1.png',
                                          height: 40,
                                          width: 40,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Ananya Ishana',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: notifire.getblackcolor,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'InterRegular'),
                                        ),
                                        const Text(
                                          'Bank Transfer',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: 'InterRegular',
                                              color: Color(0xff727880)),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Row(
                                      children: [
                                        Text('26 Nov 2024 06:00 am',
                                            style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              color: notifire.getblackcolor,
                                            )),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      'Bank Transfer',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Center(
                                      child: Text('10',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: notifire.getblackcolor,
                                              fontFamily: 'InterRegular')),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      '\$600',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Image.asset(
                                      'assets/more.png',
                                      height: 20,
                                    ),
                                  )
                                ],
                              ),
                              dividerTable(context, constraints),
                              TableRow(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      '03JFGJ233',
                                      style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: notifire.getblackcolor,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 20, left: 3),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/Brand Logo22.png',
                                          height: 40,
                                          width: 40,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Microsoft',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: notifire.getblackcolor,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'InterRegular'),
                                        ),
                                        const Text(
                                          'Online Payment',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: 'InterRegular',
                                              color: Color(0xff727880)),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Row(
                                      children: [
                                        Text(
                                          '18 Nov 2023 12:00 am',
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              color: notifire.getblackcolor),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      'Visa Card',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Center(
                                      child: Text('100',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: notifire.getblackcolor,
                                              fontFamily: 'InterRegular')),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      '\$120.45',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Image.asset(
                                      'assets/more.png',
                                      height: 20,
                                    ),
                                  )
                                ],
                              ),
                              dividerTable(context, constraints),
                              TableRow(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      '0THFH4857',
                                      style: TextStyle(
                                          fontFamily: 'InterRegular',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: notifire.getblackcolor),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 20, left: 3),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/Store Avatar(1).png',
                                          height: 40,
                                          width: 40,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Netflix',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: notifire.getblackcolor,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'InterRegular'),
                                        ),
                                        const Text(
                                          'Bank Transfer',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: 'InterRegular',
                                              color: Color(0xff727880)),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Row(
                                      children: [
                                        Text(
                                          '12 AUG 2022 08:00 am',
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              color: notifire.getblackcolor),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      'Bitcoin',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Center(
                                      child: Text('18',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: notifire.getblackcolor,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'InterRegular')),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      '\$150.99',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Image.asset(
                                      'assets/more.png',
                                      height: 20,
                                    ),
                                  )
                                ],
                              ),
                              dividerTable(context, constraints),
                              TableRow(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      '0NF945NFG',
                                      style: TextStyle(
                                          fontFamily: 'InterRegular',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: notifire.getblackcolor),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 20, left: 3),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/avatar-8 1.png',
                                          height: 40,
                                          width: 40,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Sharma Strore',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: notifire.getblackcolor,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'InterRegular'),
                                        ),
                                        const Text(
                                          'Bank Transfer',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: 'InterRegular',
                                              color: Color(0xff727880)),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Row(
                                      children: [
                                        Text(
                                          '09 Nov 2024 05:00 am',
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              color: notifire.getblackcolor),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      'Visa Card',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Center(
                                      child: Text('20',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: notifire.getblackcolor,
                                              fontFamily: 'InterRegular')),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      '\$90.44',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Image.asset(
                                      'assets/more.png',
                                      height: 20,
                                    ),
                                  )
                                ],
                              ),
                              dividerTable(context, constraints),
                              TableRow(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      '0JG05JF44',
                                      style: TextStyle(
                                          fontFamily: 'InterRegular',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: notifire.getblackcolor),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 20, left: 3),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/Brand Logo21.png',
                                          height: 40,
                                          width: 40,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Razer',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: notifire.getblackcolor,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'InterRegular'),
                                        ),
                                        const Text(
                                          'Cash',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: 'InterRegular',
                                              color: Color(0xff727880)),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Row(
                                      children: [
                                        Text(
                                          '25 Sep 2022 11:00 am',
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              color: notifire.getblackcolor),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      'Visa Card',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Center(
                                      child: Text('56',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: notifire.getblackcolor,
                                              fontFamily: 'InterRegular')),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      '\$666.81',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Image.asset(
                                      'assets/more.png',
                                      height: 20,
                                    ),
                                  )
                                ],
                              ),
                              dividerTable(context, constraints),
                              TableRow(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      '0JG05JF44',
                                      style: TextStyle(
                                          fontFamily: 'InterRegular',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: notifire.getblackcolor),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 20, left: 3),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/avatar-6 1.png',
                                          height: 40,
                                          width: 40,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Raj Agrawal',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: notifire.getblackcolor,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'InterRegular'),
                                        ),
                                        const Text(
                                          'Online Payment',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: 'InterRegular',
                                              color: Color(0xff727880)),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Row(
                                      children: [
                                        Text(
                                          '15 Nov 2024 17:00 am',
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              color: notifire.getblackcolor),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      'Visa Card',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Center(
                                      child: Text('100',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: notifire.getblackcolor,
                                              fontFamily: 'InterRegular')),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      '\$500.44',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Image.asset(
                                      'assets/more.png',
                                      height: 20,
                                    ),
                                  )
                                ],
                              ),
                              dividerTable(context, constraints),
                              TableRow(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      '0JG05JF44',
                                      style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: notifire.getblackcolor,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 20, left: 3),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/Brand Logo21.png',
                                          height: 40,
                                          width: 40,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Razer',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: notifire.getblackcolor,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'InterRegular'),
                                        ),
                                        const Text(
                                          'Cash',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: 'InterRegular',
                                              color: Color(0xff727880)),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Row(
                                      children: [
                                        Text(
                                          '25 Sep 2022 11:00 am',
                                          style: TextStyle(
                                            fontFamily: 'InterRegular',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: notifire.getblackcolor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      'Visa Card',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Center(
                                      child: Text('56',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: notifire.getblackcolor,
                                              fontFamily: 'InterRegular')),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      '\$666.81',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Image.asset(
                                      'assets/more.png',
                                      height: 20,
                                    ),
                                  )
                                ],
                              ),
                              dividerTable(context, constraints),
                              TableRow(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      '0JG05JF44',
                                      style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: notifire.getblackcolor,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 20, left: 3),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/avatar-6 1.png',
                                          height: 40,
                                          width: 40,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Raj Agrawal',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: notifire.getblackcolor,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'InterRegular'),
                                        ),
                                        const Text(
                                          'Online Payment',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: 'InterRegular',
                                              color: Color(0xff727880)),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Row(
                                      children: [
                                        Text(
                                          '15 Nov 2024 17:00 am',
                                          style: TextStyle(
                                            fontFamily: 'InterRegular',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: notifire.getblackcolor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      'Visa Card',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Center(
                                      child: Text('100',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: notifire.getblackcolor,
                                              fontFamily: 'InterRegular')),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      '\$500.44',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Image.asset(
                                      'assets/more.png',
                                      height: 20,
                                    ),
                                  )
                                ],
                              ),
                              dividerTable(context, constraints),
                              TableRow(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      '0IFHGU345',
                                      style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: notifire.getblackcolor,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 20, left: 3),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/avatar-7 1.png',
                                          height: 40,
                                          width: 40,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Ananya Ishana',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: notifire.getblackcolor,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'InterRegular'),
                                        ),
                                        const Text(
                                          'Bank Transfer',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: 'InterRegular',
                                              color: Color(0xff727880)),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Row(
                                      children: [
                                        Text('26 Nov 2024 06:00 am',
                                            style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              color: notifire.getblackcolor,
                                            )),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      'Bank Transfer',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Center(
                                      child: Text('10',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: notifire.getblackcolor,
                                              fontFamily: 'InterRegular')),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      '\$600',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Image.asset(
                                      'assets/more.png',
                                      height: 20,
                                    ),
                                  )
                                ],
                              ),
                              dividerTable(context, constraints),
                              TableRow(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      '03JFGJ233',
                                      style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: notifire.getblackcolor,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 20, left: 3),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/Brand Logo22.png',
                                          height: 40,
                                          width: 40,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Microsoft',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: notifire.getblackcolor,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'InterRegular'),
                                        ),
                                        const Text(
                                          'Online Payment',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: 'InterRegular',
                                              color: Color(0xff727880)),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Row(
                                      children: [
                                        Text(
                                          '18 Nov 2023 12:00 am',
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              color: notifire.getblackcolor),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      'Visa Card',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Center(
                                      child: Text('100',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: notifire.getblackcolor,
                                              fontFamily: 'InterRegular')),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      '\$120.45',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Image.asset(
                                      'assets/more.png',
                                      height: 20,
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
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
  }

  Widget container3(constraints) {
    return constraints < 600
        ? Scaffold(
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
                                                color: notifire.getblackcolor,
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
                                                    fontFamily: 'InterRegular',
                                                    color:
                                                        notifire.getblackcolor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(model().popo1[index],
                                                style: TextStyle(
                                                  fontFamily: 'InterRegular',
                                                  fontSize: 12,
                                                  color: notifire.getblackcolor,
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
                                              color: const Color(0xff595FE5)),
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
                                                  BorderRadius.circular(20)),
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
                                                  fontFamily: 'InterRegular',
                                                  color: notifire.getblackcolor,
                                                )),
                                            Text(model().popo2[index],
                                                style: TextStyle(
                                                  fontFamily: 'InterRegular',
                                                  fontSize: 12,
                                                  color: notifire.getblackcolor,
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
                                              color: const Color(0xff595FE5)),
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
                  shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  initialValue: selectedMenu,
                  elevation: 1,
                  constraints: const BoxConstraints(
                    maxWidth: 200,
                    minWidth: 200,
                  ),
                  shadowColor: Colors.grey,
                  color: notifire.getbgcolor11,
                  child: constraints < 700
                      ? Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(child: Image.asset('assets/avatar-6 1.png')),
                  )
                      : const Row(
                    children: [
                      CircleAvatar(
                          backgroundImage: AssetImage('assets/artist.png'),
                          backgroundColor: Colors.white,
                          radius: 15),
                    ],
                  ),
                  onSelected: (SampleItem item) {
                    setState(() {
                      selectedMenu = item;
                    });
                  },
                  itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
                    PopupMenuItem(
                        padding: EdgeInsets.zero,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                          inboxController.setTextIsTrue(38);
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
                      child:StatefulBuilder(
                          builder: (context, setState){
                            return InkWell(

                              child: Row(
                                children: [
                                  SvgPicture.asset('assets/globe 01.svg',
                                      height: 20,  color: notifire.getblackcolor),
                                  SizedBox(width: 10,),
                                  Text('RTL',style: TextStyle(color: notifire.getblackcolor,fontFamily: 'InterRegular')),
                                  const Spacer(),
                                  Transform.translate(
                                      offset: Offset(12, 0),
                                      child: switchButton()),

                                ],
                              ),
                            );
                          }
                      ),
                    ),
                  ],
                ),
                const Flexible(child: SizedBox(width: 10)),
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
                            prefixIcon: Image.asset('assets/search-normal.png',
                                scale: 4, color: const Color(0xff9DA2A7)),
                            hintStyle: TextStyle(color: notifire.getblackcolor),
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
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Container(
                      height: 180,
                      width: Get.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: const DecorationImage(
                            image: AssetImage('assets/Mocard 8.png'),
                            fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
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
                                Text('Community',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: notifire.getblackcolor,
                                      fontFamily: 'InterRegular',
                                      fontWeight: FontWeight.w600,
                                    )),
                                const Spacer(),
                                Image.asset(
                                  'assets/more.png',
                                  height: 20,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'How we connect together',
                              style: TextStyle(
                                  fontFamily: 'InterRegular',
                                  fontSize: 12,
                                  color: Color(0xff727880)),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            AspectRatio(
                              aspectRatio: 1.23,
                              child: Stack(
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 16, left: 6),
                                          child: _LineChart(
                                              isShowingMainData:
                                                  isShowingMainData),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.refresh,
                                      color: Color(0xff9DA2A7),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        isShowingMainData = !isShowingMainData;
                                      });
                                    },
                                  )
                                ],
                              ),
                            ),
                          ]),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: Get.width,
                      height: Get.height * 0.5,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: notifire.getbgcolor11,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Next Scheduled Payments',
                              style: TextStyle(
                                fontFamily: 'InterRegular',
                                fontSize: 16,
                                color: notifire.getblackcolor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ListView.separated(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    leading: Image.asset(model().fin1[index],
                                        height: 40),
                                    title: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(model().filanc[index],
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12,
                                                  color: notifire.getblackcolor,
                                                  fontFamily: 'InterRegular',
                                                )),
                                            const Spacer(),
                                            Text(model().fila[index],
                                                style: TextStyle(
                                                    fontFamily: 'InterRegular',
                                                    fontSize: 12,
                                                    color:
                                                        notifire.getblackcolor,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                          ],
                                        ),
                                        Container(
                                          width: 100,
                                          padding: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: notifire.Getgrey),
                                          child: Row(
                                            children: [
                                              Image.asset('assets/calendar.png',
                                                  height: 12,
                                                  color:
                                                      const Color(0xff727880)),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                model().filanc1[index],
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    fontFamily: 'InterRegular',
                                                    color: Color(0xff727880)),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return const Divider(
                                    height: 10,
                                    color: Color(0xffEEEEEE),
                                  );
                                },
                                itemCount: model().filanc1.length)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        : Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(color: notifire.getbgcolor10),
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      height: constraints > 1500
                          ? Get.height * 0.3
                          : constraints < 1500
                              ? Get.height * 0.3
                              : Get.height * 0.2,
                      width: Get.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: const DecorationImage(
                            image: AssetImage('assets/Mocard 8.png'),
                            fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
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
                                Text('Community',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: notifire.getblackcolor,
                                      fontFamily: 'InterRegular',
                                      fontWeight: FontWeight.w600,
                                    )),
                                const Spacer(),
                                Image.asset(
                                  'assets/more.png',
                                  height: 20,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'How we connect together',
                              style: TextStyle(
                                  fontFamily: 'InterRegular',
                                  fontSize: 12,
                                  color: Color(0xff727880)),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            AspectRatio(
                              aspectRatio: 1.23,
                              child: Stack(
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 16, left: 6),
                                          child: _LineChart(
                                              isShowingMainData:
                                                  isShowingMainData),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.refresh,
                                      color: Color(0xff9DA2A7),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        isShowingMainData = !isShowingMainData;
                                      });
                                    },
                                  )
                                ],
                              ),
                            ),
                          ]),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: Get.width,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: notifire.getbgcolor11,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Next Scheduled Payments',
                            style: TextStyle(
                              fontFamily: 'InterRegular',
                              fontSize: 16,
                              color: notifire.getblackcolor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ListView.separated(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: Image.asset(model().fin1[index],
                                      height: 40),
                                  title: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(model().filanc[index],
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12,
                                                color: notifire.getblackcolor,
                                                fontFamily: 'InterRegular',
                                              )),
                                          const Spacer(),
                                          Text(model().fila[index],
                                              style: TextStyle(
                                                  fontFamily: 'InterRegular',
                                                  color: notifire.getblackcolor,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600)),
                                        ],
                                      ),
                                      Container(
                                        width: 100,
                                        padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            color: notifire.Getblg2),
                                        child: Row(
                                          children: [
                                            Image.asset('assets/calendar.png',
                                                height: 12,
                                                color: const Color(0xff727880)),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              model().filanc1[index],
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'InterRegular',
                                                  color: Color(0xff727880)),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const Divider(
                                  height: 10,
                                  color: Color(0xffEEEEEE),
                                );
                              },
                              itemCount: model().filanc1.length)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
  }

  Widget screen(constraints) {
    return constraints < 600
        ? SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Date',
                            style: TextStyle(
                                fontFamily: 'InterRegular',
                                color: Color(0xff9DA2A7),
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Row(
                              children: [
                                const Text(
                                  'All Date',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'InterRegular',
                                      color: Color(0xff727880)),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Image.asset(
                                  'assets/arrow-down.png',
                                  color: const Color(0xff727880),
                                  height: 12,
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Text(
                            'Type',
                            style: TextStyle(
                                fontFamily: 'InterRegular',
                                color: Color(0xff9DA2A7),
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Row(
                              children: [
                                const Text(
                                  'All',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'InterRegular',
                                      color: Color(0xff727880)),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Image.asset(
                                  'assets/arrow-down.png',
                                  color: const Color(0xff727880),
                                  height: 12,
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Text(
                            'Sort by',
                            style: TextStyle(
                                fontFamily: 'InterRegular',
                                color: Color(0xff9DA2A7),
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Row(
                              children: [
                                const Text(
                                  'Newest',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'InterRegular',
                                      color: Color(0xff727880)),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Image.asset(
                                  'assets/arrow-down.png',
                                  color: const Color(0xff727880),
                                  height: 12,
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Today',
                  style: TextStyle(
                    color: notifire.getblackcolor,
                    fontFamily: 'InterRegular',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 10,
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
                        PopupMenuButton(
                          tooltip: '',
                          offset: const Offset(10, -20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 1,
                          splashRadius: 1,
                          constraints: const BoxConstraints(
                            maxWidth: 380,
                            minWidth: 380,
                          ),
                          shadowColor: Colors.grey,
                          color: notifire.getbgcolor11,
                          itemBuilder: (context) =>
                              <PopupMenuEntry<SampleItem>>[
                            PopupMenuItem(
                                height: 30,
                                padding: EdgeInsets.zero,
                                enabled: false,
                                child: SingleChildScrollView(
                                  child: StatefulBuilder(
                                    builder: (context, setState) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset('assets/header.png',
                                              width: double.infinity,
                                              height: 190),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            width: 60,
                                            padding: const EdgeInsets.all(6),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: const Color(0xff7DC066)),
                                            child: const Center(
                                                child: Text(
                                              'Paid',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14,
                                                  fontFamily: 'InterRegular'),
                                            )),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            '+545.23 USD to  Federal Credit Union Offical',
                                            style: TextStyle(
                                                fontFamily: 'InterRegular',
                                                fontSize: 20,
                                                color: notifire.getblackcolor,
                                                fontWeight: FontWeight.w600),
                                            textAlign: TextAlign.center,
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          const Text(
                                            '24 Aug 2022 09:11 am',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: 'InterRegular',
                                                color: Color(0xff9DA2A7)),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              width: Get.width,
                                              padding: const EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                color: notifire.Getblg2,
                                              ),
                                              child: Column(
                                                children: [
                                                  const Text(
                                                    'Transfer Number',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff9DA2A7),
                                                        fontFamily:
                                                            'InterRegular',
                                                        fontSize: 14),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    '#SP010-0018-2022',
                                                    style: TextStyle(
                                                        color: notifire
                                                            .getblackcolor,
                                                        fontFamily:
                                                            'InterRegular',
                                                        fontSize: 14),
                                                  ),
                                                  const SizedBox(
                                                    height: 15,
                                                  ),
                                                  const Text(
                                                    'Bank Transfer',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff9DA2A7),
                                                        fontFamily:
                                                            'InterRegular',
                                                        fontSize: 14),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    'CHDNLA10955AH-476844-NH02009',
                                                    style: TextStyle(
                                                        color: notifire
                                                            .getblackcolor,
                                                        fontFamily:
                                                            'InterRegular',
                                                        fontSize: 14),
                                                  ),
                                                  const SizedBox(
                                                    height: 15,
                                                  ),
                                                  const Text(
                                                    'Transfer Fee',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff9DA2A7),
                                                        fontFamily:
                                                            'InterRegular',
                                                        fontSize: 14),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    '5.99 USD',
                                                    style: TextStyle(
                                                        color: notifire
                                                            .getblackcolor,
                                                        fontFamily:
                                                            'InterRegular',
                                                        fontSize: 14),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                InkWell(
                                                  onTap: () {},
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            12),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        border: Border.all(
                                                            color: const Color(
                                                                0xffEEEEEE))),
                                                    child: Center(
                                                      child: Row(
                                                        children: [
                                                          SvgPicture.asset(
                                                              'assets/arrow-down111.svg',
                                                              height: 16),
                                                          const SizedBox(
                                                            width: 5,
                                                          ),
                                                          const Text(
                                                            'Download',
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontFamily:
                                                                  'InterRegular',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: Color(
                                                                  0xff727880),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                InkWell(
                                                  onTap: () {},
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            12),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        border: Border.all(
                                                            color: const Color(
                                                                0xffEEEEEE))),
                                                    child: Center(
                                                      child: Row(
                                                        children: [
                                                          Image.asset(
                                                              'assets/printer.png',
                                                              height: 16,
                                                              color: const Color(
                                                                  0xff727880)),
                                                          const SizedBox(
                                                            width: 5,
                                                          ),
                                                          const Text(
                                                            'Print',
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontFamily:
                                                                  'InterRegular',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: Color(
                                                                  0xff727880),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                InkWell(
                                                  onTap: () {},
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            12),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        border: Border.all(
                                                            color: const Color(
                                                                0xffEEEEEE))),
                                                    child: Center(
                                                      child: Row(
                                                        children: [
                                                          SvgPicture.asset(
                                                              'assets/dollar-circle1.svg',
                                                              height: 16),
                                                          const SizedBox(
                                                            width: 5,
                                                          ),
                                                          const Text(
                                                            'Refund',
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontFamily:
                                                                  'InterRegular',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: Color(
                                                                  0xff727880),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                )),
                          ],
                          child: SizedBox(
                            width: constraints < 1400 ? 1500 : Get.width,
                            child: Table(
                              border:
                                  TableBorder.all(color: Colors.transparent),
                              columnWidths: const <int, TableColumnWidth>{
                                0: FixedColumnWidth(20),
                                1: FixedColumnWidth(100),
                                2: FixedColumnWidth(100),
                                3: FixedColumnWidth(150),
                                4: FixedColumnWidth(150),
                                5: FixedColumnWidth(150),
                                6: FixedColumnWidth(50),
                                7: FixedColumnWidth(10),
                              },
                              children: <TableRow>[
                                TableRow(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25, left: 8),
                                      child: Image.asset('assets/timer.png',
                                          height: 16,
                                          color: const Color(0xff9DA2A7)),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 25, left: 8),
                                      child: Row(
                                        children: [
                                          Text(
                                            '5:00 PM',
                                            style: TextStyle(
                                                fontFamily: 'InterRegular',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: Color(0xff727880)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 13, left: 3),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'assets/Media14.png',
                                            height: 40,
                                            width: 40,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25, left: 8),
                                      child: Text(
                                        'Dark circles Store',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: notifire.getblackcolor,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'InterRegular'),
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 25, left: 8),
                                      child: Text(
                                        'Online Payment',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xff727880),
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'InterRegular'),
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 25, left: 8),
                                      child: Center(
                                        child: Text('\$3.99',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xff727880),
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'InterRegular')),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25, left: 8),
                                      child: Text(
                                        '-\$293.01',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: notifire.getblackcolor,
                                            fontFamily: 'InterRegular'),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25, left: 8),
                                      child: Image.asset(
                                        'assets/more.png',
                                        height: 20,
                                        color: const Color(0xff9DA2A7),
                                      ),
                                    )
                                  ],
                                ),
                                dividerTable1(context, constraints),
                                TableRow(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25, left: 8),
                                      child: Image.asset('assets/timer.png',
                                          height: 16,
                                          color: const Color(0xff9DA2A7)),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 25, left: 8),
                                      child: Row(
                                        children: [
                                          Text(
                                            '9:00 AM',
                                            style: TextStyle(
                                                fontFamily: 'InterRegular',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: Color(0xff727880)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 13, left: 3),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'assets/Media13.png',
                                            height: 40,
                                            width: 40,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25, left: 8),
                                      child: Text(
                                        'Razer',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: notifire.getblackcolor,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'InterRegular'),
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 25, left: 8),
                                      child: Text(
                                        'Cash',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xff727880),
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'InterRegular'),
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 25, left: 8),
                                      child: Center(
                                        child: Text('\$7.99',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xff727880),
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'InterRegular')),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25, left: 8),
                                      child: Text(
                                        '-\$300.99',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: notifire.getblackcolor,
                                            fontFamily: 'InterRegular'),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25, left: 8),
                                      child: Image.asset(
                                        'assets/more.png',
                                        height: 20,
                                        color: const Color(0xff9DA2A7),
                                      ),
                                    )
                                  ],
                                ),
                                dividerTable1(context, constraints),
                                TableRow(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25, left: 8),
                                      child: Image.asset('assets/timer.png',
                                          height: 16,
                                          color: const Color(0xff9DA2A7)),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 25, left: 8),
                                      child: Row(
                                        children: [
                                          Text(
                                            '19:00 AM',
                                            style: TextStyle(
                                                fontFamily: 'InterRegular',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: Color(0xff727880)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 13, left: 3),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'assets/avatar-6 1.png',
                                            height: 40,
                                            width: 40,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25, left: 8),
                                      child: Text(
                                        'Ralph Edwards',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: notifire.getblackcolor,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'InterRegular'),
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 25, left: 8),
                                      child: Text(
                                        'Online Payment',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xff727880),
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'InterRegular'),
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 25, left: 8),
                                      child: Center(
                                        child: Text('\$17.99',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xff727880),
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'InterRegular')),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25, left: 8),
                                      child: Text(
                                        '-\$60.99',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: notifire.getblackcolor,
                                            fontFamily: 'InterRegular'),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25, left: 8),
                                      child: Image.asset(
                                        'assets/more.png',
                                        height: 20,
                                        color: const Color(0xff9DA2A7),
                                      ),
                                    )
                                  ],
                                ),
                                dividerTable1(context, constraints),
                                TableRow(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25, left: 8),
                                      child: Image.asset('assets/timer.png',
                                          height: 16,
                                          color: const Color(0xff9DA2A7)),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 25, left: 8),
                                      child: Row(
                                        children: [
                                          Text(
                                            '20:00 PM',
                                            style: TextStyle(
                                                fontFamily: 'InterRegular',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: Color(0xff727880)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 13, left: 3),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'assets/avatar-7 1.png',
                                            height: 40,
                                            width: 40,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25, left: 8),
                                      child: Text(
                                        'Bessie Cooper',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: notifire.getblackcolor,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'InterRegular'),
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 25, left: 8),
                                      child: Text(
                                        'Bank Transfer',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xff727880),
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'InterRegular'),
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 25, left: 8),
                                      child: Center(
                                        child: Text('\$3.99',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xff727880),
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'InterRegular')),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25, left: 8),
                                      child: Text(
                                        '-\$260.99',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: notifire.getblackcolor,
                                            fontFamily: 'InterRegular'),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25, left: 8),
                                      child: Image.asset(
                                        'assets/more.png',
                                        height: 20,
                                        color: const Color(0xff9DA2A7),
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
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Yesterday',
                  style: TextStyle(
                    color: notifire.getblackcolor,
                    fontFamily: 'InterRegular',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 10,
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
                        PopupMenuButton(
                          tooltip: '',
                          offset: const Offset(10, -20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 1,
                          splashRadius: 1,
                          constraints: const BoxConstraints(
                            maxWidth: 380,
                            minWidth: 380,
                          ),
                          shadowColor: Colors.grey,
                          color: notifire.getbgcolor11,
                          itemBuilder: (context) =>
                              <PopupMenuEntry<SampleItem>>[
                            PopupMenuItem(
                                height: 30,
                                padding: EdgeInsets.zero,
                                enabled: false,
                                child: SingleChildScrollView(
                                  child: StatefulBuilder(
                                    builder: (context, setState) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset('assets/header.png',
                                              width: double.infinity,
                                              height: 190),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            width: 60,
                                            padding: const EdgeInsets.all(6),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: const Color(0xff7DC066)),
                                            child: const Center(
                                                child: Text(
                                              'Paid',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14,
                                                  fontFamily: 'InterRegular'),
                                            )),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            '+545.23 USD to  Federal Credit Union Offical',
                                            style: TextStyle(
                                                fontFamily: 'InterRegular',
                                                fontSize: 20,
                                                color: notifire.getblackcolor,
                                                fontWeight: FontWeight.w600),
                                            textAlign: TextAlign.center,
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          const Text(
                                            '24 Aug 2022 09:11 am',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: 'InterRegular',
                                                color: Color(0xff9DA2A7)),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              width: Get.width,
                                              padding: const EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                color: notifire.Getblg2,
                                              ),
                                              child: Column(
                                                children: [
                                                  const Text(
                                                    'Transfer Number',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff9DA2A7),
                                                        fontFamily:
                                                            'InterRegular',
                                                        fontSize: 14),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    '#SP010-0018-2022',
                                                    style: TextStyle(
                                                        color: notifire
                                                            .getblackcolor,
                                                        fontFamily:
                                                            'InterRegular',
                                                        fontSize: 14),
                                                  ),
                                                  const SizedBox(
                                                    height: 15,
                                                  ),
                                                  const Text(
                                                    'Bank Transfer',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff9DA2A7),
                                                        fontFamily:
                                                            'InterRegular',
                                                        fontSize: 14),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    'CHDNLA10955AH-476844-NH02009',
                                                    style: TextStyle(
                                                        color: notifire
                                                            .getblackcolor,
                                                        fontFamily:
                                                            'InterRegular',
                                                        fontSize: 14),
                                                  ),
                                                  const SizedBox(
                                                    height: 15,
                                                  ),
                                                  const Text(
                                                    'Transfer Fee',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff9DA2A7),
                                                        fontFamily:
                                                            'InterRegular',
                                                        fontSize: 14),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    '5.99 USD',
                                                    style: TextStyle(
                                                        color: notifire
                                                            .getblackcolor,
                                                        fontFamily:
                                                            'InterRegular',
                                                        fontSize: 14),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                InkWell(
                                                  onTap: () {},
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            12),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        border: Border.all(
                                                            color: const Color(
                                                                0xffEEEEEE))),
                                                    child: Center(
                                                      child: Row(
                                                        children: [
                                                          SvgPicture.asset(
                                                              'assets/arrow-down111.svg',
                                                              height: 16),
                                                          const SizedBox(
                                                            width: 5,
                                                          ),
                                                          const Text(
                                                            'Download',
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontFamily:
                                                                  'InterRegular',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: Color(
                                                                  0xff727880),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                InkWell(
                                                  onTap: () {},
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            12),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        border: Border.all(
                                                            color: const Color(
                                                                0xffEEEEEE))),
                                                    child: Center(
                                                      child: Row(
                                                        children: [
                                                          Image.asset(
                                                              'assets/printer.png',
                                                              height: 16,
                                                              color: const Color(
                                                                  0xff727880)),
                                                          const SizedBox(
                                                            width: 5,
                                                          ),
                                                          const Text(
                                                            'Print',
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontFamily:
                                                                  'InterRegular',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: Color(
                                                                  0xff727880),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                InkWell(
                                                  onTap: () {},
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            12),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        border: Border.all(
                                                            color: const Color(
                                                                0xffEEEEEE))),
                                                    child: Center(
                                                      child: Row(
                                                        children: [
                                                          SvgPicture.asset(
                                                              'assets/dollar-circle1.svg',
                                                              height: 16),
                                                          const SizedBox(
                                                            width: 5,
                                                          ),
                                                          const Text(
                                                            'Refund',
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontFamily:
                                                                  'InterRegular',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: Color(
                                                                  0xff727880),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                )),
                          ],
                          child: SizedBox(
                            width: constraints < 1400 ? 1500 : Get.width,
                            child: Table(
                              border:
                                  TableBorder.all(color: Colors.transparent),
                              columnWidths: const <int, TableColumnWidth>{
                                0: FixedColumnWidth(20),
                                1: FixedColumnWidth(100),
                                2: FixedColumnWidth(100),
                                3: FixedColumnWidth(150),
                                4: FixedColumnWidth(150),
                                5: FixedColumnWidth(150),
                                6: FixedColumnWidth(50),
                                7: FixedColumnWidth(10),
                              },
                              children: <TableRow>[
                                TableRow(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25, left: 8),
                                      child: Image.asset('assets/timer.png',
                                          height: 16,
                                          color: const Color(0xff9DA2A7)),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 25, left: 8),
                                      child: Row(
                                        children: [
                                          Text(
                                            '5:00 PM',
                                            style: TextStyle(
                                                fontFamily: 'InterRegular',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: Color(0xff727880)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 13, left: 3),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'assets/Media14.png',
                                            height: 40,
                                            width: 40,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25, left: 8),
                                      child: Text(
                                        'Dark circles Store',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: notifire.getblackcolor,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'InterRegular'),
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 25, left: 8),
                                      child: Text(
                                        'Online Payment',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xff727880),
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'InterRegular'),
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 25, left: 8),
                                      child: Center(
                                        child: Text('\$3.99',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xff727880),
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'InterRegular')),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25, left: 8),
                                      child: Text(
                                        '-\$293.01',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: notifire.getblackcolor,
                                            fontFamily: 'InterRegular'),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25, left: 8),
                                      child: Image.asset(
                                        'assets/more.png',
                                        height: 20,
                                        color: const Color(0xff9DA2A7),
                                      ),
                                    )
                                  ],
                                ),
                                dividerTable1(context, constraints),
                                TableRow(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25, left: 8),
                                      child: Image.asset('assets/timer.png',
                                          height: 16,
                                          color: const Color(0xff9DA2A7)),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 25, left: 8),
                                      child: Row(
                                        children: [
                                          Text(
                                            '9:00 AM',
                                            style: TextStyle(
                                                fontFamily: 'InterRegular',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: Color(0xff727880)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 13, left: 3),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'assets/Media13.png',
                                            height: 40,
                                            width: 40,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25, left: 8),
                                      child: Text(
                                        'Razer',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: notifire.getblackcolor,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'InterRegular'),
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 25, left: 8),
                                      child: Text(
                                        'Cash',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xff727880),
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'InterRegular'),
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 25, left: 8),
                                      child: Center(
                                        child: Text('\$7.99',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xff727880),
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'InterRegular')),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25, left: 8),
                                      child: Text(
                                        '-\$300.99',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: notifire.getblackcolor,
                                            fontFamily: 'InterRegular'),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25, left: 8),
                                      child: Image.asset(
                                        'assets/more.png',
                                        height: 20,
                                        color: const Color(0xff9DA2A7),
                                      ),
                                    )
                                  ],
                                ),
                                dividerTable1(context, constraints),
                                TableRow(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25, left: 8),
                                      child: Image.asset('assets/timer.png',
                                          height: 16,
                                          color: const Color(0xff9DA2A7)),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 25, left: 8),
                                      child: Row(
                                        children: [
                                          Text(
                                            '19:00 AM',
                                            style: TextStyle(
                                                fontFamily: 'InterRegular',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: Color(0xff727880)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 13, left: 3),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'assets/avatar-6 1.png',
                                            height: 40,
                                            width: 40,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25, left: 8),
                                      child: Text(
                                        'Ralph Edwards',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: notifire.getblackcolor,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'InterRegular'),
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 25, left: 8),
                                      child: Text(
                                        'Online Payment',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xff727880),
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'InterRegular'),
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 25, left: 8),
                                      child: Center(
                                        child: Text('\$17.99',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xff727880),
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'InterRegular')),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25, left: 8),
                                      child: Text(
                                        '-\$60.99',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: notifire.getblackcolor,
                                            fontFamily: 'InterRegular'),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25, left: 8),
                                      child: Image.asset(
                                        'assets/more.png',
                                        height: 20,
                                        color: const Color(0xff9DA2A7),
                                      ),
                                    )
                                  ],
                                ),
                                dividerTable1(context, constraints),
                                TableRow(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25, left: 8),
                                      child: Image.asset('assets/timer.png',
                                          height: 16,
                                          color: const Color(0xff9DA2A7)),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 25, left: 8),
                                      child: Row(
                                        children: [
                                          Text(
                                            '20:00 PM',
                                            style: TextStyle(
                                                fontFamily: 'InterRegular',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: Color(0xff727880)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 13, left: 3),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'assets/avatar-7 1.png',
                                            height: 40,
                                            width: 40,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25, left: 8),
                                      child: Text(
                                        'Bessie Cooper',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: notifire.getblackcolor,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'InterRegular'),
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 25, left: 8),
                                      child: Text(
                                        'Bank Transfer',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xff727880),
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'InterRegular'),
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 25, left: 8),
                                      child: Center(
                                        child: Text('\$3.99',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xff727880),
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'InterRegular')),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25, left: 8),
                                      child: Text(
                                        '-\$260.99',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: notifire.getblackcolor,
                                            fontFamily: 'InterRegular'),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25, left: 8),
                                      child: Image.asset(
                                        'assets/more.png',
                                        height: 20,
                                        color: const Color(0xff9DA2A7),
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
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  '23 August 2022',
                  style: TextStyle(
                    fontFamily: 'InterRegular',
                    fontWeight: FontWeight.w600,
                    color: notifire.getblackcolor,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 10,
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
                        PopupMenuButton(
                          tooltip: '',
                          offset: const Offset(10, -20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 1,
                          splashRadius: 1,
                          constraints: const BoxConstraints(
                            maxWidth: 380,
                            minWidth: 380,
                          ),
                          shadowColor: Colors.grey,
                          color: notifire.getbgcolor11,
                          itemBuilder: (context) =>
                              <PopupMenuEntry<SampleItem>>[
                            PopupMenuItem(
                                height: 30,
                                padding: EdgeInsets.zero,
                                enabled: false,
                                child: SingleChildScrollView(
                                  child: StatefulBuilder(
                                    builder: (context, setState) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset('assets/header.png',
                                              width: double.infinity,
                                              height: 190),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            width: 60,
                                            padding: const EdgeInsets.all(6),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: const Color(0xff7DC066)),
                                            child: const Center(
                                                child: Text(
                                              'Paid',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14,
                                                  fontFamily: 'InterRegular'),
                                            )),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            '+545.23 USD to  Federal Credit Union Offical',
                                            style: TextStyle(
                                                fontFamily: 'InterRegular',
                                                fontSize: 20,
                                                color: notifire.getblackcolor,
                                                fontWeight: FontWeight.w600),
                                            textAlign: TextAlign.center,
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          const Text(
                                            '24 Aug 2022 09:11 am',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: 'InterRegular',
                                                color: Color(0xff9DA2A7)),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              width: Get.width,
                                              padding: const EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                color: notifire.Getblg2,
                                              ),
                                              child: Column(
                                                children: [
                                                  const Text(
                                                    'Transfer Number',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff9DA2A7),
                                                        fontFamily:
                                                            'InterRegular',
                                                        fontSize: 14),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    '#SP010-0018-2022',
                                                    style: TextStyle(
                                                        color: notifire
                                                            .getblackcolor,
                                                        fontFamily:
                                                            'InterRegular',
                                                        fontSize: 14),
                                                  ),
                                                  const SizedBox(
                                                    height: 15,
                                                  ),
                                                  const Text(
                                                    'Bank Transfer',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff9DA2A7),
                                                        fontFamily:
                                                            'InterRegular',
                                                        fontSize: 14),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    'CHDNLA10955AH-476844-NH02009',
                                                    style: TextStyle(
                                                        color: notifire
                                                            .getblackcolor,
                                                        fontFamily:
                                                            'InterRegular',
                                                        fontSize: 14),
                                                  ),
                                                  const SizedBox(
                                                    height: 15,
                                                  ),
                                                  const Text(
                                                    'Transfer Fee',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff9DA2A7),
                                                        fontFamily:
                                                            'InterRegular',
                                                        fontSize: 14),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    '5.99 USD',
                                                    style: TextStyle(
                                                        color: notifire
                                                            .getblackcolor,
                                                        fontFamily:
                                                            'InterRegular',
                                                        fontSize: 14),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                InkWell(
                                                  onTap: () {},
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            12),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        border: Border.all(
                                                            color: const Color(
                                                                0xffEEEEEE))),
                                                    child: Center(
                                                      child: Row(
                                                        children: [
                                                          SvgPicture.asset(
                                                              'assets/arrow-down111.svg',
                                                              height: 16),
                                                          const SizedBox(
                                                            width: 5,
                                                          ),
                                                          const Text(
                                                            'Download',
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontFamily:
                                                                  'InterRegular',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: Color(
                                                                  0xff727880),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                InkWell(
                                                  onTap: () {},
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            12),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        border: Border.all(
                                                            color: const Color(
                                                                0xffEEEEEE))),
                                                    child: Center(
                                                      child: Row(
                                                        children: [
                                                          Image.asset(
                                                              'assets/printer.png',
                                                              height: 16,
                                                              color: const Color(
                                                                  0xff727880)),
                                                          const SizedBox(
                                                            width: 5,
                                                          ),
                                                          const Text(
                                                            'Print',
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontFamily:
                                                                  'InterRegular',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: Color(
                                                                  0xff727880),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                InkWell(
                                                  onTap: () {},
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            12),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        border: Border.all(
                                                            color: const Color(
                                                                0xffEEEEEE))),
                                                    child: Center(
                                                      child: Row(
                                                        children: [
                                                          SvgPicture.asset(
                                                              'assets/dollar-circle1.svg',
                                                              height: 16),
                                                          const SizedBox(
                                                            width: 5,
                                                          ),
                                                          const Text(
                                                            'Refund',
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontFamily:
                                                                  'InterRegular',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: Color(
                                                                  0xff727880),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                )),
                          ],
                          child: SizedBox(
                            width: constraints < 1400 ? 1500 : Get.width,
                            child: Table(
                              border:
                                  TableBorder.all(color: Colors.transparent),
                              columnWidths: const <int, TableColumnWidth>{
                                0: FixedColumnWidth(20),
                                1: FixedColumnWidth(100),
                                2: FixedColumnWidth(100),
                                3: FixedColumnWidth(150),
                                4: FixedColumnWidth(150),
                                5: FixedColumnWidth(150),
                                6: FixedColumnWidth(50),
                                7: FixedColumnWidth(10),
                              },
                              children: <TableRow>[
                                TableRow(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25, left: 8),
                                      child: Image.asset('assets/timer.png',
                                          height: 16,
                                          color: const Color(0xff9DA2A7)),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 25, left: 8),
                                      child: Row(
                                        children: [
                                          Text(
                                            '5:00 PM',
                                            style: TextStyle(
                                                fontFamily: 'InterRegular',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: Color(0xff727880)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 13, left: 3),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'assets/Media14.png',
                                            height: 40,
                                            width: 40,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25, left: 8),
                                      child: Text(
                                        'Dark circles Store',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: notifire.getblackcolor,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'InterRegular'),
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 25, left: 8),
                                      child: Text(
                                        'Online Payment',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xff727880),
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'InterRegular'),
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 25, left: 8),
                                      child: Center(
                                        child: Text('\$3.99',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xff727880),
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'InterRegular')),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25, left: 8),
                                      child: Text(
                                        '-\$293.01',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: notifire.getblackcolor,
                                            fontFamily: 'InterRegular'),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25, left: 8),
                                      child: Image.asset(
                                        'assets/more.png',
                                        height: 20,
                                        color: const Color(0xff9DA2A7),
                                      ),
                                    )
                                  ],
                                ),
                                dividerTable1(context, constraints),
                                TableRow(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25, left: 8),
                                      child: Image.asset('assets/timer.png',
                                          height: 16,
                                          color: const Color(0xff9DA2A7)),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 25, left: 8),
                                      child: Row(
                                        children: [
                                          Text(
                                            '9:00 AM',
                                            style: TextStyle(
                                                fontFamily: 'InterRegular',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: Color(0xff727880)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 13, left: 3),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'assets/Media13.png',
                                            height: 40,
                                            width: 40,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25, left: 8),
                                      child: Text(
                                        'Razer',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: notifire.getblackcolor,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'InterRegular'),
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 25, left: 8),
                                      child: Text(
                                        'Cash',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xff727880),
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'InterRegular'),
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 25, left: 8),
                                      child: Center(
                                        child: Text('\$7.99',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xff727880),
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'InterRegular')),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25, left: 8),
                                      child: Text(
                                        '-\$300.99',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: notifire.getblackcolor,
                                            fontFamily: 'InterRegular'),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25, left: 8),
                                      child: Image.asset(
                                        'assets/more.png',
                                        height: 20,
                                        color: const Color(0xff9DA2A7),
                                      ),
                                    )
                                  ],
                                ),
                                dividerTable1(context, constraints),
                                TableRow(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25, left: 8),
                                      child: Image.asset('assets/timer.png',
                                          height: 16,
                                          color: const Color(0xff9DA2A7)),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 25, left: 8),
                                      child: Row(
                                        children: [
                                          Text(
                                            '19:00 AM',
                                            style: TextStyle(
                                                fontFamily: 'InterRegular',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: Color(0xff727880)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 13, left: 3),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'assets/avatar-6 1.png',
                                            height: 40,
                                            width: 40,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25, left: 8),
                                      child: Text(
                                        'Ralph Edwards',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: notifire.getblackcolor,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'InterRegular'),
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 25, left: 8),
                                      child: Text(
                                        'Online Payment',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xff727880),
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'InterRegular'),
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 25, left: 8),
                                      child: Center(
                                        child: Text('\$17.99',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xff727880),
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'InterRegular')),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25, left: 8),
                                      child: Text(
                                        '-\$60.99',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: notifire.getblackcolor,
                                            fontFamily: 'InterRegular'),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25, left: 8),
                                      child: Image.asset(
                                        'assets/more.png',
                                        height: 20,
                                        color: const Color(0xff9DA2A7),
                                      ),
                                    )
                                  ],
                                ),
                                dividerTable1(context, constraints),
                                TableRow(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25, left: 8),
                                      child: Image.asset('assets/timer.png',
                                          height: 16,
                                          color: const Color(0xff9DA2A7)),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 25, left: 8),
                                      child: Row(
                                        children: [
                                          Text(
                                            '20:00 PM',
                                            style: TextStyle(
                                                fontFamily: 'InterRegular',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: Color(0xff727880)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 13, left: 3),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'assets/avatar-7 1.png',
                                            height: 40,
                                            width: 40,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25, left: 8),
                                      child: Text(
                                        'Bessie Cooper',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: notifire.getblackcolor,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'InterRegular'),
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 25, left: 8),
                                      child: Text(
                                        'Bank Transfer',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xff727880),
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'InterRegular'),
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(top: 25, left: 8),
                                      child: Center(
                                        child: Text('\$3.99',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xff727880),
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'InterRegular')),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25, left: 8),
                                      child: Text(
                                        '-\$260.99',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: notifire.getblackcolor,
                                            fontFamily: 'InterRegular'),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25, left: 8),
                                      child: Image.asset(
                                        'assets/more.png',
                                        height: 20,
                                        color: const Color(0xff9DA2A7),
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
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Date',
                        style: TextStyle(
                            fontFamily: 'InterRegular',
                            color: Color(0xff9DA2A7),
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            const Text(
                              'All Date',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'InterRegular',
                                  color: Color(0xff727880)),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Image.asset(
                              'assets/arrow-down.png',
                              color: const Color(0xff727880),
                              height: 12,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        'Type',
                        style: TextStyle(
                            fontFamily: 'InterRegular',
                            color: Color(0xff9DA2A7),
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            const Text(
                              'All',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'InterRegular',
                                  color: Color(0xff727880)),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Image.asset(
                              'assets/arrow-down.png',
                              color: const Color(0xff727880),
                              height: 12,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        'Sort by',
                        style: TextStyle(
                            fontFamily: 'InterRegular',
                            color: Color(0xff9DA2A7),
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            const Text(
                              'Newest',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'InterRegular',
                                  color: Color(0xff727880)),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Image.asset(
                              'assets/arrow-down.png',
                              color: const Color(0xff727880),
                              height: 12,
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Today',
                style: TextStyle(
                  color: notifire.getblackcolor,
                  fontFamily: 'InterRegular',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 10,
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
                      PopupMenuButton(
                        tooltip: '',
                        offset: const Offset(10, -20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 1,
                        splashRadius: 1,
                        constraints: const BoxConstraints(
                          maxWidth: 380,
                          minWidth: 380,
                        ),
                        shadowColor: Colors.grey,
                        color: notifire.getbgcolor11,
                        itemBuilder: (context) => <PopupMenuEntry<SampleItem>>[
                          PopupMenuItem(
                              height: 30,
                              padding: EdgeInsets.zero,
                              enabled: false,
                              child: SingleChildScrollView(
                                child: StatefulBuilder(
                                  builder: (context, setState) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset('assets/header.png',
                                            width: double.infinity,
                                            height: 190),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: 60,
                                          padding: const EdgeInsets.all(6),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: const Color(0xff7DC066)),
                                          child: const Center(
                                              child: Text(
                                            'Paid',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14,
                                                fontFamily: 'InterRegular'),
                                          )),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          '+545.23 USD to  Federal Credit Union Offical',
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              fontSize: 20,
                                              color: notifire.getblackcolor,
                                              fontWeight: FontWeight.w600),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        const Text(
                                          '24 Aug 2022 09:11 am',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'InterRegular',
                                              color: Color(0xff9DA2A7)),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: Get.width,
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: notifire.Getblg2,
                                            ),
                                            child: Column(
                                              children: [
                                                const Text(
                                                  'Transfer Number',
                                                  style: TextStyle(
                                                      color: Color(0xff9DA2A7),
                                                      fontFamily:
                                                          'InterRegular',
                                                      fontSize: 14),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  '#SP010-0018-2022',
                                                  style: TextStyle(
                                                      color: notifire
                                                          .getblackcolor,
                                                      fontFamily:
                                                          'InterRegular',
                                                      fontSize: 14),
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                const Text(
                                                  'Bank Transfer',
                                                  style: TextStyle(
                                                      color: Color(0xff9DA2A7),
                                                      fontFamily:
                                                          'InterRegular',
                                                      fontSize: 14),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  'CHDNLA10955AH-476844-NH02009',
                                                  style: TextStyle(
                                                      color: notifire
                                                          .getblackcolor,
                                                      fontFamily:
                                                          'InterRegular',
                                                      fontSize: 14),
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                const Text(
                                                  'Transfer Fee',
                                                  style: TextStyle(
                                                      color: Color(0xff9DA2A7),
                                                      fontFamily:
                                                          'InterRegular',
                                                      fontSize: 14),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  '5.99 USD',
                                                  style: TextStyle(
                                                      color: notifire
                                                          .getblackcolor,
                                                      fontFamily:
                                                          'InterRegular',
                                                      fontSize: 14),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                onTap: () {},
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(12),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                      border: Border.all(
                                                          color: const Color(
                                                              0xffEEEEEE))),
                                                  child: Center(
                                                    child: Row(
                                                      children: [
                                                        SvgPicture.asset(
                                                            'assets/arrow-down111.svg',
                                                            height: 16),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        const Text(
                                                          'Download',
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontFamily:
                                                                'InterRegular',
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: Color(
                                                                0xff727880),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              InkWell(
                                                onTap: () {},
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(12),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                      border: Border.all(
                                                          color: const Color(
                                                              0xffEEEEEE))),
                                                  child: Center(
                                                    child: Row(
                                                      children: [
                                                        Image.asset(
                                                            'assets/printer.png',
                                                            height: 16,
                                                            color: const Color(
                                                                0xff727880)),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        const Text(
                                                          'Print',
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontFamily:
                                                                'InterRegular',
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: Color(
                                                                0xff727880),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              InkWell(
                                                onTap: () {},
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(12),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                      border: Border.all(
                                                          color: const Color(
                                                              0xffEEEEEE))),
                                                  child: Center(
                                                    child: Row(
                                                      children: [
                                                        SvgPicture.asset(
                                                            'assets/dollar-circle1.svg',
                                                            height: 16),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        const Text(
                                                          'Refund',
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontFamily:
                                                                'InterRegular',
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: Color(
                                                                0xff727880),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              )),
                        ],
                        child: SizedBox(
                          width: constraints < 1400 ? 1500 : Get.width,
                          child: Table(
                            border: TableBorder.all(color: Colors.transparent),
                            columnWidths: const <int, TableColumnWidth>{
                              0: FixedColumnWidth(20),
                              1: FixedColumnWidth(100),
                              2: FixedColumnWidth(100),
                              3: FixedColumnWidth(150),
                              4: FixedColumnWidth(150),
                              5: FixedColumnWidth(150),
                              6: FixedColumnWidth(50),
                              7: FixedColumnWidth(10),
                            },
                            children: <TableRow>[
                              TableRow(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Image.asset('assets/timer.png',
                                        height: 16,
                                        color: const Color(0xff9DA2A7)),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 25, left: 8),
                                    child: Row(
                                      children: [
                                        Text(
                                          '5:00 PM',
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              color: Color(0xff727880)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 13, left: 3),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/Media14.png',
                                          height: 40,
                                          width: 40,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      'Dark circles Store',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      'Online Payment',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff727880),
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 25, left: 8),
                                    child: Center(
                                      child: Text('\$3.99',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xff727880),
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'InterRegular')),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      '-\$293.01',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Image.asset(
                                      'assets/more.png',
                                      height: 20,
                                      color: const Color(0xff9DA2A7),
                                    ),
                                  )
                                ],
                              ),
                              dividerTable1(context, constraints),
                              TableRow(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Image.asset('assets/timer.png',
                                        height: 16,
                                        color: const Color(0xff9DA2A7)),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 25, left: 8),
                                    child: Row(
                                      children: [
                                        Text(
                                          '9:00 AM',
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              color: Color(0xff727880)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 13, left: 3),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/Media13.png',
                                          height: 40,
                                          width: 40,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      'Razer',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      'Cash',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff727880),
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 25, left: 8),
                                    child: Center(
                                      child: Text('\$7.99',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xff727880),
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'InterRegular')),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      '-\$300.99',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Image.asset(
                                      'assets/more.png',
                                      height: 20,
                                      color: const Color(0xff9DA2A7),
                                    ),
                                  )
                                ],
                              ),
                              dividerTable1(context, constraints),
                              TableRow(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Image.asset('assets/timer.png',
                                        height: 16,
                                        color: const Color(0xff9DA2A7)),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 25, left: 8),
                                    child: Row(
                                      children: [
                                        Text(
                                          '19:00 AM',
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              color: Color(0xff727880)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 13, left: 3),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/avatar-6 1.png',
                                          height: 40,
                                          width: 40,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      'Ralph Edwards',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      'Online Payment',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff727880),
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 25, left: 8),
                                    child: Center(
                                      child: Text('\$17.99',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xff727880),
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'InterRegular')),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      '-\$60.99',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Image.asset(
                                      'assets/more.png',
                                      height: 20,
                                      color: const Color(0xff9DA2A7),
                                    ),
                                  )
                                ],
                              ),
                              dividerTable1(context, constraints),
                              TableRow(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Image.asset('assets/timer.png',
                                        height: 16,
                                        color: const Color(0xff9DA2A7)),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 25, left: 8),
                                    child: Row(
                                      children: [
                                        Text(
                                          '20:00 PM',
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              color: Color(0xff727880)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 13, left: 3),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/avatar-7 1.png',
                                          height: 40,
                                          width: 40,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      'Bessie Cooper',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      'Bank Transfer',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff727880),
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 25, left: 8),
                                    child: Center(
                                      child: Text('\$3.99',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xff727880),
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'InterRegular')),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      '-\$260.99',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Image.asset(
                                      'assets/more.png',
                                      height: 20,
                                      color: const Color(0xff9DA2A7),
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
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Yesterday',
                style: TextStyle(
                  color: notifire.getblackcolor,
                  fontFamily: 'InterRegular',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 10,
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
                      PopupMenuButton(
                        tooltip: '',
                        offset: const Offset(10, -20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 1,
                        splashRadius: 1,
                        constraints: const BoxConstraints(
                          maxWidth: 380,
                          minWidth: 380,
                        ),
                        shadowColor: Colors.grey,
                        color: notifire.getbgcolor11,
                        itemBuilder: (context) => <PopupMenuEntry<SampleItem>>[
                          PopupMenuItem(
                              height: 30,
                              padding: EdgeInsets.zero,
                              enabled: false,
                              child: SingleChildScrollView(
                                child: StatefulBuilder(
                                  builder: (context, setState) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset('assets/header.png',
                                            width: double.infinity,
                                            height: 190),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: 60,
                                          padding: const EdgeInsets.all(6),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: const Color(0xff7DC066)),
                                          child: const Center(
                                              child: Text(
                                            'Paid',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14,
                                                fontFamily: 'InterRegular'),
                                          )),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          '+545.23 USD to  Federal Credit Union Offical',
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              fontSize: 20,
                                              color: notifire.getblackcolor,
                                              fontWeight: FontWeight.w600),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        const Text(
                                          '24 Aug 2022 09:11 am',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'InterRegular',
                                              color: Color(0xff9DA2A7)),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: Get.width,
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: notifire.Getblg2,
                                            ),
                                            child: Column(
                                              children: [
                                                const Text(
                                                  'Transfer Number',
                                                  style: TextStyle(
                                                      color: Color(0xff9DA2A7),
                                                      fontFamily:
                                                          'InterRegular',
                                                      fontSize: 14),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  '#SP010-0018-2022',
                                                  style: TextStyle(
                                                      color: notifire
                                                          .getblackcolor,
                                                      fontFamily:
                                                          'InterRegular',
                                                      fontSize: 14),
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                const Text(
                                                  'Bank Transfer',
                                                  style: TextStyle(
                                                      color: Color(0xff9DA2A7),
                                                      fontFamily:
                                                          'InterRegular',
                                                      fontSize: 14),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  'CHDNLA10955AH-476844-NH02009',
                                                  style: TextStyle(
                                                      color: notifire
                                                          .getblackcolor,
                                                      fontFamily:
                                                          'InterRegular',
                                                      fontSize: 14),
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                const Text(
                                                  'Transfer Fee',
                                                  style: TextStyle(
                                                      color: Color(0xff9DA2A7),
                                                      fontFamily:
                                                          'InterRegular',
                                                      fontSize: 14),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  '5.99 USD',
                                                  style: TextStyle(
                                                      color: notifire
                                                          .getblackcolor,
                                                      fontFamily:
                                                          'InterRegular',
                                                      fontSize: 14),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                onTap: () {},
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(12),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                      border: Border.all(
                                                          color: const Color(
                                                              0xffEEEEEE))),
                                                  child: Center(
                                                    child: Row(
                                                      children: [
                                                        SvgPicture.asset(
                                                            'assets/arrow-down111.svg',
                                                            height: 16),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        const Text(
                                                          'Download',
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontFamily:
                                                                'InterRegular',
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: Color(
                                                                0xff727880),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              InkWell(
                                                onTap: () {},
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(12),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                      border: Border.all(
                                                          color: const Color(
                                                              0xffEEEEEE))),
                                                  child: Center(
                                                    child: Row(
                                                      children: [
                                                        Image.asset(
                                                            'assets/printer.png',
                                                            height: 16,
                                                            color: const Color(
                                                                0xff727880)),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        const Text(
                                                          'Print',
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontFamily:
                                                                'InterRegular',
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: Color(
                                                                0xff727880),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              InkWell(
                                                onTap: () {},
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(12),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                      border: Border.all(
                                                          color: const Color(
                                                              0xffEEEEEE))),
                                                  child: Center(
                                                    child: Row(
                                                      children: [
                                                        SvgPicture.asset(
                                                            'assets/dollar-circle1.svg',
                                                            height: 16),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        const Text(
                                                          'Refund',
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontFamily:
                                                                'InterRegular',
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: Color(
                                                                0xff727880),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              )),
                        ],
                        child: SizedBox(
                          width: constraints < 1400 ? 1500 : Get.width,
                          child: Table(
                            border: TableBorder.all(color: Colors.transparent),
                            columnWidths: const <int, TableColumnWidth>{
                              0: FixedColumnWidth(20),
                              1: FixedColumnWidth(100),
                              2: FixedColumnWidth(100),
                              3: FixedColumnWidth(150),
                              4: FixedColumnWidth(150),
                              5: FixedColumnWidth(150),
                              6: FixedColumnWidth(50),
                              7: FixedColumnWidth(10),
                            },
                            children: <TableRow>[
                              TableRow(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Image.asset('assets/timer.png',
                                        height: 16,
                                        color: const Color(0xff9DA2A7)),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 25, left: 8),
                                    child: Row(
                                      children: [
                                        Text(
                                          '5:00 PM',
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              color: Color(0xff727880)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 13, left: 3),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/Media14.png',
                                          height: 40,
                                          width: 40,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      'Dark circles Store',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      'Online Payment',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff727880),
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 25, left: 8),
                                    child: Center(
                                      child: Text('\$3.99',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xff727880),
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'InterRegular')),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      '-\$293.01',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Image.asset(
                                      'assets/more.png',
                                      height: 20,
                                      color: const Color(0xff9DA2A7),
                                    ),
                                  )
                                ],
                              ),
                              dividerTable1(context, constraints),
                              TableRow(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Image.asset('assets/timer.png',
                                        height: 16,
                                        color: const Color(0xff9DA2A7)),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 25, left: 8),
                                    child: Row(
                                      children: [
                                        Text(
                                          '9:00 AM',
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              color: Color(0xff727880)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 13, left: 3),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/Media13.png',
                                          height: 40,
                                          width: 40,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      'Razer',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      'Cash',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff727880),
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 25, left: 8),
                                    child: Center(
                                      child: Text('\$7.99',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xff727880),
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'InterRegular')),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      '-\$300.99',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Image.asset(
                                      'assets/more.png',
                                      height: 20,
                                      color: const Color(0xff9DA2A7),
                                    ),
                                  )
                                ],
                              ),
                              dividerTable1(context, constraints),
                              TableRow(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Image.asset('assets/timer.png',
                                        height: 16,
                                        color: const Color(0xff9DA2A7)),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 25, left: 8),
                                    child: Row(
                                      children: [
                                        Text(
                                          '19:00 AM',
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              color: Color(0xff727880)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 13, left: 3),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/avatar-6 1.png',
                                          height: 40,
                                          width: 40,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      'Ralph Edwards',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      'Online Payment',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff727880),
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 25, left: 8),
                                    child: Center(
                                      child: Text('\$17.99',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xff727880),
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'InterRegular')),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      '-\$60.99',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Image.asset(
                                      'assets/more.png',
                                      height: 20,
                                      color: const Color(0xff9DA2A7),
                                    ),
                                  )
                                ],
                              ),
                              dividerTable1(context, constraints),
                              TableRow(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Image.asset('assets/timer.png',
                                        height: 16,
                                        color: const Color(0xff9DA2A7)),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 25, left: 8),
                                    child: Row(
                                      children: [
                                        Text(
                                          '20:00 PM',
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              color: Color(0xff727880)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 13, left: 3),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/avatar-7 1.png',
                                          height: 40,
                                          width: 40,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      'Bessie Cooper',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      'Bank Transfer',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff727880),
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 25, left: 8),
                                    child: Center(
                                      child: Text('\$3.99',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xff727880),
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'InterRegular')),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      '-\$260.99',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Image.asset(
                                      'assets/more.png',
                                      height: 20,
                                      color: const Color(0xff9DA2A7),
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
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '23 August 2022',
                style: TextStyle(
                  fontFamily: 'InterRegular',
                  fontWeight: FontWeight.w600,
                  color: notifire.getblackcolor,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 10,
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
                      PopupMenuButton(
                        tooltip: '',
                        offset: const Offset(10, -20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 1,
                        splashRadius: 1,
                        constraints: const BoxConstraints(
                          maxWidth: 380,
                          minWidth: 380,
                        ),
                        shadowColor: Colors.grey,
                        color: notifire.getbgcolor11,
                        itemBuilder: (context) => <PopupMenuEntry<SampleItem>>[
                          PopupMenuItem(
                              height: 30,
                              padding: EdgeInsets.zero,
                              enabled: false,
                              child: SingleChildScrollView(
                                child: StatefulBuilder(
                                  builder: (context, setState) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset('assets/header.png',
                                            width: double.infinity,
                                            height: 190),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: 60,
                                          padding: const EdgeInsets.all(6),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: const Color(0xff7DC066)),
                                          child: const Center(
                                              child: Text(
                                            'Paid',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14,
                                                fontFamily: 'InterRegular'),
                                          )),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          '+545.23 USD to  Federal Credit Union Offical',
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              fontSize: 20,
                                              color: notifire.getblackcolor,
                                              fontWeight: FontWeight.w600),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        const Text(
                                          '24 Aug 2022 09:11 am',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'InterRegular',
                                              color: Color(0xff9DA2A7)),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: Get.width,
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: notifire.Getblg2,
                                            ),
                                            child: Column(
                                              children: [
                                                const Text(
                                                  'Transfer Number',
                                                  style: TextStyle(
                                                      color: Color(0xff9DA2A7),
                                                      fontFamily:
                                                          'InterRegular',
                                                      fontSize: 14),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  '#SP010-0018-2022',
                                                  style: TextStyle(
                                                      color: notifire
                                                          .getblackcolor,
                                                      fontFamily:
                                                          'InterRegular',
                                                      fontSize: 14),
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                const Text(
                                                  'Bank Transfer',
                                                  style: TextStyle(
                                                      color: Color(0xff9DA2A7),
                                                      fontFamily:
                                                          'InterRegular',
                                                      fontSize: 14),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  'CHDNLA10955AH-476844-NH02009',
                                                  style: TextStyle(
                                                      color: notifire
                                                          .getblackcolor,
                                                      fontFamily:
                                                          'InterRegular',
                                                      fontSize: 14),
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                const Text(
                                                  'Transfer Fee',
                                                  style: TextStyle(
                                                      color: Color(0xff9DA2A7),
                                                      fontFamily:
                                                          'InterRegular',
                                                      fontSize: 14),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  '5.99 USD',
                                                  style: TextStyle(
                                                      color: notifire
                                                          .getblackcolor,
                                                      fontFamily:
                                                          'InterRegular',
                                                      fontSize: 14),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                onTap: () {},
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(12),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                      border: Border.all(
                                                          color: const Color(
                                                              0xffEEEEEE))),
                                                  child: Center(
                                                    child: Row(
                                                      children: [
                                                        SvgPicture.asset(
                                                            'assets/arrow-down111.svg',
                                                            height: 16),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        const Text(
                                                          'Download',
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontFamily:
                                                                'InterRegular',
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: Color(
                                                                0xff727880),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              InkWell(
                                                onTap: () {},
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(12),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                      border: Border.all(
                                                          color: const Color(
                                                              0xffEEEEEE))),
                                                  child: Center(
                                                    child: Row(
                                                      children: [
                                                        Image.asset(
                                                            'assets/printer.png',
                                                            height: 16,
                                                            color: const Color(
                                                                0xff727880)),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        const Text(
                                                          'Print',
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontFamily:
                                                                'InterRegular',
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: Color(
                                                                0xff727880),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              InkWell(
                                                onTap: () {},
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(12),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                      border: Border.all(
                                                          color: const Color(
                                                              0xffEEEEEE))),
                                                  child: Center(
                                                    child: Row(
                                                      children: [
                                                        SvgPicture.asset(
                                                            'assets/dollar-circle1.svg',
                                                            height: 16),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        const Text(
                                                          'Refund',
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontFamily:
                                                                'InterRegular',
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: Color(
                                                                0xff727880),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              )),
                        ],
                        child: SizedBox(
                          width: constraints < 1400 ? 1500 : Get.width,
                          child: Table(
                            border: TableBorder.all(color: Colors.transparent),
                            columnWidths: const <int, TableColumnWidth>{
                              0: FixedColumnWidth(20),
                              1: FixedColumnWidth(100),
                              2: FixedColumnWidth(100),
                              3: FixedColumnWidth(150),
                              4: FixedColumnWidth(150),
                              5: FixedColumnWidth(150),
                              6: FixedColumnWidth(50),
                              7: FixedColumnWidth(10),
                            },
                            children: <TableRow>[
                              TableRow(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Image.asset('assets/timer.png',
                                        height: 16,
                                        color: const Color(0xff9DA2A7)),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 25, left: 8),
                                    child: Row(
                                      children: [
                                        Text(
                                          '5:00 PM',
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              color: Color(0xff727880)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 13, left: 3),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/Media14.png',
                                          height: 40,
                                          width: 40,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      'Dark circles Store',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      'Online Payment',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff727880),
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 25, left: 8),
                                    child: Center(
                                      child: Text('\$3.99',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xff727880),
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'InterRegular')),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      '-\$293.01',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Image.asset(
                                      'assets/more.png',
                                      height: 20,
                                      color: const Color(0xff9DA2A7),
                                    ),
                                  )
                                ],
                              ),
                              dividerTable1(context, constraints),
                              TableRow(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Image.asset('assets/timer.png',
                                        height: 16,
                                        color: const Color(0xff9DA2A7)),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 25, left: 8),
                                    child: Row(
                                      children: [
                                        Text(
                                          '9:00 AM',
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              color: Color(0xff727880)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 13, left: 3),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/Media13.png',
                                          height: 40,
                                          width: 40,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      'Razer',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      'Cash',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff727880),
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 25, left: 8),
                                    child: Center(
                                      child: Text('\$7.99',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xff727880),
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'InterRegular')),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      '-\$300.99',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Image.asset(
                                      'assets/more.png',
                                      height: 20,
                                      color: const Color(0xff9DA2A7),
                                    ),
                                  )
                                ],
                              ),
                              dividerTable1(context, constraints),
                              TableRow(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Image.asset('assets/timer.png',
                                        height: 16,
                                        color: const Color(0xff9DA2A7)),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 25, left: 8),
                                    child: Row(
                                      children: [
                                        Text(
                                          '19:00 AM',
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              color: Color(0xff727880)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 13, left: 3),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/avatar-6 1.png',
                                          height: 40,
                                          width: 40,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      'Ralph Edwards',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      'Online Payment',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff727880),
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 25, left: 8),
                                    child: Center(
                                      child: Text('\$17.99',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xff727880),
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'InterRegular')),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      '-\$60.99',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Image.asset(
                                      'assets/more.png',
                                      height: 20,
                                      color: const Color(0xff9DA2A7),
                                    ),
                                  )
                                ],
                              ),
                              dividerTable1(context, constraints),
                              TableRow(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Image.asset('assets/timer.png',
                                        height: 16,
                                        color: const Color(0xff9DA2A7)),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 25, left: 8),
                                    child: Row(
                                      children: [
                                        Text(
                                          '20:00 PM',
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              color: Color(0xff727880)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 13, left: 3),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/avatar-7 1.png',
                                          height: 40,
                                          width: 40,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      'Bessie Cooper',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      'Bank Transfer',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff727880),
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 25, left: 8),
                                    child: Center(
                                      child: Text('\$3.99',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xff727880),
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'InterRegular')),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      '-\$260.99',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Image.asset(
                                      'assets/more.png',
                                      height: 20,
                                      color: const Color(0xff9DA2A7),
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
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
  }

  Widget screen1(constraints) {
    return constraints < 600
        ? SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Date',
                            style: TextStyle(
                                fontFamily: 'InterRegular',
                                color: Color(0xff9DA2A7),
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Row(
                              children: [
                                const Text(
                                  'All Date',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'InterRegular',
                                      color: Color(0xff727880)),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Image.asset(
                                  'assets/arrow-down.png',
                                  color: const Color(0xff727880),
                                  height: 12,
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Text(
                            'Type',
                            style: TextStyle(
                                fontFamily: 'InterRegular',
                                color: Color(0xff9DA2A7),
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Row(
                              children: [
                                const Text(
                                  'All',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'InterRegular',
                                      color: Color(0xff727880)),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Image.asset(
                                  'assets/arrow-down.png',
                                  color: const Color(0xff727880),
                                  height: 12,
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Text(
                            'Status',
                            style: TextStyle(
                                fontFamily: 'InterRegular',
                                color: Color(0xff9DA2A7),
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Row(
                              children: [
                                const Text(
                                  'All',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'InterRegular',
                                      color: Color(0xff727880)),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Image.asset(
                                  'assets/arrow-down.png',
                                  color: const Color(0xff727880),
                                  height: 12,
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Text(
                            'Sort by',
                            style: TextStyle(
                                fontFamily: 'InterRegular',
                                color: Color(0xff9DA2A7),
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Row(
                              children: [
                                const Text(
                                  'Newest',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'InterRegular',
                                      color: Color(0xff727880)),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Image.asset(
                                  'assets/arrow-down.png',
                                  color: const Color(0xff727880),
                                  height: 12,
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
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
                              0: FixedColumnWidth(80),
                              1: FixedColumnWidth(150),
                              2: FixedColumnWidth(180),
                              3: FixedColumnWidth(150),
                              4: FixedColumnWidth(150),
                              5: FixedColumnWidth(150),
                              6: FixedColumnWidth(150),
                              7: FixedColumnWidth(180),
                              8: FixedColumnWidth(110),
                            },
                            children: <TableRow>[
                              TableRow(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 13, left: 3),
                                    child: Image.asset(
                                      'assets/receipt-item.png',
                                      height: 40,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      '14 Sep 2022',
                                      style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: notifire.getblackcolor,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Row(
                                      children: [
                                        Text(
                                          '#VK0018-00017-2023',
                                          style: TextStyle(
                                            fontFamily: 'InterRegular',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: notifire.getblackcolor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 13, left: 3),
                                    child: Image.asset(
                                      'assets/Brand Logo11.png',
                                      height: 40,
                                      width: 40,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      'McDonal Offical',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      'Bank Transfer',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff727880),
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 5, top: 15),
                                    child: SizedBox(
                                      width: 30,
                                      height: 35,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
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
                                    padding: const EdgeInsets.only(
                                        top: 25, left: 100),
                                    child: Text(
                                      '\$293.01',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Image.asset(
                                      'assets/more.png',
                                      height: 20,
                                      color: const Color(0xff9DA2A7),
                                    ),
                                  )
                                ],
                              ),
                              dividerTable2(context, constraints),
                              TableRow(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 13, left: 3),
                                    child: Image.asset(
                                      'assets/receipt-item.png',
                                      height: 40,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      '19 Sep 2022',
                                      style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: notifire.getblackcolor,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Row(
                                      children: [
                                        Text(
                                          '#VK0018-00017-2023',
                                          style: TextStyle(
                                            fontFamily: 'InterRegular',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: notifire.getblackcolor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 13, left: 3),
                                    child: Image.asset(
                                      'assets/Brand Logo22.png',
                                      height: 40,
                                      width: 40,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      'Razer',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      'Cash',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff727880),
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 5, top: 15),
                                    child: SizedBox(
                                      width: 30,
                                      height: 35,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
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
                                    padding: const EdgeInsets.only(
                                        top: 25, left: 100),
                                    child: Text(
                                      '\$859.01',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Image.asset(
                                      'assets/more.png',
                                      height: 20,
                                      color: const Color(0xff9DA2A7),
                                    ),
                                  )
                                ],
                              ),
                              dividerTable2(context, constraints),
                              TableRow(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 13, left: 3),
                                    child: Image.asset(
                                      'assets/receipt-item.png',
                                      height: 40,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      '18 Nov 2022',
                                      style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: notifire.getblackcolor,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Row(
                                      children: [
                                        Text(
                                          '#VK0018-00017-2023',
                                          style: TextStyle(
                                            fontFamily: 'InterRegular',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: notifire.getblackcolor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 13, left: 3),
                                    child: Image.asset(
                                      'assets/avatar-8 1.png',
                                      height: 40,
                                      width: 40,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      'Kristin Watson',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      'Online Payment',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff727880),
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 5, top: 15),
                                    child: SizedBox(
                                      width: 30,
                                      height: 35,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: const Color(0xffFDF0E9)),
                                        child: const Center(
                                            child: Text(
                                          'Scheduled',
                                          style: TextStyle(
                                              color: Color(0xffF3935D),
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14,
                                              fontFamily: 'InterRegular'),
                                        )),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 25, left: 100),
                                    child: Text(
                                      '\$678.99',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Image.asset(
                                      'assets/more.png',
                                      height: 20,
                                      color: const Color(0xff9DA2A7),
                                    ),
                                  )
                                ],
                              ),
                              dividerTable2(context, constraints),
                              TableRow(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 13, left: 3),
                                    child: Image.asset(
                                      'assets/receipt-item.png',
                                      height: 40,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      '26 Sep 2022',
                                      style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: notifire.getblackcolor,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Row(
                                      children: [
                                        Text(
                                          '#VK0018-00017-2023',
                                          style: TextStyle(
                                            fontFamily: 'InterRegular',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: notifire.getblackcolor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 13, left: 3),
                                    child: Image.asset(
                                      'assets/Store Avatar(1).png',
                                      height: 40,
                                      width: 40,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      'Netflix',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      'Cash',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff727880),
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 5, top: 15),
                                    child: SizedBox(
                                      width: 30,
                                      height: 35,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
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
                                    padding: const EdgeInsets.only(
                                        top: 25, left: 100),
                                    child: Text(
                                      '\$945.51',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Image.asset(
                                      'assets/more.png',
                                      height: 20,
                                      color: const Color(0xff9DA2A7),
                                    ),
                                  )
                                ],
                              ),
                              dividerTable2(context, constraints),
                              TableRow(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 13, left: 3),
                                    child: Image.asset(
                                      'assets/receipt-item.png',
                                      height: 40,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      '29 Sep 2022',
                                      style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: notifire.getblackcolor,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Row(
                                      children: [
                                        Text(
                                          '#VK0018-00017-2023',
                                          style: TextStyle(
                                            fontFamily: 'InterRegular',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: notifire.getblackcolor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 13, left: 3),
                                    child: Image.asset(
                                      'assets/Store Avatar.png',
                                      height: 40,
                                      width: 40,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      'Amazon.com',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      'Online Payment',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff727880),
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 5, top: 15),
                                    child: SizedBox(
                                      width: 30,
                                      height: 35,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: const Color(0xffFDF0E9)),
                                        child: const Center(
                                            child: Text(
                                          'Scheduled',
                                          style: TextStyle(
                                              color: Color(0xffF3935D),
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14,
                                              fontFamily: 'InterRegular'),
                                        )),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 25, left: 100),
                                    child: Text(
                                      '\$245.51',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Image.asset(
                                      'assets/more.png',
                                      height: 20,
                                      color: const Color(0xff9DA2A7),
                                    ),
                                  )
                                ],
                              ),
                              dividerTable2(context, constraints),
                              TableRow(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 13, left: 3),
                                    child: Image.asset(
                                      'assets/receipt-item.png',
                                      height: 40,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      '19 Aug 2022',
                                      style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: notifire.getblackcolor,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Row(
                                      children: [
                                        Text(
                                          '#VK0018-00017-2023',
                                          style: TextStyle(
                                            fontFamily: 'InterRegular',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: notifire.getblackcolor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 13, left: 3),
                                    child: Image.asset(
                                      'assets/avatar-7 1.png',
                                      height: 40,
                                      width: 40,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      'Kristin Watson',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      'Bank Transfer',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff727880),
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 5, top: 15),
                                    child: SizedBox(
                                      width: 30,
                                      height: 35,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: const Color(0xffFDF0E9)),
                                        child: const Center(
                                            child: Text(
                                          'Scheduled',
                                          style: TextStyle(
                                              color: Color(0xffF3935D),
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14,
                                              fontFamily: 'InterRegular'),
                                        )),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 25, left: 100),
                                    child: Text(
                                      '\$265.41',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Image.asset(
                                      'assets/more.png',
                                      height: 20,
                                      color: const Color(0xff9DA2A7),
                                    ),
                                  )
                                ],
                              ),
                              dividerTable2(context, constraints),
                              TableRow(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 13, left: 3),
                                    child: Image.asset(
                                      'assets/receipt-item.png',
                                      height: 40,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      '13 Sep 2022',
                                      style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: notifire.getblackcolor,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Row(
                                      children: [
                                        Text(
                                          '#VK0018-00017-2023',
                                          style: TextStyle(
                                            fontFamily: 'InterRegular',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: notifire.getblackcolor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 13, left: 3),
                                    child: Image.asset(
                                      'assets/Brand Logo21.png',
                                      height: 40,
                                      width: 40,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      'Microsoft Corp.',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      'Cash',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff727880),
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 5, top: 15),
                                    child: SizedBox(
                                      width: 30,
                                      height: 35,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: const Color(0xffFAEBEC)),
                                        child: const Center(
                                            child: Text(
                                          'Unpaid',
                                          style: TextStyle(
                                              color: Color(0xffE5646C),
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14,
                                              fontFamily: 'InterRegular'),
                                        )),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 25, left: 100),
                                    child: Text(
                                      '\$245.51',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Image.asset(
                                      'assets/more.png',
                                      height: 20,
                                      color: const Color(0xff9DA2A7),
                                    ),
                                  )
                                ],
                              ),
                              dividerTable2(context, constraints),
                              TableRow(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 13, left: 3),
                                    child: Image.asset(
                                      'assets/receipt-item.png',
                                      height: 40,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      '19 Sep 2022',
                                      style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: notifire.getblackcolor,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Row(
                                      children: [
                                        Text(
                                          '#VK0018-00017-2023',
                                          style: TextStyle(
                                            fontFamily: 'InterRegular',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: notifire.getblackcolor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 13, left: 3),
                                    child: Image.asset(
                                      'assets/Brand Logo22.png',
                                      height: 40,
                                      width: 40,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      'Razer',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      'Cash',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff727880),
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 5, top: 15),
                                    child: SizedBox(
                                      width: 30,
                                      height: 35,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
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
                                    padding: const EdgeInsets.only(
                                        top: 25, left: 100),
                                    child: Text(
                                      '\$859.01',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Image.asset(
                                      'assets/more.png',
                                      height: 20,
                                      color: const Color(0xff9DA2A7),
                                    ),
                                  )
                                ],
                              ),
                              dividerTable2(context, constraints),
                              TableRow(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 13, left: 3),
                                    child: Image.asset(
                                      'assets/receipt-item.png',
                                      height: 40,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      '18 Nov 2022',
                                      style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: notifire.getblackcolor,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Row(
                                      children: [
                                        Text(
                                          '#VK0018-00017-2023',
                                          style: TextStyle(
                                            fontFamily: 'InterRegular',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: notifire.getblackcolor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 13, left: 3),
                                    child: Image.asset(
                                      'assets/avatar-8 1.png',
                                      height: 40,
                                      width: 40,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      'Kristin Watson',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      'Online Payment',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff727880),
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 5, top: 15),
                                    child: SizedBox(
                                      width: 30,
                                      height: 35,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: const Color(0xffFDF0E9)),
                                        child: const Center(
                                            child: Text(
                                          'Scheduled',
                                          style: TextStyle(
                                              color: Color(0xffF3935D),
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14,
                                              fontFamily: 'InterRegular'),
                                        )),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 25, left: 100),
                                    child: Text(
                                      '\$678.99',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Image.asset(
                                      'assets/more.png',
                                      height: 20,
                                      color: const Color(0xff9DA2A7),
                                    ),
                                  )
                                ],
                              ),
                              dividerTable2(context, constraints),
                              TableRow(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 13, left: 3),
                                    child: Image.asset(
                                      'assets/receipt-item.png',
                                      height: 40,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      '26 Sep 2022',
                                      style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: notifire.getblackcolor,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Row(
                                      children: [
                                        Text(
                                          '#VK0018-00017-2023',
                                          style: TextStyle(
                                            fontFamily: 'InterRegular',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: notifire.getblackcolor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 13, left: 3),
                                    child: Image.asset(
                                      'assets/Store Avatar(1).png',
                                      height: 40,
                                      width: 40,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      'Netflix',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      'Cash',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff727880),
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 5, top: 15),
                                    child: SizedBox(
                                      width: 30,
                                      height: 35,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
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
                                    padding: const EdgeInsets.only(
                                        top: 25, left: 100),
                                    child: Text(
                                      '\$945.51',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Image.asset(
                                      'assets/more.png',
                                      height: 20,
                                      color: const Color(0xff9DA2A7),
                                    ),
                                  )
                                ],
                              ),
                              dividerTable2(context, constraints),
                              TableRow(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 13, left: 3),
                                    child: Image.asset(
                                      'assets/receipt-item.png',
                                      height: 40,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      '29 Sep 2022',
                                      style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: notifire.getblackcolor,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Row(
                                      children: [
                                        Text(
                                          '#VK0018-00017-2023',
                                          style: TextStyle(
                                            fontFamily: 'InterRegular',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: notifire.getblackcolor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 13, left: 3),
                                    child: Image.asset(
                                      'assets/Store Avatar.png',
                                      height: 40,
                                      width: 40,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      'Amazon.com',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      'Online Payment',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff727880),
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 5, top: 15),
                                    child: SizedBox(
                                      width: 30,
                                      height: 35,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: const Color(0xffFDF0E9)),
                                        child: const Center(
                                            child: Text(
                                          'Scheduled',
                                          style: TextStyle(
                                              color: Color(0xffF3935D),
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14,
                                              fontFamily: 'InterRegular'),
                                        )),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 25, left: 100),
                                    child: Text(
                                      '\$245.51',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Image.asset(
                                      'assets/more.png',
                                      height: 20,
                                      color: const Color(0xff9DA2A7),
                                    ),
                                  )
                                ],
                              ),
                              dividerTable2(context, constraints),
                              TableRow(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 13, left: 3),
                                    child: Image.asset(
                                      'assets/receipt-item.png',
                                      height: 40,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      '19 Aug 2022',
                                      style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: notifire.getblackcolor,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Row(
                                      children: [
                                        Text(
                                          '#VK0018-00017-2023',
                                          style: TextStyle(
                                            fontFamily: 'InterRegular',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: notifire.getblackcolor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 13, left: 3),
                                    child: Image.asset(
                                      'assets/avatar-7 1.png',
                                      height: 40,
                                      width: 40,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      'Kristin Watson',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      'Bank Transfer',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff727880),
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 5, top: 15),
                                    child: SizedBox(
                                      width: 30,
                                      height: 35,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: const Color(0xffFDF0E9)),
                                        child: const Center(
                                            child: Text(
                                          'Scheduled',
                                          style: TextStyle(
                                              color: Color(0xffF3935D),
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14,
                                              fontFamily: 'InterRegular'),
                                        )),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 25, left: 100),
                                    child: Text(
                                      '\$265.41',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Image.asset(
                                      'assets/more.png',
                                      height: 20,
                                      color: const Color(0xff9DA2A7),
                                    ),
                                  )
                                ],
                              ),
                              dividerTable2(context, constraints),
                              TableRow(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 13, left: 3),
                                    child: Image.asset(
                                      'assets/receipt-item.png',
                                      height: 40,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      '13 Sep 2022',
                                      style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: notifire.getblackcolor,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Row(
                                      children: [
                                        Text(
                                          '#VK0018-00017-2023',
                                          style: TextStyle(
                                            fontFamily: 'InterRegular',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: notifire.getblackcolor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 13, left: 3),
                                    child: Image.asset(
                                      'assets/Brand Logo21.png',
                                      height: 40,
                                      width: 40,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      'Microsoft Corp.',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      'Cash',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff727880),
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 5, top: 15),
                                    child: SizedBox(
                                      width: 30,
                                      height: 35,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: const Color(0xffFAEBEC)),
                                        child: const Center(
                                            child: Text(
                                          'Unpaid',
                                          style: TextStyle(
                                              color: Color(0xffE5646C),
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14,
                                              fontFamily: 'InterRegular'),
                                        )),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 25, left: 100),
                                    child: Text(
                                      '\$245.51',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Image.asset(
                                      'assets/more.png',
                                      height: 20,
                                      color: const Color(0xff9DA2A7),
                                    ),
                                  )
                                ],
                              ),
                              dividerTable2(context, constraints),
                              TableRow(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 13, left: 3),
                                    child: Image.asset(
                                      'assets/receipt-item.png',
                                      height: 40,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      '14 Sep 2022',
                                      style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: notifire.getblackcolor,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Row(
                                      children: [
                                        Text(
                                          '#VK0018-00017-2023',
                                          style: TextStyle(
                                            fontFamily: 'InterRegular',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: notifire.getblackcolor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 13, left: 3),
                                    child: Image.asset(
                                      'assets/Brand Logo11.png',
                                      height: 40,
                                      width: 40,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      'McDonal Offical',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 25, left: 8),
                                    child: Text(
                                      'Bank Transfer',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff727880),
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 5, top: 15),
                                    child: SizedBox(
                                      width: 30,
                                      height: 35,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
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
                                    padding: const EdgeInsets.only(
                                        top: 25, left: 100),
                                    child: Text(
                                      '\$293.01',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 25, left: 8),
                                    child: Image.asset(
                                      'assets/more.png',
                                      height: 20,
                                      color: const Color(0xff9DA2A7),
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
                ),
              ],
            ),
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Date',
                        style: TextStyle(
                            fontFamily: 'InterRegular',
                            color: Color(0xff9DA2A7),
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            const Text(
                              'All Date',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'InterRegular',
                                  color: Color(0xff727880)),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Image.asset(
                              'assets/arrow-down.png',
                              color: const Color(0xff727880),
                              height: 12,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        'Type',
                        style: TextStyle(
                            fontFamily: 'InterRegular',
                            color: Color(0xff9DA2A7),
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            const Text(
                              'All',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'InterRegular',
                                  color: Color(0xff727880)),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Image.asset(
                              'assets/arrow-down.png',
                              color: const Color(0xff727880),
                              height: 12,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        'Status',
                        style: TextStyle(
                            fontFamily: 'InterRegular',
                            color: Color(0xff9DA2A7),
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            const Text(
                              'All',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'InterRegular',
                                  color: Color(0xff727880)),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Image.asset(
                              'assets/arrow-down.png',
                              color: const Color(0xff727880),
                              height: 12,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        'Sort by',
                        style: TextStyle(
                            fontFamily: 'InterRegular',
                            color: Color(0xff9DA2A7),
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            const Text(
                              'Newest',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'InterRegular',
                                  color: Color(0xff727880)),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Image.asset(
                              'assets/arrow-down.png',
                              color: const Color(0xff727880),
                              height: 12,
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
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
                            0: FixedColumnWidth(80),
                            1: FixedColumnWidth(150),
                            2: FixedColumnWidth(180),
                            3: FixedColumnWidth(150),
                            4: FixedColumnWidth(150),
                            5: FixedColumnWidth(150),
                            6: FixedColumnWidth(150),
                            7: FixedColumnWidth(180),
                            8: FixedColumnWidth(110),
                          },
                          children: <TableRow>[
                            TableRow(
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 13, left: 3),
                                  child: Image.asset(
                                    'assets/receipt-item.png',
                                    height: 40,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 8),
                                  child: Text(
                                    '14 Sep 2022',
                                    style: TextStyle(
                                      fontFamily: 'InterRegular',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: notifire.getblackcolor,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 8),
                                  child: Row(
                                    children: [
                                      Text(
                                        '#VK0018-00017-2023',
                                        style: TextStyle(
                                          fontFamily: 'InterRegular',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 13, left: 3),
                                  child: Image.asset(
                                    'assets/Brand Logo11.png',
                                    height: 40,
                                    width: 40,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 8),
                                  child: Text(
                                    'McDonal Offical',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: notifire.getblackcolor,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 25, left: 8),
                                  child: Text(
                                    'Bank Transfer',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff727880),
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, top: 15),
                                  child: SizedBox(
                                    width: 30,
                                    height: 35,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
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
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 100),
                                  child: Text(
                                    '\$293.01',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: notifire.getblackcolor,
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 8),
                                  child: Image.asset(
                                    'assets/more.png',
                                    height: 20,
                                    color: const Color(0xff9DA2A7),
                                  ),
                                )
                              ],
                            ),
                            dividerTable2(context, constraints),
                            TableRow(
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 13, left: 3),
                                  child: Image.asset(
                                    'assets/receipt-item.png',
                                    height: 40,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 8),
                                  child: Text(
                                    '19 Sep 2022',
                                    style: TextStyle(
                                      fontFamily: 'InterRegular',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: notifire.getblackcolor,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 8),
                                  child: Row(
                                    children: [
                                      Text(
                                        '#VK0018-00017-2023',
                                        style: TextStyle(
                                          fontFamily: 'InterRegular',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 13, left: 3),
                                  child: Image.asset(
                                    'assets/Brand Logo22.png',
                                    height: 40,
                                    width: 40,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 8),
                                  child: Text(
                                    'Razer',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: notifire.getblackcolor,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 25, left: 8),
                                  child: Text(
                                    'Cash',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff727880),
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, top: 15),
                                  child: SizedBox(
                                    width: 30,
                                    height: 35,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
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
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 100),
                                  child: Text(
                                    '\$859.01',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: notifire.getblackcolor,
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 8),
                                  child: Image.asset(
                                    'assets/more.png',
                                    height: 20,
                                    color: const Color(0xff9DA2A7),
                                  ),
                                )
                              ],
                            ),
                            dividerTable2(context, constraints),
                            TableRow(
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 13, left: 3),
                                  child: Image.asset(
                                    'assets/receipt-item.png',
                                    height: 40,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 8),
                                  child: Text(
                                    '18 Nov 2022',
                                    style: TextStyle(
                                      fontFamily: 'InterRegular',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: notifire.getblackcolor,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 8),
                                  child: Row(
                                    children: [
                                      Text(
                                        '#VK0018-00017-2023',
                                        style: TextStyle(
                                          fontFamily: 'InterRegular',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 13, left: 3),
                                  child: Image.asset(
                                    'assets/avatar-8 1.png',
                                    height: 40,
                                    width: 40,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 8),
                                  child: Text(
                                    'Kristin Watson',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: notifire.getblackcolor,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 25, left: 8),
                                  child: Text(
                                    'Online Payment',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff727880),
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, top: 15),
                                  child: SizedBox(
                                    width: 30,
                                    height: 35,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: const Color(0xffFDF0E9)),
                                      child: const Center(
                                          child: Text(
                                        'Scheduled',
                                        style: TextStyle(
                                            color: Color(0xffF3935D),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                            fontFamily: 'InterRegular'),
                                      )),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 100),
                                  child: Text(
                                    '\$678.99',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: notifire.getblackcolor,
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 8),
                                  child: Image.asset(
                                    'assets/more.png',
                                    height: 20,
                                    color: const Color(0xff9DA2A7),
                                  ),
                                )
                              ],
                            ),
                            dividerTable2(context, constraints),
                            TableRow(
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 13, left: 3),
                                  child: Image.asset(
                                    'assets/receipt-item.png',
                                    height: 40,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 8),
                                  child: Text(
                                    '26 Sep 2022',
                                    style: TextStyle(
                                      fontFamily: 'InterRegular',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: notifire.getblackcolor,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 8),
                                  child: Row(
                                    children: [
                                      Text(
                                        '#VK0018-00017-2023',
                                        style: TextStyle(
                                          fontFamily: 'InterRegular',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 13, left: 3),
                                  child: Image.asset(
                                    'assets/Store Avatar(1).png',
                                    height: 40,
                                    width: 40,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 8),
                                  child: Text(
                                    'Netflix',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: notifire.getblackcolor,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 25, left: 8),
                                  child: Text(
                                    'Cash',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff727880),
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, top: 15),
                                  child: SizedBox(
                                    width: 30,
                                    height: 35,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
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
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 100),
                                  child: Text(
                                    '\$945.51',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: notifire.getblackcolor,
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 8),
                                  child: Image.asset(
                                    'assets/more.png',
                                    height: 20,
                                    color: const Color(0xff9DA2A7),
                                  ),
                                )
                              ],
                            ),
                            dividerTable2(context, constraints),
                            TableRow(
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 13, left: 3),
                                  child: Image.asset(
                                    'assets/receipt-item.png',
                                    height: 40,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 8),
                                  child: Text(
                                    '29 Sep 2022',
                                    style: TextStyle(
                                      fontFamily: 'InterRegular',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: notifire.getblackcolor,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 8),
                                  child: Row(
                                    children: [
                                      Text(
                                        '#VK0018-00017-2023',
                                        style: TextStyle(
                                          fontFamily: 'InterRegular',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 13, left: 3),
                                  child: Image.asset(
                                    'assets/Store Avatar.png',
                                    height: 40,
                                    width: 40,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 8),
                                  child: Text(
                                    'Amazon.com',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: notifire.getblackcolor,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 25, left: 8),
                                  child: Text(
                                    'Online Payment',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff727880),
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, top: 15),
                                  child: SizedBox(
                                    width: 30,
                                    height: 35,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: const Color(0xffFDF0E9)),
                                      child: const Center(
                                          child: Text(
                                        'Scheduled',
                                        style: TextStyle(
                                            color: Color(0xffF3935D),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                            fontFamily: 'InterRegular'),
                                      )),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 100),
                                  child: Text(
                                    '\$245.51',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: notifire.getblackcolor,
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 8),
                                  child: Image.asset(
                                    'assets/more.png',
                                    height: 20,
                                    color: const Color(0xff9DA2A7),
                                  ),
                                )
                              ],
                            ),
                            dividerTable2(context, constraints),
                            TableRow(
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 13, left: 3),
                                  child: Image.asset(
                                    'assets/receipt-item.png',
                                    height: 40,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 8),
                                  child: Text(
                                    '19 Aug 2022',
                                    style: TextStyle(
                                      fontFamily: 'InterRegular',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: notifire.getblackcolor,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 8),
                                  child: Row(
                                    children: [
                                      Text(
                                        '#VK0018-00017-2023',
                                        style: TextStyle(
                                          fontFamily: 'InterRegular',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 13, left: 3),
                                  child: Image.asset(
                                    'assets/avatar-7 1.png',
                                    height: 40,
                                    width: 40,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 8),
                                  child: Text(
                                    'Kristin Watson',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: notifire.getblackcolor,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 25, left: 8),
                                  child: Text(
                                    'Bank Transfer',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff727880),
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, top: 15),
                                  child: SizedBox(
                                    width: 30,
                                    height: 35,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: const Color(0xffFDF0E9)),
                                      child: const Center(
                                          child: Text(
                                        'Scheduled',
                                        style: TextStyle(
                                            color: Color(0xffF3935D),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                            fontFamily: 'InterRegular'),
                                      )),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 100),
                                  child: Text(
                                    '\$265.41',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: notifire.getblackcolor,
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 8),
                                  child: Image.asset(
                                    'assets/more.png',
                                    height: 20,
                                    color: const Color(0xff9DA2A7),
                                  ),
                                )
                              ],
                            ),
                            dividerTable2(context, constraints),
                            TableRow(
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 13, left: 3),
                                  child: Image.asset(
                                    'assets/receipt-item.png',
                                    height: 40,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 8),
                                  child: Text(
                                    '13 Sep 2022',
                                    style: TextStyle(
                                      fontFamily: 'InterRegular',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: notifire.getblackcolor,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 8),
                                  child: Row(
                                    children: [
                                      Text(
                                        '#VK0018-00017-2023',
                                        style: TextStyle(
                                          fontFamily: 'InterRegular',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 13, left: 3),
                                  child: Image.asset(
                                    'assets/Brand Logo21.png',
                                    height: 40,
                                    width: 40,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 8),
                                  child: Text(
                                    'Microsoft Corp.',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: notifire.getblackcolor,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 25, left: 8),
                                  child: Text(
                                    'Cash',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff727880),
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, top: 15),
                                  child: SizedBox(
                                    width: 30,
                                    height: 35,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: const Color(0xffFAEBEC)),
                                      child: const Center(
                                          child: Text(
                                        'Unpaid',
                                        style: TextStyle(
                                            color: Color(0xffE5646C),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                            fontFamily: 'InterRegular'),
                                      )),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 100),
                                  child: Text(
                                    '\$245.51',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: notifire.getblackcolor,
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 8),
                                  child: Image.asset(
                                    'assets/more.png',
                                    height: 20,
                                    color: const Color(0xff9DA2A7),
                                  ),
                                )
                              ],
                            ),
                            dividerTable2(context, constraints),
                            TableRow(
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 13, left: 3),
                                  child: Image.asset(
                                    'assets/receipt-item.png',
                                    height: 40,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 8),
                                  child: Text(
                                    '19 Sep 2022',
                                    style: TextStyle(
                                      fontFamily: 'InterRegular',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: notifire.getblackcolor,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 8),
                                  child: Row(
                                    children: [
                                      Text(
                                        '#VK0018-00017-2023',
                                        style: TextStyle(
                                          fontFamily: 'InterRegular',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 13, left: 3),
                                  child: Image.asset(
                                    'assets/Brand Logo22.png',
                                    height: 40,
                                    width: 40,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 8),
                                  child: Text(
                                    'Razer',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: notifire.getblackcolor,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 25, left: 8),
                                  child: Text(
                                    'Cash',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff727880),
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, top: 15),
                                  child: SizedBox(
                                    width: 30,
                                    height: 35,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
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
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 100),
                                  child: Text(
                                    '\$859.01',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: notifire.getblackcolor,
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 8),
                                  child: Image.asset(
                                    'assets/more.png',
                                    height: 20,
                                    color: const Color(0xff9DA2A7),
                                  ),
                                )
                              ],
                            ),
                            dividerTable2(context, constraints),
                            TableRow(
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 13, left: 3),
                                  child: Image.asset(
                                    'assets/receipt-item.png',
                                    height: 40,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 8),
                                  child: Text(
                                    '18 Nov 2022',
                                    style: TextStyle(
                                      fontFamily: 'InterRegular',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: notifire.getblackcolor,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 8),
                                  child: Row(
                                    children: [
                                      Text(
                                        '#VK0018-00017-2023',
                                        style: TextStyle(
                                          fontFamily: 'InterRegular',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 13, left: 3),
                                  child: Image.asset(
                                    'assets/avatar-8 1.png',
                                    height: 40,
                                    width: 40,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 8),
                                  child: Text(
                                    'Kristin Watson',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: notifire.getblackcolor,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 25, left: 8),
                                  child: Text(
                                    'Online Payment',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff727880),
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, top: 15),
                                  child: SizedBox(
                                    width: 30,
                                    height: 35,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: const Color(0xffFDF0E9)),
                                      child: const Center(
                                          child: Text(
                                        'Scheduled',
                                        style: TextStyle(
                                            color: Color(0xffF3935D),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                            fontFamily: 'InterRegular'),
                                      )),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 100),
                                  child: Text(
                                    '\$678.99',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: notifire.getblackcolor,
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 8),
                                  child: Image.asset(
                                    'assets/more.png',
                                    height: 20,
                                    color: const Color(0xff9DA2A7),
                                  ),
                                )
                              ],
                            ),
                            dividerTable2(context, constraints),
                            TableRow(
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 13, left: 3),
                                  child: Image.asset(
                                    'assets/receipt-item.png',
                                    height: 40,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 8),
                                  child: Text(
                                    '26 Sep 2022',
                                    style: TextStyle(
                                      fontFamily: 'InterRegular',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: notifire.getblackcolor,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 8),
                                  child: Row(
                                    children: [
                                      Text(
                                        '#VK0018-00017-2023',
                                        style: TextStyle(
                                          fontFamily: 'InterRegular',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 13, left: 3),
                                  child: Image.asset(
                                    'assets/Store Avatar(1).png',
                                    height: 40,
                                    width: 40,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 8),
                                  child: Text(
                                    'Netflix',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: notifire.getblackcolor,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 25, left: 8),
                                  child: Text(
                                    'Cash',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff727880),
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, top: 15),
                                  child: SizedBox(
                                    width: 30,
                                    height: 35,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
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
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 100),
                                  child: Text(
                                    '\$945.51',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: notifire.getblackcolor,
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 8),
                                  child: Image.asset(
                                    'assets/more.png',
                                    height: 20,
                                    color: const Color(0xff9DA2A7),
                                  ),
                                )
                              ],
                            ),
                            dividerTable2(context, constraints),
                            TableRow(
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 13, left: 3),
                                  child: Image.asset(
                                    'assets/receipt-item.png',
                                    height: 40,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 8),
                                  child: Text(
                                    '29 Sep 2022',
                                    style: TextStyle(
                                      fontFamily: 'InterRegular',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: notifire.getblackcolor,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 8),
                                  child: Row(
                                    children: [
                                      Text(
                                        '#VK0018-00017-2023',
                                        style: TextStyle(
                                          fontFamily: 'InterRegular',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 13, left: 3),
                                  child: Image.asset(
                                    'assets/Store Avatar.png',
                                    height: 40,
                                    width: 40,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 8),
                                  child: Text(
                                    'Amazon.com',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: notifire.getblackcolor,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 25, left: 8),
                                  child: Text(
                                    'Online Payment',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff727880),
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, top: 15),
                                  child: SizedBox(
                                    width: 30,
                                    height: 35,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: const Color(0xffFDF0E9)),
                                      child: const Center(
                                          child: Text(
                                        'Scheduled',
                                        style: TextStyle(
                                            color: Color(0xffF3935D),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                            fontFamily: 'InterRegular'),
                                      )),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 100),
                                  child: Text(
                                    '\$245.51',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: notifire.getblackcolor,
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 8),
                                  child: Image.asset(
                                    'assets/more.png',
                                    height: 20,
                                    color: const Color(0xff9DA2A7),
                                  ),
                                )
                              ],
                            ),
                            dividerTable2(context, constraints),
                            TableRow(
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 13, left: 3),
                                  child: Image.asset(
                                    'assets/receipt-item.png',
                                    height: 40,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 8),
                                  child: Text(
                                    '19 Aug 2022',
                                    style: TextStyle(
                                      fontFamily: 'InterRegular',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: notifire.getblackcolor,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 8),
                                  child: Row(
                                    children: [
                                      Text(
                                        '#VK0018-00017-2023',
                                        style: TextStyle(
                                          fontFamily: 'InterRegular',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 13, left: 3),
                                  child: Image.asset(
                                    'assets/avatar-7 1.png',
                                    height: 40,
                                    width: 40,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 8),
                                  child: Text(
                                    'Kristin Watson',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: notifire.getblackcolor,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 25, left: 8),
                                  child: Text(
                                    'Bank Transfer',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff727880),
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, top: 15),
                                  child: SizedBox(
                                    width: 30,
                                    height: 35,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: const Color(0xffFDF0E9)),
                                      child: const Center(
                                          child: Text(
                                        'Scheduled',
                                        style: TextStyle(
                                            color: Color(0xffF3935D),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                            fontFamily: 'InterRegular'),
                                      )),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 100),
                                  child: Text(
                                    '\$265.41',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: notifire.getblackcolor,
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 8),
                                  child: Image.asset(
                                    'assets/more.png',
                                    height: 20,
                                    color: const Color(0xff9DA2A7),
                                  ),
                                )
                              ],
                            ),
                            dividerTable2(context, constraints),
                            TableRow(
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 13, left: 3),
                                  child: Image.asset(
                                    'assets/receipt-item.png',
                                    height: 40,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 8),
                                  child: Text(
                                    '13 Sep 2022',
                                    style: TextStyle(
                                      fontFamily: 'InterRegular',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: notifire.getblackcolor,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 8),
                                  child: Row(
                                    children: [
                                      Text(
                                        '#VK0018-00017-2023',
                                        style: TextStyle(
                                          fontFamily: 'InterRegular',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 13, left: 3),
                                  child: Image.asset(
                                    'assets/Brand Logo21.png',
                                    height: 40,
                                    width: 40,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 8),
                                  child: Text(
                                    'Microsoft Corp.',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: notifire.getblackcolor,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 25, left: 8),
                                  child: Text(
                                    'Cash',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff727880),
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, top: 15),
                                  child: SizedBox(
                                    width: 30,
                                    height: 35,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: const Color(0xffFAEBEC)),
                                      child: const Center(
                                          child: Text(
                                        'Unpaid',
                                        style: TextStyle(
                                            color: Color(0xffE5646C),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                            fontFamily: 'InterRegular'),
                                      )),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 100),
                                  child: Text(
                                    '\$245.51',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: notifire.getblackcolor,
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 8),
                                  child: Image.asset(
                                    'assets/more.png',
                                    height: 20,
                                    color: const Color(0xff9DA2A7),
                                  ),
                                )
                              ],
                            ),
                            dividerTable2(context, constraints),
                            TableRow(
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 13, left: 3),
                                  child: Image.asset(
                                    'assets/receipt-item.png',
                                    height: 40,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 8),
                                  child: Text(
                                    '14 Sep 2022',
                                    style: TextStyle(
                                      fontFamily: 'InterRegular',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: notifire.getblackcolor,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 8),
                                  child: Row(
                                    children: [
                                      Text(
                                        '#VK0018-00017-2023',
                                        style: TextStyle(
                                          fontFamily: 'InterRegular',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 13, left: 3),
                                  child: Image.asset(
                                    'assets/Brand Logo11.png',
                                    height: 40,
                                    width: 40,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 8),
                                  child: Text(
                                    'McDonal Offical',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: notifire.getblackcolor,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 25, left: 8),
                                  child: Text(
                                    'Bank Transfer',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff727880),
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, top: 15),
                                  child: SizedBox(
                                    width: 30,
                                    height: 35,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
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
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 100),
                                  child: Text(
                                    '\$293.01',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: notifire.getblackcolor,
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 8),
                                  child: Image.asset(
                                    'assets/more.png',
                                    height: 20,
                                    color: const Color(0xff9DA2A7),
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
              ),
            ],
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
              Future.delayed(const Duration(milliseconds: 300),
                    () {
                  if (value == true) {
                    Get.updateLocale(
                        const Locale('ur', 'PK'));
                    Get.back();
                  } else {
                    Get.updateLocale(
                        const Locale('en', 'US'));
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
  Widget screen2(constraints) {
    return Column(
      children: [
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            mainAxisExtent: Get.height * 0.5,
          ),
          itemCount: model().car.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: notifire.getbgcolor11,
              ),
              child: DottedBorder(
                color: const Color(0xffC6C8CB),
                borderType: BorderType.RRect,
                radius: const Radius.circular(12),
                padding: const EdgeInsets.all(12),
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: SizedBox(
                    width: Get.width,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: model().car[index]),
                                child: Center(
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        model().caarr[index],
                                        height: 12,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        model().caar[index],
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'InterRegular',
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Image.asset(
                                'assets/more.png',
                                height: 20,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: Get.width,
                            height: constraints.maxWidth > 1500
                                ? Get.height * 0.25
                                : constraints.maxWidth < 1500
                                    ? Get.height * 0.2
                                    : Get.height * 0.25,
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                    image: AssetImage(model().cards[index]),
                                    fit: BoxFit.cover)),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: notifire.Getblg2),
                            child: Row(
                              children: [
                                Text(
                                  'Current Balance',
                                  style: TextStyle(
                                    color: notifire.getblackcolor,
                                    fontFamily: 'InterRegular',
                                    fontSize: 14,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  model().carrr[index],
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: notifire.getblackcolor,
                                      fontFamily: 'InterRegular',
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: notifire.Getblg2),
                            child: Row(
                              children: [
                                Text(
                                  'Limited per Month',
                                  style: TextStyle(
                                    color: notifire.getblackcolor,
                                    fontFamily: 'InterRegular',
                                    fontSize: 14,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  '\$1000',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: notifire.getblackcolor,
                                      fontFamily: 'InterRegular',
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget screen3(constraints) {
    return Column(
      children: [
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            mainAxisExtent: Get.height * 0.5,
          ),
          itemCount: model().car.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: notifire.getbgcolor11,
              ),
              child: DottedBorder(
                color: const Color(0xffC6C8CB),
                borderType: BorderType.RRect,
                radius: const Radius.circular(12),
                padding: const EdgeInsets.all(12),
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: SizedBox(
                    width: Get.width,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: model().car[index]),
                                child: Center(
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        model().caarr[index],
                                        height: 12,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        model().caar[index],
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'InterRegular',
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Image.asset(
                                'assets/more.png',
                                height: 20,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: Get.width,
                            height: constraints.maxWidth > 1500
                                ? Get.height * 0.25
                                : constraints.maxWidth < 1500
                                    ? Get.height * 0.2
                                    : Get.height * 0.25,
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                    image: AssetImage(model().cards[index]),
                                    fit: BoxFit.cover)),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: notifire.Getblg2),
                            child: Row(
                              children: [
                                Text(
                                  'Current Balance',
                                  style: TextStyle(
                                    color: notifire.getblackcolor,
                                    fontFamily: 'InterRegular',
                                    fontSize: 14,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  model().carrr[index],
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: notifire.getblackcolor,
                                      fontFamily: 'InterRegular',
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: notifire.Getblg2),
                            child: Row(
                              children: [
                                Text(
                                  'Limited per Month',
                                  style: TextStyle(
                                    color: notifire.getblackcolor,
                                    fontFamily: 'InterRegular',
                                    fontSize: 14,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  '\$1000',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: notifire.getblackcolor,
                                      fontFamily: 'InterRegular',
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  int value = 0;

  Widget radioButton(int index) {
    return StatefulBuilder(builder: (context, setState) {
      return const Row(
        children: [],
      );
    });
  }

  TableRow dividerTable(BuildContext context, constraints) {
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

  TableRow dividerTable1(BuildContext context, constraints) {
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

  TableRow dividerTable2(BuildContext context, constraints) {
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
