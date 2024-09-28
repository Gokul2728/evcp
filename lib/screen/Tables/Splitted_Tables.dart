// ignore_for_file: prefer_const_constructors, file_names, camel_case_types, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:evcp/confing/colors.dart';
import 'package:evcp/confing/image.dart';
import 'package:evcp/controller/page_controller.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../confing/notifier.dart';
import '../Dashboard/Dashboard_main.dart';
// ignore_for_file: deprecated_member_use

class SplittedTables extends StatefulWidget {
  const SplittedTables({super.key});

  @override
  State<SplittedTables> createState() => _SplittedTablesState();
}

class _SplittedTablesState extends State<SplittedTables> {
  bool isActive = false;
  int value = 0;
  late ColorNotifier notifire;
  bool tap = false;
  SampleItem? selectedMenu;
  DateTime selectedDate = DateTime.now();
  InboxController inboxController = Get.put(InboxController());
  TextEditingController dateController = TextEditingController();

  DateRangePickerController dateSelecter = DateRangePickerController();

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifier>(context, listen: true);
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 700) {
          return SizedBox(
            height: Get.height,
            child: Scaffold(
              backgroundColor: notifire.getbgcolor10,
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Search(context, constraints.maxHeight),
                      const SizedBox(
                        height: 20,
                      ),
                      data1(context, constraints.maxWidth),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else if (constraints.maxWidth < 1000) {
          return Container(
            decoration: BoxDecoration(
              color: notifire.getbgcolor10,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 1,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            bottom: 20, right: 20, left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Search(context, constraints.maxHeight),
                            const SizedBox(
                              height: 20,
                            ),
                            data1(context, constraints.maxWidth)
                          ],
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          );
        } else {
          return Container(
            decoration: BoxDecoration(color: notifire.getbgcolor10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(),
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 1,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            right: 20, left: 20, bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Search(context, constraints.maxHeight),
                            const SizedBox(
                              height: 20,
                            ),
                            data1(context, constraints.maxWidth)
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
  }

  Widget Search(BuildContext context, size) => GetBuilder<InboxController>(
        builder: (controller) {
          return size < 600
              ? Column(
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
                          'Table',
                          style: TextStyle(
                              color: greyy,
                              fontSize: 14,
                              fontFamily: 'InterRegular'),
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
                          'Splitted',
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
                      children: [
                        const Spacer(),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: notifire.getbgcolor11,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(14),
                            child: Center(
                                child: Image.asset(
                              'assets/setting-5.png',
                              scale: 4,
                            )),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: notifire.getbgcolor11,
                            ),
                            padding: const EdgeInsets.all(14),
                            child: Row(
                              children: [
                                Image.asset('assets/printer.png', scale: 4),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                                color: notifire.getbgcolor11,
                                borderRadius: BorderRadius.circular(12)),
                            child: Row(children: [
                              Image.asset('assets/export.png', scale: 4),
                            ]),
                          ),
                        )
                      ],
                    ),
                  ],
                )
              : Column(
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
                          'Table',
                          style: TextStyle(
                              color: greyy,
                              fontSize: 14,
                              fontFamily: 'InterRegular'),
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
                          'Splitted',
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
                      children: [
                        const Spacer(),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: notifire.getbgcolor11,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Center(
                                  child: Image.asset(
                                'assets/setting-5.png',
                                scale: 4,
                              )),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: notifire.getbgcolor11,
                            ),
                            padding: const EdgeInsets.all(11),
                            child: Center(
                                child: Row(
                              children: [
                                Image.asset('assets/printer.png', scale: 4),
                                const SizedBox(width: 10),
                                Text(
                                  'Print',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'InterRegular',
                                      color: notifire.getblackcolor),
                                )
                              ],
                            )),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.all(11),
                            decoration: BoxDecoration(
                                color: notifire.getbgcolor11,
                                borderRadius: BorderRadius.circular(12)),
                            child: Center(
                                child: Row(
                              children: [
                                Image.asset('assets/export.png', scale: 4),
                                const SizedBox(width: 10),
                                Text(
                                  'Export',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'InterRegular',
                                      color: notifire.getblackcolor),
                                )
                              ],
                            )),
                          ),
                        )
                      ],
                    ),
                  ],
                );
        },
      );

  Widget data1(BuildContext context, constraints) {
    return constraints < 600
        ? SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              children: [
                SizedBox(
                  width: Get.width * 3.5,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    width: Get.width,
                    decoration: BoxDecoration(
                        color: notifire.getbgcolor11,
                        // color: Colors.red,
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: constraints < 1400 ? 1500 : Get.width,
                          child: Table(
                            border: TableBorder.all(color: Colors.transparent),
                            columnWidths: const <int, TableColumnWidth>{
                              0: FixedColumnWidth(40),
                              1: FixedColumnWidth(180),
                              2: FixedColumnWidth(150),
                              3: FixedColumnWidth(130),
                              4: FixedColumnWidth(140),
                              5: FixedColumnWidth(100),
                              6: FixedColumnWidth(115),
                              7: FixedColumnWidth(110),
                              8: FixedColumnWidth(130),
                              9: FixedColumnWidth(130),
                              10: FixedColumnWidth(130),
                            },
                            children: <TableRow>[
                              TableRow(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text('1',
                                        style: TextStyle(
                                            color: greyy,
                                            fontFamily: 'InterRegular')),
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(AppContent.Bitcoin,
                                          height: 30, width: 30),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Bitcoin (BTC)',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'InterRegular',
                                          color: greyy,
                                        ),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      'Market Cap',
                                      style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        color: greyy,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '\$162.24',
                                      style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        color: greyy,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '\$95,630M',
                                      style: TextStyle(
                                          color: greyy,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '+0.32%',
                                      style: TextStyle(
                                          color: Color(0xff7DC066),
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '-2.44',
                                      style: TextStyle(
                                          color: Color(0xffE5646C),
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '+0.33',
                                      style: TextStyle(
                                          color: Color(0xff7DC066),
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '-0.23',
                                      style: TextStyle(
                                          color: Color(0xffE5646C),
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Row(
                                      children: [
                                        InkWell(
                                            onTap: () {},
                                            child: Image.asset(
                                                'assets/photos.png',
                                                scale: 4)),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: Image.asset(
                                            'assets/more.png',
                                            scale: 3,
                                          ),
                                        ),
                                      ],
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
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: Get.width * 3.5,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    width: Get.width,
                    decoration: BoxDecoration(
                        color: notifire.getbgcolor11,
                        // color: Colors.red,
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: constraints < 1400 ? 1500 : Get.width,
                          child: Table(
                            border: TableBorder.all(color: Colors.transparent),
                            columnWidths: const <int, TableColumnWidth>{
                              0: FixedColumnWidth(40),
                              1: FixedColumnWidth(180),
                              2: FixedColumnWidth(150),
                              3: FixedColumnWidth(130),
                              4: FixedColumnWidth(140),
                              5: FixedColumnWidth(100),
                              6: FixedColumnWidth(115),
                              7: FixedColumnWidth(110),
                              8: FixedColumnWidth(130),
                              9: FixedColumnWidth(130),
                              10: FixedColumnWidth(130),
                            },
                            children: <TableRow>[
                              TableRow(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text('2',
                                        style: TextStyle(
                                            color: greyy,
                                            fontFamily: 'InterRegular')),
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(AppContent.Ethereum,
                                          height: 30, width: 30),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Ethereum (ETH)',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'InterRegular',
                                          color: greyy,
                                        ),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      'Market Cap',
                                      style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        color: greyy,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '\$342.24',
                                      style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        color: greyy,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '\$25,340M',
                                      style: TextStyle(
                                          color: greyy,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '+0.22%',
                                      style: TextStyle(
                                          color: Color(0xff7DC066),
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '-4.44',
                                      style: TextStyle(
                                          color: Color(0xffE5646C),
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '+3.33',
                                      style: TextStyle(
                                          color: Color(0xffE5646C),
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '-8.23',
                                      style: TextStyle(
                                          color: Color(0xffE5646C),
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Row(
                                      children: [
                                        InkWell(
                                            onTap: () {},
                                            child: Image.asset(
                                                'assets/photos.png',
                                                scale: 4)),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: Image.asset(
                                            'assets/more.png',
                                            scale: 3,
                                          ),
                                        ),
                                      ],
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
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: Get.width * 3.5,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    width: Get.width,
                    decoration: BoxDecoration(
                        color: notifire.getbgcolor11,
                        // color: Colors.red,
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: constraints < 1400 ? 1500 : Get.width,
                          child: Table(
                            border: TableBorder.all(color: Colors.transparent),
                            columnWidths: const <int, TableColumnWidth>{
                              0: FixedColumnWidth(40),
                              1: FixedColumnWidth(180),
                              2: FixedColumnWidth(150),
                              3: FixedColumnWidth(130),
                              4: FixedColumnWidth(140),
                              5: FixedColumnWidth(100),
                              6: FixedColumnWidth(115),
                              7: FixedColumnWidth(110),
                              8: FixedColumnWidth(130),
                              9: FixedColumnWidth(130),
                              10: FixedColumnWidth(130),
                            },
                            children: <TableRow>[
                              TableRow(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text('3',
                                        style: TextStyle(
                                            color: greyy,
                                            fontFamily: 'InterRegular')),
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(AppContent.BNB,
                                          height: 30, width: 30),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Binance (BNB)',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'InterRegular',
                                          color: greyy,
                                        ),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      'Market Cap',
                                      style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        color: greyy,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '\$462.24',
                                      style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        color: greyy,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '\$88,610M',
                                      style: TextStyle(
                                          color: greyy,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '+0.32%',
                                      style: TextStyle(
                                          color: Color(0xffE5646C),
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '-9.44',
                                      style: TextStyle(
                                          color: Color(0xffE5646C),
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '+1.45',
                                      style: TextStyle(
                                          color: Color(0xff7DC066),
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '-6.23',
                                      style: TextStyle(
                                          color: Color(0xff7DC066),
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Row(
                                      children: [
                                        InkWell(
                                            onTap: () {},
                                            child: Image.asset(
                                                'assets/photos.png',
                                                scale: 4)),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: Image.asset(
                                            'assets/more.png',
                                            scale: 3,
                                          ),
                                        ),
                                      ],
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
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: Get.width * 3.5,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    width: Get.width,
                    decoration: BoxDecoration(
                        color: notifire.getbgcolor11,
                        // color: Colors.red,
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: constraints < 1400 ? 1500 : Get.width,
                          child: Table(
                            border: TableBorder.all(color: Colors.transparent),
                            columnWidths: const <int, TableColumnWidth>{
                              0: FixedColumnWidth(40),
                              1: FixedColumnWidth(180),
                              2: FixedColumnWidth(150),
                              3: FixedColumnWidth(130),
                              4: FixedColumnWidth(140),
                              5: FixedColumnWidth(100),
                              6: FixedColumnWidth(115),
                              7: FixedColumnWidth(110),
                              8: FixedColumnWidth(130),
                              9: FixedColumnWidth(130),
                              10: FixedColumnWidth(130),
                            },
                            children: <TableRow>[
                              TableRow(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text('4',
                                        style: TextStyle(
                                            color: greyy,
                                            fontFamily: 'InterRegular')),
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(AppContent.Shiba,
                                          height: 30, width: 30),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Shiba Inu (SHIB)',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'InterRegular',
                                          color: greyy,
                                        ),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      'Market Cap',
                                      style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        color: greyy,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '\$342.24',
                                      style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        color: greyy,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '\$78,670M',
                                      style: TextStyle(
                                          color: greyy,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '+0.22%',
                                      style: TextStyle(
                                          color: Color(0xff7DC066),
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '-4.44',
                                      style: TextStyle(
                                          color: Color(0xff7DC066),
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '+8.66',
                                      style: TextStyle(
                                          color: Color(0xff7DC066),
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '-2.63',
                                      style: TextStyle(
                                          color: Color(0xffE5646C),
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Row(
                                      children: [
                                        InkWell(
                                            onTap: () {},
                                            child: Image.asset(
                                                'assets/photos.png',
                                                scale: 4)),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: Image.asset(
                                            'assets/more.png',
                                            scale: 3,
                                          ),
                                        ),
                                      ],
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
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: Get.width * 3.5,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    width: Get.width,
                    decoration: BoxDecoration(
                        color: notifire.getbgcolor11,
                        // color: Colors.red,
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: constraints < 1400 ? 1500 : Get.width,
                          child: Table(
                            border: TableBorder.all(color: Colors.transparent),
                            columnWidths: const <int, TableColumnWidth>{
                              0: FixedColumnWidth(40),
                              1: FixedColumnWidth(180),
                              2: FixedColumnWidth(150),
                              3: FixedColumnWidth(130),
                              4: FixedColumnWidth(140),
                              5: FixedColumnWidth(100),
                              6: FixedColumnWidth(115),
                              7: FixedColumnWidth(110),
                              8: FixedColumnWidth(130),
                              9: FixedColumnWidth(130),
                              10: FixedColumnWidth(130),
                            },
                            children: <TableRow>[
                              TableRow(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text('5',
                                        style: TextStyle(
                                            color: greyy,
                                            fontFamily: 'InterRegular')),
                                  ),
                                  Row(
                                    children: [
                                      Image.asset('assets/Cardano ADA.png',
                                          height: 30, width: 30),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Cardano',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'InterRegular',
                                          color: greyy,
                                        ),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      'Market Cap',
                                      style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        color: greyy,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '\$462.24',
                                      style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        color: greyy,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '\$88,610M',
                                      style: TextStyle(
                                          color: greyy,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '+0.32%',
                                      style: TextStyle(
                                          color: Color(0xffE5646C),
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '-9.44',
                                      style: TextStyle(
                                          color: Color(0xffE5646C),
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '+1.45',
                                      style: TextStyle(
                                          color: Color(0xff7DC066),
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '-6.23',
                                      style: TextStyle(
                                          color: Color(0xff7DC066),
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Row(
                                      children: [
                                        InkWell(
                                            onTap: () {},
                                            child: Image.asset(
                                                'assets/photos.png',
                                                scale: 4)),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: Image.asset(
                                            'assets/more.png',
                                            scale: 3,
                                          ),
                                        ),
                                      ],
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
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: Get.width * 3.5,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    width: Get.width,
                    decoration: BoxDecoration(
                        color: notifire.getbgcolor11,
                        // color: Colors.red,
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: constraints < 1400 ? 1500 : Get.width,
                          child: Table(
                            border: TableBorder.all(color: Colors.transparent),
                            columnWidths: const <int, TableColumnWidth>{
                              0: FixedColumnWidth(40),
                              1: FixedColumnWidth(180),
                              2: FixedColumnWidth(150),
                              3: FixedColumnWidth(130),
                              4: FixedColumnWidth(140),
                              5: FixedColumnWidth(100),
                              6: FixedColumnWidth(115),
                              7: FixedColumnWidth(110),
                              8: FixedColumnWidth(130),
                              9: FixedColumnWidth(130),
                              10: FixedColumnWidth(130),
                            },
                            children: <TableRow>[
                              TableRow(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text('6',
                                        style: TextStyle(
                                            color: greyy,
                                            fontFamily: 'InterRegular')),
                                  ),
                                  Row(
                                    children: [
                                      Image.asset('assets/Zcash.png',
                                          height: 30, width: 30),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Zcash',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'InterRegular',
                                          color: greyy,
                                        ),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      'Market Cap',
                                      style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        color: greyy,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '\$342.24',
                                      style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        color: greyy,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '\$78,670M',
                                      style: TextStyle(
                                          color: greyy,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '+0.22%',
                                      style: TextStyle(
                                          color: Color(0xff7DC066),
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '-4.44',
                                      style: TextStyle(
                                          color: Color(0xff7DC066),
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '+8.66',
                                      style: TextStyle(
                                          color: Color(0xff7DC066),
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '-2.63',
                                      style: TextStyle(
                                          color: Color(0xffE5646C),
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Row(
                                      children: [
                                        InkWell(
                                            onTap: () {},
                                            child: Image.asset(
                                                'assets/photos.png',
                                                scale: 4)),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: Image.asset(
                                            'assets/more.png',
                                            scale: 3,
                                          ),
                                        ),
                                      ],
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
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: Get.width * 3.5,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    width: Get.width,
                    decoration: BoxDecoration(
                        color: notifire.getbgcolor11,
                        // color: Colors.red,
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: constraints < 1400 ? 1500 : Get.width,
                          child: Table(
                            border: TableBorder.all(color: Colors.transparent),
                            columnWidths: const <int, TableColumnWidth>{
                              0: FixedColumnWidth(40),
                              1: FixedColumnWidth(180),
                              2: FixedColumnWidth(150),
                              3: FixedColumnWidth(130),
                              4: FixedColumnWidth(140),
                              5: FixedColumnWidth(100),
                              6: FixedColumnWidth(115),
                              7: FixedColumnWidth(110),
                              8: FixedColumnWidth(130),
                              9: FixedColumnWidth(130),
                              10: FixedColumnWidth(130),
                            },
                            children: <TableRow>[
                              TableRow(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text('7',
                                        style: TextStyle(
                                            color: greyy,
                                            fontFamily: 'InterRegular')),
                                  ),
                                  Row(
                                    children: [
                                      Image.asset('assets/eCash.png',
                                          height: 30, width: 30),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'eCash',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'InterRegular',
                                          color: greyy,
                                        ),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      'Market Cap',
                                      style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        color: greyy,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '\$162.24',
                                      style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        color: greyy,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '\$95,630M',
                                      style: TextStyle(
                                          color: greyy,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '+0.32%',
                                      style: TextStyle(
                                          color: Color(0xff7DC066),
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '-2.44',
                                      style: TextStyle(
                                          color: Color(0xffE5646C),
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '+0.33',
                                      style: TextStyle(
                                          color: Color(0xff7DC066),
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '-0.23',
                                      style: TextStyle(
                                          color: Color(0xffE5646C),
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Row(
                                      children: [
                                        InkWell(
                                            onTap: () {},
                                            child: Image.asset(
                                                'assets/photos.png',
                                                scale: 4)),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: Image.asset(
                                            'assets/more.png',
                                            scale: 3,
                                          ),
                                        ),
                                      ],
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
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: Get.width * 3.5,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    width: Get.width,
                    decoration: BoxDecoration(
                        color: notifire.getbgcolor11,
                        // color: Colors.red,
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: constraints < 1400 ? 1500 : Get.width,
                          child: Table(
                            border: TableBorder.all(color: Colors.transparent),
                            columnWidths: const <int, TableColumnWidth>{
                              0: FixedColumnWidth(40),
                              1: FixedColumnWidth(180),
                              2: FixedColumnWidth(150),
                              3: FixedColumnWidth(130),
                              4: FixedColumnWidth(140),
                              5: FixedColumnWidth(100),
                              6: FixedColumnWidth(115),
                              7: FixedColumnWidth(110),
                              8: FixedColumnWidth(130),
                              9: FixedColumnWidth(130),
                              10: FixedColumnWidth(130),
                            },
                            children: <TableRow>[
                              TableRow(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text('8',
                                        style: TextStyle(
                                            color: greyy,
                                            fontFamily: 'InterRegular')),
                                  ),
                                  Row(
                                    children: [
                                      Image.asset('assets/Eos.png',
                                          height: 30, width: 30),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Eos',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'InterRegular',
                                          color: greyy,
                                        ),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      'Market Cap',
                                      style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        color: greyy,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '\$342.24',
                                      style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        color: greyy,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '\$25,340M',
                                      style: TextStyle(
                                          color: greyy,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '+0.22%',
                                      style: TextStyle(
                                          color: Color(0xff7DC066),
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '-4.44',
                                      style: TextStyle(
                                          color: Color(0xffE5646C),
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '+3.33',
                                      style: TextStyle(
                                          color: Color(0xffE5646C),
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '-8.23',
                                      style: TextStyle(
                                          color: Color(0xffE5646C),
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Row(
                                      children: [
                                        InkWell(
                                            onTap: () {},
                                            child: Image.asset(
                                                'assets/photos.png',
                                                scale: 4)),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: Image.asset(
                                            'assets/more.png',
                                            scale: 3,
                                          ),
                                        ),
                                      ],
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
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: Get.width * 3.5,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    width: Get.width,
                    decoration: BoxDecoration(
                        color: notifire.getbgcolor11,
                        // color: Colors.red,
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: constraints < 1400 ? 1500 : Get.width,
                          child: Table(
                            border: TableBorder.all(color: Colors.transparent),
                            columnWidths: const <int, TableColumnWidth>{
                              0: FixedColumnWidth(40),
                              1: FixedColumnWidth(180),
                              2: FixedColumnWidth(150),
                              3: FixedColumnWidth(130),
                              4: FixedColumnWidth(140),
                              5: FixedColumnWidth(100),
                              6: FixedColumnWidth(115),
                              7: FixedColumnWidth(110),
                              8: FixedColumnWidth(130),
                              9: FixedColumnWidth(130),
                              10: FixedColumnWidth(130),
                            },
                            children: <TableRow>[
                              TableRow(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text('9',
                                        style: TextStyle(
                                            color: greyy,
                                            fontFamily: 'InterRegular')),
                                  ),
                                  Row(
                                    children: [
                                      Image.asset('assets/Litecoin LTC.png',
                                          height: 30, width: 30),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Litecoin LTC',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'InterRegular',
                                          color: greyy,
                                        ),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      'Market Cap',
                                      style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        color: greyy,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '\$462.24',
                                      style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        color: greyy,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '\$88,610M',
                                      style: TextStyle(
                                          color: greyy,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '+0.32%',
                                      style: TextStyle(
                                          color: Color(0xffE5646C),
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '-9.44',
                                      style: TextStyle(
                                          color: Color(0xffE5646C),
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '+1.45',
                                      style: TextStyle(
                                          color: Color(0xff7DC066),
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '-6.23',
                                      style: TextStyle(
                                          color: Color(0xff7DC066),
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Row(
                                      children: [
                                        InkWell(
                                            onTap: () {},
                                            child: Image.asset(
                                                'assets/photos.png',
                                                scale: 4)),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: Image.asset(
                                            'assets/more.png',
                                            scale: 3,
                                          ),
                                        ),
                                      ],
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
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: Get.width * 3.5,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    width: Get.width,
                    decoration: BoxDecoration(
                        color: notifire.getbgcolor11,
                        // color: Colors.red,
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: constraints < 1400 ? 1500 : Get.width,
                          child: Table(
                            border: TableBorder.all(color: Colors.transparent),
                            columnWidths: const <int, TableColumnWidth>{
                              0: FixedColumnWidth(40),
                              1: FixedColumnWidth(180),
                              2: FixedColumnWidth(150),
                              3: FixedColumnWidth(130),
                              4: FixedColumnWidth(140),
                              5: FixedColumnWidth(100),
                              6: FixedColumnWidth(115),
                              7: FixedColumnWidth(110),
                              8: FixedColumnWidth(130),
                              9: FixedColumnWidth(130),
                              10: FixedColumnWidth(130),
                            },
                            children: <TableRow>[
                              TableRow(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text('10',
                                        style: TextStyle(
                                            color: greyy,
                                            fontFamily: 'InterRegular')),
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(AppContent.BNB,
                                          height: 30, width: 30),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Binance (BNB)',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'InterRegular',
                                          color: greyy,
                                        ),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      'Market Cap',
                                      style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        color: greyy,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '\$342.24',
                                      style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        color: greyy,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '\$78,670M',
                                      style: TextStyle(
                                          color: greyy,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '+0.22%',
                                      style: TextStyle(
                                          color: Color(0xff7DC066),
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '-4.44',
                                      style: TextStyle(
                                          color: Color(0xff7DC066),
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '+8.66',
                                      style: TextStyle(
                                          color: Color(0xff7DC066),
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '-2.63',
                                      style: TextStyle(
                                          color: Color(0xffE5646C),
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Row(
                                      children: [
                                        InkWell(
                                            onTap: () {},
                                            child: Image.asset(
                                                'assets/photos.png',
                                                scale: 4)),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: Image.asset(
                                            'assets/more.png',
                                            scale: 3,
                                          ),
                                        ),
                                      ],
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
              ],
            ),
          )
        : SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  width: Get.width,
                  decoration: BoxDecoration(
                      color: notifire.getbgcolor11,
                      // color: Colors.red,
                      borderRadius: BorderRadius.circular(12)),
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
                              0: FixedColumnWidth(40),
                              1: FixedColumnWidth(180),
                              2: FixedColumnWidth(150),
                              3: FixedColumnWidth(130),
                              4: FixedColumnWidth(140),
                              5: FixedColumnWidth(100),
                              6: FixedColumnWidth(115),
                              7: FixedColumnWidth(110),
                              8: FixedColumnWidth(130),
                              9: FixedColumnWidth(130),
                              10: FixedColumnWidth(130),
                            },
                            children: <TableRow>[
                              TableRow(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text('1',
                                        style: TextStyle(
                                            color: greyy,
                                            fontFamily: 'InterRegular')),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
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
                                  Row(
                                    children: [
                                      Image.asset(AppContent.Bitcoin,
                                          height: 30, width: 30),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Bitcoin (BTC)',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'InterRegular',
                                          color: greyy,
                                        ),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      'Market Cap',
                                      style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        color: greyy,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '\$162.24',
                                      style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        color: greyy,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '\$95,630M',
                                      style: TextStyle(
                                          color: greyy,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '+0.32%',
                                      style: TextStyle(
                                          color: Color(0xff7DC066),
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '-2.44',
                                      style: TextStyle(
                                          color: Color(0xffE5646C),
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '+0.33',
                                      style: TextStyle(
                                          color: Color(0xff7DC066),
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '-0.23',
                                      style: TextStyle(
                                          color: Color(0xffE5646C),
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Row(
                                      children: [
                                        InkWell(
                                            onTap: () {},
                                            child: Image.asset(
                                                'assets/photos.png',
                                                scale: 4)),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: Image.asset(
                                            'assets/more.png',
                                            scale: 3,
                                          ),
                                        ),
                                      ],
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
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  width: Get.width,
                  decoration: BoxDecoration(
                      color: notifire.getbgcolor11,
                      // color: Colors.red,
                      borderRadius: BorderRadius.circular(12)),
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
                              0: FixedColumnWidth(40),
                              1: FixedColumnWidth(180),
                              2: FixedColumnWidth(150),
                              3: FixedColumnWidth(130),
                              4: FixedColumnWidth(140),
                              5: FixedColumnWidth(100),
                              6: FixedColumnWidth(115),
                              7: FixedColumnWidth(110),
                              8: FixedColumnWidth(130),
                              9: FixedColumnWidth(130),
                              10: FixedColumnWidth(130),
                            },
                            children: <TableRow>[
                              TableRow(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text('2',
                                        style: TextStyle(
                                            color: greyy,
                                            fontFamily: 'InterRegular')),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Row(
                                      children: [
                                        Text(
                                          '20 Sep 2022',
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
                                          '1:09 am',
                                          style: TextStyle(
                                              color: Color(0xff9DA2A7),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'InterRegular'),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(AppContent.Ethereum,
                                          height: 30, width: 30),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Ethereum (ETH)',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'InterRegular',
                                          color: greyy,
                                        ),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      'Market Cap',
                                      style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        color: greyy,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '\$342.24',
                                      style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        color: greyy,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '\$25,340M',
                                      style: TextStyle(
                                          color: greyy,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '+0.22%',
                                      style: TextStyle(
                                          color: Color(0xff7DC066),
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '-4.44',
                                      style: TextStyle(
                                          color: Color(0xffE5646C),
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '+3.33',
                                      style: TextStyle(
                                          color: Color(0xffE5646C),
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      '-8.23',
                                      style: TextStyle(
                                          color: Color(0xffE5646C),
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Row(
                                      children: [
                                        InkWell(
                                            onTap: () {},
                                            child: Image.asset(
                                                'assets/photos.png',
                                                scale: 4)),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: Image.asset(
                                            'assets/more.png',
                                            scale: 3,
                                          ),
                                        ),
                                      ],
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
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  width: Get.width,
                  decoration: BoxDecoration(
                      color: notifire.getbgcolor11,
                      // color: Colors.red,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: constraints.maxWidth < 1400 ? 1500 : Get.width,
                        child: Table(
                          border: TableBorder.all(color: Colors.transparent),
                          columnWidths: const <int, TableColumnWidth>{
                            0: FixedColumnWidth(40),
                            1: FixedColumnWidth(180),
                            2: FixedColumnWidth(150),
                            3: FixedColumnWidth(130),
                            4: FixedColumnWidth(140),
                            5: FixedColumnWidth(100),
                            6: FixedColumnWidth(115),
                            7: FixedColumnWidth(110),
                            8: FixedColumnWidth(130),
                            9: FixedColumnWidth(130),
                            10: FixedColumnWidth(130),
                          },
                          children: <TableRow>[
                            TableRow(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text('3',
                                      style: TextStyle(
                                          color: greyy,
                                          fontFamily: 'InterRegular')),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
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
                                Row(
                                  children: [
                                    Image.asset(AppContent.BNB,
                                        height: 30, width: 30),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Binance (BNB)',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'InterRegular',
                                        color: greyy,
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    'Market Cap',
                                    style: TextStyle(
                                      fontFamily: 'InterRegular',
                                      color: greyy,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    '\$462.24',
                                    style: TextStyle(
                                      fontFamily: 'InterRegular',
                                      color: greyy,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    '\$88,610M',
                                    style: TextStyle(
                                        color: greyy,
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    '+0.32%',
                                    style: TextStyle(
                                        color: Color(0xffE5646C),
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    '-9.44',
                                    style: TextStyle(
                                        color: Color(0xffE5646C),
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    '+1.45',
                                    style: TextStyle(
                                        color: Color(0xff7DC066),
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    '-6.23',
                                    style: TextStyle(
                                        color: Color(0xff7DC066),
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Row(
                                    children: [
                                      InkWell(
                                          onTap: () {},
                                          child: Image.asset(
                                              'assets/photos.png',
                                              scale: 4)),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Image.asset(
                                          'assets/more.png',
                                          scale: 3,
                                        ),
                                      ),
                                    ],
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
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  width: Get.width,
                  decoration: BoxDecoration(
                      color: notifire.getbgcolor11,
                      // color: Colors.red,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: constraints.maxWidth < 1400 ? 1500 : Get.width,
                        child: Table(
                          border: TableBorder.all(color: Colors.transparent),
                          columnWidths: const <int, TableColumnWidth>{
                            0: FixedColumnWidth(40),
                            1: FixedColumnWidth(180),
                            2: FixedColumnWidth(150),
                            3: FixedColumnWidth(130),
                            4: FixedColumnWidth(140),
                            5: FixedColumnWidth(100),
                            6: FixedColumnWidth(115),
                            7: FixedColumnWidth(110),
                            8: FixedColumnWidth(130),
                            9: FixedColumnWidth(130),
                            10: FixedColumnWidth(130),
                          },
                          children: <TableRow>[
                            TableRow(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text('4',
                                      style: TextStyle(
                                          color: greyy,
                                          fontFamily: 'InterRegular')),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Row(
                                    children: [
                                      Text(
                                        '17 Sep 2022',
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
                                        '14:33 am',
                                        style: TextStyle(
                                            color: Color(0xff9DA2A7),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'InterRegular'),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Image.asset(AppContent.Shiba,
                                        height: 30, width: 30),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Shiba Inu (SHIB)',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'InterRegular',
                                        color: greyy,
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    'Market Cap',
                                    style: TextStyle(
                                      fontFamily: 'InterRegular',
                                      color: greyy,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    '\$342.24',
                                    style: TextStyle(
                                      fontFamily: 'InterRegular',
                                      color: greyy,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    '\$78,670M',
                                    style: TextStyle(
                                        color: greyy,
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    '+0.22%',
                                    style: TextStyle(
                                        color: Color(0xff7DC066),
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    '-4.44',
                                    style: TextStyle(
                                        color: Color(0xff7DC066),
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    '+8.66',
                                    style: TextStyle(
                                        color: Color(0xff7DC066),
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    '-2.63',
                                    style: TextStyle(
                                        color: Color(0xffE5646C),
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Row(
                                    children: [
                                      InkWell(
                                          onTap: () {},
                                          child: Image.asset(
                                              'assets/photos.png',
                                              scale: 4)),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Image.asset(
                                          'assets/more.png',
                                          scale: 3,
                                        ),
                                      ),
                                    ],
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
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  width: Get.width,
                  decoration: BoxDecoration(
                      color: notifire.getbgcolor11,
                      // color: Colors.red,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: constraints.maxWidth < 1400 ? 1500 : Get.width,
                        child: Table(
                          border: TableBorder.all(color: Colors.transparent),
                          columnWidths: const <int, TableColumnWidth>{
                            0: FixedColumnWidth(40),
                            1: FixedColumnWidth(180),
                            2: FixedColumnWidth(150),
                            3: FixedColumnWidth(130),
                            4: FixedColumnWidth(140),
                            5: FixedColumnWidth(100),
                            6: FixedColumnWidth(115),
                            7: FixedColumnWidth(110),
                            8: FixedColumnWidth(130),
                            9: FixedColumnWidth(130),
                            10: FixedColumnWidth(130),
                          },
                          children: <TableRow>[
                            TableRow(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text('5',
                                      style: TextStyle(
                                          color: greyy,
                                          fontFamily: 'InterRegular')),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Row(
                                    children: [
                                      Text(
                                        '18 Sep 2022',
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
                                Row(
                                  children: [
                                    Image.asset('assets/Cardano ADA.png',
                                        height: 30, width: 30),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Cardano',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'InterRegular',
                                        color: greyy,
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    'Market Cap',
                                    style: TextStyle(
                                      fontFamily: 'InterRegular',
                                      color: greyy,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    '\$462.24',
                                    style: TextStyle(
                                      fontFamily: 'InterRegular',
                                      color: greyy,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    '\$88,610M',
                                    style: TextStyle(
                                        color: greyy,
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    '+0.32%',
                                    style: TextStyle(
                                        color: Color(0xffE5646C),
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    '-9.44',
                                    style: TextStyle(
                                        color: Color(0xffE5646C),
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    '+1.45',
                                    style: TextStyle(
                                        color: Color(0xff7DC066),
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    '-6.23',
                                    style: TextStyle(
                                        color: Color(0xff7DC066),
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Row(
                                    children: [
                                      InkWell(
                                          onTap: () {},
                                          child: Image.asset(
                                              'assets/photos.png',
                                              scale: 4)),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Image.asset(
                                          'assets/more.png',
                                          scale: 3,
                                        ),
                                      ),
                                    ],
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
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  width: Get.width,
                  decoration: BoxDecoration(
                      color: notifire.getbgcolor11,
                      // color: Colors.red,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: constraints.maxWidth < 1400 ? 1500 : Get.width,
                        child: Table(
                          border: TableBorder.all(color: Colors.transparent),
                          columnWidths: const <int, TableColumnWidth>{
                            0: FixedColumnWidth(40),
                            1: FixedColumnWidth(180),
                            2: FixedColumnWidth(150),
                            3: FixedColumnWidth(130),
                            4: FixedColumnWidth(140),
                            5: FixedColumnWidth(100),
                            6: FixedColumnWidth(115),
                            7: FixedColumnWidth(110),
                            8: FixedColumnWidth(130),
                            9: FixedColumnWidth(130),
                            10: FixedColumnWidth(130),
                          },
                          children: <TableRow>[
                            TableRow(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text('6',
                                      style: TextStyle(
                                          color: greyy,
                                          fontFamily: 'InterRegular')),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Row(
                                    children: [
                                      Text(
                                        '17 Sep 2022',
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
                                        '14:33 am',
                                        style: TextStyle(
                                            color: Color(0xff9DA2A7),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'InterRegular'),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Image.asset('assets/Zcash.png',
                                        height: 30, width: 30),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Zcash',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'InterRegular',
                                        color: greyy,
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    'Market Cap',
                                    style: TextStyle(
                                      fontFamily: 'InterRegular',
                                      color: greyy,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    '\$342.24',
                                    style: TextStyle(
                                      fontFamily: 'InterRegular',
                                      color: greyy,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    '\$78,670M',
                                    style: TextStyle(
                                        color: greyy,
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    '+0.22%',
                                    style: TextStyle(
                                        color: Color(0xff7DC066),
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    '-4.44',
                                    style: TextStyle(
                                        color: Color(0xff7DC066),
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    '+8.66',
                                    style: TextStyle(
                                        color: Color(0xff7DC066),
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    '-2.63',
                                    style: TextStyle(
                                        color: Color(0xffE5646C),
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Row(
                                    children: [
                                      InkWell(
                                          onTap: () {},
                                          child: Image.asset(
                                              'assets/photos.png',
                                              scale: 4)),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Image.asset(
                                          'assets/more.png',
                                          scale: 3,
                                        ),
                                      ),
                                    ],
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
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  width: Get.width,
                  decoration: BoxDecoration(
                      color: notifire.getbgcolor11,
                      // color: Colors.red,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: constraints.maxWidth < 1400 ? 1500 : Get.width,
                        child: Table(
                          border: TableBorder.all(color: Colors.transparent),
                          columnWidths: const <int, TableColumnWidth>{
                            0: FixedColumnWidth(40),
                            1: FixedColumnWidth(180),
                            2: FixedColumnWidth(150),
                            3: FixedColumnWidth(130),
                            4: FixedColumnWidth(140),
                            5: FixedColumnWidth(100),
                            6: FixedColumnWidth(115),
                            7: FixedColumnWidth(110),
                            8: FixedColumnWidth(130),
                            9: FixedColumnWidth(130),
                            10: FixedColumnWidth(130),
                          },
                          children: <TableRow>[
                            TableRow(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text('7',
                                      style: TextStyle(
                                          color: greyy,
                                          fontFamily: 'InterRegular')),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
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
                                Row(
                                  children: [
                                    Image.asset('assets/eCash.png',
                                        height: 30, width: 30),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'eCash',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'InterRegular',
                                        color: greyy,
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    'Market Cap',
                                    style: TextStyle(
                                      fontFamily: 'InterRegular',
                                      color: greyy,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    '\$162.24',
                                    style: TextStyle(
                                      fontFamily: 'InterRegular',
                                      color: greyy,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    '\$95,630M',
                                    style: TextStyle(
                                        color: greyy,
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    '+0.32%',
                                    style: TextStyle(
                                        color: Color(0xff7DC066),
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    '-2.44',
                                    style: TextStyle(
                                        color: Color(0xffE5646C),
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    '+0.33',
                                    style: TextStyle(
                                        color: Color(0xff7DC066),
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    '-0.23',
                                    style: TextStyle(
                                        color: Color(0xffE5646C),
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Row(
                                    children: [
                                      InkWell(
                                          onTap: () {},
                                          child: Image.asset(
                                              'assets/photos.png',
                                              scale: 4)),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Image.asset(
                                          'assets/more.png',
                                          scale: 3,
                                        ),
                                      ),
                                    ],
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
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  width: Get.width,
                  decoration: BoxDecoration(
                      color: notifire.getbgcolor11,
                      // color: Colors.red,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: constraints.maxWidth < 1400 ? 1500 : Get.width,
                        child: Table(
                          border: TableBorder.all(color: Colors.transparent),
                          columnWidths: const <int, TableColumnWidth>{
                            0: FixedColumnWidth(40),
                            1: FixedColumnWidth(180),
                            2: FixedColumnWidth(150),
                            3: FixedColumnWidth(130),
                            4: FixedColumnWidth(140),
                            5: FixedColumnWidth(100),
                            6: FixedColumnWidth(115),
                            7: FixedColumnWidth(110),
                            8: FixedColumnWidth(130),
                            9: FixedColumnWidth(130),
                            10: FixedColumnWidth(130),
                          },
                          children: <TableRow>[
                            TableRow(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text('8',
                                      style: TextStyle(
                                          color: greyy,
                                          fontFamily: 'InterRegular')),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Row(
                                    children: [
                                      Text(
                                        '20 Sep 2022',
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
                                        '1:09 am',
                                        style: TextStyle(
                                            color: Color(0xff9DA2A7),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'InterRegular'),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Image.asset('assets/Eos.png',
                                        height: 30, width: 30),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Eos',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'InterRegular',
                                        color: greyy,
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    'Market Cap',
                                    style: TextStyle(
                                      fontFamily: 'InterRegular',
                                      color: greyy,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    '\$342.24',
                                    style: TextStyle(
                                      fontFamily: 'InterRegular',
                                      color: greyy,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    '\$25,340M',
                                    style: TextStyle(
                                        color: greyy,
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    '+0.22%',
                                    style: TextStyle(
                                        color: Color(0xff7DC066),
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    '-4.44',
                                    style: TextStyle(
                                        color: Color(0xffE5646C),
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    '+3.33',
                                    style: TextStyle(
                                        color: Color(0xffE5646C),
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    '-8.23',
                                    style: TextStyle(
                                        color: Color(0xffE5646C),
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Row(
                                    children: [
                                      InkWell(
                                          onTap: () {},
                                          child: Image.asset(
                                              'assets/photos.png',
                                              scale: 4)),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Image.asset(
                                          'assets/more.png',
                                          scale: 3,
                                        ),
                                      ),
                                    ],
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
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  width: Get.width,
                  decoration: BoxDecoration(
                      color: notifire.getbgcolor11,
                      // color: Colors.red,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: constraints.maxWidth < 1400 ? 1500 : Get.width,
                        child: Table(
                          border: TableBorder.all(color: Colors.transparent),
                          columnWidths: const <int, TableColumnWidth>{
                            0: FixedColumnWidth(40),
                            1: FixedColumnWidth(180),
                            2: FixedColumnWidth(150),
                            3: FixedColumnWidth(130),
                            4: FixedColumnWidth(140),
                            5: FixedColumnWidth(100),
                            6: FixedColumnWidth(115),
                            7: FixedColumnWidth(110),
                            8: FixedColumnWidth(130),
                            9: FixedColumnWidth(130),
                            10: FixedColumnWidth(130),
                          },
                          children: <TableRow>[
                            TableRow(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text('9',
                                      style: TextStyle(
                                          color: greyy,
                                          fontFamily: 'InterRegular')),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
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
                                Row(
                                  children: [
                                    Image.asset('assets/Litecoin LTC.png',
                                        height: 30, width: 30),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Litecoin LTC',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'InterRegular',
                                        color: greyy,
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    'Market Cap',
                                    style: TextStyle(
                                      fontFamily: 'InterRegular',
                                      color: greyy,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    '\$462.24',
                                    style: TextStyle(
                                      fontFamily: 'InterRegular',
                                      color: greyy,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    '\$88,610M',
                                    style: TextStyle(
                                        color: greyy,
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    '+0.32%',
                                    style: TextStyle(
                                        color: Color(0xffE5646C),
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    '-9.44',
                                    style: TextStyle(
                                        color: Color(0xffE5646C),
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    '+1.45',
                                    style: TextStyle(
                                        color: Color(0xff7DC066),
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    '-6.23',
                                    style: TextStyle(
                                        color: Color(0xff7DC066),
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Row(
                                    children: [
                                      InkWell(
                                          onTap: () {},
                                          child: Image.asset(
                                              'assets/photos.png',
                                              scale: 4)),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Image.asset(
                                          'assets/more.png',
                                          scale: 3,
                                        ),
                                      ),
                                    ],
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
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  width: Get.width,
                  decoration: BoxDecoration(
                      color: notifire.getbgcolor11,
                      // color: Colors.red,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: constraints.maxWidth < 1400 ? 1500 : Get.width,
                        child: Table(
                          border: TableBorder.all(color: Colors.transparent),
                          columnWidths: const <int, TableColumnWidth>{
                            0: FixedColumnWidth(40),
                            1: FixedColumnWidth(180),
                            2: FixedColumnWidth(150),
                            3: FixedColumnWidth(130),
                            4: FixedColumnWidth(140),
                            5: FixedColumnWidth(100),
                            6: FixedColumnWidth(115),
                            7: FixedColumnWidth(110),
                            8: FixedColumnWidth(130),
                            9: FixedColumnWidth(130),
                            10: FixedColumnWidth(130),
                          },
                          children: <TableRow>[
                            TableRow(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text('10',
                                      style: TextStyle(
                                          color: greyy,
                                          fontFamily: 'InterRegular')),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Row(
                                    children: [
                                      Text(
                                        '17 Sep 2022',
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
                                        '14:33 am',
                                        style: TextStyle(
                                            color: Color(0xff9DA2A7),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'InterRegular'),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Image.asset(AppContent.BNB,
                                        height: 30, width: 30),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Binance (BNB)',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'InterRegular',
                                        color: greyy,
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    'Market Cap',
                                    style: TextStyle(
                                      fontFamily: 'InterRegular',
                                      color: greyy,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    '\$342.24',
                                    style: TextStyle(
                                      fontFamily: 'InterRegular',
                                      color: greyy,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    '\$78,670M',
                                    style: TextStyle(
                                        color: greyy,
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    '+0.22%',
                                    style: TextStyle(
                                        color: Color(0xff7DC066),
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    '-4.44',
                                    style: TextStyle(
                                        color: Color(0xff7DC066),
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    '+8.66',
                                    style: TextStyle(
                                        color: Color(0xff7DC066),
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    '-2.63',
                                    style: TextStyle(
                                        color: Color(0xffE5646C),
                                        fontFamily: 'InterRegular'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Row(
                                    children: [
                                      InkWell(
                                          onTap: () {},
                                          child: Image.asset(
                                              'assets/photos.png',
                                              scale: 4)),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Image.asset(
                                          'assets/more.png',
                                          scale: 3,
                                        ),
                                      ),
                                    ],
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
              ],
            ),
          );
  }
}
