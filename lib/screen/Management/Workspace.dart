// ignore_for_file: deprecated_member_use
// ignore_for_file: prefer_const_constructors, file_names, camel_case_types
import 'package:dotted_border/dotted_border.dart';


import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../confing/colors.dart';

import '../../confing/list.dart';
import '../../confing/notifier.dart';
import '../../controller/page_controller.dart';
import '../Dashboard/Dashboard_main.dart';


class Workspace extends StatefulWidget {
  const Workspace({super.key});

  @override
  State<Workspace> createState() => _WorkspaceState();
}

class _WorkspaceState extends State<Workspace> {
  late ColorNotifier notifire;
  List dataa = [];
  List dataa1 = [];
  List dataa2 = [];
  SampleItem? selectedMenu;
  InboxController inboxController = Get.put(InboxController());

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifier>(context, listen: true);
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return Container(
            color: notifire.getbgcolor10,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
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
        }
        else if (constraints.maxWidth < 1050) {
          return Container(
            color: notifire.getbgcolor10,
            child: SingleChildScrollView(
              child: Column(
                children: [

                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        container(constraints.maxWidth),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        else {
          return Theme(
            data: Theme.of(context).copyWith(
                scrollbarTheme: const ScrollbarThemeData(
                    thickness: MaterialStatePropertyAll(4),
                    thumbColor: MaterialStatePropertyAll(
                      Colors.grey,
                    ))),
            child: Container(
              decoration: BoxDecoration(
                  color: notifire.getbgcolor10
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    firstContainer(
                        context: context,
                        constraints: constraints.maxWidth),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }

  Widget firstContainer({context, constraints,}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          constraints < 600
              ? const SizedBox()
              : container(constraints),

        ],
      ),
    );
  }

  Widget container(constraints) {
    return constraints < 600
        ? Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                const Spacer(),
                SvgPicture.asset(
                  'assets/house-door.svg', height: 16, color: Colors.blue,),
                const SizedBox(width: 10,),
                InkWell(
                    onTap: () {
                      inboxController.setTextIsTrue(1);
                    },
                    child: Text('Dashboard', style: TextStyle(
                      fontFamily: 'InterRegular',
                      fontSize: 14,
                      color: greyy,))),
                const SizedBox(width: 10,),
                Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: greyy,),),
                const SizedBox(width: 10,),
                Text('Managemant', style: TextStyle(
                    color: greyy, fontSize: 14, fontFamily: 'InterRegular'),),
                const SizedBox(width: 10,),
                Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: greyy,),),
                const SizedBox(width: 10,),
                Text('Version1', style: TextStyle(color: notifire.getblackcolor,
                    fontSize: 14,
                    fontFamily: 'InterRegular'),),
              ],
            ),
            const SizedBox(height: 10,),
            Text(
              'Web Design',
              style: TextStyle(
                  fontFamily: 'InterRegular',
                  fontSize: 26,
                  color: notifire.getblackcolor,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: notifire.getbgcolor11,
                borderRadius: BorderRadius.circular(12),),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: notifire.getbgcolor10
                      ),
                      padding: const EdgeInsets.all(11),
                      child: Center(
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/flash.png',
                              height: 16,
                            ),
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
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: notifire.getbgcolor10,),
                      padding: const EdgeInsets.all(11),
                      child: Center(
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/star2.png',
                              height: 16,
                            ),
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
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: notifire.getbgcolor10,),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Center(
                            child: Image.asset(
                              'assets/setting-5.png',
                              height: 18,
                              color: const Color(0xff727880),
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
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: notifire.getbgcolor10,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Center(
                            child: Image.asset(
                              'assets/more.png',
                              height: 20,
                              color: const Color(0xff727880),
                            )),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Transform.translate(
                    offset: const Offset(-50, 0),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Transform.translate(
                          offset: const Offset(-30, 0),
                          child: Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                                child:
                                Image.asset('assets/avatar-6 1.png')),
                          ),
                        ),
                        Positioned(
                            left: -10,
                            child: Transform.translate(
                              offset: const Offset(5, 0),
                              child: Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Center(
                                    child: Image.asset(
                                        'assets/avatar-7 1.png')),
                              ),
                            )),
                        Positioned(
                            left: 5,
                            child: Transform.translate(
                              offset: const Offset(15, 0),
                              child: Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Center(
                                    child: Image.asset(
                                        'assets/avatar-8 1.png')),
                              ),
                            )),
                        Positioned(
                            child: Transform.translate(
                              offset: const Offset(45, 0),
                              child: Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: const Color(0xffEEEEEE),
                                ),
                                child: const Center(
                                    child: Text(
                                      '+5',
                                      style: TextStyle(
                                          color: Color(0xffE5646C),
                                          fontSize: 14),
                                    )),
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        DefaultTabController(
            length: 2,
            initialIndex: 0,
            child: Column(children: [
              Row(
                children: [
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                        color: notifire.getbgcolor11,
                        borderRadius: BorderRadius.circular(16)),
                    child: TabBar(
                        indicatorColor: const Color(0xff2a70fe),
                        indicator: BoxDecoration(
                            color: notifire.Tab,
                            borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(16),
                                topRight: Radius.circular(16),
                                bottomLeft: Radius.circular(16),
                                topLeft: Radius.circular(16))),
                        isScrollable: true,
                        physics: const NeverScrollableScrollPhysics(),
                        labelColor: const Color(0xff2a70fe),
                        tabs: [
                          Tab(
                            child: Tab(
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/kanban.png',
                                      height: 14, color: notifire.getblackcolor,
                                    ),
                                  ],
                                )),
                          ),
                          Tab(
                            child: Tab(
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/element-3.svg',
                                      height: 16, color: notifire.getblackcolor,
                                    ),
                                  ],
                                )),
                          ),
                        ]),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(11),
                    decoration: BoxDecoration(
                        color: const Color(0xff595FE5),
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Row(children: [
                        Image.asset('assets/add.png', scale: 4),
                      ]),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: Get.height,
                child: TabBarView(
                  children: [
                    SingleChildScrollView(

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: Get.height,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: notifire.getbgcolor11,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      'Backlogs',
                                      style: TextStyle(
                                          color: Color(0xff9DA2A7),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          fontFamily: 'InterRegular'),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                        padding: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(12),
                                          color: notifire.getbgcolor10,
                                        ),
                                        child: const Text(
                                          '4',
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              fontSize: 12,
                                              color: Color(0xff9DA2A7)),
                                        )),
                                    const Spacer(),
                                    Image.asset(
                                      'assets/more.png',
                                      height: 16,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Expanded(
                                  child: ListView.builder(
                                    physics: const NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                    itemCount: model().Wor.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        margin: const EdgeInsets.only(
                                            bottom: 20),
                                        padding: const EdgeInsets.all(14),
                                        decoration: BoxDecoration(
                                          borderRadius:

                                          BorderRadius.circular(12),
                                          color: notifire.getbgcolor10,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .start,
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  model().Wor[index],
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontFamily:
                                                      'InterRegular',
                                                      fontWeight:
                                                      FontWeight.w600,
                                                      color:
                                                      notifire.getblackcolor),
                                                ),
                                                const Spacer(),
                                                Image.asset(
                                                  'assets/more.png',
                                                  height: 16,
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  padding:
                                                  const EdgeInsets
                                                      .all(6),
                                                  decoration:
                                                  BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(12),
                                                    color: model()
                                                        .Wor1[index],
                                                  ),
                                                  child: Center(
                                                      child: Text(
                                                          model().Wor3[
                                                          index],
                                                          style:
                                                          TextStyle(
                                                            color: model()
                                                                .Worcol[
                                                            index],
                                                            fontFamily:
                                                            'InterRegular',
                                                            fontSize: 12,
                                                          ))),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Container(
                                                  padding:
                                                  const EdgeInsets
                                                      .all(6),
                                                  decoration:
                                                  BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(12),
                                                    color: notifire
                                                        .getbgcolor11,
                                                  ),
                                                  child: Center(
                                                    child: Row(
                                                      children: [
                                                        Image.asset(
                                                            'assets/tag-right.png',
                                                            height: 12,
                                                            color: model()
                                                                .Wor5[
                                                            index]),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(
                                                          model().Wor4[
                                                          index],
                                                          style:
                                                          const TextStyle(
                                                            color: Color(
                                                                0xff727880),
                                                            fontSize: 12,
                                                            fontFamily:
                                                            'InterRegular',
                                                          ),
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
                                            index == 0
                                                ? Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(
                                                      12),
                                                  image: const DecorationImage(
                                                      image: AssetImage(
                                                          'assets/Media21.png'))),
                                              child: Center(
                                                  child: Image.asset(
                                                      'assets/image40.png',
                                                      fit: BoxFit
                                                          .cover)),
                                            )
                                                : const SizedBox(),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            index == 1
                                                ? const Text(
                                                'Review vendor rules and regulations',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Color(
                                                        0xff9DA2A7),
                                                    fontFamily:
                                                    'InterRegular'))
                                                : const SizedBox(),
                                            index == 2
                                                ? const Text(
                                                'Review lead retrieval system',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Color(
                                                        0xff9DA2A7),
                                                    fontFamily:
                                                    'InterRegular'))
                                                : const SizedBox(),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/Link.svg',
                                                    height: 16,
                                                    color: const Color(
                                                        0xffC6C8CB)),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  model().War6[index],
                                                  style: const TextStyle(
                                                      fontFamily:
                                                      'InterRegular',
                                                      fontSize: 14,
                                                      color: Color(
                                                          0xffC6C8CB),
                                                      fontWeight:
                                                      FontWeight
                                                          .w600),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                SvgPicture.asset(
                                                  'assets/messages-3.svg',
                                                  height: 16,
                                                  color: const Color(
                                                      0xffC6C8CB),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  model().War7[index],
                                                  style: const TextStyle(
                                                      fontFamily:
                                                      'InterRegular',
                                                      fontSize: 14,
                                                      color: Color(
                                                          0xffC6C8CB),
                                                      fontWeight:
                                                      FontWeight
                                                          .w600),
                                                ),
                                                const Spacer(),
                                                index == 0
                                                    ? Transform.translate(
                                                  offset:
                                                  const Offset(
                                                      -50, 0),
                                                  child: Stack(
                                                    clipBehavior:
                                                    Clip.none,
                                                    children: [
                                                      Transform
                                                          .translate(
                                                        offset:
                                                        const Offset(
                                                            -30,
                                                            0),
                                                        child:
                                                        Container(
                                                          width: 32,
                                                          height:
                                                          32,
                                                          decoration:
                                                          BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                          ),
                                                          child: Center(
                                                              child:
                                                              Image.asset(
                                                                  'assets/avatar-6 1.png')),
                                                        ),
                                                      ),
                                                      Positioned(
                                                          left: -10,
                                                          child: Transform
                                                              .translate(
                                                            offset: const Offset(
                                                                5,
                                                                0),
                                                            child:
                                                            Container(
                                                              width:
                                                              32,
                                                              height:
                                                              32,
                                                              decoration:
                                                              BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    15),
                                                              ),
                                                              child:
                                                              Center(
                                                                  child: Image
                                                                      .asset(
                                                                      'assets/avatar-7 1.png')),
                                                            ),
                                                          )),
                                                      Positioned(
                                                          left: 5,
                                                          child: Transform
                                                              .translate(
                                                            offset: const Offset(
                                                                15,
                                                                0),
                                                            child:
                                                            Container(
                                                              width:
                                                              32,
                                                              height:
                                                              32,
                                                              decoration:
                                                              BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    15),
                                                              ),
                                                              child:
                                                              Center(
                                                                  child: Image
                                                                      .asset(
                                                                      'assets/avatar-8 1.png')),
                                                            ),
                                                          )),
                                                      Positioned(
                                                          child: Transform
                                                              .translate(
                                                            offset:
                                                            const Offset(
                                                                45,
                                                                0),
                                                            child:
                                                            Container(
                                                              width: 32,
                                                              height:
                                                              32,
                                                              decoration:
                                                              BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    15),
                                                                color: const Color(
                                                                    0xffEEEEEE),
                                                              ),
                                                              child: const Center(
                                                                  child: Text(
                                                                    '+5',
                                                                    style: TextStyle(
                                                                        color:
                                                                        Color(
                                                                            0xffE5646C),
                                                                        fontSize: 14),
                                                                  )),
                                                            ),
                                                          )),
                                                    ],
                                                  ),
                                                )
                                                    : const SizedBox(),
                                                index == 1
                                                    ? Transform.translate(
                                                  offset:
                                                  const Offset(
                                                      -50, 0),
                                                  child: Stack(
                                                    clipBehavior:
                                                    Clip.none,
                                                    children: [
                                                      Positioned(
                                                          left: 5,
                                                          child: Transform
                                                              .translate(
                                                            offset: const Offset(
                                                                15,
                                                                0),
                                                            child:
                                                            Container(
                                                              width:
                                                              32,
                                                              height:
                                                              32,
                                                              decoration:
                                                              BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    15),
                                                              ),
                                                              child:
                                                              Center(
                                                                  child: Image
                                                                      .asset(
                                                                      'assets/avatar-8 1.png')),
                                                            ),
                                                          )),
                                                      Positioned(
                                                          child: Transform
                                                              .translate(
                                                            offset:
                                                            const Offset(
                                                                45,
                                                                0),
                                                            child:
                                                            Container(
                                                              width: 32,
                                                              height:
                                                              32,
                                                              decoration:
                                                              BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    15),
                                                                color: const Color(
                                                                    0xffEEEEEE),
                                                              ),
                                                              child: const Center(
                                                                  child: Text(
                                                                    '+16',
                                                                    style: TextStyle(
                                                                        color:
                                                                        Color(
                                                                            0xffE5646C),
                                                                        fontSize: 14),
                                                                  )),
                                                            ),
                                                          )),
                                                    ],
                                                  ),
                                                )
                                                    : const SizedBox(),
                                                index == 2
                                                    ? Transform.translate(
                                                  offset:
                                                  const Offset(
                                                      -50, 0),
                                                  child: Stack(
                                                    clipBehavior:
                                                    Clip.none,
                                                    children: [
                                                      Positioned(
                                                          left: -10,
                                                          child: Transform
                                                              .translate(
                                                            offset: const Offset(
                                                                5,
                                                                0),
                                                            child:
                                                            Container(
                                                              width:
                                                              32,
                                                              height:
                                                              32,
                                                              decoration:
                                                              BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    15),
                                                              ),
                                                              child:
                                                              Center(
                                                                  child: Image
                                                                      .asset(
                                                                      'assets/avatar-7 1.png')),
                                                            ),
                                                          )),
                                                      Positioned(
                                                          left: 5,
                                                          child: Transform
                                                              .translate(
                                                            offset: const Offset(
                                                                15,
                                                                0),
                                                            child:
                                                            Container(
                                                              width:
                                                              32,
                                                              height:
                                                              32,
                                                              decoration:
                                                              BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    15),
                                                              ),
                                                              child:
                                                              Center(
                                                                  child: Image
                                                                      .asset(
                                                                      'assets/avatar-8 1.png')),
                                                            ),
                                                          )),
                                                      Positioned(
                                                          child: Transform
                                                              .translate(
                                                            offset:
                                                            const Offset(
                                                                45,
                                                                0),
                                                            child:
                                                            Container(
                                                              width: 32,
                                                              height:
                                                              32,
                                                              decoration:
                                                              BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    15),
                                                                color: const Color(
                                                                    0xffEEEEEE),
                                                              ),
                                                              child: const Center(
                                                                  child: Text(
                                                                    '+12',
                                                                    style: TextStyle(
                                                                        color:
                                                                        Color(
                                                                            0xffE5646C),
                                                                        fontSize: 14),
                                                                  )),
                                                            ),
                                                          )),
                                                    ],
                                                  ),
                                                )
                                                    : const SizedBox(),
                                              ],
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 120,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(12),
                                      color: notifire.getbgcolor10,
                                    ),
                                    child: DottedBorder(
                                        color: const Color(0xffC6C8CB),
                                        padding: const EdgeInsets.all(12),
                                        radius: const Radius.circular(12),
                                        borderType: BorderType.RRect,
                                        child: Row(
                                          children: [
                                            Image.asset('assets/add.png',
                                                height: 16,
                                                color: const Color(
                                                    0xff727880)),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text(
                                              'Add Task',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily:
                                                  'InterRegular',
                                                  color: Color(0xff727880),
                                                  fontWeight:
                                                  FontWeight.w600),
                                            )
                                          ],
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: Get.height,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: notifire.getbgcolor11,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      'In Work',
                                      style: TextStyle(
                                          color: Color(0xff9DA2A7),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          fontFamily: 'InterRegular'),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                        padding: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(12),
                                          color: notifire.getbgcolor10,
                                        ),
                                        child: const Text(
                                          '4',
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              fontSize: 12,
                                              color: Color(0xff9DA2A7)),
                                        )),
                                    const Spacer(),
                                    Image.asset(
                                      'assets/more.png',
                                      height: 16,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Expanded(
                                  child: ListView.builder(
                                    physics: const NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                    // shrinkWrap: true,
                                    itemCount: model().War8.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        margin: const EdgeInsets.only(
                                            bottom: 20),
                                        padding: const EdgeInsets.all(14),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(12),
                                          color: notifire.getbgcolor10,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .start,
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  model().War8[index],
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontFamily:
                                                      'InterRegular',
                                                      fontWeight:
                                                      FontWeight.w600,
                                                      color:
                                                      notifire.getblackcolor),
                                                ),
                                                const Spacer(),
                                                Image.asset(
                                                  'assets/more.png',
                                                  height: 16,
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  padding:
                                                  const EdgeInsets
                                                      .all(6),
                                                  decoration:
                                                  BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(12),
                                                    color: model()
                                                        .Wor11[index],
                                                  ),
                                                  child: Center(
                                                      child: Text(
                                                          model()
                                                              .war[index],
                                                          style:
                                                          TextStyle(
                                                            color: model()
                                                                .Worcol1[
                                                            index],
                                                            fontFamily:
                                                            'InterRegular',
                                                            fontSize: 12,
                                                          ))),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Container(
                                                  padding:
                                                  const EdgeInsets
                                                      .all(6),
                                                  decoration:
                                                  BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(12),
                                                    color: notifire.Getblg2,
                                                  ),
                                                  child: Center(
                                                    child: Row(
                                                      children: [
                                                        Image.asset(
                                                            model().War13[
                                                            index],
                                                            height: 12,
                                                            color: model()
                                                                .Worcol1[
                                                            index]),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(
                                                          model().War12[
                                                          index],
                                                          style:
                                                          const TextStyle(
                                                            color: Color(
                                                                0xff727880),
                                                            fontSize: 12,
                                                            fontFamily:
                                                            'InterRegular',
                                                          ),
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
                                            index == 1
                                                ? Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(
                                                      12),
                                                  image: const DecorationImage(
                                                      image: AssetImage(
                                                          'assets/Media21.png'))),
                                              child: Center(
                                                  child: Image.asset(
                                                      'assets/image40.png',
                                                      fit: BoxFit
                                                          .cover)),
                                            )
                                                : const SizedBox(),
                                            index == 2
                                                ? Container(
                                              height: 140,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(
                                                      12),
                                                  image: const DecorationImage(
                                                      image: AssetImage(
                                                          'assets/Media21.png'))),
                                              child: Center(
                                                  child: Image.asset(
                                                      'assets/Media12.png',
                                                      fit: BoxFit
                                                          .cover)),
                                            )
                                                : const SizedBox(),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            index == 0
                                                ? const Text(
                                                'There are many variations of passages',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Color(
                                                        0xff9DA2A7),
                                                    fontFamily:
                                                    'InterRegular'))
                                                : const SizedBox(),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/Link.svg',
                                                    height: 16,
                                                    color: const Color(
                                                        0xffC6C8CB)),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  model().War6[index],
                                                  style: const TextStyle(
                                                      fontFamily:
                                                      'InterRegular',
                                                      fontSize: 14,
                                                      color: Color(
                                                          0xffC6C8CB),
                                                      fontWeight:
                                                      FontWeight
                                                          .w600),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                SvgPicture.asset(
                                                  'assets/messages-3.svg',
                                                  height: 16,
                                                  color: const Color(
                                                      0xffC6C8CB),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  model().War7[index],
                                                  style: const TextStyle(
                                                      fontFamily:
                                                      'InterRegular',
                                                      fontSize: 14,
                                                      color: Color(
                                                          0xffC6C8CB),
                                                      fontWeight:
                                                      FontWeight
                                                          .w600),
                                                ),
                                                const Spacer(),
                                                index == 0
                                                    ? Transform.translate(
                                                  offset:
                                                  const Offset(
                                                      -50, 0),
                                                  child: Stack(
                                                    clipBehavior:
                                                    Clip.none,
                                                    children: [
                                                      Positioned(
                                                          child: Transform
                                                              .translate(
                                                            offset:
                                                            const Offset(
                                                                45,
                                                                0),
                                                            child:
                                                            Container(
                                                              width: 32,
                                                              height:
                                                              32,
                                                              decoration:
                                                              BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    15),
                                                              ),
                                                              child: Center(
                                                                  child:
                                                                  Image.asset(
                                                                      'assets/avatar-8 1.png')),
                                                            ),
                                                          )),
                                                    ],
                                                  ),
                                                )
                                                    : const SizedBox(),
                                                index == 1
                                                    ? Transform.translate(
                                                  offset:
                                                  const Offset(
                                                      -50, 0),
                                                  child: Stack(
                                                    clipBehavior:
                                                    Clip.none,
                                                    children: [
                                                      Positioned(
                                                          left: 5,
                                                          child: Transform
                                                              .translate(
                                                            offset: const Offset(
                                                                15,
                                                                0),
                                                            child:
                                                            Container(
                                                              width:
                                                              32,
                                                              height:
                                                              32,
                                                              decoration:
                                                              BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    15),
                                                              ),
                                                              child:
                                                              Center(
                                                                  child: Image
                                                                      .asset(
                                                                      'assets/avatar-8 1.png')),
                                                            ),
                                                          )),
                                                      Positioned(
                                                          child: Transform
                                                              .translate(
                                                            offset:
                                                            const Offset(
                                                                45,
                                                                0),
                                                            child:
                                                            Container(
                                                              width: 32,
                                                              height:
                                                              32,
                                                              decoration:
                                                              BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    15),
                                                                color: const Color(
                                                                    0xffEEEEEE),
                                                              ),
                                                              child: const Center(
                                                                  child: Text(
                                                                    '+16',
                                                                    style: TextStyle(
                                                                        color:
                                                                        Color(
                                                                            0xffE5646C),
                                                                        fontSize: 14),
                                                                  )),
                                                            ),
                                                          )),
                                                    ],
                                                  ),
                                                )
                                                    : const SizedBox(),
                                                index == 2
                                                    ? Transform.translate(
                                                  offset:
                                                  const Offset(
                                                      -50, 0),
                                                  child: Stack(
                                                    clipBehavior:
                                                    Clip.none,
                                                    children: [
                                                      Positioned(
                                                          left: -10,
                                                          child: Transform
                                                              .translate(
                                                            offset: const Offset(
                                                                5,
                                                                0),
                                                            child:
                                                            Container(
                                                              width:
                                                              32,
                                                              height:
                                                              32,
                                                              decoration:
                                                              BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    15),
                                                              ),
                                                              child:
                                                              Center(
                                                                  child: Image
                                                                      .asset(
                                                                      'assets/avatar-7 1.png')),
                                                            ),
                                                          )),
                                                      Positioned(
                                                          left: 5,
                                                          child: Transform
                                                              .translate(
                                                            offset: const Offset(
                                                                15,
                                                                0),
                                                            child:
                                                            Container(
                                                              width:
                                                              32,
                                                              height:
                                                              32,
                                                              decoration:
                                                              BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    15),
                                                              ),
                                                              child:
                                                              Center(
                                                                  child: Image
                                                                      .asset(
                                                                      'assets/avatar-8 1.png')),
                                                            ),
                                                          )),
                                                      Positioned(
                                                          child: Transform
                                                              .translate(
                                                            offset:
                                                            const Offset(
                                                                45,
                                                                0),
                                                            child:
                                                            Container(
                                                              width: 32,
                                                              height:
                                                              32,
                                                              decoration:
                                                              BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    15),
                                                                color: const Color(
                                                                    0xffEEEEEE),
                                                              ),
                                                              child: const Center(
                                                                  child: Text(
                                                                    '+12',
                                                                    style: TextStyle(
                                                                        color:
                                                                        Color(
                                                                            0xffE5646C),
                                                                        fontSize: 14),
                                                                  )),
                                                            ),
                                                          )),
                                                    ],
                                                  ),
                                                )
                                                    : const SizedBox(),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 120,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(12),
                                      color: notifire.getbgcolor10,
                                    ),
                                    child: DottedBorder(
                                        color: const Color(0xffC6C8CB),
                                        padding: const EdgeInsets.all(12),
                                        radius: const Radius.circular(12),
                                        borderType: BorderType.RRect,
                                        child: Row(
                                          children: [
                                            Image.asset('assets/add.png',
                                                height: 16,
                                                color: const Color(
                                                    0xff727880)),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text(
                                              'Add Task',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily:
                                                  'InterRegular',
                                                  color: Color(0xff727880),
                                                  fontWeight:
                                                  FontWeight.w600),
                                            )
                                          ],
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: Get.height,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: notifire.getbgcolor11,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      'Q & A',
                                      style: TextStyle(
                                          color: Color(0xff9DA2A7),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          fontFamily: 'InterRegular'),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                        padding: const EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(12),
                                          color: notifire.getbgcolor10,
                                        ),
                                        child: const Text(
                                          '4',
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              fontSize: 12,
                                              color: Color(0xff9DA2A7)),
                                        )),
                                    const Spacer(),
                                    Image.asset(
                                      'assets/more.png',
                                      height: 16,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Expanded(
                                  child: ListView.builder(
                                    physics: const NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                    // shrinkWrap: true,
                                    itemCount: model().War8.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        margin: const EdgeInsets.only(
                                            bottom: 20),
                                        padding: const EdgeInsets.all(14),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(12),
                                          color: notifire.getbgcolor10,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .start,
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  model().War8[index],
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontFamily:
                                                      'InterRegular',
                                                      fontWeight:
                                                      FontWeight.w600,
                                                      color:
                                                      notifire.getblackcolor),
                                                ),
                                                const Spacer(),
                                                Image.asset(
                                                  'assets/more.png',
                                                  height: 16,
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  padding:
                                                  const EdgeInsets
                                                      .all(6),
                                                  decoration:
                                                  BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(12),
                                                    color: model()
                                                        .Wor11[index],
                                                  ),
                                                  child: Center(
                                                      child: Text(
                                                          model()
                                                              .war[index],
                                                          style:
                                                          TextStyle(
                                                            color: model()
                                                                .Worcol1[
                                                            index],
                                                            fontFamily:
                                                            'InterRegular',
                                                            fontSize: 12,
                                                          ))),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Container(
                                                  padding:
                                                  const EdgeInsets
                                                      .all(6),
                                                  decoration:
                                                  BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(12),
                                                    color: const Color(
                                                        0xffEEEEEE),
                                                  ),
                                                  child: Center(
                                                    child: Row(
                                                      children: [
                                                        Image.asset(
                                                            model().War13[
                                                            index],
                                                            height: 12,
                                                            color: model()
                                                                .Worcol1[
                                                            index]),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(
                                                          model().War12[
                                                          index],
                                                          style:
                                                          const TextStyle(
                                                            color: Color(
                                                                0xff727880),
                                                            fontSize: 12,
                                                            fontFamily:
                                                            'InterRegular',
                                                          ),
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
                                            index == 0
                                                ? Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(
                                                      12),
                                                  image: const DecorationImage(
                                                      image: AssetImage(
                                                          'assets/Media21.png'))),
                                              child: Center(
                                                  child: Image.asset(
                                                      'assets/image40.png',
                                                      fit: BoxFit
                                                          .cover)),
                                            )
                                                : const SizedBox(),
                                            index == 1
                                                ? Container(
                                              height: 140,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(
                                                      12),
                                                  image: const DecorationImage(
                                                      image: AssetImage(
                                                          'assets/Media21.png'))),
                                              child: Center(
                                                  child: Image.asset(
                                                      'assets/Media12.png',
                                                      fit: BoxFit
                                                          .cover)),
                                            )
                                                : const SizedBox(),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            index == 0
                                                ? const Text(
                                                'It has survived not only five centuries',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Color(
                                                        0xff9DA2A7),
                                                    fontFamily:
                                                    'InterRegular'))
                                                : const SizedBox(),
                                            index == 1
                                                ? const Text(
                                                'The generated Lorem Ipsum is therefore ',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Color(
                                                        0xff9DA2A7),
                                                    fontFamily:
                                                    'InterRegular'))
                                                : const SizedBox(),
                                            index == 2
                                                ? const Text(
                                                'These cases are perfectly simple and easy to distinguish ',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Color(
                                                        0xff9DA2A7),
                                                    fontFamily:
                                                    'InterRegular'))
                                                : const SizedBox(),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/Link.svg',
                                                    height: 16,
                                                    color: const Color(
                                                        0xffC6C8CB)),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  model().War6[index],
                                                  style: const TextStyle(
                                                      fontFamily:
                                                      'InterRegular',
                                                      fontSize: 14,
                                                      color: Color(
                                                          0xffC6C8CB),
                                                      fontWeight:
                                                      FontWeight
                                                          .w600),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                SvgPicture.asset(
                                                  'assets/messages-3.svg',
                                                  height: 16,
                                                  color: const Color(
                                                      0xffC6C8CB),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  model().War7[index],
                                                  style: const TextStyle(
                                                      fontFamily:
                                                      'InterRegular',
                                                      fontSize: 14,
                                                      color: Color(
                                                          0xffC6C8CB),
                                                      fontWeight:
                                                      FontWeight
                                                          .w600),
                                                ),
                                                const Spacer(),
                                                index == 0
                                                    ? Transform.translate(
                                                  offset:
                                                  const Offset(
                                                      -50, 0),
                                                  child: Stack(
                                                    clipBehavior:
                                                    Clip.none,
                                                    children: [
                                                      Positioned(
                                                          child: Transform
                                                              .translate(
                                                            offset:
                                                            const Offset(
                                                                45,
                                                                0),
                                                            child:
                                                            Container(
                                                              width: 32,
                                                              height:
                                                              32,
                                                              decoration:
                                                              BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    15),
                                                              ),
                                                              child: Center(
                                                                  child:
                                                                  Image.asset(
                                                                      'assets/avatar-8 1.png')),
                                                            ),
                                                          )),
                                                    ],
                                                  ),
                                                )
                                                    : const SizedBox(),
                                                index == 1
                                                    ? Transform.translate(
                                                  offset:
                                                  const Offset(
                                                      -50, 0),
                                                  child: Stack(
                                                    clipBehavior:
                                                    Clip.none,
                                                    children: [
                                                      Positioned(
                                                          left: 5,
                                                          child: Transform
                                                              .translate(
                                                            offset: const Offset(
                                                                15,
                                                                0),
                                                            child:
                                                            Container(
                                                              width:
                                                              32,
                                                              height:
                                                              32,
                                                              decoration:
                                                              BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    15),
                                                              ),
                                                              child:
                                                              Center(
                                                                  child: Image
                                                                      .asset(
                                                                      'assets/avatar-8 1.png')),
                                                            ),
                                                          )),
                                                      Positioned(
                                                          child: Transform
                                                              .translate(
                                                            offset:
                                                            const Offset(
                                                                45,
                                                                0),
                                                            child:
                                                            Container(
                                                              width: 32,
                                                              height:
                                                              32,
                                                              decoration:
                                                              BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    15),
                                                                color: const Color(
                                                                    0xffEEEEEE),
                                                              ),
                                                              child: const Center(
                                                                  child: Text(
                                                                    '+16',
                                                                    style: TextStyle(
                                                                        color:
                                                                        Color(
                                                                            0xffE5646C),
                                                                        fontSize: 14),
                                                                  )),
                                                            ),
                                                          )),
                                                    ],
                                                  ),
                                                )
                                                    : const SizedBox(),
                                                index == 2
                                                    ? Transform.translate(
                                                  offset:
                                                  const Offset(
                                                      -50, 0),
                                                  child: Stack(
                                                    clipBehavior:
                                                    Clip.none,
                                                    children: [
                                                      Positioned(
                                                          left: -10,
                                                          child: Transform
                                                              .translate(
                                                            offset: const Offset(
                                                                5,
                                                                0),
                                                            child:
                                                            Container(
                                                              width:
                                                              32,
                                                              height:
                                                              32,
                                                              decoration:
                                                              BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    15),
                                                              ),
                                                              child:
                                                              Center(
                                                                  child: Image
                                                                      .asset(
                                                                      'assets/avatar-7 1.png')),
                                                            ),
                                                          )),
                                                      Positioned(
                                                          left: 5,
                                                          child: Transform
                                                              .translate(
                                                            offset: const Offset(
                                                                15,
                                                                0),
                                                            child:
                                                            Container(
                                                              width:
                                                              32,
                                                              height:
                                                              32,
                                                              decoration:
                                                              BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    15),
                                                              ),
                                                              child:
                                                              Center(
                                                                  child: Image
                                                                      .asset(
                                                                      'assets/avatar-8 1.png')),
                                                            ),
                                                          )),
                                                      Positioned(
                                                          child: Transform
                                                              .translate(
                                                            offset:
                                                            const Offset(
                                                                45,
                                                                0),
                                                            child:
                                                            Container(
                                                              width: 32,
                                                              height:
                                                              32,
                                                              decoration:
                                                              BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    15),
                                                                color: const Color(
                                                                    0xffEEEEEE),
                                                              ),
                                                              child: const Center(
                                                                  child: Text(
                                                                    '+12',
                                                                    style: TextStyle(
                                                                        color:
                                                                        Color(
                                                                            0xffE5646C),
                                                                        fontSize: 14),
                                                                  )),
                                                            ),
                                                          )),
                                                    ],
                                                  ),
                                                )
                                                    : const SizedBox(),
                                              ],
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 120,
                                  child: DottedBorder(

                                      color: const Color(0xffC6C8CB),
                                      padding: const EdgeInsets.all(12),
                                      radius: const Radius.circular(12),
                                      borderType: BorderType.RRect,
                                      child: Row(
                                        children: [
                                          Image.asset('assets/add.png',
                                              height: 16,
                                              color: const Color(
                                                  0xff727880)),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const Text(
                                            'Add Task',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontFamily:
                                                'InterRegular',
                                                color: Color(0xff727880),
                                                fontWeight:
                                                FontWeight.w600),
                                          )
                                        ],
                                      )),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: Get.height,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: notifire.getbgcolor11,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      'Archive',
                                      style: TextStyle(
                                          color: Color(0xff9DA2A7),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          fontFamily: 'InterRegular'),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                        padding: const EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(12),
                                            color: notifire.getbgcolor10
                                        ),
                                        child: const Text(
                                          '12',
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              fontSize: 12,
                                              color: Color(0xff9DA2A7)),
                                        )),
                                    const Spacer(),
                                    Image.asset(
                                      'assets/more.png',
                                      height: 16,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Expanded(
                                  child: ListView.builder(
                                    physics: const NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                    // shrinkWrap: true,
                                    itemCount: model().War8.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        margin: const EdgeInsets.only(
                                            bottom: 20),
                                        padding: const EdgeInsets.all(14),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(12),
                                          color: notifire.getbgcolor10,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .start,
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  model().War8[index],
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontFamily:
                                                      'InterRegular',
                                                      fontWeight:
                                                      FontWeight.w600,
                                                      color:
                                                      notifire.getblackcolor),
                                                ),
                                                const Spacer(),
                                                Image.asset(
                                                  'assets/more.png',
                                                  height: 16,
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  padding:
                                                  const EdgeInsets
                                                      .all(6),
                                                  decoration:
                                                  BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(16),
                                                    color: model()
                                                        .Wor11[index],
                                                  ),
                                                  child: Center(
                                                      child: Text(
                                                          model()
                                                              .war[index],
                                                          style:
                                                          TextStyle(
                                                            color: model()
                                                                .Worcol1[
                                                            index],
                                                            fontFamily:
                                                            'InterRegular',
                                                            fontSize: 12,
                                                          ))),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Container(
                                                  padding:
                                                  const EdgeInsets
                                                      .all(6),
                                                  decoration:
                                                  BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(16),
                                                    color: notifire
                                                        .getbgcolor10,
                                                  ),
                                                  child: Center(
                                                    child: Row(
                                                      children: [
                                                        Image.asset(
                                                            model().War13[
                                                            index],
                                                            height: 12,
                                                            color: model()
                                                                .Worcol1[
                                                            index]),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(
                                                          model().War12[
                                                          index],
                                                          style:
                                                          const TextStyle(
                                                            color: Color(
                                                                0xff727880),
                                                            fontSize: 12,
                                                            fontFamily:
                                                            'InterRegular',
                                                          ),
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
                                            index == 1
                                                ? Container(
                                              height: 140,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(
                                                      12),
                                                  image: const DecorationImage(
                                                      image: AssetImage(
                                                          'assets/Media21.png'))),
                                              child: Center(
                                                  child: Image.asset(
                                                      'assets/Media12.png',
                                                      fit: BoxFit
                                                          .cover)),
                                            )
                                                : const SizedBox(),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            index == 0
                                                ? const Text(
                                                'It has survived not only five centuries',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Color(
                                                        0xff9DA2A7),
                                                    fontFamily:
                                                    'InterRegular'))
                                                : const SizedBox(),
                                            index == 1
                                                ? const Text(
                                                'The generated Lorem Ipsum is therefore ',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Color(
                                                        0xff9DA2A7),
                                                    fontFamily:
                                                    'InterRegular'))
                                                : const SizedBox(),
                                            index == 2
                                                ? const Text(
                                                'These cases are perfectly simple and easy to distinguish ',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Color(
                                                        0xff9DA2A7),
                                                    fontFamily:
                                                    'InterRegular'))
                                                : const SizedBox(),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/Link.svg',
                                                    height: 16,
                                                    color: const Color(
                                                        0xffC6C8CB)),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  model().War6[index],
                                                  style: const TextStyle(
                                                      fontFamily:
                                                      'InterRegular',
                                                      fontSize: 14,
                                                      color: Color(
                                                          0xffC6C8CB),
                                                      fontWeight:
                                                      FontWeight
                                                          .w600),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                SvgPicture.asset(
                                                  'assets/messages-3.svg',
                                                  height: 16,
                                                  color: const Color(
                                                      0xffC6C8CB),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  model().War7[index],
                                                  style: const TextStyle(
                                                      fontFamily:
                                                      'InterRegular',
                                                      fontSize: 14,
                                                      color: Color(
                                                          0xffC6C8CB),
                                                      fontWeight:
                                                      FontWeight
                                                          .w600),
                                                ),
                                                const Spacer(),
                                                index == 0
                                                    ? Transform.translate(
                                                  offset:
                                                  const Offset(
                                                      -50, 0),
                                                  child: Stack(
                                                    clipBehavior:
                                                    Clip.none,
                                                    children: [
                                                      Positioned(
                                                          child: Transform
                                                              .translate(
                                                            offset:
                                                            const Offset(
                                                                45,
                                                                0),
                                                            child:
                                                            Container(
                                                              width: 32,
                                                              height:
                                                              32,
                                                              decoration:
                                                              BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    15),
                                                              ),
                                                              child: Center(
                                                                  child:
                                                                  Image.asset(
                                                                      'assets/avatar-8 1.png')),
                                                            ),
                                                          )),
                                                    ],
                                                  ),
                                                )
                                                    : const SizedBox(),
                                                index == 1
                                                    ? Transform.translate(
                                                  offset:
                                                  const Offset(
                                                      -50, 0),
                                                  child: Stack(
                                                    clipBehavior:
                                                    Clip.none,
                                                    children: [
                                                      Positioned(
                                                          left: 5,
                                                          child: Transform
                                                              .translate(
                                                            offset: const Offset(
                                                                15,
                                                                0),
                                                            child:
                                                            Container(
                                                              width:
                                                              32,
                                                              height:
                                                              32,
                                                              decoration:
                                                              BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    15),
                                                              ),
                                                              child:
                                                              Center(
                                                                  child: Image
                                                                      .asset(
                                                                      'assets/avatar-8 1.png')),
                                                            ),
                                                          )),
                                                      Positioned(
                                                          child: Transform
                                                              .translate(
                                                            offset:
                                                            const Offset(
                                                                45,
                                                                0),
                                                            child:
                                                            Container(
                                                              width: 32,
                                                              height:
                                                              32,
                                                              decoration:
                                                              BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    15),
                                                                color: const Color(
                                                                    0xffEEEEEE),
                                                              ),
                                                              child: const Center(
                                                                  child: Text(
                                                                    '+16',
                                                                    style: TextStyle(
                                                                        color:
                                                                        Color(
                                                                            0xffE5646C),
                                                                        fontSize: 14),
                                                                  )),
                                                            ),
                                                          )),
                                                    ],
                                                  ),
                                                )
                                                    : const SizedBox(),
                                                index == 2
                                                    ? Transform.translate(
                                                  offset:
                                                  const Offset(
                                                      -50, 0),
                                                  child: Stack(
                                                    clipBehavior:
                                                    Clip.none,
                                                    children: [
                                                      Positioned(
                                                          left: -10,
                                                          child: Transform
                                                              .translate(
                                                            offset: const Offset(
                                                                5,
                                                                0),
                                                            child:
                                                            Container(
                                                              width:
                                                              32,
                                                              height:
                                                              32,
                                                              decoration:
                                                              BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    15),
                                                              ),
                                                              child:
                                                              Center(
                                                                  child: Image
                                                                      .asset(
                                                                      'assets/avatar-7 1.png')),
                                                            ),
                                                          )),
                                                      Positioned(
                                                          left: 5,
                                                          child: Transform
                                                              .translate(
                                                            offset: const Offset(
                                                                15,
                                                                0),
                                                            child:
                                                            Container(
                                                              width:
                                                              32,
                                                              height:
                                                              32,
                                                              decoration:
                                                              BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    15),
                                                              ),
                                                              child:
                                                              Center(
                                                                  child: Image
                                                                      .asset(
                                                                      'assets/avatar-8 1.png')),
                                                            ),
                                                          )),
                                                      Positioned(
                                                          child: Transform
                                                              .translate(
                                                            offset:
                                                            const Offset(
                                                                45,
                                                                0),
                                                            child:
                                                            Container(
                                                              width: 32,
                                                              height:
                                                              32,
                                                              decoration:
                                                              BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    15),
                                                                color: const Color(
                                                                    0xffEEEEEE),
                                                              ),
                                                              child: const Center(
                                                                  child: Text(
                                                                    '+12',
                                                                    style: TextStyle(
                                                                        color:
                                                                        Color(
                                                                            0xffE5646C),
                                                                        fontSize: 14),
                                                                  )),
                                                            ),
                                                          )),
                                                    ],
                                                  ),
                                                )
                                                    : const SizedBox(),
                                              ],
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 120,
                                  child: DottedBorder(
                                      color: const Color(0xffC6C8CB),
                                      padding: const EdgeInsets.all(12),
                                      radius: const Radius.circular(12),
                                      borderType: BorderType.RRect,
                                      child: Row(
                                        children: [
                                          Image.asset('assets/add.png',
                                              height: 16,
                                              color: const Color(
                                                  0xff727880)),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const Text(
                                            'Add Task',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontFamily:
                                                'InterRegular',
                                                color: Color(0xff727880),
                                                fontWeight:
                                                FontWeight.w600),
                                          )
                                        ],
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Backlogs',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'InterRegular',
                                  fontSize: 16, color: notifire.getblackcolor,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(12),
                                    color: notifire.getbgcolor11,
                                  ),
                                  child: const Text(
                                    '4',
                                    style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        fontSize: 12,
                                        color: Color(0xff727880)),
                                  )),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.all(15),
                            width: Get.width,
                            decoration: BoxDecoration(

                                color: notifire.getbgcolor11,
                                borderRadius: BorderRadius.circular(15)),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: constraints < 1400
                                        ? 1500
                                        : Get.width,
                                    child: Table(
                                      border: TableBorder.all(
                                          color: Colors.transparent),
                                      columnWidths: const <int,
                                          TableColumnWidth>{
                                        0: FixedColumnWidth(250),
                                        1: FixedColumnWidth(100),
                                        2: FixedColumnWidth(100),
                                        3: FixedColumnWidth(100),
                                        4: FixedColumnWidth(100),
                                        5: FixedColumnWidth(50),
                                        6: FixedColumnWidth(50),
                                        7: FixedColumnWidth(50),
                                        8: FixedColumnWidth(50),
                                      },
                                      children: <TableRow>[
                                        TableRow(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 25, left: 8),
                                              child: Text(
                                                'repeat predefined as necessary',
                                                style: TextStyle(
                                                    fontFamily:
                                                    'InterRegular',
                                                    fontWeight:
                                                    FontWeight.w500,
                                                    fontSize: 14,
                                                    color:
                                                    notifire.getblackcolor),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  top: 18, left: 3),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    padding:
                                                    const EdgeInsets
                                                        .all(6),
                                                    decoration:
                                                    BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          12),
                                                      color: const Color(
                                                          0xffEAF6FC),
                                                    ),
                                                    child: const Center(
                                                        child: Text(
                                                            'Research',
                                                            style:
                                                            TextStyle(
                                                              color: Color(
                                                                  0xff7DC066),
                                                              fontFamily:
                                                              'InterRegular',
                                                              fontSize:
                                                              12,
                                                            ))),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  top: 18, left: 3),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    padding:
                                                    const EdgeInsets
                                                        .all(6),
                                                    decoration:
                                                    BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          12),
                                                      color: notifire.Getgrey,
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Image.asset(
                                                            'assets/tag-right.png',
                                                            height: 16,
                                                            color: const Color(
                                                                0xffF3935D)),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        const Center(
                                                            child: Text(
                                                                '15 days left',
                                                                style:
                                                                TextStyle(
                                                                  color:
                                                                  Color(
                                                                      0xff727880),
                                                                  fontFamily:
                                                                  'InterRegular',
                                                                  fontSize:
                                                                  12,
                                                                ))),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  top: 25, left: 8),
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset(
                                                      'assets/Link.svg',
                                                      height: 16,
                                                      color: const Color(
                                                          0xffC6C8CB)),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  const Text(
                                                    '2',
                                                    style: TextStyle(
                                                        fontFamily:
                                                        'InterRegular',
                                                        fontSize: 14,
                                                        color: Color(
                                                            0xffC6C8CB),
                                                        fontWeight:
                                                        FontWeight
                                                            .w600),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  top: 25, left: 8),
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset(
                                                    'assets/messages-3.svg',
                                                    height: 16,
                                                    color: const Color(
                                                        0xffC6C8CB),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  const Text(
                                                    '6',
                                                    style: TextStyle(
                                                        fontFamily:
                                                        'InterRegular',
                                                        fontSize: 14,
                                                        color: Color(
                                                            0xffC6C8CB),
                                                        fontWeight:
                                                        FontWeight
                                                            .w600),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  left: 5, top: 18),
                                              child:
                                              Transform.translate(
                                                offset:
                                                const Offset(0, 0),
                                                child: Stack(
                                                  clipBehavior:
                                                  Clip.none,
                                                  children: [
                                                    Transform.translate(
                                                      offset:
                                                      const Offset(
                                                          -30, 0),
                                                      child: Container(
                                                        width: 32,
                                                        height: 32,
                                                        decoration:
                                                        BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              15),
                                                        ),
                                                        child: Center(
                                                            child: Image
                                                                .asset(
                                                                'assets/avatar-6 1.png')),
                                                      ),
                                                    ),
                                                    Positioned(
                                                        left: -10,
                                                        child: Transform
                                                            .translate(
                                                          offset:
                                                          const Offset(
                                                              5, 0),
                                                          child:
                                                          Container(
                                                            width: 32,
                                                            height: 32,
                                                            decoration:
                                                            BoxDecoration(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  15),
                                                            ),
                                                            child: Center(
                                                                child: Image
                                                                    .asset(
                                                                    'assets/avatar-7 1.png')),
                                                          ),
                                                        )),
                                                    Positioned(
                                                        left: 5,
                                                        child: Transform
                                                            .translate(
                                                          offset:
                                                          const Offset(
                                                              15,
                                                              0),
                                                          child:
                                                          Container(
                                                            width: 32,
                                                            height: 32,
                                                            decoration:
                                                            BoxDecoration(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  15),
                                                            ),
                                                            child: Center(
                                                                child: Image
                                                                    .asset(
                                                                    'assets/avatar-8 1.png')),
                                                          ),
                                                        )),
                                                    Positioned(
                                                        child: Transform
                                                            .translate(
                                                          offset:
                                                          const Offset(
                                                              45, 0),
                                                          child: Container(
                                                            width: 32,
                                                            height: 32,
                                                            decoration:
                                                            BoxDecoration(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  15),
                                                              color: const Color(
                                                                  0xffEEEEEE),
                                                            ),
                                                            child:
                                                            const Center(
                                                                child:
                                                                Text(
                                                                  '+5',
                                                                  style: TextStyle(
                                                                      color: Color(
                                                                          0xffE5646C),
                                                                      fontSize:
                                                                      14),
                                                                )),
                                                          ),
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  top: 25, left: 8),
                                              child: Image.asset(
                                                'assets/star2.png',
                                                height: 16,
                                                color: const Color(
                                                    0xff9DA2A7),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  top: 25, left: 8),
                                              child: Image.asset(
                                                'assets/profile-add.png',
                                                height: 16,
                                              ),
                                            ),
                                            Padding(
                                                padding:
                                                const EdgeInsets
                                                    .only(
                                                    top: 25,
                                                    left: 8),
                                                child: Image.asset(
                                                  'assets/more.png',
                                                  height: 16,
                                                  color: const Color(
                                                      0xff9DA2A7),
                                                )),
                                          ],
                                        ),
                                        TableRow(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 25, left: 8),
                                              child: Text(
                                                'Various versions have evolved over',
                                                style: TextStyle(
                                                    fontFamily:
                                                    'InterRegular',
                                                    fontWeight:
                                                    FontWeight.w500,
                                                    fontSize: 14,
                                                    color:
                                                    notifire.getblackcolor),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  top: 18, left: 3),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    padding:
                                                    const EdgeInsets
                                                        .all(6),
                                                    decoration:
                                                    BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          12),
                                                      color: const Color(
                                                          0xffEAF6FC),
                                                    ),
                                                    child: const Center(
                                                        child: Text(
                                                            'New Feature',
                                                            style:
                                                            TextStyle(
                                                              color: Color(
                                                                  0xff59B4D1),
                                                              fontFamily:
                                                              'InterRegular',
                                                              fontSize:
                                                              12,
                                                            ))),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  top: 18, left: 3),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    padding:
                                                    const EdgeInsets
                                                        .all(6),
                                                    decoration:
                                                    BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          12),
                                                      color: notifire.Getgrey,
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Image.asset(
                                                            'assets/tag-right.png',
                                                            height: 16,
                                                            color: const Color(
                                                                0xff7DC066)),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        const Center(
                                                            child: Text(
                                                                '21 days left',
                                                                style:
                                                                TextStyle(
                                                                  color:
                                                                  Color(
                                                                      0xff727880),
                                                                  fontFamily:
                                                                  'InterRegular',
                                                                  fontSize:
                                                                  12,
                                                                ))),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  top: 25, left: 8),
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset(
                                                      'assets/Link.svg',
                                                      height: 16,
                                                      color: const Color(
                                                          0xffC6C8CB)),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  const Text(
                                                    '6',
                                                    style: TextStyle(
                                                        fontFamily:
                                                        'InterRegular',
                                                        fontSize: 14,
                                                        color: Color(
                                                            0xffC6C8CB),
                                                        fontWeight:
                                                        FontWeight
                                                            .w600),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  top: 25, left: 8),
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset(
                                                    'assets/messages-3.svg',
                                                    height: 16,
                                                    color: const Color(
                                                        0xffC6C8CB),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  const Text(
                                                    '2',
                                                    style: TextStyle(
                                                        fontFamily:
                                                        'InterRegular',
                                                        fontSize: 14,
                                                        color: Color(
                                                            0xffC6C8CB),
                                                        fontWeight:
                                                        FontWeight
                                                            .w600),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  left: 5, top: 18),
                                              child:
                                              Transform.translate(
                                                offset: const Offset(
                                                    -50, 0),
                                                child: Stack(
                                                  clipBehavior:
                                                  Clip.none,
                                                  children: [
                                                    Positioned(
                                                        left: 5,
                                                        child: Transform
                                                            .translate(
                                                          offset:
                                                          const Offset(
                                                              15,
                                                              0),
                                                          child:
                                                          Container(
                                                            width: 32,
                                                            height: 32,
                                                            decoration:
                                                            BoxDecoration(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  15),
                                                            ),
                                                            child: Center(
                                                                child: Image
                                                                    .asset(
                                                                    'assets/avatar-8 1.png')),
                                                          ),
                                                        )),
                                                    Positioned(
                                                        child: Transform
                                                            .translate(
                                                          offset:
                                                          const Offset(
                                                              45, 0),
                                                          child: Container(
                                                            width: 32,
                                                            height: 32,
                                                            decoration:
                                                            BoxDecoration(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  15),
                                                              color: const Color(
                                                                  0xffEEEEEE),
                                                            ),
                                                            child:
                                                            const Center(
                                                                child:
                                                                Text(
                                                                  '+16',
                                                                  style: TextStyle(
                                                                      color: Color(
                                                                          0xffE5646C),
                                                                      fontSize:
                                                                      14),
                                                                )),
                                                          ),
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  top: 25, left: 8),
                                              child: Image.asset(
                                                'assets/star2.png',
                                                height: 16,
                                                color: const Color(
                                                    0xff9DA2A7),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  top: 25, left: 8),
                                              child: Image.asset(
                                                'assets/profile-add.png',
                                                height: 16,
                                              ),
                                            ),
                                            Padding(
                                                padding:
                                                const EdgeInsets
                                                    .only(
                                                    top: 25,
                                                    left: 8),
                                                child: Image.asset(
                                                  'assets/more.png',
                                                  height: 16,
                                                  color: const Color(
                                                      0xff9DA2A7),
                                                )),
                                          ],
                                        ),
                                        TableRow(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 25, left: 8),
                                              child: Text(
                                                'repeat predefined as necessary',
                                                style: TextStyle(
                                                    fontFamily:
                                                    'InterRegular',
                                                    fontWeight:
                                                    FontWeight.w500,
                                                    fontSize: 14,
                                                    color:
                                                    notifire.getblackcolor),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  top: 18, left: 3),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    padding:
                                                    const EdgeInsets
                                                        .all(6),
                                                    decoration:
                                                    BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          12),
                                                      color: const Color(
                                                          0xffEAF6FC),
                                                    ),
                                                    child: const Center(
                                                        child: Text(
                                                            'Research',
                                                            style:
                                                            TextStyle(
                                                              color: Color(
                                                                  0xff7DC066),
                                                              fontFamily:
                                                              'InterRegular',
                                                              fontSize:
                                                              12,
                                                            ))),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  top: 18, left: 3),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    padding:
                                                    const EdgeInsets
                                                        .all(6),
                                                    decoration:
                                                    BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          12),
                                                      color: notifire.Getgrey,
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Image.asset(
                                                            'assets/tag-right.png',
                                                            height: 16,
                                                            color: const Color(
                                                                0xffF3935D)),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        const Center(
                                                            child: Text(
                                                                '15 days left',
                                                                style:
                                                                TextStyle(
                                                                  color:
                                                                  Color(
                                                                      0xff727880),
                                                                  fontFamily:
                                                                  'InterRegular',
                                                                  fontSize:
                                                                  12,
                                                                ))),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  top: 25, left: 8),
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset(
                                                      'assets/Link.svg',
                                                      height: 16,
                                                      color: const Color(
                                                          0xffC6C8CB)),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  const Text(
                                                    '2',
                                                    style: TextStyle(
                                                        fontFamily:
                                                        'InterRegular',
                                                        fontSize: 14,
                                                        color: Color(
                                                            0xffC6C8CB),
                                                        fontWeight:
                                                        FontWeight
                                                            .w600),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  top: 25, left: 8),
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset(
                                                    'assets/messages-3.svg',
                                                    height: 16,
                                                    color: const Color(
                                                        0xffC6C8CB),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  const Text(
                                                    '6',
                                                    style: TextStyle(
                                                        fontFamily:
                                                        'InterRegular',
                                                        fontSize: 14,
                                                        color: Color(
                                                            0xffC6C8CB),
                                                        fontWeight:
                                                        FontWeight
                                                            .w600),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  left: 5, top: 18),
                                              child:
                                              Transform.translate(
                                                offset:
                                                const Offset(0, 0),
                                                child: Stack(
                                                  clipBehavior:
                                                  Clip.none,
                                                  children: [
                                                    Transform.translate(
                                                      offset:
                                                      const Offset(
                                                          -30, 0),
                                                      child: Container(
                                                        width: 32,
                                                        height: 32,
                                                        decoration:
                                                        BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              15),
                                                        ),
                                                        child: Center(
                                                            child: Image
                                                                .asset(
                                                                'assets/avatar-6 1.png')),
                                                      ),
                                                    ),
                                                    Positioned(
                                                        left: -10,
                                                        child: Transform
                                                            .translate(
                                                          offset:
                                                          const Offset(
                                                              5, 0),
                                                          child:
                                                          Container(
                                                            width: 32,
                                                            height: 32,
                                                            decoration:
                                                            BoxDecoration(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  15),
                                                            ),
                                                            child: Center(
                                                                child: Image
                                                                    .asset(
                                                                    'assets/avatar-7 1.png')),
                                                          ),
                                                        )),
                                                    Positioned(
                                                        left: 5,
                                                        child: Transform
                                                            .translate(
                                                          offset:
                                                          const Offset(
                                                              15,
                                                              0),
                                                          child:
                                                          Container(
                                                            width: 32,
                                                            height: 32,
                                                            decoration:
                                                            BoxDecoration(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  15),
                                                            ),
                                                            child: Center(
                                                                child: Image
                                                                    .asset(
                                                                    'assets/avatar-8 1.png')),
                                                          ),
                                                        )),
                                                    Positioned(
                                                        child: Transform
                                                            .translate(
                                                          offset:
                                                          const Offset(
                                                              45, 0),
                                                          child: Container(
                                                            width: 32,
                                                            height: 32,
                                                            decoration:
                                                            BoxDecoration(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  15),
                                                              color: const Color(
                                                                  0xffEEEEEE),
                                                            ),
                                                            child:
                                                            const Center(
                                                                child:
                                                                Text(
                                                                  '+5',
                                                                  style: TextStyle(
                                                                      color: Color(
                                                                          0xffE5646C),
                                                                      fontSize:
                                                                      14),
                                                                )),
                                                          ),
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  top: 25, left: 8),
                                              child: Image.asset(
                                                'assets/star2.png',
                                                height: 16,
                                                color: const Color(
                                                    0xff9DA2A7),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  top: 25, left: 8),
                                              child: Image.asset(
                                                'assets/profile-add.png',
                                                height: 16,
                                              ),
                                            ),
                                            Padding(
                                                padding:
                                                const EdgeInsets
                                                    .only(
                                                    top: 25,
                                                    left: 8),
                                                child: Image.asset(
                                                  'assets/more.png',
                                                  height: 16,
                                                  color: const Color(
                                                      0xff9DA2A7),
                                                )),
                                          ],
                                        ),
                                        for (int a = 0;
                                        a < dataa.length;
                                        a++)
                                          TableRow(
                                            children: <Widget>[
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    top: 25,
                                                    left: 8),
                                                child: Text(
                                                  'Various versions have evolved over',
                                                  style: TextStyle(
                                                      fontFamily:
                                                      'InterRegular',
                                                      fontWeight:
                                                      FontWeight
                                                          .w500,
                                                      fontSize: 14,
                                                      color:
                                                      notifire.getblackcolor),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets
                                                    .only(
                                                    top: 18,
                                                    left: 3),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      padding:
                                                      const EdgeInsets
                                                          .all(6),
                                                      decoration:
                                                      BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            12),
                                                        color: const Color(
                                                            0xffFAEBEC),
                                                      ),
                                                      child:
                                                      const Center(
                                                          child: Text(
                                                              'Fix Bugs',
                                                              style:
                                                              TextStyle(
                                                                color:
                                                                Color(
                                                                    0xffE5646C),
                                                                fontFamily:
                                                                'InterRegular',
                                                                fontSize:
                                                                12,
                                                              ))),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets
                                                    .only(
                                                    top: 18,
                                                    left: 3),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      padding:
                                                      const EdgeInsets
                                                          .all(6),
                                                      decoration:
                                                      BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            12),
                                                        color: notifire.Getgrey,
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          Image.asset(
                                                              'assets/tag-right.png',
                                                              height:
                                                              16,
                                                              color: const Color(
                                                                  0xff7DC066)),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          const Center(
                                                              child: Text(
                                                                  '21 days left',
                                                                  style:
                                                                  TextStyle(
                                                                    color:
                                                                    Color(
                                                                        0xff727880),
                                                                    fontFamily:
                                                                    'InterRegular',
                                                                    fontSize:
                                                                    12,
                                                                  ))),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets
                                                    .only(
                                                    top: 25,
                                                    left: 8),
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                        'assets/Link.svg',
                                                        height: 16,
                                                        color: const Color(
                                                            0xffC6C8CB)),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    const Text(
                                                      '6',
                                                      style: TextStyle(
                                                          fontFamily:
                                                          'InterRegular',
                                                          fontSize: 14,
                                                          color: Color(
                                                              0xffC6C8CB),
                                                          fontWeight:
                                                          FontWeight
                                                              .w600),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets
                                                    .only(
                                                    top: 25,
                                                    left: 8),
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/messages-3.svg',
                                                      height: 16,
                                                      color: const Color(
                                                          0xffC6C8CB),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    const Text(
                                                      '2',
                                                      style: TextStyle(
                                                          fontFamily:
                                                          'InterRegular',
                                                          fontSize: 14,
                                                          color: Color(
                                                              0xffC6C8CB),
                                                          fontWeight:
                                                          FontWeight
                                                              .w600),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets
                                                    .only(
                                                    left: 5,
                                                    top: 18),
                                                child:
                                                Transform.translate(
                                                  offset: const Offset(
                                                      -50, 0),
                                                  child: Stack(
                                                    clipBehavior:
                                                    Clip.none,
                                                    children: [
                                                      Positioned(
                                                          left: 5,
                                                          child: Transform
                                                              .translate(
                                                            offset:
                                                            const Offset(
                                                                15,
                                                                0),
                                                            child:
                                                            Container(
                                                              width: 32,
                                                              height:
                                                              32,
                                                              decoration:
                                                              BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    15),
                                                              ),
                                                              child: Center(
                                                                  child:
                                                                  Image.asset(
                                                                      'assets/avatar-8 1.png')),
                                                            ),
                                                          )),
                                                      Positioned(
                                                          child: Transform
                                                              .translate(
                                                            offset:
                                                            const Offset(
                                                                45, 0),
                                                            child:
                                                            Container(
                                                              width: 32,
                                                              height: 32,
                                                              decoration:
                                                              BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    15),
                                                                color: const Color(
                                                                    0xffEEEEEE),
                                                              ),
                                                              child:
                                                              const Center(
                                                                  child:
                                                                  Text(
                                                                    '+8',
                                                                    style: TextStyle(
                                                                        color: Color(
                                                                            0xffE5646C),
                                                                        fontSize:
                                                                        14),
                                                                  )),
                                                            ),
                                                          )),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets
                                                    .only(
                                                    top: 25,
                                                    left: 8),
                                                child: Image.asset(
                                                  'assets/star2.png',
                                                  height: 16,
                                                  color: const Color(
                                                      0xff9DA2A7),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets
                                                    .only(
                                                    top: 25,
                                                    left: 8),
                                                child: Image.asset(
                                                  'assets/profile-add.png',
                                                  height: 16,
                                                ),
                                              ),
                                              Padding(
                                                  padding:
                                                  const EdgeInsets
                                                      .only(
                                                      top: 25,
                                                      left: 8),
                                                  child: Image.asset(
                                                    'assets/more.png',
                                                    height: 16,
                                                    color: const Color(
                                                        0xff9DA2A7),
                                                  )),
                                            ],
                                          ),
                                        const TableRow(children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 10),
                                            child: Divider(
                                              height: 10,
                                              color: Colors.transparent,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 10),
                                            child: Divider(
                                              height: 10,
                                              color: Colors.transparent,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 10),
                                            child: Divider(
                                              height: 10,
                                              color: Colors.transparent,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 10),
                                            child: Divider(
                                              height: 10,
                                              color: Colors.transparent,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 10),
                                            child: Divider(
                                              height: 10,
                                              color: Colors.transparent,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 10),
                                            child: Divider(
                                              height: 10,
                                              color: Colors.transparent,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 10),
                                            child: Divider(
                                              height: 10,
                                              color: Colors.transparent,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 10),
                                            child: Divider(
                                              height: 10,
                                              color: Colors.transparent,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 10),
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
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              dataa.add(0);
                              setState(() {});
                            },
                            child: Container(
                              decoration: BoxDecoration(

                                  color: notifire.getbgcolor11,
                                  borderRadius: BorderRadius.circular(15)),
                              child: DottedBorder(
                                  borderType: BorderType.RRect,
                                  radius: const Radius.circular(12),
                                  color: const Color(0xffC6C8CB),
                                  padding: const EdgeInsets.all(12),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/add.png',
                                        height: 16,
                                        color: const Color(0xff727880),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Text(
                                        'Add Task',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'InterRegular',
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xff727880)),
                                      )
                                    ],
                                  )),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Text(
                                'In Work',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'InterRegular',
                                    fontSize: 16, color: notifire.getblackcolor
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(12),
                                    color: notifire.getbgcolor11,
                                  ),
                                  child: const Text(
                                    '4',
                                    style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        fontSize: 12,
                                        color: Color(0xff727880)),
                                  )),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.all(15),
                            width: Get.width,
                            decoration: BoxDecoration(
                                color: notifire.getbgcolor11,
                                borderRadius: BorderRadius.circular(15)),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: constraints < 1400
                                        ? 1500
                                        : Get.width,
                                    child: Table(
                                      border: TableBorder.all(
                                          color: Colors.transparent),
                                      columnWidths: const <int,
                                          TableColumnWidth>{
                                        0: FixedColumnWidth(250),
                                        1: FixedColumnWidth(100),
                                        2: FixedColumnWidth(100),
                                        3: FixedColumnWidth(100),
                                        4: FixedColumnWidth(100),
                                        5: FixedColumnWidth(50),
                                        6: FixedColumnWidth(50),
                                        7: FixedColumnWidth(50),
                                        8: FixedColumnWidth(50),
                                      },
                                      children: <TableRow>[
                                        TableRow(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 25, left: 8),
                                              child: Text(
                                                'repeat predefined as necessary',
                                                style: TextStyle(
                                                    fontFamily:
                                                    'InterRegular',
                                                    fontWeight:
                                                    FontWeight.w500,
                                                    fontSize: 14,
                                                    color:
                                                    notifire.getblackcolor),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  top: 18, left: 3),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    padding:
                                                    const EdgeInsets
                                                        .all(6),
                                                    decoration:
                                                    BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          12),
                                                      color: const Color(
                                                          0xffEAF6FC),
                                                    ),
                                                    child: const Center(
                                                        child: Text(
                                                            'Research',
                                                            style:
                                                            TextStyle(
                                                              color: Color(
                                                                  0xff7DC066),
                                                              fontFamily:
                                                              'InterRegular',
                                                              fontSize:
                                                              12,
                                                            ))),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  top: 18, left: 3),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    padding:
                                                    const EdgeInsets
                                                        .all(6),
                                                    decoration:
                                                    BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          12),
                                                      color: notifire.Getgrey,
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Image.asset(
                                                            'assets/tag-right.png',
                                                            height: 16,
                                                            color: const Color(
                                                                0xffF3935D)),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        const Center(
                                                            child: Text(
                                                                '15 days left',
                                                                style:
                                                                TextStyle(
                                                                  color:
                                                                  Color(
                                                                      0xff727880),
                                                                  fontFamily:
                                                                  'InterRegular',
                                                                  fontSize:
                                                                  12,
                                                                ))),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  top: 25, left: 8),
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset(
                                                      'assets/Link.svg',
                                                      height: 16,
                                                      color: const Color(
                                                          0xffC6C8CB)),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  const Text(
                                                    '2',
                                                    style: TextStyle(
                                                        fontFamily:
                                                        'InterRegular',
                                                        fontSize: 14,
                                                        color: Color(
                                                            0xffC6C8CB),
                                                        fontWeight:
                                                        FontWeight
                                                            .w600),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  top: 25, left: 8),
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset(
                                                    'assets/messages-3.svg',
                                                    height: 16,
                                                    color: const Color(
                                                        0xffC6C8CB),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  const Text(
                                                    '6',
                                                    style: TextStyle(
                                                        fontFamily:
                                                        'InterRegular',
                                                        fontSize: 14,
                                                        color: Color(
                                                            0xffC6C8CB),
                                                        fontWeight:
                                                        FontWeight
                                                            .w600),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  left: 5, top: 18),
                                              child:
                                              Transform.translate(
                                                offset:
                                                const Offset(0, 0),
                                                child: Stack(
                                                  clipBehavior:
                                                  Clip.none,
                                                  children: [
                                                    Transform.translate(
                                                      offset:
                                                      const Offset(
                                                          -30, 0),
                                                      child: Container(
                                                        width: 32,
                                                        height: 32,
                                                        decoration:
                                                        BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              15),
                                                        ),
                                                        child: Center(
                                                            child: Image
                                                                .asset(
                                                                'assets/avatar-6 1.png')),
                                                      ),
                                                    ),
                                                    Positioned(
                                                        left: -10,
                                                        child: Transform
                                                            .translate(
                                                          offset:
                                                          const Offset(
                                                              5, 0),
                                                          child:
                                                          Container(
                                                            width: 32,
                                                            height: 32,
                                                            decoration:
                                                            BoxDecoration(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  15),
                                                            ),
                                                            child: Center(
                                                                child: Image
                                                                    .asset(
                                                                    'assets/avatar-7 1.png')),
                                                          ),
                                                        )),
                                                    Positioned(
                                                        left: 5,
                                                        child: Transform
                                                            .translate(
                                                          offset:
                                                          const Offset(
                                                              15,
                                                              0),
                                                          child:
                                                          Container(
                                                            width: 32,
                                                            height: 32,
                                                            decoration:
                                                            BoxDecoration(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  15),
                                                            ),
                                                            child: Center(
                                                                child: Image
                                                                    .asset(
                                                                    'assets/avatar-8 1.png')),
                                                          ),
                                                        )),
                                                    Positioned(
                                                        child: Transform
                                                            .translate(
                                                          offset:
                                                          const Offset(
                                                              45, 0),
                                                          child: Container(
                                                            width: 32,
                                                            height: 32,
                                                            decoration:
                                                            BoxDecoration(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  15),
                                                              color: const Color(
                                                                  0xffEEEEEE),
                                                            ),
                                                            child:
                                                            const Center(
                                                                child:
                                                                Text(
                                                                  '+5',
                                                                  style: TextStyle(
                                                                      color: Color(
                                                                          0xffE5646C),
                                                                      fontSize:
                                                                      14),
                                                                )),
                                                          ),
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  top: 25, left: 8),
                                              child: Image.asset(
                                                'assets/star2.png',
                                                height: 16,
                                                color: const Color(
                                                    0xff9DA2A7),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  top: 25, left: 8),
                                              child: Image.asset(
                                                'assets/profile-add.png',
                                                height: 16,
                                              ),
                                            ),
                                            Padding(
                                                padding:
                                                const EdgeInsets
                                                    .only(
                                                    top: 25,
                                                    left: 8),
                                                child: Image.asset(
                                                  'assets/more.png',
                                                  height: 16,
                                                  color: const Color(
                                                      0xff9DA2A7),
                                                )),
                                          ],
                                        ),
                                        TableRow(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 25, left: 8),
                                              child: Text(
                                                'Various versions have evolved over',
                                                style: TextStyle(
                                                    fontFamily:
                                                    'InterRegular',
                                                    fontWeight:
                                                    FontWeight.w500,
                                                    fontSize: 14,
                                                    color:
                                                    notifire.getblackcolor),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  top: 18, left: 3),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    padding:
                                                    const EdgeInsets
                                                        .all(6),
                                                    decoration:
                                                    BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          12),
                                                      color: const Color(
                                                          0xffEAF6FC),
                                                    ),
                                                    child: const Center(
                                                        child: Text(
                                                            'New Feature',
                                                            style:
                                                            TextStyle(
                                                              color: Color(
                                                                  0xff59B4D1),
                                                              fontFamily:
                                                              'InterRegular',
                                                              fontSize:
                                                              12,
                                                            ))),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  top: 18, left: 3),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    padding:
                                                    const EdgeInsets
                                                        .all(6),
                                                    decoration:
                                                    BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          12),
                                                      color: notifire.Getgrey,
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Image.asset(
                                                            'assets/tag-right.png',
                                                            height: 16,
                                                            color: const Color(
                                                                0xff7DC066)),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        const Center(
                                                            child: Text(
                                                                '21 days left',
                                                                style:
                                                                TextStyle(
                                                                  color:
                                                                  Color(
                                                                      0xff727880),
                                                                  fontFamily:
                                                                  'InterRegular',
                                                                  fontSize:
                                                                  12,
                                                                ))),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  top: 25, left: 8),
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset(
                                                      'assets/Link.svg',
                                                      height: 16,
                                                      color: const Color(
                                                          0xffC6C8CB)),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  const Text(
                                                    '6',
                                                    style: TextStyle(
                                                        fontFamily:
                                                        'InterRegular',
                                                        fontSize: 14,
                                                        color: Color(
                                                            0xffC6C8CB),
                                                        fontWeight:
                                                        FontWeight
                                                            .w600),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  top: 25, left: 8),
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset(
                                                    'assets/messages-3.svg',
                                                    height: 16,
                                                    color: const Color(
                                                        0xffC6C8CB),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  const Text(
                                                    '2',
                                                    style: TextStyle(
                                                        fontFamily:
                                                        'InterRegular',
                                                        fontSize: 14,
                                                        color: Color(
                                                            0xffC6C8CB),
                                                        fontWeight:
                                                        FontWeight
                                                            .w600),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  left: 5, top: 18),
                                              child:
                                              Transform.translate(
                                                offset: const Offset(
                                                    -50, 0),
                                                child: Stack(
                                                  clipBehavior:
                                                  Clip.none,
                                                  children: [
                                                    Positioned(
                                                        left: 5,
                                                        child: Transform
                                                            .translate(
                                                          offset:
                                                          const Offset(
                                                              15,
                                                              0),
                                                          child:
                                                          Container(
                                                            width: 32,
                                                            height: 32,
                                                            decoration:
                                                            BoxDecoration(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  15),
                                                            ),
                                                            child: Center(
                                                                child: Image
                                                                    .asset(
                                                                    'assets/avatar-8 1.png')),
                                                          ),
                                                        )),
                                                    Positioned(
                                                        child: Transform
                                                            .translate(
                                                          offset:
                                                          const Offset(
                                                              45, 0),
                                                          child: Container(
                                                            width: 32,
                                                            height: 32,
                                                            decoration:
                                                            BoxDecoration(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  15),
                                                              color: const Color(
                                                                  0xffEEEEEE),
                                                            ),
                                                            child:
                                                            const Center(
                                                                child:
                                                                Text(
                                                                  '+16',
                                                                  style: TextStyle(
                                                                      color: Color(
                                                                          0xffE5646C),
                                                                      fontSize:
                                                                      14),
                                                                )),
                                                          ),
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  top: 25, left: 8),
                                              child: Image.asset(
                                                'assets/star2.png',
                                                height: 16,
                                                color: const Color(
                                                    0xff9DA2A7),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  top: 25, left: 8),
                                              child: Image.asset(
                                                'assets/profile-add.png',
                                                height: 16,
                                              ),
                                            ),
                                            Padding(
                                                padding:
                                                const EdgeInsets
                                                    .only(
                                                    top: 25,
                                                    left: 8),
                                                child: Image.asset(
                                                  'assets/more.png',
                                                  height: 16,
                                                  color: const Color(
                                                      0xff9DA2A7),
                                                )),
                                          ],
                                        ),
                                        for (int a = 0;
                                        a < dataa1.length;
                                        a++)
                                          TableRow(
                                            children: <Widget>[
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    top: 25,
                                                    left: 8),
                                                child: Text(
                                                  'Various versions have evolved over',
                                                  style: TextStyle(
                                                      fontFamily:
                                                      'InterRegular',
                                                      fontWeight:
                                                      FontWeight
                                                          .w500,
                                                      fontSize: 14,
                                                      color:
                                                      notifire.getblackcolor),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets
                                                    .only(
                                                    top: 18,
                                                    left: 3),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      padding:
                                                      const EdgeInsets
                                                          .all(6),
                                                      decoration:
                                                      BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            12),
                                                        color: const Color(
                                                            0xffFAEBEC),
                                                      ),
                                                      child:
                                                      const Center(
                                                          child: Text(
                                                              'Fix Bugs',
                                                              style:
                                                              TextStyle(
                                                                color:
                                                                Color(
                                                                    0xffE5646C),
                                                                fontFamily:
                                                                'InterRegular',
                                                                fontSize:
                                                                12,
                                                              ))),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets
                                                    .only(
                                                    top: 18,
                                                    left: 3),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      padding:
                                                      const EdgeInsets
                                                          .all(6),
                                                      decoration:
                                                      BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            12),
                                                        color: notifire.Getgrey,
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          Image.asset(
                                                              'assets/tag-right.png',
                                                              height:
                                                              16,
                                                              color: const Color(
                                                                  0xff7DC066)),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          const Center(
                                                              child: Text(
                                                                  '21 days left',
                                                                  style:
                                                                  TextStyle(
                                                                    color:
                                                                    Color(
                                                                        0xff727880),
                                                                    fontFamily:
                                                                    'InterRegular',
                                                                    fontSize:
                                                                    12,
                                                                  ))),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets
                                                    .only(
                                                    top: 25,
                                                    left: 8),
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                        'assets/Link.svg',
                                                        height: 16,
                                                        color: const Color(
                                                            0xffC6C8CB)),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    const Text(
                                                      '6',
                                                      style: TextStyle(
                                                          fontFamily:
                                                          'InterRegular',
                                                          fontSize: 14,
                                                          color: Color(
                                                              0xffC6C8CB),
                                                          fontWeight:
                                                          FontWeight
                                                              .w600),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets
                                                    .only(
                                                    top: 25,
                                                    left: 8),
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/messages-3.svg',
                                                      height: 16,
                                                      color: const Color(
                                                          0xffC6C8CB),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    const Text(
                                                      '2',
                                                      style: TextStyle(
                                                          fontFamily:
                                                          'InterRegular',
                                                          fontSize: 14,
                                                          color: Color(
                                                              0xffC6C8CB),
                                                          fontWeight:
                                                          FontWeight
                                                              .w600),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets
                                                    .only(
                                                    left: 5,
                                                    top: 18),
                                                child:
                                                Transform.translate(
                                                  offset: const Offset(
                                                      -50, 0),
                                                  child: Stack(
                                                    clipBehavior:
                                                    Clip.none,
                                                    children: [
                                                      Positioned(
                                                          left: 5,
                                                          child: Transform
                                                              .translate(
                                                            offset:
                                                            const Offset(
                                                                15,
                                                                0),
                                                            child:
                                                            Container(
                                                              width: 32,
                                                              height:
                                                              32,
                                                              decoration:
                                                              BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    15),
                                                              ),
                                                              child: Center(
                                                                  child:
                                                                  Image.asset(
                                                                      'assets/avatar-8 1.png')),
                                                            ),
                                                          )),
                                                      Positioned(
                                                          child: Transform
                                                              .translate(
                                                            offset:
                                                            const Offset(
                                                                45, 0),
                                                            child:
                                                            Container(
                                                              width: 32,
                                                              height: 32,
                                                              decoration:
                                                              BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    15),
                                                                color: const Color(
                                                                    0xffEEEEEE),
                                                              ),
                                                              child:
                                                              const Center(
                                                                  child:
                                                                  Text(
                                                                    '+8',
                                                                    style: TextStyle(
                                                                        color: Color(
                                                                            0xffE5646C),
                                                                        fontSize:
                                                                        14),
                                                                  )),
                                                            ),
                                                          )),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets
                                                    .only(
                                                    top: 25,
                                                    left: 8),
                                                child: Image.asset(
                                                  'assets/star2.png',
                                                  height: 16,
                                                  color: const Color(
                                                      0xff9DA2A7),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets
                                                    .only(
                                                    top: 25,
                                                    left: 8),
                                                child: Image.asset(
                                                  'assets/profile-add.png',
                                                  height: 16,
                                                ),
                                              ),
                                              Padding(
                                                  padding:
                                                  const EdgeInsets
                                                      .only(
                                                      top: 25,
                                                      left: 8),
                                                  child: Image.asset(
                                                    'assets/more.png',
                                                    height: 16,
                                                    color: const Color(
                                                        0xff9DA2A7),
                                                  )),
                                            ],
                                          ),
                                        const TableRow(children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 10),
                                            child: Divider(
                                              height: 10,
                                              color: Colors.transparent,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 10),
                                            child: Divider(
                                              height: 10,
                                              color: Colors.transparent,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 10),
                                            child: Divider(
                                              height: 10,
                                              color: Colors.transparent,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 10),
                                            child: Divider(
                                              height: 10,
                                              color: Colors.transparent,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 10),
                                            child: Divider(
                                              height: 10,
                                              color: Colors.transparent,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 10),
                                            child: Divider(
                                              height: 10,
                                              color: Colors.transparent,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 10),
                                            child: Divider(
                                              height: 10,
                                              color: Colors.transparent,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 10),
                                            child: Divider(
                                              height: 10,
                                              color: Colors.transparent,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 10),
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
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              dataa1.add(0);
                              setState(() {});
                            },
                            child: Container(
                              decoration: BoxDecoration(

                                  color: notifire.getbgcolor11,
                                  borderRadius: BorderRadius.circular(15)),
                              child: DottedBorder(
                                  borderType: BorderType.RRect,
                                  radius: const Radius.circular(12),
                                  color: const Color(0xffC6C8CB),
                                  padding: const EdgeInsets.all(12),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/add.png',
                                        height: 16,
                                        color: const Color(0xff727880),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Text(
                                        'Add Task',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'InterRegular',
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xff727880)),
                                      )
                                    ],
                                  )),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Text(
                                'Q & A',
                                style: TextStyle(color: notifire.getblackcolor,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'InterRegular',
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(12),
                                    color: notifire.getbgcolor11,
                                  ),
                                  child: const Text(
                                    '4',
                                    style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        fontSize: 12,
                                        color: Color(0xff727880)),
                                  )),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.all(15),
                            width: Get.width,
                            decoration: BoxDecoration(

                                color: notifire.getbgcolor11,
                                borderRadius: BorderRadius.circular(15)),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: constraints < 1400
                                        ? 1500
                                        : Get.width,
                                    child: Table(
                                      border: TableBorder.all(
                                          color: Colors.transparent),
                                      columnWidths: const <int,
                                          TableColumnWidth>{
                                        0: FixedColumnWidth(250),
                                        1: FixedColumnWidth(100),
                                        2: FixedColumnWidth(100),
                                        3: FixedColumnWidth(100),
                                        4: FixedColumnWidth(100),
                                        5: FixedColumnWidth(50),
                                        6: FixedColumnWidth(50),
                                        7: FixedColumnWidth(50),
                                        8: FixedColumnWidth(50),
                                      },
                                      children: <TableRow>[
                                        TableRow(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 25, left: 8),
                                              child: Text(
                                                'Various versions have evolved over',
                                                style: TextStyle(
                                                    fontFamily:
                                                    'InterRegular',
                                                    fontWeight:
                                                    FontWeight.w500,
                                                    fontSize: 14,
                                                    color:
                                                    notifire.getblackcolor),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  top: 18, left: 3),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    padding:
                                                    const EdgeInsets
                                                        .all(6),
                                                    decoration:
                                                    BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          12),
                                                      color: const Color(
                                                          0xffEAF6FC),
                                                    ),
                                                    child: const Center(
                                                        child: Text(
                                                            'New Feature',
                                                            style:
                                                            TextStyle(
                                                              color: Color(
                                                                  0xff59B4D1),
                                                              fontFamily:
                                                              'InterRegular',
                                                              fontSize:
                                                              12,
                                                            ))),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  top: 18, left: 3),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    padding:
                                                    const EdgeInsets
                                                        .all(6),
                                                    decoration:
                                                    BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          12),
                                                      color: notifire.Getgrey,
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Image.asset(
                                                            'assets/tag-right.png',
                                                            height: 16,
                                                            color: const Color(
                                                                0xff7DC066)),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        const Center(
                                                            child: Text(
                                                                '21 days left',
                                                                style:
                                                                TextStyle(
                                                                  color:
                                                                  Color(
                                                                      0xff727880),
                                                                  fontFamily:
                                                                  'InterRegular',
                                                                  fontSize:
                                                                  12,
                                                                ))),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  top: 25, left: 8),
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset(
                                                      'assets/Link.svg',
                                                      height: 16,
                                                      color: const Color(
                                                          0xffC6C8CB)),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  const Text(
                                                    '6',
                                                    style: TextStyle(
                                                        fontFamily:
                                                        'InterRegular',
                                                        fontSize: 14,
                                                        color: Color(
                                                            0xffC6C8CB),
                                                        fontWeight:
                                                        FontWeight
                                                            .w600),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  top: 25, left: 8),
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset(
                                                    'assets/messages-3.svg',
                                                    height: 16,
                                                    color: const Color(
                                                        0xffC6C8CB),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  const Text(
                                                    '2',
                                                    style: TextStyle(
                                                        fontFamily:
                                                        'InterRegular',
                                                        fontSize: 14,
                                                        color: Color(
                                                            0xffC6C8CB),
                                                        fontWeight:
                                                        FontWeight
                                                            .w600),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  left: 5, top: 18),
                                              child:
                                              Transform.translate(
                                                offset: const Offset(
                                                    -50, 0),
                                                child: Stack(
                                                  clipBehavior:
                                                  Clip.none,
                                                  children: [
                                                    Positioned(
                                                        left: 5,
                                                        child: Transform
                                                            .translate(
                                                          offset:
                                                          const Offset(
                                                              15,
                                                              0),
                                                          child:
                                                          Container(
                                                            width: 32,
                                                            height: 32,
                                                            decoration:
                                                            BoxDecoration(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  15),
                                                            ),
                                                            child: Center(
                                                                child: Image
                                                                    .asset(
                                                                    'assets/avatar-8 1.png')),
                                                          ),
                                                        )),
                                                    Positioned(
                                                        child: Transform
                                                            .translate(
                                                          offset:
                                                          const Offset(
                                                              45, 0),
                                                          child: Container(
                                                            width: 32,
                                                            height: 32,
                                                            decoration:
                                                            BoxDecoration(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  15),
                                                              color: const Color(
                                                                  0xffEEEEEE),
                                                            ),
                                                            child:
                                                            const Center(
                                                                child:
                                                                Text(
                                                                  '+16',
                                                                  style: TextStyle(
                                                                      color: Color(
                                                                          0xffE5646C),
                                                                      fontSize:
                                                                      14),
                                                                )),
                                                          ),
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  top: 25, left: 8),
                                              child: Image.asset(
                                                'assets/star2.png',
                                                height: 16,
                                                color: const Color(
                                                    0xff9DA2A7),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  top: 25, left: 8),
                                              child: Image.asset(
                                                'assets/profile-add.png',
                                                height: 16,
                                              ),
                                            ),
                                            Padding(
                                                padding:
                                                const EdgeInsets
                                                    .only(
                                                    top: 25,
                                                    left: 8),
                                                child: Image.asset(
                                                  'assets/more.png',
                                                  height: 16,
                                                  color: const Color(
                                                      0xff9DA2A7),
                                                )),
                                          ],
                                        ),
                                        TableRow(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 25, left: 8),
                                              child: Text(
                                                'Various versions have evolved over',
                                                style: TextStyle(
                                                  fontFamily:
                                                  'InterRegular',
                                                  fontWeight:
                                                  FontWeight.w500,
                                                  fontSize: 14,
                                                  color: notifire
                                                      .getblackcolor,),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  top: 18, left: 3),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    padding:
                                                    const EdgeInsets
                                                        .all(6),
                                                    decoration:
                                                    BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          12),
                                                      color: const Color(
                                                          0xffFAEBEC),
                                                    ),
                                                    child: const Center(
                                                        child: Text(
                                                            'Fix Bugs',
                                                            style:
                                                            TextStyle(
                                                              color: Color(
                                                                  0xffE5646C),
                                                              fontFamily:
                                                              'InterRegular',
                                                              fontSize:
                                                              12,
                                                            ))),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  top: 18, left: 3),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    padding:
                                                    const EdgeInsets
                                                        .all(6),
                                                    decoration:
                                                    BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          12),
                                                      color: notifire.Getgrey,
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Image.asset(
                                                            'assets/tag-right.png',
                                                            height: 16,
                                                            color: const Color(
                                                                0xff7DC066)),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        const Center(
                                                            child: Text(
                                                                '21 days left',
                                                                style:
                                                                TextStyle(
                                                                  color:
                                                                  Color(
                                                                      0xff727880),
                                                                  fontFamily:
                                                                  'InterRegular',
                                                                  fontSize:
                                                                  12,
                                                                ))),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  top: 25, left: 8),
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset(
                                                      'assets/Link.svg',
                                                      height: 16,
                                                      color: const Color(
                                                          0xffC6C8CB)),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  const Text(
                                                    '6',
                                                    style: TextStyle(
                                                        fontFamily:
                                                        'InterRegular',
                                                        fontSize: 14,
                                                        color: Color(
                                                            0xffC6C8CB),
                                                        fontWeight:
                                                        FontWeight
                                                            .w600),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  top: 25, left: 8),
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset(
                                                    'assets/messages-3.svg',
                                                    height: 16,
                                                    color: const Color(
                                                        0xffC6C8CB),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  const Text(
                                                    '2',
                                                    style: TextStyle(
                                                        fontFamily:
                                                        'InterRegular',
                                                        fontSize: 14,
                                                        color: Color(
                                                            0xffC6C8CB),
                                                        fontWeight:
                                                        FontWeight
                                                            .w600),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  left: 5, top: 18),
                                              child:
                                              Transform.translate(
                                                offset: const Offset(
                                                    -50, 0),
                                                child: Stack(
                                                  clipBehavior:
                                                  Clip.none,
                                                  children: [
                                                    Positioned(
                                                        left: 5,
                                                        child: Transform
                                                            .translate(
                                                          offset:
                                                          const Offset(
                                                              15,
                                                              0),
                                                          child:
                                                          Container(
                                                            width: 32,
                                                            height: 32,
                                                            decoration:
                                                            BoxDecoration(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  15),
                                                            ),
                                                            child: Center(
                                                                child: Image
                                                                    .asset(
                                                                    'assets/avatar-8 1.png')),
                                                          ),
                                                        )),
                                                    Positioned(
                                                        child: Transform
                                                            .translate(
                                                          offset:
                                                          const Offset(
                                                              45, 0),
                                                          child: Container(
                                                            width: 32,
                                                            height: 32,
                                                            decoration:
                                                            BoxDecoration(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  15),
                                                              color: const Color(
                                                                  0xffEEEEEE),
                                                            ),
                                                            child:
                                                            const Center(
                                                                child:
                                                                Text(
                                                                  '+8',
                                                                  style: TextStyle(
                                                                      color: Color(
                                                                          0xffE5646C),
                                                                      fontSize:
                                                                      14),
                                                                )),
                                                          ),
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  top: 25, left: 8),
                                              child: Image.asset(
                                                'assets/star2.png',
                                                height: 16,
                                                color: const Color(
                                                    0xff9DA2A7),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  top: 25, left: 8),
                                              child: Image.asset(
                                                'assets/profile-add.png',
                                                height: 16,
                                              ),
                                            ),
                                            Padding(
                                                padding:
                                                const EdgeInsets
                                                    .only(
                                                    top: 25,
                                                    left: 8),
                                                child: Image.asset(
                                                  'assets/more.png',
                                                  height: 16,
                                                  color: const Color(
                                                      0xff9DA2A7),
                                                )),
                                          ],
                                        ),
                                        for (int a = 0;
                                        a < dataa2.length;
                                        a++)
                                          TableRow(
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 25, left: 8),
                                                child: Text(
                                                  'Various versions have evolved over',
                                                  style: TextStyle(
                                                    fontFamily:
                                                    'InterRegular',
                                                    fontWeight:
                                                    FontWeight.w500,
                                                    fontSize: 14,
                                                    color: notifire
                                                        .getblackcolor,),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    top: 18, left: 3),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      padding:
                                                      const EdgeInsets
                                                          .all(6),
                                                      decoration:
                                                      BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            16),
                                                        color: const Color(
                                                            0xffFAEBEC),
                                                      ),
                                                      child: const Center(
                                                          child: Text(
                                                              'Fix Bugs',
                                                              style:
                                                              TextStyle(
                                                                color: Color(
                                                                    0xffE5646C),
                                                                fontFamily:
                                                                'InterRegular',
                                                                fontSize:
                                                                12,
                                                              ))),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    top: 18, left: 3),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      padding:
                                                      const EdgeInsets
                                                          .all(6),
                                                      decoration:
                                                      BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            16),
                                                        color: notifire
                                                            .getbgcolor10,
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          Image.asset(
                                                              'assets/tag-right.png',
                                                              height: 16,
                                                              color: const Color(
                                                                  0xff7DC066)),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          const Center(
                                                              child: Text(
                                                                  '21 days left',
                                                                  style:
                                                                  TextStyle(
                                                                    color:
                                                                    Color(
                                                                        0xff727880),
                                                                    fontFamily:
                                                                    'InterRegular',
                                                                    fontSize:
                                                                    12,
                                                                  ))),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    top: 25, left: 8),
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                        'assets/Link.svg',
                                                        height: 16,
                                                        color: const Color(
                                                            0xffC6C8CB)),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    const Text(
                                                      '6',
                                                      style: TextStyle(
                                                          fontFamily:
                                                          'InterRegular',
                                                          fontSize: 14,
                                                          color: Color(
                                                              0xffC6C8CB),
                                                          fontWeight:
                                                          FontWeight
                                                              .w600),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    top: 25, left: 8),
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/messages-3.svg',
                                                      height: 16,
                                                      color: const Color(
                                                          0xffC6C8CB),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    const Text(
                                                      '2',
                                                      style: TextStyle(
                                                          fontFamily:
                                                          'InterRegular',
                                                          fontSize: 14,
                                                          color: Color(
                                                              0xffC6C8CB),
                                                          fontWeight:
                                                          FontWeight
                                                              .w600),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    left: 5, top: 18),
                                                child:
                                                Transform.translate(
                                                  offset: const Offset(
                                                      -50, 0),
                                                  child: Stack(
                                                    clipBehavior:
                                                    Clip.none,
                                                    children: [
                                                      Positioned(
                                                          left: 5,
                                                          child: Transform
                                                              .translate(
                                                            offset:
                                                            const Offset(
                                                                15,
                                                                0),
                                                            child:
                                                            Container(
                                                              width: 32,
                                                              height: 32,
                                                              decoration:
                                                              BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    15),
                                                              ),
                                                              child: Center(
                                                                  child: Image
                                                                      .asset(
                                                                      'assets/avatar-8 1.png')),
                                                            ),
                                                          )),
                                                      Positioned(
                                                          child: Transform
                                                              .translate(
                                                            offset:
                                                            const Offset(
                                                                45, 0),
                                                            child: Container(
                                                              width: 32,
                                                              height: 32,
                                                              decoration:
                                                              BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    15),
                                                                color: const Color(
                                                                    0xffEEEEEE),
                                                              ),
                                                              child:
                                                              const Center(
                                                                  child:
                                                                  Text(
                                                                    '+8',
                                                                    style: TextStyle(
                                                                        color: Color(
                                                                            0xffE5646C),
                                                                        fontSize:
                                                                        14),
                                                                  )),
                                                            ),
                                                          )),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    top: 25, left: 8),
                                                child: Image.asset(
                                                  'assets/star2.png',
                                                  height: 16,
                                                  color: const Color(
                                                      0xff9DA2A7),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    top: 25, left: 8),
                                                child: Image.asset(
                                                  'assets/profile-add.png',
                                                  height: 16,
                                                ),
                                              ),
                                              Padding(
                                                  padding:
                                                  const EdgeInsets
                                                      .only(
                                                      top: 25,
                                                      left: 8),
                                                  child: Image.asset(
                                                    'assets/more.png',
                                                    height: 16,
                                                    color: const Color(
                                                        0xff9DA2A7),
                                                  )),
                                            ],
                                          ),
                                        const TableRow(children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 10),
                                            child: Divider(
                                              height: 10,
                                              color: Colors.transparent,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 10),
                                            child: Divider(
                                              height: 10,
                                              color: Colors.transparent,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 10),
                                            child: Divider(
                                              height: 10,
                                              color: Colors.transparent,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 10),
                                            child: Divider(
                                              height: 10,
                                              color: Colors.transparent,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 10),
                                            child: Divider(
                                              height: 10,
                                              color: Colors.transparent,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 10),
                                            child: Divider(
                                              height: 10,
                                              color: Colors.transparent,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 10),
                                            child: Divider(
                                              height: 10,
                                              color: Colors.transparent,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 10),
                                            child: Divider(
                                              height: 10,
                                              color: Colors.transparent,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 10),
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
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              dataa2.add(0);
                              setState(() {});
                            },
                            child: Container(
                              decoration: BoxDecoration(

                                  color: notifire.getbgcolor11,
                                  borderRadius: BorderRadius.circular(12)),
                              child: DottedBorder(
                                  borderType: BorderType.RRect,
                                  radius: const Radius.circular(12),
                                  color: const Color(0xffC6C8CB),
                                  padding: const EdgeInsets.all(12),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/add.png',
                                        height: 16,
                                        color: const Color(0xff727880),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Text(
                                        'Add Task',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'InterRegular',
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xff727880)),
                                      )
                                    ],
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ])),
      ],
    )
        : Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            const Spacer(),
            SvgPicture.asset(
              'assets/house-door.svg', height: 16, color: Colors.blue,),
            const SizedBox(width: 10,),
            InkWell(
                onTap: () {
                  inboxController.setTextIsTrue(1);
                },
                child: Text('Dashboard', style: TextStyle(
                  fontFamily: 'InterRegular', fontSize: 14, color: greyy,))),
            const SizedBox(width: 10,),
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: greyy,),),
            const SizedBox(width: 10,),
            Text('Managemant', style: TextStyle(
                color: greyy, fontSize: 14, fontFamily: 'InterRegular'),),
            const SizedBox(width: 10,),
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: greyy,),),
            const SizedBox(width: 10,),
            Text('Version1', style: TextStyle(color: notifire.getblackcolor,
                fontSize: 14,
                fontFamily: 'InterRegular'),),
          ],
        ),
        const SizedBox(height: 20,),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(color: notifire.getbgcolor11,
            borderRadius: BorderRadius.circular(12),),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Web Design',
                style: TextStyle(
                    fontFamily: 'InterRegular',
                    fontSize: 26,
                    color: notifire.getblackcolor,
                    fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: notifire.getbgcolor10),
                  padding: const EdgeInsets.all(11),
                  child: Center(
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/flash.png',
                          height: 16,
                        ),
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
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: notifire.getbgcolor10,),
                  padding: const EdgeInsets.all(11),
                  child: Center(
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/star2.png',
                          height: 16,
                        ),
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
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: notifire.getbgcolor10),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Center(
                          child: Image.asset(
                            'assets/setting-5.png',
                            height: 18,
                            color: const Color(0xff727880),
                          )),
                    )
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: notifire.getbgcolor10),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Center(
                        child: Image.asset(
                          'assets/more.png',
                          height: 20,
                          color: const Color(0xff727880),
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
                  padding: const EdgeInsets.all(11),
                  decoration: BoxDecoration(
                      color: const Color(0xff595FE5),
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: Row(children: [
                      Image.asset('assets/add.png', scale: 4),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Invite Member',
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'InterRegular',
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      )
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        DefaultTabController(
            length: 2,
            initialIndex: 0,
            child: Column(children: [
              Row(
                children: [
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                        color: notifire.getbgcolor11,
                        borderRadius: BorderRadius.circular(16)),
                    child: TabBar(
                        indicatorColor: const Color(0xff2a70fe),
                        indicator: BoxDecoration(
                            color: notifire.Tab,
                            borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(16),
                                topRight: Radius.circular(16),
                                bottomLeft: Radius.circular(16),
                                topLeft: Radius.circular(16))),
                        isScrollable: true,
                        physics: const NeverScrollableScrollPhysics(),
                        labelColor: Colors.black,
                        tabs: [
                          Tab(
                            child: Tab(
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/kanban.png',
                                      height: 14, color: notifire.getblackcolor,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Board',
                                      style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        fontSize: 14,
                                        color: notifire.getblackcolor,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                          Tab(
                            child: Tab(
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/element-3.svg',
                                      height: 16, color: notifire.getblackcolor,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'List',
                                      style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        fontSize: 14,
                                        color: notifire.getblackcolor,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ]),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: Get.height * 1.2,
                child: NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) {
                    return [];
                  },
                  body: TabBarView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(

                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: notifire.getbgcolor11,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        'Backlogs',
                                        style: TextStyle(
                                            color: Color(0xff9DA2A7),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            fontFamily: 'InterRegular'),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                          padding:
                                          const EdgeInsets.all(3),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(12),
                                            color: notifire.getbgcolor,
                                          ),
                                          child: const Text(
                                            '4',
                                            style: TextStyle(
                                                fontFamily:
                                                'InterRegular',
                                                fontSize: 12,
                                                color: Color(0xff9DA2A7)),
                                          )),
                                      const Spacer(),
                                      Image.asset(
                                        'assets/more.png',
                                        height: 16,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(
                                    child: ListView.builder(
                                      physics: const NeverScrollableScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      // shrinkWrap: true,
                                      itemCount: model().War8.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          margin: const EdgeInsets.only(
                                              bottom: 20),
                                          padding:
                                          const EdgeInsets.all(14),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(12),
                                            color: notifire.getbgcolor10,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .start,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      model().War8[index],
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontFamily:
                                                          'InterRegular',
                                                          fontWeight:
                                                          FontWeight
                                                              .w600,
                                                          color:
                                                          notifire
                                                              .getblackcolor),
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  Image.asset(
                                                    'assets/more.png',
                                                    height: 16,
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              constraints < 1200 ? Column(
                                                children: [
                                                  Container(
                                                    padding:
                                                    const EdgeInsets
                                                        .all(6),
                                                    decoration:
                                                    BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          12),
                                                      color: model()
                                                          .Wor11[index],
                                                    ),
                                                    child: Center(
                                                        child: Text(
                                                            model().war[
                                                            index],
                                                            style:
                                                            TextStyle(
                                                              color: model()
                                                                  .Worcol1[
                                                              index],
                                                              fontFamily:
                                                              'InterRegular',
                                                              fontSize:
                                                              12,
                                                            ))),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Container(
                                                    padding:
                                                    const EdgeInsets
                                                        .all(6),
                                                    decoration:
                                                    BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          12),
                                                      color: notifire
                                                          .getbgcolor11,
                                                    ),
                                                    child: Center(
                                                      child: Row(
                                                        children: [
                                                          Image.asset(
                                                              model().War13[
                                                              index],
                                                              height: 12,
                                                              color: model()
                                                                  .Worcol1[
                                                              index]),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            model().War12[
                                                            index],
                                                            style:
                                                            const TextStyle(
                                                              color: Color(
                                                                  0xff727880),
                                                              fontSize:
                                                              12,
                                                              fontFamily:
                                                              'InterRegular',
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ) :
                                              Row(
                                                children: [
                                                  Container(
                                                    padding:
                                                    const EdgeInsets
                                                        .all(6),
                                                    decoration:
                                                    BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          12),
                                                      color: model()
                                                          .Wor11[index],
                                                    ),
                                                    child: Center(
                                                        child: Text(
                                                            model().war[
                                                            index],
                                                            style:
                                                            TextStyle(
                                                              color: model()
                                                                  .Worcol1[
                                                              index],
                                                              fontFamily:
                                                              'InterRegular',
                                                              fontSize:
                                                              12,
                                                            ))),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Container(
                                                    padding:
                                                    const EdgeInsets
                                                        .all(6),
                                                    decoration:
                                                    BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          12),
                                                      color: notifire
                                                          .getbgcolor11,
                                                    ),
                                                    child: Center(
                                                      child: Row(
                                                        children: [
                                                          Image.asset(
                                                              model().War13[
                                                              index],
                                                              height: 12,
                                                              color: model()
                                                                  .Worcol1[
                                                              index]),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            model().War12[
                                                            index],
                                                            style:
                                                            const TextStyle(
                                                              color: Color(
                                                                  0xff727880),
                                                              fontSize:
                                                              12,
                                                              fontFamily:
                                                              'InterRegular',
                                                            ),
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
                                              index == 1
                                                  ? Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(
                                                        12),
                                                    image: const DecorationImage(
                                                        image: AssetImage(
                                                            'assets/Media21.png'))),
                                                child: Center(
                                                    child: Image.asset(
                                                        'assets/image40.png',
                                                        fit: BoxFit
                                                            .cover)),
                                              )
                                                  : const SizedBox(),
                                              index == 2
                                                  ? Container(
                                                height: 140,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(
                                                        12),
                                                    image: const DecorationImage(
                                                        image: AssetImage(
                                                            'assets/Media21.png'))),
                                                child: Center(
                                                    child: Image.asset(
                                                        'assets/Media12.png',
                                                        fit: BoxFit
                                                            .cover)),
                                              )
                                                  : const SizedBox(),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              index == 0
                                                  ? const Text(
                                                  'There are many variations of passages',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Color(
                                                          0xff9DA2A7),
                                                      fontFamily:
                                                      'InterRegular'))
                                                  : const SizedBox(),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  SvgPicture.asset(
                                                      'assets/Link.svg',
                                                      height: 16,
                                                      color: const Color(
                                                          0xffC6C8CB)),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    model().War6[index],
                                                    style: const TextStyle(
                                                        fontFamily:
                                                        'InterRegular',
                                                        fontSize: 14,
                                                        color: Color(
                                                            0xffC6C8CB),
                                                        fontWeight:
                                                        FontWeight
                                                            .w600),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  SvgPicture.asset(
                                                    'assets/messages-3.svg',
                                                    height: 16,
                                                    color: const Color(
                                                        0xffC6C8CB),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    model().War7[index],
                                                    style: const TextStyle(
                                                        fontFamily:
                                                        'InterRegular',
                                                        fontSize: 14,
                                                        color: Color(
                                                            0xffC6C8CB),
                                                        fontWeight:
                                                        FontWeight
                                                            .w600),
                                                  ),
                                                  const Spacer(),
                                                  index == 0
                                                      ? Transform
                                                      .translate(
                                                    offset:
                                                    const Offset(
                                                        -50, 0),
                                                    child: Stack(
                                                      clipBehavior:
                                                      Clip.none,
                                                      children: [
                                                        Positioned(
                                                            child: Transform
                                                                .translate(
                                                              offset:
                                                              const Offset(
                                                                  45,
                                                                  0),
                                                              child:
                                                              Container(
                                                                width:
                                                                32,
                                                                height:
                                                                32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      15),
                                                                ),
                                                                child: Center(
                                                                    child:
                                                                    Image.asset(
                                                                        'assets/avatar-8 1.png')),
                                                              ),
                                                            )),
                                                      ],
                                                    ),
                                                  )
                                                      : const SizedBox(),
                                                  index == 1
                                                      ? Transform
                                                      .translate(
                                                    offset:
                                                    const Offset(
                                                        -50, 0),
                                                    child: Stack(
                                                      clipBehavior:
                                                      Clip.none,
                                                      children: [
                                                        Positioned(
                                                            left: 5,
                                                            child: Transform
                                                                .translate(
                                                              offset: const Offset(
                                                                  15,
                                                                  0),
                                                              child:
                                                              Container(
                                                                width:
                                                                32,
                                                                height:
                                                                32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius: BorderRadius
                                                                      .circular(
                                                                      15),
                                                                ),
                                                                child:
                                                                Center(
                                                                    child: Image
                                                                        .asset(
                                                                        'assets/avatar-8 1.png')),
                                                              ),
                                                            )),
                                                        Positioned(
                                                            child: Transform
                                                                .translate(
                                                              offset:
                                                              const Offset(
                                                                  45,
                                                                  0),
                                                              child:
                                                              Container(
                                                                width:
                                                                32,
                                                                height:
                                                                32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      15),
                                                                  color:
                                                                  const Color(
                                                                      0xffEEEEEE),
                                                                ),
                                                                child: const Center(
                                                                    child: Text(
                                                                      '+16',
                                                                      style: TextStyle(
                                                                          color: Color(
                                                                              0xffE5646C),
                                                                          fontSize: 14),
                                                                    )),
                                                              ),
                                                            )),
                                                      ],
                                                    ),
                                                  )
                                                      : const SizedBox(),
                                                  index == 2
                                                      ? Transform
                                                      .translate(
                                                    offset:
                                                    const Offset(
                                                        -50, 0),
                                                    child: Stack(
                                                      clipBehavior:
                                                      Clip.none,
                                                      children: [
                                                        Positioned(
                                                            left:
                                                            -10,
                                                            child: Transform
                                                                .translate(
                                                              offset: const Offset(
                                                                  5,
                                                                  0),
                                                              child:
                                                              Container(
                                                                width:
                                                                32,
                                                                height:
                                                                32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius: BorderRadius
                                                                      .circular(
                                                                      15),
                                                                ),
                                                                child:
                                                                Center(
                                                                    child: Image
                                                                        .asset(
                                                                        'assets/avatar-7 1.png')),
                                                              ),
                                                            )),
                                                        Positioned(
                                                            left: 5,
                                                            child: Transform
                                                                .translate(
                                                              offset: const Offset(
                                                                  15,
                                                                  0),
                                                              child:
                                                              Container(
                                                                width:
                                                                32,
                                                                height:
                                                                32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius: BorderRadius
                                                                      .circular(
                                                                      15),
                                                                ),
                                                                child:
                                                                Center(
                                                                    child: Image
                                                                        .asset(
                                                                        'assets/avatar-8 1.png')),
                                                              ),
                                                            )),
                                                        Positioned(
                                                            child: Transform
                                                                .translate(
                                                              offset:
                                                              const Offset(
                                                                  45,
                                                                  0),
                                                              child:
                                                              Container(
                                                                width:
                                                                32,
                                                                height:
                                                                32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      15),
                                                                  color:
                                                                  const Color(
                                                                      0xffEEEEEE),
                                                                ),
                                                                child: const Center(
                                                                    child: Text(
                                                                      '+12',
                                                                      style: TextStyle(
                                                                          color: Color(
                                                                              0xffE5646C),
                                                                          fontSize: 14),
                                                                    )),
                                                              ),
                                                            )),
                                                      ],
                                                    ),
                                                  )
                                                      : const SizedBox(),
                                                ],
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 120,
                                    child: DottedBorder(
                                        color: const Color(0xffC6C8CB),
                                        padding: const EdgeInsets.all(12),
                                        radius: const Radius.circular(12),
                                        borderType: BorderType.RRect,
                                        child: Row(
                                          children: [
                                            Image.asset('assets/add.png',
                                                height: 16,
                                                color: const Color(
                                                    0xff727880)),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text(
                                              'Add Task',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily:
                                                  'InterRegular',
                                                  color:
                                                  Color(0xff727880),
                                                  fontWeight:
                                                  FontWeight.w600),
                                            )
                                          ],
                                        )),
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

                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: notifire.getbgcolor11,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        'In Work',
                                        style: TextStyle(
                                            color: Color(0xff9DA2A7),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            fontFamily: 'InterRegular'),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                          padding:
                                          const EdgeInsets.all(3),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(12),
                                            color: notifire.getbgcolor,
                                          ),
                                          child: const Text(
                                            '4',
                                            style: TextStyle(
                                                fontFamily:
                                                'InterRegular',
                                                fontSize: 12,
                                                color: Color(0xff9DA2A7)),
                                          )),
                                      const Spacer(),
                                      Image.asset(
                                        'assets/more.png',
                                        height: 16,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(
                                    child: ListView.builder(
                                      physics: const NeverScrollableScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      // shrinkWrap: true,
                                      itemCount: model().War8.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          margin: const EdgeInsets.only(
                                              bottom: 20),
                                          padding:
                                          const EdgeInsets.all(14),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(12),
                                            color: notifire.getbgcolor10,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .start,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      model().War8[index],
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontFamily:
                                                          'InterRegular',
                                                          fontWeight:
                                                          FontWeight
                                                              .w600,
                                                          color:
                                                          notifire
                                                              .getblackcolor),
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  Image.asset(
                                                    'assets/more.png',
                                                    height: 16,
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              constraints < 1200 ? Column(
                                                children: [
                                                  Container(
                                                    padding:
                                                    const EdgeInsets
                                                        .all(6),
                                                    decoration:
                                                    BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          12),
                                                      color: model()
                                                          .Wor11[index],
                                                    ),
                                                    child: Center(
                                                        child: Text(
                                                            model().war[
                                                            index],
                                                            style:
                                                            TextStyle(
                                                              color: model()
                                                                  .Worcol1[
                                                              index],
                                                              fontFamily:
                                                              'InterRegular',
                                                              fontSize:
                                                              12,
                                                            ))),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Container(
                                                    padding:
                                                    const EdgeInsets
                                                        .all(6),
                                                    decoration:
                                                    BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          12),
                                                      color: notifire
                                                          .getbgcolor11,
                                                    ),
                                                    child: Center(
                                                      child: Row(
                                                        children: [
                                                          Image.asset(
                                                              model().War13[
                                                              index],
                                                              height: 12,
                                                              color: model()
                                                                  .Worcol1[
                                                              index]),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            model().War12[
                                                            index],
                                                            style:
                                                            const TextStyle(
                                                              color: Color(
                                                                  0xff727880),
                                                              fontSize:
                                                              12,
                                                              fontFamily:
                                                              'InterRegular',
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ) :
                                              Row(
                                                children: [
                                                  Container(
                                                    padding:
                                                    const EdgeInsets
                                                        .all(6),
                                                    decoration:
                                                    BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          12),
                                                      color: model()
                                                          .Wor11[index],
                                                    ),
                                                    child: Center(
                                                        child: Text(
                                                            model().war[
                                                            index],
                                                            style:
                                                            TextStyle(
                                                              color: model()
                                                                  .Worcol1[
                                                              index],
                                                              fontFamily:
                                                              'InterRegular',
                                                              fontSize:
                                                              12,
                                                            ))),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Container(
                                                    padding:
                                                    const EdgeInsets
                                                        .all(6),
                                                    decoration:
                                                    BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          12),
                                                      color: notifire
                                                          .getbgcolor11,
                                                    ),
                                                    child: Center(
                                                      child: Row(
                                                        children: [
                                                          Image.asset(
                                                              model().War13[
                                                              index],
                                                              height: 12,
                                                              color: model()
                                                                  .Worcol1[
                                                              index]),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            model().War12[
                                                            index],
                                                            style:
                                                            const TextStyle(
                                                              color: Color(
                                                                  0xff727880),
                                                              fontSize:
                                                              12,
                                                              fontFamily:
                                                              'InterRegular',
                                                            ),
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
                                              index == 1
                                                  ? Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(
                                                        12),
                                                    image: const DecorationImage(
                                                        image: AssetImage(
                                                            'assets/Media21.png'))),
                                                child: Center(
                                                    child: Image.asset(
                                                        'assets/image40.png',
                                                        fit: BoxFit
                                                            .cover)),
                                              )
                                                  : const SizedBox(),
                                              index == 2
                                                  ? Container(
                                                height: 140,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(
                                                        12),
                                                    image: const DecorationImage(
                                                        image: AssetImage(
                                                            'assets/Media21.png'))),
                                                child: Center(
                                                    child: Image.asset(
                                                        'assets/Media12.png',
                                                        fit: BoxFit
                                                            .cover)),
                                              )
                                                  : const SizedBox(),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              index == 0
                                                  ? const Text(
                                                  'There are many variations of passages',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Color(
                                                          0xff9DA2A7),
                                                      fontFamily:
                                                      'InterRegular'))
                                                  : const SizedBox(),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  SvgPicture.asset(
                                                      'assets/Link.svg',
                                                      height: 16,
                                                      color: const Color(
                                                          0xffC6C8CB)),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    model().War6[index],
                                                    style: const TextStyle(
                                                        fontFamily:
                                                        'InterRegular',
                                                        fontSize: 14,
                                                        color: Color(
                                                            0xffC6C8CB),
                                                        fontWeight:
                                                        FontWeight
                                                            .w600),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  SvgPicture.asset(
                                                    'assets/messages-3.svg',
                                                    height: 16,
                                                    color: const Color(
                                                        0xffC6C8CB),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    model().War7[index],
                                                    style: const TextStyle(
                                                        fontFamily:
                                                        'InterRegular',
                                                        fontSize: 14,
                                                        color: Color(
                                                            0xffC6C8CB),
                                                        fontWeight:
                                                        FontWeight
                                                            .w600),
                                                  ),
                                                  const Spacer(),
                                                  index == 0
                                                      ? Transform
                                                      .translate(
                                                    offset:
                                                    const Offset(
                                                        -50, 0),
                                                    child: Stack(
                                                      clipBehavior:
                                                      Clip.none,
                                                      children: [
                                                        Positioned(
                                                            child: Transform
                                                                .translate(
                                                              offset:
                                                              const Offset(
                                                                  45,
                                                                  0),
                                                              child:
                                                              Container(
                                                                width:
                                                                32,
                                                                height:
                                                                32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      15),
                                                                ),
                                                                child: Center(
                                                                    child:
                                                                    Image.asset(
                                                                        'assets/avatar-8 1.png')),
                                                              ),
                                                            )),
                                                      ],
                                                    ),
                                                  )
                                                      : const SizedBox(),
                                                  index == 1
                                                      ? Transform
                                                      .translate(
                                                    offset:
                                                    const Offset(
                                                        -50, 0),
                                                    child: Stack(
                                                      clipBehavior:
                                                      Clip.none,
                                                      children: [
                                                        Positioned(
                                                            left: 5,
                                                            child: Transform
                                                                .translate(
                                                              offset: const Offset(
                                                                  15,
                                                                  0),
                                                              child:
                                                              Container(
                                                                width:
                                                                32,
                                                                height:
                                                                32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius: BorderRadius
                                                                      .circular(
                                                                      15),
                                                                ),
                                                                child:
                                                                Center(
                                                                    child: Image
                                                                        .asset(
                                                                        'assets/avatar-8 1.png')),
                                                              ),
                                                            )),
                                                        Positioned(
                                                            child: Transform
                                                                .translate(
                                                              offset:
                                                              const Offset(
                                                                  45,
                                                                  0),
                                                              child:
                                                              Container(
                                                                width:
                                                                32,
                                                                height:
                                                                32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      15),
                                                                  color:
                                                                  const Color(
                                                                      0xffEEEEEE),
                                                                ),
                                                                child: const Center(
                                                                    child: Text(
                                                                      '+16',
                                                                      style: TextStyle(
                                                                          color: Color(
                                                                              0xffE5646C),
                                                                          fontSize: 14),
                                                                    )),
                                                              ),
                                                            )),
                                                      ],
                                                    ),
                                                  )
                                                      : const SizedBox(),
                                                  index == 2
                                                      ? Transform
                                                      .translate(
                                                    offset:
                                                    const Offset(
                                                        -50, 0),
                                                    child: Stack(
                                                      clipBehavior:
                                                      Clip.none,
                                                      children: [
                                                        Positioned(
                                                            left:
                                                            -10,
                                                            child: Transform
                                                                .translate(
                                                              offset: const Offset(
                                                                  5,
                                                                  0),
                                                              child:
                                                              Container(
                                                                width:
                                                                32,
                                                                height:
                                                                32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius: BorderRadius
                                                                      .circular(
                                                                      15),
                                                                ),
                                                                child:
                                                                Center(
                                                                    child: Image
                                                                        .asset(
                                                                        'assets/avatar-7 1.png')),
                                                              ),
                                                            )),
                                                        Positioned(
                                                            left: 5,
                                                            child: Transform
                                                                .translate(
                                                              offset: const Offset(
                                                                  15,
                                                                  0),
                                                              child:
                                                              Container(
                                                                width:
                                                                32,
                                                                height:
                                                                32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius: BorderRadius
                                                                      .circular(
                                                                      15),
                                                                ),
                                                                child:
                                                                Center(
                                                                    child: Image
                                                                        .asset(
                                                                        'assets/avatar-8 1.png')),
                                                              ),
                                                            )),
                                                        Positioned(
                                                            child: Transform
                                                                .translate(
                                                              offset:
                                                              const Offset(
                                                                  45,
                                                                  0),
                                                              child:
                                                              Container(
                                                                width:
                                                                32,
                                                                height:
                                                                32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      15),
                                                                  color:
                                                                  const Color(
                                                                      0xffEEEEEE),
                                                                ),
                                                                child: const Center(
                                                                    child: Text(
                                                                      '+12',
                                                                      style: TextStyle(
                                                                          color: Color(
                                                                              0xffE5646C),
                                                                          fontSize: 14),
                                                                    )),
                                                              ),
                                                            )),
                                                      ],
                                                    ),
                                                  )
                                                      : const SizedBox(),
                                                ],
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 120,
                                    child: DottedBorder(
                                        color: const Color(0xffC6C8CB),
                                        padding: const EdgeInsets.all(12),
                                        radius: const Radius.circular(12),
                                        borderType: BorderType.RRect,
                                        child: Row(
                                          children: [
                                            Image.asset('assets/add.png',
                                                height: 16,
                                                color: const Color(
                                                    0xff727880)),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text(
                                              'Add Task',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily:
                                                  'InterRegular',
                                                  color:
                                                  Color(0xff727880),
                                                  fontWeight:
                                                  FontWeight.w600),
                                            )
                                          ],
                                        )),
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
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: notifire.getbgcolor11,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        'Q & A',
                                        style: TextStyle(
                                            color: Color(0xff9DA2A7),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            fontFamily: 'InterRegular'),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                          padding:
                                          const EdgeInsets.all(3),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(12),
                                            color: notifire.getbgcolor,
                                          ),
                                          child: const Text(
                                            '4',
                                            style: TextStyle(
                                                fontFamily:
                                                'InterRegular',
                                                fontSize: 12,
                                                color: Color(0xff9DA2A7)),
                                          )),
                                      const Spacer(),
                                      Image.asset(
                                        'assets/more.png',
                                        height: 16,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(
                                    child: ListView.builder(
                                      physics: const NeverScrollableScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      // shrinkWrap: true,
                                      itemCount: model().War8.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          margin: const EdgeInsets.only(
                                              bottom: 20),
                                          padding:
                                          const EdgeInsets.all(14),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(12),
                                            color: notifire.getbgcolor10,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .start,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      model().War8[index],
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontFamily:
                                                          'InterRegular',
                                                          fontWeight:
                                                          FontWeight
                                                              .w600,
                                                          color:
                                                          notifire
                                                              .getblackcolor),
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  Image.asset(
                                                    'assets/more.png',
                                                    height: 16,
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              constraints < 1200 ?
                                              Column(
                                                children: [
                                                  Container(
                                                    padding:
                                                    const EdgeInsets
                                                        .all(6),
                                                    decoration:
                                                    BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          12),
                                                      color: model()
                                                          .Wor11[index],
                                                    ),
                                                    child: Center(
                                                        child: Text(
                                                            model().war[
                                                            index],
                                                            style:
                                                            TextStyle(
                                                              color: model()
                                                                  .Worcol1[
                                                              index],
                                                              fontFamily:
                                                              'InterRegular',
                                                              fontSize:
                                                              12,
                                                            ))),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Container(
                                                    padding:
                                                    const EdgeInsets
                                                        .all(6),
                                                    decoration:
                                                    BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          12),
                                                      color: notifire
                                                          .getbgcolor11,
                                                    ),
                                                    child: Center(
                                                      child: Row(
                                                        children: [
                                                          Image.asset(
                                                              model().War13[
                                                              index],
                                                              height: 12,
                                                              color: model()
                                                                  .Worcol1[
                                                              index]),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            model().War12[
                                                            index],
                                                            style:
                                                            const TextStyle(
                                                              color: Color(
                                                                  0xff727880),
                                                              fontSize:
                                                              12,
                                                              fontFamily:
                                                              'InterRegular',
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ) :
                                              Row(
                                                children: [
                                                  Container(
                                                    padding:
                                                    const EdgeInsets
                                                        .all(6),
                                                    decoration:
                                                    BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          12),
                                                      color: model()
                                                          .Wor11[index],
                                                    ),
                                                    child: Center(
                                                        child: Text(
                                                            model().war[
                                                            index],
                                                            style:
                                                            TextStyle(
                                                              color: model()
                                                                  .Worcol1[
                                                              index],
                                                              fontFamily:
                                                              'InterRegular',
                                                              fontSize:
                                                              12,
                                                            ))),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Container(
                                                    padding:
                                                    const EdgeInsets
                                                        .all(6),
                                                    decoration:
                                                    BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          12),
                                                      color: notifire
                                                          .getbgcolor11,
                                                    ),
                                                    child: Center(
                                                      child: Row(
                                                        children: [
                                                          Image.asset(
                                                              model().War13[
                                                              index],
                                                              height: 12,
                                                              color: model()
                                                                  .Worcol1[
                                                              index]),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            model().War12[
                                                            index],
                                                            style:
                                                            const TextStyle(
                                                              color: Color(
                                                                  0xff727880),
                                                              fontSize:
                                                              12,
                                                              fontFamily:
                                                              'InterRegular',
                                                            ),
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
                                              index == 0
                                                  ? Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(
                                                        12),
                                                    image: const DecorationImage(
                                                        image: AssetImage(
                                                            'assets/Media21.png'))),
                                                child: Center(
                                                    child: Image.asset(
                                                        'assets/image40.png',
                                                        fit: BoxFit
                                                            .cover)),
                                              )
                                                  : const SizedBox(),
                                              index == 1
                                                  ? Container(
                                                height: 140,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(
                                                        12),
                                                    image: const DecorationImage(
                                                        image: AssetImage(
                                                            'assets/Media21.png'))),
                                                child: Center(
                                                    child: Image.asset(
                                                        'assets/Media12.png',
                                                        fit: BoxFit
                                                            .cover)),
                                              )
                                                  : const SizedBox(),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              index == 0
                                                  ? const Text(
                                                  'It has survived not only five centuries',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Color(
                                                          0xff9DA2A7),
                                                      fontFamily:
                                                      'InterRegular'))
                                                  : const SizedBox(),
                                              index == 1
                                                  ? const Text(
                                                  'The generated Lorem Ipsum is therefore ',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Color(
                                                          0xff9DA2A7),
                                                      fontFamily:
                                                      'InterRegular'))
                                                  : const SizedBox(),
                                              index == 2
                                                  ? const Text(
                                                  'These cases are perfectly simple and easy to distinguish ',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Color(
                                                          0xff9DA2A7),
                                                      fontFamily:
                                                      'InterRegular'))
                                                  : const SizedBox(),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  SvgPicture.asset(
                                                      'assets/Link.svg',
                                                      height: 16,
                                                      color: const Color(
                                                          0xffC6C8CB)),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    model().War6[index],
                                                    style: const TextStyle(
                                                        fontFamily:
                                                        'InterRegular',
                                                        fontSize: 14,
                                                        color: Color(
                                                            0xffC6C8CB),
                                                        fontWeight:
                                                        FontWeight
                                                            .w600),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  SvgPicture.asset(
                                                    'assets/messages-3.svg',
                                                    height: 16,
                                                    color: const Color(
                                                        0xffC6C8CB),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    model().War7[index],
                                                    style: const TextStyle(
                                                        fontFamily:
                                                        'InterRegular',
                                                        fontSize: 14,
                                                        color: Color(
                                                            0xffC6C8CB),
                                                        fontWeight:
                                                        FontWeight
                                                            .w600),
                                                  ),
                                                  const Spacer(),
                                                  index == 0
                                                      ? Transform
                                                      .translate(
                                                    offset:
                                                    const Offset(
                                                        -50, 0),
                                                    child: Stack(
                                                      clipBehavior:
                                                      Clip.none,
                                                      children: [
                                                        Positioned(
                                                            child: Transform
                                                                .translate(
                                                              offset:
                                                              const Offset(
                                                                  45,
                                                                  0),
                                                              child:
                                                              Container(
                                                                width:
                                                                32,
                                                                height:
                                                                32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      15),
                                                                ),
                                                                child: Center(
                                                                    child:
                                                                    Image.asset(
                                                                        'assets/avatar-8 1.png')),
                                                              ),
                                                            )),
                                                      ],
                                                    ),
                                                  )
                                                      : const SizedBox(),
                                                  index == 1
                                                      ? Transform
                                                      .translate(
                                                    offset:
                                                    const Offset(
                                                        -50, 0),
                                                    child: Stack(
                                                      clipBehavior:
                                                      Clip.none,
                                                      children: [
                                                        Positioned(
                                                            left: 5,
                                                            child: Transform
                                                                .translate(
                                                              offset: const Offset(
                                                                  15,
                                                                  0),
                                                              child:
                                                              Container(
                                                                width:
                                                                32,
                                                                height:
                                                                32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius: BorderRadius
                                                                      .circular(
                                                                      15),
                                                                ),
                                                                child:
                                                                Center(
                                                                    child: Image
                                                                        .asset(
                                                                        'assets/avatar-8 1.png')),
                                                              ),
                                                            )),
                                                        Positioned(
                                                            child: Transform
                                                                .translate(
                                                              offset:
                                                              const Offset(
                                                                  45,
                                                                  0),
                                                              child:
                                                              Container(
                                                                width:
                                                                32,
                                                                height:
                                                                32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      15),
                                                                  color:
                                                                  const Color(
                                                                      0xffEEEEEE),
                                                                ),
                                                                child: const Center(
                                                                    child: Text(
                                                                      '+16',
                                                                      style: TextStyle(
                                                                          color: Color(
                                                                              0xffE5646C),
                                                                          fontSize: 14),
                                                                    )),
                                                              ),
                                                            )),
                                                      ],
                                                    ),
                                                  )
                                                      : const SizedBox(),
                                                  index == 2
                                                      ? Transform
                                                      .translate(
                                                    offset:
                                                    const Offset(
                                                        -50, 0),
                                                    child: Stack(
                                                      clipBehavior:
                                                      Clip.none,
                                                      children: [
                                                        Positioned(
                                                            left:
                                                            -10,
                                                            child: Transform
                                                                .translate(
                                                              offset: const Offset(
                                                                  5,
                                                                  0),
                                                              child:
                                                              Container(
                                                                width:
                                                                32,
                                                                height:
                                                                32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius: BorderRadius
                                                                      .circular(
                                                                      15),
                                                                ),
                                                                child:
                                                                Center(
                                                                    child: Image
                                                                        .asset(
                                                                        'assets/avatar-7 1.png')),
                                                              ),
                                                            )),
                                                        Positioned(
                                                            left: 5,
                                                            child: Transform
                                                                .translate(
                                                              offset: const Offset(
                                                                  15,
                                                                  0),
                                                              child:
                                                              Container(
                                                                width:
                                                                32,
                                                                height:
                                                                32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius: BorderRadius
                                                                      .circular(
                                                                      15),
                                                                ),
                                                                child:
                                                                Center(
                                                                    child: Image
                                                                        .asset(
                                                                        'assets/avatar-8 1.png')),
                                                              ),
                                                            )),
                                                        Positioned(
                                                            child: Transform
                                                                .translate(
                                                              offset:
                                                              const Offset(
                                                                  45,
                                                                  0),
                                                              child:
                                                              Container(
                                                                width:
                                                                32,
                                                                height:
                                                                32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      15),
                                                                  color:
                                                                  const Color(
                                                                      0xffEEEEEE),
                                                                ),
                                                                child: const Center(
                                                                    child: Text(
                                                                      '+12',
                                                                      style: TextStyle(
                                                                          color: Color(
                                                                              0xffE5646C),
                                                                          fontSize: 14),
                                                                    )),
                                                              ),
                                                            )),
                                                      ],
                                                    ),
                                                  )
                                                      : const SizedBox(),
                                                ],
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 120,
                                    child: DottedBorder(
                                        color: const Color(0xffC6C8CB),
                                        padding: const EdgeInsets.all(12),
                                        radius: const Radius.circular(12),
                                        borderType: BorderType.RRect,
                                        child: Row(
                                          children: [
                                            Image.asset('assets/add.png',
                                                height: 16,
                                                color: const Color(
                                                    0xff727880)),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text(
                                              'Add Task',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily:
                                                  'InterRegular',
                                                  color:
                                                  Color(0xff727880),
                                                  fontWeight:
                                                  FontWeight.w600),
                                            )
                                          ],
                                        )),
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
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: notifire.getbgcolor11,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        'Archive',
                                        style: TextStyle(
                                            color: Color(0xff9DA2A7),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            fontFamily: 'InterRegular'),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                          padding:
                                          const EdgeInsets.all(3),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(12),
                                            color: notifire.getbgcolor10,
                                          ),
                                          child: const Text(
                                            '12',
                                            style: TextStyle(
                                                fontFamily:
                                                'InterRegular',
                                                fontSize: 12,
                                                color: Color(0xff9DA2A7)),
                                          )),
                                      const Spacer(),
                                      Image.asset(
                                        'assets/more.png',
                                        height: 16,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(
                                    child: ListView.builder(
                                      physics: const NeverScrollableScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      // shrinkWrap: true,
                                      itemCount: model().War8.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          margin: const EdgeInsets.only(
                                              bottom: 20),
                                          padding:
                                          const EdgeInsets.all(14),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(12),
                                            color: notifire.getbgcolor10,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .start,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      model().War8[index],
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontFamily:
                                                          'InterRegular',
                                                          fontWeight:
                                                          FontWeight
                                                              .w600,
                                                          color:
                                                          notifire
                                                              .getblackcolor),
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  Image.asset(
                                                    'assets/more.png',
                                                    height: 16,
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              constraints < 1200 ? Column(
                                                children: [
                                                  Container(
                                                    padding:
                                                    const EdgeInsets
                                                        .all(6),
                                                    decoration:
                                                    BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          12),
                                                      color: model()
                                                          .Wor11[index],
                                                    ),
                                                    child: Center(
                                                        child: Text(
                                                            model().war[
                                                            index],
                                                            style:
                                                            TextStyle(
                                                              color: model()
                                                                  .Worcol1[
                                                              index],
                                                              fontFamily:
                                                              'InterRegular',
                                                              fontSize:
                                                              12,
                                                            ))),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Container(
                                                    padding:
                                                    const EdgeInsets
                                                        .all(6),
                                                    decoration:
                                                    BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          12),
                                                      color: notifire
                                                          .getbgcolor11,
                                                    ),
                                                    child: Center(
                                                      child: Row(
                                                        children: [
                                                          Image.asset(
                                                              model().War13[
                                                              index],
                                                              height: 12,
                                                              color: model()
                                                                  .Worcol1[
                                                              index]),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            model().War12[
                                                            index],
                                                            style:
                                                            const TextStyle(
                                                              color: Color(
                                                                  0xff727880),
                                                              fontSize:
                                                              12,
                                                              fontFamily:
                                                              'InterRegular',
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ) :
                                              Row(
                                                children: [
                                                  Container(
                                                    padding:
                                                    const EdgeInsets
                                                        .all(6),
                                                    decoration:
                                                    BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          12),
                                                      color: model()
                                                          .Wor11[index],
                                                    ),
                                                    child: Center(
                                                        child: Text(
                                                            model().war[
                                                            index],
                                                            style:
                                                            TextStyle(
                                                              color: model()
                                                                  .Worcol1[
                                                              index],
                                                              fontFamily:
                                                              'InterRegular',
                                                              fontSize:
                                                              12,
                                                            ))),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Container(
                                                    padding:
                                                    const EdgeInsets
                                                        .all(6),
                                                    decoration:
                                                    BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          12),
                                                      color: notifire
                                                          .getbgcolor11,
                                                    ),
                                                    child: Center(
                                                      child: Row(
                                                        children: [
                                                          Image.asset(
                                                              model().War13[
                                                              index],
                                                              height: 12,
                                                              color: model()
                                                                  .Worcol1[
                                                              index]),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            model().War12[
                                                            index],
                                                            style:
                                                            const TextStyle(
                                                              color: Color(
                                                                  0xff727880),
                                                              fontSize:
                                                              12,
                                                              fontFamily:
                                                              'InterRegular',
                                                            ),
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
                                              index == 1
                                                  ? Container(
                                                height: 140,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(
                                                        12),
                                                    image: const DecorationImage(
                                                        image: AssetImage(
                                                            'assets/Media21.png'))),
                                                child: Center(
                                                    child: Image.asset(
                                                        'assets/Media12.png',
                                                        fit: BoxFit
                                                            .cover)),
                                              )
                                                  : const SizedBox(),
                                              index == 2
                                                  ? Container(
                                                height: 140,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(
                                                        12),
                                                    image: const DecorationImage(
                                                        image: AssetImage(
                                                            'assets/image40.png'))),
                                                child: Center(
                                                    child: Image.asset(
                                                        'assets/Media12.png',
                                                        fit: BoxFit
                                                            .cover)),
                                              )
                                                  : const SizedBox(),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              index == 0
                                                  ? const Text(
                                                  'It has survived not only five centuries',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Color(
                                                          0xff9DA2A7),
                                                      fontFamily:
                                                      'InterRegular'))
                                                  : const SizedBox(),
                                              index == 1
                                                  ? const Text(
                                                  'The generated Lorem Ipsum is therefore ',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Color(
                                                          0xff9DA2A7),
                                                      fontFamily:
                                                      'InterRegular'))
                                                  : const SizedBox(),
                                              index == 2
                                                  ? const Text(
                                                  'These cases are perfectly simple and easy to distinguish ',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Color(
                                                          0xff9DA2A7),
                                                      fontFamily:
                                                      'InterRegular'))
                                                  : const SizedBox(),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  SvgPicture.asset(
                                                      'assets/Link.svg',
                                                      height: 16,
                                                      color: const Color(
                                                          0xffC6C8CB)),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    model().War6[index],
                                                    style: const TextStyle(
                                                        fontFamily:
                                                        'InterRegular',
                                                        fontSize: 14,
                                                        color: Color(
                                                            0xffC6C8CB),
                                                        fontWeight:
                                                        FontWeight
                                                            .w600),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  SvgPicture.asset(
                                                    'assets/messages-3.svg',
                                                    height: 16,
                                                    color: const Color(
                                                        0xffC6C8CB),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    model().War7[index],
                                                    style: const TextStyle(
                                                        fontFamily:
                                                        'InterRegular',
                                                        fontSize: 14,
                                                        color: Color(
                                                            0xffC6C8CB),
                                                        fontWeight:
                                                        FontWeight
                                                            .w600),
                                                  ),
                                                  const Spacer(),
                                                  index == 0
                                                      ? Transform
                                                      .translate(
                                                    offset:
                                                    const Offset(
                                                        -50, 0),
                                                    child: Stack(
                                                      clipBehavior:
                                                      Clip.none,
                                                      children: [
                                                        Positioned(
                                                            child: Transform
                                                                .translate(
                                                              offset:
                                                              const Offset(
                                                                  45,
                                                                  0),
                                                              child:
                                                              Container(
                                                                width:
                                                                32,
                                                                height:
                                                                32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      15),
                                                                ),
                                                                child: Center(
                                                                    child:
                                                                    Image.asset(
                                                                        'assets/avatar-8 1.png')),
                                                              ),
                                                            )),
                                                      ],
                                                    ),
                                                  )
                                                      : const SizedBox(),
                                                  index == 1
                                                      ? Transform
                                                      .translate(
                                                    offset:
                                                    const Offset(
                                                        -50, 0),
                                                    child: Stack(
                                                      clipBehavior:
                                                      Clip.none,
                                                      children: [
                                                        Positioned(
                                                            left: 5,
                                                            child: Transform
                                                                .translate(
                                                              offset: const Offset(
                                                                  15,
                                                                  0),
                                                              child:
                                                              Container(
                                                                width:
                                                                32,
                                                                height:
                                                                32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius: BorderRadius
                                                                      .circular(
                                                                      15),
                                                                ),
                                                                child:
                                                                Center(
                                                                    child: Image
                                                                        .asset(
                                                                        'assets/avatar-8 1.png')),
                                                              ),
                                                            )),
                                                        Positioned(
                                                            child: Transform
                                                                .translate(
                                                              offset:
                                                              const Offset(
                                                                  45,
                                                                  0),
                                                              child:
                                                              Container(
                                                                width:
                                                                32,
                                                                height:
                                                                32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      15),
                                                                  color:
                                                                  const Color(
                                                                      0xffEEEEEE),
                                                                ),
                                                                child: const Center(
                                                                    child: Text(
                                                                      '+16',
                                                                      style: TextStyle(
                                                                          color: Color(
                                                                              0xffE5646C),
                                                                          fontSize: 14),
                                                                    )),
                                                              ),
                                                            )),
                                                      ],
                                                    ),
                                                  )
                                                      : const SizedBox(),
                                                  index == 2
                                                      ? Transform
                                                      .translate(
                                                    offset:
                                                    const Offset(
                                                        -50, 0),
                                                    child: Stack(
                                                      clipBehavior:
                                                      Clip.none,
                                                      children: [
                                                        Positioned(
                                                            left:
                                                            -10,
                                                            child: Transform
                                                                .translate(
                                                              offset: const Offset(
                                                                  5,
                                                                  0),
                                                              child:
                                                              Container(
                                                                width:
                                                                32,
                                                                height:
                                                                32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius: BorderRadius
                                                                      .circular(
                                                                      15),
                                                                ),
                                                                child:
                                                                Center(
                                                                    child: Image
                                                                        .asset(
                                                                        'assets/avatar-7 1.png')),
                                                              ),
                                                            )),
                                                        Positioned(
                                                            left: 5,
                                                            child: Transform
                                                                .translate(
                                                              offset: const Offset(
                                                                  15,
                                                                  0),
                                                              child:
                                                              Container(
                                                                width:
                                                                32,
                                                                height:
                                                                32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius: BorderRadius
                                                                      .circular(
                                                                      15),
                                                                ),
                                                                child:
                                                                Center(
                                                                    child: Image
                                                                        .asset(
                                                                        'assets/avatar-8 1.png')),
                                                              ),
                                                            )),
                                                        Positioned(
                                                            child: Transform
                                                                .translate(
                                                              offset:
                                                              const Offset(
                                                                  45,
                                                                  0),
                                                              child:
                                                              Container(
                                                                width:
                                                                32,
                                                                height:
                                                                32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      15),
                                                                  color:
                                                                  const Color(
                                                                      0xffEEEEEE),
                                                                ),
                                                                child: const Center(
                                                                    child: Text(
                                                                      '+12',
                                                                      style: TextStyle(
                                                                          color: Color(
                                                                              0xffE5646C),
                                                                          fontSize: 14),
                                                                    )),
                                                              ),
                                                            )),
                                                      ],
                                                    ),
                                                  )
                                                      : const SizedBox(),
                                                ],
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),

                                  SizedBox(
                                    width: 120,
                                    child: DottedBorder(
                                        color: const Color(0xffC6C8CB),
                                        padding: const EdgeInsets.all(12),
                                        radius: const Radius.circular(12),
                                        borderType: BorderType.RRect,
                                        child: Row(
                                          children: [
                                            Image.asset('assets/add.png',
                                                height: 16,
                                                color: const Color(
                                                    0xff727880)),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text(
                                              'Add Task',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily:
                                                  'InterRegular',
                                                  color:
                                                  Color(0xff727880),
                                                  fontWeight:
                                                  FontWeight.w600),
                                            )
                                          ],
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Backlogs',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'InterRegular',
                                      fontSize: 16,
                                      color: notifire.getblackcolor
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(12),
                                      color: notifire.getbgcolor11,
                                    ),
                                    child: const Text(
                                      '4',
                                      style: TextStyle(
                                          fontFamily: 'InterRegular',
                                          fontSize: 12,
                                          color: Color(0xff727880)),
                                    )),
                              ],
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
                                  borderRadius:
                                  BorderRadius.circular(15)),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: constraints < 1400
                                          ? 1500
                                          : Get.width,
                                      child: Table(
                                        border: TableBorder.all(
                                            color: Colors.transparent),
                                        columnWidths: const <int,
                                            TableColumnWidth>{
                                          0: FixedColumnWidth(250),
                                          1: FixedColumnWidth(100),
                                          2: FixedColumnWidth(100),
                                          3: FixedColumnWidth(100),
                                          4: FixedColumnWidth(100),
                                          5: FixedColumnWidth(50),
                                          6: FixedColumnWidth(50),
                                          7: FixedColumnWidth(50),
                                          8: FixedColumnWidth(50),
                                        },
                                        children: <TableRow>[
                                          TableRow(
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 25, left: 8),
                                                child: Text(
                                                  'Various versions have evolved over',
                                                  style: TextStyle(
                                                      fontFamily:
                                                      'InterRegular',
                                                      fontWeight:
                                                      FontWeight.w500,
                                                      fontSize: 14,
                                                      color:
                                                      notifire.getblackcolor),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    top: 18, left: 3),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      padding:
                                                      const EdgeInsets
                                                          .all(6),
                                                      decoration:
                                                      BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            12),
                                                        color: const Color(
                                                            0xffEAF6FC),
                                                      ),
                                                      child: const Center(
                                                          child: Text(
                                                              'New Feature',
                                                              style:
                                                              TextStyle(
                                                                color: Color(
                                                                    0xff59B4D1),
                                                                fontFamily:
                                                                'InterRegular',
                                                                fontSize:
                                                                12,
                                                              ))),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    top: 18, left: 3),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      padding:
                                                      const EdgeInsets
                                                          .all(6),
                                                      decoration:
                                                      BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            12),
                                                        color: notifire
                                                            .getbgcolor10,
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          Image.asset(
                                                              'assets/tag-right.png',
                                                              height: 16,
                                                              color: const Color(
                                                                  0xff7DC066)),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          const Center(
                                                              child: Text(
                                                                  '21 days left',
                                                                  style:
                                                                  TextStyle(
                                                                    color:
                                                                    Color(
                                                                        0xff727880),
                                                                    fontFamily:
                                                                    'InterRegular',
                                                                    fontSize:
                                                                    12,
                                                                  ))),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    top: 25, left: 8),
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                        'assets/Link.svg',
                                                        height: 16,
                                                        color: const Color(
                                                            0xffC6C8CB)),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    const Text(
                                                      '6',
                                                      style: TextStyle(
                                                          fontFamily:
                                                          'InterRegular',
                                                          fontSize: 14,
                                                          color: Color(
                                                              0xffC6C8CB),
                                                          fontWeight:
                                                          FontWeight
                                                              .w600),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    top: 25, left: 8),
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/messages-3.svg',
                                                      height: 16,
                                                      color: const Color(
                                                          0xffC6C8CB),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    const Text(
                                                      '2',
                                                      style: TextStyle(
                                                          fontFamily:
                                                          'InterRegular',
                                                          fontSize: 14,
                                                          color: Color(
                                                              0xffC6C8CB),
                                                          fontWeight:
                                                          FontWeight
                                                              .w600),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    left: 5, top: 18),
                                                child:
                                                Transform.translate(
                                                  offset: const Offset(
                                                      -50, 0),
                                                  child: Stack(
                                                    clipBehavior:
                                                    Clip.none,
                                                    children: [
                                                      Positioned(
                                                          left: 5,
                                                          child: Transform
                                                              .translate(
                                                            offset:
                                                            const Offset(
                                                                15,
                                                                0),
                                                            child:
                                                            Container(
                                                              width: 32,
                                                              height: 32,
                                                              decoration:
                                                              BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    15),
                                                              ),
                                                              child: Center(
                                                                  child: Image
                                                                      .asset(
                                                                      'assets/avatar-8 1.png')),
                                                            ),
                                                          )),
                                                      Positioned(
                                                          child: Transform
                                                              .translate(
                                                            offset:
                                                            const Offset(
                                                                45, 0),
                                                            child: Container(
                                                              width: 32,
                                                              height: 32,
                                                              decoration:
                                                              BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    15),
                                                                color: const Color(
                                                                    0xffEEEEEE),
                                                              ),
                                                              child:
                                                              const Center(
                                                                  child:
                                                                  Text(
                                                                    '+16',
                                                                    style: TextStyle(
                                                                        color: Color(
                                                                            0xffE5646C),
                                                                        fontSize:
                                                                        14),
                                                                  )),
                                                            ),
                                                          )),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    top: 25, left: 8),
                                                child: Image.asset(
                                                  'assets/star2.png',
                                                  height: 16,
                                                  color: const Color(
                                                      0xff9DA2A7),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    top: 25, left: 8),
                                                child: Image.asset(
                                                  'assets/profile-add.png',
                                                  height: 16,
                                                ),
                                              ),
                                              Padding(
                                                  padding:
                                                  const EdgeInsets
                                                      .only(
                                                      top: 25,
                                                      left: 8),
                                                  child: Image.asset(
                                                    'assets/more.png',
                                                    height: 16,
                                                    color: const Color(
                                                        0xff9DA2A7),
                                                  )),
                                            ],
                                          ),
                                          TableRow(
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 25, left: 8),
                                                child: Text(
                                                  'repeat predefined as necessary',
                                                  style: TextStyle(
                                                      fontFamily:
                                                      'InterRegular',
                                                      fontWeight:
                                                      FontWeight.w500,
                                                      fontSize: 14,
                                                      color:
                                                      notifire.getblackcolor),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    top: 18, left: 3),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      padding:
                                                      const EdgeInsets
                                                          .all(6),
                                                      decoration:
                                                      BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            12),
                                                        color: const Color(
                                                            0xffEAF6FC),
                                                      ),
                                                      child: const Center(
                                                          child: Text(
                                                              'Research',
                                                              style:
                                                              TextStyle(
                                                                color: Color(
                                                                    0xff7DC066),
                                                                fontFamily:
                                                                'InterRegular',
                                                                fontSize:
                                                                12,
                                                              ))),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    top: 18, left: 3),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      padding:
                                                      const EdgeInsets
                                                          .all(6),
                                                      decoration:
                                                      BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            12),
                                                        color: notifire
                                                            .getbgcolor10,
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          Image.asset(
                                                              'assets/tag-right.png',
                                                              height: 16,
                                                              color: const Color(
                                                                  0xffF3935D)),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          const Center(
                                                              child: Text(
                                                                  '15 days left',
                                                                  style:
                                                                  TextStyle(
                                                                    color:
                                                                    Color(
                                                                        0xff727880),
                                                                    fontFamily:
                                                                    'InterRegular',
                                                                    fontSize:
                                                                    12,
                                                                  ))),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    top: 25, left: 8),
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                        'assets/Link.svg',
                                                        height: 16,
                                                        color: const Color(
                                                            0xffC6C8CB)),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    const Text(
                                                      '2',
                                                      style: TextStyle(
                                                          fontFamily:
                                                          'InterRegular',
                                                          fontSize: 14,
                                                          color: Color(
                                                              0xffC6C8CB),
                                                          fontWeight:
                                                          FontWeight
                                                              .w600),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    top: 25, left: 8),
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/messages-3.svg',
                                                      height: 16,
                                                      color: const Color(
                                                          0xffC6C8CB),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    const Text(
                                                      '6',
                                                      style: TextStyle(
                                                          fontFamily:
                                                          'InterRegular',
                                                          fontSize: 14,
                                                          color: Color(
                                                              0xffC6C8CB),
                                                          fontWeight:
                                                          FontWeight
                                                              .w600),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    left: 5, top: 18),
                                                child:
                                                Transform.translate(
                                                  offset:
                                                  const Offset(0, 0),
                                                  child: Stack(
                                                    clipBehavior:
                                                    Clip.none,
                                                    children: [
                                                      Transform.translate(
                                                        offset:
                                                        const Offset(
                                                            -30, 0),
                                                        child: Container(
                                                          width: 32,
                                                          height: 32,
                                                          decoration:
                                                          BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                15),
                                                          ),
                                                          child: Center(
                                                              child: Image
                                                                  .asset(
                                                                  'assets/avatar-6 1.png')),
                                                        ),
                                                      ),
                                                      Positioned(
                                                          left: -10,
                                                          child: Transform
                                                              .translate(
                                                            offset:
                                                            const Offset(
                                                                5, 0),
                                                            child:
                                                            Container(
                                                              width: 32,
                                                              height: 32,
                                                              decoration:
                                                              BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    15),
                                                              ),
                                                              child: Center(
                                                                  child: Image
                                                                      .asset(
                                                                      'assets/avatar-7 1.png')),
                                                            ),
                                                          )),
                                                      Positioned(
                                                          left: 5,
                                                          child: Transform
                                                              .translate(
                                                            offset:
                                                            const Offset(
                                                                15,
                                                                0),
                                                            child:
                                                            Container(
                                                              width: 32,
                                                              height: 32,
                                                              decoration:
                                                              BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    15),
                                                              ),
                                                              child: Center(
                                                                  child: Image
                                                                      .asset(
                                                                      'assets/avatar-8 1.png')),
                                                            ),
                                                          )),
                                                      Positioned(
                                                          child: Transform
                                                              .translate(
                                                            offset:
                                                            const Offset(
                                                                45, 0),
                                                            child: Container(
                                                              width: 32,
                                                              height: 32,
                                                              decoration:
                                                              BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    15),
                                                                color: const Color(
                                                                    0xffEEEEEE),
                                                              ),
                                                              child:
                                                              const Center(
                                                                  child:
                                                                  Text(
                                                                    '+5',
                                                                    style: TextStyle(
                                                                        color: Color(
                                                                            0xffE5646C),
                                                                        fontSize:
                                                                        14),
                                                                  )),
                                                            ),
                                                          )),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    top: 25, left: 8),
                                                child: Image.asset(
                                                  'assets/star2.png',
                                                  height: 16,
                                                  color: const Color(
                                                      0xff9DA2A7),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    top: 25, left: 8),
                                                child: Image.asset(
                                                  'assets/profile-add.png',
                                                  height: 16,
                                                ),
                                              ),
                                              Padding(
                                                  padding:
                                                  const EdgeInsets
                                                      .only(
                                                      top: 25,
                                                      left: 8),
                                                  child: Image.asset(
                                                    'assets/more.png',
                                                    height: 16,
                                                    color: const Color(
                                                        0xff9DA2A7),
                                                  )),
                                            ],
                                          ),
                                          for (int a = 0;
                                          a < dataa.length;
                                          a++)
                                            TableRow(
                                              children: <Widget>[
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 25,
                                                      left: 8),
                                                  child: Text(
                                                    'Various versions have evolved over',
                                                    style: TextStyle(
                                                        fontFamily:
                                                        'InterRegular',
                                                        fontWeight:
                                                        FontWeight
                                                            .w500,
                                                        fontSize: 14,
                                                        color:
                                                        notifire.getblackcolor),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets
                                                      .only(
                                                      top: 18,
                                                      left: 3),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        padding:
                                                        const EdgeInsets
                                                            .all(6),
                                                        decoration:
                                                        BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              16),
                                                          color: const Color(
                                                              0xffFAEBEC),
                                                        ),
                                                        child:
                                                        const Center(
                                                            child: Text(
                                                                'Fix Bugs',
                                                                style:
                                                                TextStyle(
                                                                  color:
                                                                  Color(
                                                                      0xffE5646C),
                                                                  fontFamily:
                                                                  'InterRegular',
                                                                  fontSize:
                                                                  12,
                                                                ))),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets
                                                      .only(
                                                      top: 18,
                                                      left: 3),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        padding:
                                                        const EdgeInsets
                                                            .all(6),
                                                        decoration:
                                                        BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              12),
                                                          color: notifire
                                                              .getbgcolor10,
                                                        ),
                                                        child: Row(
                                                          children: [
                                                            Image.asset(
                                                                'assets/tag-right.png',
                                                                height:
                                                                16,
                                                                color: const Color(
                                                                    0xff7DC066)),
                                                            const SizedBox(
                                                              width: 10,
                                                            ),
                                                            const Center(
                                                                child: Text(
                                                                    '21 days left',
                                                                    style:
                                                                    TextStyle(
                                                                      color:
                                                                      Color(
                                                                          0xff727880),
                                                                      fontFamily:
                                                                      'InterRegular',
                                                                      fontSize:
                                                                      12,
                                                                    ))),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets
                                                      .only(
                                                      top: 25,
                                                      left: 8),
                                                  child: Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                          'assets/Link.svg',
                                                          height: 16,
                                                          color: const Color(
                                                              0xffC6C8CB)),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      const Text(
                                                        '6',
                                                        style: TextStyle(
                                                            fontFamily:
                                                            'InterRegular',
                                                            fontSize: 14,
                                                            color: Color(
                                                                0xffC6C8CB),
                                                            fontWeight:
                                                            FontWeight
                                                                .w600),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets
                                                      .only(
                                                      top: 25,
                                                      left: 8),
                                                  child: Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                        'assets/messages-3.svg',
                                                        height: 16,
                                                        color: const Color(
                                                            0xffC6C8CB),
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      const Text(
                                                        '2',
                                                        style: TextStyle(
                                                            fontFamily:
                                                            'InterRegular',
                                                            fontSize: 14,
                                                            color: Color(
                                                                0xffC6C8CB),
                                                            fontWeight:
                                                            FontWeight
                                                                .w600),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets
                                                      .only(
                                                      left: 5,
                                                      top: 18),
                                                  child:
                                                  Transform.translate(
                                                    offset: const Offset(
                                                        -50, 0),
                                                    child: Stack(
                                                      clipBehavior:
                                                      Clip.none,
                                                      children: [
                                                        Positioned(
                                                            left: 5,
                                                            child: Transform
                                                                .translate(
                                                              offset:
                                                              const Offset(
                                                                  15,
                                                                  0),
                                                              child:
                                                              Container(
                                                                width: 32,
                                                                height:
                                                                32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      15),
                                                                ),
                                                                child: Center(
                                                                    child:
                                                                    Image.asset(
                                                                        'assets/avatar-8 1.png')),
                                                              ),
                                                            )),
                                                        Positioned(
                                                            child: Transform
                                                                .translate(
                                                              offset:
                                                              const Offset(
                                                                  45, 0),
                                                              child:
                                                              Container(
                                                                width: 32,
                                                                height: 32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      15),
                                                                  color: const Color(
                                                                      0xffEEEEEE),
                                                                ),
                                                                child:
                                                                const Center(
                                                                    child:
                                                                    Text(
                                                                      '+8',
                                                                      style: TextStyle(
                                                                          color: Color(
                                                                              0xffE5646C),
                                                                          fontSize:
                                                                          14),
                                                                    )),
                                                              ),
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets
                                                      .only(
                                                      top: 25,
                                                      left: 8),
                                                  child: Image.asset(
                                                    'assets/star2.png',
                                                    height: 16,
                                                    color: const Color(
                                                        0xff9DA2A7),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets
                                                      .only(
                                                      top: 25,
                                                      left: 8),
                                                  child: Image.asset(
                                                    'assets/profile-add.png',
                                                    height: 16,
                                                  ),
                                                ),
                                                Padding(
                                                    padding:
                                                    const EdgeInsets
                                                        .only(
                                                        top: 25,
                                                        left: 8),
                                                    child: Image.asset(
                                                      'assets/more.png',
                                                      height: 16,
                                                      color: const Color(
                                                          0xff9DA2A7),
                                                    )),
                                              ],
                                            ),
                                          const TableRow(children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 10),
                                              child: Divider(
                                                height: 10,
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 10),
                                              child: Divider(
                                                height: 10,
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 10),
                                              child: Divider(
                                                height: 10,
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 10),
                                              child: Divider(
                                                height: 10,
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 10),
                                              child: Divider(
                                                height: 10,
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 10),
                                              child: Divider(
                                                height: 10,
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 10),
                                              child: Divider(
                                                height: 10,
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 10),
                                              child: Divider(
                                                height: 10,
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 10),
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
                            const SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () {
                                dataa.add(0);
                                setState(() {});
                              },
                              child: Container(


                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(12),
                                  color: notifire.getbgcolor11,
                                ),
                                child: DottedBorder(
                                    borderType: BorderType.RRect,
                                    radius: const Radius.circular(12),
                                    color: const Color(0xffC6C8CB),
                                    padding: const EdgeInsets.all(12),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/add.png',
                                          height: 16,
                                          color: const Color(0xff727880),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Text(
                                          'Add Task',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'InterRegular',
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xff727880)),
                                        )
                                      ],
                                    )),
                              ),
                            ),

                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Text(
                                  'In Work',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'InterRegular',
                                      fontSize: 16, color:
                                  notifire.getblackcolor
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(12),
                                      color: notifire.getbgcolor11,
                                    ),
                                    child: const Text(
                                      '4',
                                      style: TextStyle(
                                          fontFamily: 'InterRegular',
                                          fontSize: 12,
                                          color: Color(0xff727880)),
                                    )),
                              ],
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
                                  borderRadius:
                                  BorderRadius.circular(15)),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: constraints < 1400
                                          ? 1500
                                          : Get.width,
                                      child: Table(
                                        border: TableBorder.all(
                                            color: Colors.transparent),
                                        columnWidths: const <int,
                                            TableColumnWidth>{
                                          0: FixedColumnWidth(250),
                                          1: FixedColumnWidth(100),
                                          2: FixedColumnWidth(100),
                                          3: FixedColumnWidth(100),
                                          4: FixedColumnWidth(100),
                                          5: FixedColumnWidth(50),
                                          6: FixedColumnWidth(50),
                                          7: FixedColumnWidth(50),
                                          8: FixedColumnWidth(50),
                                        },
                                        children: <TableRow>[
                                          TableRow(
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 25, left: 8),
                                                child: Text(
                                                  'repeat predefined as necessary',
                                                  style: TextStyle(
                                                      fontFamily:
                                                      'InterRegular',
                                                      fontWeight:
                                                      FontWeight.w500,
                                                      fontSize: 14,
                                                      color:
                                                      notifire.getblackcolor),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    top: 18, left: 3),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      padding:
                                                      const EdgeInsets
                                                          .all(6),
                                                      decoration:
                                                      BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            12),
                                                        color: const Color(
                                                            0xffEAF6FC),
                                                      ),
                                                      child: const Center(
                                                          child: Text(
                                                              'Research',
                                                              style:
                                                              TextStyle(
                                                                color: Color(
                                                                    0xff7DC066),
                                                                fontFamily:
                                                                'InterRegular',
                                                                fontSize:
                                                                12,
                                                              ))),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    top: 18, left: 3),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      padding:
                                                      const EdgeInsets
                                                          .all(6),
                                                      decoration:
                                                      BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            12),
                                                        color: notifire
                                                            .getbgcolor10,
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          Image.asset(
                                                              'assets/tag-right.png',
                                                              height: 16,
                                                              color: const Color(
                                                                  0xffF3935D)),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          const Center(
                                                              child: Text(
                                                                  '15 days left',
                                                                  style:
                                                                  TextStyle(
                                                                    color:
                                                                    Color(
                                                                        0xff727880),
                                                                    fontFamily:
                                                                    'InterRegular',
                                                                    fontSize:
                                                                    12,
                                                                  ))),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    top: 25, left: 8),
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                        'assets/Link.svg',
                                                        height: 16,
                                                        color: const Color(
                                                            0xffC6C8CB)),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    const Text(
                                                      '2',
                                                      style: TextStyle(
                                                          fontFamily:
                                                          'InterRegular',
                                                          fontSize: 14,
                                                          color: Color(
                                                              0xffC6C8CB),
                                                          fontWeight:
                                                          FontWeight
                                                              .w600),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    top: 25, left: 8),
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/messages-3.svg',
                                                      height: 16,
                                                      color: const Color(
                                                          0xffC6C8CB),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    const Text(
                                                      '6',
                                                      style: TextStyle(
                                                          fontFamily:
                                                          'InterRegular',
                                                          fontSize: 14,
                                                          color: Color(
                                                              0xffC6C8CB),
                                                          fontWeight:
                                                          FontWeight
                                                              .w600),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    left: 5, top: 18),
                                                child:
                                                Transform.translate(
                                                  offset:
                                                  const Offset(0, 0),
                                                  child: Stack(
                                                    clipBehavior:
                                                    Clip.none,
                                                    children: [
                                                      Transform.translate(
                                                        offset:
                                                        const Offset(
                                                            -30, 0),
                                                        child: Container(
                                                          width: 32,
                                                          height: 32,
                                                          decoration:
                                                          BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                15),
                                                          ),
                                                          child: Center(
                                                              child: Image
                                                                  .asset(
                                                                  'assets/avatar-6 1.png')),
                                                        ),
                                                      ),
                                                      Positioned(
                                                          left: -10,
                                                          child: Transform
                                                              .translate(
                                                            offset:
                                                            const Offset(
                                                                5, 0),
                                                            child:
                                                            Container(
                                                              width: 32,
                                                              height: 32,
                                                              decoration:
                                                              BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    15),
                                                              ),
                                                              child: Center(
                                                                  child: Image
                                                                      .asset(
                                                                      'assets/avatar-7 1.png')),
                                                            ),
                                                          )),
                                                      Positioned(
                                                          left: 5,
                                                          child: Transform
                                                              .translate(
                                                            offset:
                                                            const Offset(
                                                                15,
                                                                0),
                                                            child:
                                                            Container(
                                                              width: 32,
                                                              height: 32,
                                                              decoration:
                                                              BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    15),
                                                              ),
                                                              child: Center(
                                                                  child: Image
                                                                      .asset(
                                                                      'assets/avatar-8 1.png')),
                                                            ),
                                                          )),
                                                      Positioned(
                                                          child: Transform
                                                              .translate(
                                                            offset:
                                                            const Offset(
                                                                45, 0),
                                                            child: Container(
                                                              width: 32,
                                                              height: 32,
                                                              decoration:
                                                              BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    15),
                                                                color: const Color(
                                                                    0xffEEEEEE),
                                                              ),
                                                              child:
                                                              const Center(
                                                                  child:
                                                                  Text(
                                                                    '+5',
                                                                    style: TextStyle(
                                                                        color: Color(
                                                                            0xffE5646C),
                                                                        fontSize:
                                                                        14),
                                                                  )),
                                                            ),
                                                          )),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    top: 25, left: 8),
                                                child: Image.asset(
                                                  'assets/star2.png',
                                                  height: 16,
                                                  color: const Color(
                                                      0xff9DA2A7),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    top: 25, left: 8),
                                                child: Image.asset(
                                                  'assets/profile-add.png',
                                                  height: 16,
                                                ),
                                              ),
                                              Padding(
                                                  padding:
                                                  const EdgeInsets
                                                      .only(
                                                      top: 25,
                                                      left: 8),
                                                  child: Image.asset(
                                                    'assets/more.png',
                                                    height: 16,
                                                    color: const Color(
                                                        0xff9DA2A7),
                                                  )),
                                            ],
                                          ),
                                          TableRow(
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 25, left: 8),
                                                child: Text(
                                                  'Various versions have evolved over',
                                                  style: TextStyle(
                                                      fontFamily:
                                                      'InterRegular',
                                                      fontWeight:
                                                      FontWeight.w500,
                                                      fontSize: 14,
                                                      color:
                                                      notifire.getblackcolor),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    top: 18, left: 3),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      padding:
                                                      const EdgeInsets
                                                          .all(6),
                                                      decoration:
                                                      BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            12),
                                                        color: const Color(
                                                            0xffEAF6FC),
                                                      ),
                                                      child: const Center(
                                                          child: Text(
                                                              'New Feature',
                                                              style:
                                                              TextStyle(
                                                                color: Color(
                                                                    0xff59B4D1),
                                                                fontFamily:
                                                                'InterRegular',
                                                                fontSize:
                                                                12,
                                                              ))),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    top: 18, left: 3),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      padding:
                                                      const EdgeInsets
                                                          .all(6),
                                                      decoration:
                                                      BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            12),
                                                        color: notifire
                                                            .getbgcolor10,
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          Image.asset(
                                                              'assets/tag-right.png',
                                                              height: 16,
                                                              color: const Color(
                                                                  0xff7DC066)),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          const Center(
                                                              child: Text(
                                                                  '21 days left',
                                                                  style:
                                                                  TextStyle(
                                                                    color:
                                                                    Color(
                                                                        0xff727880),
                                                                    fontFamily:
                                                                    'InterRegular',
                                                                    fontSize:
                                                                    12,
                                                                  ))),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    top: 25, left: 8),
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                        'assets/Link.svg',
                                                        height: 16,
                                                        color: const Color(
                                                            0xffC6C8CB)),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    const Text(
                                                      '6',
                                                      style: TextStyle(
                                                          fontFamily:
                                                          'InterRegular',
                                                          fontSize: 14,
                                                          color: Color(
                                                              0xffC6C8CB),
                                                          fontWeight:
                                                          FontWeight
                                                              .w600),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    top: 25, left: 8),
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/messages-3.svg',
                                                      height: 16,
                                                      color: const Color(
                                                          0xffC6C8CB),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    const Text(
                                                      '2',
                                                      style: TextStyle(
                                                          fontFamily:
                                                          'InterRegular',
                                                          fontSize: 14,
                                                          color: Color(
                                                              0xffC6C8CB),
                                                          fontWeight:
                                                          FontWeight
                                                              .w600),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    left: 5, top: 18),
                                                child:
                                                Transform.translate(
                                                  offset: const Offset(
                                                      -50, 0),
                                                  child: Stack(
                                                    clipBehavior:
                                                    Clip.none,
                                                    children: [
                                                      Positioned(
                                                          left: 5,
                                                          child: Transform
                                                              .translate(
                                                            offset:
                                                            const Offset(
                                                                15,
                                                                0),
                                                            child:
                                                            Container(
                                                              width: 32,
                                                              height: 32,
                                                              decoration:
                                                              BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    15),
                                                              ),
                                                              child: Center(
                                                                  child: Image
                                                                      .asset(
                                                                      'assets/avatar-8 1.png')),
                                                            ),
                                                          )),
                                                      Positioned(
                                                          child: Transform
                                                              .translate(
                                                            offset:
                                                            const Offset(
                                                                45, 0),
                                                            child: Container(
                                                              width: 32,
                                                              height: 32,
                                                              decoration:
                                                              BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    15),
                                                                color: const Color(
                                                                    0xffEEEEEE),
                                                              ),
                                                              child:
                                                              const Center(
                                                                  child:
                                                                  Text(
                                                                    '+16',
                                                                    style: TextStyle(
                                                                        color: Color(
                                                                            0xffE5646C),
                                                                        fontSize:
                                                                        14),
                                                                  )),
                                                            ),
                                                          )),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    top: 25, left: 8),
                                                child: Image.asset(
                                                  'assets/star2.png',
                                                  height: 16,
                                                  color: const Color(
                                                      0xff9DA2A7),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    top: 25, left: 8),
                                                child: Image.asset(
                                                  'assets/profile-add.png',
                                                  height: 16,
                                                ),
                                              ),
                                              Padding(
                                                  padding:
                                                  const EdgeInsets
                                                      .only(
                                                      top: 25,
                                                      left: 8),
                                                  child: Image.asset(
                                                    'assets/more.png',
                                                    height: 16,
                                                    color: const Color(
                                                        0xff9DA2A7),
                                                  )),
                                            ],
                                          ),
                                          for (int a = 0;
                                          a < dataa1.length;
                                          a++)
                                            TableRow(
                                              children: <Widget>[
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 25,
                                                      left: 8),
                                                  child: Text(
                                                    'Various versions have evolved over',
                                                    style: TextStyle(
                                                        fontFamily:
                                                        'InterRegular',
                                                        fontWeight:
                                                        FontWeight
                                                            .w500,
                                                        fontSize: 14,
                                                        color:
                                                        notifire.getblackcolor),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets
                                                      .only(
                                                      top: 18,
                                                      left: 3),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        padding:
                                                        const EdgeInsets
                                                            .all(6),
                                                        decoration:
                                                        BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              12),
                                                          color: const Color(
                                                              0xffFAEBEC),
                                                        ),
                                                        child:
                                                        const Center(
                                                            child: Text(
                                                                'Fix Bugs',
                                                                style:
                                                                TextStyle(
                                                                  color:
                                                                  Color(
                                                                      0xffE5646C),
                                                                  fontFamily:
                                                                  'InterRegular',
                                                                  fontSize:
                                                                  12,
                                                                ))),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets
                                                      .only(
                                                      top: 18,
                                                      left: 3),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        padding:
                                                        const EdgeInsets
                                                            .all(6),
                                                        decoration:
                                                        BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              12),
                                                          color: notifire
                                                              .getbgcolor10,
                                                        ),
                                                        child: Row(
                                                          children: [
                                                            Image.asset(
                                                                'assets/tag-right.png',
                                                                height:
                                                                16,
                                                                color: const Color(
                                                                    0xff7DC066)),
                                                            const SizedBox(
                                                              width: 10,
                                                            ),
                                                            const Center(
                                                                child: Text(
                                                                    '21 days left',
                                                                    style:
                                                                    TextStyle(
                                                                      color:
                                                                      Color(
                                                                          0xff727880),
                                                                      fontFamily:
                                                                      'InterRegular',
                                                                      fontSize:
                                                                      12,
                                                                    ))),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets
                                                      .only(
                                                      top: 25,
                                                      left: 8),
                                                  child: Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                          'assets/Link.svg',
                                                          height: 16,
                                                          color: const Color(
                                                              0xffC6C8CB)),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      const Text(
                                                        '6',
                                                        style: TextStyle(
                                                            fontFamily:
                                                            'InterRegular',
                                                            fontSize: 14,
                                                            color: Color(
                                                                0xffC6C8CB),
                                                            fontWeight:
                                                            FontWeight
                                                                .w600),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets
                                                      .only(
                                                      top: 25,
                                                      left: 8),
                                                  child: Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                        'assets/messages-3.svg',
                                                        height: 16,
                                                        color: const Color(
                                                            0xffC6C8CB),
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      const Text(
                                                        '2',
                                                        style: TextStyle(
                                                            fontFamily:
                                                            'InterRegular',
                                                            fontSize: 14,
                                                            color: Color(
                                                                0xffC6C8CB),
                                                            fontWeight:
                                                            FontWeight
                                                                .w600),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets
                                                      .only(
                                                      left: 5,
                                                      top: 18),
                                                  child:
                                                  Transform.translate(
                                                    offset: const Offset(
                                                        -50, 0),
                                                    child: Stack(
                                                      clipBehavior:
                                                      Clip.none,
                                                      children: [
                                                        Positioned(
                                                            left: 5,
                                                            child: Transform
                                                                .translate(
                                                              offset:
                                                              const Offset(
                                                                  15,
                                                                  0),
                                                              child:
                                                              Container(
                                                                width: 32,
                                                                height:
                                                                32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      15),
                                                                ),
                                                                child: Center(
                                                                    child:
                                                                    Image.asset(
                                                                        'assets/avatar-8 1.png')),
                                                              ),
                                                            )),
                                                        Positioned(
                                                            child: Transform
                                                                .translate(
                                                              offset:
                                                              const Offset(
                                                                  45, 0),
                                                              child:
                                                              Container(
                                                                width: 32,
                                                                height: 32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      15),
                                                                  color: const Color(
                                                                      0xffEEEEEE),
                                                                ),
                                                                child:
                                                                const Center(
                                                                    child:
                                                                    Text(
                                                                      '+8',
                                                                      style: TextStyle(
                                                                          color: Color(
                                                                              0xffE5646C),
                                                                          fontSize:
                                                                          14),
                                                                    )),
                                                              ),
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets
                                                      .only(
                                                      top: 25,
                                                      left: 8),
                                                  child: Image.asset(
                                                    'assets/star2.png',
                                                    height: 16,
                                                    color: const Color(
                                                        0xff9DA2A7),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets
                                                      .only(
                                                      top: 25,
                                                      left: 8),
                                                  child: Image.asset(
                                                    'assets/profile-add.png',
                                                    height: 16,
                                                  ),
                                                ),
                                                Padding(
                                                    padding:
                                                    const EdgeInsets
                                                        .only(
                                                        top: 25,
                                                        left: 8),
                                                    child: Image.asset(
                                                      'assets/more.png',
                                                      height: 16,
                                                      color: const Color(
                                                          0xff9DA2A7),
                                                    )),
                                              ],
                                            ),
                                          const TableRow(children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 10),
                                              child: Divider(
                                                height: 10,
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 10),
                                              child: Divider(
                                                height: 10,
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 10),
                                              child: Divider(
                                                height: 10,
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 10),
                                              child: Divider(
                                                height: 10,
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 10),
                                              child: Divider(
                                                height: 10,
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 10),
                                              child: Divider(
                                                height: 10,
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 10),
                                              child: Divider(
                                                height: 10,
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 10),
                                              child: Divider(
                                                height: 10,
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 10),
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
                            const SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () {
                                dataa1.add(0);
                                setState(() {});
                              },
                              child: Container(

                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(12),
                                  color: notifire.getbgcolor11,
                                ),
                                child: DottedBorder(
                                    borderType: BorderType.RRect,
                                    radius: const Radius.circular(12),
                                    color: const Color(0xffC6C8CB),
                                    padding: const EdgeInsets.all(12),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/add.png',
                                          height: 16,
                                          color: const Color(0xff727880),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Text(
                                          'Add Task',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'InterRegular',
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xff727880)),
                                        )
                                      ],
                                    )),
                              ),
                            ),

                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Q & A',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'InterRegular',
                                    fontSize: 16, color: notifire.getblackcolor,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(12),
                                      color: notifire.getbgcolor11,
                                    ),
                                    child: const Text(
                                      '4',
                                      style: TextStyle(
                                          fontFamily: 'InterRegular',
                                          fontSize: 12,
                                          color: Color(0xff727880)),
                                    )),
                              ],
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
                                  borderRadius:
                                  BorderRadius.circular(15)),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: constraints < 1400
                                          ? 1500
                                          : Get.width,
                                      child: Table(
                                        border: TableBorder.all(
                                            color: Colors.transparent),
                                        columnWidths: const <int,
                                            TableColumnWidth>{
                                          0: FixedColumnWidth(250),
                                          1: FixedColumnWidth(100),
                                          2: FixedColumnWidth(100),
                                          3: FixedColumnWidth(100),
                                          4: FixedColumnWidth(100),
                                          5: FixedColumnWidth(50),
                                          6: FixedColumnWidth(50),
                                          7: FixedColumnWidth(50),
                                          8: FixedColumnWidth(50),
                                        },
                                        children: <TableRow>[
                                          TableRow(
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 25, left: 8),
                                                child: Text(
                                                  'Various versions have evolved over',
                                                  style: TextStyle(
                                                      fontFamily:
                                                      'InterRegular',
                                                      fontWeight:
                                                      FontWeight.w500,
                                                      fontSize: 14,
                                                      color:
                                                      notifire.getblackcolor),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    top: 18, left: 3),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      padding:
                                                      const EdgeInsets
                                                          .all(6),
                                                      decoration:
                                                      BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            12),
                                                        color: const Color(
                                                            0xffEAF6FC),
                                                      ),
                                                      child: const Center(
                                                          child: Text(
                                                              'New Feature',
                                                              style:
                                                              TextStyle(
                                                                color: Color(
                                                                    0xff59B4D1),
                                                                fontFamily:
                                                                'InterRegular',
                                                                fontSize:
                                                                12,
                                                              ))),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    top: 18, left: 3),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      padding:
                                                      const EdgeInsets
                                                          .all(6),
                                                      decoration:
                                                      BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            12),
                                                        color: notifire
                                                            .getbgcolor10,
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          Image.asset(
                                                              'assets/tag-right.png',
                                                              height: 16,
                                                              color: const Color(
                                                                  0xff7DC066)),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          const Center(
                                                              child: Text(
                                                                  '21 days left',
                                                                  style:
                                                                  TextStyle(
                                                                    color:
                                                                    Color(
                                                                        0xff727880),
                                                                    fontFamily:
                                                                    'InterRegular',
                                                                    fontSize:
                                                                    12,
                                                                  ))),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    top: 25, left: 8),
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                        'assets/Link.svg',
                                                        height: 16,
                                                        color: const Color(
                                                            0xffC6C8CB)),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    const Text(
                                                      '6',
                                                      style: TextStyle(
                                                          fontFamily:
                                                          'InterRegular',
                                                          fontSize: 14,
                                                          color: Color(
                                                              0xffC6C8CB),
                                                          fontWeight:
                                                          FontWeight
                                                              .w600),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    top: 25, left: 8),
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/messages-3.svg',
                                                      height: 16,
                                                      color: const Color(
                                                          0xffC6C8CB),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    const Text(
                                                      '2',
                                                      style: TextStyle(
                                                          fontFamily:
                                                          'InterRegular',
                                                          fontSize: 14,
                                                          color: Color(
                                                              0xffC6C8CB),
                                                          fontWeight:
                                                          FontWeight
                                                              .w600),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    left: 5, top: 18),
                                                child:
                                                Transform.translate(
                                                  offset: const Offset(
                                                      -50, 0),
                                                  child: Stack(
                                                    clipBehavior:
                                                    Clip.none,
                                                    children: [
                                                      Positioned(
                                                          left: 5,
                                                          child: Transform
                                                              .translate(
                                                            offset:
                                                            const Offset(
                                                                15,
                                                                0),
                                                            child:
                                                            Container(
                                                              width: 32,
                                                              height: 32,
                                                              decoration:
                                                              BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    15),
                                                              ),
                                                              child: Center(
                                                                  child: Image
                                                                      .asset(
                                                                      'assets/avatar-8 1.png')),
                                                            ),
                                                          )),
                                                      Positioned(
                                                          child: Transform
                                                              .translate(
                                                            offset:
                                                            const Offset(
                                                                45, 0),
                                                            child: Container(
                                                              width: 32,
                                                              height: 32,
                                                              decoration:
                                                              BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    15),
                                                                color: const Color(
                                                                    0xffEEEEEE),
                                                              ),
                                                              child:
                                                              const Center(
                                                                  child:
                                                                  Text(
                                                                    '+16',
                                                                    style: TextStyle(
                                                                        color: Color(
                                                                            0xffE5646C),
                                                                        fontSize:
                                                                        14),
                                                                  )),
                                                            ),
                                                          )),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    top: 25, left: 8),
                                                child: Image.asset(
                                                  'assets/star2.png',
                                                  height: 16,
                                                  color: const Color(
                                                      0xff9DA2A7),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    top: 25, left: 8),
                                                child: Image.asset(
                                                  'assets/profile-add.png',
                                                  height: 16,
                                                ),
                                              ),
                                              Padding(
                                                  padding:
                                                  const EdgeInsets
                                                      .only(
                                                      top: 25,
                                                      left: 8),
                                                  child: Image.asset(
                                                    'assets/more.png',
                                                    height: 16,
                                                    color: const Color(
                                                        0xff9DA2A7),
                                                  )),
                                            ],
                                          ),
                                          TableRow(
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 25, left: 8),
                                                child: Text(
                                                  'Various versions have evolved over',
                                                  style: TextStyle(
                                                    fontFamily:
                                                    'InterRegular',
                                                    fontWeight:
                                                    FontWeight.w500,
                                                    fontSize: 14,
                                                    color: notifire
                                                        .getblackcolor,),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    top: 18, left: 3),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      padding:
                                                      const EdgeInsets
                                                          .all(6),
                                                      decoration:
                                                      BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            16),
                                                        color: const Color(
                                                            0xffFAEBEC),
                                                      ),
                                                      child: const Center(
                                                          child: Text(
                                                              'Fix Bugs',
                                                              style:
                                                              TextStyle(
                                                                color: Color(
                                                                    0xffE5646C),
                                                                fontFamily:
                                                                'InterRegular',
                                                                fontSize:
                                                                12,
                                                              ))),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    top: 18, left: 3),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      padding:
                                                      const EdgeInsets
                                                          .all(6),
                                                      decoration:
                                                      BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            16),
                                                        color: notifire
                                                            .getbgcolor10,
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          Image.asset(
                                                              'assets/tag-right.png',
                                                              height: 16,
                                                              color: const Color(
                                                                  0xff7DC066)),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          const Center(
                                                              child: Text(
                                                                  '21 days left',
                                                                  style:
                                                                  TextStyle(
                                                                    color:
                                                                    Color(
                                                                        0xff727880),
                                                                    fontFamily:
                                                                    'InterRegular',
                                                                    fontSize:
                                                                    12,
                                                                  ))),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    top: 25, left: 8),
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                        'assets/Link.svg',
                                                        height: 16,
                                                        color: const Color(
                                                            0xffC6C8CB)),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    const Text(
                                                      '6',
                                                      style: TextStyle(
                                                          fontFamily:
                                                          'InterRegular',
                                                          fontSize: 14,
                                                          color: Color(
                                                              0xffC6C8CB),
                                                          fontWeight:
                                                          FontWeight
                                                              .w600),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    top: 25, left: 8),
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/messages-3.svg',
                                                      height: 16,
                                                      color: const Color(
                                                          0xffC6C8CB),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    const Text(
                                                      '2',
                                                      style: TextStyle(
                                                          fontFamily:
                                                          'InterRegular',
                                                          fontSize: 14,
                                                          color: Color(
                                                              0xffC6C8CB),
                                                          fontWeight:
                                                          FontWeight
                                                              .w600),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    left: 5, top: 18),
                                                child:
                                                Transform.translate(
                                                  offset: const Offset(
                                                      -50, 0),
                                                  child: Stack(
                                                    clipBehavior:
                                                    Clip.none,
                                                    children: [
                                                      Positioned(
                                                          left: 5,
                                                          child: Transform
                                                              .translate(
                                                            offset:
                                                            const Offset(
                                                                15,
                                                                0),
                                                            child:
                                                            Container(
                                                              width: 32,
                                                              height: 32,
                                                              decoration:
                                                              BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    15),
                                                              ),
                                                              child: Center(
                                                                  child: Image
                                                                      .asset(
                                                                      'assets/avatar-8 1.png')),
                                                            ),
                                                          )),
                                                      Positioned(
                                                          child: Transform
                                                              .translate(
                                                            offset:
                                                            const Offset(
                                                                45, 0),
                                                            child: Container(
                                                              width: 32,
                                                              height: 32,
                                                              decoration:
                                                              BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    15),
                                                                color: const Color(
                                                                    0xffEEEEEE),
                                                              ),
                                                              child:
                                                              const Center(
                                                                  child:
                                                                  Text(
                                                                    '+8',
                                                                    style: TextStyle(
                                                                        color: Color(
                                                                            0xffE5646C),
                                                                        fontSize:
                                                                        14),
                                                                  )),
                                                            ),
                                                          )),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    top: 25, left: 8),
                                                child: Image.asset(
                                                  'assets/star2.png',
                                                  height: 16,
                                                  color: const Color(
                                                      0xff9DA2A7),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    top: 25, left: 8),
                                                child: Image.asset(
                                                  'assets/profile-add.png',
                                                  height: 16,
                                                ),
                                              ),
                                              Padding(
                                                  padding:
                                                  const EdgeInsets
                                                      .only(
                                                      top: 25,
                                                      left: 8),
                                                  child: Image.asset(
                                                    'assets/more.png',
                                                    height: 16,
                                                    color: const Color(
                                                        0xff9DA2A7),
                                                  )),
                                            ],
                                          ),
                                          for (int a = 0;
                                          a < dataa2.length;
                                          a++)
                                            TableRow(
                                              children: <Widget>[
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      top: 25, left: 8),
                                                  child: Text(
                                                    'Various versions have evolved over',
                                                    style: TextStyle(
                                                      fontFamily:
                                                      'InterRegular',
                                                      fontWeight:
                                                      FontWeight.w500,
                                                      fontSize: 14,
                                                      color: notifire
                                                          .getblackcolor,),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 18, left: 3),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        padding:
                                                        const EdgeInsets
                                                            .all(6),
                                                        decoration:
                                                        BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              16),
                                                          color: const Color(
                                                              0xffFAEBEC),
                                                        ),
                                                        child: const Center(
                                                            child: Text(
                                                                'Fix Bugs',
                                                                style:
                                                                TextStyle(
                                                                  color: Color(
                                                                      0xffE5646C),
                                                                  fontFamily:
                                                                  'InterRegular',
                                                                  fontSize:
                                                                  12,
                                                                ))),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 18, left: 3),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        padding:
                                                        const EdgeInsets
                                                            .all(6),
                                                        decoration:
                                                        BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              16),
                                                          color: notifire
                                                              .getbgcolor10,
                                                        ),
                                                        child: Row(
                                                          children: [
                                                            Image.asset(
                                                                'assets/tag-right.png',
                                                                height: 16,
                                                                color: const Color(
                                                                    0xff7DC066)),
                                                            const SizedBox(
                                                              width: 10,
                                                            ),
                                                            const Center(
                                                                child: Text(
                                                                    '21 days left',
                                                                    style:
                                                                    TextStyle(
                                                                      color:
                                                                      Color(
                                                                          0xff727880),
                                                                      fontFamily:
                                                                      'InterRegular',
                                                                      fontSize:
                                                                      12,
                                                                    ))),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 25, left: 8),
                                                  child: Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                          'assets/Link.svg',
                                                          height: 16,
                                                          color: const Color(
                                                              0xffC6C8CB)),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      const Text(
                                                        '6',
                                                        style: TextStyle(
                                                            fontFamily:
                                                            'InterRegular',
                                                            fontSize: 14,
                                                            color: Color(
                                                                0xffC6C8CB),
                                                            fontWeight:
                                                            FontWeight
                                                                .w600),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 25, left: 8),
                                                  child: Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                        'assets/messages-3.svg',
                                                        height: 16,
                                                        color: const Color(
                                                            0xffC6C8CB),
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      const Text(
                                                        '2',
                                                        style: TextStyle(
                                                            fontFamily:
                                                            'InterRegular',
                                                            fontSize: 14,
                                                            color: Color(
                                                                0xffC6C8CB),
                                                            fontWeight:
                                                            FontWeight
                                                                .w600),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      left: 5, top: 18),
                                                  child:
                                                  Transform.translate(
                                                    offset: const Offset(
                                                        -50, 0),
                                                    child: Stack(
                                                      clipBehavior:
                                                      Clip.none,
                                                      children: [
                                                        Positioned(
                                                            left: 5,
                                                            child: Transform
                                                                .translate(
                                                              offset:
                                                              const Offset(
                                                                  15,
                                                                  0),
                                                              child:
                                                              Container(
                                                                width: 32,
                                                                height: 32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      15),
                                                                ),
                                                                child: Center(
                                                                    child: Image
                                                                        .asset(
                                                                        'assets/avatar-8 1.png')),
                                                              ),
                                                            )),
                                                        Positioned(
                                                            child: Transform
                                                                .translate(
                                                              offset:
                                                              const Offset(
                                                                  45, 0),
                                                              child: Container(
                                                                width: 32,
                                                                height: 32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      15),
                                                                  color: const Color(
                                                                      0xffEEEEEE),
                                                                ),
                                                                child:
                                                                const Center(
                                                                    child:
                                                                    Text(
                                                                      '+8',
                                                                      style: TextStyle(
                                                                          color: Color(
                                                                              0xffE5646C),
                                                                          fontSize:
                                                                          14),
                                                                    )),
                                                              ),
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 25, left: 8),
                                                  child: Image.asset(
                                                    'assets/star2.png',
                                                    height: 16,
                                                    color: const Color(
                                                        0xff9DA2A7),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 25, left: 8),
                                                  child: Image.asset(
                                                    'assets/profile-add.png',
                                                    height: 16,
                                                  ),
                                                ),
                                                Padding(
                                                    padding:
                                                    const EdgeInsets
                                                        .only(
                                                        top: 25,
                                                        left: 8),
                                                    child: Image.asset(
                                                      'assets/more.png',
                                                      height: 16,
                                                      color: const Color(
                                                          0xff9DA2A7),
                                                    )),
                                              ],
                                            ),
                                          const TableRow(children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 10),
                                              child: Divider(
                                                height: 10,
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 10),
                                              child: Divider(
                                                height: 10,
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 10),
                                              child: Divider(
                                                height: 10,
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 10),
                                              child: Divider(
                                                height: 10,
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 10),
                                              child: Divider(
                                                height: 10,
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 10),
                                              child: Divider(
                                                height: 10,
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 10),
                                              child: Divider(
                                                height: 10,
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 10),
                                              child: Divider(
                                                height: 10,
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 10),
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
                            const SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () {
                                dataa2.add(0);
                                setState(() {});
                              },
                              child: Container(

                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(12),
                                  color: notifire.getbgcolor11,
                                ),
                                child: DottedBorder(
                                    borderType: BorderType.RRect,
                                    radius: const Radius.circular(12),
                                    color: const Color(0xffC6C8CB),
                                    padding: const EdgeInsets.all(12),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/add.png',
                                          height: 16,
                                          color: const Color(0xff727880),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Text(
                                          'Add Task',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'InterRegular',
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xff727880)),
                                        )
                                      ],
                                    )),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Archive',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'InterRegular',
                                      fontSize: 16, color:
                                  notifire.getblackcolor
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(12),
                                      color: notifire.getbgcolor11,
                                    ),
                                    child: const Text(
                                      '34',
                                      style: TextStyle(
                                          fontFamily: 'InterRegular',
                                          fontSize: 12,
                                          color: Color(0xff727880)),
                                    )),
                              ],
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
                                  borderRadius:
                                  BorderRadius.circular(15)),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: constraints < 1400
                                          ? 1500
                                          : Get.width,
                                      child: Table(
                                        border: TableBorder.all(
                                            color: Colors.transparent),
                                        columnWidths: const <int,
                                            TableColumnWidth>{
                                          0: FixedColumnWidth(250),
                                          1: FixedColumnWidth(100),
                                          2: FixedColumnWidth(100),
                                          3: FixedColumnWidth(100),
                                          4: FixedColumnWidth(100),
                                          5: FixedColumnWidth(50),
                                          6: FixedColumnWidth(50),
                                          7: FixedColumnWidth(50),
                                          8: FixedColumnWidth(50),
                                        },
                                        children: <TableRow>[
                                          TableRow(
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 25, left: 8),
                                                child: Text(
                                                  'repeat predefined as necessary',
                                                  style: TextStyle(
                                                      fontFamily:
                                                      'InterRegular',
                                                      fontWeight:
                                                      FontWeight.w500,
                                                      fontSize: 14,
                                                      color:
                                                      notifire.getblackcolor),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    top: 18, left: 3),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      padding:
                                                      const EdgeInsets
                                                          .all(6),
                                                      decoration:
                                                      BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            12),
                                                        color: const Color(
                                                            0xffEAF6FC),
                                                      ),
                                                      child: const Center(
                                                          child: Text(
                                                              'Research',
                                                              style:
                                                              TextStyle(
                                                                color: Color(
                                                                    0xff7DC066),
                                                                fontFamily:
                                                                'InterRegular',
                                                                fontSize:
                                                                12,
                                                              ))),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    top: 18, left: 3),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      padding:
                                                      const EdgeInsets
                                                          .all(6),
                                                      decoration:
                                                      BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            12),
                                                        color: notifire
                                                            .getbgcolor10,
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          Image.asset(
                                                              'assets/tag-right.png',
                                                              height: 16,
                                                              color: const Color(
                                                                  0xffF3935D)),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          const Center(
                                                              child: Text(
                                                                  '15 days left',
                                                                  style:
                                                                  TextStyle(
                                                                    color:
                                                                    Color(
                                                                        0xff727880),
                                                                    fontFamily:
                                                                    'InterRegular',
                                                                    fontSize:
                                                                    12,
                                                                  ))),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    top: 25, left: 8),
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                        'assets/Link.svg',
                                                        height: 16,
                                                        color: const Color(
                                                            0xffC6C8CB)),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    const Text(
                                                      '2',
                                                      style: TextStyle(
                                                          fontFamily:
                                                          'InterRegular',
                                                          fontSize: 14,
                                                          color: Color(
                                                              0xffC6C8CB),
                                                          fontWeight:
                                                          FontWeight
                                                              .w600),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    top: 25, left: 8),
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/messages-3.svg',
                                                      height: 16,
                                                      color: const Color(
                                                          0xffC6C8CB),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    const Text(
                                                      '6',
                                                      style: TextStyle(
                                                          fontFamily:
                                                          'InterRegular',
                                                          fontSize: 14,
                                                          color: Color(
                                                              0xffC6C8CB),
                                                          fontWeight:
                                                          FontWeight
                                                              .w600),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    left: 5, top: 18),
                                                child:
                                                Transform.translate(
                                                  offset:
                                                  const Offset(0, 0),
                                                  child: Stack(
                                                    clipBehavior:
                                                    Clip.none,
                                                    children: [
                                                      Transform.translate(
                                                        offset:
                                                        const Offset(
                                                            -30, 0),
                                                        child: Container(
                                                          width: 32,
                                                          height: 32,
                                                          decoration:
                                                          BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                15),
                                                          ),
                                                          child: Center(
                                                              child: Image
                                                                  .asset(
                                                                  'assets/avatar-6 1.png')),
                                                        ),
                                                      ),
                                                      Positioned(
                                                          left: -10,
                                                          child: Transform
                                                              .translate(
                                                            offset:
                                                            const Offset(
                                                                5, 0),
                                                            child:
                                                            Container(
                                                              width: 32,
                                                              height: 32,
                                                              decoration:
                                                              BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    15),
                                                              ),
                                                              child: Center(
                                                                  child: Image
                                                                      .asset(
                                                                      'assets/avatar-7 1.png')),
                                                            ),
                                                          )),
                                                      Positioned(
                                                          left: 5,
                                                          child: Transform
                                                              .translate(
                                                            offset:
                                                            const Offset(
                                                                15,
                                                                0),
                                                            child:
                                                            Container(
                                                              width: 32,
                                                              height: 32,
                                                              decoration:
                                                              BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    15),
                                                              ),
                                                              child: Center(
                                                                  child: Image
                                                                      .asset(
                                                                      'assets/avatar-8 1.png')),
                                                            ),
                                                          )),
                                                      Positioned(
                                                          child: Transform
                                                              .translate(
                                                            offset:
                                                            const Offset(
                                                                45, 0),
                                                            child: Container(
                                                              width: 32,
                                                              height: 32,
                                                              decoration:
                                                              BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    15),
                                                                color: const Color(
                                                                    0xffEEEEEE),
                                                              ),
                                                              child:
                                                              const Center(
                                                                  child:
                                                                  Text(
                                                                    '+5',
                                                                    style: TextStyle(
                                                                        color: Color(
                                                                            0xffE5646C),
                                                                        fontSize:
                                                                        14),
                                                                  )),
                                                            ),
                                                          )),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    top: 25, left: 8),
                                                child: Image.asset(
                                                  'assets/star2.png',
                                                  height: 16,
                                                  color: const Color(
                                                      0xff9DA2A7),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    top: 25, left: 8),
                                                child: Image.asset(
                                                  'assets/profile-add.png',
                                                  height: 16,
                                                ),
                                              ),
                                              Padding(
                                                  padding:
                                                  const EdgeInsets
                                                      .only(
                                                      top: 25,
                                                      left: 8),
                                                  child: Image.asset(
                                                    'assets/more.png',
                                                    height: 16,
                                                    color: const Color(
                                                        0xff9DA2A7),
                                                  )),
                                            ],
                                          ),
                                          TableRow(
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 25, left: 8),
                                                child: Text(
                                                  'Various versions have evolved over',
                                                  style: TextStyle(
                                                      fontFamily:
                                                      'InterRegular',
                                                      fontWeight:
                                                      FontWeight.w500,
                                                      fontSize: 14,
                                                      color:
                                                      notifire.getblackcolor),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    top: 18, left: 3),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      padding:
                                                      const EdgeInsets
                                                          .all(6),
                                                      decoration:
                                                      BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            12),
                                                        color: const Color(
                                                            0xffEAF6FC),
                                                      ),
                                                      child: const Center(
                                                          child: Text(
                                                              'New Feature',
                                                              style:
                                                              TextStyle(
                                                                color: Color(
                                                                    0xff59B4D1),
                                                                fontFamily:
                                                                'InterRegular',
                                                                fontSize:
                                                                12,
                                                              ))),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    top: 18, left: 3),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      padding:
                                                      const EdgeInsets
                                                          .all(6),
                                                      decoration:
                                                      BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            12),
                                                        color: notifire
                                                            .getbgcolor10,
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          Image.asset(
                                                              'assets/tag-right.png',
                                                              height: 16,
                                                              color: const Color(
                                                                  0xff7DC066)),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          const Center(
                                                              child: Text(
                                                                  '21 days left',
                                                                  style:
                                                                  TextStyle(
                                                                    color:
                                                                    Color(
                                                                        0xff727880),
                                                                    fontFamily:
                                                                    'InterRegular',
                                                                    fontSize:
                                                                    12,
                                                                  ))),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    top: 25, left: 8),
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                        'assets/Link.svg',
                                                        height: 16,
                                                        color: const Color(
                                                            0xffC6C8CB)),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    const Text(
                                                      '6',
                                                      style: TextStyle(
                                                          fontFamily:
                                                          'InterRegular',
                                                          fontSize: 14,
                                                          color: Color(
                                                              0xffC6C8CB),
                                                          fontWeight:
                                                          FontWeight
                                                              .w600),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    top: 25, left: 8),
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/messages-3.svg',
                                                      height: 16,
                                                      color: const Color(
                                                          0xffC6C8CB),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    const Text(
                                                      '2',
                                                      style: TextStyle(
                                                          fontFamily:
                                                          'InterRegular',
                                                          fontSize: 14,
                                                          color: Color(
                                                              0xffC6C8CB),
                                                          fontWeight:
                                                          FontWeight
                                                              .w600),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    left: 5, top: 18),
                                                child:
                                                Transform.translate(
                                                  offset: const Offset(
                                                      -50, 0),
                                                  child: Stack(
                                                    clipBehavior:
                                                    Clip.none,
                                                    children: [
                                                      Positioned(
                                                          left: 5,
                                                          child: Transform
                                                              .translate(
                                                            offset:
                                                            const Offset(
                                                                15,
                                                                0),
                                                            child:
                                                            Container(
                                                              width: 32,
                                                              height: 32,
                                                              decoration:
                                                              BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    15),
                                                              ),
                                                              child: Center(
                                                                  child: Image
                                                                      .asset(
                                                                      'assets/avatar-8 1.png')),
                                                            ),
                                                          )),
                                                      Positioned(
                                                          child: Transform
                                                              .translate(
                                                            offset:
                                                            const Offset(
                                                                45, 0),
                                                            child: Container(
                                                              width: 32,
                                                              height: 32,
                                                              decoration:
                                                              BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    15),
                                                                color: const Color(
                                                                    0xffEEEEEE),
                                                              ),
                                                              child:
                                                              const Center(
                                                                  child:
                                                                  Text(
                                                                    '+16',
                                                                    style: TextStyle(
                                                                        color: Color(
                                                                            0xffE5646C),
                                                                        fontSize:
                                                                        14),
                                                                  )),
                                                            ),
                                                          )),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    top: 25, left: 8),
                                                child: Image.asset(
                                                  'assets/star2.png',
                                                  height: 16,
                                                  color: const Color(
                                                      0xff9DA2A7),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    top: 25, left: 8),
                                                child: Image.asset(
                                                  'assets/profile-add.png',
                                                  height: 16,
                                                ),
                                              ),
                                              Padding(
                                                  padding:
                                                  const EdgeInsets
                                                      .only(
                                                      top: 25,
                                                      left: 8),
                                                  child: Image.asset(
                                                    'assets/more.png',
                                                    height: 16,
                                                    color: const Color(
                                                        0xff9DA2A7),
                                                  )),
                                            ],
                                          ),
                                          for (int a = 0;
                                          a < dataa1.length;
                                          a++)
                                            TableRow(
                                              children: <Widget>[
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 25,
                                                      left: 8),
                                                  child: Text(
                                                    'Various versions have evolved over',
                                                    style: TextStyle(
                                                        fontFamily:
                                                        'InterRegular',
                                                        fontWeight:
                                                        FontWeight
                                                            .w500,
                                                        fontSize: 14,
                                                        color:
                                                        notifire.getblackcolor),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets
                                                      .only(
                                                      top: 18,
                                                      left: 3),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        padding:
                                                        const EdgeInsets
                                                            .all(6),
                                                        decoration:
                                                        BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              12),
                                                          color: const Color(
                                                              0xffFAEBEC),
                                                        ),
                                                        child:
                                                        const Center(
                                                            child: Text(
                                                                'Fix Bugs',
                                                                style:
                                                                TextStyle(
                                                                  color:
                                                                  Color(
                                                                      0xffE5646C),
                                                                  fontFamily:
                                                                  'InterRegular',
                                                                  fontSize:
                                                                  12,
                                                                ))),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets
                                                      .only(
                                                      top: 18,
                                                      left: 3),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        padding:
                                                        const EdgeInsets
                                                            .all(6),
                                                        decoration:
                                                        BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              12),
                                                          color: notifire
                                                              .getbgcolor10,
                                                        ),
                                                        child: Row(
                                                          children: [
                                                            Image.asset(
                                                                'assets/tag-right.png',
                                                                height:
                                                                16,
                                                                color: const Color(
                                                                    0xff7DC066)),
                                                            const SizedBox(
                                                              width: 10,
                                                            ),
                                                            const Center(
                                                                child: Text(
                                                                    '21 days left',
                                                                    style:
                                                                    TextStyle(
                                                                      color:
                                                                      Color(
                                                                          0xff727880),
                                                                      fontFamily:
                                                                      'InterRegular',
                                                                      fontSize:
                                                                      12,
                                                                    ))),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets
                                                      .only(
                                                      top: 25,
                                                      left: 8),
                                                  child: Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                          'assets/Link.svg',
                                                          height: 16,
                                                          color: const Color(
                                                              0xffC6C8CB)),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      const Text(
                                                        '6',
                                                        style: TextStyle(
                                                            fontFamily:
                                                            'InterRegular',
                                                            fontSize: 14,
                                                            color: Color(
                                                                0xffC6C8CB),
                                                            fontWeight:
                                                            FontWeight
                                                                .w600),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets
                                                      .only(
                                                      top: 25,
                                                      left: 8),
                                                  child: Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                        'assets/messages-3.svg',
                                                        height: 16,
                                                        color: const Color(
                                                            0xffC6C8CB),
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      const Text(
                                                        '2',
                                                        style: TextStyle(
                                                            fontFamily:
                                                            'InterRegular',
                                                            fontSize: 14,
                                                            color: Color(
                                                                0xffC6C8CB),
                                                            fontWeight:
                                                            FontWeight
                                                                .w600),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets
                                                      .only(
                                                      left: 5,
                                                      top: 18),
                                                  child:
                                                  Transform.translate(
                                                    offset: const Offset(
                                                        -50, 0),
                                                    child: Stack(
                                                      clipBehavior:
                                                      Clip.none,
                                                      children: [
                                                        Positioned(
                                                            left: 5,
                                                            child: Transform
                                                                .translate(
                                                              offset:
                                                              const Offset(
                                                                  15,
                                                                  0),
                                                              child:
                                                              Container(
                                                                width: 32,
                                                                height:
                                                                32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      15),
                                                                ),
                                                                child: Center(
                                                                    child:
                                                                    Image.asset(
                                                                        'assets/avatar-8 1.png')),
                                                              ),
                                                            )),
                                                        Positioned(
                                                            child: Transform
                                                                .translate(
                                                              offset:
                                                              const Offset(
                                                                  45, 0),
                                                              child:
                                                              Container(
                                                                width: 32,
                                                                height: 32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      15),
                                                                  color: const Color(
                                                                      0xffEEEEEE),
                                                                ),
                                                                child:
                                                                const Center(
                                                                    child:
                                                                    Text(
                                                                      '+8',
                                                                      style: TextStyle(
                                                                          color: Color(
                                                                              0xffE5646C),
                                                                          fontSize:
                                                                          14),
                                                                    )),
                                                              ),
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets
                                                      .only(
                                                      top: 25,
                                                      left: 8),
                                                  child: Image.asset(
                                                    'assets/star2.png',
                                                    height: 16,
                                                    color: const Color(
                                                        0xff9DA2A7),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets
                                                      .only(
                                                      top: 25,
                                                      left: 8),
                                                  child: Image.asset(
                                                    'assets/profile-add.png',
                                                    height: 16,
                                                  ),
                                                ),
                                                Padding(
                                                    padding:
                                                    const EdgeInsets
                                                        .only(
                                                        top: 25,
                                                        left: 8),
                                                    child: Image.asset(
                                                      'assets/more.png',
                                                      height: 16,
                                                      color: const Color(
                                                          0xff9DA2A7),
                                                    )),
                                              ],
                                            ),
                                          const TableRow(children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 10),
                                              child: Divider(
                                                height: 10,
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 10),
                                              child: Divider(
                                                height: 10,
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 10),
                                              child: Divider(
                                                height: 10,
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 10),
                                              child: Divider(
                                                height: 10,
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 10),
                                              child: Divider(
                                                height: 10,
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 10),
                                              child: Divider(
                                                height: 10,
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 10),
                                              child: Divider(
                                                height: 10,
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 10),
                                              child: Divider(
                                                height: 10,
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 10),
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
                            const SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () {
                                dataa1.add(0);
                                setState(() {});
                              },
                              child: Container(

                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(12),
                                  color: notifire.getbgcolor11,
                                ),
                                child: DottedBorder(
                                    borderType: BorderType.RRect,
                                    radius: const Radius.circular(12),
                                    color: const Color(0xffC6C8CB),
                                    padding: const EdgeInsets.all(12),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/add.png',
                                          height: 16,
                                          color: const Color(0xff727880),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Text(
                                          'Add Task',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'InterRegular',
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xff727880)),
                                        )
                                      ],
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ])),
      ],
    );
  }

  TableRow dividerTable(BuildContext context) {
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


