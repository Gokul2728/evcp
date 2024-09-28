// ignore_for_file: prefer_const_constructors, file_names, camel_case_types
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:evcp/confing/colors.dart';
import 'package:evcp/confing/list.dart';

import '../../confing/notifier.dart';
import '../../controller/page_controller.dart';
import '../Dashboard/Dashboard_main.dart';
// ignore_for_file: deprecated_member_use

class Social extends StatefulWidget {
  const Social({super.key});

  @override
  State<Social> createState() => _SocialState();
}

class _SocialState extends State<Social> {
  bool profilePage = false;
  List checkBox = [];
  int selectIndex = 0;
  ColorNotifier notifier = ColorNotifier();
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
  bool container = false;
  InboxController inboxController = Get.put(InboxController());
  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    return GetBuilder<InboxController>(
      builder: (inboxController) {
        return LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 600) {
              return Container(
                color: notifier.getbgcolor11,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      container1(context, constraints.maxWidth),
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
                        padding: const EdgeInsets.only(
                            bottom: 20, right: 20, left: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            color: notifier.getbgcolor10,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                firstContainer(
                                    size: constraints.maxWidth,
                                    context: context),
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
                                size: constraints.maxWidth, context: context)
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
                'Messages',
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
                'Social',
                style: TextStyle(
                    color: notifier.getblackcolor,
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
                child: container ? container2(size) : container1(context, size),
              ),
              const SizedBox(
                width: 10,
              ),
              size < 600
                  ? const SizedBox()
                  : Expanded(
                      flex: 5,
                      child: container2(size),
                    ),
              const SizedBox(
                width: 10,
              ),
              profilePage
                  ? Expanded(flex: 2, child: container3(size))
                  : const SizedBox(),
            ],
          ),
        ],
      ),
    );
  }

  Widget container1(BuildContext context, size) {
    return GetBuilder<InboxController>(
      builder: (controller) {
        return size < 600
            ? Container(
                decoration: BoxDecoration(
                  color: notifier.getbgcolor10,
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
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
                              'Messages',
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
                              'Social',
                              style: TextStyle(
                                  color: notifier.getblackcolor,
                                  fontSize: 14,
                                  fontFamily: 'InterRegular'),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: notifier.getbgcolor11),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 40,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: model().message.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        setState(() {
                                          profilePage = !profilePage;
                                        });
                                      },
                                      child: index == 0
                                          ? PopupMenuButton(
                                              tooltip: '',
                                              offset: const Offset(10, 50),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              elevation: 1,
                                              splashRadius: 1,
                                              constraints: const BoxConstraints(
                                                maxWidth: 360,
                                                minWidth: 360,
                                              ),
                                              shadowColor: Colors.grey,
                                              color: notifier.getbgcolor11,
                                              child: Row(
                                                children: [
                                                  Image.asset(
                                                    'assets/Add++.png',
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                ],
                                              ),
                                              itemBuilder: (context) =>
                                                  <PopupMenuEntry<SampleItem>>[
                                                PopupMenuItem(
                                                    height: 30,
                                                    padding: EdgeInsets.zero,
                                                    enabled: false,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 12,
                                                              top: 12,
                                                              left: 12),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Invite New Member',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'InterRegular',
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: notifier
                                                                  .getblackcolor,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 18,
                                                          ),
                                                          const Text(
                                                            'Email or User Name',
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  'InterRegular',
                                                              color: Color(
                                                                  0xff727880),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          TextField(
                                                            style: TextStyle(
                                                              color: notifier
                                                                  .getblackcolor,
                                                            ),
                                                            decoration:
                                                                InputDecoration(
                                                              hintText:
                                                                  'Enter email or user name...',
                                                              hintStyle:
                                                                  TextStyle(
                                                                      color:
                                                                          grey3,
                                                                      fontSize:
                                                                          15),
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
                                                                              20),
                                                                  borderSide:
                                                                      const BorderSide(
                                                                          color:
                                                                              Color(0xffEEEEEE))),
                                                              enabledBorder: OutlineInputBorder(
                                                                  borderSide: const BorderSide(
                                                                      color: Color(
                                                                          0xffEEEEEE)),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20)),
                                                              focusedBorder: OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                          color:
                                                                              blue),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20)),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 15,
                                                          ),
                                                          const Text(
                                                            'Member (15)',
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'InterRegular',
                                                                fontSize: 14,
                                                                color: Color(
                                                                    0xff727880),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          SizedBox(
                                                            height: 250,
                                                            child: ListView
                                                                .builder(
                                                              // shrinkWrap: true
                                                              itemCount: model()
                                                                  .yes1
                                                                  .length,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemBuilder:
                                                                  (context,
                                                                      index) {
                                                                return Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                          bottom:
                                                                              10),
                                                                  child: Row(
                                                                    children: [
                                                                      Container(
                                                                        height:
                                                                            35,
                                                                        width:
                                                                            35,
                                                                        decoration: BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                            image: DecorationImage(image: AssetImage(model().yes[index]), fit: BoxFit.cover)),
                                                                      ),
                                                                      // CircleAvatar(
                                                                      //   radius: 15,
                                                                      //   child: Image.asset(model().yes[index])),
                                                                      const SizedBox(
                                                                        width:
                                                                            5,
                                                                      ),
                                                                      Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                              model().yes1[index],
                                                                              style: TextStyle(fontSize: 14, color: notifier.getblackcolor, fontFamily: 'InterRegular', fontWeight: FontWeight.w600)),
                                                                          Text(
                                                                              model().yes2[index],
                                                                              style: const TextStyle(fontFamily: 'InterRegular', color: Color(0xff727880), fontSize: 10)),
                                                                        ],
                                                                      ),
                                                                      const Spacer(),
                                                                      index == 0
                                                                          ? const Text(
                                                                              'Owner',
                                                                              style: TextStyle(color: Color(0xffC6C8CB), fontFamily: 'InterRegular', fontSize: 10),
                                                                            )
                                                                          : const SizedBox(),
                                                                      const SizedBox(
                                                                        width:
                                                                            6,
                                                                      ),
                                                                      Image
                                                                          .asset(
                                                                        'assets/more.png',
                                                                        height:
                                                                            16,
                                                                        color: const Color(
                                                                            0xffC6C8CB),
                                                                      )
                                                                    ],
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                          Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: notifier
                                                                    .getbgcolor11,
                                                              ),
                                                              child: Row(
                                                                children: [
                                                                  const Spacer(),
                                                                  InkWell(
                                                                    onTap: () {
                                                                      Navigator.pop(
                                                                          context);
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      padding: const EdgeInsets
                                                                          .all(
                                                                          10),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                        color: notifier
                                                                            .getbgcolor10,
                                                                      ),
                                                                      child: const Center(
                                                                          child: Text(
                                                                              'Cancel',
                                                                              style: TextStyle(color: Color(0xff727880), fontWeight: FontWeight.w600, fontSize: 12, fontFamily: 'InterRegular'))),
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    width: 8,
                                                                  ),
                                                                  InkWell(
                                                                    onTap:
                                                                        () {},
                                                                    child:
                                                                        Container(
                                                                      padding: const EdgeInsets
                                                                          .all(
                                                                          10),
                                                                      decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(
                                                                              10),
                                                                          color:
                                                                              const Color(0xff595FE5)),
                                                                      child: const Center(
                                                                          child: Text(
                                                                              'Sen Invite',
                                                                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 12, fontFamily: 'InterRegular'))),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ))
                                                        ],
                                                      ),
                                                    ))
                                              ],
                                            )
                                          : Container(
                                              height: 48,
                                              width: 48,
                                              margin: const EdgeInsets.only(
                                                  right: 15),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              child: Center(
                                                child: Image.asset(
                                                  model().message[index],
                                                  height: 45,
                                                ),
                                              )),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemCount: chatList.length,
                                itemBuilder: (context, index) {
                                  ChatList data = chatList[index];
                                  return InkWell(
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              container2(size)),
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: selectIndex == index
                                            ? notifier.Getblg2
                                            : notifier.getbgcolor11,
                                      ),
                                      child: ListTile(
                                        leading: Image.asset(data.image,
                                            height: 40, width: 40),
                                        title: Text(data.title,
                                            style: TextStyle(
                                                fontFamily: 'InterRegular',
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: selectIndex == index
                                                    ? const Color(0xff595FE5)
                                                    : notifier.getblackcolor)),
                                        trailing: Column(
                                          children: [
                                            Transform.translate(
                                              offset: const Offset(0, 10),
                                              child: Text(
                                                messages1[index],
                                                style: TextStyle(
                                                    color: selectIndex == index
                                                        ? notifier.getblackcolor
                                                        : const Color(
                                                            0xff9DA2A7),
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: 'InterRegular'),
                                              ),
                                            ),
                                            index == 1
                                                ? Transform.translate(
                                                    offset:
                                                        const Offset(10, 15),
                                                    child: Container(
                                                      width: 18,
                                                      height: 18,
                                                      decoration: BoxDecoration(
                                                        color: const Color(
                                                            0xffE5646C),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                      ),
                                                      child: const Center(
                                                          child: Text('4',
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      'InterRegular',
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      10))),
                                                    ),
                                                  )
                                                : const SizedBox(),
                                            index == 2
                                                ? Transform.translate(
                                                    offset:
                                                        const Offset(10, 15),
                                                    child: Container(
                                                      width: 18,
                                                      height: 18,
                                                      decoration: BoxDecoration(
                                                        color: const Color(
                                                            0xffE5646C),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                      ),
                                                      child: const Center(
                                                          child: Text('3',
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      'InterRegular',
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      10))),
                                                    ),
                                                  )
                                                : const SizedBox(),
                                            index == 3
                                                ? Transform.translate(
                                                    offset:
                                                        const Offset(10, 15),
                                                    child: Container(
                                                      width: 18,
                                                      height: 18,
                                                      decoration: BoxDecoration(
                                                        color: const Color(
                                                            0xffE5646C),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                      ),
                                                      child: Center(
                                                          child: Image.asset(
                                                              'assets/User Read.png')),
                                                    ),
                                                  )
                                                : const SizedBox(),
                                            index == 5
                                                ? Transform.translate(
                                                    offset:
                                                        const Offset(10, 15),
                                                    child: Container(
                                                      width: 18,
                                                      height: 18,
                                                      decoration: BoxDecoration(
                                                        color: const Color(
                                                            0xffE5646C),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                      ),
                                                      child: Center(
                                                          child: Image.asset(
                                                              'assets/User Read1.png')),
                                                    ),
                                                  )
                                                : const SizedBox(),
                                            index == 10
                                                ? Transform.translate(
                                                    offset:
                                                        const Offset(10, 15),
                                                    child: Container(
                                                      width: 18,
                                                      height: 18,
                                                      decoration: BoxDecoration(
                                                        color: const Color(
                                                            0xffE5646C),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                      ),
                                                      child: Center(
                                                          child: Image.asset(
                                                              'assets/User Read1.png')),
                                                    ),
                                                  )
                                                : const SizedBox(),
                                            index == 6
                                                ? Stack(
                                                    clipBehavior: Clip.none,
                                                    children: [
                                                      Transform.translate(
                                                        offset: const Offset(
                                                            10, 15),
                                                        child: Container(
                                                          width: 18,
                                                          height: 18,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: const Color(
                                                                0xffE5646C),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                          ),
                                                          child: Center(
                                                              child: Image.asset(
                                                                  'assets/Avatar72.png')),
                                                        ),
                                                      ),
                                                      Positioned(
                                                          left: 12,
                                                          child: Transform
                                                              .translate(
                                                            offset:
                                                                const Offset(
                                                                    -15, 15),
                                                            child: Container(
                                                              width: 18,
                                                              height: 18,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: const Color(
                                                                    0xffE5646C),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15),
                                                              ),
                                                              child: Center(
                                                                  child: Image
                                                                      .asset(
                                                                          'assets/Avatar71.png')),
                                                            ),
                                                          )),
                                                    ],
                                                  )
                                                : const SizedBox(),
                                            index == 7
                                                ? Stack(
                                                    clipBehavior: Clip.none,
                                                    children: [
                                                      Transform.translate(
                                                        offset: const Offset(
                                                            -15, 15),
                                                        child: Container(
                                                          width: 18,
                                                          height: 18,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: const Color(
                                                                0xffE5646C),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                          ),
                                                          child: Center(
                                                              child: Image.asset(
                                                                  'assets/User Read.png')),
                                                        ),
                                                      ),
                                                      Positioned(
                                                          left: -10,
                                                          child: Transform
                                                              .translate(
                                                            offset:
                                                                const Offset(
                                                                    10, 15),
                                                            child: Container(
                                                              width: 18,
                                                              height: 18,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: const Color(
                                                                    0xffE5646C),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15),
                                                              ),
                                                              child: Center(
                                                                  child: Image
                                                                      .asset(
                                                                          'assets/Avatar72.png')),
                                                            ),
                                                          )),
                                                      Positioned(
                                                          left: 5,
                                                          child: Transform
                                                              .translate(
                                                            offset:
                                                                const Offset(
                                                                    6, 15),
                                                            child: Container(
                                                              width: 18,
                                                              height: 18,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: const Color(
                                                                    0xffE5646C),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15),
                                                              ),
                                                              child: Center(
                                                                  child: Image
                                                                      .asset(
                                                                          'assets/User Read1.png')),
                                                            ),
                                                          )),
                                                    ],
                                                  )
                                                : const SizedBox(),
                                            index == 8
                                                ? Stack(
                                                    clipBehavior: Clip.none,
                                                    children: [
                                                      Transform.translate(
                                                        offset: const Offset(
                                                            10, 15),
                                                        child: Container(
                                                          width: 18,
                                                          height: 18,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: const Color(
                                                                0xffE5646C),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                          ),
                                                          child: Center(
                                                              child: Image.asset(
                                                                  'assets/Avatar72.png')),
                                                        ),
                                                      ),
                                                      Positioned(
                                                          left: 12,
                                                          child: Transform
                                                              .translate(
                                                            offset:
                                                                const Offset(
                                                                    -15, 15),
                                                            child: Container(
                                                              width: 18,
                                                              height: 18,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: const Color(
                                                                    0xffE5646C),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15),
                                                              ),
                                                              child: Center(
                                                                  child: Image
                                                                      .asset(
                                                                          'assets/Avatar71.png')),
                                                            ),
                                                          )),
                                                    ],
                                                  )
                                                : const SizedBox(),
                                            index == 12
                                                ? Stack(
                                                    clipBehavior: Clip.none,
                                                    children: [
                                                      Transform.translate(
                                                        offset: const Offset(
                                                            10, 15),
                                                        child: Container(
                                                          width: 18,
                                                          height: 18,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: const Color(
                                                                0xffE5646C),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                          ),
                                                          child: Center(
                                                              child: Image.asset(
                                                                  'assets/Avatar72.png')),
                                                        ),
                                                      ),
                                                      Positioned(
                                                          left: 12,
                                                          child: Transform
                                                              .translate(
                                                            offset:
                                                                const Offset(
                                                                    -15, 15),
                                                            child: Container(
                                                              width: 18,
                                                              height: 18,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: const Color(
                                                                    0xffE5646C),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15),
                                                              ),
                                                              child: Center(
                                                                  child: Image
                                                                      .asset(
                                                                          'assets/Avatar71.png')),
                                                            ),
                                                          )),
                                                    ],
                                                  )
                                                : const SizedBox(),
                                            index == 13
                                                ? Stack(
                                                    clipBehavior: Clip.none,
                                                    children: [
                                                      Transform.translate(
                                                        offset: const Offset(
                                                            -15, 15),
                                                        child: Container(
                                                          width: 18,
                                                          height: 18,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: const Color(
                                                                0xffE5646C),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                          ),
                                                          child: Center(
                                                              child: Image.asset(
                                                                  'assets/User Read.png')),
                                                        ),
                                                      ),
                                                      Positioned(
                                                          left: -10,
                                                          child: Transform
                                                              .translate(
                                                            offset:
                                                                const Offset(
                                                                    10, 15),
                                                            child: Container(
                                                              width: 18,
                                                              height: 18,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: const Color(
                                                                    0xffE5646C),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15),
                                                              ),
                                                              child: Center(
                                                                  child: Image
                                                                      .asset(
                                                                          'assets/Avatar72.png')),
                                                            ),
                                                          )),
                                                      Positioned(
                                                          left: 5,
                                                          child: Transform
                                                              .translate(
                                                            offset:
                                                                const Offset(
                                                                    6, 15),
                                                            child: Container(
                                                              width: 18,
                                                              height: 18,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: const Color(
                                                                    0xffE5646C),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15),
                                                              ),
                                                              child: Center(
                                                                  child: Image
                                                                      .asset(
                                                                          'assets/User Read1.png')),
                                                            ),
                                                          )),
                                                    ],
                                                  )
                                                : const SizedBox(),
                                            index == 15
                                                ? Transform.translate(
                                                    offset:
                                                        const Offset(10, 15),
                                                    child: Container(
                                                      width: 18,
                                                      height: 18,
                                                      decoration: BoxDecoration(
                                                        color: const Color(
                                                            0xffE5646C),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                      ),
                                                      child: const Center(
                                                          child: Text('2',
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      'InterRegular',
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      10))),
                                                    ),
                                                  )
                                                : const SizedBox(),
                                            index == 16
                                                ? Transform.translate(
                                                    offset:
                                                        const Offset(10, 15),
                                                    child: Container(
                                                      width: 18,
                                                      height: 18,
                                                      decoration: BoxDecoration(
                                                        color: const Color(
                                                            0xffE5646C),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                      ),
                                                      child: const Center(
                                                          child: Text('7',
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      'InterRegular',
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      10))),
                                                    ),
                                                  )
                                                : const SizedBox(),
                                          ],
                                        ),
                                        subtitle: Row(
                                          children: [
                                            index == 0
                                                ? Image.asset(
                                                    'assets/call-slash.png',
                                                    height: 12,
                                                    width: 12)
                                                : const SizedBox(),
                                            index == 0
                                                ? const SizedBox(width: 5)
                                                : const SizedBox(),
                                            index == 4
                                                ? Image.asset(
                                                    'assets/call.png',
                                                    width: 12,
                                                    height: 12,
                                                  )
                                                : const SizedBox(),
                                            index == 4
                                                ? const SizedBox(width: 5)
                                                : const SizedBox(),
                                            Text(abstract[index],
                                                style: TextStyle(
                                                    fontFamily: 'InterRegular',
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                    color: index == 0
                                                        ? const Color(
                                                            0xffE5646C)
                                                        : index == 4
                                                            ? const Color(
                                                                0xff7DC066)
                                                            : index == 5
                                                                ? notifier
                                                                    .getblackcolor
                                                                : index == 6
                                                                    ? notifier
                                                                        .getblackcolor
                                                                    : notifier
                                                                        .getblackcolor)),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: notifier.getbgcolor11,
                    borderRadius: BorderRadius.circular(12)),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Messages',
                              style: TextStyle(
                                  fontFamily: 'InterRegular',
                                  fontSize: 18,
                                  color: notifier.getblackcolor,
                                  fontWeight: FontWeight.w500),
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: 32,
                                width: 32,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: const Color(0xff595FE5)),
                                child: Center(
                                    child: Image.asset(
                                  'assets/edit-2.png',
                                  color: Colors.white,
                                  height: 12,
                                  width: 12,
                                )),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 45,
                          decoration: BoxDecoration(
                              color: notifier.Getblg2,
                              borderRadius: BorderRadius.circular(20)),
                          child: TextField(
                            style: TextStyle(color: notifier.getblackcolor),
                            decoration: InputDecoration(
                              hintText: 'Search',
                              prefixIcon: Image.asset(
                                  'assets/search-normal.png',
                                  scale: 4,
                                  color: const Color(0xff9DA2A7)),
                              hintStyle: TextStyle(color: grey3, fontSize: 15),
                              contentPadding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(color: grey2)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(20)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: blue),
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 50,
                          width: Get.width / 0.5,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: model().message.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    profilePage = !profilePage;
                                  });
                                },
                                child: index == 0
                                    ? PopupMenuButton(
                                        tooltip: '',
                                        offset: const Offset(10, 50),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        elevation: 1,
                                        splashRadius: 1,
                                        constraints: const BoxConstraints(
                                          maxWidth: 360,
                                          minWidth: 360,
                                        ),
                                        shadowColor: Colors.grey,
                                        color: notifier.getbgcolor11,
                                        child: Row(
                                          children: [
                                            Image.asset('assets/Add++.png',
                                                height: 40),
                                            const SizedBox(width: 10),
                                          ],
                                        ),
                                        itemBuilder: (context) =>
                                            <PopupMenuEntry<SampleItem>>[
                                          PopupMenuItem(
                                              height: 30,
                                              padding: EdgeInsets.zero,
                                              enabled: false,
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    right: 12,
                                                    top: 12,
                                                    left: 12),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Invite New Member',
                                                      style: TextStyle(
                                                        fontFamily:
                                                            'InterRegular',
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: notifier
                                                            .getblackcolor,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 18,
                                                    ),
                                                    const Text(
                                                      'Email or User Name',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        fontFamily:
                                                            'InterRegular',
                                                        color:
                                                            Color(0xff727880),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    TextField(
                                                      style: TextStyle(
                                                        color: notifier
                                                            .getblackcolor,
                                                      ),
                                                      decoration:
                                                          InputDecoration(
                                                        hintText:
                                                            'Enter email or user name...',
                                                        hintStyle: TextStyle(
                                                            color: grey3,
                                                            fontSize: 15),
                                                        contentPadding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 20,
                                                                right: 20),
                                                        border: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Color(
                                                                        0xffEEEEEE))),
                                                        enabledBorder: OutlineInputBorder(
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Color(
                                                                        0xffEEEEEE)),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                        color:
                                                                            blue),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20)),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 15,
                                                    ),
                                                    const Text(
                                                      'Member (15)',
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'InterRegular',
                                                          fontSize: 14,
                                                          color:
                                                              Color(0xff727880),
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    SizedBox(
                                                      height: 250,
                                                      child: ListView.builder(
                                                        // shrinkWrap: true
                                                        itemCount:
                                                            model().yes1.length,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemBuilder:
                                                            (context, index) {
                                                          return Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    bottom: 10),
                                                            child: Row(
                                                              children: [
                                                                Container(
                                                                  height: 35,
                                                                  width: 35,
                                                                  decoration: BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                      image: DecorationImage(
                                                                          image: AssetImage(model().yes[
                                                                              index]),
                                                                          fit: BoxFit
                                                                              .cover)),
                                                                ),
                                                                // CircleAvatar(
                                                                //   radius: 15,
                                                                //   child: Image.asset(model().yes[index])),
                                                                const SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                        model().yes1[
                                                                            index],
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                14,
                                                                            color: notifier
                                                                                .getblackcolor,
                                                                            fontFamily:
                                                                                'InterRegular',
                                                                            fontWeight:
                                                                                FontWeight.w600)),
                                                                    Text(
                                                                        model().yes2[
                                                                            index],
                                                                        style: const TextStyle(
                                                                            fontFamily:
                                                                                'InterRegular',
                                                                            color:
                                                                                Color(0xff727880),
                                                                            fontSize: 10)),
                                                                  ],
                                                                ),
                                                                const Spacer(),
                                                                index == 0
                                                                    ? const Text(
                                                                        'Owner',
                                                                        style: TextStyle(
                                                                            color: Color(
                                                                                0xffC6C8CB),
                                                                            fontFamily:
                                                                                'InterRegular',
                                                                            fontSize:
                                                                                10),
                                                                      )
                                                                    : const SizedBox(),
                                                                const SizedBox(
                                                                  width: 6,
                                                                ),
                                                                Image.asset(
                                                                  'assets/more.png',
                                                                  height: 16,
                                                                  color: const Color(
                                                                      0xffC6C8CB),
                                                                )
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: notifier
                                                              .getbgcolor11,
                                                        ),
                                                        child: Row(
                                                          children: [
                                                            const Spacer(),
                                                            InkWell(
                                                              onTap: () {},
                                                              child: Container(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        10),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  color: notifier
                                                                      .getbgcolor10,
                                                                ),
                                                                child: const Center(
                                                                    child: Text(
                                                                        'Cancel',
                                                                        style: TextStyle(
                                                                            color: Color(
                                                                                0xff727880),
                                                                            fontWeight: FontWeight
                                                                                .w600,
                                                                            fontSize:
                                                                                12,
                                                                            fontFamily:
                                                                                'InterRegular'))),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 8,
                                                            ),
                                                            InkWell(
                                                              onTap: () {},
                                                              child: Container(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        10),
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                    color: const Color(
                                                                        0xff595FE5)),
                                                                child: const Center(
                                                                    child: Text(
                                                                        'Sen Invite',
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .white,
                                                                            fontWeight: FontWeight
                                                                                .w600,
                                                                            fontSize:
                                                                                12,
                                                                            fontFamily:
                                                                                'InterRegular'))),
                                                              ),
                                                            ),
                                                          ],
                                                        ))
                                                  ],
                                                ),
                                              ))
                                        ],
                                      )
                                    : Container(
                                        height: 48,
                                        width: 48,
                                        margin:
                                            const EdgeInsets.only(right: 15),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: Center(
                                          child: Image.asset(
                                            model().message[index],
                                            height: 45,
                                          ),
                                        )),
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
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
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: selectIndex == index
                                      ? notifier.Getblg2
                                      : notifier.getbgcolor11,
                                ),
                                child: ListTile(
                                  leading: Image.asset(data.image,
                                      height: 40, width: 40),
                                  title: Text(data.title,
                                      style: TextStyle(
                                          fontFamily: 'InterRegular',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: selectIndex == index
                                              ? const Color(0xff595FE5)
                                              : notifier.getblackcolor)),
                                  trailing: Column(
                                    children: [
                                      Transform.translate(
                                        offset: const Offset(0, 10),
                                        child: Text(
                                          messages1[index],
                                          style: TextStyle(
                                              color: selectIndex == index
                                                  ? notifier.getblackcolor
                                                  : const Color(0xff9DA2A7),
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'InterRegular'),
                                        ),
                                      ),
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
                                                      BorderRadius.circular(15),
                                                ),
                                                child: const Center(
                                                    child: Text('4',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'InterRegular',
                                                            color: Colors.white,
                                                            fontSize: 10))),
                                              ),
                                            )
                                          : const SizedBox(),
                                      index == 2
                                          ? Transform.translate(
                                              offset: const Offset(10, 15),
                                              child: Container(
                                                width: 18,
                                                height: 18,
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xffE5646C),
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
                                              ),
                                            )
                                          : const SizedBox(),
                                      index == 3
                                          ? Transform.translate(
                                              offset: const Offset(10, 15),
                                              child: Container(
                                                width: 18,
                                                height: 18,
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xffE5646C),
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                child: Center(
                                                    child: Image.asset(
                                                        'assets/User Read.png')),
                                              ),
                                            )
                                          : const SizedBox(),
                                      index == 5
                                          ? Transform.translate(
                                              offset: const Offset(10, 15),
                                              child: Container(
                                                width: 18,
                                                height: 18,
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xffE5646C),
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                child: Center(
                                                    child: Image.asset(
                                                        'assets/User Read1.png')),
                                              ),
                                            )
                                          : const SizedBox(),
                                      index == 10
                                          ? Transform.translate(
                                              offset: const Offset(10, 15),
                                              child: Container(
                                                width: 18,
                                                height: 18,
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xffE5646C),
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                child: Center(
                                                    child: Image.asset(
                                                        'assets/User Read1.png')),
                                              ),
                                            )
                                          : const SizedBox(),
                                      index == 6
                                          ? Stack(
                                              clipBehavior: Clip.none,
                                              children: [
                                                Transform.translate(
                                                  offset: const Offset(10, 15),
                                                  child: Container(
                                                    width: 18,
                                                    height: 18,
                                                    decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xffE5646C),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                    child: Center(
                                                        child: Image.asset(
                                                            'assets/Avatar72.png')),
                                                  ),
                                                ),
                                                Positioned(
                                                    left: 12,
                                                    child: Transform.translate(
                                                      offset:
                                                          const Offset(-15, 15),
                                                      child: Container(
                                                        width: 18,
                                                        height: 18,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: const Color(
                                                              0xffE5646C),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                        ),
                                                        child: Center(
                                                            child: Image.asset(
                                                                'assets/Avatar71.png')),
                                                      ),
                                                    )),
                                              ],
                                            )
                                          : const SizedBox(),
                                      index == 7
                                          ? Stack(
                                              clipBehavior: Clip.none,
                                              children: [
                                                Transform.translate(
                                                  offset: const Offset(-15, 15),
                                                  child: Container(
                                                    width: 18,
                                                    height: 18,
                                                    decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xffE5646C),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                    child: Center(
                                                        child: Image.asset(
                                                            'assets/User Read.png')),
                                                  ),
                                                ),
                                                Positioned(
                                                    left: -10,
                                                    child: Transform.translate(
                                                      offset:
                                                          const Offset(10, 15),
                                                      child: Container(
                                                        width: 18,
                                                        height: 18,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: const Color(
                                                              0xffE5646C),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                        ),
                                                        child: Center(
                                                            child: Image.asset(
                                                                'assets/Avatar72.png')),
                                                      ),
                                                    )),
                                                Positioned(
                                                    left: 5,
                                                    child: Transform.translate(
                                                      offset:
                                                          const Offset(6, 15),
                                                      child: Container(
                                                        width: 18,
                                                        height: 18,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: const Color(
                                                              0xffE5646C),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                        ),
                                                        child: Center(
                                                            child: Image.asset(
                                                                'assets/User Read1.png')),
                                                      ),
                                                    )),
                                              ],
                                            )
                                          : const SizedBox(),
                                      index == 8
                                          ? Stack(
                                              clipBehavior: Clip.none,
                                              children: [
                                                Transform.translate(
                                                  offset: const Offset(10, 15),
                                                  child: Container(
                                                    width: 18,
                                                    height: 18,
                                                    decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xffE5646C),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                    child: Center(
                                                        child: Image.asset(
                                                            'assets/Avatar72.png')),
                                                  ),
                                                ),
                                                Positioned(
                                                    left: 12,
                                                    child: Transform.translate(
                                                      offset:
                                                          const Offset(-15, 15),
                                                      child: Container(
                                                        width: 18,
                                                        height: 18,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: const Color(
                                                              0xffE5646C),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                        ),
                                                        child: Center(
                                                            child: Image.asset(
                                                                'assets/Avatar71.png')),
                                                      ),
                                                    )),
                                              ],
                                            )
                                          : const SizedBox(),
                                      index == 12
                                          ? Stack(
                                              clipBehavior: Clip.none,
                                              children: [
                                                Transform.translate(
                                                  offset: const Offset(10, 15),
                                                  child: Container(
                                                    width: 18,
                                                    height: 18,
                                                    decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xffE5646C),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                    child: Center(
                                                        child: Image.asset(
                                                            'assets/Avatar72.png')),
                                                  ),
                                                ),
                                                Positioned(
                                                    left: 12,
                                                    child: Transform.translate(
                                                      offset:
                                                          const Offset(-15, 15),
                                                      child: Container(
                                                        width: 18,
                                                        height: 18,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: const Color(
                                                              0xffE5646C),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                        ),
                                                        child: Center(
                                                            child: Image.asset(
                                                                'assets/Avatar71.png')),
                                                      ),
                                                    )),
                                              ],
                                            )
                                          : const SizedBox(),
                                      index == 13
                                          ? Stack(
                                              clipBehavior: Clip.none,
                                              children: [
                                                Transform.translate(
                                                  offset: const Offset(-15, 15),
                                                  child: Container(
                                                    width: 18,
                                                    height: 18,
                                                    decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xffE5646C),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                    child: Center(
                                                        child: Image.asset(
                                                            'assets/User Read.png')),
                                                  ),
                                                ),
                                                Positioned(
                                                    left: -10,
                                                    child: Transform.translate(
                                                      offset:
                                                          const Offset(10, 15),
                                                      child: Container(
                                                        width: 18,
                                                        height: 18,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: const Color(
                                                              0xffE5646C),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                        ),
                                                        child: Center(
                                                            child: Image.asset(
                                                                'assets/Avatar72.png')),
                                                      ),
                                                    )),
                                                Positioned(
                                                    left: 5,
                                                    child: Transform.translate(
                                                      offset:
                                                          const Offset(6, 15),
                                                      child: Container(
                                                        width: 18,
                                                        height: 18,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: const Color(
                                                              0xffE5646C),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                        ),
                                                        child: Center(
                                                            child: Image.asset(
                                                                'assets/User Read1.png')),
                                                      ),
                                                    )),
                                              ],
                                            )
                                          : const SizedBox(),
                                      index == 15
                                          ? Transform.translate(
                                              offset: const Offset(10, 15),
                                              child: Container(
                                                width: 18,
                                                height: 18,
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xffE5646C),
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                child: const Center(
                                                    child: Text('2',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'InterRegular',
                                                            color: Colors.white,
                                                            fontSize: 10))),
                                              ),
                                            )
                                          : const SizedBox(),
                                      index == 16
                                          ? Transform.translate(
                                              offset: const Offset(10, 15),
                                              child: Container(
                                                width: 18,
                                                height: 18,
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xffE5646C),
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                child: const Center(
                                                    child: Text('7',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'InterRegular',
                                                            color: Colors.white,
                                                            fontSize: 10))),
                                              ),
                                            )
                                          : const SizedBox(),
                                    ],
                                  ),
                                  subtitle: Row(
                                    children: [
                                      index == 0
                                          ? Image.asset('assets/call-slash.png',
                                              height: 12, width: 12)
                                          : const SizedBox(),
                                      index == 0
                                          ? const SizedBox(width: 5)
                                          : const SizedBox(),
                                      index == 4
                                          ? Image.asset(
                                              'assets/call.png',
                                              width: 12,
                                              height: 12,
                                            )
                                          : const SizedBox(),
                                      index == 4
                                          ? const SizedBox(width: 5)
                                          : const SizedBox(),
                                      Expanded(
                                        child: Text(abstract[index],
                                            style: TextStyle(
                                                fontFamily: 'InterRegular',
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: index == 0
                                                    ? const Color(0xffE5646C)
                                                    : index == 4
                                                        ? const Color(
                                                            0xff7DC066)
                                                        : index == 5
                                                            ? notifier
                                                                .getblackcolor
                                                            : index == 6
                                                                ? notifier
                                                                    .getblackcolor
                                                                : notifier
                                                                    .getblackcolor)),
                                      ),
                                    ],
                                  ),
                                ),
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
    );
  }

  Widget container2(size) {
    return size < 600
        ? SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: notifier.getbgcolor11,
                elevation: 0,
                automaticallyImplyLeading: false,
                leading: InkWell(
                  onTap: () {
                    setState(() {
                      print('object');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => container3(size)));
                      // profilePage = !profilePage;
                    });
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Center(
                        child: Image.asset(
                      'assets/Avatar51.png',
                      height: 40,
                    )),
                  ),
                ),
                title: Transform.translate(
                  offset: const Offset(-10, 0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Marketing Team',
                          style: TextStyle(
                              color: notifier.getblackcolor,
                              fontWeight: FontWeight.w500,
                              fontFamily: "PublicSansMedium",
                              letterSpacing: 0.5,
                              fontSize: 16),
                        ),
                        Text(
                          "Online 3 minutes ago",
                          style: TextStyle(
                              color: notifier.getblackcolor,
                              fontWeight: FontWeight.w400,
                              fontFamily: "PublicSansRegular",
                              letterSpacing: 0.5,
                              fontSize: 14),
                        ),
                      ]),
                ),
                actions: const [
                  Icon(Icons.more_vert, size: 25, color: Colors.grey),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              backgroundColor: notifier.getbgcolor10,
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
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            children: [
                              const Column(
                                children: [
                                  Text(
                                    'Friday, 1 July',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'InterRegular',
                                        color: Color(0xff9DA2A7)),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 32,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Center(
                                            child: Image.asset(
                                                'assets/Avatar61.png')),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        height: 40,
                                        decoration: BoxDecoration(
                                            color: notifier.getbgcolor11,
                                            borderRadius:
                                                const BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(12),
                                                    bottomRight:
                                                        Radius.circular(12),
                                                    topRight:
                                                        Radius.circular(12))),
                                        child: Row(
                                          children: [
                                            Text('I hope it goes well.',
                                                style: TextStyle(
                                                  color: notifier.getblackcolor,
                                                  fontFamily: 'InterRegular',
                                                )),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 32,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child:
                                            Image.asset('assets/Avatar61.png'),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: notifier.getbgcolor11,
                                            borderRadius:
                                                const BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(12),
                                                    bottomRight:
                                                        Radius.circular(12),
                                                    topRight:
                                                        Radius.circular(12))),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Image.asset('assets/Media11.png',
                                                scale: 4),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                                'What the progress on that task?',
                                                style: TextStyle(
                                                  color: notifier.getblackcolor,
                                                  fontFamily: 'InterRegular',
                                                )),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 32,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Center(
                                            child: Image.asset(
                                                'assets/Avatar61.png')),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 20),
                                          Container(
                                            padding: const EdgeInsets.all(10),
                                            height: 40,
                                            decoration: BoxDecoration(
                                                color: notifier.getbgcolor11,
                                                borderRadius:
                                                    const BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(10),
                                                        bottomRight:
                                                            Radius.circular(10),
                                                        topRight:
                                                            Radius.circular(
                                                                10))),
                                            child: Row(
                                              children: [
                                                Text('Hey bro!',
                                                    style: TextStyle(
                                                      color: notifier
                                                          .getblackcolor,
                                                      fontFamily:
                                                          'InterRegular',
                                                    )),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              const Text('1:45 PM',
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      fontFamily:
                                                          'InterRegular',
                                                      color:
                                                          Color(0xff9DA2A7))),
                                              const SizedBox(
                                                width: 30,
                                              ),
                                              Image.asset('assets/Avatar61.png',
                                                  height: 13),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Column(
                                children: [
                                  Text(
                                    'Monday, 1 July',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'InterRegular',
                                        color: Color(0xff9DA2A7)),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: const BoxDecoration(
                                            color: Color(0xff595FE5),
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(12),
                                                bottomRight:
                                                    Radius.circular(12),
                                                topLeft: Radius.circular(12))),
                                        child: const Text('Yeah! Your right.',
                                            style: TextStyle(
                                                fontFamily: 'InterRegular',
                                                color: Colors.white)),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: const BoxDecoration(
                                            color: Color(0xff595FE5),
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(12),
                                                bottomRight:
                                                    Radius.circular(12),
                                                topLeft: Radius.circular(12))),
                                        child: const Text(
                                            'I be there in 2 mins',
                                            style: TextStyle(
                                                fontFamily: 'InterRegular',
                                                color: Colors.white)),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: const BoxDecoration(
                                              color: Color(0xff595FE5),
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(12),
                                                  bottomRight:
                                                      Radius.circular(12),
                                                  topLeft:
                                                      Radius.circular(12))),
                                          child: Row(
                                            children: [
                                              Image.asset('assets/Voice.png',
                                                  height: 20),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              InkWell(
                                                onTap: () {},
                                                child: Image.asset(
                                                    'assets/play-circle.png',
                                                    height: 24),
                                              ),
                                            ],
                                          )),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const Text(
                                        '4:07 PM',
                                        style: TextStyle(
                                            color: Color(0xff9DA2A7),
                                            fontSize: 10,
                                            fontFamily: 'InterRegular'),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 32,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Center(
                                            child: Image.asset(
                                                'assets/Avatar61.png')),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        height: 40,
                                        decoration: BoxDecoration(
                                            color: notifier.getbgcolor11,
                                            borderRadius:
                                                const BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(10),
                                                    bottomRight:
                                                        Radius.circular(10),
                                                    topRight:
                                                        Radius.circular(10))),
                                        child: Row(
                                          children: [
                                            Text('I hope it goes well.',
                                                style: TextStyle(
                                                  color: notifier.getblackcolor,
                                                  fontFamily: 'InterRegular',
                                                )),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 32,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Center(
                                            child: Image.asset(
                                                'assets/Avatar61.png')),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        width: 180,
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                            color: notifier.getbgcolor11,
                                            borderRadius:
                                                const BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(12),
                                                    bottomRight:
                                                        Radius.circular(12),
                                                    topRight:
                                                        Radius.circular(12))),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Haha oh man',
                                                style: TextStyle(
                                                  color: notifier.getblackcolor,
                                                  fontFamily: 'InterRegular',
                                                )),
                                            InkWell(
                                              onTap: () {},
                                              child: DottedBorder(
                                                color: const Color(0xffEEEEEE),
                                                borderType: BorderType.RRect,
                                                radius:
                                                    const Radius.circular(12),
                                                padding:
                                                    const EdgeInsets.all(12),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(12)),
                                                  child: SizedBox(
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          height: 32,
                                                          width: 32,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          child: Image.asset(
                                                            'assets/pdf.png',
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'pdf',
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                color: notifier
                                                                    .getblackcolor,
                                                                fontFamily:
                                                                    'InterRegular',
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 10,
                                                            ),
                                                            const Text(
                                                              '231.72 KB',
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xff727880),
                                                                  fontSize: 10),
                                                            )
                                                          ],
                                                        ),
                                                        const Spacer(),
                                                        Image.asset(
                                                            'assets/Download.png',
                                                            height: 35),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 32,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Center(
                                        child:
                                            Image.asset('assets/Avatar61.png')),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        height: 40,
                                        decoration: BoxDecoration(
                                            color: notifier.getbgcolor11,
                                            borderRadius:
                                                const BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(12),
                                                    bottomRight:
                                                        Radius.circular(12),
                                                    topRight:
                                                        Radius.circular(12))),
                                        child: Row(
                                          children: [
                                            InkWell(
                                              onTap: () {},
                                              child: Image.asset(
                                                  'assets/play-circle.png',
                                                  height: 20,
                                                  color:
                                                      const Color(0xffE5646C)),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Image.asset('assets/Voice1.png',
                                                height: 20,
                                                color: const Color(0xffE5646C)),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const Row(
                                        children: [
                                          Text(
                                            '3:55 AM',
                                            style: TextStyle(
                                                color: Color(0xff9DA2A7),
                                                fontFamily: 'InterRegular',
                                                fontSize: 10),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Column(
                                children: [
                                  Text(
                                    'Monday, 1 July',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'InterRegular',
                                        color: Color(0xff9DA2A7)),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: const BoxDecoration(
                                            color: Color(0xff595FE5),
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(12),
                                                bottomRight:
                                                    Radius.circular(12),
                                                topLeft: Radius.circular(12))),
                                        child: const Text(
                                            'I went there yesterday',
                                            style: TextStyle(
                                                fontFamily: 'InterRegular',
                                                color: Colors.white)),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: const BoxDecoration(
                                            color: Color(0xff595FE5),
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(12),
                                                bottomRight:
                                                    Radius.circular(12),
                                                topLeft: Radius.circular(12))),
                                        child: const Text('thanks for the help',
                                            style: TextStyle(
                                                fontFamily: 'InterRegular',
                                                color: Colors.white)),
                                      ),
                                      const SizedBox(height: 15),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              bottomSheet: SizedBox(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  height: 60,
                  decoration: BoxDecoration(
                    color: notifier.getbgcolor11,
                    border: const Border(),
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: SizedBox(
                          height: 45,
                          child: TextField(
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "InterRegular",
                              fontWeight: FontWeight.w400,
                              color: notifier.getblackcolor,
                            ),
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              hintText: "Write messages ...",
                              hintStyle: TextStyle(
                                fontSize: 15,
                                fontFamily: "InterRegular",
                                fontWeight: FontWeight.w400,
                                color: notifier.getblackcolor,
                              ),
                              fillColor: notifier.Getblg2,
                              filled: true,
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                    color: Colors.blueAccent, width: 1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: blue),
                                  borderRadius: BorderRadius.circular(20)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
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
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: notifier.Getblg2)),
                          child: Center(
                              child: Image.asset(
                            'assets/emoji-happy.png',
                            width: 16,
                            height: 16,
                          )),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: notifier.Getblg2)),
                          child: Center(
                              child: Image.asset('assets/gallery.png',
                                  width: 16, height: 16)),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: notifier.Getblg2)),
                          child: Center(
                              child: Image.asset('assets/attach-circle.png',
                                  width: 16, height: 16)),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: notifier.Getblg2)),
                          child: Center(
                              child: Image.asset('assets/microphone.png',
                                  width: 16, height: 16)),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Center(
                            child: Image.asset('assets/send.png',
                                width: 25, height: 25)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        : SizedBox(
            height: Get.height,
            child: Scaffold(
              appBar: AppBar(
                shape: const ContinuousRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                backgroundColor: notifier.getbgcolor11,
                elevation: 0,
                automaticallyImplyLeading: false,
                flexibleSpace: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: 80,
                  decoration: BoxDecoration(
                      color: notifier.getbgcolor11,
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20))),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        profilePage = !profilePage;
                      });
                    },
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Transform.translate(
                        offset: const Offset(0, -5),
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage("assets/Avatar51.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      title: Transform.translate(
                        offset: const Offset(0, -8),
                        child: Text(
                          'Marketing Team',
                          style: TextStyle(
                            color: notifier.getblackcolor,
                            fontWeight: FontWeight.w500,
                            fontFamily: "PublicSansMedium",
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                      subtitle: Transform.translate(
                        offset: const Offset(0, -6),
                        child: Text(
                          "Online 3 minutes ago",
                          style: TextStyle(
                            color: notifier.getblackcolor,
                            fontWeight: FontWeight.w400,
                            fontFamily: "PublicSansRegular",
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                      trailing: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.more_vert, size: 25, color: Colors.grey),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              backgroundColor: notifier.getbgcolor10,
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
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            children: [
                              const Column(
                                children: [
                                  Text(
                                    'Friday, 1 July',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'InterRegular',
                                        color: Color(0xff9DA2A7)),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 32,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Center(
                                            child: Image.asset(
                                                'assets/Avatar61.png')),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        height: 40,
                                        decoration: BoxDecoration(
                                            color: notifier.getbgcolor11,
                                            borderRadius:
                                                const BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(12),
                                                    bottomRight:
                                                        Radius.circular(12),
                                                    topRight:
                                                        Radius.circular(12))),
                                        child: Row(
                                          children: [
                                            Text('I hope it goes well.',
                                                style: TextStyle(
                                                  color: notifier.getblackcolor,
                                                  fontFamily: 'InterRegular',
                                                )),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 32,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child:
                                            Image.asset('assets/Avatar61.png'),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: notifier.getbgcolor11,
                                            borderRadius:
                                                const BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(12),
                                                    bottomRight:
                                                        Radius.circular(12),
                                                    topRight:
                                                        Radius.circular(12))),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Image.asset('assets/Media11.png',
                                                scale: 4),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                                'What the progress on that task?',
                                                style: TextStyle(
                                                  color: notifier.getblackcolor,
                                                  fontFamily: 'InterRegular',
                                                )),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 32,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Center(
                                            child: Image.asset(
                                                'assets/Avatar61.png')),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 20),
                                          Container(
                                            padding: const EdgeInsets.all(10),
                                            height: 40,
                                            decoration: BoxDecoration(
                                                color: notifier.getbgcolor11,
                                                borderRadius:
                                                    const BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(10),
                                                        bottomRight:
                                                            Radius.circular(10),
                                                        topRight:
                                                            Radius.circular(
                                                                10))),
                                            child: Row(
                                              children: [
                                                Text('Hey bro!',
                                                    style: TextStyle(
                                                      color: notifier
                                                          .getblackcolor,
                                                      fontFamily:
                                                          'InterRegular',
                                                    )),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              const Text('1:45 PM',
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      fontFamily:
                                                          'InterRegular',
                                                      color:
                                                          Color(0xff9DA2A7))),
                                              const SizedBox(
                                                width: 30,
                                              ),
                                              Image.asset('assets/Avatar61.png',
                                                  height: 13),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Column(
                                children: [
                                  Text(
                                    'Monday, 1 July',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'InterRegular',
                                        color: Color(0xff9DA2A7)),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: const BoxDecoration(
                                            color: Color(0xff595FE5),
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(12),
                                                bottomRight:
                                                    Radius.circular(12),
                                                topLeft: Radius.circular(12))),
                                        child: const Text('Yeah! Your right.',
                                            style: TextStyle(
                                                fontFamily: 'InterRegular',
                                                color: Colors.white)),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: const BoxDecoration(
                                            color: Color(0xff595FE5),
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(12),
                                                bottomRight:
                                                    Radius.circular(12),
                                                topLeft: Radius.circular(12))),
                                        child: const Text(
                                            'I be there in 2 mins',
                                            style: TextStyle(
                                                fontFamily: 'InterRegular',
                                                color: Colors.white)),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: const BoxDecoration(
                                              color: Color(0xff595FE5),
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(12),
                                                  bottomRight:
                                                      Radius.circular(12),
                                                  topLeft:
                                                      Radius.circular(12))),
                                          child: Row(
                                            children: [
                                              Image.asset('assets/Voice.png',
                                                  height: 20),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              InkWell(
                                                onTap: () {},
                                                child: Image.asset(
                                                    'assets/play-circle.png',
                                                    height: 24),
                                              ),
                                            ],
                                          )),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const Text(
                                        '4:07 PM',
                                        style: TextStyle(
                                            color: Color(0xff9DA2A7),
                                            fontSize: 10,
                                            fontFamily: 'InterRegular'),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 32,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Center(
                                            child: Image.asset(
                                                'assets/Avatar61.png')),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        height: 40,
                                        decoration: BoxDecoration(
                                            color: notifier.getbgcolor11,
                                            borderRadius:
                                                const BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(10),
                                                    bottomRight:
                                                        Radius.circular(10),
                                                    topRight:
                                                        Radius.circular(10))),
                                        child: Row(
                                          children: [
                                            Text('I hope it goes well.',
                                                style: TextStyle(
                                                    fontFamily: 'InterRegular',
                                                    color: notifier
                                                        .getblackcolor)),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 32,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Center(
                                            child: Image.asset(
                                                'assets/Avatar61.png')),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                            color: notifier.getbgcolor11,
                                            borderRadius:
                                                const BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(12),
                                                    bottomRight:
                                                        Radius.circular(12),
                                                    topRight:
                                                        Radius.circular(12))),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Haha oh man',
                                                style: TextStyle(
                                                  color: notifier.getblackcolor,
                                                  fontFamily: 'InterRegular',
                                                )),
                                            InkWell(
                                              onTap: () {},
                                              child: DottedBorder(
                                                color: const Color(0xffEEEEEE),
                                                borderType: BorderType.RRect,
                                                radius:
                                                    const Radius.circular(12),
                                                padding:
                                                    const EdgeInsets.all(12),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(12)),
                                                  child: SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.12,
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          height: 32,
                                                          width: 32,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          child: Image.asset(
                                                            'assets/pdf.png',
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'pdf',
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                color: notifier
                                                                    .getblackcolor,
                                                                fontFamily:
                                                                    'InterRegular',
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 10,
                                                            ),
                                                            const Text(
                                                              '231.72 KB',
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xff727880),
                                                                  fontSize: 10),
                                                            )
                                                          ],
                                                        ),
                                                        const Spacer(),
                                                        Image.asset(
                                                            'assets/Download.png',
                                                            height: 24),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 32,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Center(
                                            child: Image.asset(
                                                'assets/Avatar61.png')),
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
                                          Container(
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                color: notifier.getbgcolor11,
                                                borderRadius:
                                                    const BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(12),
                                                        bottomRight:
                                                            Radius.circular(12),
                                                        topRight:
                                                            Radius.circular(
                                                                12))),
                                            child: Row(
                                              children: [
                                                InkWell(
                                                  onTap: () {},
                                                  child: Image.asset(
                                                      'assets/play-circle.png',
                                                      height: 24,
                                                      color: const Color(
                                                          0xffE5646C)),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Image.asset('assets/Voice1.png',
                                                    height: 20,
                                                    color: const Color(
                                                        0xffE5646C)),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          const Row(
                                            children: [
                                              Text(
                                                '3:55 AM',
                                                style: TextStyle(
                                                    color: Color(0xff9DA2A7),
                                                    fontFamily: 'InterRegular',
                                                    fontSize: 10),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Column(
                                children: [
                                  Text(
                                    'Monday, 1 July',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'InterRegular',
                                        color: Color(0xff9DA2A7)),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: const BoxDecoration(
                                            color: Color(0xff595FE5),
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(12),
                                                bottomRight:
                                                    Radius.circular(12),
                                                topLeft: Radius.circular(12))),
                                        child: const Text(
                                            'I went there yesterday',
                                            style: TextStyle(
                                                fontFamily: 'InterRegular',
                                                color: Colors.white)),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: const BoxDecoration(
                                            color: Color(0xff595FE5),
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(12),
                                                bottomRight:
                                                    Radius.circular(12),
                                                topLeft: Radius.circular(12))),
                                        child: const Text('thanks for the help',
                                            style: TextStyle(
                                                fontFamily: 'InterRegular',
                                                color: Colors.white)),
                                      ),
                                      const SizedBox(height: 15),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              bottomSheet: SizedBox(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  height: 60,
                  decoration: BoxDecoration(
                    color: notifier.getbgcolor11,
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: SizedBox(
                          height: 45,
                          child: TextField(
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "PublicSansRegular",
                              fontWeight: FontWeight.w400,
                              color: notifier.getblackcolor,
                            ),
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              hintText: "Write messages ...",
                              hintStyle: TextStyle(
                                fontSize: 15,
                                fontFamily: "PublicSansRegular",
                                fontWeight: FontWeight.w400,
                                color: notifier.getblackcolor,
                              ),
                              fillColor: notifier.Getblg2,
                              filled: true,
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                    color: Colors.blueAccent, width: 1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: blue),
                                  borderRadius: BorderRadius.circular(20)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: notifier.Getblg2)),
                          child: Center(
                              child: Image.asset(
                            'assets/emoji-happy.png',
                            width: 16,
                            height: 16,
                          )),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: notifier.Getblg2)),
                          child: Center(
                              child: Image.asset('assets/gallery.png',
                                  width: 16, height: 16)),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: notifier.Getblg2)),
                          child: Center(
                              child: Image.asset('assets/attach-circle.png',
                                  width: 16, height: 16)),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: notifier.Getblg2)),
                          child: Center(
                              child: Image.asset('assets/microphone.png',
                                  width: 16, height: 16)),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Center(
                            child: Image.asset('assets/send.png',
                                width: 25, height: 25)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }

  Widget container3(size) {
    return size < 700
        ? Scaffold(
            body: Container(
              padding: const EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: notifier.getbgcolor11,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 155,
                      color: Colors.transparent,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      height: 90,
                                      width: 90,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.transparent,
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/Avatar31.png"),
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                    Positioned(
                                        right: 5,
                                        bottom: 0,
                                        child: Container(
                                          height: 20,
                                          width: 20,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: Colors.white, width: 2),
                                            color: const Color(0xff7DC066),
                                          ),
                                        ))
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "Robert Fox",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'InterRegular',
                                      fontSize: 18,
                                      color: notifier.getblackcolor),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "🤰Think about myself 😩😩😩",
                                  style: TextStyle(
                                    color: notifier.getblackcolor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    fontFamily: "PublicSansRegular",
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 45,
                            width: 80,
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: notifier.getbgcolor10,
                            ),
                            child: Center(
                                child: Image.asset('assets/video.png',
                                    width: 18, height: 18)),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 45,
                            width: 80,
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: notifier.getbgcolor10,
                            ),
                            child: Center(
                                child: Image.asset('assets/call1.png',
                                    width: 18, height: 18)),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 45,
                            width: 80,
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: notifier.getbgcolor10,
                            ),
                            child: Center(
                                child: Image.asset('assets/more.png',
                                    width: 20, height: 20)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Stories",
                      style: TextStyle(
                        color: notifier.getblackcolor,
                        fontWeight: FontWeight.w600,
                        fontFamily: "InterRegular",
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 120,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: model().Stories.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                                child: Image.asset(model().Stories[index])),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Media",
                      style: TextStyle(
                        color: notifier.getblackcolor,
                        fontWeight: FontWeight.w600,
                        fontFamily: "InterRegular",
                        fontSize: 14,
                      ),
                    ),
                    Column(
                      children: [
                        GridView.count(
                          primary: false,
                          shrinkWrap: true,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 5,
                          crossAxisCount: 3,
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.teal[100],
                                  image: const DecorationImage(
                                      image: AssetImage('assets/Media.png'),
                                      fit: BoxFit.cover)),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.teal[100],
                                  image: const DecorationImage(
                                      image: AssetImage('assets/Media2.png'),
                                      fit: BoxFit.cover)),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.teal[100],
                                  image: const DecorationImage(
                                      image: AssetImage('assets/Media(1).png'),
                                      fit: BoxFit.cover)),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.teal[100],
                                  image: const DecorationImage(
                                      image: AssetImage('assets/Media(2).png'),
                                      fit: BoxFit.cover)),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.teal[100],
                                  image: const DecorationImage(
                                      image: AssetImage('assets/Media(3).png'),
                                      fit: BoxFit.cover)),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.teal[100],
                                  image: const DecorationImage(
                                      image: AssetImage('assets/Media(4).png'),
                                      fit: BoxFit.cover)),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: notifier.getbgcolor10,
                        ),
                        child: const Center(
                            child: Text('View More',
                                style: TextStyle(
                                    color: Color(0xff727880),
                                    fontSize: 12,
                                    fontFamily: 'InterRegular',
                                    fontWeight: FontWeight.w600))),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Files & Links",
                      style: TextStyle(
                        color: notifier.getblackcolor,
                        fontWeight: FontWeight.w600,
                        fontFamily: "InterRegular",
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () {},
                      child: DottedBorder(
                        color: const Color(0xffEEEEEE),
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(12),
                        padding: const EdgeInsets.all(12),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                          child: Row(
                            children: [
                              Container(
                                height: 32,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Image.asset('assets/pdf.png'),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'pdf',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: notifier.getblackcolor,
                                      fontFamily: 'InterRegular',
                                    ),
                                  ),
                                  const Text(
                                    '231.72 KB',
                                    style: TextStyle(
                                        color: Color(0xff727880), fontSize: 10),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    InkWell(
                      onTap: () {},
                      child: DottedBorder(
                        color: const Color(0xffEEEEEE),
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(12),
                        padding: const EdgeInsets.all(12),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                          child: Row(
                            children: [
                              Container(
                                height: 32,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Image.asset('assets/psd-colored.png'),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'pdf',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: notifier.getblackcolor,
                                      fontFamily: 'InterRegular',
                                    ),
                                  ),
                                  const Text(
                                    '441.72 KB',
                                    style: TextStyle(
                                        color: Color(0xff727880), fontSize: 10),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: Image.asset('assets/Media10.png'),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Text(
                                'https://.medium.com/is-lamda-sentient',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: notifier.getblackcolor,
                                  fontFamily: 'InterRegular',
                                ),
                              ),
                            ),
                            const Text(
                              'medium.com',
                              style: TextStyle(
                                  color: Color(0xff595FE5), fontSize: 10),
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () {},
                      child: DottedBorder(
                        color: const Color(0xffEEEEEE),
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(12),
                        padding: const EdgeInsets.all(12),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                          child: Row(
                            children: [
                              Container(
                                height: 32,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Image.asset('assets/pdf.png'),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'pdf',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: notifier.getblackcolor,
                                      fontFamily: 'InterRegular',
                                    ),
                                  ),
                                  const Text(
                                    '231.72 KB',
                                    style: TextStyle(
                                        color: Color(0xff727880), fontSize: 10),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    InkWell(
                      onTap: () {},
                      child: DottedBorder(
                        color: const Color(0xffEEEEEE),
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(12),
                        padding: const EdgeInsets.all(12),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                          child: Row(
                            children: [
                              Container(
                                height: 32,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Image.asset('assets/psd-colored.png'),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'pdf',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: notifier.getblackcolor,
                                      fontFamily: 'InterRegular',
                                    ),
                                  ),
                                  const Text(
                                    '441.72 KB',
                                    style: TextStyle(
                                        color: Color(0xff727880), fontSize: 10),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                color: notifier.getbgcolor11,
                borderRadius: BorderRadius.circular(12)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        height: 155,
                        color: Colors.transparent,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              right: 0,
                              bottom: 0,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        height: 90,
                                        width: 90,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.transparent,
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/Avatar31.png"),
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                      Positioned(
                                          right: 5,
                                          bottom: 0,
                                          child: Container(
                                            height: 20,
                                            width: 20,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: Colors.white,
                                                  width: 2),
                                              color: const Color(0xff7DC066),
                                            ),
                                          ))
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    "Robert Fox",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'InterRegular',
                                        fontSize: 18,
                                        color: notifier.getblackcolor),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    "🤰Think about myself 😩😩😩",
                                    style: TextStyle(
                                      color: notifier.getblackcolor,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      fontFamily: "PublicSansRegular",
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 45,
                            width: 70,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: notifier.getbgcolor10,
                            ),
                            child: Center(
                                child: Image.asset('assets/video.png',
                                    width: 18, height: 18)),
                          ),
                        ),
                        // const SizedBox(
                        //   width: 20,
                        // ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 45,
                            width: 70,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: notifier.getbgcolor10,
                            ),
                            child: Center(
                                child: Image.asset('assets/call1.png',
                                    width: 18, height: 18)),
                          ),
                        ),
                        // const SizedBox(
                        //   width: 20,
                        // ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 45,
                            width: 70,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: notifier.getbgcolor10,
                            ),
                            child: Center(
                                child: Image.asset('assets/more.png',
                                    width: 20, height: 20)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Stories",
                      style: TextStyle(
                        color: notifier.getblackcolor,
                        fontWeight: FontWeight.w600,
                        fontFamily: "InterRegular",
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SizedBox(
                        height: 120,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: model().Stories.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                  child: Image.asset(model().Stories[index])),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Media",
                      style: TextStyle(
                        color: notifier.getblackcolor,
                        fontWeight: FontWeight.w600,
                        fontFamily: "InterRegular",
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        GridView.count(
                          primary: false,
                          shrinkWrap: true,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 5,
                          crossAxisCount: 3,
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.teal[100],
                                  image: const DecorationImage(
                                      image: AssetImage('assets/Media.png'),
                                      fit: BoxFit.cover)),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.teal[100],
                                  image: const DecorationImage(
                                      image: AssetImage('assets/Media2.png'),
                                      fit: BoxFit.cover)),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.teal[100],
                                  image: const DecorationImage(
                                      image: AssetImage('assets/Media(1).png'),
                                      fit: BoxFit.cover)),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.teal[100],
                                  image: const DecorationImage(
                                      image: AssetImage('assets/Media(2).png'),
                                      fit: BoxFit.cover)),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.teal[100],
                                  image: const DecorationImage(
                                      image: AssetImage('assets/Media(3).png'),
                                      fit: BoxFit.cover)),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.teal[100],
                                  image: const DecorationImage(
                                      image: AssetImage('assets/Media(4).png'),
                                      fit: BoxFit.cover)),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: notifier.getbgcolor10,
                        ),
                        child: const Center(
                            child: Text('View More',
                                style: TextStyle(
                                    color: Color(0xff727880),
                                    fontSize: 12,
                                    fontFamily: 'InterRegular',
                                    fontWeight: FontWeight.w600))),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Files & Links",
                      style: TextStyle(
                        color: notifier.getblackcolor,
                        fontWeight: FontWeight.w600,
                        fontFamily: "InterRegular",
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {},
                            child: DottedBorder(
                              color: const Color(0xffEEEEEE),
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(12),
                              padding: const EdgeInsets.all(12),
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(12)),
                                child: SizedBox(
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 32,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Image.asset('assets/pdf.png'),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'pdf',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: notifier.getblackcolor,
                                              fontFamily: 'InterRegular',
                                            ),
                                          ),
                                          const Text(
                                            '231.72 KB   ',
                                            style: TextStyle(
                                                color: Color(0xff727880),
                                                fontSize: 10),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {},
                            child: DottedBorder(
                              color: const Color(0xffEEEEEE),
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(12),
                              padding: const EdgeInsets.all(12),
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(12)),
                                child: SizedBox(
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 32,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Image.asset('assets/pdf.png'),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'pdf',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: notifier.getblackcolor,
                                              fontFamily: 'InterRegular',
                                            ),
                                          ),
                                          const Text(
                                            '231.72 KB   ',
                                            style: TextStyle(
                                                color: Color(0xff727880),
                                                fontSize: 10),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Transform.translate(
                      offset: const Offset(5, 0),
                      child: Row(
                        children: [
                          Container(
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            child: Image.asset('assets/Media10.png'),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Text(
                                  'https://.medium.com/is-\nlamda-sentient-an-...',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: notifier.getblackcolor,
                                    fontFamily: 'InterRegular',
                                  ),
                                ),
                              ),
                              const Text(
                                'medium.com',
                                style: TextStyle(
                                    color: Color(0xff595FE5), fontSize: 10),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {},
                            child: DottedBorder(
                              color: const Color(0xffEEEEEE),
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(12),
                              padding: const EdgeInsets.all(12),
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(12)),
                                child: SizedBox(
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 32,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Image.asset('assets/pdf.png'),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'pdf',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: notifier.getblackcolor,
                                              fontFamily: 'InterRegular',
                                            ),
                                          ),
                                          const Text(
                                            '231.72 KB   ',
                                            style: TextStyle(
                                                color: Color(0xff727880),
                                                fontSize: 10),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {},
                            child: DottedBorder(
                              color: const Color(0xffEEEEEE),
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(12),
                              padding: const EdgeInsets.all(12),
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(12)),
                                child: SizedBox(
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 32,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Image.asset(
                                            'assets/psd-colored.png'),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'pdf',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: notifier.getblackcolor,
                                              fontFamily: 'InterRegular',
                                            ),
                                          ),
                                          const Text(
                                            '231.72 KB   ',
                                            style: TextStyle(
                                                color: Color(0xff727880),
                                                fontSize: 10),
                                          )
                                        ],
                                      )
                                    ],
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
          );
  }
}

