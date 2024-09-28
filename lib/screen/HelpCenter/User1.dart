// ignore_for_file: prefer_const_constructors, file_names, camel_case_types
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
// ignore_for_file: deprecated_member_use
import 'package:provider/provider.dart';
import 'package:evcp/confing/list.dart';

import '../../confing/Rtl.dart';
import '../../confing/colors.dart';

import '../../confing/image.dart';
import '../../confing/notifier.dart';
import '../../controller/page_controller.dart';
import '../Dashboard/Dashboard_main.dart';
import '../login/login.dart';


class User1 extends StatefulWidget {
  const User1({super.key});

  @override
  State<User1> createState() => _User1State();
}

class _User1State extends State<User1> {
  late ColorNotifier notifire;
  String? selectedValue;
  SampleItem? selectedMenu;
  bool _customTileExpanded = false;
  bool _customTileExpanded1 = false;
  bool _customTileExpanded2 = false;
  bool _customTileExpanded3 = false;
  bool _customTileExpanded4 = false;
  bool _customTileExpanded5 = false;

  InboxController inboxController = Get.put(InboxController());
  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifier>(context, listen: true);
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 700) {
          return Container(
              color: notifire.getbgcolor10,
              child:  SingleChildScrollView(
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
        } else if (constraints.maxWidth < 1200) {
          return  Container(
            decoration:  BoxDecoration(
                color: notifire.getbgcolor10
            ),
            child:  SingleChildScrollView(
              child: Column(
                children: [

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      firstContainer(
                          context: context,
                          constraints: constraints.maxWidth),
                    ],
                  ),
                ],
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

  Widget firstContainer({context, constraints,}) {
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
              Text('User1',style: TextStyle(color: notifire.getblackcolor,fontSize: 14,fontFamily: 'InterRegular'),),
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
      Column(
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
              Text('User1',style: TextStyle(color: notifire.getblackcolor,fontSize: 14,fontFamily: 'InterRegular'),),
            ],
          ),
          const SizedBox(height: 20,),
          Container(
            decoration: const BoxDecoration(
            ),
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: notifire.getbgcolor11),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    Row(
                      children: [
                        SvgPicture.asset(AppContent.evcp,height: 25,),
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
                    Text(
                      'Your Tickets',
                      style: TextStyle(
                        fontSize: 16,color: notifire.getblackcolor,
                        fontFamily: 'InterRegular',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ListView.builder(
                      shrinkWrap: true,physics: const NeverScrollableScrollPhysics(),
                      itemCount: model().user.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: notifire.getbgcolor10,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 8,
                                    width: 8,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: model().user[index]),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    model().user1[index],
                                    style: const TextStyle(
                                      fontFamily: 'InterRegular',
                                      fontSize: 12,
                                      color: Color(0xff9DA2A7),
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    model().user2[index],
                                    style: const TextStyle(
                                      fontSize: 10,
                                      fontFamily: 'InterRegular',
                                      color: Color(0xff9DA2A7),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                model().user3[index],
                                style:  TextStyle(color: notifire.getblackcolor,
                                  fontFamily: 'InterRegular',
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                model().user4[index],
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'InterRegular',
                                  color: Color(0xff727880),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Need We Help Quickly?',
                      style: TextStyle(
                        fontFamily: 'InterRegular',
                        fontSize: 14,color: notifire.getblackcolor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Chat with us via your Messenger',
                      style: TextStyle(
                        fontSize: 12,color: notifire.getblackcolor,
                        fontFamily: 'InterRegular',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(container1(constraints));
                      },
                      child: Container(
                        height: 40,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color(0xff595FE5),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/messenger2.png',
                                height: 16,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                'Chat Now',
                                style: TextStyle(
                                    fontFamily: 'InterRegular',
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      )
           :Container(
        decoration: const BoxDecoration(

            ),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: notifire.getbgcolor11),
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
                 Text(
                  'Your Tickets',
                  style: TextStyle(
                    fontSize: 16,color: notifire.getblackcolor,
                    fontFamily: 'InterRegular',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: model().user.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: notifire.getbgcolor10,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 8,
                                width: 8,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: model().user[index]),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                model().user1[index],
                                style: const TextStyle(
                                  fontFamily: 'InterRegular',
                                  fontSize: 12,
                                  color: Color(0xff9DA2A7),
                                ),
                              ),
                              const Spacer(),
                              Text(
                                model().user2[index],
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontFamily: 'InterRegular',
                                  color: Color(0xff9DA2A7),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            model().user3[index],
                            style:  TextStyle(color: notifire.getblackcolor,
                              fontFamily: 'InterRegular',
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            model().user4[index],
                            style: const TextStyle(
                              fontSize: 14,
                              fontFamily: 'InterRegular',
                              color: Color(0xff727880),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                 Text(
                  'Need We Help Quickly?',
                  style: TextStyle(
                    fontFamily: 'InterRegular',
                    fontSize: 14,color: notifire.getblackcolor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                 Text(
                  'Chat with us via your Messenger',
                  style: TextStyle(
                    fontSize: 12,color: notifire.getblackcolor,
                    fontFamily: 'InterRegular',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xff595FE5),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/messenger2.png',
                            height: 16,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'Chat Now',
                            style: TextStyle(
                                fontFamily: 'InterRegular',
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
  }
  bool isdark = false;
  Widget container1(constraints) {
    return 
      constraints < 600 ?
      StatefulBuilder(
        builder: (context, setState) {
          return Scaffold(backgroundColor: notifire.getbgcolor10,
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
            body: SingleChildScrollView(
              child: Column(
                children: [

                  Container(
                    width: Get.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        image: const DecorationImage(image: AssetImage('assets/img-bg-helpdesk-v.3.png'),fit: BoxFit.cover)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 10,),
                            const Text('Hi How can we help you?',style: TextStyle(fontSize: 24,fontFamily: 'InterRegular',fontWeight: FontWeight.w600),),
                            const SizedBox(height: 5,),
                            Text('Type the keyword of you questions',style: TextStyle(fontSize: 16,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                            const SizedBox(height: 20,),
                            Container(

                              width: Get.width * 0.5,
                              height: 45,
                              decoration: BoxDecoration(
                                  color: notifire.getbgcolor11,
                                  borderRadius: BorderRadius.circular(15)),
                              child: TextField(
                                style: const TextStyle(),
                                decoration: InputDecoration(
                                  hintText: 'Search',
                                  prefixIcon: Image.asset('assets/search-normal.png',
                                      scale: 4, color: const Color(0xff9DA2A7)),
                                  hintStyle: TextStyle(color: grey3),
                                  contentPadding: const EdgeInsets.only(left: 20, right: 20),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(color: grey2)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(15)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: blue),
                                      borderRadius: BorderRadius.circular(15)),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10,),
                          ]),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(

                      padding: const EdgeInsets.all(12),decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: notifire.getbgcolor11),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration:  BoxDecoration(
                              border: Border(bottom: BorderSide(color: notifire.getgrey1,)),
                            ),
                            child: ExpansionTile(
                              title: Text('Why do we use it?'.tr,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'InterRegular',
                                      color: notifire.getblackcolor)),
                              trailing: (_customTileExpanded
                                  ? Image.asset(
                                'assets/minus-square.png',
                                height: 16,
                              )
                                  : Image.asset(
                                'assets/add-square.png',
                                height: 16,
                              )),
                              children: <Widget>[
                                ListTile(
                                    title: Text(
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
                                          .tr,
                                      style: TextStyle(
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular',
                                          fontSize: 16),
                                    )),
                              ],
                              onExpansionChanged: (bool expanded) {
                                setState(() {
                                  _customTileExpanded = expanded;
                                });
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            decoration:  BoxDecoration(
                              border: Border(bottom: BorderSide(color: notifire.getgrey1,)),
                            ),
                            child: ExpansionTile(
                              title: Text('Where can I get some?'.tr,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'InterRegular',
                                      color: notifire.getblackcolor)),
                              trailing: (_customTileExpanded1
                                  ? Image.asset(
                                'assets/minus-square.png',
                                height: 16,
                              )
                                  : Image.asset(
                                'assets/add-square.png',
                                height: 16,
                              )),
                              children: <Widget>[
                                Divider(
                                  color: Colors.grey.withOpacity(0.10),
                                  thickness: 1,
                                  height: 0,
                                  indent: 2,
                                  endIndent: 2,
                                ),
                                ListTile(
                                    title: Text(
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et lore magna aliqua.'
                                          .tr,
                                      style: TextStyle(
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular',
                                          fontSize: 16),
                                    )),
                              ],
                              onExpansionChanged: (bool expanded) {
                                setState(() {
                                  _customTileExpanded1 = expanded;
                                });
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(

                            decoration:  BoxDecoration(
                              border: Border(bottom: BorderSide(color: notifire.getgrey1,)),
                            ),
                            child: ExpansionTile(
                              title: Text('Where does it come from?'.tr,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'InterRegular',
                                      color: notifire.getblackcolor)),
                              trailing: (_customTileExpanded2
                                  ? Image.asset(
                                'assets/minus-square.png',
                                height: 16,
                              )
                                  : Image.asset(
                                'assets/add-square.png',
                                height: 16,
                              )),
                              children: <Widget>[
                                Divider(
                                  color: Colors.grey.withOpacity(0.10),
                                  thickness: 1,
                                  height: 0,
                                  indent: 2,
                                  endIndent: 2,
                                ),
                                ListTile(
                                    title: Text(
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
                                          .tr,
                                      style: TextStyle(
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular',
                                          fontSize: 16),
                                    )),
                              ],
                              onExpansionChanged: (bool expanded) {
                                setState(() {
                                  _customTileExpanded2 = expanded;
                                });
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(

                            decoration:  BoxDecoration(
                              border: Border(bottom: BorderSide(color: notifire.getgrey1,)),
                            ),
                            child: ExpansionTile(
                              title: Text('How do I request money?'.tr,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'InterRegular',
                                      color: notifire.getblackcolor)),
                              trailing: (_customTileExpanded3
                                  ? Image.asset(
                                'assets/minus-square.png',
                                height: 16,
                              )
                                  : Image.asset(
                                'assets/add-square.png',
                                height: 16,
                              )),
                              children: <Widget>[
                                Divider(
                                  color: Colors.grey.withOpacity(0.10),
                                  thickness: 1,
                                  height: 0,
                                  indent: 2,
                                  endIndent: 2,
                                ),
                                ListTile(
                                    title: Text(
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
                                          .tr,
                                      style: TextStyle(
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular',
                                          fontSize: 16),
                                    )),
                              ],
                              onExpansionChanged: (bool expanded) {
                                setState(() {
                                  _customTileExpanded3 = expanded;
                                });
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(

                            decoration:  BoxDecoration(
                              border: Border(bottom: BorderSide(color: notifire.getgrey1,)),
                            ),
                            child: ExpansionTile(
                              title: Text('I send money internationally?'.tr,
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontFamily: 'InterRegular',
                                      color: notifire.getblackcolor)),
                              trailing: (_customTileExpanded4
                                  ? Image.asset(
                                'assets/minus-square.png',
                                height: 16,
                              )
                                  : Image.asset(
                                'assets/add-square.png',
                                height: 16,
                              )),
                              children: <Widget>[
                                Divider(
                                  color: Colors.grey.withOpacity(0.10),
                                  thickness: 1,
                                  height: 0,
                                  indent: 2,
                                  endIndent: 2,
                                ),
                                ListTile(
                                    title: Text(
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
                                          .tr,
                                      style: TextStyle(
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular',
                                          fontSize: 16),
                                    )),
                              ],
                              onExpansionChanged: (bool expanded) {
                                setState(() {
                                  _customTileExpanded4 = expanded;
                                });
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(

                            decoration:  BoxDecoration(
                              border: Border(bottom: BorderSide(color: notifire.getgrey1,)),
                            ),
                            child: ExpansionTile(
                              title: Text('Help?'.tr,
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontFamily: 'InterRegular',
                                      color: notifire.getblackcolor)),
                              trailing: (_customTileExpanded5
                                  ? Image.asset(
                                'assets/minus-square.png',
                                height: 16,
                              )
                                  : Image.asset(
                                'assets/add-square.png',
                                height: 16,
                              )),
                              children: <Widget>[
                                Divider(
                                  color: Colors.grey.withOpacity(0.10),
                                  thickness: 1,
                                  height: 0,
                                  indent: 2,
                                  endIndent: 2,
                                ),
                                ListTile(
                                    title: Text(
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
                                          .tr,
                                      style: TextStyle(
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular',
                                          fontSize: 16),
                                    )),
                              ],
                              onExpansionChanged: (bool expanded) {
                                setState(() {
                                  _customTileExpanded5 = expanded;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ):
      Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Container(
            width: Get.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                image: const DecorationImage(image: AssetImage('assets/img-bg-helpdesk-v.3.png'),fit: BoxFit.cover)
            ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10,),
          const Text('Hi How can we help you?',style: TextStyle(fontSize: 24,fontFamily: 'InterRegular',fontWeight: FontWeight.w600),),
              const SizedBox(height: 5,),
              Text('Type the keyword of you questions',style: TextStyle(fontSize: 16,fontFamily: 'InterRegular',),),
              const SizedBox(height: 20,),
              Container(

                width: Get.width * 0.2,
                height: 45,
                decoration: BoxDecoration(
                    color: notifire.getbgcolor11,
                    borderRadius: BorderRadius.circular(15)),
                child: TextField(
                  style:  TextStyle(color: notifire.getblackcolor),
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Image.asset('assets/search-normal.png',
                        scale: 4, color: const Color(0xff9DA2A7)),
                    hintStyle: TextStyle(color: grey3),
                    contentPadding: const EdgeInsets.only(left: 20, right: 20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: grey2)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: blue),
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
        ]),
      ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.all(20),
           decoration: BoxDecoration( color: notifire.getbgcolor11,borderRadius: BorderRadius.circular(12)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: Get.width * 0.4,
                  decoration:  BoxDecoration(
                    border: Border(bottom: BorderSide(color: notifire.getgrey1)),
                  ),
                  child: ExpansionTile(
                    title: Text('Why do we use it?'.tr,
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'InterRegular',
                            color: notifire.getblackcolor)),
                    trailing: (_customTileExpanded
                        ? Image.asset(
                      'assets/minus-square.png',
                      height: 16,
                    )
                        : Image.asset(
                      'assets/add-square.png',
                      height: 16,
                    )),
                    children: <Widget>[
                      ListTile(
                          title: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
                                .tr,
                            style: TextStyle(
                                color: notifire.getblackcolor,
                                fontFamily: 'InterRegular',
                                fontSize: 16),
                          )),
                    ],
                    onExpansionChanged: (bool expanded) {
                      setState(() {
                        _customTileExpanded = expanded;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: Get.width * 0.4,
                  decoration:  BoxDecoration(
                    border: Border(bottom: BorderSide(color: notifire.getgrey1,)),
                  ),
                  child: ExpansionTile(
                    title: Text('Where can I get some?'.tr,
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'UrbanistBold',
                            color: notifire.getblackcolor)),
                    trailing: (_customTileExpanded1
                        ? Image.asset(
                      'assets/minus-square.png',
                      height: 16,
                    )
                        : Image.asset(
                      'assets/add-square.png',
                      height: 16,
                    )),
                    children: <Widget>[
                      Divider(
                        color: Colors.grey.withOpacity(0.10),
                        thickness: 1,
                        height: 0,
                        indent: 2,
                        endIndent: 2,
                      ),
                      ListTile(
                          title: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et lore magna aliqua.'
                                .tr,
                            style: TextStyle(
                                color: notifire.getblackcolor,
                                fontFamily: 'InterRegular',
                                fontSize: 16),
                          )),
                    ],
                    onExpansionChanged: (bool expanded) {
                      setState(() {
                        _customTileExpanded1 = expanded;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: Get.width * 0.4,
                  decoration:  BoxDecoration(
                    border: Border(bottom: BorderSide(color: notifire.getgrey1,)),
                  ),
                  child: ExpansionTile(
                    title: Text('Where does it come from?'.tr,
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'InterRegular',
                            color: notifire.getblackcolor)),
                    trailing: (_customTileExpanded2
                        ? Image.asset(
                      'assets/minus-square.png',
                      height: 16,
                    )
                        : Image.asset(
                      'assets/add-square.png',
                      height: 16,
                    )),
                    children: <Widget>[
                      Divider(
                        color: Colors.grey.withOpacity(0.10),
                        thickness: 1,
                        height: 0,
                        indent: 2,
                        endIndent: 2,
                      ),
                      ListTile(
                          title: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
                                .tr,
                            style: TextStyle(
                                color: notifire.getblackcolor,
                                fontFamily: 'InterRegular',
                                fontSize: 16),
                          )),
                    ],
                    onExpansionChanged: (bool expanded) {
                      setState(() {
                        _customTileExpanded2 = expanded;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: Get.width * 0.4,
                  decoration:  BoxDecoration(
                    border: Border(bottom: BorderSide(color: notifire.getgrey1,)),
                  ),
                  child: ExpansionTile(
                    title: Text('How do I request money?'.tr,
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'InterRegular',
                            color: notifire.getblackcolor)),
                    trailing: (_customTileExpanded3
                        ? Image.asset(
                      'assets/minus-square.png',
                      height: 16,
                    )
                        : Image.asset(
                      'assets/add-square.png',
                      height: 16,
                    )),
                    children: <Widget>[
                      Divider(
                        color: Colors.grey.withOpacity(0.10),
                        thickness: 1,
                        height: 0,
                        indent: 2,
                        endIndent: 2,
                      ),
                      ListTile(
                          title: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
                                .tr,
                            style: TextStyle(
                                color: notifire.getblackcolor,
                                fontFamily: 'UrbanistMedium',
                                fontSize: 16),
                          )),
                    ],
                    onExpansionChanged: (bool expanded) {
                      setState(() {
                        _customTileExpanded3 = expanded;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: Get.width * 0.4,
                  decoration:  BoxDecoration(
                    border: Border(bottom: BorderSide(color: notifire.getgrey1,)),
                  ),
                  child: ExpansionTile(
                    title: Text('I send money internationally?'.tr,
                        style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'InterRegular',
                            color: notifire.getblackcolor)),
                    trailing: (_customTileExpanded4
                        ? Image.asset(
                      'assets/minus-square.png',
                      height: 16,
                    )
                        : Image.asset(
                      'assets/add-square.png',
                      height: 16,
                    )),
                    children: <Widget>[
                      Divider(
                        color: Colors.grey.withOpacity(0.10),
                        thickness: 1,
                        height: 0,
                        indent: 2,
                        endIndent: 2,
                      ),
                      ListTile(
                          title: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
                                .tr,
                            style: TextStyle(
                                color: notifire.getblackcolor,
                                fontFamily: 'InterRegular',
                                fontSize: 16),
                          )),
                    ],
                    onExpansionChanged: (bool expanded) {
                      setState(() {
                        _customTileExpanded4 = expanded;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: Get.width * 0.4,
                  decoration:  BoxDecoration(
                    border: Border(bottom: BorderSide(color: notifire.getgrey1,)),
                  ),
                  child: ExpansionTile(
                    title: Text('Help?'.tr,
                        style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'InterRegular',
                            color: notifire.getblackcolor)),
                    trailing: (_customTileExpanded5
                        ? Image.asset(
                      'assets/minus-square.png',
                      height: 16,
                    )
                        : Image.asset(
                      'assets/add-square.png',
                      height: 16,
                    )),
                    children: <Widget>[
                      Divider(
                        color: Colors.grey.withOpacity(0.10),
                        thickness: 1,
                        height: 0,
                        indent: 2,
                        endIndent: 2,
                      ),
                      ListTile(
                          title: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
                                .tr,
                            style: TextStyle(
                                color: notifire.getblackcolor,
                                fontFamily: 'InterRegular',
                                fontSize: 16),
                          )),
                    ],
                    onExpansionChanged: (bool expanded) {
                      setState(() {
                        _customTileExpanded5 = expanded;
                      });
                    },
                  ),
                ),
              ],
            ),
          )
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
