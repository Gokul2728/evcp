// ignore_for_file: file_names, non_constant_identifier_names, deprecated_member_use
import 'package:dotted_border/dotted_border.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';



import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:timeline_tile/timeline_tile.dart';



import '../../confing/list.dart';
import '../../confing/notifier.dart';
import '../../controller/page_controller.dart';
import '../Dashboard/Dashboard_main.dart';




class Version1 extends StatefulWidget {
  const Version1({super.key});

  @override
  State<Version1> createState() => _Version1State();
}

class _Version1State extends State<Version1> {
  bool profilePage = false;
  List checkBox = [];
  SampleItem? selectedMenu;
  int selectIndex = 0;
  int selectIndex1 = 0;
  late ColorNotifier notifire;
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
  int a = 15;
  bool supportHover = false;

  bool switc = false;
  ScrollController pg  = ScrollController();
  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifier>(context, listen: true);
    return GetBuilder<InboxController>(builder: (inboxController) {
      return LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return  Container(
              color: notifire.getbgcolor10,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    container1(constraints.maxWidth ),
                  ],
                ),
              ),

            );

          }
          else if (constraints.maxWidth < 1000) {
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
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            container2(constraints. maxWidth),
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
                  scrollbarTheme: const ScrollbarThemeData(
                      thickness: MaterialStatePropertyAll(4),
                      thumbColor: MaterialStatePropertyAll(
                        Colors.grey,
                      ))),
              child: Container(
                decoration:  BoxDecoration(
                    color: notifire.getbgcolor10
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: Get.width,
                        height: Get.height,
                        child: firstContainer(
                            constraints: constraints.maxWidth, context: context),),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      );
    },
    );
  }

  Widget firstContainer({ context,constraints}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20,left: 20,right: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: container ? container2(constraints) : container1( constraints),
          ),
          const SizedBox(width: 10,),
          constraints < 600 ? const SizedBox() : Expanded(flex: 5, child: container2(constraints),
          ),
        ],
      ),
    );
  }


  Widget container1(constraints) {
    return GetBuilder<InboxController>(builder: (controller) {
      return
        constraints < 600 ?
        Container(

          decoration:  BoxDecoration(
            color: notifire.getbgcolor10,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(color: notifire.getbgcolor11,borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Tracking',
                          style: TextStyle(
                            fontFamily: 'InterRegular',
                            fontSize: 18,
                            fontWeight: FontWeight.w600,color: notifire.getblackcolor,),
                        ),
                        const Spacer(),
                        Image.asset('assets/search-normal.png',height: 16),
                        const SizedBox(width: 20,),
                        Image.asset('assets/map.png',height: 16,)
                      ],
                    ),
                    const SizedBox(height: 20,),
                    SizedBox(
                      height: 45,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: model().ver.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectIndex = index ;
                              });
                            },
                            child: PopupMenuButton(
                              tooltip: '',
                              offset: const Offset(10, 10),
                              shape:
                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              elevation: 1,
                              splashRadius: 1,
                              constraints: const BoxConstraints(
                                maxWidth: 380,
                                minWidth: 380,
                              ),
                              shadowColor: Colors.grey,
                              color: notifire.getbgcolor11,
                              itemBuilder: (context) => [
                                PopupMenuItem(
                                    height: 30,
                                    padding: EdgeInsets.zero,
                                    enabled: false,
                                    child: Container(
                                      height: 500,
                                      padding: const EdgeInsets.all(12),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.start ,
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Image.asset('assets/times.png',height: 16,color: const Color(0xff727880),),
                                                Image.asset('assets/more.png',height: 16,color: const Color(0xff727880),),
                                              ],),
                                            const SizedBox(height: 10,),
                                            const Divider(color: Color(0xffEEEEEE),height: 10,),
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text('SP-829Ha008',style: TextStyle(fontFamily: 'InterRegular',fontSize: 26,fontWeight: FontWeight.w500, color: notifire.getblackcolor,),),
                                                    const SizedBox(width: 10,),
                                                    Container(
                                                      padding: const EdgeInsets.all(6),
                                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: notifire.getbgcolor10),
                                                      child: const Text('On Route',style: TextStyle(color: Color(0xff7DC066),fontSize: 14,fontFamily: 'InterRegular',)),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 20,),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        const Text('Departure Time',style: TextStyle(fontFamily: 'InterRegular',fontSize: 12,fontWeight: FontWeight.w600,color: Color(0xff9DA2A7)),),
                                                        const SizedBox(height: 10,),
                                                        Text('21 May 12:09 PM',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,)),
                                                        const SizedBox(height: 20,),
                                                        const Text('Total Distance',style: TextStyle(fontFamily: 'InterRegular',fontSize: 12,fontWeight: FontWeight.w600,color: Color(0xff9DA2A7)),),
                                                        const SizedBox(height: 10,),
                                                        Text('1.900 Km',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),)
                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        const Text('Arrival Time',style: TextStyle(fontFamily: 'InterRegular',fontSize: 12,fontWeight: FontWeight.w600,color: Color(0xff9DA2A7)),),
                                                        const SizedBox(height: 10,),
                                                        Text('29 May 11:09 PM',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),),
                                                        const SizedBox(height: 20,),
                                                        const Text('Next Point Distance',style: TextStyle(fontFamily: 'InterRegular',fontSize: 12,fontWeight: FontWeight.w600,color: Color(0xff9DA2A7)),),
                                                        const SizedBox(height: 10,),
                                                        Text('5 Km',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),)
                                                      ],
                                                    ),

                                                  ],
                                                ),
                                                const SizedBox(height: 10,),
                                                Text('Driver',style: TextStyle( color: notifire.getblackcolor,fontFamily: 'InterRegular',fontSize: 16,fontWeight: FontWeight.w600),),
                                                const SizedBox(height: 10,),
                                                DottedBorder(
                                                    borderType: BorderType.RRect,
                                                    radius: const Radius.circular(12),
                                                    padding: const EdgeInsets.all(12),
                                                    color: const Color(0xffC6C8CB),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        Image.asset('assets/avatar-6 1.png',height: 32,),
                                                        const SizedBox(width: 10,),
                                                        Column(
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text('Dianne Russell',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),),
                                                            Row(
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                              children: [
                                                                const Text('6 years exp',style: TextStyle(fontFamily: 'InterRegular',color: Color(0xff727880),fontSize: 12,),),
                                                                const SizedBox(width: 5,),
                                                                Image.asset('assets/Ellipse 88.png',height: 5,color: const Color(0xffC6C8CB)),
                                                                const SizedBox(width: 5,),
                                                                const Text('IAA',style: TextStyle(fontFamily: 'InterRegular',fontSize: 12,color: Color(0xff727880),),),

                                                              ],),
                                                          ],
                                                        ),
                                                        const Spacer(),
                                                        Image.asset('assets/call.png',color: const Color(0xffC6C8CB),height: 24,),
                                                        const SizedBox(width: 10,),
                                                        Image.asset('assets/message12.png',height: 24,color: const Color(0xffC6C8CB),)
                                                      ],
                                                    )),
                                                const SizedBox(height: 10,),
                                                Text('Vehicle',style: TextStyle( color: notifire.getblackcolor,fontFamily: 'InterRegular',fontSize: 16,fontWeight: FontWeight.w600),),
                                                const SizedBox(height: 10,),


                                                DottedBorder(
                                                    borderType: BorderType.RRect,
                                                    radius: const Radius.circular(12),
                                                    padding: const EdgeInsets.all(12),
                                                    color: const Color(0xffC6C8CB),
                                                    child: Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Image.asset('assets/Media.png',height: 32,),
                                                        const SizedBox(width: 10,),
                                                        Column(
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text('Kenworth Truck ',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),),
                                                            Row(
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                              children: [
                                                                const Text('International',style: TextStyle(fontFamily: 'InterRegular',color: Color(0xff9DA2A7),fontSize: 10,),),
                                                                const SizedBox(width: 5,),
                                                                Image.asset('assets/Ellipse 88.png',height: 5,color: const Color(0xffC6C8CB)),
                                                                const SizedBox(width: 5,),
                                                                const Text('JE839HF83',style: TextStyle(fontFamily: 'InterRegular',fontSize: 10,color: Color(0xff9DA2A7),),),

                                                              ],),
                                                          ],
                                                        ),
                                                        const SizedBox(width: 10,),
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Text('10.02 MPG',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),),
                                                            const Row(
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                              children: [
                                                                Text('Fuel',style: TextStyle(fontSize: 10,color: Color(0xff9DA2A7),fontFamily: 'InterRegular',),),
                                                              ],),
                                                          ],
                                                        ),

                                                      ],
                                                    )),
                                                const SizedBox(height: 10,),
                                                Text('Routes Report',style: TextStyle(fontSize: 16,fontFamily: 'InterRegular', color: notifire.getblackcolor,fontWeight: FontWeight.w600,),),
                                                const SizedBox(height: 10,),

                                                TimelineTile(
                                                  isFirst: true,
                                                  hasIndicator: true,
                                                  endChild:  Padding(
                                                    padding: const EdgeInsets.only(top: 15,left: 10),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Text('0496 8th Street',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),),
                                                            const Text('12 May 14:42 PM',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                          ],
                                                        ),
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Text('Office Funiture',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),),
                                                            const Text('Product Type',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                          ],
                                                        ),
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Text('374Kg',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),),
                                                            const Text('Weight',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  // isFirst: true,
                                                  beforeLineStyle:
                                                  const LineStyle(color: Color(0xff595FE5), thickness: 2),
                                                  indicatorStyle: IndicatorStyle(
                                                    height: 10,
                                                    width: 10,
                                                    indicator: Container(
                                                      height: 15,
                                                      width: 15,
                                                      decoration:  const BoxDecoration(
                                                          color: Color(0xff595FE5),
                                                          shape: BoxShape.circle
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                TimelineTile(
                                                  endChild:  Padding(
                                                    padding: const EdgeInsets.only(top: 15,left: 10),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Text('6 Holy Cross Circle',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),),
                                                            const Text('25 May 1:23 PM',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                          ],
                                                        ),
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Text('Office Funiture',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,)),
                                                            const Text('Product Type',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                          ],
                                                        ),
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Text('100Kg',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),),
                                                            const Text('Weight',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  // isFirst: true,
                                                  beforeLineStyle:
                                                  const LineStyle(color: Color(0xff595FE5), thickness: 2),
                                                  indicatorStyle: IndicatorStyle(
                                                    height: 10,
                                                    width: 10,
                                                    indicator: Container(
                                                      height: 15,
                                                      width: 15,

                                                      decoration:  const BoxDecoration(
                                                          color: Color(0xff595FE5),
                                                          shape: BoxShape.circle
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                TimelineTile(
                                                  endChild:  Padding(
                                                    padding: const EdgeInsets.only(top: 15,left: 10),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Text('23 Amroli-Utran',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),),
                                                            const Text('5 Nov 4:45 PM',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                          ],
                                                        ),
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Text('Clothes',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),),
                                                            const Text('Product Type',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                          ],
                                                        ),
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Text('10Kg',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),),
                                                            const Text('Weight',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  // isFirst: true,
                                                  beforeLineStyle:
                                                  const LineStyle(color: Color(0xff595FE5), thickness: 2),
                                                  indicatorStyle: IndicatorStyle(
                                                    height: 10,
                                                    width: 10,
                                                    indicator: Container(
                                                      height: 15,
                                                      width: 15,

                                                      decoration:  const BoxDecoration(
                                                          color: Color(0xff595FE5),
                                                          shape: BoxShape.circle
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                TimelineTile(
                                                  endChild:  Padding(
                                                    padding: const EdgeInsets.only(top: 15,left: 10),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Text('Amroli Station Circle',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),),
                                                            const Text('18 Dec 11:45 PM',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                          ],
                                                        ),
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Text('Office Funiture',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),),
                                                            const Text('Product Type',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                          ],
                                                        ),
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Text('50Kg',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),),
                                                            const Text('Weight',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  // isFirst: true,
                                                  beforeLineStyle:
                                                  const LineStyle(color: Color(0xff595FE5), thickness: 2),
                                                  indicatorStyle: IndicatorStyle(
                                                    height: 10,
                                                    width: 10,
                                                    indicator: Container(
                                                      height: 15,
                                                      width: 15,
                                                      decoration:  const BoxDecoration(
                                                          color: Color(0xff595FE5),
                                                          shape: BoxShape.circle
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                TimelineTile(
                                                  endChild:  Padding(
                                                    padding: const EdgeInsets.only(top: 15,left: 10),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Text('23 Amroli-Utran',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),),
                                                            const Text('25 May 1:23 PM',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                          ],
                                                        ),
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Text('Clothes',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),),
                                                            const Text('Product Type',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                          ],
                                                        ),
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Text('10Kg',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),),
                                                            const Text('Weight',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  // isFirst: true,
                                                  beforeLineStyle:
                                                  const LineStyle(color: Color(0xff595FE5), thickness: 2),
                                                  indicatorStyle: IndicatorStyle(
                                                    height: 10,
                                                    width: 10,
                                                    indicator: Container(
                                                      height: 15,
                                                      width: 15,
                                                      decoration:  const BoxDecoration(
                                                          color: Color(0xff595FE5),
                                                          shape: BoxShape.circle
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                TimelineTile(
                                                  endChild:  Padding(
                                                    padding: const EdgeInsets.only(top: 15,left: 10),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Text('6 Holy Cross Circle',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),),
                                                            const Text('25 May 1:23 PM',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                          ],
                                                        ),
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Text('Office Funiture',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),),
                                                            const Text('Product Type',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                          ],
                                                        ),
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Text('100Kg',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),),
                                                            const Text('Weight',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  // isFirst: true,
                                                  beforeLineStyle:
                                                  const LineStyle(color: Color(0xff595FE5), thickness: 2),
                                                  indicatorStyle: IndicatorStyle(
                                                    height: 10,
                                                    width: 10,
                                                    indicator: Container(
                                                      height: 15,
                                                      width: 15,

                                                      decoration:  const BoxDecoration(
                                                          color: Color(0xff595FE5),
                                                          shape: BoxShape.circle
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                TimelineTile(
                                                  endChild:  Padding(
                                                    padding: const EdgeInsets.only(top: 15,left: 10),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Text('23 Amroli-Utran',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),),
                                                            const Text('5 Nov 4:45 PM',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                          ],
                                                        ),
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Text('Clothes',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),),
                                                            const Text('Product Type',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                          ],
                                                        ),
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Text('10Kg',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),),
                                                            const Text('Weight',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  // isFirst: true,
                                                  beforeLineStyle:
                                                  const LineStyle(color: Color(0xff595FE5), thickness: 2),
                                                  indicatorStyle: IndicatorStyle(
                                                    height: 10,
                                                    width: 10,
                                                    indicator: Container(
                                                      height: 15,
                                                      width: 15,

                                                      decoration:  const BoxDecoration(
                                                          color: Color(0xff595FE5),
                                                          shape: BoxShape.circle
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                TimelineTile(
                                                  endChild:  Padding(
                                                    padding: const EdgeInsets.only(top: 15,left: 10),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Text('Amroli Station Circle',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),),
                                                            const Text('18 Dec 11:45 PM',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                          ],
                                                        ),
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Text('Office Funiture',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),),
                                                            const Text('Product Type',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                          ],
                                                        ),
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Text('50Kg',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),),
                                                            const Text('Weight',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  // isFirst: true,
                                                  beforeLineStyle:
                                                  const LineStyle(color: Color(0xff595FE5), thickness: 2,),

                                                  indicatorStyle: IndicatorStyle(
                                                    height: 10,
                                                    width: 10,
                                                    indicator: Container(
                                                      height: 15,
                                                      width: 15,

                                                      decoration:  const BoxDecoration(
                                                          color: Color(0xff595FE5),
                                                          shape: BoxShape.circle
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                TimelineTile(
                                                  endChild:  Padding(
                                                    padding: const EdgeInsets.only(top: 15,left: 10),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Text('23 Amroli-Utran',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),),
                                                            const Text('25 May 1:23 PM',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                          ],
                                                        ),
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Text('Clothes',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),),
                                                            const Text('Product Type',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                          ],
                                                        ),
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Text('10Kg',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),),
                                                            const Text('Weight',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  // isFirst: true,
                                                  beforeLineStyle:
                                                  const LineStyle(color: Color(0xff595FE5), thickness: 2),
                                                  indicatorStyle: IndicatorStyle(
                                                    height: 10,
                                                    width: 10,
                                                    indicator: Container(
                                                      height: 15,
                                                      width: 15,

                                                      decoration:  const BoxDecoration(
                                                          color: Color(0xff595FE5),
                                                          shape: BoxShape.circle
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ))
                              ],
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                margin: const EdgeInsets.only(left: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: selectIndex == index
                                      ? notifire.Getblg2
                                      : notifire.getbgcolor11,
                                ),
                                child: Center(
                                  child: Row(
                                    children: [
                                      Text(model().ver[index],style: TextStyle(fontFamily: 'InterRegular',fontSize:14,fontWeight: FontWeight.w500, color: selectIndex == index ? const Color(0xff2a70fe) : const Color( 0xff738096),)),
                                      const SizedBox(width: 20,),
                                      Container(
                                        height: 24,
                                        width: 24,
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: selectIndex == index ? notifire.getbgcolor11 :notifire.getbgcolor10,) ,
                                        child: Center(child: Text(model().varr[index],style:  TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: selectIndex == index ? const Color(0xff2a70fe) : const Color( 0xff738096),))),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 20,),
                    ListView.builder(
                      itemCount: model().vaes1.length,
                      shrinkWrap: true,physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => container2(constraints)));
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                color: notifire.getbgcolor10,
                                borderRadius: BorderRadius.circular(12),border: Border.all(color: selectIndex1 == index ? const Color(0xff595FE5) :const Color(0xffEEEEEE))),
                            child:  Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(model().vars[index],style:  TextStyle(fontSize: 14,fontFamily: 'InterRegular',fontWeight: FontWeight.w600,color: notifire.getblackcolor)),
                                    const Spacer(),
                                    Container(
                                        height: 25,
                                        padding: const EdgeInsets.all(5) ,
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: model().versi[index],),
                                        child: Center(child: Text(model().vaes1[index],style: TextStyle(fontFamily: 'InterRegular',fontSize: 11,color: model().vaes2[index]),)))
                                  ],
                                ),
                                const SizedBox(height: 20,),

                                const SizedBox(height: 20,),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: notifire.getbgcolor11,),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text('Departure:',style: TextStyle(fontFamily: 'InterRegular',fontSize: 12,color: Color(0xff9DA2A7)),),
                                           SizedBox(height: 10,),
                                          Text('Arrival:',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff9DA2A7)),)
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(model().version[index],style: const TextStyle(fontSize: 12, fontFamily: 'InterRegular',color:Color(0xff9DA2A7))),
                                          const SizedBox(height: 10,),
                                          Text(model().version1[index],style: const TextStyle(fontSize: 12, fontFamily: 'InterRegular',color:Color(0xff9DA2A7), ),)
                                        ],),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text(model().version2[index],style:  TextStyle(fontFamily: 'InterRegular',fontSize: 18,fontWeight: FontWeight.w500,color: notifire.getblackcolor,),),
                                          const Text('Distance left',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff9DA2A7),),)
                                        ],)
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20,),
                                Row(
                                  children: [
                                    Image.asset(model().version3[index],height: 35,),
                                    const SizedBox(width: 10,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(model().verion[index],style: const TextStyle(fontSize: 12, fontFamily: 'InterRegular',fontWeight: FontWeight.w500,color: Color(0xff727880)),),
                                        const SizedBox(height: 5,),
                                        Text(model().Verion1[index],style: const TextStyle(fontFamily: 'InterRegular',fontSize: 10,color: Color(0xff9DA2A7),),)
                                      ],
                                    ),
                                    const Spacer(),
                                    Image.asset('assets/call.png',height: 16,color: const Color(0xffC6C8CB),),
                                    const SizedBox(width: 20,),
                                    Image.asset('assets/messenger.png',height: 16,color: const Color(0xffC6C8CB),)
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },)
                  ],
                ),
              ),
            ),
          ),
        ):
        Container(
          height: MediaQuery.of(context).size.height,
          decoration:  BoxDecoration(
            color: notifire.getbgcolor10,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: notifire.getbgcolor11,borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Tracking',
                        style: TextStyle(
                          fontFamily: 'InterRegular',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,color: notifire.getblackcolor,),
                      ),
                      const Spacer(),
                      Image.asset('assets/search-normal.png',height: 16),
                      const SizedBox(width: 20,),
                      Image.asset('assets/map.png',height: 16,)
                    ],
                  ),
                  const SizedBox(height: 20,),
                  SizedBox(
                    height: 45,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: model().ver.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectIndex = index ;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: selectIndex == index
                                  ? notifire.Getblg2
                                  : notifire.getbgcolor11,
                            ),
                            child: Center(
                              child: Row(
                                children: [
                                  Text(model().ver[index],style: TextStyle(fontFamily: 'InterRegular',fontSize:14,fontWeight: FontWeight.w500, color: selectIndex == index ? const Color(0xff2a70fe) : const Color( 0xff738096),)),
                                  const SizedBox(width: 20,),
                                  Container(
                                    height: 24,
                                    width: 24,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: selectIndex == index ? notifire.getbgcolor11 :notifire.getbgcolor10,) ,
                                    child: Center(child: Text(model().varr[index],style:  TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: selectIndex == index ? const Color(0xff2a70fe) : const Color( 0xff738096),))),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20,),
                  ListView.builder(
                    itemCount: model().vaes1.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectIndex1 = index;

                          });
                        },
                        child: PopupMenuButton(
                          tooltip: '',
                          offset: const Offset(10, 10),
                          shape:
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          elevation: 1,
                          splashRadius: 1,
                          constraints: const BoxConstraints(
                            maxWidth: 380,
                            minWidth: 380,
                          ),
                          shadowColor: Colors.grey,
                          color: notifire.getbgcolor11,
                          itemBuilder: (context) => [
                            PopupMenuItem(
                                height: 30,
                                padding: EdgeInsets.zero,
                                enabled: false,
                                child: Container(
                                  height: 500,
                                  padding: const EdgeInsets.all(12),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start ,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Image.asset('assets/times.png',height: 16,color: const Color(0xff727880),),
                                            Image.asset('assets/more.png',height: 16,color: const Color(0xff727880),),
                                          ],),
                                        const SizedBox(height: 10,),
                                        const Divider(color: Color(0xffEEEEEE),height: 10,),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text('SP-829Ha008',style: TextStyle(fontFamily: 'InterRegular',fontSize: 26,fontWeight: FontWeight.w500, color: notifire.getblackcolor,),),
                                                const SizedBox(width: 10,),
                                                Container(
                                                  padding: const EdgeInsets.all(6),
                                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: notifire.getbgcolor10),
                                                  child: const Text('On Route',style: TextStyle(color: Color(0xff7DC066),fontSize: 14,fontFamily: 'InterRegular',)),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 20,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    const Text('Departure Time',style: TextStyle(fontFamily: 'InterRegular',fontSize: 12,fontWeight: FontWeight.w600,color: Color(0xff9DA2A7)),),
                                                    const SizedBox(height: 10,),
                                                    Text('21 May 12:09 PM',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,)),
                                                    const SizedBox(height: 20,),
                                                    const Text('Total Distance',style: TextStyle(fontFamily: 'InterRegular',fontSize: 12,fontWeight: FontWeight.w600,color: Color(0xff9DA2A7)),),
                                                    const SizedBox(height: 10,),
                                                    Text('1.900 Km',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),)
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    const Text('Arrival Time',style: TextStyle(fontFamily: 'InterRegular',fontSize: 12,fontWeight: FontWeight.w600,color: Color(0xff9DA2A7)),),
                                                    const SizedBox(height: 10,),
                                                    Text('29 May 11:09 PM',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),),
                                                    const SizedBox(height: 20,),
                                                    const Text('Next Point Distance',style: TextStyle(fontFamily: 'InterRegular',fontSize: 12,fontWeight: FontWeight.w600,color: Color(0xff9DA2A7)),),
                                                    const SizedBox(height: 10,),
                                                    Text('5 Km',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),)
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    const Text('Present Time',style: TextStyle(fontFamily: 'InterRegular',fontSize: 12,fontWeight: FontWeight.w600,color: Color(0xff9DA2A7)),),
                                                    const SizedBox(height: 10,),
                                                    Text('12 May 19:10 AM',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),),
                                                    const SizedBox(height: 20,),
                                                    const Text('Remain Distance',style: TextStyle(fontFamily: 'InterRegular',fontSize: 12,fontWeight: FontWeight.w600,color: Color(0xff9DA2A7)),),
                                                    const SizedBox(height: 10,),
                                                    Text('23 Km',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),)
                                                  ],
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 10,),
                                            Text('Driver',style: TextStyle( color: notifire.getblackcolor,fontFamily: 'InterRegular',fontSize: 16,fontWeight: FontWeight.w600),),
                                            const SizedBox(height: 10,),
                                            DottedBorder(
                                                borderType: BorderType.RRect,
                                                radius: const Radius.circular(12),
                                                padding: const EdgeInsets.all(12),
                                                color: const Color(0xffC6C8CB),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Image.asset('assets/avatar-6 1.png',height: 32,),
                                                    const SizedBox(width: 10,),
                                                    Column(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text('Dianne Russell',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          children: [
                                                            const Text('6 years exp',style: TextStyle(fontFamily: 'InterRegular',color: Color(0xff727880),fontSize: 12,),),
                                                            const SizedBox(width: 5,),
                                                            Image.asset('assets/Ellipse 88.png',height: 5,color: const Color(0xffC6C8CB)),
                                                            const SizedBox(width: 5,),
                                                            const Text('IAA',style: TextStyle(fontFamily: 'InterRegular',fontSize: 12,color: Color(0xff727880),),),

                                                          ],),
                                                      ],
                                                    ),
                                                    const Spacer(),
                                                    Image.asset('assets/call.png',color: const Color(0xffC6C8CB),height: 24,),
                                                    const SizedBox(width: 10,),
                                                    Image.asset('assets/message12.png',height: 24,color: const Color(0xffC6C8CB),)
                                                  ],
                                                )),
                                            const SizedBox(height: 10,),
                                            Text('Vehicle',style: TextStyle( color: notifire.getblackcolor,fontFamily: 'InterRegular',fontSize: 16,fontWeight: FontWeight.w600),),
                                            const SizedBox(height: 10,),


                                            DottedBorder(
                                                borderType: BorderType.RRect,
                                                radius: const Radius.circular(12),
                                                padding: const EdgeInsets.all(12),
                                                color: const Color(0xffC6C8CB),
                                                child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Image.asset('assets/Media.png',height: 32,),
                                                    const SizedBox(width: 10,),
                                                    Column(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text('Kenworth Truck ',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          children: [
                                                            const Text('International',style: TextStyle(fontFamily: 'InterRegular',color: Color(0xff9DA2A7),fontSize: 10,),),
                                                            const SizedBox(width: 5,),
                                                            Image.asset('assets/Ellipse 88.png',height: 5,color: const Color(0xffC6C8CB)),
                                                            const SizedBox(width: 5,),
                                                            const Text('JE839HF83',style: TextStyle(fontFamily: 'InterRegular',fontSize: 10,color: Color(0xff9DA2A7),),),

                                                          ],),
                                                      ],
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text('10.02 MPG',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),),
                                                        const Row(
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          children: [
                                                            Text('Avg. Fuel ',style: TextStyle(fontSize: 10,color: Color(0xff9DA2A7),fontFamily: 'InterRegular',),),
                                                          ],),
                                                      ],
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text('68.7 MPH',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),),
                                                        const Text('Avg. Speed',style: TextStyle(fontFamily: 'InterRegular',fontSize: 10,color: Color(0xff9DA2A7),),),
                                                      ],
                                                    ),
                                                  ],
                                                )),
                                            const SizedBox(height: 10,),
                                            Text('Routes Report',style: TextStyle(fontSize: 16,fontFamily: 'InterRegular', color: notifire.getblackcolor,fontWeight: FontWeight.w600,),),
                                            const SizedBox(height: 10,),

                                            TimelineTile(
                                              isFirst: true,
                                              hasIndicator: true,
                                              endChild:  Padding(
                                                padding: const EdgeInsets.only(top: 15,left: 10),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text('0496 8th Street',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),),
                                                        const Text('12 May 14:42 PM',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                      ],
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text('Office Funiture',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),),
                                                        const Text('Product Type',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                      ],
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text('374Kg',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),),
                                                        const Text('Weight',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              // isFirst: true,
                                              beforeLineStyle:
                                              const LineStyle(color: Color(0xff595FE5), thickness: 2),
                                              indicatorStyle: IndicatorStyle(
                                                height: 10,
                                                width: 10,
                                                indicator: Container(
                                                  height: 15,
                                                  width: 15,
                                                  decoration:  const BoxDecoration(
                                                      color: Color(0xff595FE5),
                                                      shape: BoxShape.circle
                                                  ),
                                                ),
                                              ),
                                            ),
                                            TimelineTile(
                                              endChild:  Padding(
                                                padding: const EdgeInsets.only(top: 15,left: 10),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text('6 Holy Cross Circle',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),),
                                                        const Text('25 May 1:23 PM',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                      ],
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text('Office Funiture',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,)),
                                                        const Text('Product Type',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                      ],
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text('100Kg',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),),
                                                        const Text('Weight',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              // isFirst: true,
                                              beforeLineStyle:
                                              const LineStyle(color: Color(0xff595FE5), thickness: 2),
                                              indicatorStyle: IndicatorStyle(
                                                height: 10,
                                                width: 10,
                                                indicator: Container(
                                                  height: 15,
                                                  width: 15,

                                                  decoration:  const BoxDecoration(
                                                      color: Color(0xff595FE5),
                                                      shape: BoxShape.circle
                                                  ),
                                                ),
                                              ),
                                            ),
                                            TimelineTile(
                                              endChild:  Padding(
                                                padding: const EdgeInsets.only(top: 15,left: 10),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text('23 Amroli-Utran',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),),
                                                        const Text('5 Nov 4:45 PM',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                      ],
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text('Clothes',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),),
                                                        const Text('Product Type',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                      ],
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text('10Kg',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),),
                                                        const Text('Weight',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              // isFirst: true,
                                              beforeLineStyle:
                                              const LineStyle(color: Color(0xff595FE5), thickness: 2),
                                              indicatorStyle: IndicatorStyle(
                                                height: 10,
                                                width: 10,
                                                indicator: Container(
                                                  height: 15,
                                                  width: 15,

                                                  decoration:  const BoxDecoration(
                                                      color: Color(0xff595FE5),
                                                      shape: BoxShape.circle
                                                  ),
                                                ),
                                              ),
                                            ),
                                            TimelineTile(
                                              endChild:  Padding(
                                                padding: const EdgeInsets.only(top: 15,left: 10),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text('Amroli Station Circle',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),),
                                                        const Text('18 Dec 11:45 PM',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                      ],
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text('Office Funiture',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),),
                                                        const Text('Product Type',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                      ],
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text('50Kg',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),),
                                                        const Text('Weight',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              // isFirst: true,
                                              beforeLineStyle:
                                              const LineStyle(color: Color(0xff595FE5), thickness: 2),
                                              indicatorStyle: IndicatorStyle(
                                                height: 10,
                                                width: 10,
                                                indicator: Container(
                                                  height: 15,
                                                  width: 15,
                                                  decoration:  const BoxDecoration(
                                                      color: Color(0xff595FE5),
                                                      shape: BoxShape.circle
                                                  ),
                                                ),
                                              ),
                                            ),
                                            TimelineTile(
                                              endChild:  Padding(
                                                padding: const EdgeInsets.only(top: 15,left: 10),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text('23 Amroli-Utran',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),),
                                                        const Text('25 May 1:23 PM',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                      ],
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text('Clothes',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),),
                                                        const Text('Product Type',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                      ],
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text('10Kg',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),),
                                                        const Text('Weight',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              // isFirst: true,
                                              beforeLineStyle:
                                              const LineStyle(color: Color(0xff595FE5), thickness: 2),
                                              indicatorStyle: IndicatorStyle(
                                                height: 10,
                                                width: 10,
                                                indicator: Container(
                                                  height: 15,
                                                  width: 15,
                                                  decoration:  const BoxDecoration(
                                                      color: Color(0xff595FE5),
                                                      shape: BoxShape.circle
                                                  ),
                                                ),
                                              ),
                                            ),
                                            TimelineTile(
                                              endChild:  Padding(
                                                padding: const EdgeInsets.only(top: 15,left: 10),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text('6 Holy Cross Circle',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),),
                                                        const Text('25 May 1:23 PM',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                      ],
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text('Office Funiture',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),),
                                                        const Text('Product Type',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                      ],
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text('100Kg',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),),
                                                        const Text('Weight',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              // isFirst: true,
                                              beforeLineStyle:
                                              const LineStyle(color: Color(0xff595FE5), thickness: 2),
                                              indicatorStyle: IndicatorStyle(
                                                height: 10,
                                                width: 10,
                                                indicator: Container(
                                                  height: 15,
                                                  width: 15,

                                                  decoration:  const BoxDecoration(
                                                      color: Color(0xff595FE5),
                                                      shape: BoxShape.circle
                                                  ),
                                                ),
                                              ),
                                            ),
                                            TimelineTile(
                                              endChild:  Padding(
                                                padding: const EdgeInsets.only(top: 15,left: 10),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text('23 Amroli-Utran',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),),
                                                        const Text('5 Nov 4:45 PM',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                      ],
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text('Clothes',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),),
                                                        const Text('Product Type',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                      ],
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text('10Kg',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),),
                                                        const Text('Weight',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              // isFirst: true,
                                              beforeLineStyle:
                                              const LineStyle(color: Color(0xff595FE5), thickness: 2),
                                              indicatorStyle: IndicatorStyle(
                                                height: 10,
                                                width: 10,
                                                indicator: Container(
                                                  height: 15,
                                                  width: 15,

                                                  decoration:  const BoxDecoration(
                                                      color: Color(0xff595FE5),
                                                      shape: BoxShape.circle
                                                  ),
                                                ),
                                              ),
                                            ),
                                            TimelineTile(
                                              endChild:  Padding(
                                                padding: const EdgeInsets.only(top: 15,left: 10),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text('Amroli Station Circle',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),),
                                                        const Text('18 Dec 11:45 PM',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                      ],
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text('Office Funiture',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),),
                                                        const Text('Product Type',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                      ],
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text('50Kg',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),),
                                                        const Text('Weight',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              // isFirst: true,
                                              beforeLineStyle:
                                              const LineStyle(color: Color(0xff595FE5), thickness: 2,),

                                              indicatorStyle: IndicatorStyle(
                                                height: 10,
                                                width: 10,
                                                indicator: Container(
                                                  height: 15,
                                                  width: 15,

                                                  decoration:  const BoxDecoration(
                                                      color: Color(0xff595FE5),
                                                      shape: BoxShape.circle
                                                  ),
                                                ),
                                              ),
                                            ),
                                            TimelineTile(
                                              endChild:  Padding(
                                                padding: const EdgeInsets.only(top: 15,left: 10),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text('23 Amroli-Utran',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),),
                                                        const Text('25 May 1:23 PM',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                      ],
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text('Clothes',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),),
                                                        const Text('Product Type',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                      ],
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text('10Kg',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),),
                                                        const Text('Weight',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              // isFirst: true,
                                              beforeLineStyle:
                                              const LineStyle(color: Color(0xff595FE5), thickness: 2),
                                              indicatorStyle: IndicatorStyle(
                                                height: 10,
                                                width: 10,
                                                indicator: Container(
                                                  height: 15,
                                                  width: 15,

                                                  decoration:  const BoxDecoration(
                                                      color: Color(0xff595FE5),
                                                      shape: BoxShape.circle
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ))
                          ],
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                color: notifire.getbgcolor10,
                                borderRadius: BorderRadius.circular(12),border: Border.all(color: selectIndex1 == index ? const Color(0xff595FE5) : notifire.getgrey1,)),
                            child:  Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(model().vars[index],style:  TextStyle(fontSize: 14,fontFamily: 'InterRegular',fontWeight: FontWeight.w600,color: notifire.getblackcolor)),
                                    const Spacer(),
                                    Container(
                                        height: 25,
                                        padding: const EdgeInsets.all(5) ,
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: model().versi[index],),
                                        child: Center(child: Text(model().vaes1[index],style: TextStyle(fontFamily: 'InterRegular',fontSize: 11,color: model().vaes2[index]),)))
                                  ],
                                ),
                                const SizedBox(height: 20,),

                                const SizedBox(height: 20,),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: notifire.getbgcolor11,),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text('Departure:',style: TextStyle(fontFamily: 'InterRegular',fontSize: 12,color: Color(0xff9DA2A7)),),
                                          SizedBox(height: 10,),
                                          Text('Arrival:',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff9DA2A7)),)
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(model().version[index],style: const TextStyle(fontSize: 12, fontFamily: 'InterRegular',color:Color(0xff9DA2A7))),
                                          const SizedBox(height: 10,),
                                          Text(model().version1[index],style: const TextStyle(fontSize: 12, fontFamily: 'InterRegular',color:Color(0xff9DA2A7), ),)
                                        ],),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text(model().version2[index],style:  TextStyle(fontFamily: 'InterRegular',fontSize: 18,fontWeight: FontWeight.w500,color: notifire.getblackcolor,),),
                                          const Text('Distance left',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff9DA2A7),),)
                                        ],)
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20,),
                                Row(
                                  children: [
                                    Image.asset(model().version3[index],height: 35,),
                                    const SizedBox(width: 10,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(model().verion[index],style: const TextStyle(fontSize: 12, fontFamily: 'InterRegular',fontWeight: FontWeight.w500,color: Color(0xff727880)),),
                                        const SizedBox(height: 5,),
                                        Text(model().Verion1[index],style: const TextStyle(fontFamily: 'InterRegular',fontSize: 10,color: Color(0xff9DA2A7),),)
                                      ],
                                    ),
                                    const Spacer(),
                                    Image.asset('assets/call.png',height: 16,color: const Color(0xffC6C8CB),),
                                    const SizedBox(width: 20,),
                                    Image.asset('assets/messenger.png',height: 16,color: const Color(0xffC6C8CB),)
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },)
                ],
              ),
            ),
          ),
        );
    },);
  }
  late GoogleMapController mapController;
  Widget container2(constraints) {
    return
      constraints < 600 ?
      Scaffold(
        body: GoogleMap(
          gestureRecognizers: {
            Factory<OneSequenceGestureRecognizer>(() => EagerGestureRecognizer())
          },
          initialCameraPosition: const CameraPosition(target: LatLng(21.2408, 72.8806), zoom: 13),
          padding: EdgeInsets.only(bottom:  Get.width * 1.6),
          mapType: MapType.normal,
          myLocationEnabled: false,
          zoomGesturesEnabled: true,
          tiltGesturesEnabled: true,
          zoomControlsEnabled: true,
          onMapCreated: (controller) {
            setState(() {
              mapController = controller;
            });
          },
        ),

        bottomSheet: Container(
          height: Get.height * 0.3,
          decoration: BoxDecoration(color: notifire.getbgcolor10),
          padding: const EdgeInsets.all(12),
          child: Column(children: [
            Row(children: [
              Text('Route Report',style: TextStyle(fontFamily: 'InterRegular',fontWeight: FontWeight.w600,fontSize: 16,color: notifire.getblackcolor,),),
            ],),
            const SizedBox(height: 8,),
            SizedBox(
              height: Get.height * 0.223,
              width: Get.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: model().veri.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 80,
                        width: 120,
                        margin: const EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(
                            color: notifire.getbgcolor11, borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(image: AssetImage(model().veri[index]),fit: BoxFit.cover)),
                      ),
                      const SizedBox(height: 4,),
                      Row(
                        children: [
                          Image.asset('assets/record-circle.png',height: 12,),
                          const SizedBox(width: 5,),
                          Text('Delivered #24565',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',fontWeight: FontWeight.w500, color: notifire.getblackcolor,),),

                        ],),
                      const SizedBox(height: 4,),
                      Text(model().map[index],style: const TextStyle(fontFamily: 'InterRegular',color: Color(0xff727880),fontSize: 12,)),
                      const SizedBox(height: 4,),
                      Text(model().map1[index],style: const TextStyle(fontSize: 12,color:  Color(0xff727880),fontFamily: 'InterRegular'),)
                    ],
                  );
                },
              ),
            )
          ]),

        ) ,
      ):
      Scaffold(
        body:
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          child: GoogleMap(
            gestureRecognizers: {
              Factory<OneSequenceGestureRecognizer>(() => EagerGestureRecognizer())
            },
            initialCameraPosition: const CameraPosition(target: LatLng(21.2408, 72.8806), zoom: 13),
            padding: const EdgeInsets.symmetric(vertical: 20),
            mapType: MapType.normal,
            myLocationEnabled: false,
            zoomGesturesEnabled: false,
            tiltGesturesEnabled: true,
            zoomControlsEnabled: true,
            onMapCreated: (controller) {
              setState(() {
                mapController = controller;
              });
            },
          ),
        ),

        bottomSheet: Container(
          decoration: BoxDecoration(color: notifire.getbgcolor10),
          padding: const EdgeInsets.all(12),
          height: Get.height * 0.3,
          child: Column(children: [
            Row(children: [
              Text('Route Report',style: TextStyle(fontFamily: 'InterRegular',fontWeight: FontWeight.w600,fontSize: 16, color: notifire.getblackcolor,),),
            ],),
            const SizedBox(height: 8,),
            SizedBox(
              height: Get.height * 0.223,
              width: Get.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: model().veri.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 80,
                        width: 120,
                        margin: const EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(
                            color: notifire.getbgcolor10, borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(image: AssetImage(model().veri[index]),fit: BoxFit.cover)),
                      ),
                      const SizedBox(height: 4,),
                      Row(
                        children: [
                          Image.asset('assets/record-circle.png',height: 12,),
                          const SizedBox(width: 5,),
                          Text('Delivered #24565',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',fontWeight: FontWeight.w500, color: notifire.getblackcolor,),),

                        ],),
                      const SizedBox(height: 4,),
                      Text(model().map[index],style:  const TextStyle(fontFamily: 'InterRegular',color: Color(0xff727880),fontSize: 12, )),
                      const SizedBox(height: 4,),
                      Text(model().map1[index],style: const TextStyle(fontSize: 12,color:  Color(0xff727880),fontFamily: 'InterRegular'),)
                    ],
                  );
                },
              ),
            )
          ]),

        ) ,
      );
  }


}