class ChatList {
  String image;
  String title;
  String? chat;

  ChatList({
    required this.image,
    required this.title,
    this.chat,
  });
}

List<ChatList> chatList = [
  ChatList(image: 'assets/Avatar1.png', title: 'Robert Darlene', chat: "4"),
  ChatList(
    image: 'assets/Avatar2.png',
    title: 'Bessie Cooper',
  ),
  ChatList(image: 'assets/Avata63.png', title: 'Marketing Team'),
  ChatList(image: 'assets/Avatar62.png', title: 'Robert Fox', chat: "2"),
  ChatList(image: 'assets/Avatar.png', title: "Ronald Richards"),
  ChatList(image: 'assets/Avatar64.png', title: "Joyce Kim", chat: "5"),
  ChatList(image: 'assets/Avatar65.png', title: "Laura Prichet"),
  ChatList(image: 'assets/Avatar66.png', title: "Peg Legge "),
  ChatList(image: 'assets/Avatar.png', title: "Arlene McCoy"),
  ChatList(image: 'assets/Avatar62.png', title: "Josh Bill"),
  ChatList(image: 'assets/Avatar1.png', title: "Sin Tae"),
  ChatList(image: 'assets/Avatar2.png', title: "Project Alpha"),
  ChatList(image: 'assets/Avata63.png', title: "Tech Team"),
  ChatList(image: 'assets/Avatar62.png', title: "Anne Frank"),
  ChatList(image: 'assets/Avatar.png', title: "Dj Sir"),
  ChatList(image: 'assets/Avatar64.png', title: "Anne Teak"),
  ChatList(image: 'assets/Avatar65.png', title: "The Perfect Man"),
];
