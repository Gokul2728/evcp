// ignore_for_file: file_names

import 'dart:math' show Random;
// ignore_for_file: deprecated_member_use
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../confing/Rtl.dart';
import '../../confing/colors.dart';
import '../login/login.dart';
import '../../confing/list.dart';
import '../../confing/notifier.dart';
import '../../controller/page_controller.dart';

import '../Dashboard/Dashboard_main.dart';

class Customer extends StatefulWidget {
  const Customer({super.key});

  @override
  State<Customer> createState() => _CustomerState();
}

class _CustomerState extends State<Customer> {
  int selectIndex = 0;
  final DataTableSource _data = MyData();
  final List<String> items = [
    '299',
    '399',
    '599',
    '999',
    '1500',
    '2000',
  ];
  SampleItem? selectedMenu;
  InboxController inboxController = Get.put(InboxController());


  late ColorNotifier notifire;
  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifier>(context, listen: true);
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 700) {
          return  SizedBox(
            height: Get.height,
            child: Scaffold(
              backgroundColor: notifire.getbgcolor10,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    container(constraints.maxWidth),
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
                  Container(
                    decoration:  BoxDecoration(
                      color: notifire.getbgcolor10,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          firstContainer(
                              constraints: constraints.maxWidth, context: context),
                        ],
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
                scrollbarTheme:  const ScrollbarThemeData(
                    thickness: MaterialStatePropertyAll(4),
                    thumbColor: MaterialStatePropertyAll(
                      Colors.grey,
                    ))),
            child: Container(
              color: notifire.getbgcolor10,
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
                              constraints: constraints.maxWidth, context: context)
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
  String? selectedValue;
  bool container2 = false;
  Widget firstContainer({ context,constraints}) {
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
              Text('Profile',style: TextStyle(color: greyy,fontSize: 14,fontFamily: 'InterRegular'),),
              const SizedBox(width: 10,),
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: greyy,),),
              const SizedBox(width: 10,),
              Text('Customer',style: TextStyle(color: notifire.getblackcolor,fontSize: 14,fontFamily: 'InterRegular'),),
            ],
          ),
          const SizedBox(height: 20,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: container2 ? container1(constraints) : container(constraints),
              ),
              const SizedBox(width: 10,),
              constraints < 600 ? const SizedBox() : Expanded(flex: 5, child: container1(constraints),
              )],
          ),
        ],
      ),
    );
  }

  Widget container(constraints){
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
                Text('Profile',style: TextStyle(color: greyy,fontSize: 14,fontFamily: 'InterRegular'),),
                const SizedBox(width: 10,),
                Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: greyy,),),
                const SizedBox(width: 10,),
                Text('Customer',style: TextStyle(color: notifire.getblackcolor,fontSize: 14,fontFamily: 'InterRegular'),),
              ],
            ),
            const SizedBox(height: 20,),
            Container(
              height: Get.height * 0.8,
              padding: const EdgeInsets.all(12),
              decoration:  BoxDecoration(color: notifire.getbgcolor11,borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(child: Image.asset('assets/avatar-6 1.png',height: 70,)),
                    const SizedBox(height: 20,),
                    Center(child: Text('Theresa Webb',style: TextStyle(fontSize: 16,fontFamily: 'InterRegular',fontWeight: FontWeight.w600,color: notifire.getblackcolor,),)),
                    const SizedBox(height: 10,),
                    const Center(child: Text('theresawebb@evcp.com',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: Color(0xff727880)),)),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {

                          },
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),border: Border.all(color: notifire.Getblg2,),
                            ),
                            child: Image.asset('assets/Google.png',height: 18),

                          ),
                        ),
                        const SizedBox(width: 20,),
                        InkWell(
                          onTap: () {

                          },
                          child: Container(

                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),border: Border.all(color: notifire.Getblg2,),
                            ),
                            child: Image.asset('assets/tiktok-colored.png',height: 18),

                          ),
                        ),
                        const SizedBox(width: 20,),
                        InkWell(
                          onTap: () {

                          },
                          child: Container(

                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),border: Border.all(color: notifire.Getblg2,),
                            ),
                            child: Image.asset('assets/whatsapp-colored.png',height: 18),

                          ),
                        ),
                        const SizedBox(width: 20,),
                        InkWell(
                          onTap: () {

                          },
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),border: Border.all(color: notifire.Getblg2,),
                            ),
                            child: Image.asset('assets/instagram-colored.png',height: 18),

                          ),
                        ),
                      ],),
                    const SizedBox(height: 20,),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return InkWell (
                          onTap: () {
                            setState(() {
                              selectIndex = index;
                              Navigator.push(context, MaterialPageRoute(builder: (context) => container1(constraints),));
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            padding:  const EdgeInsets.all(16),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: selectIndex == index ?  notifire.Getblg2: notifire.getbgcolor11),
                            child: Text(model().Cus[index],style: TextStyle(fontSize: 14,color: selectIndex == index ? const Color(0xff595FE5): const Color(0xff727880),fontFamily: 'InterRegular',)),
                          ),
                        );
                      },)
                  ],
                ),
              ),
            ),
          ],
        ),
      ):
      Container(
        height: Get.height * 1.25,
        padding: const EdgeInsets.all(12),
        decoration:  BoxDecoration(color: notifire.getbgcolor11,borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(child: Image.asset('assets/avatar-6 1.png',height: 70,)),
              const SizedBox(height: 20,),
              Center(child: Text('Theresa Webb',style: TextStyle(fontSize: 16,fontFamily: 'InterRegular',fontWeight: FontWeight.w600,color: notifire.getblackcolor,),)),
              const SizedBox(height: 10,),
              const Center(child: Text('theresawebb@evcp.com',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: Color(0xff727880)),)),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {

                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),border: Border.all(color: notifire.Getblg2,),
                      ),
                      child: Image.asset('assets/Google.png',height: 18),

                    ),
                  ),
                  const SizedBox(width: 20,),
                  InkWell(
                    onTap: () {

                    },
                    child: Container(

                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),border: Border.all(color: notifire.Getblg2,),
                      ),
                      child: Image.asset('assets/tiktok-colored.png',height: 18),

                    ),
                  ),
                  const SizedBox(width: 20,),
                  InkWell(
                    onTap: () {

                    },
                    child: Container(

                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),border: Border.all(color: notifire.Getblg2,),
                      ),
                      child: Image.asset('assets/whatsapp-colored.png',height: 18),

                    ),
                  ),
                  const SizedBox(width: 20,),
                  InkWell(
                    onTap: () {

                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),border: Border.all(color: notifire.Getblg2,),
                      ),
                      child: Image.asset('assets/instagram-colored.png',height: 18),

                    ),
                  ),
                ],),
              const SizedBox(height: 20,),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return InkWell (
                    onTap: () {
                      setState(() {
                        selectIndex = index;

                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding:  const EdgeInsets.all(16),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: selectIndex == index ?  notifire.Getblg2 : notifire.getbgcolor11),
                      child: Text(model().Cus[index],style: TextStyle(fontSize: 14,color: selectIndex == index ? const Color(0xff595FE5): const Color(0xff727880),fontFamily: 'InterRegular',)),
                    ),
                  );
                },)
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
  bool isdark = false;
  Widget container1(constraints){
    return
      constraints < 600 ?
      StatefulBuilder( builder: (context, setState) {
        return Scaffold(
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
          backgroundColor: notifire.getbgcolor10,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                          Text('Profile',style: TextStyle(color: greyy,fontSize: 14,fontFamily: 'InterRegular'),),
                          const SizedBox(width: 10,),
                          Container(
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: greyy,),),
                          const SizedBox(width: 10,),
                          Text('Customer',style: TextStyle(color: notifire.getblackcolor,fontSize: 14,fontFamily: 'InterRegular'),),
                        ],
                      ),
                      const SizedBox(height: 20,),
                      Container(
                        width: Get.width,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: notifire.getbgcolor11,),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Billing Address',style: TextStyle(fontFamily: 'InterRegular',fontWeight: FontWeight.w600,fontSize: 16,color: notifire.getblackcolor,),),
                            const SizedBox(height: 20,),
                            Text('Shaiju Malayil\nForks,Alaska\nPhoenix,Arizona 12345\nUnited States\n4646',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor,),),
                            const SizedBox(height: 20,),
                            Container(
                              width: 100,
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: notifire.getbgcolor10,),
                              child: Center(
                                child: Row(
                                  children: [
                                    Image.asset('assets/printer.png',height: 16,color: const Color(0xff727880),),
                                    const SizedBox(width: 10,),
                                    const Text('Print',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,fontWeight: FontWeight.w600,color: Color(0xff727880)),)
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Container(
                        width: Get.width,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: notifire.getbgcolor11,),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Delivery Address',style: TextStyle(fontFamily: 'InterRegular',fontWeight: FontWeight.w600,fontSize: 16,color: notifire.getblackcolor,),),
                            const SizedBox(height: 20,),
                            Text('Shaiju Malayil\nForks,Alaska\nPhoenix,Arizona 12345\nUnited States\n4646',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor,),),
                            const SizedBox(height: 20,),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: notifire.getbgcolor10,),
                                  child: Center(
                                    child: Row(
                                      children: [
                                        Image.asset('assets/printer.png',height: 16,color: const Color(0xff727880),),
                                        const SizedBox(width: 10,),
                                        const Text('Print',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,fontWeight: FontWeight.w600,color: Color(0xff727880)),)
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10,),
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: notifire.Getblg2,),
                                  child: Row(
                                    children: [
                                      Image.asset('assets/flag-2.png',height: 16,color: const Color(0xff595FE5),),
                                      const SizedBox(width: 10,),
                                      const Text('Set Default',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,fontFamily: 'InterRegular',color: Color(0xff595FE5)),)
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Container(
                        width: Get.width,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: notifire.getbgcolor11,),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Profile',style: TextStyle(fontFamily: 'InterRegular',fontWeight: FontWeight.w600,fontSize: 16,color: notifire.getblackcolor,),),
                            const SizedBox(height: 20,),
                            Text('Theresa Webb\nheresawebb@evcp.com\n(+1) 682 7892 9182',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor,),),
                            const Text('evcp.com/theresa_webb_121\n',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: Color(0xff595FE5)),),
                            const SizedBox(height: 20,),
                            Container(
                              width: 110,
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: notifire.getbgcolor10),
                              child: Center(
                                child: Row(
                                  children: [
                                    Image.asset('assets/edit-2.png',height: 16,color: const Color(0xff727880),),
                                    const SizedBox(width: 10,),
                                    const Text('Update',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,fontWeight: FontWeight.w600,color: Color(0xff727880)),)
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      Text('Recent Orders',style: TextStyle(fontFamily: 'InterRegular',fontSize: 18,fontWeight: FontWeight.w500,color: notifire.getblackcolor),),
                      const Spacer(),
                      DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          isExpanded: true,
                          hint:  Row(
                            children: [
                              const SizedBox(
                                width: 4,
                              ),
                              Expanded(
                                child: Text(
                                  'All Status',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'InterRegular',
                                    color: notifire.getblackcolor,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          items: items
                              .map((String item) =>
                              DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style:  TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: notifire.getblackcolor,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ))
                              .toList(),
                          value: selectedValue,
                          onChanged: (String? value) {
                            setState(() {
                              selectedValue = value;
                            });
                          },
                          buttonStyleData: ButtonStyleData(
                            height: 45,
                            width: Get.width * 0.4,
                            padding: const EdgeInsets.only(
                                left: 14, right: 14),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: notifire.getbgcolor11,
                            ),
                            elevation: 0,
                          ),
                          iconStyleData: const IconStyleData(
                            icon: Icon(
                              Icons.keyboard_arrow_down_outlined,color: Color(0xff9DA2A7),
                              size: 25,
                            ),
                            iconSize: 14,
                            iconEnabledColor: Colors.black,
                            iconDisabledColor: Colors.grey,
                          ),
                          dropdownStyleData: DropdownStyleData(
                            maxHeight: 200,
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: notifire.getbgcolor11,
                            ),
                            offset: const Offset(-20, 0),
                            scrollbarTheme: ScrollbarThemeData(
                              radius: const Radius.circular(40),
                              thickness:
                              MaterialStateProperty.all<double>(6),
                              thumbVisibility:
                              MaterialStateProperty.all<bool>(true),
                            ),
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            height: 40,
                            padding: EdgeInsets.only(left: 14, right: 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Theme(
                    data: Theme.of(context).copyWith(
                        cardColor: notifire.getbgcolor11,
                        dividerColor: notifire.getgrey1,
                        dataTableTheme: DataTableThemeData(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)))
                    ),
                    child: PaginatedDataTable(
                      source: _data,
                      columns: const <DataColumn>[
                        DataColumn(
                          label: Text(
                            '',
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            '',
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            '',
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            '',
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            '',
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            '',
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            '',
                          ),
                        ),

                      ],
                      columnSpacing: 50,
                      arrowHeadColor: Colors.black,
                      horizontalMargin: 10,
                      rowsPerPage: 10,
                      showCheckboxColumn: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      ):
      Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(

                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: notifire.getbgcolor11,),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Billing Address',style: TextStyle(fontFamily: 'InterRegular',fontWeight: FontWeight.w600,fontSize: 16,color: notifire.getblackcolor,),),
                      const SizedBox(height: 20,),
                      Text('Shaiju Malayil\nForks,Alaska\nPhoenix,Arizona 12345\nUnited States\n4646',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor,),),
                      const SizedBox(height: 20,),
                      InkWell(
                        onTap: () {

                        },
                        child: Container(
                          width: 100,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: notifire.getbgcolor10,),
                          child: Center(
                            child: Row(
                              children: [
                                Image.asset('assets/printer.png',height: 16,color: const Color(0xff727880),),
                                const SizedBox(width: 10,),
                                const Text('Print',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,fontWeight: FontWeight.w600,color: Color(0xff727880)),)
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10,),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: notifire.getbgcolor11,),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Delivery Address',style: TextStyle(fontFamily: 'InterRegular',fontWeight: FontWeight.w600,fontSize: 16,color: notifire.getblackcolor,),),
                      const SizedBox(height: 20,),
                      Text('Shaiju Malayil\nForks,Alaska\nPhoenix,Arizona 12345\nUnited States\n4646',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor,),),
                      const SizedBox(height: 20,),

                      constraints < 1200 ?
                      Column(
                        children: [
                          InkWell(
                            onTap: () {

                            },
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: notifire.getbgcolor10,),
                              child: Center(
                                child: Row(
                                  children: [
                                    Image.asset('assets/printer.png',height: 16,color: const Color(0xff727880),),
                                    const SizedBox(width: 10,),
                                    const Text('Print',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,fontWeight: FontWeight.w600,color: Color(0xff727880)),)
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10,),
                          InkWell(
                            onTap: () {

                            },
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: notifire.getbgcolor10,),
                              child: Center(
                                child: Row(
                                  children: [
                                    Image.asset('assets/flag-2.png',height: 16,color: const Color(0xff595FE5),),
                                    const SizedBox(width: 10,),
                                    const Text('Set Default',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,fontFamily: 'InterRegular',color: Color(0xff595FE5)),)
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ) :
                      Row(
                        children: [
                          InkWell(
                            onTap: () {

                            },
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: notifire.getbgcolor10,),
                              child: Center(
                                child: Row(
                                  children: [
                                    Image.asset('assets/printer.png',height: 16,color: const Color(0xff727880),),
                                    const SizedBox(width: 10,),
                                    const Text('Print',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,fontWeight: FontWeight.w600,color: Color(0xff727880)),)
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10,),
                          InkWell(
                            onTap: () {

                            },
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: notifire.getbgcolor10,),
                              child: Center(
                                child: Row(
                                  children: [
                                    Image.asset('assets/flag-2.png',height: 16,color: const Color(0xff595FE5),),
                                    const SizedBox(width: 10,),
                                    const Text('Set Default',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,fontFamily: 'InterRegular',color: Color(0xff595FE5)),)
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),

                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10,),
              Expanded(
                child: Container(

                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: notifire.getbgcolor11,),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Profile',style: TextStyle(fontFamily: 'InterRegular',fontWeight: FontWeight.w600,fontSize: 16,color: notifire.getblackcolor,),),
                      const SizedBox(height: 20,),
                      Text('Theresa Webb\nheresawebb@evcp.com\n(+1) 682 7892 9182',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor,),),
                      Text('evcp.com/theresa_webb_121\n',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor,),),
                      const SizedBox(height: 20,),
                      InkWell(
                        onTap: () {

                        },
                        child: Container(
                          width: 110,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: notifire.getbgcolor10,),
                          child: Center(
                            child: Row(
                              children: [
                                Image.asset('assets/edit-2.png',height: 16,color: const Color(0xff727880),),
                                const SizedBox(width: 10,),
                                const Text('Update',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,fontWeight: FontWeight.w600,color: Color(0xff727880)),)
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            children: [
              Text('Recent Orders',style: TextStyle(fontFamily: 'InterRegular',fontSize: 18,fontWeight: FontWeight.w500,color: notifire.getblackcolor,),),
              const Spacer(),
              DropdownButtonHideUnderline(
                child: DropdownButton2<String>(
                  isExpanded: true,
                  hint:  Row(
                    children: [
                      const SizedBox(
                        width: 4,
                      ),
                      Expanded(
                        child: Text(
                          'All Status',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'InterRegular',
                            color: notifire.getblackcolor,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  items: items
                      .map((String item) =>
                      DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style:  TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: notifire.getblackcolor,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ))
                      .toList(),
                  value: selectedValue,
                  onChanged: (String? value) {
                    setState(() {
                      selectedValue = value;
                    });
                  },
                  buttonStyleData: ButtonStyleData(
                    height: 45,
                    width: Get.width * 0.1 ,
                    padding: const EdgeInsets.only(
                        left: 14, right: 14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),

                      color: notifire.getbgcolor11,
                    ),
                    elevation: 0,
                  ),
                  iconStyleData:  IconStyleData(
                    icon: const Icon(
                      Icons.keyboard_arrow_down_outlined,color: Color(0xff9DA2A7),
                      size: 25,
                    ),
                    iconSize: 14,
                    iconEnabledColor: notifire.getblackcolor,
                    iconDisabledColor: Colors.grey,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    maxHeight: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: notifire.getbgcolor11,
                    ),
                    offset: const Offset(-20, 0),
                    scrollbarTheme: ScrollbarThemeData(
                      radius: const Radius.circular(40),
                      thickness:
                      MaterialStateProperty.all<double>(6),
                      thumbVisibility:
                      MaterialStateProperty.all<bool>(true),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    height: 40,
                    padding: EdgeInsets.only(left: 14, right: 14),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10,)
          ,          Theme(
            data: Theme.of(context).copyWith(
                cardColor: notifire.getbgcolor11,
                dividerColor: notifire.getgrey1,
                dataTableTheme: DataTableThemeData(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)))
            ),
            child: SizedBox(
              width: constraints < 1400 ? 1500 : Get.width,
              child: PaginatedDataTable(
                source: _data,
                columns: const <DataColumn>[
                  DataColumn(
                    label: Text(
                      '',
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      '',
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      '',
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      '',
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      '',
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      '',
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      '',
                    ),
                  ),

                ],
                columnSpacing: 50,

                arrowHeadColor: notifire.getblackcolor,
                horizontalMargin: 10,
                rowsPerPage: 10,
                showCheckboxColumn: true,
              ),
            ),
          ),
        ],
      );
  }
}
class MyData extends DataTableSource {
  bool isActive = false;

  final List<Map<String, dynamic>> _data = List.generate(
      10,
          (index) =>
      {
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
              Image.asset('assets/Media31.png',height: 35,),
            ),
            DataCell(
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Polarised Sunglasses',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,fontFamily: 'InterRegular',color: Color(0xff727880),),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text('Color: Green',style: TextStyle(fontSize: 12,color: Color(0xff727880),fontFamily: 'InterRegular',),),
                          const SizedBox(width: 10,),
                          Image.asset('assets/Ellipse 88.png',height: 5,),
                          const SizedBox(width: 10,),
                          const Text('Size: XXL',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880)),),
                        ],
                      )
                    ],
                  ),
                )
            ),
            DataCell(
                Row(children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: const Color(0xff59B4D1)),
                  ),
                  const SizedBox(width: 8,),
                  const Text('Shipping',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: Color(0xff9DA2A7)),)
                ],)
            ),
            const DataCell(
              Text('15 May 2020 8:30 am',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: Color(0xff727880),),),
            ),
            const DataCell(Text('6',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: Color(0xff727880),),)),

            const DataCell(Text('\$78.33',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',fontWeight: FontWeight.w600,color: Color(0xff727880),),)),
            DataCell(Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),))
          ],
        );
      case 1:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              Image.asset('assets/Media(11).png',height: 35,),
            ),
            DataCell(
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('New-season Handbag Haven',style: TextStyle(color: Color(0xff727880),fontWeight: FontWeight.w600,fontSize: 14,fontFamily: 'InterRegular'),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text('Color: Green',style: TextStyle(fontSize: 12,color: Color(0xff727880),fontFamily: 'InterRegular',),),
                          const SizedBox(width: 10,),
                          Image.asset('assets/Ellipse 88.png',height: 5,),
                          const SizedBox(width: 10,),
                          const Text('Size: XXL',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880)),),
                        ],
                      )
                    ],
                  ),
                )
            ),
            DataCell(
                Row(children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: const Color(0xffE5646C)),
                  ),
                  const SizedBox(width: 8,),
                  const Text('Canceled',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: Color(0xff9DA2A7)),)
                ],)
            ),
            const DataCell(
              Text('15 May 2020 4:20 am',style: TextStyle(color: Color(0xff727880),fontSize: 14,fontFamily: 'InterRegular',),),
            ),
            const DataCell(Text('4',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: Color(0xff727880),),)),

            const DataCell(Text('\$8.43',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',fontWeight: FontWeight.w600,color: Color(0xff727880),),)),
            DataCell(Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),))
          ],
        );
      case 2:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              Image.asset('assets/Media26.png',height: 35,),
            ),
            DataCell(
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Long Sleeves Melton Coat',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,fontFamily: 'InterRegular',color: Color(0xff727880),),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text('Color: Green',style: TextStyle(fontSize: 12,color: Color(0xff727880),fontFamily: 'InterRegular',),),
                          const SizedBox(width: 10,),
                          Image.asset('assets/Ellipse 88.png',height: 5,),
                          const SizedBox(width: 10,),
                          const Text('Size: XXL',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880)),),
                        ],
                      )
                    ],
                  ),
                )
            ),
            DataCell(
                Row(children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: const Color(0xff7DC066)),
                  ),
                  const SizedBox(width: 8,),
                  const Text('Finished',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: Color(0xff9DA2A7)),)
                ],)
            ),
            const DataCell(
              Text('15 May 2020 8:30 am',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: Color(0xff727880),),),
            ),
            const DataCell(Text('8',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: Color(0xff727880),),)),

            const DataCell(Text('\$34.56',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',fontWeight: FontWeight.w600,color: Color(0xff727880),),)),
            DataCell(Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),))
          ],
        );
      case 3:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              Image.asset('assets/Media(22).png',height: 35,),
            ),
            DataCell(
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('New-season Handbag Haven',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,fontFamily: 'InterRegular',color: Color(0xff727880),),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text('Color: Green',style: TextStyle(fontSize: 12,color: Color(0xff727880),fontFamily: 'InterRegular',),),
                          const SizedBox(width: 10,),
                          Image.asset('assets/Ellipse 88.png',height: 5,),
                          const SizedBox(width: 10,),
                          const Text('Size: XXL',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880)),),
                        ],
                      )
                    ],
                  ),
                )
            ),
            DataCell(
                Row(children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: const Color(0xff9E57E5)),
                  ),
                  const SizedBox(width: 8,),
                  const Text('To Pay',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: Color(0xff727880),),)
                ],)
            ),
            const DataCell(
              Text('15 May 2020 7:30 am',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: Color(0xff727880),),),
            ),
            const DataCell(Text('4',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: Color(0xff727880),),)),

            const DataCell(Text('\$38.43',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',fontWeight: FontWeight.w600,color: Color(0xff727880),),)),
            DataCell(Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),))
          ],
        );
      case 4:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              Image.asset('assets/Media(1)1.png',height: 35,),
            ),
            DataCell(
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Linen-blend Shirt',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,fontFamily: 'InterRegular',color: Color(0xff727880), ),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text('Color: Green',style: TextStyle(fontSize: 12,color: Color(0xff727880),fontFamily: 'InterRegular',),),
                          const SizedBox(width: 10,),
                          Image.asset('assets/Ellipse 88.png',height: 5,),
                          const SizedBox(width: 10,),
                          const Text('Size: XXL',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880)),),
                        ],
                      )
                    ],
                  ),
                )
            ),
            DataCell(
                Row(children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: const Color(0xff59B4D1)),
                  ),
                  const SizedBox(width: 8,),
                  const Text('Shipping',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: Color(0xff727880),),)
                ],)
            ),
            const DataCell(
              Text('15 May 2020 2:40 am',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: Color(0xff727880),),),
            ),
            const DataCell(Text('4',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: Color(0xff727880),),)),

            const DataCell(Text('\$28.63',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',fontWeight: FontWeight.w600,color: Color(0xff727880),),)),
            DataCell(Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),))
          ],
        );
      case 5:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              Image.asset('assets/Media31.png',height: 35,),
            ),
            DataCell(
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Polarised Sunglasses',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,fontFamily: 'InterRegular',color: Color(0xff727880),),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text('Color: Green',style: TextStyle(fontSize: 12,color: Color(0xff727880),fontFamily: 'InterRegular',),),
                          const SizedBox(width: 10,),
                          Image.asset('assets/Ellipse 88.png',height: 5,),
                          const SizedBox(width: 10,),
                          const Text('Size: XXL',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880)),),
                        ],
                      )
                    ],
                  ),
                )
            ),
            DataCell(
                Row(children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: const Color(0xff59B4D1)),
                  ),
                  const SizedBox(width: 8,),
                  const Text('Shipping',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: Color(0xff727880),),)
                ],)
            ),
            const DataCell(
              Text('15 May 2020 8:30 am',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: Color(0xff727880),),),
            ),
            const DataCell(Text('6',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: Color(0xff727880),),)),

            const DataCell(Text('\$78.33',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',fontWeight: FontWeight.w600,color: Color(0xff727880),),)),
            DataCell(Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),))
          ],
        );
      case 6:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              Image.asset('assets/Media(11).png',height: 35,),
            ),
            DataCell(
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('New-season Handbag Haven',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,fontFamily: 'InterRegular',color: Color(0xff727880),),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text('Color: Green',style: TextStyle(fontSize: 12,color: Color(0xff727880),fontFamily: 'InterRegular',),),
                          const SizedBox(width: 10,),
                          Image.asset('assets/Ellipse 88.png',height: 5,),
                          const SizedBox(width: 10,),
                          const Text('Size: XXL',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880)),),
                        ],
                      )
                    ],
                  ),
                )
            ),
            DataCell(
                Row(children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: const Color(0xffE5646C)),
                  ),
                  const SizedBox(width: 8,),
                  const Text('Canceled',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: Color(0xff9DA2A7)),)
                ],)
            ),
            const DataCell(
              Text('15 May 2020 4:20 am',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: Color(0xff727880),),),
            ),
            const DataCell(Text('4',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: Color(0xff727880),),)),

            const DataCell(Text('\$8.43',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',fontWeight: FontWeight.w600,color: Color(0xff727880),),)),
            DataCell(Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),))
          ],
        );
      case 7:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              Image.asset('assets/Media26.png',height: 35,),
            ),
            DataCell(
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Long Sleeves Melton Coat',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,fontFamily: 'InterRegular',color: Color(0xff727880),),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text('Color: Green',style: TextStyle(fontSize: 12,color: Color(0xff727880),fontFamily: 'InterRegular',),),
                          const SizedBox(width: 10,),
                          Image.asset('assets/Ellipse 88.png',height: 5,),
                          const SizedBox(width: 10,),
                          const Text('Size: XXL',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880)),),
                        ],
                      )
                    ],
                  ),
                )
            ),
            DataCell(
                Row(children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: const Color(0xff7DC066)),
                  ),
                  const SizedBox(width: 8,),
                  const Text('Finished',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: Color(0xff727880),),)
                ],)
            ),
            const DataCell(
              Text('15 May 2020 8:30 am',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: Color(0xff727880),),),
            ),
            const DataCell(Text('8',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: Color(0xff727880),))),

            const DataCell(Text('\$34.56',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',fontWeight: FontWeight.w600,color: Color(0xff727880),),)),
            DataCell(Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),))
          ],
        );
      case 8:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              Image.asset('assets/Media(22).png',height: 35,),
            ),
            DataCell(
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('New-season Handbag Haven',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,fontFamily: 'InterRegular',color: Color(0xff727880),),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text('Color: Green',style: TextStyle(fontSize: 12,color: Color(0xff727880),fontFamily: 'InterRegular',),),
                          const SizedBox(width: 10,),
                          Image.asset('assets/Ellipse 88.png',height: 5,),
                          const SizedBox(width: 10,),
                          const Text('Size: XXL',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880)),),
                        ],
                      )
                    ],
                  ),
                )
            ),
            DataCell(
                Row(children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: const Color(0xff9E57E5)),
                  ),
                  const SizedBox(width: 8,),
                  const Text('To Pay',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: Color(0xff9DA2A7)),)
                ],)
            ),
            const DataCell(
              Text('15 May 2020 7:30 am',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: Color(0xff727880),),),
            ),
            const DataCell(Text('4',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: Color(0xff727880),),)),

            const DataCell(Text('\$38.43',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',fontWeight: FontWeight.w600,color: Color(0xff727880),),)),
            DataCell(Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),))
          ],
        );
      case 9:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              Image.asset('assets/Media(1)1.png',height: 35,),
            ),
            DataCell(
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Linen-blend Shirt',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,fontFamily: 'InterRegular',color: Color(0xff727880),),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text('Color: Green',style: TextStyle(fontSize: 12,color: Color(0xff727880),fontFamily: 'InterRegular',),),
                          const SizedBox(width: 10,),
                          Image.asset('assets/Ellipse 88.png',height: 5,),
                          const SizedBox(width: 10,),
                          const Text('Size: XXL',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880)),),
                        ],
                      )
                    ],
                  ),
                )
            ),
            DataCell(
                Row(children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: const Color(0xff59B4D1)),
                  ),
                  const SizedBox(width: 8,),
                  const Text('Shipping',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: Color(0xff727880),),)
                ],)
            ),
            const DataCell(
              Text('15 May 2020 2:40 am',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: Color(0xff727880),),),
            ),
            const DataCell(Text('4',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: Color(0xff727880),),)),

            const DataCell(Text('\$28.63',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',fontWeight: FontWeight.w600,color: Color(0xff727880),),)),
            DataCell(Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),))
          ],
        );

    }
    return null;
  }
}