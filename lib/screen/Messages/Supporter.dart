// ignore_for_file: prefer_const_constructors, file_names, camel_case_types


import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import 'package:provider/provider.dart';
import 'package:evcp/confing/list.dart';

import '../../confing/Rtl.dart';
import '../../confing/colors.dart';

import '../../confing/notifier.dart';
import '../../controller/page_controller.dart';
import '../Dashboard/Dashboard_main.dart';
import '../login/login.dart';
// ignore_for_file: deprecated_member_use

class Supporter extends StatefulWidget {
  const Supporter({super.key});

  @override
  State<Supporter> createState() => _SupporterState();
}

class _SupporterState extends State<Supporter> {
  bool profilePage = false;
  List checkBox = [];
  int selectIndex = 0;
  int selectIndex1 = 0;
  ColorNotifier notifier = ColorNotifier();
  List abstract = [
    '(406) 555-0120',
    '(404) 545-0450',
    '(403) 655-6780',
    '(357) 855-7897',
    '(678) 455-6460',
    '(756) 555-9770',
    '(234) 585-4560',
    '(567) 335-4578',
    '(402) 245-4568',
    '(410) 785-2356',
  ];
  List abstract1 = [
    '(406) 555-0120',
    '(404) 545-0450',
    '(403) 655-6780',
    '(357) 855-7897',
    '(678) 455-6460',
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
  ];
  List ind = [
    'assets/address.png',
    'assets/inbox.png',
    'assets/Job.png',
  ];

