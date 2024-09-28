// ignore_for_file: deprecated_member_use
// ignore_for_file: prefer_const_constructors, file_names, camel_case_types
import 'package:evcp/screen/Tables/CRM.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:evcp/confing/colors.dart';
import 'package:evcp/confing/image.dart';
import 'package:evcp/confing/notifier.dart';

import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../login/login.dart';
import '../../confing/list.dart' show model;
import '../../controller/page_controller.dart';
import '../login/Billing Details.dart' show BillingDetails;
import '../login/Billing_Details_2.dart';
import '../login/Choose Account.dart';
import '../login/Forgot_Password.dart';
import '../login/Verification.dart';
import '../login/new_password.dart';

import '../../confing/Rtl.dart';
import '../login/Account Info.dart';
import '../login/sign_up.dart';

enum SampleItem {
  itemOne,
  itemTwo,
  itemThree,
  itemfour,
  itemfive,
  itemsix,
  itemsevan,
  itemeight
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ColorNotifier notifire;
  bool value = true;
  bool light = false;
  SampleItem? selectedMenu;
  DateTime selectedDate = DateTime.now();
  InboxController inboxController = Get.put(InboxController());
  TextEditingController dateController = TextEditingController();
  DateRangePickerController dateSelecter = DateRangePickerController();
  bool _customTileExpanded = false;
  bool _customTileExpanded1 = false;
  bool _customTileExpanded2 = false;
  bool _customTileExpanded3 = false;
  bool _customTileExpanded4 = false;
  bool _customTileExpanded5 = false;
  bool _customTileExpanded6 = false;
  bool _customTileExpanded7 = false;
  bool _customTileExpanded8 = false;
  bool _customTileExpanded9 = false;

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

