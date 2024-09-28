// ignore_for_file: prefer_const_constructors, file_names, camel_case_types, non_constant_identifier_names

import '../login/login.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:evcp/controller/page_controller.dart';

import '../../confing/Rtl.dart';
import '../../confing/colors.dart';
// ignore_for_file: deprecated_member_use

import '../../confing/list.dart';
import '../../confing/notifier.dart';
import '../Dashboard/Dashboard_main.dart';


import 'Social.dart';

class Teamwork extends StatefulWidget {
  const Teamwork({super.key});

  @override
  State<Teamwork> createState() => _TeamworkState();
}

class _TeamworkState extends State<Teamwork> {
  ColorNotifier notifier = ColorNotifier();
  SampleItem? selectedMenu;
  bool profilePage = false;
  List checkBox = [];
  int selectIndex = 0;
  int selectIndex1 = 0;
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
  List Channels = [
    'Marketing Team',
    'Developers Team',
    'General',
    'Notification',
  ];
  List Notification = [
    'assets/hashtag.png',
    'assets/hashtag.png',
    'assets/hashtag.png',
    'assets/hashtag.png',
  ];

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    return GetBuilder<InboxController>(
      builder: (inboxController) {
        return LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 600) {
              return Theme(
                data: Theme.of(context).copyWith(
                    scrollbarTheme: const ScrollbarThemeData(
                        thumbVisibility: MaterialStatePropertyAll(false),
                        trackVisibility: MaterialStatePropertyAll(false),
                        thickness: MaterialStatePropertyAll(0),
                        thumbColor: MaterialStatePropertyAll(
                          Color(0xff883DCF),
                        ))),
                child:  SingleChildScrollView(
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
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
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
  bool isdark = false;
  bool container = false;
  bool containe = false;
  bool Compose = false;
  InboxController inboxController = Get.put(InboxController());
  Widget firstContainer({required double size, context})  {
    return Padding(
      padding: const EdgeInsets.only(right: 20,left: 20,bottom: 20),
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
              Text('Messages',style: TextStyle(color: greyy,fontSize: 14,fontFamily: 'InterRegular'),),
              const SizedBox(width: 10,),
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: greyy,),),
              const SizedBox(width: 10,),
              Text('Teamwork',style: TextStyle(color: notifier.getblackcolor,fontSize: 14,fontFamily: 'InterRegular'),),
            ],
          ),
          const SizedBox(height: 20,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: container ? container2(size) : container1(context, size),
              ),
              const SizedBox(width: 10,),
              size < 600 ? const SizedBox()
                  : Expanded(
                      flex: 6,
                      child: Compose ? container3(size) : container2(size),
                    ),
              const SizedBox(width: 10,),
              profilePage ? Expanded(flex: 2, child: container4(size)) : const SizedBox(),
            ],
          ),
        ],
      ),
    );
  }

  Widget container1(context, double size) {
    return GetBuilder<InboxController>(
      builder: (controller) {
        return size < 700
            ? Container(
                decoration:  BoxDecoration(
                  color: notifier.getbgcolor11,

                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
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
                            Text('Messages',style: TextStyle(color: greyy,fontSize: 14,fontFamily: 'InterRegular'),),
                            const SizedBox(width: 10,),
                            Container(
                              width: 6,
                              height: 6,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: greyy,),),
                            const SizedBox(width: 10,),
                            Text('Teamwork',style: TextStyle(color: notifier.getblackcolor,fontSize: 14,fontFamily: 'InterRegular'),),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          children: [
                            Text(
                              'Messages',
                              style: TextStyle(
                                  fontFamily: 'InterRegular',
                                  fontSize: 18,color: notifier.getblackcolor,
                                  fontWeight: FontWeight.w500),
                            ),
                            const Spacer(),
                            Image.asset(
                              'assets/search-normal.png',
                              height: 16,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: 32,
                                width: 32,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color(0xff595FE5)),
                                child: Center(
                                    child: Image.asset(
                                      'assets/edit-2.png',
                                      color: Colors.white,
                                      height: 15,
                                    )),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
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
                          title: Text(
                            'Channels',
                            style: TextStyle(
                                fontFamily: 'InterRegular',
                                fontSize: 15,
                                color: notifier.getblackcolor),
                          ),
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: 4,physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () => Navigator.push(
                                    context,
                                   MaterialPageRoute(builder: (context) => container3(size),)
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color:  selectIndex1 == index ?
                                        notifier.Getblg2 :
                                        notifier.getbgcolor11,
                                        border: Border(
                                            right: BorderSide(
                                                color: selectIndex1 == index
                                                    ? const Color(0xff595FE5)
                                                    : notifier.getbgcolor11,
                                                width: 2))),
                                    child: ListTile(
                                      leading: Image.asset(
                                        Notification[index],
                                        height: 16,
                                        color: selectIndex1 == index
                                            ? notifier.getblackcolor
                                            : const Color(0xff9DA2A7),
                                      ),
                                      title: Text(Channels[index],
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: selectIndex1 == index
                                                  ? notifier.getblackcolor
                                                  : const Color(0xff727880))),
                                      trailing: Column(
                                        children: [
                                          index == 2
                                              ? Transform.translate(
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
                                                    child: const Center(
                                                        child: Text('4',
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'InterRegular',
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 10))),
                                                  ),
                                                )
                                              : const SizedBox(),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ExpansionTile(
                          initiallyExpanded: true,
                          controlAffinity: ListTileControlAffinity.platform,
                          tilePadding: EdgeInsets.zero,
                          title:  Text(
                            'Messages',
                            style: TextStyle(
                                fontFamily: 'InterRegular',
                                fontSize: 15,
                                color: notifier.getblackcolor),
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
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => container2(size)),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color:  selectIndex1 == index ?
                                        notifier.Getblg2 :
                                        notifier.getbgcolor11,
                                        border: Border(
                                            right: BorderSide(
                                                color: selectIndex == index
                                                    ? const Color(0xff595FE5)
                                                    : notifier.getbgcolor11,
                                                width: 2))),
                                    child: ListTile(
                                      leading: Image.asset(data.image,
                                          height: 40, width: 40),
                                      title: Text(data.title,
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: selectIndex == index
                                                  ? notifier.getblackcolor
                                                  : const Color(0xff727880))),
                                      trailing: Column(
                                        children: [
                                          index == 1
                                              ? Transform.translate(
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
                                                    child: const Center(
                                                        child: Text('4',
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'InterRegular',
                                                                color: Colors
                                                                    .white,
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
                                                      color: const Color(
                                                          0xffE5646C),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                    child: const Center(
                                                        child: Text('3',
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'InterRegular',
                                                                color: Colors
                                                                    .white,
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
                                                      color: const Color(
                                                          0xffE5646C),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                    child: const Center(
                                                        child: Text('26',
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'InterRegular',
                                                                color: Colors
                                                                    .white,
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
                                                      color: const Color(
                                                          0xffE5646C),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                    child: const Center(
                                                        child: Text('70',
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'InterRegular',
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 10))),
                                                  ),
                                                )
                                              : const SizedBox(),
                                        ],
                                      ),
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
              )
            : Container(
                height: MediaQuery.of(context).size.height,
                decoration:  BoxDecoration(
                  color: notifier.getbgcolor11,
borderRadius: 
              BorderRadius.circular(12)  ),
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
                                  fontSize: 18,color: notifier.getblackcolor,
                                  fontWeight: FontWeight.w500),
                            ),
                            const Spacer(),
                            Image.asset(
                              'assets/search-normal.png',
                              height: 16,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: 32,
                                width: 32,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color(0xff595FE5)),
                                child: Center(
                                    child: Image.asset(
                                  'assets/edit-2.png',
                                  color: Colors.white,
                                  height: 15,
                                )),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
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
                          title:  Text(
                            'Channels',
                            style: TextStyle(
                                fontFamily: 'InterRegular',
                                fontSize: 15,
                                color: notifier.getblackcolor,),
                          ),
                          children: [
                            InkWell(
                              onTap: () {

                              },
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: 4,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        if (Compose == true) {
                                          Compose = false;
                                        } else {
                                          Compose = true;
                                        }
                                        selectIndex = index;

                                      });
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(

                                          color:
                                          selectIndex == index ?
                                          notifier.Getblg2 :
                                          notifier.getbgcolor11,
                                          border: Border(
                                              right: BorderSide(
                                                  color: selectIndex == index
                                                      ? const Color(0xff595FE5)
                                                      : notifier.getbgcolor11,
                                                  width: 2))),
                                      child:  Row(
                                        children: [
                                          Image.asset(
                                            Notification[index],
                                            height: 16,
                                            color: selectIndex == index
                                                ? notifier.getblackcolor
                                                : const Color(0xff9DA2A7),
                                          ),
                                          const SizedBox(width: 10,),
                                          Text(Channels[index],
                                              style: TextStyle(
                                                  fontFamily: 'InterRegular',
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: selectIndex == index
                                                      ? notifier.getblackcolor
                                                      : const Color(0xff727880))),
                                          const Spacer(),
                                          Column(
                                            children: [
                                              index == 2
                                                  ? Container(
                                                    width: 18,
                                                    height: 18,
                                                    decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xffE5646C),
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          15),
                                                    ),
                                                    child: const Center(
                                                        child: Text('4',
                                                            style: TextStyle(
                                                                fontFamily:
                                                                'InterRegular',
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 10))),
                                                  )
                                                  : const SizedBox(),
                                            ],
                                          ),
                                        ],
                                      ),

                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ExpansionTile(
                          initiallyExpanded: true,
                          controlAffinity: ListTileControlAffinity.platform,
                          tilePadding: EdgeInsets.zero,
                          title:  Text(
                            'Messages',
                            style: TextStyle(
                                fontFamily: 'InterRegular',
                                fontSize: 15,

                                color: notifier.getblackcolor,),
                          ),
                          trailing: const Icon(
                            Icons.add,
                            size: 20,
                            color: Color(0xff727880),
                          ),
                          children: [
                            InkWell(
                              onTap: () {

                              },
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: chatList.length,
                                itemBuilder: (context, index) {
                                  ChatList data = chatList[index];
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectIndex1 = index;
                                      });
                                    },
                                    child: Container(
                                        padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          color:  selectIndex1 == index ?
                                          notifier.Getblg2 :
                                          notifier.getbgcolor11,
                                          border: Border(
                                              right: BorderSide(
                                                  color: selectIndex1 == index
                                                      ? const Color(0xff595FE5)
                                                      : notifier.getbgcolor11,
                                                  width: 2))),
                                      child:
                                      Row(
                                        children: [
                                          Image.asset(data.image,
                                              height: 40, width: 40),
                                          const SizedBox(width: 10,),
                                          Text(data.title,
                                              style: TextStyle(
                                                  fontFamily: 'InterRegular',
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: selectIndex1 == index
                                                      ? notifier.getblackcolor
                                                      : const Color(0xff727880))),
                                          const Spacer(),
                                          Column(
                                            children: [
                                              index == 1
                                                  ? Container(
                                                    width: 18,
                                                    height: 18,
                                                    decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xffE5646C),
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          15),
                                                    ),
                                                    child: const Center(
                                                        child: Text('4',
                                                            style: TextStyle(
                                                                fontFamily:
                                                                'InterRegular',
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 10))),
                                                  )
                                                  : const SizedBox(),
                                              if (index == 4) Container(
                                                width: 18,
                                                height: 18,
                                                decoration: BoxDecoration(
                                                  color: const Color(
                                                      0xffE5646C),
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      15),
                                                ),
                                                child: const Center(
                                                    child: Text('3',
                                                        style: TextStyle(
                                                            fontFamily:
                                                            'InterRegular',
                                                            color: Colors
                                                                .white,
                                                            fontSize: 10))),
                                              ) else const SizedBox(),
                                              index == 7
                                                  ? Container(
                                                    width: 18,
                                                    height: 18,
                                                    decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xffE5646C),
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          15),
                                                    ),
                                                    child: const Center(
                                                        child: Text('26',
                                                            style: TextStyle(
                                                                fontFamily:
                                                                'InterRegular',
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 10))),
                                                  )
                                                  : const SizedBox(),
                                              index == 12
                                                  ? Container(
                                                    width: 18,
                                                    height: 18,
                                                    decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xffE5646C),
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          15),
                                                    ),
                                                    child: const Center(
                                                        child: Text('70',
                                                            style: TextStyle(
                                                                fontFamily:
                                                                'InterRegular',
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 10))),
                                                  )
                                                  : const SizedBox(),
                                            ],
                                          ),
                                        ],
                                      ),


                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
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
    return size < 700
        ? SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: notifier.getbgcolor11,
                elevation: 0,
                title: Row(
                  children: [
                    InkWell(
                        onTap: () {},
                        child: Image.asset('assets/video.png',
                            height: 18, color: const Color(0xff9DA2A7))),
                    const SizedBox(
                      width: 20,
                    ),
                    InkWell(
                        onTap: () {},
                        child: Image.asset('assets/call.png',
                            height: 18, color: const Color(0xff9DA2A7))),
                    const SizedBox(
                      width: 20,
                    ),
                    InkWell(
                        onTap: () {},
                        child: Image.asset('assets/more-circle.png',
                            height: 18, color: const Color(0xff9DA2A7))),
                  ],
                ),
                actions: [
                  SizedBox(
                    width: 32,
                      height: 32,

                      child: Image.asset('assets/Avatar2.png', height: 32)),
                  const SizedBox(width: 10,),
                ],
                automaticallyImplyLeading: false,
                
              ),
              backgroundColor:  notifier.getbgcolor10,
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
                        child:  Padding(
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
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        child: Center(
                                            child:
                                            Image.asset('assets/Avatar61.png')),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        height: 40,
                                        decoration:  BoxDecoration(
                                            color: notifier.getbgcolor11,
                                            borderRadius: const BorderRadius.only(
                                                bottomLeft: Radius.circular(12),
                                                bottomRight: Radius.circular(12),
                                                topRight: Radius.circular(12))),
                                        child:  Row(
                                          children: [
                                            Text('I hope it goes well.',
                                                style: TextStyle(color: notifier.getblackcolor,
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
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        child: Image.asset('assets/Avatar61.png'),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration:  BoxDecoration(
                                            color: notifier.getbgcolor11,
                                            borderRadius: const BorderRadius.only(
                                                bottomLeft: Radius.circular(12),
                                                bottomRight: Radius.circular(12),
                                                topRight: Radius.circular(12))),
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
                                                style: TextStyle(color: notifier.getblackcolor,
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
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 20),
                                          Container(
                                            padding: const EdgeInsets.all(10),
                                            height: 40,
                                            decoration:  BoxDecoration(
                                                color: notifier.getbgcolor11,
                                                borderRadius: const BorderRadius.only(
                                                    bottomLeft: Radius.circular(10),
                                                    bottomRight: Radius.circular(10),
                                                    topRight: Radius.circular(10))),
                                            child:  Row(
                                              children: [
                                                Text('Hey bro!',
                                                    style: TextStyle(color: notifier.getblackcolor,
                                                      fontFamily: 'InterRegular',
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
                                                      fontFamily: 'InterRegular',
                                                      color: Color(0xff9DA2A7))),
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
                                                bottomRight: Radius.circular(12),
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
                                                bottomRight: Radius.circular(12),
                                                topLeft: Radius.circular(12))),
                                        child: const Text('I be there in 2 mins',
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
                                                  bottomRight: Radius.circular(12),
                                                  topLeft: Radius.circular(12))),
                                          child: Row(
                                            children: [
                                              Image.asset('assets/Voice.png',
                                                  height: 20),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              InkWell(
                                                onTap: () {

                                                },
                                                child: Image.asset('assets/play-circle.png',
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
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        child: Center(
                                            child:
                                            Image.asset('assets/Avatar61.png')),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        height: 40,
                                        decoration:  BoxDecoration(
                                            color: notifier.getbgcolor11,
                                            borderRadius: const BorderRadius.only(
                                                bottomLeft: Radius.circular(10),
                                                bottomRight: Radius.circular(10),
                                                topRight: Radius.circular(10))),
                                        child:  Row(
                                          children: [
                                            Text('I hope it goes well.',
                                                style: TextStyle(
                                                    fontFamily: 'InterRegular',color: notifier.getblackcolor
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
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        child: Center(
                                            child:
                                            Image.asset('assets/Avatar61.png')),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(12),
                                        decoration:  BoxDecoration(
                                            color: notifier.getbgcolor11,
                                            borderRadius: const BorderRadius.only(
                                                bottomLeft: Radius.circular(12),
                                                bottomRight: Radius.circular(12),
                                                topRight: Radius.circular(12))),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text('Haha oh man',

                                                style: TextStyle(color: notifier.getblackcolor,
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
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        child: Center(
                                            child:
                                            Image.asset('assets/Avatar61.png')),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        height: 40,
                                        decoration:  BoxDecoration(
                                            color: notifier.getbgcolor11,
                                            borderRadius: const BorderRadius.only(
                                                bottomLeft: Radius.circular(10),
                                                bottomRight: Radius.circular(10),
                                                topRight: Radius.circular(10))),
                                        child:  Row(
                                          children: [
                                            Text('I hope it goes well.',
                                                style: TextStyle(
                                                    fontFamily: 'InterRegular',color: notifier.getblackcolor
                                                )),
                                          ],
                                        ),
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
                                                bottomRight: Radius.circular(12),
                                                topLeft: Radius.circular(12))),
                                        child:  const Text('I went there yesterday',
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
                                                bottomRight: Radius.circular(12),
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
                  decoration:  BoxDecoration(
                    color: notifier.getbgcolor11,
                    border: const Border(),
                  ),
                  child: Row(
                    children: <Widget>[
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border:
                                  Border.all(color: notifier.Getblg2)),
                          child: const Center(
                              child: Icon(
                            Icons.add,
                            size: 20,
                            color: Color(0xff727880),
                          )),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 40,
                          child: TextField(
                            style: const TextStyle(
                              fontSize: 15,
                              fontFamily: "PublicSansRegular",
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              hintText: "Write messages ...",
                              hintStyle: const TextStyle(
                                fontSize: 15,
                                fontFamily: "PublicSansRegular",
                                fontWeight: FontWeight.w400,
                                color: Color(0xffC6C8CB),
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
                              borderRadius: BorderRadius.circular(12),
                              border:
                                  Border.all(color: notifier.Getblg2)),
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
                          child: Container(
                            height: 40,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: const Color(0xff595FE5)),
                            child: const Center(
                                child: Text('Send',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'InterRegular'))),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          )
        : SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Scaffold(
              appBar: AppBar(
                  shape: const ContinuousRectangleBorder(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                ),
                backgroundColor: notifier.getbgcolor11,
                elevation: 0,
                flexibleSpace: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: 80,
                  decoration:  BoxDecoration(
                    color: notifier.getbgcolor11,
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Row(
                      children: [
                        InkWell(
                            onTap: () {},
                            child: Image.asset('assets/video.png',
                                height: 18, color: const Color(0xff9DA2A7))),
                        const SizedBox(
                          width: 20,
                        ),
                        InkWell(
                            onTap: () {},
                            child: Image.asset('assets/call.png',
                                height: 18, color: const Color(0xff9DA2A7))),
                        const SizedBox(
                          width: 20,
                        ),
                        InkWell(
                            onTap: () {},
                            child: Image.asset('assets/more-circle.png',
                                height: 18, color: const Color(0xff9DA2A7))),
                      ],
                    ),
                    trailing: Image.asset('assets/Avatar2.png', height: 32),
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
                        child:  Padding(
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
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        child: Center(
                                            child:
                                            Image.asset('assets/Avatar61.png')),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        height: 40,
                                        decoration:  BoxDecoration(
                                            color: notifier.getbgcolor11,
                                            borderRadius: const BorderRadius.only(
                                                bottomLeft: Radius.circular(12),
                                                bottomRight: Radius.circular(12),
                                                topRight: Radius.circular(12))),
                                        child:  Row(
                                          children: [
                                            Text('I hope it goes well.',
                                                style: TextStyle(color: notifier.getblackcolor,
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
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        child: Image.asset('assets/Avatar61.png'),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration:  BoxDecoration(
                                            color: notifier.getbgcolor11,
                                            borderRadius: const BorderRadius.only(
                                                bottomLeft: Radius.circular(12),
                                                bottomRight: Radius.circular(12),
                                                topRight: Radius.circular(12))),
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
                                                style: TextStyle(color: notifier.getblackcolor,
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
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 20),
                                          Container(
                                            padding: const EdgeInsets.all(10),
                                            height: 40,
                                            decoration:  BoxDecoration(
                                                color: notifier.getbgcolor11,
                                                borderRadius: const BorderRadius.only(
                                                    bottomLeft: Radius.circular(10),
                                                    bottomRight: Radius.circular(10),
                                                    topRight: Radius.circular(10))),
                                            child:  Row(
                                              children: [
                                                Text('Hey bro!',
                                                    style: TextStyle(color: notifier.getblackcolor,
                                                      fontFamily: 'InterRegular',
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
                                                      fontFamily: 'InterRegular',
                                                      color: Color(0xff9DA2A7))),
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
                                                bottomRight: Radius.circular(12),
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
                                                bottomRight: Radius.circular(12),
                                                topLeft: Radius.circular(12))),
                                        child: const Text('I be there in 2 mins',
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
                                                  bottomRight: Radius.circular(12),
                                                  topLeft: Radius.circular(12))),
                                          child: Row(
                                            children: [
                                              Image.asset('assets/Voice.png',
                                                  height: 20),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              InkWell(
                                                onTap: () {

                                                },
                                                child: Image.asset('assets/play-circle.png',
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
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        child: Center(
                                            child:
                                            Image.asset('assets/Avatar61.png')),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        height: 40,
                                        decoration:  BoxDecoration(
                                            color: notifier.getbgcolor11,
                                            borderRadius: const BorderRadius.only(
                                                bottomLeft: Radius.circular(10),
                                                bottomRight: Radius.circular(10),
                                                topRight: Radius.circular(10))),
                                        child:  Row(
                                          children: [
                                            Text('I hope it goes well.',
                                                style: TextStyle(
                                                    fontFamily: 'InterRegular',color: notifier.getblackcolor
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
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        child: Center(
                                            child:
                                            Image.asset('assets/Avatar61.png')),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(12),
                                        decoration:  BoxDecoration(
                                            color: notifier.getbgcolor11,
                                            borderRadius: const BorderRadius.only(
                                                bottomLeft: Radius.circular(12),
                                                bottomRight: Radius.circular(12),
                                                topRight: Radius.circular(12))),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text('Haha oh man',

                                                style: TextStyle(color: notifier.getblackcolor,
                                                  fontFamily: 'InterRegular',
                                                )),
                                            InkWell(
                                              onTap: () {
                                              },
                                              child: DottedBorder(
                                                color: const Color(0xffEEEEEE),
                                                borderType: BorderType.RRect,
                                                radius: const Radius.circular(12),
                                                padding: const EdgeInsets.all(12),
                                                child: ClipRRect(
                                                  borderRadius: const BorderRadius.all(
                                                      Radius.circular(12)),
                                                  child: SizedBox(
                                                    width: MediaQuery.of(context)
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
                                                              BorderRadius.circular(
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
                                                          MainAxisAlignment.center,
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                          children: [
                                                            Text(
                                                              'pdf',
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                color: notifier.getblackcolor,
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
                                                                  color:
                                                                  Color(0xff727880),
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
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(10),
                                            decoration:  BoxDecoration(
                                                color: notifier.getbgcolor11,
                                                borderRadius: const BorderRadius.only(
                                                    bottomLeft: Radius.circular(12),
                                                    bottomRight: Radius.circular(12),
                                                    topRight: Radius.circular(12))),
                                            child: Row(
                                              children: [
                                                InkWell(
                                                  onTap: () {

                                                  },
                                                  child: Image.asset('assets/play-circle.png',
                                                      height: 24,
                                                      color: const Color(0xffE5646C)),
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
                                                bottomRight: Radius.circular(12),
                                                topLeft: Radius.circular(12))),
                                        child:  const Text('I went there yesterday',
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
                                                bottomRight: Radius.circular(12),
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
                  decoration:  BoxDecoration(
                    color: notifier.getbgcolor11,
                    border: const Border(),
                  ),
                  child: Row(
                    children: <Widget>[
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border:
                                  Border.all(color: const Color(0xffEEEEEE))),
                          child: const Center(
                              child: Icon(
                            Icons.add,
                            size: 20,
                            color: Color(0xff727880),
                          )),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 40,
                          child: TextField(
                            style: const TextStyle(
                              fontSize: 15,
                              fontFamily: "PublicSansRegular",
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              hintText: "Write messages ...",
                              hintStyle: const TextStyle(
                                fontSize: 15,
                                fontFamily: "PublicSansRegular",
                                fontWeight: FontWeight.w400,
                                color: Color(0xffC6C8CB),
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
                              borderRadius: BorderRadius.circular(12),
                              border:
                                  Border.all(color: const Color(0xffEEEEEE))),
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
                          child: Container(
                            height: 40,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: const Color(0xff595FE5)),
                            child: const Center(
                                child: Text('Send',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'InterRegular'))),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          );
  }

  Widget container3(size){
    return size < 700 ?
    SizedBox(
      height: Get.height,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: notifier.getbgcolor11,
          elevation: 0,
          automaticallyImplyLeading: false,

          title: Transform.translate(
            offset: const Offset(-3, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => container4(size)));
                      // profilePage = !profilePage;
                    });
                  },
                  child: Container(
                    height: 42,
                    width: 42,
                    decoration: const BoxDecoration(
                      color: Color(0xffEEEEEE),
                      shape: BoxShape.circle,
                    ),
                    child: Center(child: Image.asset('assets/hashtag.png',height: 20,color: const Color(0xff9DA2A7))),
                  ),
                ),
                const SizedBox(width: 10,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Developers Team',
                      style: TextStyle(
                        fontSize: 14,
                        color: notifier.getblackcolor,
                        fontWeight: FontWeight.w600,
                        fontFamily: "InterRegular",
                        letterSpacing: 0.5,
                      ),
                    ),
                    const Text(
                      "Work hard, Play hard",
                      style: TextStyle(
                      fontSize: 12,
                        color: Color(0xff727880),
                        fontWeight: FontWeight.w500,
                        fontFamily: "InterRegular",
                        letterSpacing: 0.5,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          actions: [Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/more-circle.png',color: const Color(0xffC6C8CB),height: 24),
              const SizedBox(width: 20,),
              SvgPicture.asset('assets/grid-4.svg',height: 24,color: notifier.getblackcolor),
              const SizedBox(width: 10,),
            ],
          )],

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
                  child:  Padding(
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
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                      child:
                                      Image.asset('assets/Avatar61.png')),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  height: 40,
                                  decoration:  BoxDecoration(
                                      color: notifier.getbgcolor11,
                                      borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(12),
                                          bottomRight: Radius.circular(12),
                                          topRight: Radius.circular(12))),
                                  child:  Row(
                                    children: [
                                      Text('I hope it goes well.',
                                          style: TextStyle(color: notifier.getblackcolor,
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
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Image.asset('assets/Avatar61.png'),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration:  BoxDecoration(
                                      color: notifier.getbgcolor11,
                                      borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(12),
                                          bottomRight: Radius.circular(12),
                                          topRight: Radius.circular(12))),
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
                                          style: TextStyle(color: notifier.getblackcolor,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 20),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      height: 40,
                                      decoration:  BoxDecoration(
                                          color: notifier.getbgcolor11,
                                          borderRadius: const BorderRadius.only(
                                              bottomLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(10),
                                              topRight: Radius.circular(10))),
                                      child:  Row(
                                        children: [
                                          Text('Hey bro!',
                                              style: TextStyle(color: notifier.getblackcolor,
                                                fontFamily: 'InterRegular',
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
                                                fontFamily: 'InterRegular',
                                                color: Color(0xff9DA2A7))),
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
                                          bottomRight: Radius.circular(12),
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
                                          bottomRight: Radius.circular(12),
                                          topLeft: Radius.circular(12))),
                                  child: const Text('I be there in 2 mins',
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
                                            bottomRight: Radius.circular(12),
                                            topLeft: Radius.circular(12))),
                                    child: Row(
                                      children: [
                                        Image.asset('assets/Voice.png',
                                            height: 20),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        InkWell(
                                          onTap: () {

                                          },
                                          child: Image.asset('assets/play-circle.png',
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
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                      child:
                                      Image.asset('assets/Avatar61.png')),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  height: 40,
                                  decoration:  BoxDecoration(
                                      color: notifier.getbgcolor11,
                                      borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                          topRight: Radius.circular(10))),
                                  child:  Row(
                                    children: [
                                      Text('I hope it goes well.',
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',color: notifier.getblackcolor
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
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                      child:
                                      Image.asset('assets/Avatar61.png')),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration:  BoxDecoration(
                                      color: notifier.getbgcolor11,
                                      borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(12),
                                          bottomRight: Radius.circular(12),
                                          topRight: Radius.circular(12))),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text('Haha oh man',

                                          style: TextStyle(color: notifier.getblackcolor,
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
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
                                  children: [
                                    Row(
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
                                        Container(
                                          padding: const EdgeInsets.all(10),
                                          height: 40,
                                          decoration:  BoxDecoration(
                                              color: notifier.getbgcolor11,
                                              borderRadius: const BorderRadius.only(
                                                  bottomLeft: Radius.circular(10),
                                                  bottomRight: Radius.circular(10),
                                                  topRight: Radius.circular(10))),
                                          child:  Row(
                                            children: [
                                              Text('I hope it goes well.',
                                                  style: TextStyle(
                                                      fontFamily: 'InterRegular',color: notifier.getblackcolor
                                                  )),
                                            ],
                                          ),
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
                                          bottomRight: Radius.circular(12),
                                          topLeft: Radius.circular(12))),
                                  child:  const Text('I went there yesterday',
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
                                          bottomRight: Radius.circular(12),
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
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border:
                        Border.all(color: notifier.Getblg2)),
                    child: const Center(
                        child: Icon(
                          Icons.add,
                          size: 20,
                          color: Color(0xff727880),
                        )),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: TextField(
                      style: const TextStyle(
                        fontSize: 15,
                        fontFamily: "PublicSansRegular",
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                      decoration: InputDecoration(
                        contentPadding:
                        const EdgeInsets.symmetric(horizontal: 10),
                        hintText: "Write messages ...",
                        hintStyle: const TextStyle(
                          fontSize: 15,
                          fontFamily: "PublicSansRegular",
                          fontWeight: FontWeight.w400,
                          color: Color(0xffC6C8CB),
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
                        borderRadius: BorderRadius.circular(12),
                        border:
                        Border.all(color: notifier.Getblg2)),
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
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color(0xff595FE5)),
                      child: const Center(
                          child: Text('Send',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'InterRegular'))),
                    )),
              ],
            ),
          ),
        ),
      ),
    ):
      SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Scaffold(
        appBar: AppBar(
            shape: const ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
          ),
          backgroundColor: notifier.getbgcolor11,
          elevation: 0,
          actions: [
            Row(
              children: [
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
                            borderRadius:
                            BorderRadius.circular(15),
                          ),
                          child: Center(
                              child: Image.asset(
                                  'assets/User Read.png')),
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

                                borderRadius:
                                BorderRadius.circular(15),
                              ),
                              child: Center(
                                  child: Image.asset(
                                      'assets/Avatar72.png')),
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

                                borderRadius:
                                BorderRadius.circular(15),
                              ),
                              child: Center(
                                  child: Image.asset(
                                      'assets/User Read1.png')),
                            ),
                          )),
                      Positioned(

                          child: Transform.translate(
                            offset: const Offset(45, 0),
                            child: Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(15),
                                image: const DecorationImage(image: AssetImage('assets/Avatar72.png'))
                              ),
                              child: const Center(
                                  child: Text('4',style: TextStyle(color: Colors.white,fontSize: 14),)),
                            ),
                          )),
                    ],
                  ),
                ),
const SizedBox(width: 20,),
                Image.asset('assets/more-circle.png',height: 24,color: const Color(0xffC6C8CB)),
                const SizedBox(width: 20,),
                SvgPicture.asset('assets/grid-4.svg', height: 24, color: notifier.getblackcolor),
                const SizedBox(width: 10,),
              ],
            ),
          ],
          flexibleSpace: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 80,
            decoration:  BoxDecoration( borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
              color:notifier.getbgcolor11,
              border: const Border(

              ),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
             leading:  Row(
               children: [
                 InkWell(
                   onTap: () {
                     setState(() {
                       profilePage =! profilePage;
                     });
                   },
                   child: Container(height: 40,
                     padding: const EdgeInsets.all(12),
                     decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: const Color(0xffEEEEEE),),
                     child: Center(child: Image.asset('assets/hashtag.png',height: 25)),
                   ),
                 ),
                 const SizedBox(width: 10,),
                 Transform.translate(
                   offset: const Offset(0, -1),
                   child:  Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text(' Developers Team',style: TextStyle(fontFamily: 'InterRegular',fontSize: 15,fontWeight: FontWeight.w600,color: notifier.getblackcolor)),
                       const Text('🤰🤰Work hard, Play hard🤰🤰',style: TextStyle(fontFamily: 'InterRegular',fontSize: 12,color: Color(0xff727880),fontWeight: FontWeight.w500)),
                     ],
                   ),
                 )
               ],
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
                  child:  Padding(
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
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                      child:
                                      Image.asset('assets/Avatar61.png')),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  height: 40,
                                  decoration:  BoxDecoration(
                                      color: notifier.getbgcolor11,
                                      borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(12),
                                          bottomRight: Radius.circular(12),
                                          topRight: Radius.circular(12))),
                                  child:  Row(
                                    children: [
                                      Text('I hope it goes well.',
                                          style: TextStyle(color: notifier.getblackcolor,
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
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Image.asset('assets/Avatar61.png'),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration:  BoxDecoration(
                                      color: notifier.getbgcolor11,
                                      borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(12),
                                          bottomRight: Radius.circular(12),
                                          topRight: Radius.circular(12))),
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
                                          style: TextStyle(color: notifier.getblackcolor,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 20),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      height: 40,
                                      decoration:  BoxDecoration(
                                          color: notifier.getbgcolor11,
                                          borderRadius: const BorderRadius.only(
                                              bottomLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(10),
                                              topRight: Radius.circular(10))),
                                      child:  Row(
                                        children: [
                                          Text('Hey bro!',
                                              style: TextStyle(color: notifier.getblackcolor,
                                                fontFamily: 'InterRegular',
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
                                                fontFamily: 'InterRegular',
                                                color: Color(0xff9DA2A7))),
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
                                          bottomRight: Radius.circular(12),
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
                                          bottomRight: Radius.circular(12),
                                          topLeft: Radius.circular(12))),
                                  child: const Text('I be there in 2 mins',
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
                                            bottomRight: Radius.circular(12),
                                            topLeft: Radius.circular(12))),
                                    child: Row(
                                      children: [
                                        Image.asset('assets/Voice.png',
                                            height: 20),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        InkWell(
                                          onTap: () {

                                          },
                                          child: Image.asset('assets/play-circle.png',
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
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                      child:
                                      Image.asset('assets/Avatar61.png')),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  height: 40,
                                  decoration:  BoxDecoration(
                                      color: notifier.getbgcolor11,
                                      borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                          topRight: Radius.circular(10))),
                                  child:  Row(
                                    children: [
                                      Text('I hope it goes well.',
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',color: notifier.getblackcolor
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
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                      child:
                                      Image.asset('assets/Avatar61.png')),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration:  BoxDecoration(
                                      color: notifier.getbgcolor11,
                                      borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(12),
                                          bottomRight: Radius.circular(12),
                                          topRight: Radius.circular(12))),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text('Haha oh man',

                                          style: TextStyle(color: notifier.getblackcolor,
                                            fontFamily: 'InterRegular',
                                          )),
                                      InkWell(
                                        onTap: () {
                                        },
                                        child: DottedBorder(
                                          color: const Color(0xffEEEEEE),
                                          borderType: BorderType.RRect,
                                          radius: const Radius.circular(12),
                                          padding: const EdgeInsets.all(12),
                                          child: ClipRRect(
                                            borderRadius: const BorderRadius.all(
                                                Radius.circular(12)),
                                            child: SizedBox(
                                              width: MediaQuery.of(context)
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
                                                        BorderRadius.circular(
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
                                                    MainAxisAlignment.center,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        'pdf',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: notifier.getblackcolor,
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
                                                            color:
                                                            Color(0xff727880),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration:  BoxDecoration(
                                          color: notifier.getbgcolor11,
                                          borderRadius: const BorderRadius.only(
                                              bottomLeft: Radius.circular(12),
                                              bottomRight: Radius.circular(12),
                                              topRight: Radius.circular(12))),
                                      child: Row(
                                        children: [
                                          InkWell(
                                            onTap: () {

                                            },
                                            child: Image.asset('assets/play-circle.png',
                                                height: 24,
                                                color: const Color(0xffE5646C)),
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
                                          bottomRight: Radius.circular(12),
                                          topLeft: Radius.circular(12))),
                                  child:  const Text('I went there yesterday',
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
                                          bottomRight: Radius.circular(12),
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
                          height: 80,
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
            decoration:  BoxDecoration(
              color: notifier.getbgcolor11,
              border: const Border(),
            ),
            child: Row(
              children: <Widget>[
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border:
                        Border.all(color: const Color(0xffEEEEEE))),
                    child: const Center(
                        child: Icon(
                          Icons.add,
                          size: 20,
                          color: Color(0xff727880),
                        )),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: TextField(
                      style: const TextStyle(
                        fontSize: 15,
                        fontFamily: "PublicSansRegular",
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                      decoration: InputDecoration(
                        contentPadding:
                        const EdgeInsets.symmetric(horizontal: 10),
                        hintText: "Write messages ...",
                        hintStyle: const TextStyle(
                          fontSize: 15,
                          fontFamily: "PublicSansRegular",
                          fontWeight: FontWeight.w400,
                          color: Color(0xffC6C8CB),
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
                        borderRadius: BorderRadius.circular(12),
                        border:
                        Border.all(color: const Color(0xffEEEEEE))),
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
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color(0xff595FE5)),
                      child: const Center(
                          child: Text('Send',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'InterRegular'))),
                    )),
              ],
            ),
          ),
        ),
      ),
    );

  }

  Widget container4(size){
    return  size < 700 ?
      StatefulBuilder(
        builder: (context, setState) {
          return SizedBox(
              height: Get.height,
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: notifier.getbgcolor11,
                  elevation: 0,
                  iconTheme: IconThemeData(color: notifier.getblackcolor),
                  leading: SizedBox(
                    height: 20,
                    child: Builder(
                      builder: (BuildContext context) {
                        return Container(
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: notifier.getgrey1)),
                          child: Center(
                            child: IconButton(
                              icon: Icon(
                                Icons.arrow_back_outlined, size: 18,
                                color: notifier
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
                      color: notifier.getbgcolor11,
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
                                  color: notifier.getgrey1,
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
                                                    color: notifier.getblackcolor,
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
                                        color: notifier.getgrey1,
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
                            if (notifier.isDark) {
                              notifier.setIsDark = isdark;
                            } else {
                              notifier.setIsDark = !isdark;
                            }
                          });
                        },
                        child: notifier.isDark
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
                      color: notifier.getbgcolor11,
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
                                                          color: notifier
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
                                                        color: notifier
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
                                                      notifier.getblackcolor,
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
                                          color: notifier.getgrey1,
                                        );
                                      }),
                                ),
                                Divider(
                                  color: notifier.getgrey1,
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
                      color: notifier.getbgcolor11,
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
                                  color: notifier.getgrey1,
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
                                                  color: notifier.getbgcolor10,
                                                  borderRadius:
                                                  BorderRadius.circular(20)),
                                              child: Center(
                                                  child: Image.asset(
                                                    model().popo[index],
                                                    height: 16,
                                                    color: notifier.getblackcolor,
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
                                                      notifier.getblackcolor,
                                                    )),
                                                Text(model().popo2[index],
                                                    style: TextStyle(
                                                      fontFamily: 'InterRegular',
                                                      fontSize: 12,
                                                      color:
                                                      notifier.getblackcolor,
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
                                          color: notifier.getgrey1,
                                        );
                                      }),
                                ),
                                Divider(
                                  color: notifier.getgrey1,
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
                    StatefulBuilder(builder: (context, setState) {
                      return PopupMenuButton<SampleItem>(
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
                        color: notifier.getbgcolor11,
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
                                                color: notifier.getblackcolor,
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
                                    color: notifier.getgrey1,
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
                                      color: notifier.getblackcolor, height: 18),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'My account',
                                    style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        color: notifier.getblackcolor,
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
                                      color: notifier.getblackcolor, height: 18),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Setting',
                                    style: TextStyle(
                                        color: notifier.getblackcolor,
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
                                      color: notifier.getblackcolor, height: 18),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Support',
                                    style: TextStyle(
                                        color: notifier.getblackcolor,
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
                                      color: notifier.getblackcolor, height: 18),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Sign out',
                                    style: TextStyle(
                                        color: notifier.getblackcolor,
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
                                            height: 20,  color: notifier.getblackcolor),
                                        SizedBox(width: 10,),
                                        Text('RTL',style: TextStyle(color: notifier.getblackcolor,fontFamily: 'InterRegular')),
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
                      );
                    },

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
                    color: notifier.getbgcolor11,
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
                                color: notifier.Getblg2,
                                borderRadius: BorderRadius.circular(6)),
                            child: TextField(
                              style: TextStyle(color: notifier.getblackcolor),
                              decoration: InputDecoration(
                                hintText: 'Search',
                                prefixIcon: Image.asset(
                                    'assets/search-normal.png',
                                    scale: 4,
                                    color: const Color(0xff9DA2A7)),
                                hintStyle:
                                TextStyle(color: notifier.getblackcolor),
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
                body: Container(
                  height: MediaQuery.of(context).size.height,
                  decoration:  BoxDecoration(
                    color: notifier.getbgcolor10,
                  ),

                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [


                          Text(
                            "Files",
                            style: TextStyle(
                              color: notifier.getblackcolor,
                              fontWeight: FontWeight.w600,
                              fontFamily: "InterRegular",
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
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
                                      color: notifier.getbgcolor11,
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset('assets/pdf.png',height: 30),
                                        const SizedBox(height: 3,),
                                        Text('mine.pdf',style: TextStyle(fontSize: 10,fontFamily: 'InterRegular',color: notifier.getblackcolor),)
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: notifier.getbgcolor11,
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset('assets/psd-colored.png',height: 30),
                                        const SizedBox(height: 3,),
                                        Text('psd',style: TextStyle(fontSize: 10,fontFamily: 'InterRegular',color: notifier.getblackcolor),)
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: notifier.getbgcolor11,
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset('assets/pdf.png',height: 30),
                                        const SizedBox(height: 3,),
                                        Text('mine.pdf',style: TextStyle(fontSize: 10,fontFamily: 'InterRegular',color: notifier.getblackcolor),)
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: notifier.getbgcolor11,
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset('assets/psd-colored.png',height: 30),
                                        const SizedBox(height: 3,),
                                        Text('psd',style: TextStyle(fontSize: 10,fontFamily: 'InterRegular',color: notifier.getblackcolor),)
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: notifier.getbgcolor11,
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset('assets/pdf.png',height: 30),
                                        const SizedBox(height: 3,),
                                        Text('mine.pdf',style: TextStyle(fontSize: 10,fontFamily: 'InterRegular',color: notifier.getblackcolor),)
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: notifier.getbgcolor11,
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset('assets/psd-colored.png',height: 30),
                                        const SizedBox(height: 3,),
                                        Text('psd',style: TextStyle(fontSize: 10,fontFamily: 'InterRegular',color: notifier.getblackcolor),)
                                      ],
                                    ),
                                  ),

                                ],
                              )
                            ],
                          ),
                          const SizedBox(height: 10,),
                          InkWell(
                            onTap: () {},
                            child: Container(

                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: notifier.getbgcolor11,
                                  border: Border.all(color:  notifier.Getblg2)),
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
                            "Links",
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
                              Container(
                                height: 32,
                                width: 32,
                                decoration:
                                BoxDecoration(borderRadius: BorderRadius.circular(10)),
                                child: Image.asset('assets/Media10.png'),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child:  Text(
                                        'https://.medium.com/is-lamda-sentient-an-...',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: notifier.getblackcolor,
                                          fontFamily: 'InterRegular',
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      'medium.com',
                                      style:
                                      TextStyle(color: Color(0xff595FE5), fontSize: 10),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Container(
                                height: 32,
                                width: 32,
                                decoration:
                                BoxDecoration(borderRadius: BorderRadius.circular(10)),
                                child: Image.asset('assets/Media14.png'),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child:  Text(
                                        'https://.medium.com/is-lamda-sentient-an-...',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: notifier.getblackcolor,
                                          fontFamily: 'InterRegular',
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      'slack.com',
                                      style:
                                      TextStyle(color: Color(0xff595FE5), fontSize: 10),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Container(
                                height: 32,
                                width: 32,
                                decoration:
                                BoxDecoration(borderRadius: BorderRadius.circular(10)),
                                child: Image.asset('assets/Media13.png'),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child:  Text(
                                        'https://.medium.com/is-lamda-sentient-an-...',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: notifier.getblackcolor,
                                          fontFamily: 'InterRegular',
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      'github.com',
                                      style:
                                      TextStyle(color: Color(0xff595FE5), fontSize: 10),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Container(
                                height: 32,
                                width: 32,
                                decoration:
                                BoxDecoration(borderRadius: BorderRadius.circular(10)),
                                child: Image.asset('assets/Media10.png'),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: Text(
                                        'https://.medium.com/is-lamda-sentient-an-...',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: notifier.getblackcolor,
                                          fontFamily: 'InterRegular',
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      'medium.com',
                                      style:
                                      TextStyle(color: Color(0xff595FE5), fontSize: 10),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Container(
                                height: 32,
                                width: 32,
                                decoration:
                                BoxDecoration(borderRadius: BorderRadius.circular(10)),
                                child: Image.asset('assets/Media10.png'),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child:  Text(
                                        'https://.medium.com/is-lamda-sentient-an-...',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: notifier.getblackcolor,
                                          fontFamily: 'InterRegular',
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      'medium.com',
                                      style:
                                      TextStyle(color: Color(0xff595FE5), fontSize: 10),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: notifier.getbgcolor11,
                                  border: Border.all(color: notifier.Getblg2)),
                              child: const Center(
                                  child: Text('View More',
                                      style: TextStyle(
                                          color: Color(0xff727880),
                                          fontSize: 12,
                                          fontFamily: 'InterRegular',
                                          fontWeight: FontWeight.w600))),
                            ),
                          ),
                          const SizedBox(height: 10,),
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
                                        borderRadius: BorderRadius.circular(10),
                                        color: notifier.getbgcolor10,
                                        image: const DecorationImage(
                                            image: AssetImage('assets/Media.png'),
                                            fit: BoxFit.cover)),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: notifier.getbgcolor10,
                                        image: const DecorationImage(
                                            image: AssetImage('assets/Media2.png'),
                                            fit: BoxFit.cover)),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: notifier.getbgcolor10,
                                        image: const DecorationImage(
                                            image: AssetImage('assets/Media(1).png'),
                                            fit: BoxFit.cover)),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: notifier.getbgcolor10,
                                        image: const DecorationImage(
                                            image: AssetImage('assets/Media(2).png'),
                                            fit: BoxFit.cover)),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: notifier.getbgcolor10,
                                        image: const DecorationImage(
                                            image: AssetImage('assets/Media(3).png'),
                                            fit: BoxFit.cover)),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: notifier.getbgcolor10,
                                        image: const DecorationImage(
                                            image: AssetImage('assets/Media(4).png'),
                                            fit: BoxFit.cover)),
                                  ),

                                ],
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: notifier.getbgcolor11,
                                  border: Border.all(color: notifier.Getblg2)),
                              child: const Center(
                                  child: Text('View More',
                                      style: TextStyle(
                                          color: Color(0xff727880),
                                          fontSize: 12,
                                          fontFamily: 'InterRegular',
                                          fontWeight: FontWeight.w600))),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ));
        },

      ) :
      Container(
          height: MediaQuery.of(context).
      size.height,
      decoration:  BoxDecoration(
        color: notifier.getbgcolor11,
        borderRadius: BorderRadius.circular(12),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                height:45,
                decoration: BoxDecoration(
                    color: notifier.Getblg2,
                    borderRadius: BorderRadius.circular(20)),
                child: TextField(
                  style:  TextStyle(color: notifier.getblackcolor),
                  decoration: InputDecoration(
                    hintText: 'Find file, link or media',
                    prefixIcon: Image.asset('assets/search-normal.png',
                        scale: 4, color: const Color(0xff9DA2A7)),
                    hintStyle: const TextStyle(color: Color(0xffC6C8CB),fontSize: 15),
                    contentPadding: const EdgeInsets.only(left: 20, right: 20),
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
              const SizedBox(height: 10,),
               Text(
                "Files",
                style: TextStyle(
                  color: notifier.getblackcolor,
                  fontWeight: FontWeight.w600,
                  fontFamily: "InterRegular",
                  fontSize: 14,
                ),
              ),

              const SizedBox(height: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GridView.count(
                    primary: false,
                    shrinkWrap: true,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 5,
                    crossAxisCount: 2,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: notifier.getbgcolor10,
                            ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/pdf.png',height: 30),
                            const SizedBox(height: 3,),
                             Text('mine.pdf',style: TextStyle(fontSize: 10,fontFamily: 'InterRegular',color: notifier.getblackcolor),)
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          color: notifier.getbgcolor10,
                            ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/psd-colored.png',height: 30),
                            const SizedBox(height: 3,),
                             Text('psd',style: TextStyle(fontSize: 10,fontFamily: 'InterRegular',color: notifier.getblackcolor),)
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          color: notifier.getbgcolor10,
                            ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/pdf.png',height: 30),
                            const SizedBox(height: 3,),
                             Text('mine.pdf',style: TextStyle(fontSize: 10,fontFamily: 'InterRegular',color: notifier.getblackcolor),)
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: notifier.getbgcolor10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/psd-colored.png',height: 30),
                            const SizedBox(height: 3,),
                             Text('psd',style: TextStyle(fontSize: 10,fontFamily: 'InterRegular',color: notifier.getblackcolor),)
                          ],
                        ),
                      ),


                    ],
                  )
                ],
              ),
              const SizedBox(height: 10,),

              InkWell(
                onTap: () {},
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    color: notifier.getbgcolor10,),
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
                "Links",
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
                  Container(
                    height: 32,
                    width: 32,
                    decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
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
                        child:  Text(
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
                        style:
                        TextStyle(color: Color(0xff595FE5), fontSize: 10),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    height: 32,
                    width: 32,
                    decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: Image.asset('assets/Media14.png'),
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
                        child:  Text(
                          'https://.medium.com/is-\nlamda-sentient-an-...',
                          style: TextStyle(
                            fontSize: 12,
                            color: notifier.getblackcolor,
                            fontFamily: 'InterRegular',
                          ),
                        ),
                      ),
                      const Text(
                        'slack.com',
                        style:
                        TextStyle(color: Color(0xff595FE5), fontSize: 10),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    height: 32,
                    width: 32,
                    decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: Image.asset('assets/Media13.png'),
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
                        child:  Text(
                          'https://.medium.com/is-\nlamda-sentient-an-...',
                          style: TextStyle(
                            fontSize: 12,
                            color: notifier.getblackcolor,
                            fontFamily: 'InterRegular',
                          ),
                        ),
                      ),
                      const Text(
                        'github.com',
                        style:
                        TextStyle(color: Color(0xff595FE5), fontSize: 10),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    height: 32,
                    width: 32,
                    decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
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
                        child:  Text(
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
                        style:
                        TextStyle(color: Color(0xff595FE5), fontSize: 10),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    height: 32,
                    width: 32,
                    decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
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
                        child:  Text(
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
                        style:
                        TextStyle(color: Color(0xff595FE5), fontSize: 10),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: const Color(0xffEEEEEE))),
                  child: const Center(
                      child: Text('View More',
                          style: TextStyle(
                              color: Color(0xff727880),
                              fontSize: 12,
                              fontFamily: 'InterRegular',
                              fontWeight: FontWeight.w600))),
                ),
              ),
              const SizedBox(height: 10,),
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
              const SizedBox(height: 10),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: const Color(0xffEEEEEE))),
                  child: const Center(
                      child: Text('View More',
                          style: TextStyle(
                              color: Color(0xff727880),
                              fontSize: 12,
                              fontFamily: 'InterRegular',
                              fontWeight: FontWeight.w600))),
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
