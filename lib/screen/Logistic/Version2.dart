// ignore_for_file: non_constant_identifier_names, file_names

import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
// ignore_for_file: deprecated_member_use
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../confing/colors.dart';
import '../../confing/image.dart';
import '../../confing/list.dart';
import '../../confing/notifier.dart';
import '../../controller/page_controller.dart';
import '../Dashboard/Dashboard_main.dart';


class Version2 extends StatefulWidget {
  const Version2({super.key});

  @override
  State<Version2> createState() => _Version2State();
}

class _Version2State extends State<Version2> {
  DateRangePickerController dateSelecter = DateRangePickerController();
  TextEditingController dateController1 = TextEditingController();

  late GoogleMapController mapController;
  bool Compose = false;
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
  String? selectedValue;
  final List<String> items = [

    'Rahul Kohli',
    'Akshay Kumar',
    'Harsha Agrawal',
    'Mahavir Agrawal',
  ];
  final List items1 = [
    'assets/avatar-6 1.png',
    'assets/avatar-7 1.png',
    'assets/avatar-8 1.png',
    'assets/Avatar62.png',
    'assets/Avatar1.png',
  ];
  int value = 0;
  DateTime? sdate;
  TimeOfDay? selectTime;
  int selectIndex = 0;
  DateTime selectedDate1 = DateTime.now();
  late ColorNotifier notifire;
  void _onselectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is PickerDateRange) {
    } else if (args.value is DateTime) {
    } else if (args.value is List<DateTime>) {
    } else {}
  }
  SampleItem? selectedMenu;
  bool supportHover = false;

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifier>(context, listen: true);
    return GetBuilder<InboxController>(builder: (inboxController) {
      return LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return SizedBox(
              height: Get.height,
              child: Scaffold(

               appBar: AppBar(
                   shadowColor: grey1,
                 backgroundColor:  notifire.getbgcolor10,
                  elevation: 0.6,

                  actions: [
                    Row(
                      children: [

                        PopupMenuButton(
                          tooltip: '',
                          padding: const EdgeInsets.all(10),
                          offset: const Offset(0, 50),
                          shape:
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          initialValue: selectedMenu,
                          elevation: 0,
                          shadowColor: Colors.grey,
                          color:  notifire.getbgcolor11,


                          onSelected: (SampleItem item) {
                            setState(() {
                              selectedMenu = item;
                            });
                          },

                          itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<SampleItem>>[
                            PopupMenuItem<SampleItem>(
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              height: 35,
                              enabled: false,
                              value: SampleItem.itemOne,
                              child: Row(
                                children: [
                                  SvgPicture.asset('assets/routing-2.svg',height: 16,
                                    color: notifire.getblackcolor, ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Text(
                                      'Tracking Routes',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'InterRegular',
                                        color: notifire.getblackcolor,),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            PopupMenuItem<SampleItem>(
                              padding:  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              height: 35,
                              enabled: false,
                              value: SampleItem.itemTwo,
                              child: InkWell(
                                onTap: () {},
                                child: Row(
                                  children: [
                                    SvgPicture.asset('assets/truck.svg',
                                        color: notifire.getblackcolor, height: 16),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                     Text(
                                      'Vehicles',
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
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              height: 35,
                              enabled: false,
                              value: SampleItem.itemThree,
                              child: InkWell(
                                onTap: () {},
                                child: Row(
                                  children: [
                                    SvgPicture.asset('assets/chart.svg',
                                        color: notifire.getblackcolor, height: 16),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                     Text(
                                      'Analytics',
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
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              height: 35,
                              enabled: false,
                              value: SampleItem.itemThree,
                              child: InkWell(
                                onTap: () {},
                                child: Row(
                                  children: [
                                    SvgPicture.asset('assets/house.svg',
                                        color: notifire.getblackcolor, height: 16),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                     Text(
                                      'Warehouse',
                                      style: TextStyle(
                                          fontFamily: 'InterRegular',
                                          color: notifire.getblackcolor,
                                          fontSize: 15),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                              color: notifire.getbgcolor11,),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Center(
                                  child: Image.asset(
                                    'assets/setting-5.png',
                                    scale: 4,
                                  )),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10,),
                        PopupMenuButton(
                          tooltip: '',
                          offset: const Offset(10, 50),
                          shape:
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          elevation: 1,
                          splashRadius: 1,
                          constraints: const BoxConstraints(
                            maxWidth: 350,
                            minWidth: 350,
                          ),
                          shadowColor: Colors.grey,
                          color: notifire.getbgcolor10,
                          itemBuilder: (context) =>  <PopupMenuEntry<SampleItem>>[
                            PopupMenuItem(
                                height: 30,
                                padding: EdgeInsets.zero,
                                enabled: false,
                                child: PopupMenuButton(
                                  tooltip: '',

                                  offset: const Offset(10, 50),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),

                                  splashRadius: 1,
                                  constraints: const BoxConstraints(
                                    maxWidth: 350,
                                    minWidth: 350,
                                  ),
                                  shadowColor: Colors.grey,
                                  color: notifire.getbgcolor11,
                                  itemBuilder: (context) => [
                                    PopupMenuItem(child:
                                       Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                   Text('Tracking',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                                                  const SizedBox(width: 5,),
                                                  Image.asset('assets/ArrowLineRight-s.png',height: 14,color: const Color(0xff9DA2A7),),
                                                  const SizedBox(width: 5,),
                                                   Text('On Route',style: TextStyle(fontFamily: 'InterRegular',fontSize: 12,color: notifire.getblackcolor),),
                                                  const SizedBox(width: 5,),
                                                  Image.asset('assets/ArrowLineRight-s.png',height: 14,color: const Color(0xff9DA2A7),),
                                                  const SizedBox(width: 5,),
                                                  const Text('Jacob Jones',style: TextStyle(fontSize: 12,color: Color(0xff9DA2A7),fontFamily: 'InterRegular'),)
                                                ],
                                              ),
                                              const SizedBox(height: 10,),
                                              Row(
                                                children: [
                                                  Container(
                                                    height: 50,
                                                    width: 50,
                                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                                                        image: const DecorationImage(image: AssetImage('assets/artist.png'))),
                                                  ),
                                                  const SizedBox(width: 10,),
                                                  Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                       Text('Akshay Kumar',style: TextStyle(fontSize: 20,fontFamily: 'InterRegular',color: notifire.getblackcolor),),

                                                      Row(
                                                        children: [
                                                          const Text('3 years exp',style: TextStyle(color: Color(0xff727880),fontFamily: 'InterRegular',fontSize: 14,)),
                                                          const SizedBox(width: 5,),
                                                          Image.asset('assets/Ellipse 88.png',height: 4,color: const Color(0xffC6C8CB),),
                                                          const SizedBox(width: 5,),
                                                          const Text('IAA',style: TextStyle(color: Color(0xff727880),fontFamily: 'InterRegular',fontSize: 14,)),
                                                        ],
                                                      )
                                                    ],),
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
                                                      const Text('ID Number',style: TextStyle(color: Color(0xff9DA2A7),fontSize: 12,fontFamily: 'InterRegular',),),
                                                      Text('Sp-696509',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),)
                                                    ],),
                                                  Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      const Text('Level',style: TextStyle(color: Color(0xff9DA2A7),fontSize: 12,fontFamily: 'InterRegular',),),
                                                      Text('Expert Driver',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),)
                                                    ],),
                                                  Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      const Text('Experience',style: TextStyle(color: Color(0xff9DA2A7),fontSize: 12,fontFamily: 'InterRegular',),),
                                                      Text('5 years',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),)
                                                    ],),
                                                ],
                                              ),
                                              const SizedBox(height: 20,),
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      padding: const EdgeInsets.all(10),
                                                      decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(12),
                                                        color: notifire.getbgcolor10,
                                                      ),
                                                      child: Center(
                                                        child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                              Image.asset('assets/call.png',color: const Color(0xff595FE5),height: 16),
                                                              const SizedBox(width: 10,),
                                                              const Text('Contact',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,fontWeight: FontWeight.w600,color: Color(0xff727880)),)
                                                            ]),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 10,),
                                                  Expanded(
                                                    child: Container(
                                                      padding: const EdgeInsets.all(10),
                                                      decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(12),
                                                        color: notifire.getbgcolor10,
                                                      ),
                                                      child: Center(
                                                        child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                              Image.asset('assets/video.png',color: const Color(0xffE5646C),height: 16),
                                                              const SizedBox(width: 10,),
                                                              const Text('Live Camera',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,fontWeight: FontWeight.w600,color: Color(0xff727880)),)
                                                            ]),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 10,),
                                          Container(
                                            height: Get.height * 0.55,
                                            decoration: BoxDecoration(color: notifire.getbgcolor11,borderRadius: BorderRadius.circular(12),),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration( color: notifire.getbgcolor11,borderRadius: BorderRadius.circular(12)),
                                                    child: DottedBorder(
                                                      borderType: BorderType.RRect,
                                                      padding: const EdgeInsets.all(12),
                                                      radius: const Radius.circular(12),
                                                      color: const Color(0xffC6C8CB),
                                                      child:
                                                      ClipRRect(
                                                        borderRadius: BorderRadius.circular(12),
                                                        child: Row(
                                                          children: [
                                                            Container(
                                                              height: 50,
                                                              width: 50,
                                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                                                                  image: const DecorationImage(image: AssetImage('assets/artist.png'))),
                                                            ),
                                                            const SizedBox(width: 10,),
                                                            Column(
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                 Text('Truck w678',style: TextStyle(fontSize: 20,fontFamily: 'InterRegular',color: notifire.getblackcolor),),

                                                                Row(
                                                                  children: [
                                                                    const Text('International',style: TextStyle(color: Color(0xff9DA2A7),fontFamily: 'InterRegular',fontSize: 12,)),
                                                                    const SizedBox(width: 5,),
                                                                    Image.asset('assets/Ellipse 88.png',height: 4,color: const Color(0xffC6C8CB),),
                                                                    const SizedBox(width: 5,),
                                                                    const Text('EW85JDNJ34',style: TextStyle(color: Color(0xff9DA2A7),fontFamily: 'InterRegular',fontSize: 12,)),
                                                                  ],
                                                                )
                                                              ],),
                                                          ],
                                                        ),
                                                      ),),
                                                  ),

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
                                                              Text('0496 8th Street',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                                                              const Text('12 May 14:42 PM',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                            ],
                                                          ),
                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              Text('Office Funiture',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                                                              const Text('Product Type',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                            ],
                                                          ),
                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              Text('374Kg',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
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
                                                              Text('6 Holy Cross Circle',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                                                              const Text('25 May 1:23 PM',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                            ],
                                                          ),
                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              Text('Office Funiture',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                                                              const Text('Product Type',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                            ],
                                                          ),
                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              Text('100Kg',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
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
                                                              Text('23 Amroli-Utran',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                                                              const Text('5 Nov 4:45 PM',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                            ],
                                                          ),
                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              Text('Clothes',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                                                              const Text('Product Type',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                            ],
                                                          ),
                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              Text('10Kg',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
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
                                                              Text('Amroli Station Circle',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                                                              const Text('18 Dec 11:45 PM',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                            ],
                                                          ),
                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              Text('Office Funiture',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                                                              const Text('Product Type',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                            ],
                                                          ),
                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              Text('50Kg',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
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
                                                              Text('23 Amroli-Utran',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                                                              const Text('25 May 1:23 PM',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                            ],
                                                          ),
                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              Text('Clothes',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                                                              const Text('Product Type',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                            ],
                                                          ),
                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              Text('10Kg',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor,),),
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
                                                              Text('6 Holy Cross Circle',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                                                              const Text('25 May 1:23 PM',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                            ],
                                                          ),
                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              Text('Office Funiture',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                                                              const Text('Product Type',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                            ],
                                                          ),
                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              Text('100Kg',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
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
                                                              Text('23 Amroli-Utran',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                                                              const Text('5 Nov 4:45 PM',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                            ],
                                                          ),
                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              Text('Clothes',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                                                              const Text('Product Type',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                            ],
                                                          ),
                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              Text('10Kg',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor,),),
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
                                                              Text('Amroli Station Circle',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                                                              const Text('18 Dec 11:45 PM',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                            ],
                                                          ),
                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              Text('Office Funiture',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                                                              const Text('Product Type',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                            ],
                                                          ),
                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              Text('50Kg',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                                                              const Text('Weight',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    // isFirst: true,
                                                    beforeLineStyle:
                                                    const LineStyle(color: Color(0xffADB0ED), thickness: 2,),

                                                    indicatorStyle: IndicatorStyle(
                                                      height: 10,
                                                      width: 10,
                                                      indicator: Container(
                                                        height: 15,
                                                        width: 15,

                                                        decoration:  const BoxDecoration(
                                                            color: Color(0xffADB0ED),
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
                                                              Text('23 Amroli-Utran',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                                                              const Text('25 May 1:23 PM',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                            ],
                                                          ),
                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              Text('Clothes',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                                                              const Text('Product Type',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                            ],
                                                          ),
                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              Text('10Kg',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                                                              const Text('Weight',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    // isFirst: true,
                                                    beforeLineStyle:
                                                    const LineStyle(color: Color(0xffADB0ED), thickness: 2),
                                                    indicatorStyle: IndicatorStyle(
                                                      height: 10,
                                                      width: 10,
                                                      indicator: Container(
                                                        height: 15,
                                                        width: 15,

                                                        decoration:  const BoxDecoration(
                                                            color: Color(0xffADB0ED),
                                                            shape: BoxShape.circle
                                                        ),
                                                      ),
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
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: notifire.getbgcolor10,
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                  padding: const EdgeInsets.all(14),
                                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: notifire.getbgcolor11,),
                                                  child:  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Text('123',style: TextStyle(fontSize: 20,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                                                      Text('Total Routes',style: TextStyle(fontFamily: 'InterRegular',fontSize: 12,color: notifire.getblackcolor),),
                                                    ],)),
                                            ),
                                            const SizedBox(width: 10,),
                                            Expanded(
                                              child: Container(
                                                  padding: const EdgeInsets.all(14),
                                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: notifire.getbgcolor11,),
                                                  child:  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Text('45',style: TextStyle(fontSize: 20,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                                                      Text('AI Planned  ',style: TextStyle(fontFamily: 'InterRegular',fontSize: 12,color: notifire.getblackcolor),),
                                                    ],)),
                                            ),
                                            const SizedBox(width: 10,),
                                            Expanded(
                                              child: Container(
                                                  padding: const EdgeInsets.all(14),
                                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: notifire.getbgcolor11,),
                                                  child:  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Text('67',style: TextStyle(fontSize: 20,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                                                      Text('Total Routes',style: TextStyle(fontFamily: 'InterRegular',fontSize: 12,color: notifire.getblackcolor),),
                                                    ],)),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 10,),
                                      Container(
                                        margin: const EdgeInsets.only(bottom: 10),
                                        padding: const EdgeInsets.all(14),
                                        decoration:  BoxDecoration(
                                          color: notifire.getbgcolor10,
                                          borderRadius: const BorderRadius.all(Radius.circular(8)),
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Drivers',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor,fontWeight: FontWeight.w600),),
                                                const Spacer(),
                                                Image.asset('assets/lock.png',height: 16,),
                                                const SizedBox(width: 20,),
                                                SvgPicture.asset('assets/calendar-2.svg',height: 16,
                                                  color: const Color(0xff727880),),
                                                const SizedBox(width: 20,),
                                                Image.asset('assets/arrow-swap-horizontal.png',height: 16,)
                                              ],
                                            ),
                                            const SizedBox(height: 10,),
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
                                              child: SizedBox(
                                                height: Get.height * 0.66,

                                                child: ListView.builder(
                                                  shrinkWrap: true,
                                                  itemCount: model().Ver.length,
                                                  scrollDirection: Axis.vertical,
                                                  itemBuilder: (context, index) {
                                                    return   Column(
                                                      children: [
                                                        Container(
                                                          margin: const EdgeInsets.only(bottom: 10),
                                                          padding: const EdgeInsets.all(14),
                                                          decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(12),color: notifire.getbgcolor11,
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              CircleAvatar(
                                                                radius: 20,
                                                                backgroundImage: AssetImage(model().Ver[index]),),
                                                              const SizedBox(width: 10,),

                                                              Column(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      Row(
                                                                        children: [
                                                                          Text(model().Ver1[index],style:  TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor)),
                                                                        ],
                                                                      ),

                                                                    ],
                                                                  ),

                                                                  Row(
                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                    children: [
                                                                      Image.asset('assets/timer.png',height: 12,color: const Color(0xff9DA2A7),),
                                                                      const SizedBox(width: 10,),
                                                                      Text(model().Ver2[index],style: const TextStyle(fontSize: 12, color: Color(0xff727880),fontFamily: 'InterRegular'),),
                                                                      const SizedBox(width: 10,),
                                                                      Image.asset('assets/Ellipse 88.png',color: const Color(0xffC6C8CB),height: 5,),
                                                                      const SizedBox(width: 10,),
                                                                      Image.asset('assets/address.png',height: 12,color: const Color(0xff9DA2A7),),
                                                                      const SizedBox(width: 10,),
                                                                      Text(model().Ver3[index],style: const TextStyle(fontFamily: 'InterRegular',fontSize: 12,color: Color(0xff727880)),),
                                                                      const SizedBox(width: 10,),
                                                                      Image.asset('assets/Ellipse 88.png',color: const Color(0xffC6C8CB),height: 5,),
                                                                      const SizedBox(width: 10,),
                                                                      SvgPicture.asset('assets/routing-2.svg',height: 12,color: const Color(0xff9DA2A7),),
                                                                      const SizedBox(width: 10,),
                                                                      Text(model().Ver4[index],style: const TextStyle(fontSize: 12,color: Color(0xff727880),fontFamily: 'InterRegular'),)
                                                                    ],)
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  },),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          ],
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                              color: notifire.getbgcolor11,),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Center(
                                  child: Image.asset(
                                    'assets/more.png',
                                    scale: 4,
                                  )),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10,),
                        PopupMenuButton(
                          tooltip: '',
                          offset: const Offset(10, 50),
                          shape:
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          elevation: 1,
                          splashRadius: 1,
                          constraints: const BoxConstraints(
                            maxWidth: 350,
                            minWidth: 350,
                          ),
                          shadowColor: Colors.grey,
                            color: notifire.getbgcolor11,
                          itemBuilder: (context) =>  <PopupMenuEntry<SampleItem>>[
                            PopupMenuItem(
                                height: 30,
                                padding: EdgeInsets.zero,
                                enabled: false,
                                child: StatefulBuilder(
                                  builder: (context, setState) {
                                    return SingleChildScrollView(
                                      child:  Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      const Text('Departure Time',style: TextStyle(fontFamily: 'InterRegular',fontSize: 12,color: Color(0xff727880),fontWeight: FontWeight.w600),),
                                                      const SizedBox(height: 5,),
                                                      Container(
                                                        height: 45,
                                                        decoration:
                                                        BoxDecoration(
                                                            border:
                                                            Border.all(
                                                                color: notifire.getgrey1
                                                            ),
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                15)),
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
                                                                AppContent
                                                                    .calendar,
                                                                scale: 3.5,
                                                                color: const Color(
                                                                    0xff9DA2A7)),
                                                            hintText:
                                                            "${selectedDate1.day}-${selectedDate1.month}-${selectedDate1.year}",
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
                                                            enabledBorder: OutlineInputBorder(
                                                                borderSide:
                                                                BorderSide
                                                                    .none,
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    12)),
                                                            focusedBorder: OutlineInputBorder(
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
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      const Text('Arrival Time',style: TextStyle(fontFamily: 'InterRegular',fontSize: 12,color: Color(0xff727880),fontWeight: FontWeight.w600),),
                                                      const SizedBox(height: 5,),
                                                      InkWell(
                                                        onTap: () async {
                                                          final TimeOfDay?
                                                          time =
                                                          await showTimePicker(
                                                            context: context,
                                                            initialTime:
                                                            selectTime ??
                                                                TimeOfDay
                                                                    .now(),
                                                          );
                                                          setState(() {
                                                            selectTime = time;
                                                          });
                                                        },
                                                        child: Container(
                                                          height: 45,
                                                          decoration:
                                                          BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                13),
                                                            border: Border.all(
                                                                color: notifire.getgrey1),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 10,
                                                                right: 5),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                              children: [
                                                                Text(
                                                                    selectTime?.format(
                                                                        context) ??
                                                                        "00 : 00",
                                                                    style:
                                                                     TextStyle(
                                                                      fontSize:
                                                                      15, color: notifire.getblackcolor
                                                                    )),
                                                                Image.asset(
                                                                  'assets/clock.png',
                                                                  height: 16,
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 10,),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        height: 45,
                                                        decoration:
                                                        BoxDecoration(
                                                            border:
                                                            Border.all(
                                                                color: notifire.getgrey1
                                                            ),
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                15)),
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
                                                                AppContent
                                                                    .calendar,
                                                                scale: 3.5,
                                                                color: const Color(
                                                                    0xff9DA2A7)),
                                                            hintText:
                                                            "${selectedDate1.day}-${selectedDate1.month}-${selectedDate1.year}",
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
                                                                    color: notifire.getgrey1)),
                                                            enabledBorder: OutlineInputBorder(
                                                                borderSide:
                                                                BorderSide
                                                                    .none,
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    12)),
                                                            focusedBorder: OutlineInputBorder(
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
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [

                                                      InkWell(
                                                        onTap: () async {
                                                          final TimeOfDay?
                                                          time =
                                                          await showTimePicker(
                                                            context: context,
                                                            initialTime:
                                                            selectTime ??
                                                                TimeOfDay
                                                                    .now(),
                                                          );
                                                          setState(() {
                                                            selectTime = time;
                                                          });
                                                        },
                                                        child: Container(
                                                          height: 45,
                                                          decoration:
                                                          BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                13),
                                                            border: Border.all(
                                                                color: notifire.getgrey1),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 10,
                                                                right: 5),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                              children: [
                                                                Text(
                                                                    selectTime?.format(
                                                                        context) ??
                                                                        "00 : 00",
                                                                    style:
                                                                     TextStyle(
                                                                      fontSize:
                                                                      15, color: notifire.getblackcolor
                                                                    )),
                                                                Image.asset(
                                                                  'assets/clock.png',
                                                                  height: 16,
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 10,),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      const Text('Driver',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600,fontFamily: 'InterRegular',color: Color(0xff727880)),),
                                                      const SizedBox(height: 5,),
                                                      DropdownButtonHideUnderline(
                                                        child: DropdownButton2<String>(
                                                          isExpanded: true,
                                                          hint:  Row(
                                                            children: [
                                                              const SizedBox(
                                                                width: 4,
                                                              ),
                                                              Expanded(
                                                                child: Row(
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                  children: [
                                                                     Text(
                                                                      'Ananya Ishana',
                                                                      style: TextStyle(
                                                                        fontSize: 14,
                                                                        fontFamily: 'InterRegular',
                                                                          color: notifire.getblackcolor
                                                                      ),
                                                                      overflow: TextOverflow.ellipsis,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          items: items
                                                              .map((String item) =>
                                                              DropdownMenuItem<String>(
                                                                value: item,
                                                                child: Row(
                                                                  children: [

                                                                    Text(
                                                                      item,
                                                                      style:  TextStyle(
                                                                        fontSize: 14,
                                                                        fontWeight: FontWeight.bold,
                                                                          color: notifire.getblackcolor
                                                                      ),
                                                                      overflow: TextOverflow.ellipsis,
                                                                    ),
                                                                  ],
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

                                                            padding: const EdgeInsets.only(
                                                                left: 14, right: 14),
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(14),
                                                              border: Border.all(
                                                                  color: notifire.getgrey1
                                                              ),

                                                            ),
                                                            elevation: 0,
                                                          ),
                                                          iconStyleData: const IconStyleData(
                                                            icon: Icon(
                                                              Icons.keyboard_arrow_down_outlined,
                                                              size: 25,
                                                            ),
                                                            iconSize: 14,
                                                            iconEnabledColor: Colors.black,
                                                            iconDisabledColor: Colors.grey,
                                                          ),
                                                          dropdownStyleData: DropdownStyleData(
                                                            maxHeight: 200,

                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(14),
color: notifire.getbgcolor10,
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
                                                ),
                                              ],
                                            ) ,
                                            const SizedBox(height: 10,),
                                            const Text(
                                              'Note',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily:
                                                  'InterRegular',
                                                  color: Color(0xff727880),
                                                  fontWeight:
                                                  FontWeight.w600),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      12),
                                                  border: Border.all(
                                                      color: notifire.getgrey1)),
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
                                                      color: Color(
                                                          0xffC6C8CB)),
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
                                            const SizedBox(height: 20,),
                                            InkWell(
                                              onTap: () {},
                                              child: Container(
                                                padding:
                                                const EdgeInsets
                                                    .all(12),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(
                                                        12),
                                                    color: const Color(
                                                        0xff595FE5)),
                                                child: const Center(
                                                    child: Text(
                                                        'Create Order',
                                                        style: TextStyle(
                                                            fontFamily:
                                                            'InterRegular',
                                                            color: Colors
                                                                .white,
                                                            fontSize:
                                                            14,
                                                            fontWeight:
                                                            FontWeight
                                                                .w600))),
                                              ),
                                            ),
                                          ],),
                                      ),
                                    );
                                  },
                                )),
                          ],
                          child: Container(
                            height: 40,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                color: const Color(0xff595FE5),
                                borderRadius: BorderRadius.circular(12)),
                            child: Center(
                              child: Row(children: [
                                Image.asset('assets/add.png', scale: 4),

                              ]),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10,),
                      ],
                    )
                  ],
                ),
                body: Container(
                  color:  notifire.getbgcolor10,
                  child:  SingleChildScrollView(
                    child: Column(
                      children: [
                        container2(constraints.maxWidth),
                      ],
                    ),
                  ),
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
                        decoration:  BoxDecoration(
                          color: notifire.getbgcolor10,
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                        ),
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: Get.width,
                              height: Get.height,
                              child: firstContainer(
                                constraints: constraints.maxWidth,),),
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
                decoration: BoxDecoration(
                    color:  notifire.getbgcolor10,
                    border: const Border(left: BorderSide(color: Color(0xffEEEEEE)))),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: Get.width,
                        height: Get.height,
                        child: firstContainer(
                            constraints: constraints.maxWidth,),),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      );
    }
    );
  }

  Widget firstContainer({constraints}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20,left: 20,right: 20),
      child: Stack(
        children: [
          container2(constraints),
          Positioned(
              right: 10,
              top: 65,
              child: Compose ? container3(constraints) :  container1(constraints)),
        ],
      ),
    );
  }

  Widget container2(constraints) {
    if (constraints < 600) {
      return SizedBox(
        height: Get.height,
        child: Scaffold(
          body:
          GoogleMap(
            gestureRecognizers: {
              Factory<OneSequenceGestureRecognizer>(() => EagerGestureRecognizer())
            },
            initialCameraPosition: const CameraPosition(target: LatLng(21.2408, 72.8806), zoom: 13),
            mapType: MapType.normal,padding: EdgeInsets.only(bottom: Get.width * 0.5),
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

        ),
      );
    } else {
      return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: notifire.getbgcolor10,
        flexibleSpace: DefaultTabController(length: 4, child:
        Center(
          child: SizedBox(
            width: Get.width,
            child: Row(
              children: [
                TabBar(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  indicatorColor: const Color(0xff2a70fe),
                  labelColor: const Color(0xff2a70fe),

                  unselectedLabelColor: notifire.getblackcolor,
                  isScrollable: true,
                  tabs: <Widget>[
                    Tab(
                        child: Row(
                          children: [
                            SvgPicture.asset('assets/routing-2.svg',height: 16,color: notifire.getblackcolor,
                         ),
                            const SizedBox(
                              width: 5,
                            ),
                              Text('Tracking Routes',
                                style: TextStyle(color: notifire.getblackcolor,
                                    fontFamily: 'InterRegular',
                                    fontSize: 14)),
                          ],
                        )),
                    Tab(
                        child: Row(
                          children: [
                            SvgPicture.asset('assets/truck.svg',color: notifire.getblackcolor,
                                height: 16),
                            const SizedBox(
                              width: 5,
                            ),
                              Text('Vehicles',
                                style: TextStyle(color: notifire.getblackcolor,
                                    fontFamily: 'InterRegular',
                                    fontSize: 14)),
                          ],
                        )),
                    Tab(
                        child: Row(
                          children: [
                            SvgPicture.asset('assets/chart.svg',color: notifire.getblackcolor,
                                 height: 16),
                            const SizedBox(
                              width: 5,
                            ),
                              Text('Analytics',
                                style: TextStyle(color: notifire.getblackcolor,
                                    fontFamily: 'InterRegular',
                                    fontSize: 14)),
                          ],
                        )),
                    Tab(
                        child: Row(
                          children: [
                            SvgPicture.asset('assets/house.svg',color: notifire.getblackcolor,
                               height: 16),
                            const SizedBox(
                              width: 5,
                            ),
                              Text('Warehouse',
                                style: TextStyle(color: notifire.getblackcolor,
                                    fontFamily: 'InterRegular',
                                    fontSize: 14)),
                          ],
                        )),
                  ],
                ),



                const Spacer(),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      color: notifire.getbgcolor11,),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Center(
                          child: Image.asset(
                            'assets/setting-5.png',
                            scale: 4,
                          )),
                    ),
                  ),
                ),
                const SizedBox(width: 10,),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      color: notifire.getbgcolor11,),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Center(
                          child: Image.asset(
                            'assets/more.png',
                            scale: 4,
                          )),
                    ),
                  ),
                ),
                const SizedBox(width: 10,),
                PopupMenuButton(
                  tooltip: '',
                  offset: const Offset(10, 50),
                  shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  elevation: 1,
                  splashRadius: 1,
                  constraints: const BoxConstraints(
                    maxWidth: 300,
                    minWidth: 300,
                  ),
                  shadowColor: Colors.grey,
                  color: notifire.getbgcolor11,
                  itemBuilder: (context) =>  <PopupMenuEntry<SampleItem>>[
                    PopupMenuItem(
                        height: 30,
                        padding: const EdgeInsets. all(12),
                        enabled: false,
                        child: StatefulBuilder(
                          builder: (context, setState) {
                            return SingleChildScrollView(
                              child: SizedBox(
                                height: 500,
                                child:  Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              const Text('Departure Time',style: TextStyle(fontFamily: 'InterRegular',fontSize: 12,color: Color(0xff727880),fontWeight: FontWeight.w600),),
                                              const SizedBox(height: 5,),
                                              Container(
                                                height: 45,
                                                decoration:
                                                BoxDecoration(
                                                    border:
                                                    Border.all(
                                                        color: notifire.getgrey1
                                                    ),
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(
                                                        15)),
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
                                                        AppContent
                                                            .calendar,
                                                        scale: 3.5,
                                                        color: const Color(
                                                            0xff9DA2A7)),
                                                    hintText:
                                                    "${selectedDate1.day}-${selectedDate1.month}-${selectedDate1.year}",
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
                                                            color: notifire.getgrey1)),
                                                    enabledBorder: OutlineInputBorder(
                                                        borderSide:
                                                        BorderSide
                                                            .none,
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            12)),
                                                    focusedBorder: OutlineInputBorder(
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
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              const Text('Arrival Time',style: TextStyle(fontFamily: 'InterRegular',fontSize: 12,color: Color(0xff727880),fontWeight: FontWeight.w600),),
                                              const SizedBox(height: 5,),
                                              InkWell(
                                                onTap: () async {
                                                  final TimeOfDay?
                                                  time =
                                                  await showTimePicker(
                                                    context: context,
                                                    initialTime:
                                                    selectTime ??
                                                        TimeOfDay
                                                            .now(),
                                                  );
                                                  setState(() {
                                                    selectTime = time;
                                                  });
                                                },
                                                child: Container(
                                                  height: 45,
                                                  decoration:
                                                  BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(
                                                        13),
                                                    border: Border.all(
                                                        color: notifire.getgrey1),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets
                                                        .only(
                                                        left: 10,
                                                        right: 5),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                      children: [
                                                        Text(
                                                            selectTime?.format(
                                                                context) ??
                                                                "00 : 00",
                                                            style:
                                                             TextStyle(
                                                              fontSize:
                                                              15, color: notifire.getblackcolor
                                                            )),
                                                        Image.asset(
                                                          'assets/clock.png',
                                                          height: 16,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10,),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 45,
                                                decoration:
                                                BoxDecoration(
                                                    border:
                                                    Border.all(
                                                        color: notifire.getgrey1
                                                    ),
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(
                                                        15)),
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
                                                        AppContent
                                                            .calendar,
                                                        scale: 3.5,
                                                        color: const Color(
                                                            0xff9DA2A7)),
                                                    hintText:
                                                    "${selectedDate1.day}-${selectedDate1.month}-${selectedDate1.year}",
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
                                                            color: notifire.getgrey1)),
                                                    enabledBorder: OutlineInputBorder(
                                                        borderSide:
                                                        BorderSide
                                                            .none,
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            12)),
                                                    focusedBorder: OutlineInputBorder(
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
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [

                                              InkWell(
                                                onTap: () async {
                                                  final TimeOfDay?
                                                  time =
                                                  await showTimePicker(
                                                    context: context,
                                                    initialTime:
                                                    selectTime ??
                                                        TimeOfDay
                                                            .now(),
                                                  );
                                                  setState(() {
                                                    selectTime = time;
                                                  });
                                                },
                                                child: Container(
                                                  height: 45,
                                                  decoration:
                                                  BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(
                                                        13),
                                                    border: Border.all(
                                                         color: notifire.getgrey1),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets
                                                        .only(
                                                        left: 10,
                                                        right: 5),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                      children: [
                                                        Text(
                                                            selectTime?.format(
                                                                context) ??
                                                                "00 : 00",
                                                            style:
                                                             TextStyle(
                                                              fontSize:
                                                              15, color: notifire.getblackcolor
                                                            )),
                                                        Image.asset(
                                                          'assets/clock.png',
                                                          height: 16,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10,),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              const Text('Driver',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600,fontFamily: 'InterRegular',color: Color(0xff727880)),),
                                              const SizedBox(height: 5,),
                                              DropdownButtonHideUnderline(
                                                child: DropdownButton2<String>(
                                                  isExpanded: true,
                                                  hint:  Row(
                                                    children: [
                                                      const SizedBox(
                                                        width: 4,
                                                      ),
                                                      Expanded(
                                                        child: Row(
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [

                                                             Text(
                                                              'Ananya Ishana',
                                                              style: TextStyle(
                                                                fontSize: 14,
                                                                fontFamily: 'InterRegular',
                                                                  color: notifire.getblackcolor
                                                              ),
                                                              overflow: TextOverflow.ellipsis,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  items: items
                                                      .map((String item) =>
                                                      DropdownMenuItem<String>(
                                                        value: item,
                                                        child: Row(
                                                          children: [

                                                            Text(
                                                              item,
                                                              style:  TextStyle(
                                                                fontSize: 14,
                                                                fontWeight: FontWeight.bold,
                                                                  color: notifire.getblackcolor
                                                              ),
                                                              overflow: TextOverflow.ellipsis,
                                                            ),
                                                          ],
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

                                                    padding: const EdgeInsets.only(
                                                        left: 14, right: 14),
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(14),
                                                      border: Border.all(
                                                          color: notifire.getgrey1
                                                      ),

                                                    ),
                                                    elevation: 0,
                                                  ),
                                                  iconStyleData: const IconStyleData(
                                                    icon: Icon(
                                                      Icons.keyboard_arrow_down_outlined,
                                                      size: 25,
                                                    ),
                                                    iconSize: 14,
                                                    iconEnabledColor: Colors.black,
                                                    iconDisabledColor: Colors.grey,
                                                  ),
                                                  dropdownStyleData: DropdownStyleData(
                                                    maxHeight: 200,

                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(14),
                                                      color: notifire.getbgcolor10,
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
                                        ),
                                      ],
                                    ) ,
                                    const SizedBox(height: 10,),
                                    const Text(
                                      'Note',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontFamily:
                                          'InterRegular',
                                          color: Color(0xff727880),
                                          fontWeight:
                                          FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(
                                              12),
                                          border: Border.all(
                                              color: notifire.getgrey1)),
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
                                              color: Color(
                                                  0xffC6C8CB)),
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
                                    const SizedBox(height: 20,),
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        padding:
                                        const EdgeInsets
                                            .all(12),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius
                                                .circular(
                                                12),
                                            color: const Color(
                                                0xff595FE5)),
                                        child: const Center(
                                            child: Text(
                                                'Done',
                                                style: TextStyle(
                                                    fontFamily:
                                                    'InterRegular',
                                                    color: Colors
                                                        .white,
                                                    fontSize:
                                                    14,
                                                    fontWeight:
                                                    FontWeight
                                                        .w600))),
                                      ),
                                    ),
                                  ],),
                              ),
                            );
                          },
                        )),
                  ],
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        color: const Color(0xff595FE5),
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Row(children: [
                        Image.asset('assets/add.png', scale: 4),
                        const SizedBox(width: 5,),
                        const Text('Create Route',style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'InterRegular',
                            fontWeight: FontWeight.w600,
                            color: Colors.white))
                      ]),
                    ),
                  ),
                ),
                const SizedBox(width: 10,),
              ],
            ),
          ),
        ),),
      ),
      body:
      GoogleMap(
        gestureRecognizers: {
          Factory<OneSequenceGestureRecognizer>(() => EagerGestureRecognizer())
        },
        initialCameraPosition: const CameraPosition(target: LatLng(21.2408, 72.8806), zoom: 13),
        mapType: MapType.normal,
        // ignore: prefer_const_constructors
        padding: EdgeInsets.symmetric(horizontal: 20),
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

    );
    }
  }

  Widget container1(constraints) {
    return GetBuilder<InboxController>(builder: (controller) {
      return SizedBox(

        width: Get.width * 0.23,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: notifire.getbgcolor10,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                        padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(color: notifire.getbgcolor11,borderRadius: BorderRadius.circular(12)),
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('123',style: TextStyle(fontSize: 20,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                            Text('Total Routes',style: TextStyle(fontFamily: 'InterRegular',fontSize: 12,color: notifire.getblackcolor),),
                          ],)),
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(color: notifire.getbgcolor11,borderRadius: BorderRadius.circular(12)),
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('45',style: TextStyle(fontSize: 20,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                            Text('AI Planned  ',style: TextStyle(fontFamily: 'InterRegular',fontSize: 12,color: notifire.getblackcolor),),
                          ],)),
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(color: notifire.getbgcolor11,borderRadius: BorderRadius.circular(12)),
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('67',style: TextStyle(fontSize: 20,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                            Text('Total Routes',style: TextStyle(fontFamily: 'InterRegular',fontSize: 12,color: notifire.getblackcolor),),
                          ],)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(14),
              decoration:  BoxDecoration(
                color: notifire.getbgcolor10,
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text('Drivers',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getbgcolor10,fontWeight: FontWeight.w600),),
                      const Spacer(),
                      Image.asset('assets/lock.png',height: 16,),
                      const SizedBox(width: 20,),
                      SvgPicture.asset('assets/calendar-2.svg',height: 16,
                        color: const Color(0xff727880),),
                      const SizedBox(width: 20,),
                      Image.asset('assets/arrow-swap-horizontal.png',height: 16,)
                    ],
                  ),
                  const SizedBox(height: 10,),
                  SizedBox(
                    height: Get.height * 0.66,
                    width: Get.width * 0.23,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: model().Ver.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return   Column(
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
                                margin: const EdgeInsets.only(bottom: 10),
                                padding: const EdgeInsets.all(14),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),color: notifire.getbgcolor11,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundImage: AssetImage(model().Ver[index]),),
                                    const SizedBox(width: 10,),

                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Row(
                                              children: [
                                                Text(model().Ver1[index],style:  TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor)),
                                              ],
                                            ),

                                          ],
                                        ),

                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Image.asset('assets/timer.png',height: 12,color: const Color(0xff9DA2A7),),
                                            const SizedBox(width: 10,),
                                            Text(model().Ver2[index],style: const TextStyle(fontSize: 12, color: Color(0xff727880),fontFamily: 'InterRegular'),),
                                            const SizedBox(width: 10,),
                                            Image.asset('assets/Ellipse 88.png',color: const Color(0xffC6C8CB),height: 5,),
                                            const SizedBox(width: 10,),
                                            Image.asset('assets/address.png',height: 12,color: const Color(0xff9DA2A7),),
                                            const SizedBox(width: 10,),
                                            Text(model().Ver3[index],style: const TextStyle(fontFamily: 'InterRegular',fontSize: 12,color: Color(0xff727880)),),
                                            const SizedBox(width: 10,),
                                            Image.asset('assets/Ellipse 88.png',color: const Color(0xffC6C8CB),height: 5,),
                                            const SizedBox(width: 10,),
                                            SvgPicture.asset('assets/routing-2.svg',height: 12,color: const Color(0xff9DA2A7),),
                                            const SizedBox(width: 10,),
                                            Text(model().Ver4[index],style: const TextStyle(fontSize: 12,color: Color(0xff727880),fontFamily: 'InterRegular'),)
                                          ],)
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },),
                  ),

                ],
              ),
            ),
          ],
        ),
      );
    },);
  }

  Widget container3(constraints){
    return GetBuilder<InboxController>(builder: (controller) {
      return
      constraints < 600 ?
      Scaffold(
        body: PopupMenuButton(
          tooltip: '',
          offset: const Offset(10, 50),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 1,
          splashRadius: 1,
          constraints: const BoxConstraints(
            maxWidth: 350,
            minWidth: 350,
          ),
          shadowColor: Colors.grey,
          color: notifire.getbgcolor11,
          itemBuilder: (context) =>  <PopupMenuEntry<SampleItem>>[
            PopupMenuItem(
                height: 30,
                padding: EdgeInsets.zero,
                enabled: false,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: notifire.getbgcolor11,),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text('Tracking',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                              const SizedBox(width: 5,),
                              Image.asset('assets/ArrowLineRight-s.png',height: 14,color: const Color(0xff9DA2A7),),
                              const SizedBox(width: 5,),
                              Text('On Route',style: TextStyle(fontFamily: 'InterRegular',fontSize: 12,color: notifire.getblackcolor),),
                              const SizedBox(width: 5,),
                              Image.asset('assets/ArrowLineRight-s.png',height: 14,color: const Color(0xff9DA2A7),),
                              const SizedBox(width: 5,),
                              const Text('Jacob Jones',style: TextStyle(fontSize: 12,color: Color(0xff9DA2A7),fontFamily: 'InterRegular'),)
                            ],
                          ),
                          const SizedBox(height: 10,),
                          Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                                    image: const DecorationImage(image: AssetImage('assets/artist.png'))),
                              ),
                              const SizedBox(width: 10,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Akshay Kumar',style: TextStyle(fontSize: 20,fontFamily: 'InterRegular',color: notifire.getblackcolor),),

                                  Row(
                                    children: [
                                      const Text('3 years exp',style: TextStyle(color: Color(0xff727880),fontFamily: 'InterRegular',fontSize: 14,)),
                                      const SizedBox(width: 5,),
                                      Image.asset('assets/Ellipse 88.png',height: 4,color: const Color(0xffC6C8CB),),
                                      const SizedBox(width: 5,),
                                      const Text('IAA',style: TextStyle(color: Color(0xff727880),fontFamily: 'InterRegular',fontSize: 14,)),
                                    ],
                                  )
                                ],),
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
                                  const Text('ID Number',style: TextStyle(color: Color(0xff9DA2A7),fontSize: 12,fontFamily: 'InterRegular',),),
                                  Text('Sp-696509',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),)
                                ],),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Level',style: TextStyle(color: Color(0xff9DA2A7),fontSize: 12,fontFamily: 'InterRegular',),),
                                  Text('Expert Driver',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),)
                                ],),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Experience',style: TextStyle(color: Color(0xff9DA2A7),fontSize: 12,fontFamily: 'InterRegular',),),
                                  Text('5 years',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),)
                                ],),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all( color: notifire.getgrey1)
                                  ),
                                  child: Center(
                                    child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image.asset('assets/call.png',color: const Color(0xff595FE5),height: 16),
                                          const SizedBox(width: 10,),
                                          const Text('Contact',style: TextStyle(fontFamily: 'InterRegular',fontSize: 16,fontWeight: FontWeight.w600,color: Color(0xff727880)),)
                                        ]),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10,),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all( color: notifire.getgrey1)
                                  ),
                                  child: Center(
                                    child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image.asset('assets/video.png',color: const Color(0xffE5646C),height: 16),
                                          const SizedBox(width: 10,),
                                          const Text('Live Camera',style: TextStyle(fontFamily: 'InterRegular',fontSize: 16,fontWeight: FontWeight.w600,color: Color(0xff727880)),)
                                        ]),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Container(
                      height: Get.height * 0.55,
                      width: Get.width * 0.23,
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(color:notifire.getbgcolor10,borderRadius: BorderRadius.circular(12),),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            DottedBorder(
                              borderType: BorderType.RRect,
                              padding: const EdgeInsets.all(12),
                              radius: const Radius.circular(12),
                              color: const Color(0xffC6C8CB),
                              child:
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                                          image: const DecorationImage(image: AssetImage('assets/artist.png'))),
                                    ),
                                    const SizedBox(width: 10,),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Truck w678',style: TextStyle(fontSize: 20,fontFamily: 'InterRegular',color: notifire.getblackcolor),),

                                        Row(
                                          children: [
                                            const Text('International',style: TextStyle(color: Color(0xff9DA2A7),fontFamily: 'InterRegular',fontSize: 12,)),
                                            const SizedBox(width: 5,),
                                            Image.asset('assets/Ellipse 88.png',height: 4,color: const Color(0xffC6C8CB),),
                                            const SizedBox(width: 5,),
                                            const Text('EW85JDNJ34',style: TextStyle(color: Color(0xff9DA2A7),fontFamily: 'InterRegular',fontSize: 12,)),
                                          ],
                                        )
                                      ],),
                                  ],
                                ),
                              ),),

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
                                        Text('0496 8th Street',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                                        const Text('12 May 14:42 PM',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text('Office Funiture',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                                        const Text('Product Type',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular'),)
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text('374Kg',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
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
                                        Text('6 Holy Cross Circle',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                                        const Text('25 May 1:23 PM',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text('Office Funiture',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                                        const Text('Product Type',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text('100Kg',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
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
                                        Text('23 Amroli-Utran',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                                        const Text('5 Nov 4:45 PM',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text('Clothes',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                                        const Text('Product Type',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text('10Kg',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
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
                                        Text('Amroli Station Circle',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                                        const Text('18 Dec 11:45 PM',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text('Office Funiture',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                                        const Text('Product Type',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text('50Kg',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
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
                                        Text('23 Amroli-Utran',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                                        const Text('25 May 1:23 PM',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text('Clothes',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                                        const Text('Product Type',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text('10Kg',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
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
                                        Text('6 Holy Cross Circle',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                                        const Text('25 May 1:23 PM',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text('Office Funiture',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                                        const Text('Product Type',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text('100Kg',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
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
                                        Text('23 Amroli-Utran',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                                        const Text('5 Nov 4:45 PM',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text('Clothes',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                                        const Text('Product Type',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text('10Kg',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
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
                                        Text('Amroli Station Circle',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                                        const Text('18 Dec 11:45 PM',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text('Office Funiture',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                                        const Text('Product Type',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text('50Kg',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                                        const Text('Weight',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              // isFirst: true,
                              beforeLineStyle:
                              const LineStyle(color: Color(0xffADB0ED), thickness: 2,),

                              indicatorStyle: IndicatorStyle(
                                height: 10,
                                width: 10,
                                indicator: Container(
                                  height: 15,
                                  width: 15,

                                  decoration:  const BoxDecoration(
                                      color: Color(0xffADB0ED),
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
                                        Text('23 Amroli-Utran',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                                        const Text('25 May 1:23 PM',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text('Clothes',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                                        const Text('Product Type',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text('10Kg',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                                        const Text('Weight',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              // isFirst: true,
                              beforeLineStyle:
                              const LineStyle(color: Color(0xffADB0ED), thickness: 2),
                              indicatorStyle: IndicatorStyle(
                                height: 10,
                                width: 10,
                                indicator: Container(
                                  height: 15,
                                  width: 15,

                                  decoration:  const BoxDecoration(
                                      color: Color(0xffADB0ED),
                                      shape: BoxShape.circle
                                  ),
                                ),
                              ),
                            ),



                          ],
                        ),
                      ),
                    )
                  ],
                )),
          ],

        ),
      ):
        SizedBox(
        // height: Get.height * 0.8,
        width: Get.width * 0.23,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: notifire.getbgcolor11,),
              child: Column(
                children: [
                  Row(
                    children: [
                       Text('Tracking',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                      const SizedBox(width: 5,),
                      Image.asset('assets/ArrowLineRight-s.png',height: 14,color: const Color(0xff9DA2A7),),
                      const SizedBox(width: 5,),
                       Text('On Route',style: TextStyle(fontFamily: 'InterRegular',fontSize: 12,color: notifire.getblackcolor),),
                      const SizedBox(width: 5,),
                      Image.asset('assets/ArrowLineRight-s.png',height: 14,color: const Color(0xff9DA2A7),),
                      const SizedBox(width: 5,),
                      const Text('Jacob Jones',style: TextStyle(fontSize: 12,color: Color(0xff9DA2A7),fontFamily: 'InterRegular'),)
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                            image: const DecorationImage(image: AssetImage('assets/artist.png'))),
                      ),
                      const SizedBox(width: 10,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text('Akshay Kumar',style: TextStyle(fontSize: 20,fontFamily: 'InterRegular',color: notifire.getblackcolor),),

                          Row(
                            children: [
                              const Text('3 years exp',style: TextStyle(color: Color(0xff727880),fontFamily: 'InterRegular',fontSize: 14,)),
                              const SizedBox(width: 5,),
                              Image.asset('assets/Ellipse 88.png',height: 4,color: const Color(0xffC6C8CB),),
                              const SizedBox(width: 5,),
                              const Text('IAA',style: TextStyle(color: Color(0xff727880),fontFamily: 'InterRegular',fontSize: 14,)),
                            ],
                          )
                        ],),
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
                          const Text('ID Number',style: TextStyle(color: Color(0xff9DA2A7),fontSize: 12,fontFamily: 'InterRegular',),),
                          Text('Sp-696509',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),)
                        ],),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Level',style: TextStyle(color: Color(0xff9DA2A7),fontSize: 12,fontFamily: 'InterRegular',),),
                          Text('Expert Driver',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),)
                        ],),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Experience',style: TextStyle(color: Color(0xff9DA2A7),fontSize: 12,fontFamily: 'InterRegular',),),
                          Text('5 years',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),)
                        ],),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                            color: notifire.getbgcolor10,
                          ),
                          child: Center(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/call.png',color: const Color(0xff595FE5),height: 16),
                                  const SizedBox(width: 10,),
                                  const Text('Contact',style: TextStyle(fontFamily: 'InterRegular',fontSize: 16,fontWeight: FontWeight.w600,color: Color(0xff727880)),)
                                ]),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                            color: notifire.getbgcolor10,
                          ),
                          child: Center(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/video.png',color: const Color(0xffE5646C),height: 16),
                                  const SizedBox(width: 10,),
                                  const Text('Live Camera',style: TextStyle(fontFamily: 'InterRegular',fontSize: 16,fontWeight: FontWeight.w600,color: Color(0xff727880)),)
                                ]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              height: Get.height * 0.55,
              width: Get.width * 0.23,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(color:notifire.getbgcolor11,borderRadius: BorderRadius.circular(12),),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(color: notifire.getbgcolor11,borderRadius: BorderRadius.circular(12)),
                      child: DottedBorder(
                        borderType: BorderType.RRect,
                        padding: const EdgeInsets.all(12),
                        radius: const Radius.circular(12),
                        color: const Color(0xffC6C8CB),
                        child:
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                                    image: const DecorationImage(image: AssetImage('assets/artist.png'))),
                              ),
                              const SizedBox(width: 10,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                   Text('Truck w678',style: TextStyle(fontSize: 20,fontFamily: 'InterRegular',color: notifire.getblackcolor),),

                                  Row(
                                    children: [
                                      const Text('International',style: TextStyle(color: Color(0xff9DA2A7),fontFamily: 'InterRegular',fontSize: 12,)),
                                      const SizedBox(width: 5,),
                                      Image.asset('assets/Ellipse 88.png',height: 4,color: const Color(0xffC6C8CB),),
                                      const SizedBox(width: 5,),
                                      const Text('EW85JDNJ34',style: TextStyle(color: Color(0xff9DA2A7),fontFamily: 'InterRegular',fontSize: 12,)),
                                    ],
                                  )
                                ],),
                            ],
                          ),
                        ),),
                    ),

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
                                Text('0496 8th Street',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                                const Text('12 May 14:42 PM',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Office Funiture',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                                const Text('Product Type',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular'),)
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('374Kg',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
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
                                Text('6 Holy Cross Circle',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                                const Text('25 May 1:23 PM',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Office Funiture',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                                const Text('Product Type',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('100Kg',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
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
                                Text('23 Amroli-Utran',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                                const Text('5 Nov 4:45 PM',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Clothes',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                                const Text('Product Type',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('10Kg',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
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
                                Text('Amroli Station Circle',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                                const Text('18 Dec 11:45 PM',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Office Funiture',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                                const Text('Product Type',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('50Kg',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
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
                                Text('23 Amroli-Utran',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                                const Text('25 May 1:23 PM',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Clothes',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                                const Text('Product Type',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('10Kg',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
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
                                Text('6 Holy Cross Circle',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                                const Text('25 May 1:23 PM',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Office Funiture',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                                const Text('Product Type',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('100Kg',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
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
                                Text('23 Amroli-Utran',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                                const Text('5 Nov 4:45 PM',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Clothes',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                                const Text('Product Type',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('10Kg',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
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
                                Text('Amroli Station Circle',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                                const Text('18 Dec 11:45 PM',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Office Funiture',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                                const Text('Product Type',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('50Kg',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                                const Text('Weight',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                              ],
                            ),
                          ],
                        ),
                      ),
                      // isFirst: true,
                      beforeLineStyle:
                      const LineStyle(color: Color(0xffADB0ED), thickness: 2,),

                      indicatorStyle: IndicatorStyle(
                        height: 10,
                        width: 10,
                        indicator: Container(
                          height: 15,
                          width: 15,

                          decoration:  const BoxDecoration(
                              color: Color(0xffADB0ED),
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
                                Text('23 Amroli-Utran',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                                const Text('25 May 1:23 PM',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Clothes',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                                const Text('Product Type',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('10Kg',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                                const Text('Weight',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',),)
                              ],
                            ),
                          ],
                        ),
                      ),
                      // isFirst: true,
                      beforeLineStyle:
                      const LineStyle(color: Color(0xffADB0ED), thickness: 2),
                      indicatorStyle: IndicatorStyle(
                        height: 10,
                        width: 10,
                        indicator: Container(
                          height: 15,
                          width: 15,

                          decoration:  const BoxDecoration(
                              color: Color(0xffADB0ED),
                              shape: BoxShape.circle
                          ),
                        ),
                      ),
                    ),



                  ],
                ),
              ),
            )
          ],
        ),
      );
    },
    );
  }
}
