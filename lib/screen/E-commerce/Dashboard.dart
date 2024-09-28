// ignore_for_file: deprecated_member_use, file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:evcp/controller/page_controller.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../confing/Rtl.dart';
import '../../confing/colors.dart';

import '../../confing/list.dart';
import '../../confing/notifier.dart';
import '../Dashboard/Dashboard_main.dart';

import '../login/login.dart';
class Dashboardpro extends StatefulWidget {
  const Dashboardpro({super.key});

  @override
  State<Dashboardpro> createState() => _DashboardproState();
}

class _DashboardproState extends State<Dashboardpro> {
  bool isdark = false;

  late ColorNotifier notifire;

  SampleItem? selectedMenu;
  DateTime selectedDate = DateTime.now();
  InboxController inboxController = Get.put(InboxController());
  TextEditingController dateController = TextEditingController();

  DateRangePickerController dateSelecter = DateRangePickerController();
  TextEditingController dateController1 = TextEditingController();

  DateTime selectedDate1 = DateTime.now();

  void buildDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          alignment: Alignment.topRight,
          surfaceTintColor: Colors.transparent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            height: 300,
            width: 500,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: SfDateRangePicker(
                controller: dateSelecter,
                enableMultiView: true,
                monthCellStyle: DateRangePickerMonthCellStyle(
                  todayCellDecoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  textStyle: const TextStyle(
                    fontFamily: 'gilroymed',
                    fontSize: 14,
                  ),
                  blackoutDateTextStyle: const TextStyle(
                    fontFamily: 'gilroymed',
                    fontSize: 14,
                  ),
                  todayTextStyle: TextStyle(
                    fontFamily: 'gilroymed',
                    fontSize: 14,
                    color: blue,
                  ),
                ),
                monthViewSettings: const DateRangePickerMonthViewSettings(
                  viewHeaderStyle: DateRangePickerViewHeaderStyle(
                    textStyle: TextStyle(fontFamily: 'gilroymed', fontSize: 14),
                  ),
                ),
                onSelectionChanged: _onselectionChanged,
                backgroundColor: Colors.white,
                view: DateRangePickerView.month,
                startRangeSelectionColor: blue,
                endRangeSelectionColor: blue,
                rangeSelectionColor: grey2,
                selectionColor: blue,
                selectionRadius: 50,
                viewSpacing: 30,
                selectionTextStyle:
                    const TextStyle(fontFamily: 'gilroymed', fontSize: 14),
                headerStyle: const DateRangePickerHeaderStyle(
                  textStyle: TextStyle(fontFamily: 'gilroysemi', fontSize: 18),
                ),
                selectionMode: DateRangePickerSelectionMode.range,
                rangeTextStyle:
                    const TextStyle(fontFamily: 'gilroymed', fontSize: 14),
              ),
            ),
          ),
        );
      },
    );
  }

  void _onselectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is PickerDateRange) {
    } else if (args.value is DateTime) {
    } else if (args.value is List<DateTime>) {
    } else {}
  }

  String dropdownvalue = 'All Date';

  bool profilePage = false;

  var selectedPageNumber = 4;
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifier>(context, listen: true);
    return LayoutBuilder(
      builder: (context, raints) {
        if (raints.maxWidth < 700) {
          return Container(
            color: notifire.getbgcolor10,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        screen(raints.maxWidth),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        } else if (raints.maxWidth < 1000) {
          return Container(
            decoration: BoxDecoration(color: notifire.getbgcolor10),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    screen(raints.maxWidth),
                  ],
                ),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          firstContainer(
                              context: context, raints: raints.maxWidth),
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

  Widget firstContainer({context, raints}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
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
                'E-commerce',
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
                'Dashboard',
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(flex: 5, child: screen(raints)),
              const SizedBox(
                width: 20,
              ),
              Expanded(flex: 2, child: container4(raints)),
            ],
          ),
        ],
      ),
    );
  }

  Widget screen(raints) {
    return raints < 600
        ? SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                      'E-commerce',
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
                      'Dashboard',
                      style: TextStyle(
                          color: notifire.getblackcolor,
                          fontSize: 14,
                          fontFamily: 'InterRegular'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return container4(raints);
                          },
                        ));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: notifire.getbgcolor11,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset('assets/box.svg',
                                color: notifire.getblackcolor, height: 24),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '5,600',
                                  style: TextStyle(
                                      fontFamily: 'InterRegular',
                                      fontSize: 18,
                                      color: notifire.getblackcolor,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Total Products',
                              style: TextStyle(
                                  fontFamily: 'InterRegular',
                                  fontSize: 12,
                                  color: Color(0xff727880)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: notifire.getbgcolor11,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset('assets/house.svg',
                              color: notifire.getblackcolor, height: 24),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '2,500',
                                style: TextStyle(
                                    fontFamily: 'InterRegular',
                                    fontSize: 18,
                                    color: notifire.getblackcolor,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: const Color(0xffF8BEC1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Center(
                                    child: Text(
                                  '12.3%',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 10,
                                      fontFamily: 'InterRegular'
                                          '+'),
                                )),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Available Stocks',
                            style: TextStyle(
                                fontFamily: 'InterRegular',
                                fontSize: 12,
                                color: Color(0xff727880)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: notifire.getbgcolor11,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset('assets/shopping-cart.svg',
                              color: notifire.getblackcolor, height: 24),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '600',
                                style: TextStyle(
                                    fontFamily: 'InterRegular',
                                    fontSize: 18,
                                    color: notifire.getblackcolor,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: const Color(0xffB0E4C8),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Center(
                                    child: Text(
                                  '23.1%',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'InterRegular'
                                          '+'),
                                )),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Orders',
                            style: TextStyle(
                                fontFamily: 'InterRegular',
                                fontSize: 12,
                                color: Color(0xff727880)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: notifire.getbgcolor11,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset('assets/dollar-circle.svg',
                              color: notifire.getblackcolor, height: 24),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '\$240.34',
                                style: TextStyle(
                                    fontFamily: 'InterRegular',
                                    fontSize: 18,
                                    color: notifire.getblackcolor,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Price',
                            style: TextStyle(
                                fontFamily: 'InterRegular',
                                fontSize: 12,
                                color: Color(0xff727880)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: notifire.getbgcolor11,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset('assets/wallet-2.svg',
                              color: notifire.getblackcolor, height: 24),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '15,600.45',
                                style: TextStyle(
                                    fontFamily: 'InterRegular',
                                    fontSize: 18,
                                    color: notifire.getblackcolor,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Total Revenue',
                            style: TextStyle(
                                fontFamily: 'InterRegular',
                                fontSize: 12,
                                color: Color(0xff727880)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                     
                      decoration: BoxDecoration(
                          color: notifire.getbgcolor11,
                          borderRadius: BorderRadius.circular(15)),
                   
                        child: Padding(
                          padding: const EdgeInsets.all(20),
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
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular',
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: SizedBox(
                                  // width: raints.maxWidth < 1400 ? 1500 : Get.width,
                                  child: Table(
                                    border: TableBorder.all(
                                        color: Colors.transparent),
                                    columnWidths: const <int, TableColumnWidth>{
                                      0: FixedColumnWidth(200),
                                      1: FixedColumnWidth(140),
                                      2: FixedColumnWidth(120),
                                      3: FixedColumnWidth(70),
                                    },
                                    children: <TableRow>[
                                      TableRow(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '11 Sep 2022 10:09 am',
                                                  style: TextStyle(
                                                    fontFamily: 'InterRegular',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color:
                                                        notifire.getblackcolor,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                const Text(
                                                  '#ODSP008',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily:
                                                          'InterRegular',
                                                      color: Color(0xff727880)),
                                                )
                                              ],
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(top: 25),
                                            child: Text(
                                              'Delivered',
                                              style: TextStyle(
                                                  fontFamily: 'InterRegular',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  color: Color(0xff7DC066)),
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
                                                  top: 25, left: 3),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text('\$475.2',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'InterRegular',
                                                          color: notifire
                                                              .getblackcolor,
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  const Text('x 1',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Color(
                                                              0xff727880))),
                                                ],
                                              )),
                                        ],
                                      ),
                                      dividerTable(context, raints),
                                      TableRow(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '11 Sep 2022 10:09 am',
                                                  style: TextStyle(
                                                    fontFamily: 'InterRegular',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color:
                                                        notifire.getblackcolor,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                const Text(
                                                  '#ODSP008',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily:
                                                          'InterRegular',
                                                      color: Color(0xff727880)),
                                                )
                                              ],
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(top: 25),
                                            child: Text(
                                              'Delivered',
                                              style: TextStyle(
                                                  fontFamily: 'InterRegular',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  color: Color(0xff7DC066)),
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
                                                  top: 25, left: 3),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text('\$475.2',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'InterRegular',
                                                          color: notifire
                                                              .getblackcolor,
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  const Text('x 1',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Color(
                                                              0xff727880))),
                                                ],
                                              )),
                                        ],
                                      ),
                                      dividerTable(context, raints),
                                      TableRow(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '11 Sep 2022 10:09 am',
                                                  style: TextStyle(
                                                    fontFamily: 'InterRegular',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color:
                                                        notifire.getblackcolor,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                const Text(
                                                  '#ODSP008',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily:
                                                          'InterRegular',
                                                      color: Color(0xff727880)),
                                                )
                                              ],
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(top: 25),
                                            child: Text(
                                              'In Progress',
                                              style: TextStyle(
                                                  fontFamily: 'InterRegular',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  color: Color(0xff7DC066)),
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
                                                  top: 25, left: 3),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text('\$475.2',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'InterRegular',
                                                          color: notifire
                                                              .getblackcolor,
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  const Text('x 3',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Color(
                                                              0xff727880))),
                                                ],
                                              )),
                                        ],
                                      ),
                                      dividerTable(context, raints),
                                      TableRow(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '11 Sep 2022 10:09 am',
                                                  style: TextStyle(
                                                    fontFamily: 'InterRegular',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color:
                                                        notifire.getblackcolor,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                const Text(
                                                  '#ODSP008',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily:
                                                          'InterRegular',
                                                      color: Color(0xff727880)),
                                                )
                                              ],
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(top: 25),
                                            child: Text(
                                              'In Progress',
                                              style: TextStyle(
                                                  fontFamily: 'InterRegular',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  color: Color(0xff59B4D1)),
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
                                                  top: 25, left: 3),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text('\$475.2',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'InterRegular',
                                                          color: notifire
                                                              .getblackcolor,
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  const Text('x 1',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Color(
                                                              0xff727880))),
                                                ],
                                              )),
                                        ],
                                      ),
                                      dividerTable(context, raints),
                                      TableRow(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '11 Sep 2022 10:09 am',
                                                  style: TextStyle(
                                                    fontFamily: 'InterRegular',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color:
                                                        notifire.getblackcolor,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                const Text(
                                                  '#ODSP008',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily:
                                                          'InterRegular',
                                                      color: Color(0xff727880)),
                                                )
                                              ],
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(top: 25),
                                            child: Text(
                                              'In Progress',
                                              style: TextStyle(
                                                  fontFamily: 'InterRegular',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  color: Color(0xff59B4D1)),
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
                                                  top: 25, left: 3),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text('\$475.2',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'InterRegular',
                                                          color: notifire
                                                              .getblackcolor,
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  const Text('x 5',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Color(
                                                              0xff727880))),
                                                ],
                                              )),
                                        ],
                                      ),
                                      dividerTable(context, raints),
                                      TableRow(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '11 Sep 2022 10:09 am',
                                                  style: TextStyle(
                                                    fontFamily: 'InterRegular',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color:
                                                        notifire.getblackcolor,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                const Text(
                                                  '#ODSP008',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily:
                                                          'InterRegular',
                                                      color: Color(0xff727880)),
                                                )
                                              ],
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(top: 25),
                                            child: Text(
                                              'Returns',
                                              style: TextStyle(
                                                  fontFamily: 'InterRegular',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  color: Color(0xffE5646C)),
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
                                                  top: 25, left: 3),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text('\$475.2',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'InterRegular',
                                                          color: notifire
                                                              .getblackcolor,
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  const Text('x 2',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Color(
                                                              0xff727880))),
                                                ],
                                              )),
                                        ],
                                      ),
                                      dividerTable(context, raints),
                                      TableRow(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '11 Sep 2022 10:09 am',
                                                  style: TextStyle(
                                                    fontFamily: 'InterRegular',
                                                    fontWeight: FontWeight.w500,
                                                    color:
                                                        notifire.getblackcolor,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                const Text(
                                                  '#ODSP008',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily:
                                                          'InterRegular',
                                                      color: Color(0xff727880)),
                                                )
                                              ],
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(top: 25),
                                            child: Text(
                                              'Returns',
                                              style: TextStyle(
                                                  fontFamily: 'InterRegular',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  color: Color(0xffE5646C)),
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
                                                  top: 25, left: 3),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text('\$475.2',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'InterRegular',
                                                          color: notifire
                                                              .getblackcolor,
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  const Text('x 2',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Color(
                                                              0xff727880))),
                                                ],
                                              )),
                                        ],
                                      ),
                                      dividerTable(context, raints),
                                      TableRow(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '11 Sep 2022 10:09 am',
                                                  style: TextStyle(
                                                    fontFamily: 'InterRegular',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color:
                                                        notifire.getblackcolor,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                const Text(
                                                  '#ODSP008',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily:
                                                          'InterRegular',
                                                      color: Color(0xff727880)),
                                                )
                                              ],
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(top: 25),
                                            child: Text(
                                              'Delivered',
                                              style: TextStyle(
                                                  fontFamily: 'InterRegular',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  color: Color(0xff7DC066)),
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
                                                  top: 25, left: 3),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text('\$475.2',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'InterRegular',
                                                          color: notifire
                                                              .getblackcolor,
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  const Text('x 1',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Color(
                                                              0xff727880))),
                                                ],
                                              )),
                                        ],
                                      ),
                                      dividerTable(context, raints),
                                      TableRow(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '11 Sep 2022 10:09 am',
                                                  style: TextStyle(
                                                    fontFamily: 'InterRegular',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color:
                                                        notifire.getblackcolor,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                const Text(
                                                  '#ODSP008',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily:
                                                          'InterRegular',
                                                      color: Color(0xff727880)),
                                                )
                                              ],
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(top: 25),
                                            child: Text(
                                              'In Progress',
                                              style: TextStyle(
                                                  fontFamily: 'InterRegular',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  color: Color(0xff7DC066)),
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
                                                  top: 25, left: 3),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text('\$475.2',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'InterRegular',
                                                          color: notifire
                                                              .getblackcolor,
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  const Text('x 3',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Color(
                                                              0xff727880))),
                                                ],
                                              )),
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
                              Transform.translate(
                                offset: const Offset(8, 0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Ratings & Reviews',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular',
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset('assets/star.svg',
                                      height: 20),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text('4.5',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular',
                                          fontWeight: FontWeight.w600)),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text('5',
                                          style: TextStyle(
                                              color: notifire.getblackcolor,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'InterRegular')),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const StepProgressIndicator(
                                        totalSteps: 100,
                                        currentStep: 100,
                                        size: 5,
                                        padding: 0,
                                        selectedColor: Color(0xffF3935D),
                                        roundedEdges: Radius.circular(12),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Text('1,346,788',
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              color: Color(0xff727880))),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    children: [
                                      Text('4',
                                          style: TextStyle(
                                              color: notifire.getblackcolor,
                                              fontFamily: 'InterRegular',
                                              fontWeight: FontWeight.w600)),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const StepProgressIndicator(
                                        totalSteps: 100,
                                        currentStep: 80,
                                        size: 5,
                                        padding: 0,
                                        unselectedColor: Color(0xffEEEEEE),
                                        selectedColor: Color(0xffF3935D),
                                        roundedEdges: Radius.circular(10),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Text('  1,34,788',
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              color: Color(0xff727880))),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    children: [
                                      Text('3',
                                          style: TextStyle(
                                              color: notifire.getblackcolor,
                                              fontFamily: 'InterRegular',
                                              fontWeight: FontWeight.w600)),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const StepProgressIndicator(
                                        totalSteps: 100,
                                        currentStep: 60,
                                        size: 5,
                                        padding: 0,
                                        unselectedColor: Color(0xffEEEEEE),
                                        selectedColor: Color(0xffF3935D),
                                        roundedEdges: Radius.circular(10),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Text('      4,688',
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              color: Color(0xff727880))),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    children: [
                                      Text('2',
                                          style: TextStyle(
                                              color: notifire.getblackcolor,
                                              fontFamily: 'InterRegular',
                                              fontWeight: FontWeight.w600)),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const StepProgressIndicator(
                                        totalSteps: 100,
                                        currentStep: 30,
                                        size: 5,
                                        padding: 0,
                                        unselectedColor: Color(0xffEEEEEE),
                                        selectedColor: Color(0xffF3935D),
                                        roundedEdges: Radius.circular(10),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Text('      6,788',
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              color: Color(0xff727880))),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    children: [
                                      Text('1 ',
                                          style: TextStyle(
                                              color: notifire.getblackcolor,
                                              fontFamily: 'InterRegular',
                                              fontWeight: FontWeight.w600)),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const StepProgressIndicator(
                                        totalSteps: 100,
                                        currentStep: 10,
                                        size: 5,
                                        padding: 0,
                                        unselectedColor: Color(0xffEEEEEE),
                                        selectedColor: Color(0xffF3935D),
                                        roundedEdges: Radius.circular(10),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Text('      3,788',
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              color: Color(0xff727880))),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    'assets/avatar-6 1.png',
                                    height: 40,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Savannah Nguyen',
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              color: Color(0xff727880),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'It is a long established fact that a reader will be distracted by the readable content. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using  making it look like readable English. ',
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              color: notifire.getblackcolor,
                                              fontSize: 14),
                                        )
                                      ],
                                    ),
                                  ),
                                  const Text(
                                    '1 hour ago',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff9DA2A7),
                                      fontFamily: 'InterRegular',
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  SvgPicture.asset('assets/star.svg',
                                      height: 14),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  const Text(
                                    '4',
                                    style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        color: Color(0xff727880),
                                        fontSize: 12),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Divider(
                                height: 1,
                                color: notifire.getgrey1,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    'assets/avatar-7 1.png',
                                    height: 40,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Ralph Edwards',
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              color: Color(0xff727880),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which',
                                          style: TextStyle(
                                              color: notifire.getblackcolor,
                                              fontFamily: 'InterRegular',
                                              fontSize: 14),
                                        )
                                      ],
                                    ),
                                  ),
                                  const Text(
                                    '1 hour ago',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff9DA2A7),
                                      fontFamily: 'InterRegular',
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  SvgPicture.asset('assets/star.svg',
                                      height: 14),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  const Text(
                                    '4',
                                    style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        color: Color(0xff727880),
                                        fontSize: 12),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Divider(
                                height: 1,
                                color: notifire.getgrey1,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    'assets/avatar-8 1.png',
                                    height: 40,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Ralph Edwards',
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              color: Color(0xff727880),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which',
                                          style: TextStyle(
                                              color: notifire.getblackcolor,
                                              fontFamily: 'InterRegular',
                                              fontSize: 14),
                                        )
                                      ],
                                    ),
                                  ),
                                  const Text(
                                    '1 hour ago',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff9DA2A7),
                                      fontFamily: 'InterRegular',
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  SvgPicture.asset('assets/star.svg',
                                      height: 14),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  const Text(
                                    '4',
                                    style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        color: Color(0xff727880),
                                        fontSize: 12),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Divider(
                                height: 1,
                                color: notifire.getgrey1,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    'assets/avatar-7 1.png',
                                    height: 40,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Ralph Edwards',
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              color: Color(0xff727880),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour',
                                          style: TextStyle(
                                              color: notifire.getblackcolor,
                                              fontFamily: 'InterRegular',
                                              fontSize: 14),
                                        )
                                      ],
                                    ),
                                  ),
                                  const Text(
                                    '1 hour ago',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff9DA2A7),
                                      fontFamily: 'InterRegular',
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  SvgPicture.asset('assets/star.svg',
                                      height: 14),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  const Text(
                                    '4',
                                    style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        color: Color(0xff727880),
                                        fontSize: 12),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Divider(
                                height: 1,
                                color: notifire.getgrey1,
                              ),
                            ],
                          ),
                        ),
                     
                    )
                  ],
                )
              ],
            ),
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.height * 0.2,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        width: Get.width * 0.11,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: notifire.getbgcolor11,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset('assets/box.svg',
                                color: notifire.getblackcolor, height: 24),
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '5,600',
                                  style: TextStyle(
                                      fontFamily: 'InterRegular',
                                      fontSize: 18,
                                      color: notifire.getblackcolor,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            const Text(
                              'Total Products',
                              style: TextStyle(
                                  fontFamily: 'InterRegular',
                                  fontSize: 12,
                                  color: Color(0xff727880)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        width: Get.width * 0.11,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: notifire.getbgcolor11,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset('assets/house.svg',
                                color: notifire.getblackcolor, height: 24),
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '2,500',
                                  style: TextStyle(
                                      fontFamily: 'InterRegular',
                                      fontSize: 18,
                                      color: notifire.getblackcolor,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: const Color(0xffF8BEC1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Center(
                                      child: Text(
                                    '12.3%',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10,
                                        fontFamily: 'InterRegular'
                                            '+'),
                                  )),
                                )
                              ],
                            ),
                            const Text(
                              'Available Stocks',
                              style: TextStyle(
                                  fontFamily: 'InterRegular',
                                  fontSize: 12,
                                  color: Color(0xff727880)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        width: Get.width * 0.11,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: notifire.getbgcolor11,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset('assets/shopping-cart.svg',
                                color: notifire.getblackcolor, height: 24),
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '600',
                                  style: TextStyle(
                                      fontFamily: 'InterRegular',
                                      fontSize: 18,
                                      color: notifire.getblackcolor,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: const Color(0xffB0E4C8),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Center(
                                      child: Text(
                                    '23.1%',
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'InterRegular'
                                            '+'),
                                  )),
                                )
                              ],
                            ),
                            const Text(
                              'Orders',
                              style: TextStyle(
                                  fontFamily: 'InterRegular',
                                  fontSize: 12,
                                  color: Color(0xff727880)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        width: Get.width * 0.11,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: notifire.getbgcolor11,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset('assets/dollar-circle.svg',
                                color: notifire.getblackcolor, height: 24),
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '\$240.34',
                                  style: TextStyle(
                                      fontFamily: 'InterRegular',
                                      fontSize: 18,
                                      color: notifire.getblackcolor,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            const Text(
                              'Price',
                              style: TextStyle(
                                  fontFamily: 'InterRegular',
                                  fontSize: 12,
                                  color: Color(0xff727880)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        width: Get.width * 0.11,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: notifire.getbgcolor11,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset('assets/wallet-2.svg',
                                color: notifire.getblackcolor, height: 24),
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '15,600.45',
                                  style: TextStyle(
                                      fontFamily: 'InterRegular',
                                      fontSize: 18,
                                      color: notifire.getblackcolor,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            const Text(
                              'Total Revenue',
                              style: TextStyle(
                                  fontFamily: 'InterRegular',
                                  fontSize: 12,
                                  color: Color(0xff727880)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      height: Get.height * 0.8,
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
                              Transform.translate(
                                offset: const Offset(8, 0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Latest Orders',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular',
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: SizedBox(
                                  // width: raints.maxWidth < 1400 ? 1500 : Get.width,
                                  child: Table(
                                    border: TableBorder.all(
                                        color: Colors.transparent),
                                    columnWidths: const <int, TableColumnWidth>{
                                      0: FixedColumnWidth(200),
                                      1: FixedColumnWidth(140),
                                      2: FixedColumnWidth(120),
                                      3: FixedColumnWidth(70),
                                    },
                                    children: <TableRow>[
                                      TableRow(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '11 Sep 2022 10:09 am',
                                                  style: TextStyle(
                                                    fontFamily: 'InterRegular',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color:
                                                        notifire.getblackcolor,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                const Text(
                                                  '#ODSP008',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily:
                                                          'InterRegular',
                                                      color: Color(0xff727880)),
                                                )
                                              ],
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(top: 25),
                                            child: Text(
                                              'Delivered',
                                              style: TextStyle(
                                                  fontFamily: 'InterRegular',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  color: Color(0xff7DC066)),
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
                                                  top: 25, left: 3),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text('\$475.2',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'InterRegular',
                                                          color: notifire
                                                              .getblackcolor,
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  const Text('x 1',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Color(
                                                              0xff727880))),
                                                ],
                                              )),
                                        ],
                                      ),
                                      dividerTable(context, raints),
                                      TableRow(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '11 Sep 2022 10:09 am',
                                                  style: TextStyle(
                                                    fontFamily: 'InterRegular',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color:
                                                        notifire.getblackcolor,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                const Text(
                                                  '#ODSP008',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily:
                                                          'InterRegular',
                                                      color: Color(0xff727880)),
                                                )
                                              ],
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(top: 25),
                                            child: Text(
                                              'Delivered',
                                              style: TextStyle(
                                                  fontFamily: 'InterRegular',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  color: Color(0xff7DC066)),
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
                                                  top: 25, left: 3),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text('\$475.2',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'InterRegular',
                                                          color: notifire
                                                              .getblackcolor,
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  const Text('x 1',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Color(
                                                              0xff727880))),
                                                ],
                                              )),
                                        ],
                                      ),
                                      dividerTable(context, raints),
                                      TableRow(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '11 Sep 2022 10:09 am',
                                                  style: TextStyle(
                                                    fontFamily: 'InterRegular',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color:
                                                        notifire.getblackcolor,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                const Text(
                                                  '#ODSP008',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily:
                                                          'InterRegular',
                                                      color: Color(0xff727880)),
                                                )
                                              ],
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(top: 25),
                                            child: Text(
                                              'In Progress',
                                              style: TextStyle(
                                                  fontFamily: 'InterRegular',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  color: Color(0xff7DC066)),
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
                                                  top: 25, left: 3),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text('\$475.2',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'InterRegular',
                                                          color: notifire
                                                              .getblackcolor,
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  const Text('x 3',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Color(
                                                              0xff727880))),
                                                ],
                                              )),
                                        ],
                                      ),
                                      dividerTable(context, raints),
                                      TableRow(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '11 Sep 2022 10:09 am',
                                                  style: TextStyle(
                                                    fontFamily: 'InterRegular',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color:
                                                        notifire.getblackcolor,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                const Text(
                                                  '#ODSP008',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily:
                                                          'InterRegular',
                                                      color: Color(0xff727880)),
                                                )
                                              ],
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(top: 25),
                                            child: Text(
                                              'In Progress',
                                              style: TextStyle(
                                                  fontFamily: 'InterRegular',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  color: Color(0xff59B4D1)),
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
                                                  top: 25, left: 3),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text('\$475.2',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontFamily:
                                                            'InterRegular',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: notifire
                                                            .getblackcolor,
                                                      )),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  const Text('x 1',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Color(
                                                              0xff727880))),
                                                ],
                                              )),
                                        ],
                                      ),
                                      dividerTable(context, raints),
                                      TableRow(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '11 Sep 2022 10:09 am',
                                                  style: TextStyle(
                                                    fontFamily: 'InterRegular',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color:
                                                        notifire.getblackcolor,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                const Text(
                                                  '#ODSP008',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily:
                                                          'InterRegular',
                                                      color: Color(0xff727880)),
                                                )
                                              ],
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(top: 25),
                                            child: Text(
                                              'In Progress',
                                              style: TextStyle(
                                                  fontFamily: 'InterRegular',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  color: Color(0xff59B4D1)),
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
                                                  top: 25, left: 3),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text('\$475.2',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'InterRegular',
                                                          color: notifire
                                                              .getblackcolor,
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  const Text('x 5',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Color(
                                                              0xff727880))),
                                                ],
                                              )),
                                        ],
                                      ),
                                      dividerTable(context, raints),
                                      TableRow(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '11 Sep 2022 10:09 am',
                                                  style: TextStyle(
                                                    fontFamily: 'InterRegular',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color:
                                                        notifire.getblackcolor,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                const Text(
                                                  '#ODSP008',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily:
                                                          'InterRegular',
                                                      color: Color(0xff727880)),
                                                )
                                              ],
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(top: 25),
                                            child: Text(
                                              'Returns',
                                              style: TextStyle(
                                                  fontFamily: 'InterRegular',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  color: Color(0xffE5646C)),
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
                                                  top: 25, left: 3),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text('\$475.2',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color: notifire
                                                              .getblackcolor,
                                                          fontFamily:
                                                              'InterRegular',
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  const Text('x 2',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Color(
                                                              0xff727880))),
                                                ],
                                              )),
                                        ],
                                      ),
                                      dividerTable(context, raints),
                                      TableRow(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '11 Sep 2022 10:09 am',
                                                  style: TextStyle(
                                                    fontFamily: 'InterRegular',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color:
                                                        notifire.getblackcolor,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                const Text(
                                                  '#ODSP008',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily:
                                                          'InterRegular',
                                                      color: Color(0xff727880)),
                                                )
                                              ],
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(top: 25),
                                            child: Text(
                                              'Returns',
                                              style: TextStyle(
                                                  fontFamily: 'InterRegular',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  color: Color(0xffE5646C)),
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
                                                  top: 25, left: 3),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text('\$475.2',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color: notifire
                                                              .getblackcolor,
                                                          fontFamily:
                                                              'InterRegular',
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  const Text('x 2',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Color(
                                                              0xff727880))),
                                                ],
                                              )),
                                        ],
                                      ),
                                      dividerTable(context, raints),
                                      TableRow(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '11 Sep 2022 10:09 am',
                                                  style: TextStyle(
                                                    fontFamily: 'InterRegular',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color:
                                                        notifire.getblackcolor,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                const Text(
                                                  '#ODSP008',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily:
                                                          'InterRegular',
                                                      color: Color(0xff727880)),
                                                )
                                              ],
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(top: 25),
                                            child: Text(
                                              'Delivered',
                                              style: TextStyle(
                                                  fontFamily: 'InterRegular',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  color: Color(0xff7DC066)),
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
                                                  top: 25, left: 3),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text('\$475.2',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'InterRegular',
                                                          color: notifire
                                                              .getblackcolor,
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  const Text('x 1',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Color(
                                                              0xff727880))),
                                                ],
                                              )),
                                        ],
                                      ),
                                      dividerTable(context, raints),
                                      TableRow(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '11 Sep 2022 10:09 am',
                                                  style: TextStyle(
                                                    fontFamily: 'InterRegular',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color:
                                                        notifire.getblackcolor,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                const Text(
                                                  '#ODSP008',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily:
                                                          'InterRegular',
                                                      color: Color(0xff727880)),
                                                )
                                              ],
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(top: 25),
                                            child: Text(
                                              'In Progress',
                                              style: TextStyle(
                                                  fontFamily: 'InterRegular',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  color: Color(0xff7DC066)),
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
                                                  top: 25, left: 3),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text('\$475.2',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'InterRegular',
                                                          color: notifire
                                                              .getblackcolor,
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  const Text('x 3',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Color(
                                                              0xff727880))),
                                                ],
                                              )),
                                        ],
                                      ),
                                      dividerTable(context, raints),
                                      TableRow(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '11 Sep 2022 10:09 am',
                                                  style: TextStyle(
                                                    fontFamily: 'InterRegular',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color:
                                                        notifire.getblackcolor,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                const Text(
                                                  '#ODSP008',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily:
                                                          'InterRegular',
                                                      color: Color(0xff727880)),
                                                )
                                              ],
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(top: 25),
                                            child: Text(
                                              'In Progress',
                                              style: TextStyle(
                                                  fontFamily: 'InterRegular',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  color: Color(0xff59B4D1)),
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
                                                  top: 25, left: 3),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text('\$475.2',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color: notifire
                                                              .getblackcolor,
                                                          fontFamily:
                                                              'InterRegular',
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  const Text('x 1',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Color(
                                                              0xff727880))),
                                                ],
                                              )),
                                        ],
                                      ),
                                      dividerTable(context, raints),
                                      TableRow(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '11 Sep 2022 10:09 am',
                                                  style: TextStyle(
                                                    fontFamily: 'InterRegular',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color:
                                                        notifire.getblackcolor,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                const Text(
                                                  '#ODSP008',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily:
                                                          'InterRegular',
                                                      color: Color(0xff727880)),
                                                )
                                              ],
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(top: 25),
                                            child: Text(
                                              'In Progress',
                                              style: TextStyle(
                                                  fontFamily: 'InterRegular',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  color: Color(0xff59B4D1)),
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
                                                  top: 25, left: 3),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text('\$475.2',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'InterRegular',
                                                          color: notifire
                                                              .getblackcolor,
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  const Text('x 5',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Color(
                                                              0xff727880))),
                                                ],
                                              )),
                                        ],
                                      ),
                                      dividerTable(context, raints),
                                      TableRow(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '11 Sep 2022 10:09 am',
                                                  style: TextStyle(
                                                    fontFamily: 'InterRegular',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color:
                                                        notifire.getblackcolor,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                const Text(
                                                  '#ODSP008',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily:
                                                          'InterRegular',
                                                      color: Color(0xff727880)),
                                                )
                                              ],
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(top: 25),
                                            child: Text(
                                              'Returns',
                                              style: TextStyle(
                                                  fontFamily: 'InterRegular',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  color: Color(0xffE5646C)),
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
                                                  top: 25, left: 3),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text('\$475.2',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'InterRegular',
                                                          color: notifire
                                                              .getblackcolor,
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  const Text('x 2',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Color(
                                                              0xff727880))),
                                                ],
                                              )),
                                        ],
                                      ),
                                      dividerTable(context, raints),
                                      TableRow(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25, left: 8),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '11 Sep 2022 10:09 am',
                                                  style: TextStyle(
                                                    fontFamily: 'InterRegular',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color:
                                                        notifire.getblackcolor,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                const Text(
                                                  '#ODSP008',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily:
                                                          'InterRegular',
                                                      color: Color(0xff727880)),
                                                )
                                              ],
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(top: 25),
                                            child: Text(
                                              'Returns',
                                              style: TextStyle(
                                                  fontFamily: 'InterRegular',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  color: Color(0xffE5646C)),
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
                                                  top: 25, left: 3),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text('\$475.2',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'InterRegular',
                                                          color: notifire
                                                              .getblackcolor,
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  const Text('x 2',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Color(
                                                              0xff727880))),
                                                ],
                                              )),
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
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      height: Get.height * 0.8,
                      decoration: BoxDecoration(
                          color: notifire.getbgcolor11,
                          borderRadius: BorderRadius.circular(15)),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Transform.translate(
                                offset: const Offset(8, 0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Ratings & Reviews',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular',
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset('assets/star.svg',
                                      height: 20),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text('4.5',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular',
                                          fontWeight: FontWeight.w600)),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text('5',
                                          style: TextStyle(
                                              color: notifire.getblackcolor,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'InterRegular')),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const StepProgressIndicator(
                                        totalSteps: 100,
                                        currentStep: 100,
                                        size: 5,
                                        padding: 0,
                                        selectedColor: Color(0xffF3935D),
                                        roundedEdges: Radius.circular(12),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Text('1,346,788',
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              color: Color(0xff727880))),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    children: [
                                      Text('4',
                                          style: TextStyle(
                                              color: notifire.getblackcolor,
                                              fontFamily: 'InterRegular',
                                              fontWeight: FontWeight.w600)),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const StepProgressIndicator(
                                        totalSteps: 100,
                                        currentStep: 80,
                                        size: 5,
                                        padding: 0,
                                        unselectedColor: Color(0xffEEEEEE),
                                        selectedColor: Color(0xffF3935D),
                                        roundedEdges: Radius.circular(10),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Text('  1,34,788',
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              color: Color(0xff727880))),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    children: [
                                      Text('3',
                                          style: TextStyle(
                                              color: notifire.getblackcolor,
                                              fontFamily: 'InterRegular',
                                              fontWeight: FontWeight.w600)),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const StepProgressIndicator(
                                        totalSteps: 100,
                                        currentStep: 60,
                                        size: 5,
                                        padding: 0,
                                        unselectedColor: Color(0xffEEEEEE),
                                        selectedColor: Color(0xffF3935D),
                                        roundedEdges: Radius.circular(10),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Text('      4,688',
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              color: Color(0xff727880))),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    children: [
                                      Text('2',
                                          style: TextStyle(
                                              color: notifire.getblackcolor,
                                              fontFamily: 'InterRegular',
                                              fontWeight: FontWeight.w600)),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const StepProgressIndicator(
                                        totalSteps: 100,
                                        currentStep: 30,
                                        size: 5,
                                        padding: 0,
                                        unselectedColor: Color(0xffEEEEEE),
                                        selectedColor: Color(0xffF3935D),
                                        roundedEdges: Radius.circular(10),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Text('      6,788',
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              color: Color(0xff727880))),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    children: [
                                      Text('1 ',
                                          style: TextStyle(
                                              color: notifire.getblackcolor,
                                              fontFamily: 'InterRegular',
                                              fontWeight: FontWeight.w600)),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const StepProgressIndicator(
                                        totalSteps: 100,
                                        currentStep: 10,
                                        size: 5,
                                        padding: 0,
                                        unselectedColor: Color(0xffEEEEEE),
                                        selectedColor: Color(0xffF3935D),
                                        roundedEdges: Radius.circular(10),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Text('      3,788',
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              color: Color(0xff727880))),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    'assets/avatar-6 1.png',
                                    height: 40,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Savannah Nguyen',
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              color: Color(0xff727880),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'It is a long established fact that a reader will be distracted by the readable content. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using  making it look like readable English. ',
                                          style: TextStyle(
                                              color: notifire.getblackcolor,
                                              fontFamily: 'InterRegular',
                                              fontSize: 14),
                                        )
                                      ],
                                    ),
                                  ),
                                  const Text(
                                    '1 hour ago',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff9DA2A7),
                                      fontFamily: 'InterRegular',
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  SvgPicture.asset('assets/star.svg',
                                      height: 14),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  const Text(
                                    '4',
                                    style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        color: Color(0xff727880),
                                        fontSize: 12),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Divider(
                                height: 1,
                                color: notifire.getgrey1,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    'assets/avatar-7 1.png',
                                    height: 40,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Ralph Edwards',
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              color: Color(0xff727880),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which',
                                          style: TextStyle(
                                              color: notifire.getblackcolor,
                                              fontFamily: 'InterRegular',
                                              fontSize: 14),
                                        )
                                      ],
                                    ),
                                  ),
                                  const Text(
                                    '1 hour ago',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff9DA2A7),
                                      fontFamily: 'InterRegular',
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  SvgPicture.asset('assets/star.svg',
                                      height: 14),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  const Text(
                                    '4',
                                    style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        color: Color(0xff727880),
                                        fontSize: 12),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Divider(
                                height: 1,
                                color: notifire.getgrey1,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    'assets/avatar-8 1.png',
                                    height: 40,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Ralph Edwards',
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              color: Color(0xff727880),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which',
                                          style: TextStyle(
                                              color: notifire.getblackcolor,
                                              fontFamily: 'InterRegular',
                                              fontSize: 14),
                                        )
                                      ],
                                    ),
                                  ),
                                  const Text(
                                    '1 hour ago',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff9DA2A7),
                                      fontFamily: 'InterRegular',
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  SvgPicture.asset('assets/star.svg',
                                      height: 14),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  const Text(
                                    '4',
                                    style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        color: Color(0xff727880),
                                        fontSize: 12),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Divider(
                                height: 1,
                                color: notifire.getgrey1,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    'assets/avatar-7 1.png',
                                    height: 40,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Ralph Edwards',
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              color: Color(0xff727880),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour',
                                          style: TextStyle(
                                              color: notifire.getblackcolor,
                                              fontFamily: 'InterRegular',
                                              fontSize: 14),
                                        )
                                      ],
                                    ),
                                  ),
                                  const Text(
                                    '1 hour ago',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff9DA2A7),
                                      fontFamily: 'InterRegular',
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  SvgPicture.asset('assets/star.svg',
                                      height: 14),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  const Text(
                                    '4',
                                    style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        color: Color(0xff727880),
                                        fontSize: 12),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Divider(
                                height: 1,
                                color: notifire.getgrey1,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    'assets/avatar-8 1.png',
                                    height: 40,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Ralph Edwards',
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              color: Color(0xff727880),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration some form, by injected humour, or randomised words which dont look even slightly believable. ',
                                          style: TextStyle(
                                              color: notifire.getblackcolor,
                                              fontFamily: 'InterRegular',
                                              fontSize: 14),
                                        )
                                      ],
                                    ),
                                  ),
                                  const Text(
                                    '1 hour ago',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff9DA2A7),
                                      fontFamily: 'InterRegular',
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  SvgPicture.asset('assets/star.svg',
                                      height: 14),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  const Text(
                                    '4',
                                    style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        color: Color(0xff727880),
                                        fontSize: 12),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Divider(
                                height: 1,
                                color: notifire.getgrey1,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          );
  }

  Widget container4(raints) {
    return raints < 600
        ? StatefulBuilder(builder: (context, setState) {
          return Scaffold(
            backgroundColor: notifire.getbgcolor10,
            appBar:  AppBar(
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
                                                  fontFamily: 'InterRegular',
                                                  fontSize: 12,
                                                  color:
                                                  notifire.getblackcolor,
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
                                                  color:
                                                  notifire.getblackcolor,
                                                )),
                                            Text(model().popo2[index],
                                                style: TextStyle(
                                                  fontFamily: 'InterRegular',
                                                  fontSize: 12,
                                                  color:
                                                  notifire.getblackcolor,
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
                  child:  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(child: Image.asset('assets/avatar-6 1.png')),
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
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const login(),));
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
                                  const SizedBox(width: 10,),
                                  Text('RTL',style: TextStyle(color: notifire.getblackcolor,fontFamily: 'InterRegular')),
                                  const Spacer(),
                                  Transform.translate(
                                      offset: const Offset(12, 0),
                                      child: switchButton()),

                                ],
                              ),
                            );
                          }
                      ),
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
            body: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: notifire.getbgcolor11,
                    borderRadius: BorderRadius.circular(12)),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: const DecorationImage(
                                  image: AssetImage('assets/Media21.png'),
                                  fit: BoxFit.cover)),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Dell Computer Monitor',
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'InterRegular',
                              color: notifire.getblackcolor,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Product ID',
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'InterRegular',
                              color: Color(0xff9DA2A7)),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'EP0485-236',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'InterRegular',
                            color: notifire.getblackcolor,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Category',
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'InterRegular',
                              color: Color(0xff9DA2A7)),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'Automotive Accessories',
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'InterRegular',
                              color: Color(0xff595FE5)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Published Date',
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'InterRegular',
                              color: Color(0xff9DA2A7)),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '11 Sep 2022 10:09 am',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'InterRegular',
                            color: notifire.getblackcolor,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Brand',
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'InterRegular',
                              color: Color(0xff9DA2A7)),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'Dell Computer',
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'InterRegular',
                              color: Color(0xff595FE5)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Material',
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'InterRegular',
                              color: Color(0xff9DA2A7)),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Cotton',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'InterRegular',
                            color: notifire.getblackcolor,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Colors',
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'InterRegular',
                              color: Color(0xff9DA2A7)),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 24,
                              width: 24,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color(0xff7DC066)),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              height: 24,
                              width: 24,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color(0xff59B4D1)),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              height: 24,
                              width: 24,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color(0xffA9DDF5)),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              height: 24,
                              width: 24,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color(0xffD9B7FB)),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              height: 24,
                              width: 24,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color(0xffFFC9AC)),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              height: 24,
                              width: 24,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Sizes',
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'InterRegular',
                              color: Color(0xff9DA2A7)),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'S,M,L,XL,XXL',
                          style: TextStyle(
                            fontSize: 14,
                            color: notifire.getblackcolor,
                            fontFamily: 'InterRegular',
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Tommy Hilfiger men striped pink sweatshirt. Crafted with cotton. Material composition is 100% organic cotton. This is one of the world’s leading designer lifestyle brands and is internationally recognized for celebrating the essence of classic American cool style, featuring preppy with a twist designs.',
                          style: TextStyle(
                              color: Color(0xff727880),
                              fontFamily: 'InterRegular',
                              fontSize: 12),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          ' It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ',
                          style: TextStyle(
                              color: Color(0xff727880),
                              fontFamily: 'InterRegular',
                              fontSize: 12),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          child: Container(
                            decoration: BoxDecoration(
                                color: notifire.getbgcolor11,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: notifire.Getblg2)),
                            height: 45,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset('assets/edit-2.png',
                                      height: 16,
                                      color: const Color(0xff727880)),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Text(
                                    'Edit',
                                    style: TextStyle(
                                        color: Color(0xff727880),
                                        fontSize: 14,
                                        fontFamily: 'InterRegular',
                                        fontWeight: FontWeight.w600),
                                  )
                                ]),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },

        )
        : Container(
            height: Get.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: notifire.getbgcolor11,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: const DecorationImage(
                            image: AssetImage('assets/Media21.png'),
                            fit: BoxFit.cover)),
                  ),
                  Text(
                    'Dell Computer Monitor',
                    style: TextStyle(
                        fontSize: 16,
                        color: notifire.getblackcolor,
                        fontFamily: 'InterRegular',
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Product ID',
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'InterRegular',
                        color: Color(0xff9DA2A7)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'EP0485-236',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'InterRegular',
                      color: notifire.getblackcolor,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Category',
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'InterRegular',
                        color: Color(0xff9DA2A7)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Automotive Accessories',
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'InterRegular',
                        color: Color(0xff595FE5)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Published Date',
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'InterRegular',
                        color: Color(0xff9DA2A7)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '11 Sep 2022 10:09 am',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'InterRegular',
                      color: notifire.getblackcolor,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Brand',
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'InterRegular',
                        color: Color(0xff9DA2A7)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Dell Computer',
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'InterRegular',
                        color: Color(0xff595FE5)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Material',
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'InterRegular',
                        color: Color(0xff9DA2A7)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Cotton',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'InterRegular',
                      color: notifire.getblackcolor,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Colors',
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'InterRegular',
                        color: Color(0xff9DA2A7)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xff7DC066)),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xff59B4D1)),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xffA9DDF5)),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xffD9B7FB)),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xffFFC9AC)),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: notifire.getblackcolor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Sizes',
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'InterRegular',
                        color: Color(0xff9DA2A7)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'S,M,L,XL,XXL',
                    style: TextStyle(
                      fontSize: 14,
                      color: notifire.getblackcolor,
                      fontFamily: 'InterRegular',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Tommy Hilfiger men striped pink sweatshirt. Crafted with cotton. Material composition is 100% organic cotton. This is one of the world’s leading designer lifestyle brands and is internationally recognized for celebrating the essence of classic American cool style, featuring preppy with a twist designs.',
                    style: TextStyle(
                        color: Color(0xff727880),
                        fontFamily: 'InterRegular',
                        fontSize: 12),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    ' It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ',
                    style: TextStyle(
                        color: Color(0xff727880),
                        fontFamily: 'InterRegular',
                        fontSize: 12),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: notifire.getbgcolor10,
                      ),
                      height: 45,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/edit-2.png',
                                height: 16, color: const Color(0xff727880)),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              'Edit',
                              style: TextStyle(
                                  color: Color(0xff727880),
                                  fontSize: 14,
                                  fontFamily: 'InterRegular',
                                  fontWeight: FontWeight.w600),
                            )
                          ]),
                    ),
                  )
                ],
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
  TableRow dividerTable(BuildContext context, raints) {
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
      ],
    );
  }
}