  List ind1 = [
    'Los Angeles, California',
    'jennywilso@gmail.com',
    'Designer, Google',
  ];
  SampleItem? selectedMenu;
  // HtmlEditorController controller = HtmlEditorController();
  InboxController inboxController = (InboxController());
  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    return GetBuilder<InboxController>(
      builder: (inboxController) {
        return LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 600) {
              return Container(
                  color: Colors.white,
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
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.red,
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

  Widget firstContainer({required double size, context}) {
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
              Text('Supporter',style: TextStyle(color: notifier.getblackcolor,fontSize: 14,fontFamily: 'InterRegular'),),
            ],
          ),
          const SizedBox(height: 20,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: container1(context, size),
              ),
              const SizedBox(width: 10,),
              size < 600
                  ? const SizedBox()
                  : Expanded(
                flex: 5,
                child: container2(size),
              ),
              const SizedBox(width: 10,),
              Expanded(flex: 2, child: container3(size)),
            ],
          ),
        ],
      ),
    );
  }

  Widget container1(context, double size) {
    return size < 700
        ? Container(
      height: MediaQuery.of(context).size.height,
      decoration:  BoxDecoration(
        color: notifier.getbgcolor11,
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
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
                  Text('Supporter',style: TextStyle(color: notifier.getblackcolor,fontSize: 14,fontFamily: 'InterRegular'),),
                ],
              ),
              const SizedBox(height: 20,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Today (31)',
                      style: TextStyle(
                          color: Color(0xff9DA2A7), fontSize: 12)),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                shrinkWrap: true,physics: const NeverScrollableScrollPhysics(),
                itemCount: model().limessage.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => container2(size)),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: selectIndex == index
                            ? notifier.Getblg2
                            : notifier.getbgcolor11,
                      ),
                      child: ListTile(
                        leading: InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => container3(size),
                              )),
                          child: Transform.translate(
                            offset: const Offset(0, 4),
                            child: Container(
                                height: 32,
                                width: 32,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: index == 0
                                      ? const Color(0xffF8BEC1)
                                      : index == 1
                                      ? const Color(0xffD9B7FB)
                                      : index == 2
                                      ? const Color(0xffF8BEC1)
                                      : index == 3
                                      ? const Color(
                                      0xffD9B7FB)
                                      : index == 4
                                      ? const Color(
                                      0xffF8BEC1)
                                      : index == 5
                                      ? const Color(
                                      0xffA9DDF5)
                                      : index == 6
                                      ? const Color(
                                      0xffFFC9AC)
                                      : index == 7
                                      ? const Color(
                                      0xffD9B7FB)
                                      : index ==
                                      8
                                      ? const Color(0xffA9DDF5)
                                      : index == 9
                                      ? const Color(0xffFFC9AC)
                                      : Colors.white,
                                ),
                                child: Center(
                                    child: Text(
                                      model().abcd[index],
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'InterRegular'),
                                    ))),
                          ),
                        ),
                        title: Transform.translate(
                          offset: const Offset(-5, 0),
                          child: Text(model().limessage[index],
                              style:  TextStyle(
                                  fontFamily: 'InterRegular',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: notifier.getblackcolor)),
                        ),
                        trailing: Column(
                          children: [
                            Transform.translate(
                              offset: const Offset(0, 10),
                              child: Text(
                                model().messages[index],
                                style: const TextStyle(
                                    color: Color(0xff9DA2A7),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'InterRegular'),
                              ),
                            ),
                            index == 3
                                ? Transform.translate(
                              offset: const Offset(10, 15),
                              child: Container(
                                width: 15,
                                height: 15,
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
                              ),
                            )
                                : const SizedBox(),
                            index == 6
                                ? Transform.translate(
                              offset: const Offset(10, 15),
                              child: Container(
                                width: 15,
                                height: 15,
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
                              ),
                            )
                                : const SizedBox(),
                          ],
                        ),
                        subtitle: Transform.translate(
                          offset: const Offset(-5, 0),
                          child: Row(
                            children: [
                              Text(abstract[index],
                                  style: const TextStyle(
                                      fontFamily: 'InterRegular',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff727880))),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Yesterday (32)',
                      style: TextStyle(
                          color: Color(0xff9DA2A7), fontSize: 12)),
                ],
              ),
              ListView.builder(
                shrinkWrap: true,physics: const NeverScrollableScrollPhysics(),
                itemCount: model().limessage1.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectIndex = index;
                      });
                    },
                    child: ListTile(
                      leading: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: index == 0
                                ? const Color(0xffF8BEC1)
                                : index == 1
                                ? const Color(0xffD9B7FB)
                                : index == 2
                                ? const Color(0xffF8BEC1)
                                : index == 3
                                ? const Color(0xffD9B7FB)
                                : index == 4
                                ? const Color(
                                0xffFFC9AC)
                                : Colors.white,
                          ),
                          child: Center(
                              child: Text(
                                model().abcd1[index],
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'InterRegular'),
                              ))),
                      title: Text(model().limessage[index],
                          style:  TextStyle(
                              fontFamily: 'InterRegular',
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: notifier.getblackcolor)),
                      trailing: Column(
                        children: [
                          Transform.translate(
                            offset: const Offset(0, 10),
                            child: Text(
                              model().messages1[index],
                              style: const TextStyle(
                                  color: Color(0xff9DA2A7),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'InterRegular'),
                            ),
                          ),
                          index == 2
                              ? Transform.translate(
                            offset: const Offset(10, 15),
                            child: Container(
                              width: 15,
                              height: 15,
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
                            ),
                          )
                              : const SizedBox(),
                          index == 4
                              ? Transform.translate(
                            offset: const Offset(10, 15),
                            child: Container(
                              width: 15,
                              height: 15,
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
                            ),
                          )
                              : const SizedBox(),
                        ],
                      ),
                      subtitle: Row(
                        children: [
                          Text(abstract1[index],
                              style: const TextStyle(
                                  fontFamily: 'InterRegular',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff727880))),
                        ],
                      ),
                    ),
                  );
                },
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
          borderRadius: BorderRadius.circular(12)
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Customers',
                    style: TextStyle(
                        fontFamily: 'InterRegular',
                        fontSize: 18,color: notifier.getblackcolor,
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
                          color: const Color(0xffF5F5F5)),
                      child: Center(
                          child: Image.asset(
                            'assets/search-normal.png',
                            color: const Color(0xff727880),
                            height: 16,
                          )),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Today (31)',
                      style: TextStyle(
                          color: Color(0xff9DA2A7), fontSize: 12)),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: model().limessage.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectIndex = index;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: selectIndex == index
                            ? notifier.Getblg2
                            : notifier.getbgcolor11,
                      ),
                      child:
                      Row(crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              height: 32,
                              width: 32,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: index == 0
                                    ? const Color(0xffF8BEC1)
                                    : index == 1
                                    ? const Color(0xffD9B7FB)
                                    : index == 2
                                    ? const Color(0xffF8BEC1)
                                    : index == 3
                                    ? const Color(0xffD9B7FB)
                                    : index == 4
                                    ? const Color(
                                    0xffF8BEC1)
                                    : index == 5
                                    ? const Color(
                                    0xffA9DDF5)
                                    : index == 6
                                    ? const Color(
                                    0xffFFC9AC)
                                    : index == 7
                                    ? const Color(
                                    0xffD9B7FB)
                                    : index ==
                                    8
                                    ? const Color(
                                    0xffA9DDF5)
                                    : index == 9
                                    ? const Color(0xffFFC9AC)
                                    : Colors.white,
                              ),
                              child: Center(
                                  child: Text(
                                    model().abcd[index],
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'InterRegular'),
                                  ))),
                          const SizedBox(width: 10,),
                          Column(crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(model().limessage[index],
                                      style:  TextStyle(
                                          fontFamily: 'InterRegular',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: notifier.getblackcolor)),

                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(abstract[index],
                                      style: const TextStyle(
                                          fontFamily: 'InterRegular',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff727880))),
                                ],
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            children: [
                              Text(
                                model().messages[index],
                                style: const TextStyle(
                                    color: Color(0xff9DA2A7),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'InterRegular'),
                              ),
                              index == 3
                                  ? Container(
                                width: 15,
                                height: 15,
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
                              index == 6
                                  ? Container(
                                width: 15,
                                height: 15,
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
                            ],
                          ),
                        ],

                      ),


                    ),
                  );
                },
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Yesterday (32)',
                      style: TextStyle(
                          color: Color(0xff9DA2A7), fontSize: 12)),
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: model().limessage1.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {

                    },
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          selectIndex1 = index;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: selectIndex1 == index
                              ? notifier.Getblg2
                              : notifier.getbgcolor11,
                        ),
                        child:
                            Row(
                              children: [
                                Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: index == 0
                                          ? const Color(0xffF8BEC1)
                                          : index == 1
                                          ? const Color(0xffD9B7FB)
                                          : index == 2
                                          ? const Color(0xffF8BEC1)
                                          : index == 3
                                          ? const Color(0xffD9B7FB)
                                          : index == 4
                                          ? const Color(
                                          0xffFFC9AC)
                                          : Colors.white,
                                    ),
                                    child: Center(
                                        child: Text(
                                          model().abcd1[index],
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'InterRegular'),
                                        ))),
                                const SizedBox(width: 10,),
                                Column(children: [
                                  Text(model().limessage[index],
                                      style:  TextStyle(
                                        fontFamily: 'InterRegular',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: notifier.getblackcolor,)),
                                  Row(
                                    children: [
                                      Text(abstract1[index],
                                          style: const TextStyle(
                                              fontFamily: 'InterRegular',
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff727880))),
                                    ],
                                  ),
                                ],),
                                const Spacer(),
                                Column(
                                  children: [
                                    Text(
                                      model().messages1[index],
                                      style: const TextStyle(
                                          color: Color(0xff9DA2A7),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'InterRegular'),
                                    ),
                                    index == 2
                                        ? Container(
                                          width: 15,
                                          height: 15,
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
                                          width: 15,
                                          height: 15,
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
                                  ],
                                ),
                              ],
                            )
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
  }
  bool isdark = false;
  Widget container2(size)   {
    return size < 700
        ? DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: notifier.getbgcolor11,
            elevation: 0,
            automaticallyImplyLeading: false,

            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Transform.translate(
                  offset: const Offset(-10, 0),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => container3(size)));
                        // profilePage = !profilePage;
                      });
                    },
                    child: Container(
                      height: 42,
                      width: 42,
                      decoration: const BoxDecoration(
                        color: Color(0xffF8BEC1),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(child:Text(
                        'HD',
                        style: TextStyle(color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'InterRegular'),
                      )),
                    ),
                  ),
                ),
                const SizedBox(width: 10,),
                Transform.translate(offset: const Offset(-5, 0),child:  Text('Bessie Cooper',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifier.getblackcolor,fontWeight: FontWeight.w600),))
              ],
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
                                                bottomLeft:  Radius.circular(10),
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
                                                width: Get.width * 0.4,
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
          bottomSheet:  SizedBox(
            child: Container(
              padding: const EdgeInsets.only(right: 10, left: 10),
              height: 195,
              decoration:  BoxDecoration(
                color: notifier.getbgcolor11,

              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Transform.translate(
                    offset: const Offset(0, -5),
                    child:  TabBar(
                        unselectedLabelStyle:
                        TextStyle(color: Colors.grey),
                        indicatorColor:  notifier.getblackcolor,
                        indicatorPadding:
                        EdgeInsets.symmetric(vertical: 2),
                        isScrollable: true,
                        tabs: [
                          Tab(
                              child: Text(
                                'Chat',
                                style: TextStyle(
                                    color: notifier.getblackcolor,
                                    fontFamily: 'InterRegular',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              )),
                          Tab(
                              child: Text(
                                'EMAIL',
                                style: TextStyle(
                                    color: notifier.getblackcolor,
                                    fontFamily: 'InterRegular',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              )),
                          Tab(
                              child: Text(
                                'FAX & DOCUMENTS',
                                style: TextStyle(
                                    color: notifier.getblackcolor,
                                    fontFamily: 'InterRegular',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              )),
                          Tab(
                              child: Text(
                                'FROMS',
                                style: TextStyle(
                                    color: notifier.getblackcolor,
                                    fontFamily: 'InterRegular',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              ))
                        ]),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Transform.translate(
                    offset: const Offset(0, -5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                              color: notifier.getbgcolor10,),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Image.asset('assets/text-italic.png',height: 16,),
                                    const SizedBox(width: 10,),
                                    Image.asset('assets/text-bold.png',height: 16,), const SizedBox(width: 10,),
                                    Image.asset('assets/text-underline.png',height: 16,), const SizedBox(width: 10,),

                                    Image.asset('assets/Ellipse 88.png',height: 5,), const SizedBox(width: 10,),

                                    Image.asset('assets/textalign-left.png',height: 16,), const SizedBox(width: 10,),
                                    Image.asset('assets/textalign-center.png',height: 16,), const SizedBox(width: 10,),
                                    Image.asset('assets/textalign-right.png',height: 16,), const SizedBox(width: 10,),
                                    Image.asset('assets/textalign-justifycenter.png',height: 16,), const SizedBox(width: 10,),

                                    Image.asset('assets/Ellipse 88.png',height: 5,), const SizedBox(width: 10,),

                                    Image.asset('assets/quote-up.png',height: 16,), const SizedBox(width: 10,),
                                    Image.asset('assets/code.png',height: 16,color: const Color(0xff9DA2A7)),
                                  ],
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Transform.translate(
                                  offset: const Offset(-20, 0),
                                  child: Container(
                                    width: Get.width * 0.3,
                                    height: Get.height * 0.06,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(20)),
                                    child: TextField(
                                      style:  TextStyle(color: notifier.getblackcolor),
                                      decoration: InputDecoration(
                                        hintText: 'Write messages ...',
                                        hintStyle:
                                        TextStyle(color: notifier.getblackcolor),
                                        contentPadding:
                                        const EdgeInsets.only(
                                            left: 20, right: 20),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(20),
                                            borderSide:
                                            BorderSide(color: grey2)),
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
                                Transform.translate(
                                  offset: const Offset(0, -5),
                                  child: Row(
                                    children: [
                                      Image.asset('assets/add-square.png',
                                          height: 16),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Image.asset('assets/microphone.png',
                                          height: 16),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Image.asset(
                                          'assets/emoji-happy.png',
                                          height: 16),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      const Icon(Icons.link,
                                          size: 20,
                                          color: Color(0xff727880)),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Image.asset(
                                        'assets/hashtag1.png',
                                        height: 16,
                                      ),
                                      const Spacer(),
                                      InkWell(
                                          onTap: () {},
                                          child: Container(
                                              height: 40,
                                              padding:
                                              const EdgeInsets.all(
                                                  10),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(12),
                                                  color: const Color(
                                                      0xff595FE5)),
                                              child: Center(
                                                child: Row(
                                                  children: [
                                                    const Text(
                                                      'Send',
                                                      style: TextStyle(
                                                          fontFamily:
                                                          'InterRegular',
                                                          color: Colors
                                                              .white,
                                                          fontSize: 14),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Image.asset(
                                                      'assets/send-2.png',
                                                      height: 18,
                                                    ),
                                                  ],
                                                ),
                                              ))),
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
                ],
              ),
            ),
          ),
        ),
      ),
    )
        : DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Scaffold(
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
                                                bottomLeft:  Radius.circular(10),
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
                                            color: notifier.Getblack,
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
          bottomSheet:  SizedBox(
            child: Container(
              padding: const EdgeInsets.only(right: 10, left: 10),
              height: 195,
              decoration:  BoxDecoration(
                color: notifier.getbgcolor11,

              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Transform.translate(
                    offset: const Offset(0, -5),
                    child:  TabBar(
                        unselectedLabelStyle:
                        TextStyle(color: Colors.grey),
                        indicatorColor:  notifier.getblackcolor,
                        indicatorPadding:
                        EdgeInsets.symmetric(vertical: 2),
                        isScrollable: true,
                        tabs: [
                          Tab(
                              child: Text(
                                'Chat',
                                style: TextStyle(
                                    color: notifier.getblackcolor,
                                    fontFamily: 'InterRegular',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              )),
                          Tab(
                              child: Text(
                                'EMAIL',
                                style: TextStyle(
                                    color: notifier.getblackcolor,
                                    fontFamily: 'InterRegular',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              )),
                          Tab(
                              child: Text(
                                'FAX & DOCUMENTS',
                                style: TextStyle(
                                    color: notifier.getblackcolor,
                                    fontFamily: 'InterRegular',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              )),
                          Tab(
                              child: Text(
                                'FROMS',
                                style: TextStyle(
                                    color: notifier.getblackcolor,
                                    fontFamily: 'InterRegular',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              ))
                        ]),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Transform.translate(
                    offset: const Offset(0, -5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                              color: notifier.getbgcolor10,),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/text-italic.png',
                                      height: 16,
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Image.asset(
                                      'assets/text-bold.png',
                                      height: 16,
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Image.asset(
                                      'assets/text-underline.png',
                                      height: 16,
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Image.asset(
                                      'assets/Ellipse 88.png',
                                      height: 5,
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Image.asset(
                                      'assets/textalign-left.png',
                                      height: 16,
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Image.asset(
                                      'assets/textalign-center.png',
                                      height: 16,
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Image.asset(
                                      'assets/textalign-right.png',
                                      height: 16,
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Image.asset(
                                      'assets/textalign-justifycenter.png',
                                      height: 16,
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Image.asset(
                                      'assets/Ellipse 88.png',
                                      height: 5,
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Image.asset(
                                      'assets/quote-up.png',
                                      height: 16,
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Image.asset('assets/code.png',
                                        height: 16,
                                        color: const Color(0xff9DA2A7)),
                                  ],
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Transform.translate(
                                  offset: const Offset(-20, 0),
                                  child: Container(
                                    width: Get.width * 0.3,
                                    height: Get.height * 0.06,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(20)),
                                    child: TextField(
                                      style:  TextStyle(color: notifier.getblackcolor),
                                      decoration: InputDecoration(
                                        hintText: 'Write messages ...',
                                        hintStyle:
                                        TextStyle(color: notifier.getblackcolor),
                                        contentPadding:
                                        const EdgeInsets.only(
                                            left: 20, right: 20),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(20),
                                            borderSide:
                                            BorderSide(color: grey2)),
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
                                Transform.translate(
                                  offset: const Offset(0, -5),
                                  child: Row(
                                    children: [
                                      Image.asset('assets/add-square.png',
                                          height: 16),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Image.asset('assets/microphone.png',
                                          height: 16),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Image.asset(
                                          'assets/emoji-happy.png',
                                          height: 16),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      const Icon(Icons.link,
                                          size: 20,
                                          color: Color(0xff727880)),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Image.asset(
                                        'assets/hashtag1.png',
                                        height: 16,
                                      ),
                                      const Spacer(),
                                      InkWell(
                                          onTap: () {},
                                          child: Container(
                                              height: 40,
                                              padding:
                                              const EdgeInsets.all(
                                                  10),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(12),
                                                  color: const Color(
                                                      0xff595FE5)),
                                              child: Center(
                                                child: Row(
                                                  children: [
                                                    const Text(
                                                      'Send',
                                                      style: TextStyle(
                                                          fontFamily:
                                                          'InterRegular',
                                                          color: Colors
                                                              .white,
                                                          fontSize: 14),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Image.asset(
                                                      'assets/send-2.png',
                                                      height: 18,
                                                    ),
                                                  ],
                                                ),
                                              ))),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget container3(size) {
    return size < 700
        ? StatefulBuilder(
      builder: (context, setState) {
        return Scaffold(
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
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: const Color(0xff595FE5),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 10),
                          Container(
                            height: 80,
                            width: 80,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xffF8BEC1),
                            ),
                            child: const Center(
                                child: Text('BS',
                                    style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        fontSize: 20))),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "Robert Fox",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontFamily: 'InterRegular',
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "(890)455-677",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              fontFamily: "PublicSansRegular",
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            // mainAxisSize: MainAxisSize.max,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  width: 46,
                                  height: 40,
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white),
                                  child: Center(
                                      child: Image.asset(
                                        'assets/call.png',
                                        height: 16,
                                        color: const Color(0xffE5646C),
                                      )),
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  width: 46,
                                  height: 40,
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white),
                                  child: Center(
                                      child: Image.asset('assets/timer.png',
                                          height: 16)),
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  width: 46,
                                  height: 40,
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white),
                                  child: Center(
                                      child: Image.asset(
                                        'assets/calendar.png',
                                        height: 16,
                                        color: const Color(0xffF3935D),
                                      )),
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  width: 46,
                                  height: 40,
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white),
                                  child: Center(
                                      child: Image.asset(
                                        'assets/more-circle.png',
                                        height: 16,
                                        color: Colors.black,
                                      )),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: notifier.getbgcolor11,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Text(
                                'About Customer',
                                style: TextStyle(color: notifier.getblackcolor,
                                    fontFamily: 'InterRegular',
                                    fontWeight: FontWeight.w600),
                              ),
                              const Spacer(),
                              Image.asset(
                                'assets/more.png',
                                height: 18,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/address.png',
                                height: 16,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Los Angeles, California',
                                style: TextStyle(
                                    fontFamily: 'InterRegular', fontSize: 14,color: notifier.getblackcolor),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/inbox.png',
                                height: 16,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'jennywilso@gmail.com',
                                style: TextStyle(
                                    fontFamily: 'InterRegular', fontSize: 14,color: notifier.getblackcolor),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/Job.png',
                                height: 16,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Designer, Google',
                                style: TextStyle(
                                    fontFamily: 'InterRegular', fontSize: 14,color: notifier.getblackcolor),
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
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: notifier.getbgcolor11,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Text(
                                'All Channels',
                                style: TextStyle(color: notifier.getblackcolor,
                                    fontFamily: 'InterRegular',
                                    fontWeight: FontWeight.w600),
                              ),
                              const Spacer(),
                              Image.asset(
                                'assets/more.png',
                                height: 18,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/mobile.png',
                                height: 16,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                '(308) 555-0121',
                                style: TextStyle(
                                    fontFamily: 'InterRegular',
                                    fontSize: 14,color: notifier.getblackcolor
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/whatsapp.png',
                                height: 16,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                'chat.whatsapp.com/je...',
                                style: TextStyle(
                                    fontFamily: 'InterRegular',
                                    fontSize: 14,
                                    color: Color(0xff595FE5)),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/messenger.png',
                                height: 16,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                'messenger.com/jenyw...',
                                style: TextStyle(
                                    fontFamily: 'InterRegular',
                                    fontSize: 14,
                                    color: Color(0xff595FE5)),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Row(
                              children: [
                                Image.asset('assets/add.png',
                                    height: 16,
                                    color: const Color(0xff595FE5)),
                                const SizedBox(
                                  width: 3,
                                ),
                                const Text(
                                  'Add',
                                  style: TextStyle(
                                      fontFamily: 'InterRegular',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff595FE5)),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: notifier.getbgcolor11,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Tags',
                                style: TextStyle(color: notifier.getblackcolor,
                                    fontFamily: 'InterRegular',
                                    fontWeight: FontWeight.w600),
                              ),
                              const Spacer(),
                              Image.asset(
                                'assets/more.png',
                                height: 18,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            width: 140,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color(0xffA9DDF5)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset('assets/hashtag1.png',
                                    color: const Color(0xff1B1D1F),
                                    height: 14),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text('new customer',
                                    style: TextStyle(
                                        color: Color(0xff1B1D1F),
                                        fontFamily: 'InterRegular',
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(
                                    right: 10, left: 10, bottom: 5, top: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color(0xffD9B7FB)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset('assets/hashtag1.png',
                                        color: const Color(0xff1B1D1F),
                                        height: 14),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Text('supported',
                                        style: TextStyle(
                                            color: Color(0xff1B1D1F),
                                            fontFamily: 'InterRegular',
                                            fontWeight: FontWeight.w600)),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color(0xffF8BEC1)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset('assets/hashtag1.png',
                                        color: const Color(0xff1B1D1F),
                                        height: 14),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Text('call support',
                                        style: TextStyle(
                                            color: Color(0xff1B1D1F),
                                            fontFamily: 'InterRegular',
                                            fontWeight: FontWeight.w600)),
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Row(
                              children: [
                                Image.asset('assets/add.png',
                                    height: 16,
                                    color: const Color(0xff595FE5)),
                                const SizedBox(
                                  width: 3,
                                ),
                                const Text(
                                  'Add',
                                  style: TextStyle(
                                      fontFamily: 'InterRegular',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff595FE5)),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: notifier.getbgcolor11,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Note',
                                style: TextStyle(color: notifier.getblackcolor,
                                    fontFamily: 'InterRegular',
                                    fontWeight: FontWeight.w600),
                              ),
                              const Spacer(),
                              Image.asset(
                                'assets/more.png',
                                height: 18,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: Text(
                                      'The customer needs to talk about the price plans. I supported anything she need',
                                      style: TextStyle(
                                          color: Color(0xff727880),
                                          fontFamily: 'InterRegular',
                                          fontWeight: FontWeight.w600))),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
        )
        : Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          color: notifier.getbgcolor11,
          borderRadius: BorderRadius.circular( 12)
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: const Color(0xff595FE5),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 10),
                    Container(
                      height: 80,
                      width: 80,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffF8BEC1),
                      ),
                      child: const Center(
                          child: Text('BS',
                              style: TextStyle(
                                  fontFamily: 'InterRegular',
                                  fontSize: 20))),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Robert Fox",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: 'InterRegular',
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "(890)455-677",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        fontFamily: "PublicSansRegular",
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: 46,
                            height: 40,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white),
                            child: Center(
                                child: Image.asset(
                                  'assets/call.png',
                                  height: 16,
                                  color: const Color(0xffE5646C),
                                )),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: 46,
                            height: 40,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white),
                            child: Center(
                                child: Image.asset('assets/timer.png',
                                    height: 16)),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: 46,
                            height: 40,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white),
                            child: Center(
                                child: Image.asset(
                                  'assets/calendar.png',
                                  height: 16,
                                  color: const Color(0xffF3935D),
                                )),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: 46,
                            height: 40,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white),
                            child: Center(
                                child: Image.asset(
                                  'assets/more-circle.png',
                                  height: 16,
                                  color: Colors.black,
                                )),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: notifier.Getblg2,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Text(
                          'About Customer',
                          style: TextStyle(
                              fontFamily: 'InterRegular',color: notifier.getblackcolor,
                              fontWeight: FontWeight.w600),
                        ),
                        const Spacer(),
                        Image.asset(
                          'assets/more.png',
                          height: 18,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/address.png',
                          height: 16,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Los Angeles, California',
                          style: TextStyle(color: notifier.getblackcolor,
                              fontFamily: 'InterRegular', fontSize: 14),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/inbox.png',
                          height: 16,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'jennywilso@gmail.com',
                          style: TextStyle(color: notifier.getblackcolor,
                              fontFamily: 'InterRegular', fontSize: 14),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/Job.png',
                          height: 16,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Designer, Google',
                          style: TextStyle(color: notifier.getblackcolor,
                              fontFamily: 'InterRegular', fontSize: 14),
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
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: notifier.Getblg2,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Text(
                          'All Channels',
                          style: TextStyle(color: notifier.getblackcolor,
                              fontFamily: 'InterRegular',
                              fontWeight: FontWeight.w600),
                        ),
                        const Spacer(),
                        Image.asset(
                          'assets/more.png',
                          height: 18,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/mobile.png',
                          height: 16,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '(308) 555-0121',
                          style: TextStyle(color: notifier.getblackcolor,
                            fontFamily: 'InterRegular',
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/whatsapp.png',
                          height: 16,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'chat.whatsapp.com/je...',
                          style: TextStyle(
                              fontFamily: 'InterRegular',
                              fontSize: 14,
                              color: Color(0xff595FE5)),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/messenger.png',
                          height: 16,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'messenger.com/jenyw...',
                          style: TextStyle(
                              fontFamily: 'InterRegular',
                              fontSize: 14,
                              color: Color(0xff595FE5)),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          Image.asset('assets/add.png',
                              height: 16, color: const Color(0xff595FE5)),
                          const SizedBox(
                            width: 3,
                          ),
                          const Text(
                            'Add',
                            style: TextStyle(
                                fontFamily: 'InterRegular',
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff595FE5)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: notifier.Getblg2,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Tags',
                          style: TextStyle(color: notifier.getblackcolor,
                              fontFamily: 'InterRegular',
                              fontWeight: FontWeight.w600),
                        ),
                        const Spacer(),
                        Image.asset(
                          'assets/more.png',
                          height: 18,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: 140,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xffA9DDF5)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset('assets/hashtag1.png',
                              color: const Color(0xff1B1D1F), height: 14),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text('new customer',
                              style: TextStyle(
                                  color: Color(0xff1B1D1F),
                                  fontFamily: 'InterRegular',
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color(0xffD9B7FB)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset('assets/hashtag1.png',
                                  color: const Color(0xff1B1D1F),
                                  height: 14),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text('supported',
                                  style: TextStyle(fontSize: 14,
                                      color: Color(0xff1B1D1F),
                                      fontFamily: 'InterRegular',
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color(0xffF8BEC1)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset('assets/hashtag1.png',
                                  color: const Color(0xff1B1D1F),
                                  height: 14),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text('call support',
                                  style: TextStyle(fontSize: 14,
                                      color: Color(0xff1B1D1F),
                                      fontFamily: 'InterRegular',
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          Image.asset('assets/add.png',
                              height: 16, color: const Color(0xff595FE5)),
                          const SizedBox(
                            width: 3,
                          ),
                          const Text(
                            'Add',
                            style: TextStyle(
                                fontFamily: 'InterRegular',
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff595FE5)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: notifier.Getblg2,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Note',
                          style: TextStyle(color: notifier.getblackcolor,
                              fontFamily: 'InterRegular',
                              fontWeight: FontWeight.w600),
                        ),
                        const Spacer(),
                        Image.asset(
                          'assets/more.png',
                          height: 18,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Text(
                                'The customer needs to talk about the price plans. I supported anything she need',
                                style: TextStyle(
                                    color: Color(0xff727880),
                                    fontFamily: 'InterRegular',
                                    fontWeight: FontWeight.w600))),
                      ],
                    ),
                  ],
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
