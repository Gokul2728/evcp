// ignore_for_file: prefer_const_constructors, file_names, camel_case_types
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
// ignore_for_file: deprecated_member_use
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../confing/Rtl.dart';
import '../../confing/colors.dart';
import '../../confing/image.dart';
import '../../confing/list.dart';
import '../../confing/notifier.dart';
import '../../controller/page_controller.dart';
import '../Dashboard/Dashboard_main.dart';
import '../login/login.dart';


class User2 extends StatefulWidget {
  const User2({super.key});

  @override
  State<User2> createState() => _User2State();
}

class _User2State extends State<User2> {
  late ColorNotifier notifire;
  TextEditingController dateController1 = TextEditingController();
  int selectIndex = 0;

  void _onselectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is PickerDateRange) {} else
    if (args.value is DateTime) {} else
    if (args.value is List<DateTime>) {} else {}
  }

  DateTime? sdate;
  TimeOfDay? selectTime;
  DateTime selectedDate1 = DateTime.now();
  DateRangePickerController dateSelecter = DateRangePickerController();

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

  bool isActive = false;
  SampleItem? selectedMenu;

  InboxController inboxController = Get.put(InboxController());
  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifier>(context, listen: true);
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return  SizedBox(
            height: Get.height,
            child: Scaffold(
              backgroundColor: notifire.getbgcolor10,
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    container(constraints.maxWidth),
                  ],
                ),
              ),
            ),
          );
        } else if (constraints.maxWidth < 1000) {
          return Container(
            decoration:  BoxDecoration(
                color: notifire.getbgcolor10
                ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        container(constraints.maxWidth),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Container(
            decoration: BoxDecoration(
                color: notifire.getbgcolor10
                ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: notifire.getbgcolor10,
                    child: ListView.builder(
                      itemCount: 1,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            firstContainer(
                                context: context,
                                constraints: constraints.maxWidth),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
  bool isdark = false;
  Widget firstContainer({
    context,
    constraints,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20,left: 20,right: 20),
      child: Column(
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
              Text('Help Center',style: TextStyle(color: greyy,fontSize: 14,fontFamily: 'InterRegular'),),
              const SizedBox(width: 10,),
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: greyy,),),
              const SizedBox(width: 10,),
              Text('User2',style: TextStyle(color: notifire.getblackcolor,fontSize: 14,fontFamily: 'InterRegular'),),
            ],
          ),
          const SizedBox(height: 20,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(flex: 2, child: container(constraints)),
              const SizedBox(width: 10,),
              Expanded(
                flex: 5,
                child: container1(constraints),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget container(constraints) {
    return
      constraints < 600 ?
      Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
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
                Text('Help Center',style: TextStyle(color: greyy,fontSize: 14,fontFamily: 'InterRegular'),),
                const SizedBox(width: 10,),
                Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: greyy,),),
                const SizedBox(width: 10,),
                Text('User2',style: TextStyle(color: notifire.getblackcolor,fontSize: 14,fontFamily: 'InterRegular'),),
              ],
            ),
            const SizedBox(height: 20,),
            Container(
              height: Get.height * 0.8,
              padding: const EdgeInsets.all(12),
              decoration:  BoxDecoration(borderRadius: BorderRadius.circular(12),
              color: notifire.getbgcolor11,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    Row(
                      children: [
                        SvgPicture.asset(AppContent.evcp,height: 35,),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'evcp Inc.',
                          style: TextStyle(
                            fontSize: 16,color: notifire.getblackcolor,
                            fontFamily: 'InterRegular',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Spacer(),
                        Image.asset(
                          'assets/more.png',
                          height: 20,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: model().user.length,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () {
                              setState(() {
                                selectIndex = index;
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => container1(constraints),));
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: selectIndex == index ? notifire.Getblg2: notifire.getbgcolor11
                              ),
                              child: Text(
                                model().User[index],
                                style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600,
                                  fontFamily: 'InterRegular',
                                  color: selectIndex == index
                                      ?  notifire.getblackcolor
                                      : const Color(0xff727880),
                                ),
                              ),
                            ));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ) :
      Container(
        padding: const EdgeInsets.all(12),
        height: Get.height,
        decoration:  BoxDecoration(
       borderRadius: BorderRadius.circular(12),   color: notifire.getbgcolor11,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(AppContent.evcp,height: 35,),
                const SizedBox(
                  width: 10,
                ),
                 Text(
                  'evcp Inc.',
                  style: TextStyle(
                    fontSize: 16,color: notifire.getblackcolor,
                    fontFamily: 'InterRegular',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                Image.asset(
                  'assets/more.png',
                  height: 20,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),

            ListView.builder(
              shrinkWrap: true,
              itemCount: model().user.length,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      setState(() {
                        selectIndex = index;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: selectIndex == index ? notifire.Getblg2: notifire.getbgcolor11
                      ),
                      child: Text(
                        model().User[index],
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'InterRegular',
                          color: selectIndex == index
                              ? notifire.getblackcolor
                              : const Color(0xff727880),
                        ),
                      ),
                    ));
              },
            ),
          ],
        ),
      );
  }

  Widget container1(constraints) {
    return constraints < 600 ?
    StatefulBuilder(
      builder: (context, setState) {
        return  Scaffold(

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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => login(),));
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
              padding: const EdgeInsets.all(20),
              child: Column(
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
                      Text('Help Center',style: TextStyle(color: greyy,fontSize: 14,fontFamily: 'InterRegular'),),
                      const SizedBox(width: 10,),
                      Container(
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: greyy,),),
                      const SizedBox(width: 10,),
                      Text('User2',style: TextStyle(color: notifire.getblackcolor,fontSize: 14,fontFamily: 'InterRegular'),),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: model().User1.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: notifire.getbgcolor11),
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          mainAxisAlignment:
                          MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(8),
                                    color: model().User1[index],
                                  ),
                                  child: Text(model().User2[index],
                                      style:  const TextStyle(
                                        fontFamily: 'InterRegular',
                                        fontSize: 10,
                                      )),
                                ),
                                const Spacer(),
                                const Text(
                                  '#HN1028-21012022',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xff727880),
                                    fontFamily: 'InterRegular',
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Image.asset(
                                  'assets/more.png',
                                  height: 16,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              model().User3[index],
                              style:  TextStyle(
                                  fontFamily: 'InterRegular',
                                  fontSize: 16,color: notifire.getblackcolor,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              model().User4[index],
                              style: const TextStyle(
                                fontSize: 14,
                                fontFamily: 'InterRegular',
                                color: Color(0xff727880),
                              ),
                            ),
                            index == 1
                                ? const SizedBox(
                              height: 10,
                            )
                                : const SizedBox(),
                            index == 1
                                ? Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(12),
                                color: notifire.Getblg2,
                              ),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Fusce dapibus quam vitae enim consectetur porta',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily:
                                        'InterRegular',
                                        color: Color(
                                            0xff9DA2A7)),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/avatar-6 1.png',
                                        height: 32,
                                      ),
                                      const Spacer(),
                                      const Text(
                                        '1 hour ago',
                                        style: TextStyle(
                                          fontFamily:
                                          'InterRegular',
                                          color: Color(
                                              0xff727880),
                                          fontSize: 12,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                                : const SizedBox(),
                            index == 2
                                ? const SizedBox(
                              height: 10,
                            )
                                : const SizedBox(),
                            index == 2
                                ? Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(12),
                                color: notifire.Getblg2,
                              ),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Mauris laoreet tortor purus, a sollicitudin metus tristique quis.',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily:
                                        'InterRegular',
                                        color: Color(
                                            0xff9DA2A7)),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/avatar-7 1.png',
                                        height: 32,
                                      ),
                                      const Spacer(),
                                      const Text(
                                        '1 hour ago',
                                        style: TextStyle(
                                          fontFamily:
                                          'InterRegular',
                                          color: Color(
                                              0xff727880),
                                          fontSize: 12,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                                : const SizedBox(),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              model().version1[index],
                              style: const TextStyle(
                                color: Color(0xff9DA2A7),
                                fontFamily: 'InterRegular',
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  ListView.builder(
                    shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: model().User1.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: notifire.getbgcolor11),
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          mainAxisAlignment:
                          MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(8),
                                    color: model().versi[index],
                                  ),
                                  child: Text(model().User5[index],
                                      style:  const TextStyle(
                                          fontFamily: 'InterRegular',color: Colors.black
                                      )),
                                ),
                                const Spacer(),
                                const Text(
                                  '#HN1028-21012022',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xff727880),
                                    fontFamily: 'InterRegular',
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Image.asset(
                                  'assets/more.png',
                                  height: 16,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              model().User3[index],
                              style:  TextStyle(
                                  fontFamily: 'InterRegular',
                                  fontSize: 16,color: notifire.getblackcolor,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              model().User4[index],
                              style: const TextStyle(
                                fontSize: 14,
                                fontFamily: 'InterRegular',
                                color: Color(0xff727880),
                              ),
                            ),
                            index == 1
                                ? const SizedBox(
                              height: 10,
                            )
                                : const SizedBox(),
                            index == 1
                                ? Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(12),
                                color: notifire.Getblg2,
                              ),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Fusce dapibus quam vitae enim consectetur porta',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily:
                                        'InterRegular',
                                        color: Color(
                                            0xff9DA2A7)),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/avatar-6 1.png',
                                        height: 32,
                                      ),
                                      const Spacer(),
                                      const Text(
                                        '1 hour ago',
                                        style: TextStyle(
                                          fontFamily:
                                          'InterRegular',
                                          color: Color(
                                              0xff727880),
                                          fontSize: 12,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                                : const SizedBox(),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              model().version1[index],
                              style: const TextStyle(
                                color: Color(0xff9DA2A7),
                                fontFamily: 'InterRegular',
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ) :
    SingleChildScrollView(
      child: Column(
        children: [
          DefaultTabController(
            length: 5,
            child: Column(
              children: [
                Center(
                  child: SizedBox(
                    width: Get.width,
                    child: Container(
                      decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: notifire.getbgcolor11,
                      ),
                      child: Row(
                        children: [
                          TabBar(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            indicatorColor:  notifire.getblackcolor,
                            isScrollable: true,
                            tabs: <Widget>[
                              Tab(
                                  child: Row(
                                    children: [
                                      SvgPicture.asset('assets/menu.svg',height: 16,
                                        color: notifire.getblackcolor, ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                       Text('All Ticket',
                                          style: TextStyle(
                                              color: notifire.getblackcolor,
                                              fontFamily: 'InterRegular',
                                              fontSize: 14)),
                                    ],
                                  )),
                              Tab(
                                  child: Row(
                                    children: [
                                      SvgPicture.asset('assets/Icon Left11.svg',
                                          color: notifire.getblackcolor, height: 16),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                       Text('Opening',
                                          style: TextStyle(
                                              color: notifire.getblackcolor,
                                              fontFamily: 'InterRegular',
                                              fontSize: 14)),
                                    ],
                                  )),
                              Tab(
                                  child: Row(
                                    children: [
                                      SvgPicture.asset('assets/Icon Left12.svg',
                                          color: notifire.getblackcolor, height: 16),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                       Text('In Progress',
                                          style: TextStyle(
                                              color: notifire.getblackcolor,
                                              fontFamily: 'InterRegular',
                                              fontSize: 14)),
                                    ],
                                  )),
                              Tab(
                                  child: Row(
                                    children: [
                                      SvgPicture.asset('assets/Icon Left13.svg',
                                          color: notifire.getblackcolor, height: 16),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                       Text('Draft',
                                          style: TextStyle(
                                              color: notifire.getblackcolor,
                                              fontFamily: 'InterRegular',
                                              fontSize: 14)),
                                    ],
                                  )),
                              Tab(
                                  child: Row(
                                    children: [
                                      SvgPicture.asset('assets/sms-star.svg',
                                          color: notifire.getblackcolor, height: 16),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                       Text('Resolved',
                                          style: TextStyle(
                                              color: notifire.getblackcolor,
                                              fontFamily: 'InterRegular',
                                              fontSize: 14)),
                                    ],
                                  )),
                            ],
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
                              maxWidth: 400,
                              minWidth: 400,
                            ),
                            shadowColor: Colors.grey,
                            color:notifire.getbgcolor11,
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
                                          padding: const EdgeInsets.all(12),
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                               Text(
                                                'Create New Ticket',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontFamily: 'InterRegular',
                                                    fontWeight: FontWeight.w600,
                                                  color: notifire.getblackcolor,),
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    'Date',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontFamily:
                                                        'InterRegular',
                                                        color:
                                                        Color(0xff727880),fontWeight: FontWeight.w600),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    height: 45,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color: grey2,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(15)),
                                                    child: TextField(
                                                      onTap: () {
                                                        buildDialog();
                                                      },
                                                      controller:
                                                      dateController1,
                                                      readOnly: true,
                                                      keyboardType:
                                                      TextInputType
                                                          .datetime,
                                                      decoration:
                                                      InputDecoration(
                                                        suffixIcon: Image.asset(
                                                            AppContent.calendar,
                                                            scale: 3.5,
                                                            color: const Color(
                                                                0xff9DA2A7)),
                                                        hintText:
                                                        "${selectedDate1
                                                            .day}-${selectedDate1
                                                            .month}-${selectedDate1
                                                            .year}",
                                                        hintStyle: TextStyle(
                                                            color: notifire
                                                                .getblackcolor,
                                                            fontFamily:
                                                            'UrbanistBold',
                                                            fontSize: 15),
                                                        border: OutlineInputBorder(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                12),
                                                            borderSide:
                                                            BorderSide(
                                                                color:
                                                                grey2)),
                                                        enabledBorder:
                                                        OutlineInputBorder(
                                                            borderSide:
                                                            BorderSide
                                                                .none,
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                12)),
                                                        focusedBorder:
                                                        OutlineInputBorder(
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
                                              const Text(
                                                'Ticket Name',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontFamily: 'InterRegular',
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xff727880)),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Container(
                                                height: 45,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        12),
                                                    border: Border.all(
                                                        color: const Color(
                                                            0xffEEEEEE))),
                                                child: TextField(
                                                  style:  TextStyle(color: notifire.getblackcolor),
                                                  decoration: InputDecoration(
                                                    suffix: const Text(
                                                        'Less than 200 words',
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xff9DA2A7),
                                                            fontFamily:
                                                            'InterRegular',
                                                            fontSize: 12)),
                                                    hintText:
                                                    'Ex: I can access internet',
                                                    hintStyle: const TextStyle(
                                                        color:
                                                        Color(0xffC6C8CB),
                                                        fontSize: 12),
                                                    contentPadding:
                                                    const EdgeInsets.only(
                                                        left: 20,
                                                        right: 20),
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(12),
                                                        borderSide: BorderSide(
                                                            color: grey2)),
                                                    enabledBorder:
                                                    OutlineInputBorder(
                                                        borderSide:
                                                        BorderSide.none,
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            12)),
                                                    focusedBorder:
                                                    OutlineInputBorder(
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
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              const Text(
                                                'Ticket Detail',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'InterRegular',
                                                  color: Color(0xff727880),fontWeight: FontWeight.w600
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        12),
                                                    border: Border.all(
                                                        color: const Color(
                                                            0xffEEEEEE))),
                                                child: TextField(
                                                  keyboardType:
                                                  TextInputType.multiline,
                                                  maxLines: 4,
                                                  style: TextStyle(
                                                      color: notifire
                                                          .getblackcolor),
                                                  decoration:
                                                  const InputDecoration(
                                                    hintText:
                                                    "Typing detail your issues",
                                                    hintStyle: TextStyle(
                                                        color:
                                                        Color(0xffC6C8CB)),
                                                    focusedBorder:
                                                    OutlineInputBorder(
                                                        borderSide:
                                                        BorderSide
                                                            .none),
                                                    disabledBorder:
                                                    OutlineInputBorder(
                                                        borderSide:
                                                        BorderSide
                                                            .none),
                                                    enabledBorder:
                                                    OutlineInputBorder(
                                                        borderSide:
                                                        BorderSide
                                                            .none),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              InkWell(
                                                onTap: () {},
                                                child: Container(
                                                  width: 186,
                                                  padding:
                                                  const EdgeInsets.all(12),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: const Color(
                                                            0xffEEEEEE)),
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        12),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Image.asset(
                                                        'assets/document-upload.png',
                                                        height: 16,
                                                      ),
                                                      const SizedBox(
                                                        width: 8,
                                                      ),
                                                      const Text(
                                                        'Upload Your Attach',
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            color: Color(
                                                                0xff727880),
                                                            fontWeight:
                                                            FontWeight.w600,
                                                            fontFamily:
                                                            'InterRegular'),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    height: 18,
                                                    width: 18,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          5),
                                                      color: notifire.Getblg2
                                                    ),
                                                    child: Checkbox(
                                                        side: const BorderSide(
                                                            style: BorderStyle
                                                                .none),
                                                        visualDensity:
                                                        const VisualDensity(
                                                            horizontal: -4),
                                                        activeColor:
                                                        const Color(
                                                            0xff595FE5),
                                                        shape:
                                                        RoundedRectangleBorder(
                                                          side: const BorderSide(
                                                              color: Colors
                                                                  .transparent),
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(5),
                                                        ),
                                                        value: isActive,
                                                        onChanged: (val) {
                                                          setState(() {
                                                            isActive = val!;
                                                          });
                                                        }),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                   Text(
                                                    'Save as Draft',
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontFamily:
                                                        'InterRegular',
                                                        fontWeight:
                                                        FontWeight.w400,
                                                      color: notifire.getblackcolor,),
                                                  ),
                                                  const Spacer(),
                                                  InkWell(
                                                    onTap: () {
                                                      Get.back();
                                                    },
                                                    child: Container(
                                                      padding:
                                                      const EdgeInsets.all(
                                                          12),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(12),color: notifire.getbgcolor10
                                                       ),
                                                      child: const Center(
                                                          child: Text(
                                                            'Cancel',
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                FontWeight.w600,
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
                                                      const EdgeInsets.all(
                                                          12),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(12),
                                                          color: const Color(
                                                              0xff595FE5)),
                                                      child: const Center(
                                                          child: Text('Save',
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                  'InterRegular',
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 14,
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
                              padding: const EdgeInsets.all(11),
                              decoration: BoxDecoration(
                                  color: const Color(0xff595FE5),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Row(children: [
                                Image.asset('assets/add.png', scale: 4),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  'Create Order',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'InterRegular',
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                )
                              ]),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                SizedBox(
                  height: Get.height,
                  child: NestedScrollView(
                      headerSliverBuilder: (context, innerBoxIsScrolled) {
                        return [];
                      },
                      body: Row(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: model().User1.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: const EdgeInsets.only(bottom: 20),
                                  padding: const EdgeInsets.all(18),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                    color: notifire.getbgcolor11,),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(8),
                                              color: model().User1[index],
                                            ),
                                            child: Text(model().User2[index],
                                                style:  const TextStyle(
                                                  fontFamily: 'InterRegular',
                                                  fontSize: 10,
                                                )),
                                          ),
                                          const Spacer(),
                                          const Text(
                                            '#HN1028-21012022',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xff727880),
                                              fontFamily: 'InterRegular',
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Image.asset(
                                            'assets/more.png',
                                            height: 16,
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        model().User3[index],
                                        style:  TextStyle(
                                            fontFamily: 'InterRegular',
                                            fontSize: 16,color: notifire.getblackcolor,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        model().User4[index],
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'InterRegular',
                                          color: Color(0xff727880),
                                        ),
                                      ),
                                      index == 1
                                          ? const SizedBox(
                                        height: 10,
                                      )
                                          : const SizedBox(),
                                      index == 1
                                          ? Container(
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(12),
                                          color: notifire.Getblg2,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Fusce dapibus quam vitae enim consectetur porta',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily:
                                                  'InterRegular',
                                                  color: Color(
                                                      0xff9DA2A7)),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  'assets/avatar-6 1.png',
                                                  height: 32,
                                                ),
                                                const Spacer(),
                                                const Text(
                                                  '1 hour ago',
                                                  style: TextStyle(
                                                    fontFamily:
                                                    'InterRegular',
                                                    color: Color(
                                                        0xff727880),
                                                    fontSize: 12,
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                          : const SizedBox(),
                                      index == 2
                                          ? const SizedBox(
                                        height: 10,
                                      )
                                          : const SizedBox(),
                                      index == 2
                                          ? Container(
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(12),
                                          color: notifire.Getblg2,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Mauris laoreet tortor purus, a sollicitudin metus tristique quis.',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily:
                                                  'InterRegular',
                                                  color: Color(
                                                      0xff9DA2A7)),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  'assets/avatar-7 1.png',
                                                  height: 32,
                                                ),
                                                const Spacer(),
                                                const Text(
                                                  '1 hour ago',
                                                  style: TextStyle(
                                                    fontFamily:
                                                    'InterRegular',
                                                    color: Color(
                                                        0xff727880),
                                                    fontSize: 12,
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                          : const SizedBox(),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        model().version1[index],
                                        style: const TextStyle(
                                          color: Color(0xff9DA2A7),
                                          fontFamily: 'InterRegular',
                                          fontSize: 12,
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: model().User1.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: const EdgeInsets.only(bottom: 20),
                                  padding: const EdgeInsets.all(18),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: notifire.getbgcolor11),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(8),
                                              color: model().versi[index],
                                            ),
                                            child: Text(model().User5[index],
                                                style:  const TextStyle(
                                                  fontFamily: 'InterRegular',
                                                  fontSize: 10,
                                                )),
                                          ),
                                          const Spacer(),
                                          const Text(
                                            '#HN1028-21012022',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xff727880),
                                              fontFamily: 'InterRegular',
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Image.asset(
                                            'assets/more.png',
                                            height: 16,
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        model().User3[index],
                                        style:  TextStyle(
                                            fontFamily: 'InterRegular',
                                            fontSize: 16,color: notifire.getblackcolor,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        model().User4[index],
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'InterRegular',
                                          color: Color(0xff727880),
                                        ),
                                      ),
                                      index == 1
                                          ? const SizedBox(
                                        height: 10,
                                      )
                                          : const SizedBox(),
                                      index == 1
                                          ? Container(
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(12),
                                          color:  notifire.Getblg2,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Fusce dapibus quam vitae enim consectetur porta',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily:
                                                  'InterRegular',
                                                  color: Color(
                                                      0xff9DA2A7)),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  'assets/avatar-6 1.png',
                                                  height: 32,
                                                ),
                                                const Spacer(),
                                                const Text(
                                                  '1 hour ago',
                                                  style: TextStyle(
                                                    fontFamily:
                                                    'InterRegular',
                                                    color: Color(
                                                        0xff727880),
                                                    fontSize: 12,
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                          : const SizedBox(),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        model().version1[index],
                                        style: const TextStyle(
                                          color: Color(0xff9DA2A7),
                                          fontFamily: 'InterRegular',
                                          fontSize: 12,
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      )),
                ),
// Transform.translate(
//   offset: Offset(-20, -110),
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.end,
//     crossAxisAlignment: CrossAxisAlignment.end,
//     children: [
//       FloatingActionButton(
//         backgroundColor: Color(0xff595FE5),
//         child: Image.asset('assets/message12.png',height: 30),
//         onPressed: () {
//
//       },),
//     ],
//   ),
// )
              ],
            ),
          ),
        ],
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
}