  int selectedlang = 0;
  bool isdark = false;
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifier>(context, listen: true);
    return GetBuilder<InboxController>(builder: (inboxController) {
      return LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return Scaffold(
              key: _key,
              resizeToAvoidBottomInset: true,
              drawer: constraints.maxWidth < 600 ? drawer() : const SizedBox(),
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
                              Icons.dehaze_outlined, size: 15,
                              color: notifire
                                  .getblackcolor, // Change Custom Drawer Icon Color
                            ),
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            },
                            tooltip: MaterialLocalizations.of(context)
                                .openAppDrawerTooltip,
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
                                  builder: (context) => login(),
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
                                    height: 20, color: notifire.getblackcolor),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('RTL',
                                    style: TextStyle(
                                        color: notifire.getblackcolor,
                                        fontFamily: 'InterRegular')),
                                const Spacer(),
                                Transform.translate(
                                    offset: Offset(12, 0),
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
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    inboxController.page12[inboxController.selectPage],
                  ],
                ),
              ),
            );
          } else {
            return Scaffold(
              body: Row(
                children: [
                  constraints.maxWidth < 800 ? const SizedBox() : drawer(),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(color: notifire.getbgcolor10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              inboxController.selectPage == 38 ||
                                      inboxController.selectPage == 39 ||
                                      inboxController.selectPage == 40 ||
                                      inboxController.selectPage == 41 ||
                                      inboxController.selectPage == 42 ||
                                      inboxController.selectPage == 43 ||
                                      inboxController.selectPage == 44 ||
                                      inboxController.selectPage == 45 ||
                                      inboxController.selectPage == 46
                                  ? const SizedBox()
                                  : Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: appbar(
                                          constraints: constraints.maxWidth),
                                    ),
                            ],
                          ),
                          Expanded(
                            child: SizedBox(
                              height: Get.height,
                              width: Get.width,
                              child: inboxController
                                  .page12[inboxController.selectPage],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      );
    });
  }

  Widget drawer() {
    return GetBuilder<InboxController>(
      builder: (inboxController) {
        return Drawer(
          width: 250,
          backgroundColor: notifire.getbgcolor11,
          elevation: 0,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: InkWell(
                        onTap: () {
                          inboxController.setTextIsTrue(1);
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              AppContent.evcp,
                              height: 35,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "evcp",
                              style: TextStyle(
                                color: notifire.getblackcolor,
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                fontFamily: "InterRegular",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    //! ----------------- Dashboard 1-4 ---------------------
                    InkWell(
                      onTap: () {
                        inboxController.setTextIsTrue(0);
                        Get.back();
                      },
                      child: Theme(
                        data: Theme.of(context)
                            .copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          initiallyExpanded: true,
                          controlAffinity: ListTileControlAffinity.platform,
                          trailing: Icon(
                            size: 20,
                            _customTileExpanded ? Icons.remove : Icons.add,
                            color: inboxController.selectPage == 0
                                ? const Color(0xff2a70fe)
                                : const Color(0xff738096),
                          ),
                          onExpansionChanged: (bool expanded) {
                            inboxController.setTextIsTrue(0);
                            setState(() {
                              _customTileExpanded = expanded;
                            });
                          },
                          backgroundColor: (inboxController.selectPage == 0 ||
                                  inboxController.selectPage == 2 ||
                                  inboxController.selectPage == 3 ||
                                  inboxController.selectPage == 4)
                              ? notifire.getbgcolor11
                              : notifire.getbgcolor11,
                          leading: Transform.translate(
                            offset: const Offset(0, 0),
                            child: SizedBox(
                              height: 18,
                              width: 18,
                              child: SvgPicture.asset(
                                "assets/element-4.svg",
                                fit: BoxFit.cover,
                                color: inboxController.selectPage == 0
                                    ? const Color(0xff2a70fe)
                                    : const Color(0xff738096),
                              ),
                            ),
                          ),
                          title: Transform.translate(
                            offset: const Offset(-20, 0),
                            child: Text(
                              "Dashboard",
                              style: TextStyle(
                                fontFamily: "InterMedium",
                                color: inboxController.selectPage == 0
                                    ? const Color(0xff2a70fe)
                                    : const Color(0xff738096),
                                fontSize: 14,
                              ),
                            ),
                          ),
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    inboxController.setTextIsTrue(0);
                                    Get.back();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(0),
                                    child: Container(
                                      height: 40,
                                      alignment: Alignment.centerLeft,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            inboxController.selectPage == 0
                                                ? BorderRadius.circular(12)
                                                : null,
                                        color: inboxController.selectPage == 0
                                            ? notifire.Getblg2
                                            : notifire.getbgcolor11,
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 45),
                                        child: Text(
                                          "Ecommerce",
                                          style: TextStyle(
                                            fontFamily: "InterMedium",
                                            color:
                                                inboxController.selectPage == 0
                                                    ? const Color(0xff2a70fe)
                                                    : const Color(0xff738096),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                InkWell(
                                  onTap: () {
                                    inboxController.setTextIsTrue(2);
                                    Get.back();
                                  },
                                  child: Container(
                                    height: 40,
                                    alignment: Alignment.centerLeft,
                                    width: Get.width,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          inboxController.selectPage == 2
                                              ? BorderRadius.circular(12)
                                              : null,
                                      color: inboxController.selectPage == 2
                                          ? notifire.Getblg2
                                          : notifire.getbgcolor11,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 45),
                                      child: Text(
                                        "Analytics",
                                        style: TextStyle(
                                          fontFamily: "InterMedium",
                                          color: inboxController.selectPage == 2
                                              ? const Color(0xff2a70fe)
                                              : const Color(0xff738096),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                InkWell(
                                  onTap: () {
                                    inboxController.setTextIsTrue(3);
                                    Get.back();
                                  },
                                  child: Container(
                                      height: 40,
                                      alignment: Alignment.centerLeft,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            inboxController.selectPage == 3
                                                ? BorderRadius.circular(12)
                                                : null,
                                        color: inboxController.selectPage == 3
                                            ? notifire.Getblg2
                                            : notifire.getbgcolor11,
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 45),
                                        child: Text(
                                          "Crypto",
                                          style: TextStyle(
                                            fontFamily: "InterMedium",
                                            color:
                                                inboxController.selectPage == 3
                                                    ? const Color(0xff2a70fe)
                                                    : const Color(0xff738096),
                                          ),
                                        ),
                                      )),
                                ),
                                const SizedBox(height: 10),
                                InkWell(
                                  onTap: () {
                                    inboxController.setTextIsTrue(4);
                                    Get.back();
                                  },
                                  child: Container(
                                      height: 40,
                                      alignment: Alignment.centerLeft,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            inboxController.selectPage == 4
                                                ? BorderRadius.circular(12)
                                                : null,
                                        color: inboxController.selectPage == 4
                                            ? notifire.Getblg2
                                            : notifire.getbgcolor11,
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 45),
                                        child: Text(
                                          "Projects Manager",
                                          style: TextStyle(
                                            fontFamily: "InterMedium",
                                            color:
                                                inboxController.selectPage == 4
                                                    ? const Color(0xff2a70fe)
                                                    : const Color(0xff738096),
                                          ),
                                        ),
                                      )),
                                ),
                                const SizedBox(height: 10),
                                InkWell(
                                  onTap: () {
                                    inboxController.setTextIsTrue(4);
                                    Get.back();
                                  },
                                  child: Container(
                                      height: 40,
                                      alignment: Alignment.centerLeft,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            inboxController.selectPage == 4
                                                ? BorderRadius.circular(12)
                                                : null,
                                        color: inboxController.selectPage == 4
                                            ? notifire.Getblg2
                                            : notifire.getbgcolor11,
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 45),
                                        child: Text(
                                          "EMS",
                                          style: TextStyle(
                                            fontFamily: "InterMedium",
                                            color:
                                                inboxController.selectPage == 4
                                                    ? const Color(0xff2a70fe)
                                                    : const Color(0xff738096),
                                          ),
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    //! ----------------- Tables 5-8 ---------------------
                    InkWell(
                      onTap: () {
                        inboxController.setTextIsTrue(5);
                        Get.back();
                      },
                      child: Theme(
                        data: Theme.of(context)
                            .copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          initiallyExpanded: _customTileExpanded1,
                          controlAffinity: ListTileControlAffinity.platform,
                          trailing: Icon(
                            size: 20,
                            _customTileExpanded1 ? Icons.remove : Icons.add,
                            color: inboxController.selectPage == 5
                                ? const Color(0xff2a70fe)
                                : const Color(0xff738096),
                          ),
                          onExpansionChanged: (bool expanded) {
                            inboxController.setTextIsTrue(5);
                            setState(() {
                              _customTileExpanded1 = expanded;
                            });
                          },
                          backgroundColor: (inboxController.selectPage == 5 ||
                                  inboxController.selectPage == 6 ||
                                  inboxController.selectPage == 7 ||
                                  inboxController.selectPage == 8)
                              ? notifire.getbgcolor11
                              : notifire.getbgcolor11,
                          leading: Transform.translate(
                            offset: const Offset(0, 0),
                            child: SizedBox(
                              height: 18,
                              width: 18,
                              child: SvgPicture.asset(
                                "assets/fatrows.svg",
                                fit: BoxFit.cover,
                                color: inboxController.selectPage == 5
                                    ? const Color(0xff2a70fe)
                                    : const Color(0xff738096),
                              ),
                            ),
                          ),
                          title: Transform.translate(
                            offset: const Offset(-20, 0),
                            child: Text(
                              "Tables",
                              style: TextStyle(
                                fontFamily: "InterMedium",
                                color: inboxController.selectPage == 5
                                    ? const Color(0xff2a70fe)
                                    : const Color(0xff738096),
                                fontSize: 14,
                              ),
                            ),
                          ),
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    inboxController.setTextIsTrue(5);
                                    Get.back();
                                  },
                                  child: Container(
                                      height: 40,
                                      alignment: Alignment.centerLeft,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            inboxController.selectPage == 5
                                                ? BorderRadius.circular(12)
                                                : null,
                                        color: inboxController.selectPage == 5
                                            ? notifire.Getblg2
                                            : notifire.getbgcolor11,
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 45),
                                        child: Text(
                                          "Basic",
                                          style: TextStyle(
                                            fontFamily: "InterMedium",
                                            color:
                                                inboxController.selectPage == 5
                                                    ? const Color(0xff2a70fe)
                                                    : const Color(0xff738096),
                                          ),
                                        ),
                                      )),
                                ),
                                const SizedBox(height: 10),
                                InkWell(
                                  onTap: () {
                                    inboxController.setTextIsTrue(6);
                                    Get.back();
                                  },
                                  child: Container(
                                    height: 40,
                                    alignment: Alignment.centerLeft,
                                    width: Get.width,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          inboxController.selectPage == 6
                                              ? BorderRadius.circular(12)
                                              : null,
                                      color: inboxController.selectPage == 6
                                          ? notifire.Getblg2
                                          : notifire.getbgcolor11,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 45),
                                      child: Text(
                                        "Striped",
                                        style: TextStyle(
                                          fontFamily: "InterMedium",
                                          color: inboxController.selectPage == 6
                                              ? const Color(0xff2a70fe)
                                              : const Color(0xff738096),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                InkWell(
                                  onTap: () {
                                    inboxController.setTextIsTrue(7);
                                    Get.back();
                                  },
                                  child: Container(
                                      height: 40,
                                      alignment: Alignment.centerLeft,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            inboxController.selectPage == 7
                                                ? BorderRadius.circular(12)
                                                : null,
                                        color: inboxController.selectPage == 7
                                            ? notifire.Getblg2
                                            : notifire.getbgcolor11,
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 45),
                                        child: Text(
                                          "Bordered",
                                          style: TextStyle(
                                            fontFamily: "InterMedium",
                                            color:
                                                inboxController.selectPage == 7
                                                    ? const Color(0xff2a70fe)
                                                    : const Color(0xff738096),
                                            fontSize: 14,
                                          ),
                                        ),
                                      )),
                                ),
                                const SizedBox(height: 10),
                                InkWell(
                                  onTap: () {
                                    inboxController.setTextIsTrue(8);
                                    Get.back();
                                    Get.to(() => CRMCustomer());
                                  },
                                  child: Container(
                                      height: 40,
                                      alignment: Alignment.centerLeft,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            inboxController.selectPage == 8
                                                ? BorderRadius.circular(12)
                                                : null,
                                        color: inboxController.selectPage == 8
                                            ? notifire.Getblg2
                                            : notifire.getbgcolor11,
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 45),
                                        child: Text(
                                          "CRM",
                                          style: TextStyle(
                                            fontFamily: "InterMedium",
                                            color:
                                                inboxController.selectPage == 8
                                                    ? const Color(0xff2a70fe)
                                                    : const Color(0xff738096),
                                            fontSize: 14,
                                          ),
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    //! ----------------- Messages 9-12 ---------------------
                    InkWell(
                      onTap: () {
                        inboxController.setTextIsTrue(9);
                        Get.back();
                      },
                      child: Theme(
                        data: Theme.of(context)
                            .copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          initiallyExpanded: _customTileExpanded2,
                          controlAffinity: ListTileControlAffinity.platform,
                          trailing: SizedBox(
                            height: 45,
                            width: 50,
                            child: Row(
                              children: [
                                Container(
                                    width: 25,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        color: const Color(0xffE5646C),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: const Center(
                                        child: Text(
                                      '25',
                                      style: TextStyle(
                                          fontFamily: 'InterMedium',
                                          color: Colors.white,
                                          fontSize: 10),
                                    ))),
                                const SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  size: 20,
                                  _customTileExpanded2
                                      ? Icons.remove
                                      : Icons.add,
                                  color: inboxController.selectPage == 9
                                      ? const Color(0xff2a70fe)
                                      : const Color(0xff738096),
                                ),
                              ],
                            ),
                          ),
                          onExpansionChanged: (bool expanded) {
                            inboxController.setTextIsTrue(9);
                            setState(() {
                              _customTileExpanded2 = expanded;
                            });
                          },
                          backgroundColor: (inboxController.selectPage == 9 ||
                                  inboxController.selectPage == 10 ||
                                  inboxController.selectPage == 11 ||
                                  inboxController.selectPage == 12)
                              ? notifire.getbgcolor11
                              : notifire.getbgcolor11,
                          leading: Transform.translate(
                            offset: const Offset(0, 0),
                            child: SizedBox(
                                height: 18,
                                width: 18,
                                child: SvgPicture.asset(
                                  "assets/messages-3.svg",
                                  fit: BoxFit.cover,
                                  color: inboxController.selectPage == 9
                                      ? const Color(0xff2a70fe)
                                      : const Color(0xff738096),
                                )),
                          ),
                          title: Transform.translate(
                            offset: const Offset(-20, 0),
                            child: Text(
                              "Messages",
                              style: TextStyle(
                                fontFamily: "InterMedium",
                                color: inboxController.selectPage == 9
                                    ? const Color(0xff2a70fe)
                                    : const Color(0xff738096),
                                fontSize: 14,
                              ),
                            ),
                          ),
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    inboxController.setTextIsTrue(9);
                                    Get.back();
                                  },
                                  child: Container(
                                      height: 40,
                                      alignment: Alignment.centerLeft,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            inboxController.selectPage == 9
                                                ? BorderRadius.circular(12)
                                                : null,
                                        color: inboxController.selectPage == 9
                                            ? notifire.Getblg2
                                            : notifire.getbgcolor11,
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 45),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Social",
                                              style: TextStyle(
                                                fontFamily: "InterMedium",
                                                color: inboxController
                                                            .selectPage ==
                                                        9
                                                    ? const Color(0xff2a70fe)
                                                    : const Color(0xff738096),
                                              ),
                                            ),
                                            const Spacer(),
                                            Transform.translate(
                                              offset: const Offset(-10, 0),
                                              child: Container(
                                                height: 18,
                                                width: 18,
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xffE5646C),
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                child: const Center(
                                                    child: Text('7',
                                                        style: TextStyle(
                                                          fontSize: 10,
                                                          color: Colors.white,
                                                          fontFamily:
                                                              'InterMedium',
                                                        ))),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                ),
                                const SizedBox(height: 10),
                                InkWell(
                                  onTap: () {
                                    inboxController.setTextIsTrue(10);
                                    Get.back();
                                  },
                                  child: Container(
                                    height: 40,
                                    alignment: Alignment.centerLeft,
                                    width: Get.width,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          inboxController.selectPage == 10
                                              ? BorderRadius.circular(12)
                                              : null,
                                      color: inboxController.selectPage == 10
                                          ? notifire.Getblg2
                                          : notifire.getbgcolor11,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 45),
                                      child: Text(
                                        "Teamwork",
                                        style: TextStyle(
                                          fontFamily: "InterMedium",
                                          color:
                                              inboxController.selectPage == 10
                                                  ? const Color(0xff2a70fe)
                                                  : const Color(0xff738096),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                InkWell(
                                  onTap: () {
                                    inboxController.setTextIsTrue(11);
                                    Get.back();
                                  },
                                  child: Container(
                                      height: 40,
                                      alignment: Alignment.centerLeft,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            inboxController.selectPage == 11
                                                ? BorderRadius.circular(12)
                                                : null,
                                        color: inboxController.selectPage == 11
                                            ? notifire.Getblg2
                                            : notifire.getbgcolor11,
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 45),
                                        child: Text(
                                          "Business",
                                          style: TextStyle(
                                            fontFamily: "InterMedium",
                                            color:
                                                inboxController.selectPage == 11
                                                    ? const Color(0xff2a70fe)
                                                    : const Color(0xff738096),
                                            fontSize: 14,
                                          ),
                                        ),
                                      )),
                                ),
                                const SizedBox(height: 10),
                                InkWell(
                                  onTap: () {
                                    inboxController.setTextIsTrue(12);
                                    Get.back();
                                  },
                                  child: Container(
                                      height: 40,
                                      alignment: Alignment.centerLeft,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            inboxController.selectPage == 12
                                                ? BorderRadius.circular(12)
                                                : null,
                                        color: inboxController.selectPage == 12
                                            ? notifire.Getblg2
                                            : notifire.getbgcolor11,
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 45),
                                        child: Text(
                                          "Supporter",
                                          style: TextStyle(
                                            fontFamily: "InterMedium",
                                            color:
                                                inboxController.selectPage == 12
                                                    ? const Color(0xff2a70fe)
                                                    : const Color(0xff738096),
                                            fontSize: 14,
                                          ),
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    Container(
                      decoration: BoxDecoration(
                          color: inboxController.pageselecter == 13
                              ? notifire.getbgcolor11
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(15)),
                      child: ListTile(
                        onTap: () {
                          inboxController.setTextIsTrue(13);
                          Get.back();
                        },
                        trailing: Container(
                          height: 21,
                          width: 21,
                          decoration: BoxDecoration(
                              color: Color(0xffE5646C),
                              borderRadius: BorderRadius.circular(65)),
                          child: const Center(
                              child: Text(
                            '4',
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          )),
                        ),
                        title: Transform.translate(
                          offset: const Offset(-20, 0),
                          child: Text(
                            "Mail",
                            style: TextStyle(
                              fontFamily: "InterMedium",
                              color: inboxController.selectPage == 13
                                  ? const Color(0xff2a70fe)
                                  : const Color(0xff738096),
                              fontSize: 14,
                            ),
                          ),
                        ),
                        leading: Transform.translate(
                          offset: const Offset(0, 0),
                          child: SizedBox(
                              height: 18,
                              width: 18,
                              child: SvgPicture.asset(
                                "assets/direct-inbox.svg",
                                fit: BoxFit.cover,
                                color: inboxController.selectPage == 13
                                    ? const Color(0xff2a70fe)
                                    : const Color(0xff738096),
                              )),
                        ),
                      ),
                    ),

                    //! ----------------- Finance 24 ---------------------
                    InkWell(
                      onTap: () {
                        inboxController.setTextIsTrue(24);
                        Get.back();
                      },
                      child: Theme(
                        data: Theme.of(context)
                            .copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          initiallyExpanded: _customTileExpanded4,
                          controlAffinity: ListTileControlAffinity.platform,
                          trailing: Icon(
                            size: 20,
                            _customTileExpanded4 ? Icons.remove : Icons.add,
                            color: inboxController.selectPage == 24
                                ? const Color(0xff2a70fe)
                                : const Color(0xff738096),
                          ),
                          onExpansionChanged: (bool expanded) {
                            inboxController.setTextIsTrue(24);
                            setState(() {
                              _customTileExpanded4 = expanded;
                            });
                          },
                          backgroundColor: (inboxController.selectPage == 24)
                              ? notifire.getbgcolor11
                              : notifire.getbgcolor11,
                          leading: Transform.translate(
                            offset: const Offset(0, 0),
                            child: SizedBox(
                              height: 18,
                              width: 18,
                              child: SvgPicture.asset(
                                "assets/wallet.svg",
                                fit: BoxFit.cover,
                                color: inboxController.selectPage == 24
                                    ? const Color(0xff2a70fe)
                                    : const Color(0xff738096),
                              ),
                            ),
                          ),
                          title: Transform.translate(
                            offset: const Offset(-20, 0),
                            child: Text(
                              "Finance",
                              style: TextStyle(
                                fontFamily: "InterMedium",
                                color: inboxController.selectPage == 24
                                    ? const Color(0xff2a70fe)
                                    : const Color(0xff738096),
                                fontSize: 14,
                              ),
                            ),
                          ),
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    inboxController.setTextIsTrue(24);
                                    Get.back();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(0),
                                    child: Container(
                                      height: 40,
                                      alignment: Alignment.centerLeft,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            inboxController.selectPage == 24
                                                ? BorderRadius.circular(12)
                                                : null,
                                        color: inboxController.selectPage == 24
                                            ? notifire.Getblg2
                                            : notifire.getbgcolor11,
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 45),
                                        child: Text(
                                          "Personal",
                                          style: TextStyle(
                                            fontFamily: "InterMedium",
                                            color:
                                                inboxController.selectPage == 24
                                                    ? const Color(0xff2a70fe)
                                                    : const Color(0xff738096),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    //! ----------------- Logistic 25-26 ---------------------
                    InkWell(
                      onTap: () {
                        inboxController.setTextIsTrue(25);
                        Get.back();
                      },
                      child: Theme(
                        data: Theme.of(context)
                            .copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          initiallyExpanded: _customTileExpanded5,
                          controlAffinity: ListTileControlAffinity.platform,
                          trailing: Icon(
                            size: 20,
                            _customTileExpanded5 ? Icons.remove : Icons.add,
                            color: inboxController.selectPage == 25
                                ? const Color(0xff2a70fe)
                                : const Color(0xff738096),
                          ),
                          onExpansionChanged: (bool expanded) {
                            inboxController.setTextIsTrue(25);
                            setState(() {
                              _customTileExpanded5 = expanded;
                            });
                          },
                          backgroundColor: (inboxController.selectPage == 25 ||
                                  inboxController.selectPage == 26)
                              ? notifire.getbgcolor11
                              : notifire.getbgcolor11,
                          leading: Transform.translate(
                            offset: const Offset(0, 0),
                            child: SizedBox(
                              height: 18,
                              width: 18,
                              child: SvgPicture.asset(
                                "assets/truck-fast.svg",
                                fit: BoxFit.cover,
                                color: inboxController.selectPage == 25
                                    ? const Color(0xff2a70fe)
                                    : const Color(0xff738096),
                              ),
                            ),
                          ),
                          title: Transform.translate(
                            offset: const Offset(-20, 0),
                            child: Text(
                              "Logistic",
                              style: TextStyle(
                                fontFamily: "InterMedium",
                                color: inboxController.selectPage == 25
                                    ? const Color(0xff2a70fe)
                                    : const Color(0xff738096),
                                fontSize: 14,
                              ),
                            ),
                          ),
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    inboxController.setTextIsTrue(25);
                                    Get.back();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(0),
                                    child: Container(
                                      height: 40,
                                      alignment: Alignment.centerLeft,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            inboxController.selectPage == 25
                                                ? BorderRadius.circular(12)
                                                : null,
                                        color: inboxController.selectPage == 25
                                            ? notifire.Getblg2
                                            : notifire.getbgcolor11,
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 45),
                                        child: Text(
                                          "Version #1",
                                          style: TextStyle(
                                            fontFamily: "InterMedium",
                                            color:
                                                inboxController.selectPage == 25
                                                    ? const Color(0xff2a70fe)
                                                    : const Color(0xff738096),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                InkWell(
                                  onTap: () {
                                    inboxController.setTextIsTrue(26);
                                    Get.back();
                                  },
                                  child: Container(
                                    height: 40,
                                    alignment: Alignment.centerLeft,
                                    width: Get.width,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          inboxController.selectPage == 26
                                              ? BorderRadius.circular(12)
                                              : null,
                                      color: inboxController.selectPage == 26
                                          ? notifire.Getblg2
                                          : notifire.getbgcolor11,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 45),
                                      child: Text(
                                        "Version #2",
                                        style: TextStyle(
                                          fontFamily: "InterMedium",
                                          color:
                                              inboxController.selectPage == 26
                                                  ? const Color(0xff2a70fe)
                                                  : const Color(0xff738096),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    //! ----------------- Management 27-28 ---------------------
                    InkWell(
                      onTap: () {
                        inboxController.setTextIsTrue(27);
                        Get.back();
                      },
                      child: Theme(
                        data: Theme.of(context)
                            .copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          initiallyExpanded: _customTileExpanded6,
                          controlAffinity: ListTileControlAffinity.platform,
                          trailing: Icon(
                            size: 20,
                            _customTileExpanded6 ? Icons.remove : Icons.add,
                            color: inboxController.selectPage == 27
                                ? const Color(0xff2a70fe)
                                : const Color(0xff738096),
                          ),
                          onExpansionChanged: (bool expanded) {
                            inboxController.setTextIsTrue(27);
                            setState(() {
                              _customTileExpanded6 = expanded;
                            });
                          },
                          backgroundColor: (inboxController.selectPage == 27 ||
                                  inboxController.selectPage == 28)
                              ? notifire.getbgcolor11
                              : notifire.getbgcolor11,
                          leading: Transform.translate(
                            offset: const Offset(0, 0),
                            child: SizedBox(
                              height: 18,
                              width: 18,
                              child: SvgPicture.asset(
                                "assets/kanban.svg",
                                fit: BoxFit.cover,
                                color: inboxController.selectPage == 27
                                    ? const Color(0xff2a70fe)
                                    : const Color(0xff738096),
                              ),
                            ),
                          ),
                          title: Transform.translate(
                            offset: const Offset(-20, 0),
                            child: Text(
                              "Management",
                              style: TextStyle(
                                fontFamily: "InterMedium",
                                color: inboxController.selectPage == 27
                                    ? const Color(0xff2a70fe)
                                    : const Color(0xff738096),
                                fontSize: 14,
                              ),
                            ),
                          ),
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    inboxController.setTextIsTrue(27);
                                    Get.back();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(0),
                                    child: Container(
                                      height: 40,
                                      alignment: Alignment.centerLeft,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            inboxController.selectPage == 27
                                                ? BorderRadius.circular(12)
                                                : null,
                                        color: inboxController.selectPage == 27
                                            ? notifire.Getblg2
                                            : notifire.getbgcolor11,
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 45),
                                        child: Text(
                                          "Version #1",
                                          style: TextStyle(
                                            fontFamily: "InterMedium",
                                            color:
                                                inboxController.selectPage == 27
                                                    ? const Color(0xff2a70fe)
                                                    : const Color(0xff738096),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                InkWell(
                                  onTap: () {
                                    inboxController.setTextIsTrue(28);
                                    Get.back();
                                  },
                                  child: Container(
                                    height: 40,
                                    alignment: Alignment.centerLeft,
                                    width: Get.width,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          inboxController.selectPage == 28
                                              ? BorderRadius.circular(12)
                                              : null,
                                      color: inboxController.selectPage == 28
                                          ? notifire.Getblg2
                                          : notifire.getbgcolor11,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 45),
                                      child: Text(
                                        "Version #2",
                                        style: TextStyle(
                                          fontFamily: "InterMedium",
                                          color:
                                              inboxController.selectPage == 28
                                                  ? const Color(0xff2a70fe)
                                                  : const Color(0xff738096),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    //! ----------------- Help Center 29-32 ---------------------
                    InkWell(
                      onTap: () {
                        inboxController.setTextIsTrue(29);
                        Get.back();
                      },
                      child: Theme(
                        data: Theme.of(context)
                            .copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          initiallyExpanded: _customTileExpanded7,
                          controlAffinity: ListTileControlAffinity.platform,
                          trailing: Icon(
                            size: 20,
                            _customTileExpanded7 ? Icons.remove : Icons.add,
                            color: inboxController.selectPage == 29
                                ? const Color(0xff2a70fe)
                                : const Color(0xff738096),
                          ),
                          onExpansionChanged: (bool expanded) {
                            inboxController.setTextIsTrue(29);
                            setState(() {
                              _customTileExpanded7 = expanded;
                            });
                          },
                          backgroundColor: (inboxController.selectPage == 29 ||
                                  inboxController.selectPage == 30)
                              ? notifire.getbgcolor11
                              : notifire.getbgcolor11,
                          leading: Transform.translate(
                            offset: const Offset(0, 0),
                            child: SizedBox(
                              height: 18,
                              width: 18,
                              child: SvgPicture.asset(
                                "assets/24-support.svg",
                                fit: BoxFit.cover,
                                color: inboxController.selectPage == 29
                                    ? const Color(0xff2a70fe)
                                    : const Color(0xff738096),
                              ),
                            ),
                          ),
                          title: Transform.translate(
                            offset: const Offset(-20, 0),
                            child: Text(
                              "Help Center",
                              style: TextStyle(
                                fontFamily: "InterMedium",
                                color: inboxController.selectPage == 29
                                    ? const Color(0xff2a70fe)
                                    : const Color(0xff738096),
                                fontSize: 14,
                              ),
                            ),
                          ),
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    inboxController.setTextIsTrue(29);
                                    Get.back();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(0),
                                    child: Container(
                                      height: 40,
                                      alignment: Alignment.centerLeft,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            inboxController.selectPage == 29
                                                ? BorderRadius.circular(12)
                                                : null,
                                        color: inboxController.selectPage == 29
                                            ? notifire.Getblg2
                                            : notifire.getbgcolor11,
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 45),
                                        child: Text(
                                          "Simple",
                                          style: TextStyle(
                                            fontFamily: "InterMedium",
                                            color:
                                                inboxController.selectPage == 29
                                                    ? const Color(0xff2a70fe)
                                                    : const Color(0xff738096),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                InkWell(
                                  onTap: () {
                                    inboxController.setTextIsTrue(30);
                                    Get.back();
                                  },
                                  child: Container(
                                    height: 40,
                                    alignment: Alignment.centerLeft,
                                    width: Get.width,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          inboxController.selectPage == 30
                                              ? BorderRadius.circular(12)
                                              : null,
                                      color: inboxController.selectPage == 30
                                          ? notifire.Getblg2
                                          : notifire.getbgcolor11,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 45),
                                      child: Text(
                                        "Discussion",
                                        style: TextStyle(
                                          fontFamily: "InterMedium",
                                          color:
                                              inboxController.selectPage == 30
                                                  ? const Color(0xff2a70fe)
                                                  : const Color(0xff738096),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                InkWell(
                                  onTap: () {
                                    inboxController.setTextIsTrue(31);
                                    Get.back();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(0),
                                    child: Container(
                                      height: 40,
                                      alignment: Alignment.centerLeft,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            inboxController.selectPage == 31
                                                ? BorderRadius.circular(12)
                                                : null,
                                        color: inboxController.selectPage == 31
                                            ? notifire.Getblg2
                                            : notifire.getbgcolor11,
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 45),
                                        child: Text(
                                          "User #1",
                                          style: TextStyle(
                                            fontFamily: "InterMedium",
                                            color:
                                                inboxController.selectPage == 31
                                                    ? const Color(0xff2a70fe)
                                                    : const Color(0xff738096),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                InkWell(
                                  onTap: () {
                                    inboxController.setTextIsTrue(32);
                                    Get.back();
                                  },
                                  child: Container(
                                    height: 40,
                                    alignment: Alignment.centerLeft,
                                    width: Get.width,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          inboxController.selectPage == 32
                                              ? BorderRadius.circular(12)
                                              : null,
                                      color: inboxController.selectPage == 32
                                          ? notifire.Getblg2
                                          : notifire.getbgcolor11,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 45),
                                      child: Text(
                                        "User #2",
                                        style: TextStyle(
                                          fontFamily: "InterMedium",
                                          color:
                                              inboxController.selectPage == 32
                                                  ? const Color(0xff2a70fe)
                                                  : const Color(0xff738096),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    //! ----------------- File Manager 33- ---------------------

                    Container(
                      decoration: BoxDecoration(
                          color: inboxController.pageselecter == 33
                              ? notifire.getbgcolor11
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(15)),
                      child: ListTile(
                        onTap: () {
                          inboxController.setTextIsTrue(33);
                          Get.back();
                        },
                        leading: Transform.translate(
                          offset: const Offset(0, 0),
                          child: SizedBox(
                              height: 18,
                              width: 18,
                              child: SvgPicture.asset(
                                "assets/folder-2.svg",
                                fit: BoxFit.cover,
                                color: inboxController.selectPage == 33
                                    ? const Color(0xff2a70fe)
                                    : const Color(0xff738096),
                              )),
                        ),
                        title: Transform.translate(
                          offset: const Offset(-20, 0),
                          child: Text(
                            "File Manager",
                            style: TextStyle(
                              fontFamily: "InterMedium",
                              color: inboxController.selectPage == 33
                                  ? const Color(0xff2a70fe)
                                  : const Color(0xff738096),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Admin Authorization',
                            style: TextStyle(
                              color: Color(0xff738096),
                              fontSize: 12,
                              fontFamily: "InterMedium",
                            ),
                          ),
                        ],
                      ),
                    ),
                    //! ----------------- Profile 34-37 ---------------------
                    InkWell(
                      onTap: () {
                        inboxController.setTextIsTrue(34);
                        Get.back();
                      },
                      child: Theme(
                        data: Theme.of(context)
                            .copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          initiallyExpanded: _customTileExpanded8,
                          controlAffinity: ListTileControlAffinity.platform,
                          trailing: Icon(
                            size: 20,
                            _customTileExpanded8 ? Icons.remove : Icons.add,
                            color: inboxController.selectPage == 34
                                ? const Color(0xff2a70fe)
                                : const Color(0xff738096),
                          ),
                          onExpansionChanged: (bool expanded) {
                            inboxController.setTextIsTrue(34);
                            setState(() {
                              _customTileExpanded8 = expanded;
                            });
                          },
                          backgroundColor: (inboxController.selectPage == 34 ||
                                  inboxController.selectPage == 35 ||
                                  inboxController.selectPage == 36 ||
                                  inboxController.selectPage == 37)
                              ? notifire.getbgcolor11
                              : notifire.getbgcolor11,
                          leading: Transform.translate(
                            offset: const Offset(0, 0),
                            child: SizedBox(
                              height: 18,
                              width: 18,
                              child: SvgPicture.asset(
                                "assets/profile-circle.svg",
                                fit: BoxFit.cover,
                                color: inboxController.selectPage == 34
                                    ? const Color(0xff2a70fe)
                                    : const Color(0xff738096),
                              ),
                            ),
                          ),
                          title: Transform.translate(
                            offset: const Offset(-20, 0),
                            child: Text(
                              "Profile",
                              style: TextStyle(
                                fontFamily: "InterMedium",
                                color: inboxController.selectPage == 34
                                    ? const Color(0xff2a70fe)
                                    : const Color(0xff738096),
                                fontSize: 14,
                              ),
                            ),
                          ),
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    inboxController.setTextIsTrue(34);
                                    Get.back();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(0),
                                    child: Container(
                                      height: 40,
                                      alignment: Alignment.centerLeft,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            inboxController.selectPage == 34
                                                ? BorderRadius.circular(12)
                                                : null,
                                        color: inboxController.selectPage == 34
                                            ? notifire.Getblg2
                                            : notifire.getbgcolor11,
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 45),
                                        child: Text(
                                          "Social",
                                          style: TextStyle(
                                            fontFamily: "InterMedium",
                                            color:
                                                inboxController.selectPage == 34
                                                    ? const Color(0xff2a70fe)
                                                    : const Color(0xff738096),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                InkWell(
                                  onTap: () {
                                    inboxController.setTextIsTrue(35);
                                    Get.back();
                                  },
                                  child: Container(
                                    height: 40,
                                    alignment: Alignment.centerLeft,
                                    width: Get.width,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          inboxController.selectPage == 35
                                              ? BorderRadius.circular(12)
                                              : null,
                                      color: inboxController.selectPage == 35
                                          ? notifire.Getblg2
                                          : notifire.getbgcolor11,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 45),
                                      child: Text(
                                        "Company",
                                        style: TextStyle(
                                          fontFamily: "InterMedium",
                                          color:
                                              inboxController.selectPage == 35
                                                  ? const Color(0xff2a70fe)
                                                  : const Color(0xff738096),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                InkWell(
                                  onTap: () {
                                    inboxController.setTextIsTrue(36);
                                    Get.back();
                                  },
                                  child: Container(
                                      height: 40,
                                      alignment: Alignment.centerLeft,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            inboxController.selectPage == 36
                                                ? BorderRadius.circular(12)
                                                : null,
                                        color: inboxController.selectPage == 36
                                            ? notifire.Getblg2
                                            : notifire.getbgcolor11,
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 45),
                                        child: Text(
                                          "Member",
                                          style: TextStyle(
                                            fontFamily: "InterMedium",
                                            color:
                                                inboxController.selectPage == 36
                                                    ? const Color(0xff2a70fe)
                                                    : const Color(0xff738096),
                                          ),
                                        ),
                                      )),
                                ),
                                const SizedBox(height: 10),
                                InkWell(
                                  onTap: () {
                                    inboxController.setTextIsTrue(37);
                                    Get.back();
                                  },
                                  child: Container(
                                      height: 40,
                                      alignment: Alignment.centerLeft,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            inboxController.selectPage == 37
                                                ? BorderRadius.circular(12)
                                                : null,
                                        color: inboxController.selectPage == 37
                                            ? notifire.Getblg2
                                            : notifire.getbgcolor11,
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 45),
                                        child: Text(
                                          "Customer",
                                          style: TextStyle(
                                            fontFamily: "InterMedium",
                                            color:
                                                inboxController.selectPage == 37
                                                    ? const Color(0xff2a70fe)
                                                    : const Color(0xff738096),
                                          ),
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    //! ----------------- Authorization 38-42 ---------------------
                    InkWell(
                      onTap: () {
                        inboxController.setTextIsTrue(38);
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => const login()));
                      },
                      child: Theme(
                        data: Theme.of(context)
                            .copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          initiallyExpanded: _customTileExpanded9,
                          controlAffinity: ListTileControlAffinity.platform,
                          trailing: Icon(
                            size: 20,
                            _customTileExpanded9 ? Icons.remove : Icons.add,
                            color: inboxController.selectPage == 38
                                ? const Color(0xff2a70fe)
                                : const Color(0xff738096),
                          ),
                          onExpansionChanged: (bool expanded) {
                            // inboxController.setTextIsTrue(38);
                            setState(() {
                              _customTileExpanded9 = expanded;
                            });
                          },
                          backgroundColor: (inboxController.selectPage == 38 ||
                                  inboxController.selectPage == 39 ||
                                  inboxController.selectPage == 40 ||
                                  inboxController.selectPage == 41)
                              ? notifire.getbgcolor11
                              : notifire.getbgcolor11,
                          leading: Transform.translate(
                            offset: const Offset(0, 0),
                            child: SizedBox(
                              height: 18,
                              width: 18,
                              child: SvgPicture.asset(
                                "assets/more-2.svg",
                                fit: BoxFit.cover,
                                color: inboxController.selectPage == 38
                                    ? const Color(0xff2a70fe)
                                    : const Color(0xff738096),
                              ),
                            ),
                          ),
                          title: Transform.translate(
                            offset: const Offset(-20, 0),
                            child: Text(
                              "Authorization",
                              style: TextStyle(
                                fontFamily: "InterMedium",
                                color: inboxController.selectPage == 38
                                    ? const Color(0xff2a70fe)
                                    : const Color(0xff738096),
                                fontSize: 14,
                              ),
                            ),
                          ),
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    inboxController.setTextIsTrue(38);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const login()));
                                    // inboxController.setTextIsTrue(0);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(0),
                                    child: Container(
                                      height: 40,
                                      alignment: Alignment.centerLeft,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            inboxController.selectPage == 38
                                                ? BorderRadius.circular(12)
                                                : null,
                                        color: inboxController.selectPage == 38
                                            ? notifire.Getblg2
                                            : notifire.getbgcolor11,
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 45),
                                        child: Text(
                                          "Sign In",
                                          style: TextStyle(
                                            fontFamily: "InterMedium",
                                            color:
                                                inboxController.selectPage == 38
                                                    ? const Color(0xff2a70fe)
                                                    : const Color(0xff738096),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                InkWell(
                                  onTap: () {
                                    inboxController.setTextIsTrue(39);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const signup()));
                                  },
                                  child: Container(
                                    height: 40,
                                    alignment: Alignment.centerLeft,
                                    width: Get.width,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          inboxController.selectPage == 39
                                              ? BorderRadius.circular(12)
                                              : null,
                                      color: inboxController.selectPage == 39
                                          ? notifire.Getblg2
                                          : notifire.getbgcolor11,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 45),
                                      child: Text(
                                        "Sign up",
                                        style: TextStyle(
                                          fontFamily: "InterMedium",
                                          color:
                                              inboxController.selectPage == 39
                                                  ? const Color(0xff2a70fe)
                                                  : const Color(0xff738096),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                InkWell(
                                  onTap: () {
                                    inboxController.setTextIsTrue(40);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Verification()));
                                  },
                                  child: Container(
                                      height: 40,
                                      alignment: Alignment.centerLeft,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            inboxController.selectPage == 40
                                                ? BorderRadius.circular(12)
                                                : null,
                                        color: inboxController.selectPage == 40
                                            ? notifire.Getblg2
                                            : notifire.getbgcolor11,
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 45),
                                        child: Text(
                                          "Verification",
                                          style: TextStyle(
                                            fontFamily: "InterMedium",
                                            color:
                                                inboxController.selectPage == 40
                                                    ? const Color(0xff2a70fe)
                                                    : const Color(0xff738096),
                                          ),
                                        ),
                                      )),
                                ),
                                const SizedBox(height: 10),
                                InkWell(
                                  onTap: () {
                                    inboxController.setTextIsTrue(41);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ChooseAccount()));
                                  },
                                  child: Container(
                                      height: 40,
                                      alignment: Alignment.centerLeft,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            inboxController.selectPage == 41
                                                ? BorderRadius.circular(12)
                                                : null,
                                        color: inboxController.selectPage == 41
                                            ? notifire.Getblg2
                                            : notifire.getbgcolor11,
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 45),
                                        child: Text(
                                          "Choose Account",
                                          style: TextStyle(
                                            fontFamily: "InterMedium",
                                            color:
                                                inboxController.selectPage == 41
                                                    ? const Color(0xff2a70fe)
                                                    : const Color(0xff738096),
                                          ),
                                        ),
                                      )),
                                ),
                                const SizedBox(height: 10),
                                InkWell(
                                  onTap: () {
                                    inboxController.setTextIsTrue(42);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const AccountInfo()));
                                  },
                                  child: Container(
                                    height: 40,
                                    alignment: Alignment.centerLeft,
                                    width: Get.width,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          inboxController.selectPage == 42
                                              ? BorderRadius.circular(12)
                                              : null,
                                      color: inboxController.selectPage == 42
                                          ? notifire.Getblg2
                                          : notifire.getbgcolor11,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 45),
                                      child: Text(
                                        "Account Info",
                                        style: TextStyle(
                                          fontFamily: "InterMedium",
                                          color:
                                              inboxController.selectPage == 42
                                                  ? const Color(0xff2a70fe)
                                                  : const Color(0xff738096),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                InkWell(
                                  onTap: () {
                                    inboxController.setTextIsTrue(43);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const BillingDetails()));
                                  },
                                  child: Container(
                                    height: 40,
                                    alignment: Alignment.centerLeft,
                                    width: Get.width,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          inboxController.selectPage == 43
                                              ? BorderRadius.circular(12)
                                              : null,
                                      color: inboxController.selectPage == 43
                                          ? notifire.Getblg2
                                          : notifire.getbgcolor11,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 45),
                                      child: Text(
                                        "Billing Details",
                                        style: TextStyle(
                                          fontFamily: "InterMedium",
                                          color:
                                              inboxController.selectPage == 43
                                                  ? const Color(0xff2a70fe)
                                                  : const Color(0xff738096),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                InkWell(
                                  onTap: () {
                                    inboxController.setTextIsTrue(44);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const BillingDetails2()));
                                  },
                                  child: Container(
                                      height: 40,
                                      alignment: Alignment.centerLeft,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            inboxController.selectPage == 44
                                                ? BorderRadius.circular(12)
                                                : null,
                                        color: inboxController.selectPage == 44
                                            ? notifire.Getblg2
                                            : notifire.getbgcolor11,
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 45),
                                        child: Text(
                                          "Billing Details2",
                                          style: TextStyle(
                                            fontFamily: "InterMedium",
                                            color:
                                                inboxController.selectPage == 44
                                                    ? const Color(0xff2a70fe)
                                                    : const Color(0xff738096),
                                          ),
                                        ),
                                      )),
                                ),
                                const SizedBox(height: 10),
                                InkWell(
                                  onTap: () {
                                    inboxController.setTextIsTrue(45);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ForgotPassword()));
                                  },
                                  child: Container(
                                      height: 40,
                                      alignment: Alignment.centerLeft,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            inboxController.selectPage == 45
                                                ? BorderRadius.circular(12)
                                                : null,
                                        color: inboxController.selectPage == 45
                                            ? notifire.Getblg2
                                            : notifire.getbgcolor11,
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 45),
                                        child: Text(
                                          "Forgot Password",
                                          style: TextStyle(
                                            fontFamily: "InterMedium",
                                            color:
                                                inboxController.selectPage == 45
                                                    ? const Color(0xff2a70fe)
                                                    : const Color(0xff738096),
                                          ),
                                        ),
                                      )),
                                ),
                                const SizedBox(height: 10),
                                InkWell(
                                  onTap: () {
                                    inboxController.setTextIsTrue(46);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const newpassword()));
                                  },
                                  child: Container(
                                      height: 40,
                                      alignment: Alignment.centerLeft,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            inboxController.selectPage == 46
                                                ? BorderRadius.circular(12)
                                                : null,
                                        color: inboxController.selectPage == 46
                                            ? notifire.Getblg2
                                            : notifire.getbgcolor11,
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 45),
                                        child: Text(
                                          "New password",
                                          style: TextStyle(
                                            fontFamily: "InterMedium",
                                            color:
                                                inboxController.selectPage == 46
                                                    ? const Color(0xff2a70fe)
                                                    : const Color(0xff738096),
                                          ),
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  PreferredSizeWidget appbar({
    required double constraints,
  }) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: constraints < 600
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Transform.translate(
                  offset: const Offset(-8, 0),
                  child: Container(
                    width: Get.width * 0.4,
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
                        hintStyle: TextStyle(color: grey3),
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
                  ),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Transform.translate(
                  offset: const Offset(-8, 0),
                  child: Container(
                    width: Get.width * 0.4,
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
                        hintStyle: TextStyle(color: grey3),
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
                  ),
                ),
              ],
            ),
      elevation: 0,
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      backgroundColor: notifire.getbgcolor11,
      actions: [
        PopupMenuButton(
          tooltip: '',
          offset: const Offset(0, 50),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  model().Popo[index],
                                  height: 32,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(model().Popo1[index],
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'InterRegular',
                                              color: notifire.getblackcolor,
                                            )),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          model().popo2[index],
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'InterRegular',
                                            color: notifire.getblackcolor,
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
                                      borderRadius: BorderRadius.circular(16),
                                      color: const Color(0xff595FE5)),
                                )
                              ],
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          initialValue: selectedMenu,
          elevation: 1,
          splashRadius: 1,
          constraints: const BoxConstraints(
            maxWidth: 300,
            minWidth: 300,
          ),
          shadowColor: Colors.grey,
          color: notifire.getbgcolor11,
          child:
              SvgPicture.asset('assets/bell.svg', color: Neutral, height: 20),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      color: notifire.getbgcolor10,
                                      borderRadius: BorderRadius.circular(20)),
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                      borderRadius: BorderRadius.circular(16),
                                      color: const Color(0xff595FE5)),
                                )
                              ],
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => login(),
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
                          height: 20, color: notifire.getblackcolor),
                      SizedBox(
                        width: 10,
                      ),
                      Text('RTL',
                          style: TextStyle(
                              color: notifire.getblackcolor,
                              fontFamily: 'InterRegular')),
                      const Spacer(),
                      Transform.translate(
                          offset: Offset(12, 0), child: switchButton()),
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
        const Flexible(child: SizedBox(width: 10)),
      ],
    );
  }

  Widget switchButton() {
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
  }
}
