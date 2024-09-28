// ignore_for_file: non_constant_identifier_names, file_names
// ignore_for_file: deprecated_member_use


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:evcp/screen/Dashboard/Dashboard_main.dart';


import '../../confing/Rtl.dart';
import '../../confing/colors.dart';
import '../../confing/list.dart';
import '../../confing/notifier.dart';
import '../../controller/page_controller.dart';

import '../login/login.dart';
class BillingDetails2 extends StatefulWidget {
  const BillingDetails2({super.key});

  @override
  State<BillingDetails2> createState() => _BillingDetails2State();
}

class _BillingDetails2State extends State<BillingDetails2> {
  bool isdark = false;
  List<String> list1 = <String>[
    'Year',
    '2007',
    '2008',
    '2009',
    '2010',
    '2011',
    '2012',
    '2013',
    '2014',
    '2015',
    '2016',
    '2017',
    '2018',
    '2019',
    '2020',
  ];
  List<String> list2 = <String>[
    'Month',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
  ];
  late ColorNotifier notifire;
  String dropdownvalue = 'Item 1';
  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifier>(context, listen: true);
    return SizedBox(
      height: Get.height,
      child: Scaffold(
        backgroundColor: notifire.getbgcolor10,

        body: LayoutBuilder(builder: (context, constraints) {
          return LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 600) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(child: Billing_Details2(constraints.maxWidth)),
                    ],
                  ),
                );
              } else if (constraints.maxWidth < 1000) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Center(child: Billing_Details2(constraints.maxWidth)),

                  ],
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Scaffold(
                    appBar: appbar(constraints: constraints.maxWidth),
                    backgroundColor: notifire.getbgcolor10,
                    body: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Center(child: Billing_Details2(constraints.maxWidth)),
                        ],
                      ),
                    ),
                  ),
                );
              }
            },
          );
        }),
      ),
    );
  }
  Widget Billing_Details2(constraints) {

    String dropdownvalue = 'Year';
    String dropdownvalue1 = 'Month';
    return GetBuilder<InboxController>(builder: (inboxController) {
      return
        constraints < 600 ?
        StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                     SizedBox(height: Get.height * 0.10),
                    Container(
                       padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: notifire.getbgcolor11,
                          // border: Border.all(color: Colors.grey.withOpacity(0.4)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                             Text('Billing Details',
                                style: TextStyle(color: notifire.getblackcolor,
                                    fontSize: 22,
                                    fontFamily: 'InterRegular',
                                    fontWeight: FontWeight.w700)),
                            const SizedBox(
                              height: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'If you more info, please check out ',
                                  style: TextStyle(
                                      fontFamily: 'InterRegular', color: notifire.getblackcolor,fontSize: 14),
                                ),
                                InkWell(
                                  onTap: () {

                                  },
                                  child: Text('Help Page.',     style: TextStyle(
                                      fontFamily: 'InterRegular', color: blue,fontSize: 14),),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                             Row(
                              children: [
                                Text(
                                  'Name On Card',
                                  style: TextStyle(color: notifire.getblackcolor,
                                      fontFamily: 'InterRegular',
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextField(
                                style:  TextStyle(color: notifire.getblackcolor,),
                                decoration: InputDecoration(
                                  contentPadding:
                                  const EdgeInsets.only(left: 20, right: 20),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(color: notifire.getgrey1)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(color: notifire.getgrey1)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: blue),
                                      borderRadius: BorderRadius.circular(8)),
                                  suffixIcon: const Padding(
                                    padding: EdgeInsets.only(right: 10),
                                  ),
                                )),
                            const SizedBox(
                              height: 20,
                            ),
                             Row(
                              children: [
                                Text(
                                  'Card Number',
                                  style: TextStyle(
                                      fontFamily: 'InterRegular',color: notifire.getblackcolor,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextField(
                                style:  TextStyle(color: notifire.getblackcolor,),
                                decoration: InputDecoration(
                                  contentPadding:
                                  const EdgeInsets.only(left: 20, right: 20),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(color: notifire.getgrey1)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(color: notifire.getgrey1)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: blue),
                                      borderRadius: BorderRadius.circular(8)),
                                  suffixIcon: const Padding(
                                    padding: EdgeInsets.only(right: 10),
                                  ),
                                )),
                            const SizedBox(
                              height: 20,
                            ),


                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [

                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                       Text(
                                        'Expiration Date',
                                        style: TextStyle(color: notifire.getblackcolor,
                                            fontFamily: 'InterRegular',
                                            fontWeight: FontWeight.w600),
                                        maxLines: 1,
                                      ),
                                      const SizedBox(height: 8,),
                                      Container(
                                        height: 45,
                                        width: 130,
                                        decoration: BoxDecoration(
                                            color: notifire.getbgcolor10,

                                            borderRadius: const BorderRadius.all(
                                                Radius.circular(8))
                                        ),
                                        child: Center(
                                          child: DropdownButton(
                                            isDense: true,
                                            borderRadius:
                                            const BorderRadius.all(Radius.circular(20)),
                                            dropdownColor:  notifire.getbgcolor10,
                                            elevation: 0,
                                            value: dropdownvalue1,
                                            icon: Transform.translate(
                                              offset: const Offset(20, 0),
                                              child: Icon(Icons.keyboard_arrow_down,
                                                  color: grey2),
                                            ),
                                            underline: const SizedBox(),
                                            items: list2.map((String items) {
                                              return DropdownMenuItem(
                                                value: items,
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      decoration: const BoxDecoration(),
                                                      child: Row(
                                                        mainAxisSize: MainAxisSize.min,
                                                        children: [
                                                          Text(items.tr,
                                                              style: TextStyle(
                                                                  fontFamily: 'InterRegular',
                                                                  color: notifire.getblackcolor,fontSize: 12)),
                                                        ],
                                                      ),

                                                    ),
                                                  ],
                                                ),
                                              );

                                            }).toList(),
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                dropdownvalue = newValue!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(""),
                                      const SizedBox(height: 8,),
                                      Container(
                                        height: 45,
                                        width: 130,
                                        decoration: BoxDecoration(
                                            color: notifire.getbgcolor10,

                                            borderRadius: const BorderRadius.all(
                                                Radius.circular(8))),
                                        child: Center(
                                          child: DropdownButton(
                                            isDense: true,
                                            borderRadius:
                                            const BorderRadius.all(Radius.circular(20)),
                                            dropdownColor:  notifire.getbgcolor10,
                                            elevation: 0,
                                            value: dropdownvalue,

                                            icon: Transform.translate(
                                              offset: const Offset(20, 0),
                                              child: Icon(Icons.keyboard_arrow_down,
                                                  color: grey2),
                                            ),
                                            underline: const SizedBox(),
                                            items: list1.map((String items) {
                                              return DropdownMenuItem(
                                                value: items,
                                                child: Center(
                                                  child: Container(
                                                    decoration: const BoxDecoration(),
                                                    child: Center(
                                                      child: Text(items.tr,
                                                          style: TextStyle(
                                                              fontFamily: 'InterRegular',
                                                              color: notifire.getblackcolor,fontSize: 12)),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }).toList(),
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                dropdownvalue = newValue!;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                       Text(
                                        'CVV',
                                        style: TextStyle(color: notifire.getblackcolor,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'InterRegular'),
                                      ),
                                      const SizedBox(height: 8,),
                                      SizedBox(
                                        height: 45,
                                        child:   Container(
                                          decoration: BoxDecoration(color: notifire.getbgcolor10,borderRadius: BorderRadius.circular(8)),
                                          child: TextField(
                                              style:  TextStyle(color: notifire.getblackcolor,),
                                              decoration: InputDecoration(
                                                  hintText: 'cvv',
                                                  hintStyle: TextStyle(color: notifire.getblackcolor,fontSize: 12),
                                                  contentPadding:
                                                  const EdgeInsets.only(left: 20, right: 20),
                                                  border: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(8),
                                                      borderSide: BorderSide(color: notifire.getgrey1)),
                                                  enabledBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(8),
                                                      borderSide: BorderSide(color: notifire.getgrey1)),
                                                  focusedBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(color: blue),
                                                      borderRadius: BorderRadius.circular(8)),
                                                  suffixIcon:  Icon(Icons.credit_card,color: grey2,)
                                              )),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                 Text(
                                  'Save Card for further billing?',
                                  style: TextStyle(
                                      color: notifire.getblackcolor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'InterRegular',fontSize: 14
                                  ),
                                ),
                                const Spacer(),

                                Transform.translate(
                                  offset: const Offset(13, 0),
                                  child: Transform.scale(
                                    scale: 0.6,
                                    child: switchButton(),
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
                                    'If you need more info, please check budget planning.',
                                    style: TextStyle(
                                        fontFamily: 'InterRegular', color: notifire.getblackcolor,),textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Center(
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                            color: notifire.getbgcolor10,
                                            borderRadius:
                                            const BorderRadius.all(
                                              Radius.circular(8),
                                            )),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Center(
                                                child: Image.asset(
                                                    'assets/ArrowLineLeft-s.png',color: notifire.getblackcolor,
                                                    scale: 4)),
                                             Center(
                                                child: Text(
                                                  'Previous',
                                                  style: TextStyle(
                                                      fontSize: 18,color: notifire.getblackcolor,
                                                      fontFamily: 'InterRegular'),
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        Get.offAll(const HomeScreen());
                                      },
                                      child: Container(
                                       padding: const EdgeInsets.all(12),
                                        decoration:  BoxDecoration(
                                            color: notifire.blublack1,
                                            borderRadius: const BorderRadius.all(
                                              Radius.circular(8),
                                            )),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                             Center(
                                                child: Text(
                                                  'Continue',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontFamily: 'InterRegular',
                                                    color: notifire.getbgcolor, ),
                                                )),
                                            Image.asset(
                                                'assets/ArrowLineRight-s.png',color: notifire.getbgcolor,
                                                scale: 4),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )),

                  ],
                ),
              ),
            );
          },
        ):
        StatefulBuilder(
        builder: (context, setState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: Get.height * 0.05),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 0),
                child: Container(
                    height: 620,
                    width: 500,
                    decoration: BoxDecoration(
                      color: notifire.getbgcolor11,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                           Text('Billing Details',
                              style: TextStyle(
                                  fontSize: 22,color: notifire.getblackcolor,
                                  fontFamily: 'InterRegular',
                                  fontWeight: FontWeight.w700)),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'If you need more info, please check out ',
                                style: TextStyle(
                                    fontFamily: 'InterRegular', color: notifire.getblackcolor,),
                              ),
                              InkWell(
                                onTap: () {

                                },
                                child: Text('Help Page.',     style: TextStyle(
                                    fontFamily: 'InterRegular', color: blue),),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                           Row(
                            children: [
                              Text(
                                'Name On Card',
                                style: TextStyle(color: notifire.getblackcolor,
                                    fontFamily: 'InterRegular',
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                              style:  TextStyle(color: notifire.getblackcolor,),
                              decoration: InputDecoration(
                                contentPadding:
                                const EdgeInsets.only(left: 20, right: 20),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(color: notifire.getgrey1)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(color: notifire.getgrey1)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: blue),
                                    borderRadius: BorderRadius.circular(8)),
                                suffixIcon: const Padding(
                                  padding: EdgeInsets.only(right: 10),
                                ),
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                           Row(
                            children: [
                              Text(
                                'Card Number',
                                style: TextStyle(color: notifire.getblackcolor,
                                    fontFamily: 'InterRegular',
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                              style:  TextStyle(color: notifire.getblackcolor,),
                              decoration: InputDecoration(
                                contentPadding:
                                const EdgeInsets.only(left: 20, right: 20),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(color: notifire.getgrey1)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(color: notifire.getgrey1)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: blue),
                                    borderRadius: BorderRadius.circular(8)),
                                suffixIcon: const Padding(
                                  padding: EdgeInsets.only(right: 10),
                                ),
                              )),
                          const SizedBox(
                            height: 20,
                          ),


                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [

                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                     Text(
                                      'Expiration Date',
                                      style: TextStyle(color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular',
                                          fontWeight: FontWeight.w600),
                                      maxLines: 1,
                                    ),
                                    const SizedBox(height: 8,),
                                    Container(
                                      height: 45,

                                      decoration: BoxDecoration(
                                          color: notifire.getbgcolor10,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(8))
                                      ),
                                      child: Center(
                                        child: DropdownButton(
                                          isDense: true,
                                          borderRadius:
                                          const BorderRadius.all(Radius.circular(20)),
                                          dropdownColor: notifire.getbgcolor10,
                                          elevation: 0,
                                          value: dropdownvalue1,
                                          icon: Transform.translate(
                                            offset: const Offset(20, 0),
                                            child: Icon(Icons.keyboard_arrow_down,
                                                color: grey2),
                                          ),
                                          underline: const SizedBox(),
                                          items: list2.map((String items) {
                                            return DropdownMenuItem(
                                              value: items,
                                              child: Row(
                                                children: [
                                                  Container(
                                                    decoration: const BoxDecoration(),
                                                    child: Row(
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        Text(items.tr,
                                                            style: TextStyle(
                                                                fontFamily: 'InterRegular',
                                                              color: notifire.getblackcolor,)),
                                                      ],
                                                    ),

                                                  ),
                                                ],
                                              ),
                                            );

                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              dropdownvalue = newValue!;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("Expiration Date",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.transparent)),
                                    const SizedBox(height: 8,),
                                    Container(
                                      height: 45,

                                      decoration: BoxDecoration(
                                          color: notifire.getbgcolor10,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(8))),
                                      child: Center(
                                        child: DropdownButton(
                                          isDense: true,
                                          borderRadius:
                                          const BorderRadius.all(Radius.circular(20)),
                                          dropdownColor: notifire.getbgcolor10,
                                          elevation: 0,
                                          value: dropdownvalue,

                                          icon: Transform.translate(
                                            offset: const Offset(20, 0),
                                            child: Icon(Icons.keyboard_arrow_down,
                                                color: grey2),
                                          ),
                                          underline: const SizedBox(),
                                          items: list1.map((String items) {
                                            return DropdownMenuItem(
                                              value: items,
                                              child: Center(
                                                child: Container(
                                                  decoration: const BoxDecoration(),
                                                  child: Center(
                                                    child: Text(items.tr,
                                                        style: TextStyle(
                                                            fontFamily: 'InterRegular',
                                                          color: notifire.getblackcolor,)),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              dropdownvalue = newValue!;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                     Text(
                                      'CVV',
                                      style: TextStyle(color: notifire.getblackcolor,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'InterRegular'),
                                    ),
                                    const SizedBox(height: 8,),
                                    Container(
                                       decoration: BoxDecoration(color: notifire.getbgcolor10,borderRadius: BorderRadius.circular(8)),
                                      
                                      child: SizedBox(
                                        height: 45,
                                        child:   TextField(
                                            style: TextStyle(color: notifire.getblackcolor,),
                                            decoration: InputDecoration(
                                                hintText: 'cvv',
                                                hintStyle: TextStyle(color: notifire.getblackcolor,),
                                                contentPadding:
                                                const EdgeInsets.only(left: 20, right: 20),
                                                border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(8),
                                                    borderSide: BorderSide(color: notifire.Getblg2)),

                                                focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: blue),
                                                    borderRadius: BorderRadius.circular(8)),
                                                suffixIcon:  Icon(Icons.credit_card,color: notifire.getgrey1)
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                               Text(
                                'Save Card for further billing?',
                                style: TextStyle(
                                  color: notifire.getblackcolor,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'InterRegular',
                                ),
                              ),
                              const Spacer(),

                              Transform.translate(
                                offset: const Offset(20, 0),
                                child: Text(
                                  'Save Card',
                                  style: TextStyle(
                                      color: notifire.getblackcolor, fontFamily: 'InterRegular'),
                                ),
                              ),

                              Transform.translate(
                                offset: const Offset(13, 0),
                                child: Transform.scale(
                                  scale: 0.6,
                                  child: switchButton(),
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
                                'If you need more info, please check budget planning.',
                                style: TextStyle(
                                    fontFamily: 'InterRegular',color: notifire.getblackcolor,),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                          color: notifire.getbgcolor10,
                                          borderRadius:
                                          const BorderRadius.all(
                                            Radius.circular(8),
                                          )),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Center(
                                              child: Image.asset(
                                                  'assets/ArrowLineLeft-s.png',color: notifire.getblackcolor,
                                                  scale: 4)),
                                           Center(
                                              child: Text(
                                                'Previous',
                                                style: TextStyle(
                                                    fontSize: 18,color: notifire.getblackcolor,
                                                    fontFamily: 'InterRegular'),
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      Get.offAll(const HomeScreen());
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration:  BoxDecoration(
                                          color: notifire.blublack1,
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(8),
                                          )),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                           Center(
                                              child: Text(
                                                'Continue',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontFamily: 'InterRegular',
                                                  color: notifire.getbgcolor,),
                                              )),
                                          Image.asset(
                                              'assets/ArrowLineRight-s.png',color: notifire.getbgcolor,
                                              scale: 4),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
              ),
              // SizedBox(height: Get.height * 0.05),
            ],
          );
        },
      );
    });
  }
  PreferredSizeWidget appbar({required double constraints,}) {return AppBar(
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
      const Flexible(child: SizedBox(width: 10)),
    ],
  );}
  InboxController inboxController = Get.put(InboxController());
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
  bool switc = false;
  SampleItem? selectedMenu;
}



