// ignore_for_file: deprecated_member_use, camel_case_types, non_constant_identifier_names

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../confing/Rtl.dart';
import '../../confing/colors.dart';

import '../../confing/list.dart';
import '../../confing/notifier.dart';
import '../../controller/page_controller.dart';
import '../Dashboard/Dashboard_main.dart';

import '../Messages/Social.dart';

import '../login/Account Info.dart';
import '../login/Billing Details.dart';
import '../login/Billing_Details_2.dart';
import '../login/sign_up.dart';
import '../login/login.dart';

class mail extends StatefulWidget {
  const mail({super.key});

  @override
  State<mail> createState() => _mailState();
}

class _mailState extends State<mail> {
  bool profilePage = false;
  List checkBox = [];
  int selectIndex = 0;
  int selectIndex1 = 0;
  late ColorNotifier notifire;

  bool isActive = false;
  final DataTableSource _data = MyData();
  List Channels = [
    'Important',
    'Family',
    'Social',
    'Friends',
  ];
  List Notification = [
    'assets/tag-right.png',
    'assets/tag-right.png',
    'assets/tag-right.png',
    'assets/tag-right.png',
  ];

  bool container = false;
  bool Compose = false;
  bool isdark = false;
  SampleItem? selectedMenu;
  InboxController inboxController = Get.put(InboxController());
  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifier>(context, listen: true);
    return GetBuilder<InboxController>(
      builder: (inboxController) {
        return LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 600) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    container1(context, constraints.maxWidth),
                  ],
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            firstContainer(
                                size: constraints.maxWidth, context: context),
                          ],
                        ),
                      ),
                    ),
                  ],
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
                                size: constraints.maxWidth, context: context),
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
      },
    );
  }

  Widget firstContainer({required double size, context}) {
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
                'Mail',
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
                'Mail',
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
              Expanded(
                flex: 2,
                child: container1(context, size),
              ),
              const SizedBox(
                width: 20,
              ),
              size < 600
                  ? const SizedBox()
                  : Expanded(
                      flex: 6,
                      child: container
                          ? container3(size)
                          : Compose
                              ? container5(size)
                              : container2(size),
                    ),
              const SizedBox(
                width: 10,
              ),
              profilePage
                  ? Expanded(flex: 2, child: container4(size))
                  : const SizedBox(),
            ],
          ),
        ],
      ),
    );
  }

  Widget container1(context, double size) {
    if (size < 600) {
      return Container(
        color: notifire.getbgcolor10,
        child: Padding(
          padding: const EdgeInsets.all(10),
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
                    'Mail',
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
                    'Mail',
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
                    color: notifire.getbgcolor11,
                    borderRadius: BorderRadius.circular(12)),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => container5(size),
                              )),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: const Color(0xff595FE5)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/edit3.png',
                                  height: 16,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  'Compose',
                                  style: TextStyle(
                                      fontFamily: 'InterRegular',
                                      color: Colors.white,
                                      fontSize: 16),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: model().mail2.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => container2(size),
                                  )),
                              child: ListTile(
                                leading: Image.asset(model().mail[index],
                                    scale: 3,
                                    color: selectIndex == index
                                        ? const Color(0xff595FE5)
                                        : const Color(0xff9DA2A7)),
                                title: Transform.translate(
                                  offset: const Offset(-20, 0),
                                  child: Text(model().mail2[index],
                                      style: TextStyle(
                                          fontFamily: 'InterRegular',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: selectIndex == index
                                              ? const Color(0xff595FE5)
                                              : const Color(0xff9DA2A7))),
                                ),
                                trailing: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(6),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: notifire.Getblg2),
                                      child: Text(
                                        model().mail1[index],
                                        style: TextStyle(
                                            color: selectIndex == index
                                                ? const Color(0xff595FE5)
                                                : const Color(0xff727880),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'InterRegular'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const StepProgressIndicator(
                          totalSteps: 100,
                          currentStep: 32,
                          size: 5,
                          padding: 0,
                          selectedColor: Color(0xff7DC066),
                          unselectedColor: Color(0xffEEEEEE),
                          roundedEdges: Radius.circular(10),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text('1.26 GB of 25 GB',
                            style: TextStyle(
                                fontFamily: 'InterRegular',
                                color: Color(0xff727880))),
                        const SizedBox(
                          height: 5,
                        ),
                        ExpansionTile(
                          initiallyExpanded: true,
                          controlAffinity: ListTileControlAffinity.platform,
                          tilePadding: EdgeInsets.zero,
                          trailing: const Icon(
                            Icons.add,
                            size: 20,
                            color: Color(0xff727880),
                          ),
                          title: const Text(
                            'Labels',
                            style: TextStyle(
                                fontFamily: 'InterRegular',
                                fontSize: 15,
                                color: Color(0xff727880)),
                          ),
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: 4,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectIndex1 = index;
                                    });
                                  },
                                  child: ListTile(
                                    leading: Image.asset(Notification[index],
                                        height: 18,
                                        color: index == 0
                                            ? const Color(0xffF8BEC1)
                                            : index == 1
                                                ? const Color(0xffB0E4C8)
                                                : index == 2
                                                    ? const Color(0xffD9B7FB)
                                                    : index == 3
                                                        ? const Color(
                                                            0xffFFC9AC)
                                                        : Colors.white),
                                    title: Transform.translate(
                                      offset: const Offset(-20, 0),
                                      child: Text(Channels[index],
                                          style: const TextStyle(
                                              fontFamily: 'InterRegular',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xff727880))),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        ExpansionTile(
                          initiallyExpanded: true,
                          controlAffinity: ListTileControlAffinity.platform,
                          tilePadding: EdgeInsets.zero,
                          title: const Text(
                            'Contacts',
                            style: TextStyle(
                                fontFamily: 'InterRegular',
                                fontSize: 15,
                                color: Color(0xff727880)),
                          ),
                          trailing: const Icon(
                            Icons.add,
                            size: 20,
                            color: Color(0xff727880),
                          ),
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: chatList.length,
                              itemBuilder: (context, index) {
                                ChatList data = chatList[index];
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectIndex = index;
                                    });
                                  },
                                  child: ListTile(
                                    leading: Image.asset(data.image,
                                        height: 40, width: 40),
                                    title: Text(data.title,
                                        style: const TextStyle(
                                            fontFamily: 'InterRegular',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xff727880))),
                                    trailing: Column(
                                      children: [
                                        index == 1
                                            ? Transform.translate(
                                                offset: const Offset(10, 15),
                                                child: Container(
                                                  width: 18,
                                                  height: 18,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xffE5646C),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                  child: const Center(
                                                      child: Text('4',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'InterRegular',
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 10))),
                                                ),
                                              )
                                            : const SizedBox(),
                                        index == 4
                                            ? Transform.translate(
                                                offset: const Offset(10, 15),
                                                child: Container(
                                                  width: 18,
                                                  height: 18,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xffE5646C),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                  child: const Center(
                                                      child: Text('3',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'InterRegular',
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 10))),
                                                ),
                                              )
                                            : const SizedBox(),
                                        index == 7
                                            ? Transform.translate(
                                                offset: const Offset(10, 15),
                                                child: Container(
                                                  width: 18,
                                                  height: 18,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xffE5646C),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                  child: const Center(
                                                      child: Text('26',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'InterRegular',
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 10))),
                                                ),
                                              )
                                            : const SizedBox(),
                                        index == 12
                                            ? Transform.translate(
                                                offset: const Offset(10, 15),
                                                child: Container(
                                                  width: 18,
                                                  height: 18,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xffE5646C),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                  child: const Center(
                                                      child: Text('70',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'InterRegular',
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 10))),
                                                ),
                                              )
                                            : const SizedBox(),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
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
      return Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            color: notifire.getbgcolor11,
            borderRadius: BorderRadius.circular(12)),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      if (Compose == false) {
                        Compose = true;
                      } else {
                        Compose = false;
                      }
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color(0xff595FE5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/edit3.png',
                          height: 16,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Compose',
                          style: TextStyle(
                              fontFamily: 'InterRegular',
                              color: Colors.white,
                              fontSize: 16),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: model().mail2.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          setState(() {
                            selectIndex = index;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            children: [
                              Image.asset(model().mail[index],
                                  scale: 3,
                                  color: selectIndex == index
                                      ? const Color(0xff595FE5)
                                      : const Color(0xff9DA2A7)),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(model().mail2[index],
                                  style: TextStyle(
                                      fontFamily: 'InterRegular',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: selectIndex == index
                                          ? const Color(0xff595FE5)
                                          : const Color(0xff9DA2A7))),
                              const Spacer(),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: notifire.Getblg2),
                                    child: Text(
                                      model().mail1[index],
                                      style: TextStyle(
                                          color: selectIndex == index
                                              ? const Color(0xff595FE5)
                                              : const Color(0xff727880),
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ));
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                const StepProgressIndicator(
                  totalSteps: 100,
                  currentStep: 32,
                  size: 5,
                  padding: 0,
                  selectedColor: Color(0xff7DC066),
                  unselectedColor: Color(0xffEEEEEE),
                  roundedEdges: Radius.circular(10),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text('1.26 GB of 25 GB',
                    style: TextStyle(
                        fontFamily: 'InterRegular', color: Color(0xff727880))),
                const SizedBox(
                  height: 5,
                ),
                ExpansionTile(
                  initiallyExpanded: true,
                  controlAffinity: ListTileControlAffinity.platform,
                  tilePadding: EdgeInsets.zero,
                  trailing: const Icon(
                    Icons.add,
                    size: 20,
                    color: Color(0xff727880),
                  ),
                  title: const Text(
                    'Labels',
                    style: TextStyle(
                        fontFamily: 'InterRegular',
                        fontSize: 15,
                        color: Color(0xff727880)),
                  ),
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () {
                              setState(() {
                                selectIndex1 = index;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Row(
                                children: [
                                  Image.asset(Notification[index],
                                      height: 18,
                                      color: index == 0
                                          ? const Color(0xffF8BEC1)
                                          : index == 1
                                              ? const Color(0xffB0E4C8)
                                              : index == 2
                                                  ? const Color(0xffD9B7FB)
                                                  : index == 3
                                                      ? const Color(0xffFFC9AC)
                                                      : Colors.white),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(Channels[index],
                                      style: const TextStyle(
                                          fontFamily: 'InterRegular',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff727880))),
                                ],
                              ),
                            ));
                      },
                    ),
                  ],
                ),
                ExpansionTile(
                  initiallyExpanded: true,
                  controlAffinity: ListTileControlAffinity.platform,
                  tilePadding: EdgeInsets.zero,
                  title: const Text(
                    'Contacts',
                    style: TextStyle(
                        fontFamily: 'InterRegular',
                        fontSize: 15,
                        color: Color(0xff727880)),
                  ),
                  trailing: const Icon(
                    Icons.add,
                    size: 20,
                    color: Color(0xff727880),
                  ),
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: chatList.length,
                      itemBuilder: (context, index) {
                        ChatList data = chatList[index];
                        return InkWell(
                            onTap: () {
                              setState(() {
                                selectIndex = index;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                children: [
                                  Image.asset(data.image,
                                      height: 40, width: 40),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text(data.title,
                                      style: const TextStyle(
                                          fontFamily: 'InterRegular',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff727880))),
                                  const Spacer(),
                                  Column(
                                    children: [
                                      index == 1
                                          ? Container(
                                              width: 18,
                                              height: 18,
                                              decoration: BoxDecoration(
                                                color: const Color(0xffE5646C),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: const Center(
                                                  child: Text('4',
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'InterRegular',
                                                          color: Colors.white,
                                                          fontSize: 10))),
                                            )
                                          : const SizedBox(),
                                      index == 4
                                          ? Container(
                                              width: 18,
                                              height: 18,
                                              decoration: BoxDecoration(
                                                color: const Color(0xffE5646C),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: const Center(
                                                  child: Text('3',
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'InterRegular',
                                                          color: Colors.white,
                                                          fontSize: 10))),
                                            )
                                          : const SizedBox(),
                                      index == 7
                                          ? Container(
                                              width: 18,
                                              height: 18,
                                              decoration: BoxDecoration(
                                                color: const Color(0xffE5646C),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: const Center(
                                                  child: Text('26',
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'InterRegular',
                                                          color: Colors.white,
                                                          fontSize: 10))),
                                            )
                                          : const SizedBox(),
                                      index == 12
                                          ? Container(
                                              width: 18,
                                              height: 18,
                                              decoration: BoxDecoration(
                                                color: const Color(0xffE5646C),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: const Center(
                                                  child: Text('70',
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'InterRegular',
                                                          color: Colors.white,
                                                          fontSize: 10))),
                                            )
                                          : const SizedBox(),
                                    ],
                                  ),
                                ],
                              ),
                            ));
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  Widget container2(size) {
    return size < 600
        ? DefaultTabController(
            length: 4,
            initialIndex: 0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: StatefulBuilder(
                builder: (context, setState) {
                  return Scaffold(
                    backgroundColor: notifire.getbgcolor10,
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
                          itemBuilder: (context) =>
                              <PopupMenuEntry<SampleItem>>[
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
                                                        color: notifire
                                                            .getblackcolor,
                                                        fontSize: 14,
                                                        fontFamily:
                                                            'InterRegular',
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
                          itemBuilder: (context) =>
                              <PopupMenuEntry<SampleItem>>[
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
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
                                                        Text(
                                                            model()
                                                                .Popo1[index],
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
                                                          BorderRadius.circular(
                                                              16),
                                                      color: const Color(
                                                          0xff595FE5)),
                                                )
                                              ],
                                            );
                                          },
                                          separatorBuilder:
                                              (BuildContext context,
                                                  int index) {
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
                          itemBuilder: (context) =>
                              <PopupMenuEntry<SampleItem>>[
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(12),
                                                  decoration: BoxDecoration(
                                                      color:
                                                          notifire.getbgcolor10,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: Center(
                                                      child: Image.asset(
                                                    model().popo[index],
                                                    height: 16,
                                                    color:
                                                        notifire.getblackcolor,
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
                                                          BorderRadius.circular(
                                                              16),
                                                      color: const Color(
                                                          0xff595FE5)),
                                                )
                                              ],
                                            );
                                          },
                                          separatorBuilder:
                                              (BuildContext context,
                                                  int index) {
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
                            child: Center(
                                child: Image.asset('assets/avatar-6 1.png')),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
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
                                        color: notifire.getblackcolor,
                                        height: 18),
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
                                        color: notifire.getblackcolor,
                                        height: 18),
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
                                        color: notifire.getblackcolor,
                                        height: 18),
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
                                        color: notifire.getblackcolor,
                                        height: 18),
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
                              child:
                                  StatefulBuilder(builder: (context, setState) {
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
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              enabled: false,
                              value: SampleItem.itemOne,
                              child: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                    color: notifire.Getblg2,
                                    borderRadius: BorderRadius.circular(6)),
                                child: TextField(
                                  style:
                                      TextStyle(color: notifire.getblackcolor),
                                  decoration: InputDecoration(
                                    hintText: 'Search',
                                    prefixIcon: Image.asset(
                                        'assets/search-normal.png',
                                        scale: 4,
                                        color: const Color(0xff9DA2A7)),
                                    hintStyle: TextStyle(
                                        color: notifire.getblackcolor),
                                    contentPadding: const EdgeInsets.only(
                                        left: 20, right: 20),
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
                      child: Theme(
                        data: Theme.of(context).copyWith(
                            cardColor: notifire.getbgcolor11,
                            scrollbarTheme: const ScrollbarThemeData(
                                thumbVisibility:
                                    MaterialStatePropertyAll(false),
                                thickness: MaterialStatePropertyAll(0),
                                trackVisibility:
                                    MaterialStatePropertyAll(false))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => container3(size),
                                  )),
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: PaginatedDataTable(
                                  source: _data,
                                  controller: PageController(),
                                  header: Row(
                                    children: [
                                      Container(
                                        height: 18,
                                        width: 18,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: notifire.getbgcolor10,
                                        ),
                                        child: Checkbox(
                                            side: const BorderSide(
                                                style: BorderStyle.none),
                                            visualDensity: const VisualDensity(
                                                horizontal: -4),
                                            activeColor:
                                                const Color(0xff595FE5),
                                            shape: RoundedRectangleBorder(
                                              side: const BorderSide(
                                                  color: Colors.transparent),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            value: isActive,
                                            onChanged: (val) {
                                              setState(() {
                                                isActive = val!;
                                              });
                                            }),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Image.asset(
                                          'assets/refresh-left-square.png',
                                          height: 16,
                                          color: const Color(0xff9DA2A7)),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Image.asset('assets/archive1.png',
                                          height: 16,
                                          color: const Color(0xff9DA2A7)),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Image.asset('assets/Read.png',
                                          height: 25,
                                          color: const Color(0xff9DA2A7)),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Image.asset(
                                          'assets/warning-2Iquestion.png',
                                          height: 16,
                                          color: const Color(0xff9DA2A7)),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Image.asset('assets/read1.png',
                                          height: 16,
                                          color: const Color(0xff9DA2A7)),
                                    ],
                                  ),
                                  columns: <DataColumn>[
                                    DataColumn(
                                      label: Expanded(
                                        child: Row(
                                          children: [
                                            Transform.scale(
                                              scale: 1.2,
                                              child: Container(
                                                height: 18,
                                                width: 18,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color:
                                                        notifire.getbgcolor11),
                                                child: Checkbox(
                                                    side: const BorderSide(
                                                        style:
                                                            BorderStyle.none),
                                                    visualDensity:
                                                        const VisualDensity(
                                                            horizontal: -4),
                                                    activeColor:
                                                        const Color(0xff595FE5),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      side: const BorderSide(
                                                          color: Colors
                                                              .transparent),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    value: isActive,
                                                    onChanged: (val) {
                                                      setState(() {
                                                        isActive = val!;
                                                      });
                                                    }),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Expanded(
                                        child: Row(
                                          children: [
                                            const Text(
                                              'No.',
                                              style: TextStyle(
                                                  fontFamily: 'InterRegular',
                                                  color: Color(0xff9DA2A7)),
                                            ),
                                            Image.asset(
                                              'assets/arrow-up.png',
                                              scale: 3.5,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Expanded(
                                        child: Row(
                                          children: [
                                            const Text(
                                              'SKU',
                                              style: TextStyle(
                                                  fontFamily: 'InterRegular',
                                                  color: Color(0xff9DA2A7)),
                                            ),
                                            Image.asset(
                                              'assets/arrow-up.png',
                                              scale: 3.5,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Expanded(
                                        child: Row(
                                          children: [
                                            const Text(
                                              'Product Name',
                                              style: TextStyle(
                                                  fontFamily: 'InterRegular',
                                                  color: Color(0xff9DA2A7)),
                                            ),
                                            Image.asset(
                                              'assets/arrow-up.png',
                                              scale: 3.5,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Expanded(
                                        child: Row(
                                          children: [
                                            const Text(
                                              'Last Updated',
                                              style: TextStyle(
                                                  fontFamily: 'InterRegular',
                                                  color: Color(0xff9DA2A7)),
                                            ),
                                            Image.asset(
                                              'assets/arrow-up.png',
                                              scale: 3.5,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Expanded(
                                        child: Row(
                                          children: [
                                            const Text(
                                              'Category',
                                              style: TextStyle(
                                                  fontFamily: 'InterRegular',
                                                  color: Color(0xff9DA2A7)),
                                            ),
                                            Image.asset(
                                              'assets/arrow-up.png',
                                              scale: 3.5,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Expanded(
                                        child: Row(
                                          children: [
                                            const Text(
                                              'Status',
                                              style: TextStyle(
                                                  fontFamily: 'InterRegular',
                                                  color: Color(0xff9DA2A7)),
                                            ),
                                            Image.asset(
                                              'assets/arrow-up.png',
                                              scale: 3.5,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                  columnSpacing: 50,
                                  horizontalMargin: 30,
                                  rowsPerPage: 15,
                                  arrowHeadColor: Colors.black,
                                  showCheckboxColumn: true,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        : DefaultTabController(
            length: 4,
            initialIndex: 0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Scaffold(
                backgroundColor: notifire.getbgcolor10,
                body: SingleChildScrollView(
                  child: Theme(
                    data: Theme.of(context).copyWith(
                        scrollbarTheme: const ScrollbarThemeData(
                            thumbVisibility: MaterialStatePropertyAll(false),
                            thickness: MaterialStatePropertyAll(0),
                            trackVisibility: MaterialStatePropertyAll(false))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Theme(
                          data: Theme.of(context).copyWith(
                              scrollbarTheme: const ScrollbarThemeData(
                                  thumbVisibility:
                                      MaterialStatePropertyAll(false),
                                  thickness: MaterialStatePropertyAll(0),
                                  trackVisibility:
                                      MaterialStatePropertyAll(false))),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: notifire.getbgcolor11),
                            child: Row(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 18,
                                  width: 18,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: const Color(0xffF5F5F5),
                                  ),
                                  child: Checkbox(
                                      side: const BorderSide(
                                          style: BorderStyle.none),
                                      visualDensity:
                                          const VisualDensity(horizontal: -4),
                                      activeColor: const Color(0xff595FE5),
                                      shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                            color: Colors.transparent),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      value: isActive,
                                      onChanged: (val) {
                                        setState(() {
                                          isActive = val!;
                                        });
                                      }),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Image.asset('assets/refresh-left-square.png',
                                    height: 16, color: const Color(0xff9DA2A7)),
                                const SizedBox(
                                  width: 15,
                                ),
                                Image.asset('assets/archive1.png',
                                    height: 16, color: const Color(0xff9DA2A7)),
                                const SizedBox(
                                  width: 15,
                                ),
                                Image.asset('assets/Read.png',
                                    height: 25, color: const Color(0xff9DA2A7)),
                                const SizedBox(
                                  width: 15,
                                ),
                                Image.asset('assets/warning-2Iquestion.png',
                                    height: 16, color: const Color(0xff9DA2A7)),
                                const SizedBox(
                                  width: 15,
                                ),
                                Image.asset('assets/read1.png',
                                    height: 16, color: const Color(0xff9DA2A7)),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              if (container == false) {
                                container = true;
                              } else {
                                container = false;
                              }
                            });
                          },
                          child: Theme(
                            data: Theme.of(context).copyWith(
                                cardColor: notifire.getbgcolor11,
                                dataTableTheme: DataTableThemeData(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20)))),
                            child: PaginatedDataTable(
                              source: _data,
                              controller: PageController(),
                              columns: <DataColumn>[
                                DataColumn(
                                  label: Expanded(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          Transform.scale(
                                            scale: 1.2,
                                            child: Container(
                                              height: 18,
                                              width: 18,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: const Color(0xffF5F5F5),
                                              ),
                                              child: Checkbox(
                                                  side: const BorderSide(
                                                      style: BorderStyle.none),
                                                  visualDensity:
                                                      const VisualDensity(
                                                          horizontal: -4),
                                                  activeColor:
                                                      const Color(0xff595FE5),
                                                  shape: RoundedRectangleBorder(
                                                    side: const BorderSide(
                                                        color:
                                                            Colors.transparent),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  value: isActive,
                                                  onChanged: (val) {
                                                    setState(() {
                                                      isActive = val!;
                                                    });
                                                  }),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: Expanded(
                                    child: Row(
                                      children: [
                                        const Text(
                                          'No.',
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              color: Color(0xff9DA2A7)),
                                        ),
                                        Image.asset(
                                          'assets/arrow-up.png',
                                          scale: 3.5,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: Expanded(
                                    child: Row(
                                      children: [
                                        const Text(
                                          'SKU',
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              color: Color(0xff9DA2A7)),
                                        ),
                                        Image.asset(
                                          'assets/arrow-up.png',
                                          scale: 3.5,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: Expanded(
                                    child: Row(
                                      children: [
                                        const Text(
                                          'Product Name',
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              color: Color(0xff9DA2A7)),
                                        ),
                                        Image.asset(
                                          'assets/arrow-up.png',
                                          scale: 3.5,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: Expanded(
                                    child: Row(
                                      children: [
                                        const Text(
                                          'Last Updated',
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              color: Color(0xff9DA2A7)),
                                        ),
                                        Image.asset(
                                          'assets/arrow-up.png',
                                          scale: 3.5,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: Expanded(
                                    child: Row(
                                      children: [
                                        const Text(
                                          'Category',
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              color: Color(0xff9DA2A7)),
                                        ),
                                        Image.asset(
                                          'assets/arrow-up.png',
                                          scale: 3.5,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: Expanded(
                                    child: Row(
                                      children: [
                                        const Text(
                                          'Status',
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              color: Color(0xff9DA2A7)),
                                        ),
                                        Image.asset(
                                          'assets/arrow-up.png',
                                          scale: 3.5,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                              columnSpacing: 50,
                              horizontalMargin: 30,
                              rowsPerPage: 15,
                              arrowHeadColor: Colors.black,
                              showCheckboxColumn: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }

  Widget container3(size) {
    return size < 600
        ? DefaultTabController(
            length: 4,
            initialIndex: 0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: StatefulBuilder(
                builder: (context, setState) {
                  return Scaffold(
                    backgroundColor: notifire.getbgcolor10,
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
                          itemBuilder: (context) =>
                              <PopupMenuEntry<SampleItem>>[
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
                                                        color: notifire
                                                            .getblackcolor,
                                                        fontSize: 14,
                                                        fontFamily:
                                                            'InterRegular',
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
                          itemBuilder: (context) =>
                              <PopupMenuEntry<SampleItem>>[
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
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
                                                        Text(
                                                            model()
                                                                .Popo1[index],
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
                                                          BorderRadius.circular(
                                                              16),
                                                      color: const Color(
                                                          0xff595FE5)),
                                                )
                                              ],
                                            );
                                          },
                                          separatorBuilder:
                                              (BuildContext context,
                                                  int index) {
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
                          itemBuilder: (context) =>
                              <PopupMenuEntry<SampleItem>>[
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(12),
                                                  decoration: BoxDecoration(
                                                      color:
                                                          notifire.getbgcolor10,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: Center(
                                                      child: Image.asset(
                                                    model().popo[index],
                                                    height: 16,
                                                    color:
                                                        notifire.getblackcolor,
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
                                                          BorderRadius.circular(
                                                              16),
                                                      color: const Color(
                                                          0xff595FE5)),
                                                )
                                              ],
                                            );
                                          },
                                          separatorBuilder:
                                              (BuildContext context,
                                                  int index) {
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
                            child: Center(
                                child: Image.asset('assets/avatar-6 1.png')),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
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
                                        color: notifire.getblackcolor,
                                        height: 18),
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
                                        color: notifire.getblackcolor,
                                        height: 18),
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
                                        color: notifire.getblackcolor,
                                        height: 18),
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
                                        color: notifire.getblackcolor,
                                        height: 18),
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
                              child:
                                  StatefulBuilder(builder: (context, setState) {
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
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              enabled: false,
                              value: SampleItem.itemOne,
                              child: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                    color: notifire.Getblg2,
                                    borderRadius: BorderRadius.circular(6)),
                                child: TextField(
                                  style:
                                      TextStyle(color: notifire.getblackcolor),
                                  decoration: InputDecoration(
                                    hintText: 'Search',
                                    prefixIcon: Image.asset(
                                        'assets/search-normal.png',
                                        scale: 4,
                                        color: const Color(0xff9DA2A7)),
                                    hintStyle: TextStyle(
                                        color: notifire.getblackcolor),
                                    contentPadding: const EdgeInsets.only(
                                        left: 20, right: 20),
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
                      child: Theme(
                        data: Theme.of(context).copyWith(
                            scrollbarTheme: const ScrollbarThemeData(
                                thumbVisibility:
                                    MaterialStatePropertyAll(false),
                                thickness: MaterialStatePropertyAll(0),
                                trackVisibility:
                                    MaterialStatePropertyAll(false))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Theme(
                              data: Theme.of(context).copyWith(
                                  scrollbarTheme: const ScrollbarThemeData(
                                      thumbVisibility:
                                          MaterialStatePropertyAll(false),
                                      thickness: MaterialStatePropertyAll(0),
                                      trackVisibility:
                                          MaterialStatePropertyAll(false))),
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration:
                                    BoxDecoration(color: notifire.getbgcolor10),
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: notifire.getbgcolor11,
                                  ),
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      InkWell(
                                          onTap: () {},
                                          child: const Icon(
                                            Icons.arrow_back,
                                            color: Color(0xff9DA2A7),
                                            size: 20,
                                          )),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Image.asset('assets/Read.png',
                                          height: 25,
                                          color: const Color(0xff9DA2A7)),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Image.asset(
                                          'assets/warning-2Iquestion.png',
                                          height: 16,
                                          color: const Color(0xff9DA2A7)),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Image.asset('assets/read1.png',
                                          height: 16,
                                          color: const Color(0xff9DA2A7)),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      SvgPicture.asset('assets/printer.svg',
                                          height: 16,
                                          color: const Color(0xff9DA2A7)),
                                      const Spacer(),
                                      const Text(
                                        'Sort by:',
                                        style: TextStyle(
                                            color: Color(0xff9DA2A7),
                                            fontFamily: 'InterRegular',
                                            fontSize: 14),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Text(
                                        'Newest',
                                        style: TextStyle(
                                            color: Color(0xff727880),
                                            fontFamily: 'InterRegular',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Image.asset(
                                        'assets/arrow-down.png',
                                        height: 15,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(10),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: notifire.getbgcolor11,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Image.asset(
                                              'assets/Avatar1.png',
                                              height: 38,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  'Brooklyn Simmons',
                                                  style: TextStyle(
                                                      color: Color(0xff727880),
                                                      fontSize: 14,
                                                      fontFamily:
                                                          'InterRegular',
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                Row(
                                                  children: [
                                                    const Text('To: Me',
                                                        style: TextStyle(
                                                            fontSize: 13,
                                                            color: Color(
                                                                0xff9DA2A7),
                                                            fontFamily:
                                                                'InterRegular')),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    Image.asset(
                                                      'assets/Ellipse 88.png',
                                                      height: 6,
                                                      color: const Color(
                                                          0xffC6C8CB),
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    const Text('CC: Cooper',
                                                        style: TextStyle(
                                                            fontSize: 13,
                                                            color: Color(
                                                                0xff9DA2A7),
                                                            fontFamily:
                                                                'InterRegular')),
                                                  ],
                                                )
                                              ],
                                            ),
                                            const Spacer(),
                                            InkWell(
                                              onTap: () {},
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                  color: notifire.getbgcolor10,
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                child: Center(
                                                  child: Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                          'assets/reply.svg',
                                                          height: 16),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            InkWell(
                                              onTap: () {},
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                  color: notifire.getbgcolor10,
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                child: Center(
                                                  child: Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                          'assets/forward.svg',
                                                          height: 16),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            InkWell(
                                              onTap: () {},
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                  color: notifire.getbgcolor10,
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                child: Center(
                                                  child: Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                          'assets/archive.svg',
                                                          height: 16),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'Wanna create a UI template? Check out this UI Kit',
                                                style: TextStyle(
                                                    fontFamily: 'InterRegular',
                                                    fontSize: 18,
                                                    color:
                                                        notifire.getblackcolor,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        const Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                '2 hours ago (Thursday, 20 July, 2022 at 08:18 AM)',
                                                style: TextStyle(
                                                    fontFamily: 'InterRegular',
                                                    fontSize: 12,
                                                    color: Color(0xff9DA2A7)),
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                                child: Text(
                                              'But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure',
                                              style: TextStyle(
                                                color: notifire.getblackcolor,
                                                fontFamily: 'InterRegular',
                                                fontSize: 16,
                                              ),
                                            ))
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                                child: Text(
                                              ' In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best,',
                                              style: TextStyle(
                                                color: notifire.getblackcolor,
                                                fontFamily: 'InterRegular',
                                                fontSize: 16,
                                              ),
                                            ))
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Center(
                                          child: Container(
                                            height: Get.height * 0.35,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: Image.asset(
                                              'assets/Mediasv.png',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          children: [
                                            Transform.translate(
                                                offset: const Offset(0, -10),
                                                child: Image.asset(
                                                  'assets/Ellipse 88.png',
                                                  height: 5,
                                                  color:
                                                      const Color(0xff727880),
                                                )),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            const Expanded(
                                              child: Text(
                                                'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                                                style: TextStyle(
                                                    fontFamily: 'InterRegular',
                                                    color: Color(0xff727880),
                                                    fontSize: 14),
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                                                style: TextStyle(
                                                  fontFamily: 'InterRegular',
                                                  fontSize: 16,
                                                  color: notifire.getblackcolor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          children: [
                                            Text('Thanks!',
                                                style: TextStyle(
                                                  fontFamily: 'InterRegular',
                                                  fontSize: 16,
                                                  color: notifire.getblackcolor,
                                                )),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(12),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  color: notifire.getbgcolor10),
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset(
                                                      'assets/folder.svg',
                                                      color: notifire
                                                          .getblackcolor,
                                                      height: 24),
                                                  const SizedBox(
                                                    width: 8,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        'Screen.zip',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: notifire
                                                              .getblackcolor,
                                                          fontFamily:
                                                              'InterRegular',
                                                        ),
                                                      ),
                                                      const Text(
                                                        'Zip | 60.09 MB',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'InterRegular',
                                                            fontSize: 10,
                                                            color: Color(
                                                                0xff9DA2A7)),
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
                                              padding: const EdgeInsets.all(12),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  color: notifire.getbgcolor10),
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset(
                                                      'assets/document.svg',
                                                      color: notifire
                                                          .getblackcolor,
                                                      height: 24),
                                                  const SizedBox(
                                                    width: 8,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        'Tutorial.pdf',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: notifire
                                                              .getblackcolor,
                                                          fontFamily:
                                                              'InterRegular',
                                                        ),
                                                      ),
                                                      const Text(
                                                        'PDF | 12.31 MB',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'InterRegular',
                                                            fontSize: 10,
                                                            color: Color(
                                                                0xff9DA2A7)),
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
                                              padding: const EdgeInsets.all(12),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  color: notifire.getbgcolor10),
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset(
                                                      'assets/gallery.svg',
                                                      color: notifire
                                                          .getblackcolor,
                                                      height: 24),
                                                  const SizedBox(
                                                    width: 8,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        'Dashboard Admin.png',
                                                        style: TextStyle(
                                                          color: notifire
                                                              .getblackcolor,
                                                          fontSize: 12,
                                                          fontFamily:
                                                              'InterRegular',
                                                        ),
                                                      ),
                                                      const Text(
                                                        'PNG | 0.98 MB',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'InterRegular',
                                                            fontSize: 10,
                                                            color: Color(
                                                                0xff9DA2A7)),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(12),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  color: notifire.getbgcolor10),
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset(
                                                      'assets/folder.svg',
                                                      color: notifire
                                                          .getblackcolor,
                                                      height: 24),
                                                  const SizedBox(
                                                    width: 8,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        'Screen.zip',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: notifire
                                                              .getblackcolor,
                                                          fontFamily:
                                                              'InterRegular',
                                                        ),
                                                      ),
                                                      const Text(
                                                        'Zip | 60.09 MB',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'InterRegular',
                                                            fontSize: 10,
                                                            color: Color(
                                                                0xff9DA2A7)),
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
                                              padding: const EdgeInsets.all(12),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  color: notifire.getbgcolor10),
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset(
                                                      'assets/document.svg',
                                                      color: notifire
                                                          .getblackcolor,
                                                      height: 24),
                                                  const SizedBox(
                                                    width: 8,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        'Tutorial.pdf',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: notifire
                                                              .getblackcolor,
                                                          fontFamily:
                                                              'InterRegular',
                                                        ),
                                                      ),
                                                      const Text(
                                                        'PDF | 12.31 MB',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'InterRegular',
                                                            fontSize: 10,
                                                            color: Color(
                                                                0xff9DA2A7)),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                        Container(
                                          padding: const EdgeInsets.all(12),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color: notifire.getbgcolor10),
                                          child: Row(
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/gallery.svg',
                                                  color: notifire.getblackcolor,
                                                  height: 24),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Dashboard Admin.png',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: notifire
                                                          .getblackcolor,
                                                      fontFamily:
                                                          'InterRegular',
                                                    ),
                                                  ),
                                                  const Text(
                                                    'PNG | 0.98 MB',
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'InterRegular',
                                                        fontSize: 10,
                                                        color:
                                                            Color(0xff9DA2A7)),
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
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(12),
                                                      topRight:
                                                          Radius.circular(12)),
                                              border: Border.all(
                                                  color: notifire.Getblg2)),
                                          padding: const EdgeInsets.all(12),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Text('Hey',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color: notifire
                                                              .getblackcolor,
                                                          fontFamily:
                                                              'InterRegular')),
                                                  const SizedBox(
                                                    width: 8,
                                                  ),
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.all(5),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        color:
                                                            notifire.Getblg2),
                                                    child: Text(
                                                        '@Brooklyn Simmons',
                                                        style: TextStyle(
                                                            color: notifire
                                                                .getblackcolor,
                                                            fontSize: 14,
                                                            fontFamily:
                                                                'InterRegular')),
                                                  ),
                                                  const Spacer(),
                                                  SvgPicture.asset(
                                                    'assets/Collapse.svg',
                                                    height: 2,
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                      child: Text(
                                                    'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: notifire
                                                          .getblackcolor,
                                                      fontFamily:
                                                          'InterRegular',
                                                    ),
                                                  ))
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                      child: Text(
                                                    'Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because ',
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: notifire
                                                            .getblackcolor,
                                                        fontFamily:
                                                            'InterRegular'),
                                                  ))
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                children: [
                                                  SvgPicture.asset(
                                                      'assets/folder.svg',
                                                      height: 18,
                                                      color: notifire
                                                          .getblackcolor),
                                                  const SizedBox(
                                                    width: 8,
                                                  ),
                                                  Text(
                                                    'Adthor.zip',
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'InterRegular',
                                                        fontSize: 14,
                                                        color: notifire
                                                            .getblackcolor,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  const Text(
                                                    '6.02 MB',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontFamily:
                                                            'InterRegular',
                                                        color:
                                                            Color(0xff9DA2A7),
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  )
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Row(
                                                children: [
                                                  SvgPicture.asset(
                                                      'assets/document.svg',
                                                      height: 18,
                                                      color: notifire
                                                          .getblackcolor),
                                                  const SizedBox(
                                                    width: 8,
                                                  ),
                                                  Text(
                                                    'Totorial.pdf',
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'InterRegular',
                                                        fontSize: 14,
                                                        color: notifire
                                                            .getblackcolor,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  const Text(
                                                    '16.22 MB',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontFamily:
                                                            'InterRegular',
                                                        color:
                                                            Color(0xff9DA2A7),
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.all(12),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(12),
                                                      bottomRight:
                                                          Radius.circular(12)),
                                              color: notifire.getbgcolor10),
                                          child: Row(
                                            children: [
                                              Image.asset('assets/more.png',
                                                  height: 16,
                                                  color:
                                                      const Color(0xff727880)),
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              Image.asset('assets/trash.png',
                                                  height: 16,
                                                  color:
                                                      const Color(0xff727880)),
                                              Expanded(
                                                child: Container(
                                                  height: 45,
                                                  decoration: BoxDecoration(
                                                      color:
                                                          notifire.getbgcolor10,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: TextField(
                                                    style: TextStyle(
                                                        color: notifire
                                                            .getblackcolor),
                                                    decoration: InputDecoration(
                                                      hintText: 'Mail',
                                                      hintStyle: TextStyle(
                                                          color: grey3,
                                                          fontSize: 15),
                                                      contentPadding:
                                                          const EdgeInsets.only(
                                                              left: 20,
                                                              right: 20),
                                                      border:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20),
                                                              borderSide:
                                                                  BorderSide
                                                                      .none),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide
                                                                      .none,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20)),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide
                                                                      .none,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const Spacer(),
                                              Image.asset(
                                                  'assets/attach-circle.png',
                                                  height: 16,
                                                  color:
                                                      const Color(0xff727880)),
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              SvgPicture.asset(
                                                  'assets/Link.svg',
                                                  height: 24,
                                                  color:
                                                      const Color(0xff727880)),
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              Image.asset(
                                                  'assets/emoji-happy.png',
                                                  height: 16,
                                                  color:
                                                      const Color(0xff727880)),
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              Image.asset('assets/gallery.png',
                                                  height: 16,
                                                  color:
                                                      const Color(0xff727880)),
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              Image.asset(
                                                  'assets/microphone.png',
                                                  height: 16,
                                                  color:
                                                      const Color(0xff727880)),
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              InkWell(
                                                onTap: () {},
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                      color: const Color(
                                                          0xff595FE5)),
                                                  child: const Text('Reply',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontFamily:
                                                              'InterRegular',
                                                          fontSize: 12)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        : DefaultTabController(
            length: 4,
            initialIndex: 0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Scaffold(
                backgroundColor: notifire.getbgcolor10,
                body: SingleChildScrollView(
                  child: Theme(
                    data: Theme.of(context).copyWith(
                        scrollbarTheme: const ScrollbarThemeData(
                            thumbVisibility: MaterialStatePropertyAll(false),
                            thickness: MaterialStatePropertyAll(0),
                            trackVisibility: MaterialStatePropertyAll(false))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Theme(
                          data: Theme.of(context).copyWith(
                              scrollbarTheme: const ScrollbarThemeData(
                                  thumbVisibility:
                                      MaterialStatePropertyAll(false),
                                  thickness: MaterialStatePropertyAll(0),
                                  trackVisibility:
                                      MaterialStatePropertyAll(false))),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: notifire.getbgcolor11,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                InkWell(
                                    onTap: () {},
                                    child: const Icon(
                                      Icons.arrow_back,
                                      color: Color(0xff9DA2A7),
                                      size: 20,
                                    )),
                                const SizedBox(
                                  width: 15,
                                ),
                                Image.asset('assets/Read.png',
                                    height: 25, color: const Color(0xff9DA2A7)),
                                const SizedBox(
                                  width: 15,
                                ),
                                Image.asset('assets/warning-2Iquestion.png',
                                    height: 16, color: const Color(0xff9DA2A7)),
                                const SizedBox(
                                  width: 15,
                                ),
                                Image.asset('assets/read1.png',
                                    height: 16, color: const Color(0xff9DA2A7)),
                                const SizedBox(
                                  width: 15,
                                ),
                                SvgPicture.asset('assets/printer.svg',
                                    height: 16, color: const Color(0xff9DA2A7)),
                                const Spacer(),
                                const Text(
                                  'Sort by:',
                                  style: TextStyle(
                                      color: Color(0xff9DA2A7),
                                      fontFamily: 'InterRegular',
                                      fontSize: 14),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  'Newest',
                                  style: TextStyle(
                                      color: Color(0xff727880),
                                      fontFamily: 'InterRegular',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Image.asset(
                                  'assets/arrow-down.png',
                                  height: 15,
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: notifire.getbgcolor11,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      'assets/Avatar1.png',
                                      height: 38,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Brooklyn Simmons',
                                          style: TextStyle(
                                              color: Color(0xff727880),
                                              fontSize: 14,
                                              fontFamily: 'InterRegular',
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Row(
                                          children: [
                                            const Text('To: Me',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    color: Color(0xff9DA2A7),
                                                    fontFamily:
                                                        'InterRegular')),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Image.asset(
                                              'assets/Ellipse 88.png',
                                              height: 6,
                                              color: const Color(0xffC6C8CB),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            const Text('CC: Bessie Cooper',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    color: Color(0xff9DA2A7),
                                                    fontFamily:
                                                        'InterRegular')),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Image.asset(
                                              'assets/Ellipse 88.png',
                                              height: 6,
                                              color: const Color(0xffC6C8CB),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            const Text('BCC: Devon Lane',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    color: Color(0xff9DA2A7),
                                                    fontFamily: 'InterRegular'))
                                          ],
                                        )
                                      ],
                                    ),
                                    const Spacer(),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          profilePage = !profilePage;
                                        });
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: notifire.getbgcolor10,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Center(
                                          child: Row(
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/reply.svg',
                                                  height: 16),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              const Text(
                                                'Reply',
                                                style: TextStyle(
                                                    color: Color(0xff727880),
                                                    fontSize: 12,
                                                    fontFamily: 'InterRegular',
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: notifire.getbgcolor10,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Center(
                                          child: Row(
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/forward.svg',
                                                  height: 16),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              const Text(
                                                'Forward',
                                                style: TextStyle(
                                                    color: Color(0xff727880),
                                                    fontSize: 12,
                                                    fontFamily: 'InterRegular',
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: notifire.getbgcolor10,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Center(
                                          child: Row(
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/archive.svg',
                                                  height: 16),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              const Text(
                                                'Archive',
                                                style: TextStyle(
                                                    color: Color(0xff727880),
                                                    fontSize: 12,
                                                    fontFamily: 'InterRegular',
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Wanna create a UI template? Check out this UI Kit',
                                      style: TextStyle(
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular',
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Row(
                                  children: [
                                    Text(
                                      '2 hours ago (Thursday, 20 July, 2022 at 08:18 AM)',
                                      style: TextStyle(
                                          fontFamily: 'InterRegular',
                                          fontSize: 12,
                                          color: Color(0xff9DA2A7)),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                                        style: TextStyle(
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular',
                                          fontSize: 16,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because ',
                                        style: TextStyle(
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular',
                                          fontSize: 16,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Center(
                                  child: Container(
                                    height: Get.height * 0.35,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Image.asset('assets/Mediasv.png',
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Transform.translate(
                                        offset: const Offset(0, -10),
                                        child: Image.asset(
                                          'assets/Ellipse 88.png',
                                          height: 5,
                                          color: const Color(0xff727880),
                                        )),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Expanded(
                                      child: Text(
                                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                                        style: TextStyle(
                                            fontFamily: 'InterRegular',
                                            color: Color(0xff727880),
                                            fontSize: 14),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.',
                                        style: TextStyle(
                                          fontFamily: 'InterRegular',
                                          fontSize: 16,
                                          color: notifire.getblackcolor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Text('Thanks!',
                                        style: TextStyle(
                                          fontFamily: 'InterRegular',
                                          fontSize: 16,
                                          color: notifire.getblackcolor,
                                        )),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: notifire.getbgcolor10),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                                'assets/folder.svg',
                                                color: notifire.getblackcolor,
                                                height: 24),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Screen.zip',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color:
                                                        notifire.getblackcolor,
                                                    fontFamily: 'InterRegular',
                                                  ),
                                                ),
                                                const Text(
                                                  'Zip | 60.09 MB',
                                                  style: TextStyle(
                                                      fontFamily:
                                                          'InterRegular',
                                                      fontSize: 10,
                                                      color: Color(0xff9DA2A7)),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: notifire.getbgcolor10),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                                'assets/document.svg',
                                                color: notifire.getblackcolor,
                                                height: 24),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Tutorial.pdf',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color:
                                                        notifire.getblackcolor,
                                                    fontFamily: 'InterRegular',
                                                  ),
                                                ),
                                                const Text(
                                                  'PDF | 12.31 MB',
                                                  style: TextStyle(
                                                      fontFamily:
                                                          'InterRegular',
                                                      fontSize: 10,
                                                      color: Color(0xff9DA2A7)),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 15),
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: notifire.getbgcolor10),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                                'assets/gallery.svg',
                                                color: notifire.getblackcolor,
                                                height: 24),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Dashboard Admin.png',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontFamily: 'InterRegular',
                                                    color:
                                                        notifire.getblackcolor,
                                                  ),
                                                ),
                                                const Text(
                                                  'PNG | 0.98 MB',
                                                  style: TextStyle(
                                                      fontFamily:
                                                          'InterRegular',
                                                      fontSize: 10,
                                                      color: Color(0xff9DA2A7)),
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
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: notifire.getbgcolor10),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                                'assets/folder.svg',
                                                color: notifire.getblackcolor,
                                                height: 24),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Screen.zip',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontFamily: 'InterRegular',
                                                    color:
                                                        notifire.getblackcolor,
                                                  ),
                                                ),
                                                const Text(
                                                  'Zip | 60.09 MB',
                                                  style: TextStyle(
                                                      fontFamily:
                                                          'InterRegular',
                                                      fontSize: 10,
                                                      color: Color(0xff9DA2A7)),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: notifire.getbgcolor10),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                                'assets/document.svg',
                                                color: notifire.getblackcolor,
                                                height: 24),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Tutorial.pdf',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color:
                                                        notifire.getblackcolor,
                                                    fontFamily: 'InterRegular',
                                                  ),
                                                ),
                                                const Text(
                                                  'PDF | 12.31 MB',
                                                  style: TextStyle(
                                                      fontFamily:
                                                          'InterRegular',
                                                      fontSize: 10,
                                                      color: Color(0xff9DA2A7)),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 15),
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: notifire.getbgcolor10),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                                'assets/gallery.svg',
                                                color: notifire.getblackcolor,
                                                height: 24),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Dashboard Admin.png',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color:
                                                        notifire.getblackcolor,
                                                    fontFamily: 'InterRegular',
                                                  ),
                                                ),
                                                const Text(
                                                  'PNG | 0.98 MB',
                                                  style: TextStyle(
                                                      fontFamily:
                                                          'InterRegular',
                                                      fontSize: 10,
                                                      color: Color(0xff9DA2A7)),
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
                                  height: 20,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(12),
                                        topRight: Radius.circular(12)),
                                    color: notifire.getbgcolor10,
                                  ),
                                  padding: const EdgeInsets.all(12),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text('Hey',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: notifire.getblackcolor,
                                                  fontFamily: 'InterRegular')),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Container(
                                            padding: const EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: notifire.getbgcolor11),
                                            child: const Text(
                                                '@Brooklyn Simmons',
                                                style: TextStyle(
                                                    color: Color(0xffF3935D),
                                                    fontSize: 14,
                                                    fontFamily:
                                                        'InterRegular')),
                                          ),
                                          const Spacer(),
                                          SvgPicture.asset(
                                            'assets/Collapse.svg',
                                            height: 2,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: notifire.getblackcolor,
                                                fontFamily: 'InterRegular',
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: notifire.getblackcolor,
                                                  fontFamily: 'InterRegular'),
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/folder.svg',
                                            height: 18,
                                            color: notifire.getblackcolor,
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            'Adthor.zip',
                                            style: TextStyle(
                                                fontFamily: 'InterRegular',
                                                fontSize: 14,
                                                color: notifire.getblackcolor,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          const Text(
                                            '6.02 MB',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: 'InterRegular',
                                                color: Color(0xff9DA2A7),
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/document.svg',
                                            height: 18,
                                            color: notifire.getblackcolor,
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            'Totorial.pdf',
                                            style: TextStyle(
                                                fontFamily: 'InterRegular',
                                                fontSize: 14,
                                                color: notifire.getblackcolor,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          const Text(
                                            '16.22 MB',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: 'InterRegular',
                                                color: Color(0xff9DA2A7),
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(12),
                                          bottomRight: Radius.circular(12)),
                                      color: notifire.getbgcolor11),
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: Image.asset('assets/more.png',
                                            height: 16,
                                            color: const Color(0xff727880)),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Image.asset('assets/trash.png',
                                            height: 16,
                                            color: const Color(0xff727880)),
                                      ),
                                      Expanded(
                                        child: Container(
                                          height: 45,
                                          decoration: BoxDecoration(
                                              color: notifire.getbgcolor11,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: TextField(
                                            style: TextStyle(
                                                color: notifire.getblackcolor),
                                            decoration: InputDecoration(
                                              hintText: 'Mail',
                                              hintStyle: TextStyle(
                                                  color: grey3, fontSize: 15),
                                              contentPadding:
                                                  const EdgeInsets.only(
                                                      left: 20, right: 20),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  borderSide: BorderSide.none),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      Image.asset('assets/attach-circle.png',
                                          height: 16,
                                          color: const Color(0xff727880)),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      SvgPicture.asset('assets/Link.svg',
                                          height: 24,
                                          color: const Color(0xff727880)),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Image.asset('assets/emoji-happy.png',
                                          height: 16,
                                          color: const Color(0xff727880)),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Image.asset('assets/gallery.png',
                                          height: 16,
                                          color: const Color(0xff727880)),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Image.asset('assets/microphone.png',
                                          height: 16,
                                          color: const Color(0xff727880)),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: const Color(0xff595FE5)),
                                          child: const Text('Reply',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'InterRegular',
                                                  fontSize: 12)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }

  Widget container4(size) {
    return Scaffold(
      backgroundColor: notifire.getbgcolor10,
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
                    tooltip:
                        MaterialLocalizations.of(context).openAppDrawerTooltip,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                        borderRadius: BorderRadius.circular(16),
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
            child: Container(
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BillingDetails()));
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AccountInfo(),
                        ));
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BillingDetails2(),
                        ));
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
                          builder: (context) => const signup(),
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
                    onTap: () {},
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/globe 01.svg',
                            height: 20, color: notifire.getblackcolor),
                        const SizedBox(
                          width: 10,
                        ),
                        Text('RTL',
                            style: TextStyle(
                                color: notifire.getblackcolor,
                                fontFamily: 'InterRegular')),
                        const Spacer(),
                        Transform.translate(
                            offset: const Offset(12, 0), child: switchButton()),
                      ],
                    ),
                  );
                }),
              ),
            ],
          ),
          const Flexible(child: SizedBox(width: 10)),
        ],
        title: PopupMenuButton(
          tooltip: '',
          offset: const Offset(0, 50),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Container(
          color: notifire.getbgcolor11,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          height: Get.height,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                ListView.separated(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: model().mail4.length,
                  separatorBuilder: (context, index) {
                    return Divider(
                      height: 10,
                      color: notifire.getgrey1,
                    );
                  },
                  itemBuilder: (context, index) {
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(model().mail4[index], height: 32),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        model().verion[index],
                                        style: const TextStyle(
                                            fontSize: 12,
                                            color: Color(0xff727880),
                                            fontFamily: 'InterRegular'),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    model().mail5[index],
                                    style: const TextStyle(
                                      color: Color(0xff9DA2A7),
                                      fontFamily: 'InterRegular',
                                      fontSize: 12,
                                    ),
                                  )
                                  // ],)
                                ],
                              ),
                              SvgPicture.asset('assets/reply.svg', height: 16),
                              const SizedBox(
                                width: 20,
                              ),
                              Image.asset('assets/more.png', height: 16),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            model().mail6[index],
                            style: const TextStyle(
                              fontSize: 14,
                              fontFamily: 'InterRegular',
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                model().mail7[index],
                                height: 16,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                model().mail8[index],
                                style: const TextStyle(
                                  fontFamily: 'InterRegular',
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                model().mail9[index],
                                style: const TextStyle(
                                    fontFamily: 'InterRegular',
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff9DA2A7)),
                              )
                            ],
                          )
                        ]);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget container5(size) {
    return size < 700
        ? DefaultTabController(
            length: 4,
            initialIndex: 0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: StatefulBuilder(
                builder: (context, setState) {
                  return Scaffold(
                    backgroundColor: notifire.getbgcolor10,
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
                          itemBuilder: (context) =>
                              <PopupMenuEntry<SampleItem>>[
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
                                                        color: notifire
                                                            .getblackcolor,
                                                        fontSize: 14,
                                                        fontFamily:
                                                            'InterRegular',
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
                          itemBuilder: (context) =>
                              <PopupMenuEntry<SampleItem>>[
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
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
                                                        Text(
                                                            model()
                                                                .Popo1[index],
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
                                                          BorderRadius.circular(
                                                              16),
                                                      color: const Color(
                                                          0xff595FE5)),
                                                )
                                              ],
                                            );
                                          },
                                          separatorBuilder:
                                              (BuildContext context,
                                                  int index) {
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
                          itemBuilder: (context) =>
                              <PopupMenuEntry<SampleItem>>[
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(12),
                                                  decoration: BoxDecoration(
                                                      color:
                                                          notifire.getbgcolor10,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: Center(
                                                      child: Image.asset(
                                                    model().popo[index],
                                                    height: 16,
                                                    color:
                                                        notifire.getblackcolor,
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
                                                          BorderRadius.circular(
                                                              16),
                                                      color: const Color(
                                                          0xff595FE5)),
                                                )
                                              ],
                                            );
                                          },
                                          separatorBuilder:
                                              (BuildContext context,
                                                  int index) {
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
                            child: Center(
                                child: Image.asset('assets/avatar-6 1.png')),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
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
                                        color: notifire.getblackcolor,
                                        height: 18),
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
                                        color: notifire.getblackcolor,
                                        height: 18),
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
                                        color: notifire.getblackcolor,
                                        height: 18),
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
                                        color: notifire.getblackcolor,
                                        height: 18),
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
                              child:
                                  StatefulBuilder(builder: (context, setState) {
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
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              enabled: false,
                              value: SampleItem.itemOne,
                              child: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                    color: notifire.Getblg2,
                                    borderRadius: BorderRadius.circular(6)),
                                child: TextField(
                                  style:
                                      TextStyle(color: notifire.getblackcolor),
                                  decoration: InputDecoration(
                                    hintText: 'Search',
                                    prefixIcon: Image.asset(
                                        'assets/search-normal.png',
                                        scale: 4,
                                        color: const Color(0xff9DA2A7)),
                                    hintStyle: TextStyle(
                                        color: notifire.getblackcolor),
                                    contentPadding: const EdgeInsets.only(
                                        left: 20, right: 20),
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
                    body: Theme(
                      data: Theme.of(context).copyWith(
                          scrollbarTheme: const ScrollbarThemeData(
                              thumbVisibility: MaterialStatePropertyAll(false),
                              thickness: MaterialStatePropertyAll(0),
                              trackVisibility:
                                  MaterialStatePropertyAll(false))),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: notifire.getbgcolor11),
                                      padding: const EdgeInsets.all(12),
                                      child: Row(
                                        children: [
                                          const Text('To:',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Color(0xff9DA2A7),
                                                  fontFamily: 'InterRegular')),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Container(
                                            padding: const EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                color: notifire.Getblg2),
                                            child: Row(children: [
                                              Image.asset(
                                                'assets/avatar-7 1.png',
                                                height: 20,
                                              ),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                'Marvin McKinney',
                                                style: TextStyle(
                                                    color:
                                                        notifire.getblackcolor,
                                                    fontSize: 12,
                                                    fontFamily: 'InterRegular',
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              SvgPicture.asset(
                                                  'assets/close-circle.svg',
                                                  height: 12),
                                            ]),
                                          ),
                                          const Spacer(),
                                          const Text('CC',
                                              style: TextStyle(
                                                  color: Color(0xff727880),
                                                  fontFamily: 'InterRegular',
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600)),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          const Text('BCC',
                                              style: TextStyle(
                                                  color: Color(0xff727880),
                                                  fontFamily: 'InterRegular',
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600)),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                          color: notifire.getbgcolor11,
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                'Sale of evcp admin\ndashboard',
                                                style: TextStyle(
                                                    fontFamily: 'InterRegular',
                                                    fontSize: 18,
                                                    color:
                                                        notifire.getblackcolor,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              const Spacer(),
                                              const Text(
                                                '100',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Color(0xff9DA2A7),
                                                    fontFamily: 'InterRegular'),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Divider(
                                            color: notifire.getgrey1,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            'But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?"',
                                            style: TextStyle(
                                                fontFamily: 'InterRegular',
                                                fontSize: 14,
                                                color: notifire.getblackcolor),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            'Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.',
                                            style: TextStyle(
                                                fontFamily: 'InterRegular',
                                                fontSize: 14,
                                                color: notifire.getblackcolor),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Center(
                                            child: Container(
                                              height: Get.height * 0.35,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              child: Image.asset(
                                                  'assets/Media12.png',
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          const TextField(
                                            cursorColor: Color(0xff595FE5),
                                            keyboardType:
                                                TextInputType.multiline,
                                            maxLines: 1,
                                            style: TextStyle(
                                                color: Color(0xff9DA2A7)),
                                            decoration: InputDecoration(
                                              hintText: " write mail",
                                              hintStyle: TextStyle(
                                                  color: Color(0xff9DA2A7)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide.none),
                                              disabledBorder:
                                                  OutlineInputBorder(
                                                      borderSide:
                                                          BorderSide.none),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide.none),
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.all(12),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: notifire.Getblg2),
                                            child: Row(
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/document.svg',
                                                    color:
                                                        notifire.getblackcolor,
                                                    height: 24),
                                                const SizedBox(
                                                  width: 8,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'SAML18920-An-1293.html',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: notifire
                                                              .getblackcolor,
                                                          fontFamily:
                                                              'InterRegular',
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                    const Text(
                                                      'Zip | 24.09 MB',
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'InterRegular',
                                                          fontSize: 10,
                                                          color: Color(
                                                              0xff9DA2A7)),
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
                                            padding: const EdgeInsets.all(12),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: notifire.Getblg2),
                                            child: Row(
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/document.svg',
                                                    color:
                                                        notifire.getblackcolor,
                                                    height: 24),
                                                const SizedBox(
                                                  width: 8,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'SAML18920-An-1293.html',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontFamily:
                                                              'InterRegular',
                                                          color: notifire
                                                              .getblackcolor,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                    const Text(
                                                      'Zip | 24.09 MB',
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'InterRegular',
                                                          fontSize: 10,
                                                          color: Color(
                                                              0xff9DA2A7)),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 70,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                      ),
                    ),
                    bottomSheet: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0),
                          color: notifire.getbgcolor11),
                      child: Row(
                        children: [
                          Image.asset('assets/more.png',
                              height: 16, color: const Color(0xff727880)),
                          const SizedBox(
                            width: 15,
                          ),
                          Image.asset('assets/trash.png',
                              height: 16, color: const Color(0xff727880)),
                          Expanded(
                            child: Container(
                              height: 45,
                              decoration: BoxDecoration(
                                  color: notifire.getbgcolor11,
                                  borderRadius: BorderRadius.circular(20)),
                              child: TextField(
                                style: TextStyle(color: notifire.getblackcolor),
                                decoration: InputDecoration(
                                  hintText: 'Mail',
                                  hintStyle: TextStyle(
                                      color: notifire.getblackcolor,
                                      fontSize: 15),
                                  contentPadding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide.none),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(20)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          Image.asset('assets/attach-circle.png',
                              height: 16, color: const Color(0xff727880)),
                          const SizedBox(
                            width: 15,
                          ),
                          SvgPicture.asset('assets/Link.svg',
                              height: 24, color: const Color(0xff727880)),
                          const SizedBox(
                            width: 15,
                          ),
                          Image.asset('assets/emoji-happy.png',
                              height: 16, color: const Color(0xff727880)),
                          const SizedBox(
                            width: 15,
                          ),
                          Image.asset('assets/gallery.png',
                              height: 16, color: const Color(0xff727880)),
                          const SizedBox(
                            width: 15,
                          ),
                          Image.asset('assets/microphone.png',
                              height: 16, color: const Color(0xff727880)),
                          const SizedBox(
                            width: 15,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: const Color(0xff595FE5)),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/calendar.png',
                                    height: 16,
                                    color: Colors.white,
                                  )
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
            ),
          )
        : DefaultTabController(
            length: 4,
            initialIndex: 0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Scaffold(
                backgroundColor: notifire.getbgcolor10,
                body: Theme(
                  data: Theme.of(context).copyWith(
                      scrollbarTheme: const ScrollbarThemeData(
                          thumbVisibility: MaterialStatePropertyAll(false),
                          thickness: MaterialStatePropertyAll(0),
                          trackVisibility: MaterialStatePropertyAll(false))),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Theme(
                          data: Theme.of(context).copyWith(
                              scrollbarTheme: const ScrollbarThemeData(
                                  thumbVisibility:
                                      MaterialStatePropertyAll(false),
                                  thickness: MaterialStatePropertyAll(0),
                                  trackVisibility:
                                      MaterialStatePropertyAll(false))),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: notifire.getbgcolor11),
                            child: Row(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Image.asset('assets/archive1.png',
                                    height: 16, color: const Color(0xff9DA2A7)),
                                const SizedBox(
                                  width: 15,
                                ),
                                Image.asset('assets/warning-2Iquestion.png',
                                    height: 16, color: const Color(0xff9DA2A7)),
                                const SizedBox(
                                  width: 15,
                                ),
                                SvgPicture.asset('assets/printer.svg',
                                    height: 16, color: const Color(0xff9DA2A7)),
                                const Spacer(),
                                SvgPicture.asset(
                                  'assets/Collapse.svg',
                                  height: 24,
                                  color: const Color(0xff9DA2A7),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: notifire.getbgcolor11),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Text('To:',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xff9DA2A7),
                                            fontFamily: 'InterRegular')),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: notifire.Getblg2),
                                      child: Row(children: [
                                        Image.asset(
                                          'assets/avatar-7 1.png',
                                          height: 20,
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        const Text(
                                          'Marvin McKinney',
                                          style: TextStyle(
                                              color: Color(0xff727880),
                                              fontSize: 12,
                                              fontFamily: 'InterRegular',
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        SvgPicture.asset(
                                            'assets/close-circle.svg',
                                            height: 12),
                                      ]),
                                    ),
                                    const Spacer(),
                                    const Text('CC',
                                        style: TextStyle(
                                            color: Color(0xff727880),
                                            fontFamily: 'InterRegular',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600)),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    const Text('BCC',
                                        style: TextStyle(
                                            color: Color(0xff727880),
                                            fontFamily: 'InterRegular',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600)),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Divider(
                                  color: notifire.getgrey1,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                      'Sale of evcp admin dashboard',
                                      style: TextStyle(
                                          fontFamily: 'InterRegular',
                                          fontSize: 18,
                                          color: notifire.getblackcolor,
                                          fontWeight: FontWeight.w500),
                                    )),
                                    const Spacer(),
                                    const Text(
                                      '100',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff9DA2A7),
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Divider(
                                  color: notifire.getgrey1,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?"',
                                  style: TextStyle(
                                      color: notifire.getblackcolor,
                                      fontFamily: 'InterRegular',
                                      fontSize: 14),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure.',
                                  style: TextStyle(
                                      color: notifire.getblackcolor,
                                      fontFamily: 'InterRegular',
                                      fontSize: 14),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Center(
                                  child: Container(
                                    height: Get.height * 0.35,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Image.asset('assets/Media12.png',
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                const TextField(
                                  cursorColor: Color(0xff595FE5),
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 1,
                                  style: TextStyle(color: Color(0xff9DA2A7)),
                                  decoration: InputDecoration(
                                    hintText: " write mail",
                                    hintStyle:
                                        TextStyle(color: Color(0xff9DA2A7)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                    disabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                  ),
                                ),
                                Container(
                                  width: Get.width * 0.15,
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: notifire.Getblg2),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset('assets/document.svg',
                                          color: notifire.getblackcolor,
                                          height: 24),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'SAML18920-An-1293.html',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: notifire.getblackcolor,
                                                fontFamily: 'InterRegular',
                                                fontWeight: FontWeight.w600),
                                          ),
                                          const Text(
                                            'Zip | 24.09 MB',
                                            style: TextStyle(
                                                fontFamily: 'InterRegular',
                                                fontSize: 10,
                                                color: Color(0xff9DA2A7)),
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
                                  width: Get.width * 0.15,
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: notifire.Getblg2),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset('assets/document.svg',
                                          color: notifire.getblackcolor,
                                          height: 24),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'SAML18920-An-1293.html',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: notifire.getblackcolor,
                                                fontFamily: 'InterRegular',
                                                fontWeight: FontWeight.w600),
                                          ),
                                          const Text(
                                            'Zip | 24.09 MB',
                                            style: TextStyle(
                                                fontFamily: 'InterRegular',
                                                fontSize: 10,
                                                color: Color(0xff9DA2A7)),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 70,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                bottomSheet: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                      color: notifire.getbgcolor11),
                  child: Row(
                    children: [
                      Image.asset('assets/more.png',
                          height: 16, color: const Color(0xff727880)),
                      const SizedBox(
                        width: 15,
                      ),
                      Image.asset('assets/trash.png',
                          height: 16, color: const Color(0xff727880)),
                      Expanded(
                        child: Container(
                          height: 45,
                          decoration: BoxDecoration(
                              color: notifire.getbgcolor11,
                              borderRadius: BorderRadius.circular(20)),
                          child: TextField(
                            style: TextStyle(color: notifire.getblackcolor),
                            decoration: InputDecoration(
                              hintText: 'Mail',
                              hintStyle: TextStyle(color: grey3, fontSize: 15),
                              contentPadding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(20)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Image.asset('assets/attach-circle.png',
                          height: 16, color: const Color(0xff727880)),
                      const SizedBox(
                        width: 15,
                      ),
                      SvgPicture.asset('assets/Link.svg',
                          height: 24, color: const Color(0xff727880)),
                      const SizedBox(
                        width: 15,
                      ),
                      Image.asset('assets/emoji-happy.png',
                          height: 16, color: const Color(0xff727880)),
                      const SizedBox(
                        width: 15,
                      ),
                      Image.asset('assets/gallery.png',
                          height: 16, color: const Color(0xff727880)),
                      const SizedBox(
                        width: 15,
                      ),
                      Image.asset('assets/microphone.png',
                          height: 16, color: const Color(0xff727880)),
                      const SizedBox(
                        width: 15,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: const Color(0xff595FE5)),
                          child: Row(
                            children: [
                              const Text('Send Now',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'InterRegular',
                                      fontSize: 14)),
                              const SizedBox(
                                width: 10,
                              ),
                              Image.asset(
                                'assets/calendar.png',
                                height: 16,
                                color: Colors.white,
                              )
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
}

class MyData extends DataTableSource {
  bool isActive = false;

  final List<Map<String, dynamic>> _data = List.generate(
      30,
      (index) => {
            "No": index,
            "SKU": "Item $index",
            "price": Random().nextInt(10000)
          });

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _data.length;

  @override
  int get selectedRowCount => 0;
  int index = 0;

  @override
  DataRow? getRow(int index) {
    switch (index) {
      case 0:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return Transform.scale(
                    scale: 1.2,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side: const BorderSide(style: BorderStyle.none),
                          visualDensity: const VisualDensity(horizontal: -4),
                          activeColor: const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          value: isActive,
                          onChanged: (val) {
                            setState(() {
                              isActive = val!;
                            });
                          }),
                    ),
                  );
                },
              ),
            ),
            DataCell(
              Image.asset('assets/heart1.png', height: 16),
            ),
            DataCell(Row(
              children: [
                const Text('Wanna create a UI template? Check out this UI Kit',
                    style: TextStyle(
                        color: Color(0xff9DA2A7),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'InterRegular',
                        fontSize: 14)),
                const SizedBox(
                  width: 5,
                ),
                Image.asset('assets/Ellipse 88.png', height: 5),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  'Are you...',
                  style: TextStyle(
                    color: Color(0xff9DA2A7),
                    fontSize: 14,
                    fontFamily: 'InterRegular',
                  ),
                )
              ],
            )),
            const DataCell(Text(
              'Dec 30, 2019 07:52',
              style: TextStyle(
                color: Color(0xff9DA2A7),
                fontFamily: 'InterRegular',
              ),
            )),
            DataCell(Stack(
              clipBehavior: Clip.none,
              children: [
                Transform.translate(
                  offset: const Offset(0, 0),
                  child: Container(
                    height: 32,
                    decoration: BoxDecoration(
                      color: const Color(0xffE5646C),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.asset('assets/User Read.png'),
                  ),
                ),
                Positioned(
                    left: -10,
                    child: Transform.translate(
                      offset: const Offset(30, 0),
                      child: Container(
                        height: 32,
                        decoration: BoxDecoration(
                          color: const Color(0xffE5646C),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset('assets/Avatar72.png'),
                      ),
                    )),
                Positioned(
                    left: 5,
                    child: Transform.translate(
                      offset: const Offset(40, 0),
                      child: Container(
                        height: 32,
                        decoration: BoxDecoration(
                          color: const Color(0xffE5646C),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset('assets/User Read1.png'),
                      ),
                    )),
                Positioned(
                    child: Transform.translate(
                  offset: const Offset(70, 0),
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xffEEEEEE)),
                    child: const Center(
                        child: Text('+53',
                            style: TextStyle(
                                color: Color(0xff9DA2A7),
                                fontWeight: FontWeight.w600,
                                fontFamily: 'InterRegular',
                                fontSize: 10))),
                  ),
                ))
              ],
            )),
            DataCell(Image.asset(
              'assets/tag-right.png',
              height: 16,
            )),
            DataCell(Image.asset(
              'assets/more.png',
              height: 16,
            )),
          ],
        );
      case 1:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return Transform.scale(
                    scale: 1.2,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side: const BorderSide(style: BorderStyle.none),
                          visualDensity: const VisualDensity(horizontal: -4),
                          activeColor: const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          value: isActive,
                          onChanged: (val) {
                            setState(() {
                              isActive = val!;
                            });
                          }),
                    ),
                  );
                },
              ),
            ),
            DataCell(
              Image.asset('assets/heart1.png', height: 16),
            ),
            const DataCell(Row(
              children: [
                Text(
                    'See the amazing design of your next product before you build it',
                    style: TextStyle(
                        color: Color(0xff9DA2A7),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'InterRegular',
                        fontSize: 14)),
              ],
            )),
            const DataCell(Text(
              'Dec 20, 2020 05:22',
              style: TextStyle(
                color: Color(0xff9DA2A7),
                fontFamily: 'InterRegular',
              ),
            )),
            DataCell(Stack(
              clipBehavior: Clip.none,
              children: [
                Transform.translate(
                  offset: const Offset(0, 0),
                  child: Container(
                    height: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.asset('assets/Avatar61.png'),
                  ),
                ),
                Positioned(
                    left: -10,
                    child: Transform.translate(
                      offset: const Offset(30, 0),
                      child: Container(
                        height: 32,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset('assets/Avatar62.png'),
                      ),
                    )),
              ],
            )),
            DataCell(Image.asset(
              'assets/tag-right.png',
              height: 16,
              color: const Color(0xffB0E4C8),
            )),
            DataCell(Image.asset(
              'assets/more.png',
              height: 16,
            )),
          ],
        );
      case 2:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return Transform.scale(
                    scale: 1.2,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side: const BorderSide(style: BorderStyle.none),
                          visualDensity: const VisualDensity(horizontal: -4),
                          activeColor: const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          value: isActive,
                          onChanged: (val) {
                            setState(() {
                              isActive = val!;
                            });
                          }),
                    ),
                  );
                },
              ),
            ),
            DataCell(
              Image.asset('assets/heart1.png', height: 16),
            ),
            DataCell(Row(
              children: [
                const Text('Design a website with this UI Kit',
                    style: TextStyle(
                        color: Color(0xff9DA2A7),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'InterRegular',
                        fontSize: 14)),
                const SizedBox(
                  width: 5,
                ),
                Image.asset('assets/Ellipse 88.png', height: 5),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  'Thanks for contacting us. You ...',
                  style: TextStyle(
                    color: Color(0xff727880),
                    fontSize: 14,
                    fontFamily: 'InterRegular',
                  ),
                )
              ],
            )),
            const DataCell(Text(
              'Feb 3, 2012 14:57',
              style: TextStyle(
                color: Color(0xff9DA2A7),
                fontFamily: 'InterRegular',
              ),
            )),
            DataCell(Stack(
              clipBehavior: Clip.none,
              children: [
                Transform.translate(
                  offset: const Offset(0, 0),
                  child: Container(
                    height: 32,
                    decoration: BoxDecoration(
                      color: const Color(0xffE5646C),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.asset('assets/Avatar71.png'),
                  ),
                ),
              ],
            )),
            DataCell(Image.asset(
              'assets/tag-right.png',
              height: 16,
            )),
            DataCell(Image.asset(
              'assets/more.png',
              height: 16,
            )),
          ],
        );
      case 3:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return Transform.scale(
                    scale: 1.2,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side: const BorderSide(style: BorderStyle.none),
                          visualDensity: const VisualDensity(horizontal: -4),
                          activeColor: const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          value: isActive,
                          onChanged: (val) {
                            setState(() {
                              isActive = val!;
                            });
                          }),
                    ),
                  );
                },
              ),
            ),
            DataCell(
              Image.asset('assets/heart1.png', height: 16),
            ),
            DataCell(Row(
              children: [
                const Text('Build custom and quick UI kits with evcp',
                    style: TextStyle(
                        color: Color(0xff9DA2A7),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'InterRegular',
                        fontSize: 14)),
                const SizedBox(
                  width: 5,
                ),
                Image.asset('assets/Ellipse 88.png', height: 5),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  'Are you...',
                  style: TextStyle(
                    color: Color(0xff9DA2A7),
                    fontSize: 14,
                    fontFamily: 'InterRegular',
                  ),
                )
              ],
            )),
            const DataCell(Text(
              'Dec 13, 2023 02:22',
              style: TextStyle(
                color: Color(0xff9DA2A7),
                fontFamily: 'InterRegular',
              ),
            )),
            DataCell(Stack(
              clipBehavior: Clip.none,
              children: [
                Transform.translate(
                  offset: const Offset(0, 0),
                  child: Container(
                    height: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.asset('assets/Avatar61.png'),
                  ),
                ),
                Positioned(
                    left: -10,
                    child: Transform.translate(
                      offset: const Offset(30, 0),
                      child: Container(
                        height: 32,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset('assets/Avatar62.png'),
                      ),
                    )),
              ],
            )),
            DataCell(Image.asset(
              'assets/tag-right.png',
              height: 16,
              color: const Color(0xffB0E4C8),
            )),
            DataCell(Image.asset(
              'assets/more.png',
              height: 16,
            )),
          ],
        );
      case 4:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return Transform.scale(
                    scale: 1.2,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side: const BorderSide(style: BorderStyle.none),
                          visualDensity: const VisualDensity(horizontal: -4),
                          activeColor: const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          value: isActive,
                          onChanged: (val) {
                            setState(() {
                              isActive = val!;
                            });
                          }),
                    ),
                  );
                },
              ),
            ),
            DataCell(
              Image.asset('assets/heart1.png', height: 16),
            ),
            DataCell(Row(
              children: [
                const Text('Wanna create a UI template? Check out this UI Kit',
                    style: TextStyle(
                        color: Color(0xff9DA2A7),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'InterRegular',
                        fontSize: 14)),
                const SizedBox(
                  width: 5,
                ),
                Image.asset('assets/Ellipse 88.png', height: 5),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  'Are you...',
                  style: TextStyle(
                    color: Color(0xff9DA2A7),
                    fontSize: 14,
                    fontFamily: 'InterRegular',
                  ),
                )
              ],
            )),
            const DataCell(Text(
              'Dec 30, 2019 07:52',
              style: TextStyle(
                color: Color(0xff9DA2A7),
                fontFamily: 'InterRegular',
              ),
            )),
            DataCell(Stack(
              clipBehavior: Clip.none,
              children: [
                Transform.translate(
                  offset: const Offset(0, 0),
                  child: Container(
                    height: 32,
                    decoration: BoxDecoration(
                      color: const Color(0xffE5646C),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.asset('assets/User Read.png'),
                  ),
                ),
                Positioned(
                    left: -10,
                    child: Transform.translate(
                      offset: const Offset(30, 0),
                      child: Container(
                        height: 32,
                        decoration: BoxDecoration(
                          color: const Color(0xffE5646C),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset('assets/Avatar72.png'),
                      ),
                    )),
                Positioned(
                    left: 5,
                    child: Transform.translate(
                      offset: const Offset(40, 0),
                      child: Container(
                        height: 32,
                        decoration: BoxDecoration(
                          color: const Color(0xffE5646C),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset('assets/User Read1.png'),
                      ),
                    )),
                Positioned(
                    child: Transform.translate(
                  offset: const Offset(70, 0),
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xffEEEEEE)),
                    child: const Center(
                        child: Text('+53',
                            style: TextStyle(
                                color: Color(0xff9DA2A7),
                                fontWeight: FontWeight.w600,
                                fontFamily: 'InterRegular',
                                fontSize: 10))),
                  ),
                ))
              ],
            )),
            DataCell(Image.asset(
              'assets/tag-right.png',
              height: 16,
            )),
            DataCell(Image.asset(
              'assets/more.png',
              height: 16,
            )),
          ],
        );
      case 5:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return Transform.scale(
                    scale: 1.2,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side: const BorderSide(style: BorderStyle.none),
                          visualDensity: const VisualDensity(horizontal: -4),
                          activeColor: const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          value: isActive,
                          onChanged: (val) {
                            setState(() {
                              isActive = val!;
                            });
                          }),
                    ),
                  );
                },
              ),
            ),
            DataCell(
              Image.asset('assets/heart1.png', height: 16),
            ),
            const DataCell(Row(
              children: [
                Text(
                    'See the amazing design of your next product before you build it',
                    style: TextStyle(
                        color: Color(0xff9DA2A7),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'InterRegular',
                        fontSize: 14)),
              ],
            )),
            const DataCell(Text(
              'Dec 20, 2020 05:22',
              style: TextStyle(
                color: Color(0xff9DA2A7),
                fontFamily: 'InterRegular',
              ),
            )),
            DataCell(Stack(
              clipBehavior: Clip.none,
              children: [
                Transform.translate(
                  offset: const Offset(0, 0),
                  child: Container(
                    height: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.asset('assets/Avatar61.png'),
                  ),
                ),
                Positioned(
                    left: -10,
                    child: Transform.translate(
                      offset: const Offset(30, 0),
                      child: Container(
                        height: 32,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset('assets/Avatar62.png'),
                      ),
                    )),
              ],
            )),
            DataCell(Image.asset(
              'assets/tag-right.png',
              height: 16,
              color: const Color(0xffB0E4C8),
            )),
            DataCell(Image.asset(
              'assets/more.png',
              height: 16,
            )),
          ],
        );
      case 6:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return Transform.scale(
                    scale: 1.2,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side: const BorderSide(style: BorderStyle.none),
                          visualDensity: const VisualDensity(horizontal: -4),
                          activeColor: const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          value: isActive,
                          onChanged: (val) {
                            setState(() {
                              isActive = val!;
                            });
                          }),
                    ),
                  );
                },
              ),
            ),
            DataCell(
              Image.asset('assets/heart1.png', height: 16),
            ),
            DataCell(Row(
              children: [
                const Text('Design a website with this UI Kit',
                    style: TextStyle(
                        color: Color(0xff9DA2A7),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'InterRegular',
                        fontSize: 14)),
                const SizedBox(
                  width: 5,
                ),
                Image.asset('assets/Ellipse 88.png', height: 5),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  'Thanks for contacting us. You ...',
                  style: TextStyle(
                    color: Color(0xff727880),
                    fontSize: 14,
                    fontFamily: 'InterRegular',
                  ),
                )
              ],
            )),
            const DataCell(Text(
              'Feb 3, 2012 14:57',
              style: TextStyle(
                color: Color(0xff9DA2A7),
                fontFamily: 'InterRegular',
              ),
            )),
            DataCell(Stack(
              clipBehavior: Clip.none,
              children: [
                Transform.translate(
                  offset: const Offset(0, 0),
                  child: Container(
                    height: 32,
                    decoration: BoxDecoration(
                      color: const Color(0xffE5646C),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.asset('assets/Avatar71.png'),
                  ),
                ),
              ],
            )),
            DataCell(Image.asset(
              'assets/tag-right.png',
              height: 16,
            )),
            DataCell(Image.asset(
              'assets/more.png',
              height: 16,
            )),
          ],
        );
      case 7:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return Transform.scale(
                    scale: 1.2,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side: const BorderSide(style: BorderStyle.none),
                          visualDensity: const VisualDensity(horizontal: -4),
                          activeColor: const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          value: isActive,
                          onChanged: (val) {
                            setState(() {
                              isActive = val!;
                            });
                          }),
                    ),
                  );
                },
              ),
            ),
            DataCell(
              Image.asset('assets/heart1.png', height: 16),
            ),
            DataCell(Row(
              children: [
                const Text('Build custom and quick UI kits with evcp',
                    style: TextStyle(
                        color: Color(0xff9DA2A7),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'InterRegular',
                        fontSize: 14)),
                const SizedBox(
                  width: 5,
                ),
                Image.asset('assets/Ellipse 88.png', height: 5),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  'Are you...',
                  style: TextStyle(
                    color: Color(0xff9DA2A7),
                    fontSize: 14,
                    fontFamily: 'InterRegular',
                  ),
                )
              ],
            )),
            const DataCell(Text(
              'Dec 13, 2023 02:22',
              style: TextStyle(
                color: Color(0xff9DA2A7),
                fontFamily: 'InterRegular',
              ),
            )),
            DataCell(Stack(
              clipBehavior: Clip.none,
              children: [
                Transform.translate(
                  offset: const Offset(0, 0),
                  child: Container(
                    height: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.asset('assets/Avatar61.png'),
                  ),
                ),
                Positioned(
                    left: -10,
                    child: Transform.translate(
                      offset: const Offset(30, 0),
                      child: Container(
                        height: 32,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset('assets/Avatar62.png'),
                      ),
                    )),
              ],
            )),
            DataCell(Image.asset(
              'assets/tag-right.png',
              height: 16,
              color: const Color(0xffB0E4C8),
            )),
            DataCell(Image.asset(
              'assets/more.png',
              height: 16,
            )),
          ],
        );
      case 8:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return Transform.scale(
                    scale: 1.2,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side: const BorderSide(style: BorderStyle.none),
                          visualDensity: const VisualDensity(horizontal: -4),
                          activeColor: const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          value: isActive,
                          onChanged: (val) {
                            setState(() {
                              isActive = val!;
                            });
                          }),
                    ),
                  );
                },
              ),
            ),
            DataCell(
              Image.asset('assets/heart1.png', height: 16),
            ),
            DataCell(Row(
              children: [
                const Text('Build custom and quick UI kits with evcp',
                    style: TextStyle(
                        color: Color(0xff9DA2A7),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'InterRegular',
                        fontSize: 14)),
                const SizedBox(
                  width: 5,
                ),
                Image.asset('assets/Ellipse 88.png', height: 5),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  'Are you...',
                  style: TextStyle(
                    color: Color(0xff9DA2A7),
                    fontSize: 14,
                    fontFamily: 'InterRegular',
                  ),
                )
              ],
            )),
            const DataCell(Text(
              'Dec 13, 2023 02:22',
              style: TextStyle(
                color: Color(0xff9DA2A7),
                fontFamily: 'InterRegular',
              ),
            )),
            DataCell(Stack(
              clipBehavior: Clip.none,
              children: [
                Transform.translate(
                  offset: const Offset(0, 0),
                  child: Container(
                    height: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.asset('assets/Avatar61.png'),
                  ),
                ),
                Positioned(
                    left: -10,
                    child: Transform.translate(
                      offset: const Offset(30, 0),
                      child: Container(
                        height: 32,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset('assets/Avatar62.png'),
                      ),
                    )),
              ],
            )),
            DataCell(Image.asset(
              'assets/tag-right.png',
              height: 16,
              color: const Color(0xffB0E4C8),
            )),
            DataCell(Image.asset(
              'assets/more.png',
              height: 16,
            )),
          ],
        );
      case 9:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return Transform.scale(
                    scale: 1.2,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side: const BorderSide(style: BorderStyle.none),
                          visualDensity: const VisualDensity(horizontal: -4),
                          activeColor: const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          value: isActive,
                          onChanged: (val) {
                            setState(() {
                              isActive = val!;
                            });
                          }),
                    ),
                  );
                },
              ),
            ),
            DataCell(
              Image.asset('assets/heart1.png', height: 16),
            ),
            DataCell(Row(
              children: [
                const Text('Wanna create a UI template? Check out this UI Kit',
                    style: TextStyle(
                        color: Color(0xff9DA2A7),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'InterRegular',
                        fontSize: 14)),
                const SizedBox(
                  width: 5,
                ),
                Image.asset('assets/Ellipse 88.png', height: 5),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  'Are you...',
                  style: TextStyle(
                    color: Color(0xff9DA2A7),
                    fontSize: 14,
                    fontFamily: 'InterRegular',
                  ),
                )
              ],
            )),
            const DataCell(Text(
              'Dec 30, 2019 07:52',
              style: TextStyle(
                color: Color(0xff9DA2A7),
                fontFamily: 'InterRegular',
              ),
            )),
            DataCell(Stack(
              clipBehavior: Clip.none,
              children: [
                Transform.translate(
                  offset: const Offset(0, 0),
                  child: Container(
                    height: 32,
                    decoration: BoxDecoration(
                      color: const Color(0xffE5646C),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.asset('assets/User Read.png'),
                  ),
                ),
                Positioned(
                    left: -10,
                    child: Transform.translate(
                      offset: const Offset(30, 0),
                      child: Container(
                        height: 32,
                        decoration: BoxDecoration(
                          color: const Color(0xffE5646C),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset('assets/Avatar72.png'),
                      ),
                    )),
                Positioned(
                    left: 5,
                    child: Transform.translate(
                      offset: const Offset(40, 0),
                      child: Container(
                        height: 32,
                        decoration: BoxDecoration(
                          color: const Color(0xffE5646C),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset('assets/User Read1.png'),
                      ),
                    )),
                Positioned(
                    child: Transform.translate(
                  offset: const Offset(70, 0),
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xffEEEEEE)),
                    child: const Center(
                        child: Text('+53',
                            style: TextStyle(
                                color: Color(0xff9DA2A7),
                                fontWeight: FontWeight.w600,
                                fontFamily: 'InterRegular',
                                fontSize: 10))),
                  ),
                ))
              ],
            )),
            DataCell(Image.asset(
              'assets/tag-right.png',
              height: 16,
            )),
            DataCell(Image.asset(
              'assets/more.png',
              height: 16,
            )),
          ],
        );
      case 10:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return Transform.scale(
                    scale: 1.2,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side: const BorderSide(style: BorderStyle.none),
                          visualDensity: const VisualDensity(horizontal: -4),
                          activeColor: const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          value: isActive,
                          onChanged: (val) {
                            setState(() {
                              isActive = val!;
                            });
                          }),
                    ),
                  );
                },
              ),
            ),
            DataCell(
              Image.asset('assets/heart1.png', height: 16),
            ),
            const DataCell(Row(
              children: [
                Text(
                    'See the amazing design of your next product before you build it',
                    style: TextStyle(
                        color: Color(0xff9DA2A7),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'InterRegular',
                        fontSize: 14)),
              ],
            )),
            const DataCell(Text(
              'Dec 20, 2020 05:22',
              style: TextStyle(
                color: Color(0xff9DA2A7),
                fontFamily: 'InterRegular',
              ),
            )),
            DataCell(Stack(
              clipBehavior: Clip.none,
              children: [
                Transform.translate(
                  offset: const Offset(0, 0),
                  child: Container(
                    height: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.asset('assets/Avatar61.png'),
                  ),
                ),
                Positioned(
                    left: -10,
                    child: Transform.translate(
                      offset: const Offset(30, 0),
                      child: Container(
                        height: 32,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset('assets/Avatar62.png'),
                      ),
                    )),
              ],
            )),
            DataCell(Image.asset(
              'assets/tag-right.png',
              height: 16,
              color: const Color(0xffB0E4C8),
            )),
            DataCell(Image.asset(
              'assets/more.png',
              height: 16,
            )),
          ],
        );
      case 11:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return Transform.scale(
                    scale: 1.2,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side: const BorderSide(style: BorderStyle.none),
                          visualDensity: const VisualDensity(horizontal: -4),
                          activeColor: const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          value: isActive,
                          onChanged: (val) {
                            setState(() {
                              isActive = val!;
                            });
                          }),
                    ),
                  );
                },
              ),
            ),
            DataCell(
              Image.asset('assets/heart1.png', height: 16),
            ),
            DataCell(Row(
              children: [
                const Text('Design a website with this UI Kit',
                    style: TextStyle(
                        color: Color(0xff9DA2A7),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'InterRegular',
                        fontSize: 14)),
                const SizedBox(
                  width: 5,
                ),
                Image.asset('assets/Ellipse 88.png', height: 5),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  'Thanks for contacting us. You ...',
                  style: TextStyle(
                    color: Color(0xff727880),
                    fontSize: 14,
                    fontFamily: 'InterRegular',
                  ),
                )
              ],
            )),
            const DataCell(Text(
              'Feb 3, 2012 14:57',
              style: TextStyle(
                color: Color(0xff9DA2A7),
                fontFamily: 'InterRegular',
              ),
            )),
            DataCell(Stack(
              clipBehavior: Clip.none,
              children: [
                Transform.translate(
                  offset: const Offset(0, 0),
                  child: Container(
                    height: 32,
                    decoration: BoxDecoration(
                      color: const Color(0xffE5646C),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.asset('assets/Avatar71.png'),
                  ),
                ),
              ],
            )),
            DataCell(Image.asset(
              'assets/tag-right.png',
              height: 16,
            )),
            DataCell(Image.asset(
              'assets/more.png',
              height: 16,
            )),
          ],
        );
      case 12:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return Transform.scale(
                    scale: 1.2,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side: const BorderSide(style: BorderStyle.none),
                          visualDensity: const VisualDensity(horizontal: -4),
                          activeColor: const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          value: isActive,
                          onChanged: (val) {
                            setState(() {
                              isActive = val!;
                            });
                          }),
                    ),
                  );
                },
              ),
            ),
            DataCell(
              Image.asset('assets/heart1.png', height: 16),
            ),
            DataCell(Row(
              children: [
                const Text('Build custom and quick UI kits with evcp',
                    style: TextStyle(
                        color: Color(0xff9DA2A7),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'InterRegular',
                        fontSize: 14)),
                const SizedBox(
                  width: 5,
                ),
                Image.asset('assets/Ellipse 88.png', height: 5),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  'Are you...',
                  style: TextStyle(
                    color: Color(0xff9DA2A7),
                    fontSize: 14,
                    fontFamily: 'InterRegular',
                  ),
                )
              ],
            )),
            const DataCell(Text(
              'Dec 13, 2023 02:22',
              style: TextStyle(
                color: Color(0xff9DA2A7),
                fontFamily: 'InterRegular',
              ),
            )),
            DataCell(Stack(
              clipBehavior: Clip.none,
              children: [
                Transform.translate(
                  offset: const Offset(0, 0),
                  child: Container(
                    height: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.asset('assets/Avatar61.png'),
                  ),
                ),
                Positioned(
                    left: -10,
                    child: Transform.translate(
                      offset: const Offset(30, 0),
                      child: Container(
                        height: 32,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset('assets/Avatar62.png'),
                      ),
                    )),
              ],
            )),
            DataCell(Image.asset(
              'assets/tag-right.png',
              height: 16,
              color: const Color(0xffB0E4C8),
            )),
            DataCell(Image.asset(
              'assets/more.png',
              height: 16,
            )),
          ],
        );
      case 13:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return Transform.scale(
                    scale: 1.2,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side: const BorderSide(style: BorderStyle.none),
                          visualDensity: const VisualDensity(horizontal: -4),
                          activeColor: const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          value: isActive,
                          onChanged: (val) {
                            setState(() {
                              isActive = val!;
                            });
                          }),
                    ),
                  );
                },
              ),
            ),
            DataCell(
              Image.asset('assets/heart1.png', height: 16),
            ),
            DataCell(Row(
              children: [
                const Text('Wanna create a UI template? Check out this UI Kit',
                    style: TextStyle(
                        color: Color(0xff9DA2A7),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'InterRegular',
                        fontSize: 14)),
                const SizedBox(
                  width: 5,
                ),
                Image.asset('assets/Ellipse 88.png', height: 5),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  'Are you...',
                  style: TextStyle(
                    color: Color(0xff9DA2A7),
                    fontSize: 14,
                    fontFamily: 'InterRegular',
                  ),
                )
              ],
            )),
            const DataCell(Text(
              'Dec 30, 2019 07:52',
              style: TextStyle(
                color: Color(0xff9DA2A7),
                fontFamily: 'InterRegular',
              ),
            )),
            DataCell(Stack(
              clipBehavior: Clip.none,
              children: [
                Transform.translate(
                  offset: const Offset(0, 0),
                  child: Container(
                    height: 32,
                    decoration: BoxDecoration(
                      color: const Color(0xffE5646C),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.asset('assets/User Read.png'),
                  ),
                ),
                Positioned(
                    left: -10,
                    child: Transform.translate(
                      offset: const Offset(30, 0),
                      child: Container(
                        height: 32,
                        decoration: BoxDecoration(
                          color: const Color(0xffE5646C),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset('assets/Avatar72.png'),
                      ),
                    )),
                Positioned(
                    left: 5,
                    child: Transform.translate(
                      offset: const Offset(40, 0),
                      child: Container(
                        height: 32,
                        decoration: BoxDecoration(
                          color: const Color(0xffE5646C),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset('assets/User Read1.png'),
                      ),
                    )),
                Positioned(
                    child: Transform.translate(
                  offset: const Offset(70, 0),
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xffEEEEEE)),
                    child: const Center(
                        child: Text('+53',
                            style: TextStyle(
                                color: Color(0xff9DA2A7),
                                fontWeight: FontWeight.w600,
                                fontFamily: 'InterRegular',
                                fontSize: 10))),
                  ),
                ))
              ],
            )),
            DataCell(Image.asset(
              'assets/tag-right.png',
              height: 16,
            )),
            DataCell(Image.asset(
              'assets/more.png',
              height: 16,
            )),
          ],
        );
      case 14:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return Transform.scale(
                    scale: 1.2,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side: const BorderSide(style: BorderStyle.none),
                          visualDensity: const VisualDensity(horizontal: -4),
                          activeColor: const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          value: isActive,
                          onChanged: (val) {
                            setState(() {
                              isActive = val!;
                            });
                          }),
                    ),
                  );
                },
              ),
            ),
            DataCell(
              Image.asset('assets/heart1.png', height: 16),
            ),
            const DataCell(Row(
              children: [
                Text(
                    'See the amazing design of your next product before you build it',
                    style: TextStyle(
                        color: Color(0xff9DA2A7),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'InterRegular',
                        fontSize: 14)),
              ],
            )),
            const DataCell(Text(
              'Dec 20, 2020 05:22',
              style: TextStyle(
                color: Color(0xff9DA2A7),
                fontFamily: 'InterRegular',
              ),
            )),
            DataCell(Stack(
              clipBehavior: Clip.none,
              children: [
                Transform.translate(
                  offset: const Offset(0, 0),
                  child: Container(
                    height: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.asset('assets/Avatar61.png'),
                  ),
                ),
                Positioned(
                    left: -10,
                    child: Transform.translate(
                      offset: const Offset(30, 0),
                      child: Container(
                        height: 32,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset('assets/Avatar62.png'),
                      ),
                    )),
              ],
            )),
            DataCell(Image.asset(
              'assets/tag-right.png',
              height: 16,
              color: const Color(0xffB0E4C8),
            )),
            DataCell(Image.asset(
              'assets/more.png',
              height: 16,
            )),
          ],
        );
      case 15:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return Transform.scale(
                    scale: 1.2,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side: const BorderSide(style: BorderStyle.none),
                          visualDensity: const VisualDensity(horizontal: -4),
                          activeColor: const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          value: isActive,
                          onChanged: (val) {
                            setState(() {
                              isActive = val!;
                            });
                          }),
                    ),
                  );
                },
              ),
            ),
            DataCell(
              Image.asset('assets/heart1.png', height: 16),
            ),
            DataCell(Row(
              children: [
                const Text('Design a website with this UI Kit',
                    style: TextStyle(
                        color: Color(0xff9DA2A7),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'InterRegular',
                        fontSize: 14)),
                const SizedBox(
                  width: 5,
                ),
                Image.asset('assets/Ellipse 88.png', height: 5),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  'Thanks for contacting us. You ...',
                  style: TextStyle(
                    color: Color(0xff727880),
                    fontSize: 14,
                    fontFamily: 'InterRegular',
                  ),
                )
              ],
            )),
            const DataCell(Text(
              'Feb 3, 2012 14:57',
              style: TextStyle(
                color: Color(0xff9DA2A7),
                fontFamily: 'InterRegular',
              ),
            )),
            DataCell(Stack(
              clipBehavior: Clip.none,
              children: [
                Transform.translate(
                  offset: const Offset(0, 0),
                  child: Container(
                    height: 32,
                    decoration: BoxDecoration(
                      color: const Color(0xffE5646C),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.asset('assets/Avatar71.png'),
                  ),
                ),
              ],
            )),
            DataCell(Image.asset(
              'assets/tag-right.png',
              height: 16,
            )),
            DataCell(Image.asset(
              'assets/more.png',
              height: 16,
            )),
          ],
        );
      case 16:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return Transform.scale(
                    scale: 1.2,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side: const BorderSide(style: BorderStyle.none),
                          visualDensity: const VisualDensity(horizontal: -4),
                          activeColor: const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          value: isActive,
                          onChanged: (val) {
                            setState(() {
                              isActive = val!;
                            });
                          }),
                    ),
                  );
                },
              ),
            ),
            DataCell(
              Image.asset('assets/heart1.png', height: 16),
            ),
            DataCell(Row(
              children: [
                const Text('Build custom and quick UI kits with evcp',
                    style: TextStyle(
                        color: Color(0xff9DA2A7),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'InterRegular',
                        fontSize: 14)),
                const SizedBox(
                  width: 5,
                ),
                Image.asset('assets/Ellipse 88.png', height: 5),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  'Are you...',
                  style: TextStyle(
                    color: Color(0xff9DA2A7),
                    fontSize: 14,
                    fontFamily: 'InterRegular',
                  ),
                )
              ],
            )),
            const DataCell(Text(
              'Dec 13, 2023 02:22',
              style: TextStyle(
                color: Color(0xff9DA2A7),
                fontFamily: 'InterRegular',
              ),
            )),
            DataCell(Stack(
              clipBehavior: Clip.none,
              children: [
                Transform.translate(
                  offset: const Offset(0, 0),
                  child: Container(
                    height: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.asset('assets/Avatar61.png'),
                  ),
                ),
                Positioned(
                    left: -10,
                    child: Transform.translate(
                      offset: const Offset(30, 0),
                      child: Container(
                        height: 32,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset('assets/Avatar62.png'),
                      ),
                    )),
              ],
            )),
            DataCell(Image.asset(
              'assets/tag-right.png',
              height: 16,
              color: const Color(0xffB0E4C8),
            )),
            DataCell(Image.asset(
              'assets/more.png',
              height: 16,
            )),
          ],
        );
      case 17:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return Transform.scale(
                    scale: 1.2,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side: const BorderSide(style: BorderStyle.none),
                          visualDensity: const VisualDensity(horizontal: -4),
                          activeColor: const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          value: isActive,
                          onChanged: (val) {
                            setState(() {
                              isActive = val!;
                            });
                          }),
                    ),
                  );
                },
              ),
            ),
            DataCell(
              Image.asset('assets/heart1.png', height: 16),
            ),
            DataCell(Row(
              children: [
                const Text('Build custom and quick UI kits with evcp',
                    style: TextStyle(
                        color: Color(0xff9DA2A7),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'InterRegular',
                        fontSize: 14)),
                const SizedBox(
                  width: 5,
                ),
                Image.asset('assets/Ellipse 88.png', height: 5),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  'Are you...',
                  style: TextStyle(
                    color: Color(0xff9DA2A7),
                    fontSize: 14,
                    fontFamily: 'InterRegular',
                  ),
                )
              ],
            )),
            const DataCell(Text(
              'Dec 13, 2023 02:22',
              style: TextStyle(
                color: Color(0xff9DA2A7),
                fontFamily: 'InterRegular',
              ),
            )),
            DataCell(Stack(
              clipBehavior: Clip.none,
              children: [
                Transform.translate(
                  offset: const Offset(0, 0),
                  child: Container(
                    height: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.asset('assets/Avatar61.png'),
                  ),
                ),
                Positioned(
                    left: -10,
                    child: Transform.translate(
                      offset: const Offset(30, 0),
                      child: Container(
                        height: 32,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset('assets/Avatar62.png'),
                      ),
                    )),
              ],
            )),
            DataCell(Image.asset(
              'assets/tag-right.png',
              height: 16,
              color: const Color(0xffB0E4C8),
            )),
            DataCell(Image.asset(
              'assets/more.png',
              height: 16,
            )),
          ],
        );
      case 18:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return Transform.scale(
                    scale: 1.2,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side: const BorderSide(style: BorderStyle.none),
                          visualDensity: const VisualDensity(horizontal: -4),
                          activeColor: const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          value: isActive,
                          onChanged: (val) {
                            setState(() {
                              isActive = val!;
                            });
                          }),
                    ),
                  );
                },
              ),
            ),
            DataCell(
              Image.asset('assets/heart1.png', height: 16),
            ),
            DataCell(Row(
              children: [
                const Text('Wanna create a UI template? Check out this UI Kit',
                    style: TextStyle(
                        color: Color(0xff9DA2A7),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'InterRegular',
                        fontSize: 14)),
                const SizedBox(
                  width: 5,
                ),
                Image.asset('assets/Ellipse 88.png', height: 5),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  'Are you...',
                  style: TextStyle(
                    color: Color(0xff9DA2A7),
                    fontSize: 14,
                    fontFamily: 'InterRegular',
                  ),
                )
              ],
            )),
            const DataCell(Text(
              'Dec 30, 2019 07:52',
              style: TextStyle(
                color: Color(0xff9DA2A7),
                fontFamily: 'InterRegular',
              ),
            )),
            DataCell(Stack(
              clipBehavior: Clip.none,
              children: [
                Transform.translate(
                  offset: const Offset(0, 0),
                  child: Container(
                    height: 32,
                    decoration: BoxDecoration(
                      color: const Color(0xffE5646C),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.asset('assets/User Read.png'),
                  ),
                ),
                Positioned(
                    left: -10,
                    child: Transform.translate(
                      offset: const Offset(30, 0),
                      child: Container(
                        height: 32,
                        decoration: BoxDecoration(
                          color: const Color(0xffE5646C),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset('assets/Avatar72.png'),
                      ),
                    )),
                Positioned(
                    left: 5,
                    child: Transform.translate(
                      offset: const Offset(40, 0),
                      child: Container(
                        height: 32,
                        decoration: BoxDecoration(
                          color: const Color(0xffE5646C),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset('assets/User Read1.png'),
                      ),
                    )),
                Positioned(
                    child: Transform.translate(
                  offset: const Offset(70, 0),
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xffEEEEEE)),
                    child: const Center(
                        child: Text('+53',
                            style: TextStyle(
                                color: Color(0xff9DA2A7),
                                fontWeight: FontWeight.w600,
                                fontFamily: 'InterRegular',
                                fontSize: 10))),
                  ),
                ))
              ],
            )),
            DataCell(Image.asset(
              'assets/tag-right.png',
              height: 16,
            )),
            DataCell(Image.asset(
              'assets/more.png',
              height: 16,
            )),
          ],
        );
      case 19:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return Transform.scale(
                    scale: 1.2,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side: const BorderSide(style: BorderStyle.none),
                          visualDensity: const VisualDensity(horizontal: -4),
                          activeColor: const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          value: isActive,
                          onChanged: (val) {
                            setState(() {
                              isActive = val!;
                            });
                          }),
                    ),
                  );
                },
              ),
            ),
            DataCell(
              Image.asset('assets/heart1.png', height: 16),
            ),
            const DataCell(Row(
              children: [
                Text(
                    'See the amazing design of your next product before you build it',
                    style: TextStyle(
                        color: Color(0xff9DA2A7),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'InterRegular',
                        fontSize: 14)),
              ],
            )),
            const DataCell(Text(
              'Dec 20, 2020 05:22',
              style: TextStyle(
                color: Color(0xff9DA2A7),
                fontFamily: 'InterRegular',
              ),
            )),
            DataCell(Stack(
              clipBehavior: Clip.none,
              children: [
                Transform.translate(
                  offset: const Offset(0, 0),
                  child: Container(
                    height: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.asset('assets/Avatar61.png'),
                  ),
                ),
                Positioned(
                    left: -10,
                    child: Transform.translate(
                      offset: const Offset(30, 0),
                      child: Container(
                        height: 32,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset('assets/Avatar62.png'),
                      ),
                    )),
              ],
            )),
            DataCell(Image.asset(
              'assets/tag-right.png',
              height: 16,
              color: const Color(0xffB0E4C8),
            )),
            DataCell(Image.asset(
              'assets/more.png',
              height: 16,
            )),
          ],
        );
      case 20:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return Transform.scale(
                    scale: 1.2,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side: const BorderSide(style: BorderStyle.none),
                          visualDensity: const VisualDensity(horizontal: -4),
                          activeColor: const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          value: isActive,
                          onChanged: (val) {
                            setState(() {
                              isActive = val!;
                            });
                          }),
                    ),
                  );
                },
              ),
            ),
            DataCell(
              Image.asset('assets/heart1.png', height: 16),
            ),
            DataCell(Row(
              children: [
                const Text('Design a website with this UI Kit',
                    style: TextStyle(
                        color: Color(0xff9DA2A7),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'InterRegular',
                        fontSize: 14)),
                const SizedBox(
                  width: 5,
                ),
                Image.asset('assets/Ellipse 88.png', height: 5),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  'Thanks for contacting us. You ...',
                  style: TextStyle(
                    color: Color(0xff727880),
                    fontSize: 14,
                    fontFamily: 'InterRegular',
                  ),
                )
              ],
            )),
            const DataCell(Text(
              'Feb 3, 2012 14:57',
              style: TextStyle(
                color: Color(0xff9DA2A7),
                fontFamily: 'InterRegular',
              ),
            )),
            DataCell(Stack(
              clipBehavior: Clip.none,
              children: [
                Transform.translate(
                  offset: const Offset(0, 0),
                  child: Container(
                    height: 32,
                    decoration: BoxDecoration(
                      color: const Color(0xffE5646C),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.asset('assets/Avatar71.png'),
                  ),
                ),
              ],
            )),
            DataCell(Image.asset(
              'assets/tag-right.png',
              height: 16,
            )),
            DataCell(Image.asset(
              'assets/more.png',
              height: 16,
            )),
          ],
        );
      case 21:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return Transform.scale(
                    scale: 1.2,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side: const BorderSide(style: BorderStyle.none),
                          visualDensity: const VisualDensity(horizontal: -4),
                          activeColor: const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          value: isActive,
                          onChanged: (val) {
                            setState(() {
                              isActive = val!;
                            });
                          }),
                    ),
                  );
                },
              ),
            ),
            DataCell(
              Image.asset('assets/heart1.png', height: 16),
            ),
            DataCell(Row(
              children: [
                const Text('Build custom and quick UI kits with evcp',
                    style: TextStyle(
                        color: Color(0xff9DA2A7),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'InterRegular',
                        fontSize: 14)),
                const SizedBox(
                  width: 5,
                ),
                Image.asset('assets/Ellipse 88.png', height: 5),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  'Are you...',
                  style: TextStyle(
                    color: Color(0xff9DA2A7),
                    fontSize: 14,
                    fontFamily: 'InterRegular',
                  ),
                )
              ],
            )),
            const DataCell(Text(
              'Dec 13, 2023 02:22',
              style: TextStyle(
                color: Color(0xff9DA2A7),
                fontFamily: 'InterRegular',
              ),
            )),
            DataCell(Stack(
              clipBehavior: Clip.none,
              children: [
                Transform.translate(
                  offset: const Offset(0, 0),
                  child: Container(
                    height: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.asset('assets/Avatar61.png'),
                  ),
                ),
                Positioned(
                    left: -10,
                    child: Transform.translate(
                      offset: const Offset(30, 0),
                      child: Container(
                        height: 32,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset('assets/Avatar62.png'),
                      ),
                    )),
              ],
            )),
            DataCell(Image.asset(
              'assets/tag-right.png',
              height: 16,
              color: const Color(0xffB0E4C8),
            )),
            DataCell(Image.asset(
              'assets/more.png',
              height: 16,
            )),
          ],
        );
      case 22:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return Transform.scale(
                    scale: 1.2,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side: const BorderSide(style: BorderStyle.none),
                          visualDensity: const VisualDensity(horizontal: -4),
                          activeColor: const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          value: isActive,
                          onChanged: (val) {
                            setState(() {
                              isActive = val!;
                            });
                          }),
                    ),
                  );
                },
              ),
            ),
            DataCell(
              Image.asset('assets/heart1.png', height: 16),
            ),
            DataCell(Row(
              children: [
                const Text('Wanna create a UI template? Check out this UI Kit',
                    style: TextStyle(
                        color: Color(0xff9DA2A7),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'InterRegular',
                        fontSize: 14)),
                const SizedBox(
                  width: 5,
                ),
                Image.asset('assets/Ellipse 88.png', height: 5),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  'Are you...',
                  style: TextStyle(
                    color: Color(0xff9DA2A7),
                    fontSize: 14,
                    fontFamily: 'InterRegular',
                  ),
                )
              ],
            )),
            const DataCell(Text(
              'Dec 30, 2019 07:52',
              style: TextStyle(
                color: Color(0xff9DA2A7),
                fontFamily: 'InterRegular',
              ),
            )),
            DataCell(Stack(
              clipBehavior: Clip.none,
              children: [
                Transform.translate(
                  offset: const Offset(0, 0),
                  child: Container(
                    height: 32,
                    decoration: BoxDecoration(
                      color: const Color(0xffE5646C),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.asset('assets/User Read.png'),
                  ),
                ),
                Positioned(
                    left: -10,
                    child: Transform.translate(
                      offset: const Offset(30, 0),
                      child: Container(
                        height: 32,
                        decoration: BoxDecoration(
                          color: const Color(0xffE5646C),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset('assets/Avatar72.png'),
                      ),
                    )),
                Positioned(
                    left: 5,
                    child: Transform.translate(
                      offset: const Offset(40, 0),
                      child: Container(
                        height: 32,
                        decoration: BoxDecoration(
                          color: const Color(0xffE5646C),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset('assets/User Read1.png'),
                      ),
                    )),
                Positioned(
                    child: Transform.translate(
                  offset: const Offset(70, 0),
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xffEEEEEE)),
                    child: const Center(
                        child: Text('+53',
                            style: TextStyle(
                                color: Color(0xff9DA2A7),
                                fontWeight: FontWeight.w600,
                                fontFamily: 'InterRegular',
                                fontSize: 10))),
                  ),
                ))
              ],
            )),
            DataCell(Image.asset(
              'assets/tag-right.png',
              height: 16,
            )),
            DataCell(Image.asset(
              'assets/more.png',
              height: 16,
            )),
          ],
        );
      case 23:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return Transform.scale(
                    scale: 1.2,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side: const BorderSide(style: BorderStyle.none),
                          visualDensity: const VisualDensity(horizontal: -4),
                          activeColor: const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          value: isActive,
                          onChanged: (val) {
                            setState(() {
                              isActive = val!;
                            });
                          }),
                    ),
                  );
                },
              ),
            ),
            DataCell(
              Image.asset('assets/heart1.png', height: 16),
            ),
            const DataCell(Row(
              children: [
                Text(
                    'See the amazing design of your next product before you build it',
                    style: TextStyle(
                        color: Color(0xff9DA2A7),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'InterRegular',
                        fontSize: 14)),
              ],
            )),
            const DataCell(Text(
              'Dec 20, 2020 05:22',
              style: TextStyle(
                color: Color(0xff9DA2A7),
                fontFamily: 'InterRegular',
              ),
            )),
            DataCell(Stack(
              clipBehavior: Clip.none,
              children: [
                Transform.translate(
                  offset: const Offset(0, 0),
                  child: Container(
                    height: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.asset('assets/Avatar61.png'),
                  ),
                ),
                Positioned(
                    left: -10,
                    child: Transform.translate(
                      offset: const Offset(30, 0),
                      child: Container(
                        height: 32,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset('assets/Avatar62.png'),
                      ),
                    )),
              ],
            )),
            DataCell(Image.asset(
              'assets/tag-right.png',
              height: 16,
              color: const Color(0xffB0E4C8),
            )),
            DataCell(Image.asset(
              'assets/more.png',
              height: 16,
            )),
          ],
        );
      case 24:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return Transform.scale(
                    scale: 1.2,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side: const BorderSide(style: BorderStyle.none),
                          visualDensity: const VisualDensity(horizontal: -4),
                          activeColor: const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          value: isActive,
                          onChanged: (val) {
                            setState(() {
                              isActive = val!;
                            });
                          }),
                    ),
                  );
                },
              ),
            ),
            DataCell(
              Image.asset('assets/heart1.png', height: 16),
            ),
            const DataCell(Row(
              children: [
                Text(
                    'See the amazing design of your next product before you build it',
                    style: TextStyle(
                        color: Color(0xff9DA2A7),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'InterRegular',
                        fontSize: 14)),
              ],
            )),
            const DataCell(Text(
              'Dec 20, 2020 05:22',
              style: TextStyle(
                color: Color(0xff9DA2A7),
                fontFamily: 'InterRegular',
              ),
            )),
            DataCell(Stack(
              clipBehavior: Clip.none,
              children: [
                Transform.translate(
                  offset: const Offset(0, 0),
                  child: Container(
                    height: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.asset('assets/Avatar61.png'),
                  ),
                ),
                Positioned(
                    left: -10,
                    child: Transform.translate(
                      offset: const Offset(30, 0),
                      child: Container(
                        height: 32,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset('assets/Avatar62.png'),
                      ),
                    )),
              ],
            )),
            DataCell(Image.asset(
              'assets/tag-right.png',
              height: 16,
              color: const Color(0xffB0E4C8),
            )),
            DataCell(Image.asset(
              'assets/more.png',
              height: 16,
            )),
          ],
        );
      case 25:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return Transform.scale(
                    scale: 1.2,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side: const BorderSide(style: BorderStyle.none),
                          visualDensity: const VisualDensity(horizontal: -4),
                          activeColor: const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          value: isActive,
                          onChanged: (val) {
                            setState(() {
                              isActive = val!;
                            });
                          }),
                    ),
                  );
                },
              ),
            ),
            DataCell(
              Image.asset('assets/heart1.png', height: 16),
            ),
            DataCell(Row(
              children: [
                const Text('Design a website with this UI Kit',
                    style: TextStyle(
                        color: Color(0xff9DA2A7),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'InterRegular',
                        fontSize: 14)),
                const SizedBox(
                  width: 5,
                ),
                Image.asset('assets/Ellipse 88.png', height: 5),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  'Thanks for contacting us. You ...',
                  style: TextStyle(
                    color: Color(0xff727880),
                    fontSize: 14,
                    fontFamily: 'InterRegular',
                  ),
                )
              ],
            )),
            const DataCell(Text(
              'Feb 3, 2012 14:57',
              style: TextStyle(
                color: Color(0xff9DA2A7),
                fontFamily: 'InterRegular',
              ),
            )),
            DataCell(Stack(
              clipBehavior: Clip.none,
              children: [
                Transform.translate(
                  offset: const Offset(0, 0),
                  child: Container(
                    height: 32,
                    decoration: BoxDecoration(
                      color: const Color(0xffE5646C),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.asset('assets/Avatar71.png'),
                  ),
                ),
              ],
            )),
            DataCell(Image.asset(
              'assets/tag-right.png',
              height: 16,
            )),
            DataCell(Image.asset(
              'assets/more.png',
              height: 16,
            )),
          ],
        );
      case 26:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return Transform.scale(
                    scale: 1.2,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side: const BorderSide(style: BorderStyle.none),
                          visualDensity: const VisualDensity(horizontal: -4),
                          activeColor: const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          value: isActive,
                          onChanged: (val) {
                            setState(() {
                              isActive = val!;
                            });
                          }),
                    ),
                  );
                },
              ),
            ),
            DataCell(
              Image.asset('assets/heart1.png', height: 16),
            ),
            DataCell(Row(
              children: [
                const Text('Build custom and quick UI kits with evcp',
                    style: TextStyle(
                        color: Color(0xff9DA2A7),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'InterRegular',
                        fontSize: 14)),
                const SizedBox(
                  width: 5,
                ),
                Image.asset('assets/Ellipse 88.png', height: 5),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  'Are you...',
                  style: TextStyle(
                    color: Color(0xff9DA2A7),
                    fontSize: 14,
                    fontFamily: 'InterRegular',
                  ),
                )
              ],
            )),
            const DataCell(Text(
              'Dec 13, 2023 02:22',
              style: TextStyle(
                color: Color(0xff9DA2A7),
                fontFamily: 'InterRegular',
              ),
            )),
            DataCell(Stack(
              clipBehavior: Clip.none,
              children: [
                Transform.translate(
                  offset: const Offset(0, 0),
                  child: Container(
                    height: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.asset('assets/Avatar61.png'),
                  ),
                ),
                Positioned(
                    left: -10,
                    child: Transform.translate(
                      offset: const Offset(30, 0),
                      child: Container(
                        height: 32,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset('assets/Avatar62.png'),
                      ),
                    )),
              ],
            )),
            DataCell(Image.asset(
              'assets/tag-right.png',
              height: 16,
              color: const Color(0xffB0E4C8),
            )),
            DataCell(Image.asset(
              'assets/more.png',
              height: 16,
            )),
          ],
        );
      case 27:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return Transform.scale(
                    scale: 1.2,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side: const BorderSide(style: BorderStyle.none),
                          visualDensity: const VisualDensity(horizontal: -4),
                          activeColor: const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          value: isActive,
                          onChanged: (val) {
                            setState(() {
                              isActive = val!;
                            });
                          }),
                    ),
                  );
                },
              ),
            ),
            DataCell(
              Image.asset('assets/heart1.png', height: 16),
            ),
            DataCell(Row(
              children: [
                const Text('Wanna create a UI template? Check out this UI Kit',
                    style: TextStyle(
                        color: Color(0xff9DA2A7),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'InterRegular',
                        fontSize: 14)),
                const SizedBox(
                  width: 5,
                ),
                Image.asset('assets/Ellipse 88.png', height: 5),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  'Are you...',
                  style: TextStyle(
                    color: Color(0xff9DA2A7),
                    fontSize: 14,
                    fontFamily: 'InterRegular',
                  ),
                )
              ],
            )),
            const DataCell(Text(
              'Dec 30, 2019 07:52',
              style: TextStyle(
                color: Color(0xff9DA2A7),
                fontFamily: 'InterRegular',
              ),
            )),
            DataCell(Stack(
              clipBehavior: Clip.none,
              children: [
                Transform.translate(
                  offset: const Offset(0, 0),
                  child: Container(
                    height: 32,
                    decoration: BoxDecoration(
                      color: const Color(0xffE5646C),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.asset('assets/User Read.png'),
                  ),
                ),
                Positioned(
                    left: -10,
                    child: Transform.translate(
                      offset: const Offset(30, 0),
                      child: Container(
                        height: 32,
                        decoration: BoxDecoration(
                          color: const Color(0xffE5646C),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset('assets/Avatar72.png'),
                      ),
                    )),
                Positioned(
                    left: 5,
                    child: Transform.translate(
                      offset: const Offset(40, 0),
                      child: Container(
                        height: 32,
                        decoration: BoxDecoration(
                          color: const Color(0xffE5646C),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset('assets/User Read1.png'),
                      ),
                    )),
                Positioned(
                    child: Transform.translate(
                  offset: const Offset(70, 0),
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xffEEEEEE)),
                    child: const Center(
                        child: Text('+53',
                            style: TextStyle(
                                color: Color(0xff9DA2A7),
                                fontWeight: FontWeight.w600,
                                fontFamily: 'InterRegular',
                                fontSize: 10))),
                  ),
                ))
              ],
            )),
            DataCell(Image.asset(
              'assets/tag-right.png',
              height: 16,
            )),
            DataCell(Image.asset(
              'assets/more.png',
              height: 16,
            )),
          ],
        );
      case 28:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return Transform.scale(
                    scale: 1.2,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side: const BorderSide(style: BorderStyle.none),
                          visualDensity: const VisualDensity(horizontal: -4),
                          activeColor: const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          value: isActive,
                          onChanged: (val) {
                            setState(() {
                              isActive = val!;
                            });
                          }),
                    ),
                  );
                },
              ),
            ),
            DataCell(
              Image.asset('assets/heart1.png', height: 16),
            ),
            const DataCell(Row(
              children: [
                Text(
                    'See the amazing design of your next product before you build it',
                    style: TextStyle(
                        color: Color(0xff9DA2A7),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'InterRegular',
                        fontSize: 14)),
              ],
            )),
            const DataCell(Text(
              'Dec 20, 2020 05:22',
              style: TextStyle(
                color: Color(0xff9DA2A7),
                fontFamily: 'InterRegular',
              ),
            )),
            DataCell(Stack(
              clipBehavior: Clip.none,
              children: [
                Transform.translate(
                  offset: const Offset(0, 0),
                  child: Container(
                    height: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.asset('assets/Avatar61.png'),
                  ),
                ),
                Positioned(
                    left: -10,
                    child: Transform.translate(
                      offset: const Offset(30, 0),
                      child: Container(
                        height: 32,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset('assets/Avatar62.png'),
                      ),
                    )),
              ],
            )),
            DataCell(Image.asset(
              'assets/tag-right.png',
              height: 16,
              color: const Color(0xffB0E4C8),
            )),
            DataCell(Image.asset(
              'assets/more.png',
              height: 16,
            )),
          ],
        );
      case 29:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return Transform.scale(
                    scale: 1.2,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side: const BorderSide(style: BorderStyle.none),
                          visualDensity: const VisualDensity(horizontal: -4),
                          activeColor: const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          value: isActive,
                          onChanged: (val) {
                            setState(() {
                              isActive = val!;
                            });
                          }),
                    ),
                  );
                },
              ),
            ),
            DataCell(
              Image.asset('assets/heart1.png', height: 16),
            ),
            DataCell(Row(
              children: [
                const Text('Design a website with this UI Kit',
                    style: TextStyle(
                        color: Color(0xff9DA2A7),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'InterRegular',
                        fontSize: 14)),
                const SizedBox(
                  width: 5,
                ),
                Image.asset('assets/Ellipse 88.png', height: 5),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  'Thanks for contacting us. You ...',
                  style: TextStyle(
                    color: Color(0xff727880),
                    fontSize: 14,
                    fontFamily: 'InterRegular',
                  ),
                )
              ],
            )),
            const DataCell(Text(
              'Feb 3, 2012 14:57',
              style: TextStyle(
                color: Color(0xff9DA2A7),
                fontFamily: 'InterRegular',
              ),
            )),
            DataCell(Stack(
              clipBehavior: Clip.none,
              children: [
                Transform.translate(
                  offset: const Offset(0, 0),
                  child: Container(
                    height: 32,
                    decoration: BoxDecoration(
                      color: const Color(0xffE5646C),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.asset('assets/Avatar71.png'),
                  ),
                ),
              ],
            )),
            DataCell(Image.asset(
              'assets/tag-right.png',
              height: 16,
            )),
            DataCell(Image.asset(
              'assets/more.png',
              height: 16,
            )),
          ],
        );
    }
    return null;
  }
}
