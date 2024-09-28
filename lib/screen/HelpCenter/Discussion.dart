// ignore_for_file: prefer_const_constructors, file_names, camel_case_types
import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';


import 'package:provider/provider.dart';
import 'package:evcp/confing/list.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../confing/Rtl.dart';
import '../../confing/colors.dart';
import '../../confing/image.dart';
import '../../confing/notifier.dart';

import '../../controller/page_controller.dart';
import '../Dashboard/Dashboard_main.dart';
import '../login/login.dart';


// ignore_for_file: deprecated_member_use

class Discussion extends StatefulWidget {
  const Discussion({super.key});

  @override
  State<Discussion> createState() => _DiscussionState();
}

class _DiscussionState extends State<Discussion> {
  String? selectedValue;
  String? selectedValue1;
  String? selectedValue2;
  String? selectedValue3;
  String? selectedValue4;
  final List<String> items = [
    '100',
    '200',
    '20',
    '40',
  ];
  final List<String> items1 = [
    '100',
    '200',
    '20',
    '40',
  ];
  final List<String> items2 = [
    '100',
    '200',
    '20',
    '40',
  ];
  final List<String> items3 = [
    '100',
    '200',
    '20',
    '40',
  ];
  final List<String> items4 = [
    '100',
    '200',
    '20',
    '40',
  ];
  DateRangePickerController dateSelecter = DateRangePickerController();

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

  void _onselectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is PickerDateRange) {
    } else if (args.value is DateTime) {
    } else if (args.value is List<DateTime>) {
    } else {}
  }
  SampleItem? selectedMenu;
  InboxController inboxController = Get.put(InboxController());
  DateTime selectedDate1 = DateTime.now();
  bool cont = false;
  late ColorNotifier notifire;
  TextEditingController dateController1 = TextEditingController();


  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifier>(context, listen: true);
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return  Container(
              color: notifire.getbgcolor10,
              child: SingleChildScrollView(

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    container(constraints.maxWidth),
                  ],
                ),
              ),

          );
        } else if (constraints.maxWidth < 1000) {
          return  Container(
            decoration:  BoxDecoration(
                color: notifire.getbgcolor10
                ),
            child: SingleChildScrollView(

              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        container(constraints.maxWidth),
                      ],
                    ),
                  ],
                ),
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
              Text('Discussion',style: TextStyle(color: notifire.getblackcolor,fontSize: 14,fontFamily: 'InterRegular'),),
            ],
          ),
          const SizedBox(height: 20,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(flex: 5, child: cont ? container2(constraints) : container(constraints)),
              const SizedBox(width: 10,),
              Expanded(flex: 2, child: cont ? container3() : container1(constraints)),
            ],
          ),
        ],
      ),
    );
  }

  bool isdark = false;

  Widget container(constraints) {
    return
      constraints < 600 ?
      Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
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
                Text('Help Center',style: TextStyle(color: greyy,fontSize: 14,fontFamily: 'InterRegular'),),
                const SizedBox(width: 10,),
                Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: greyy,),),
                const SizedBox(width: 10,),
                Text('Discussion',style: TextStyle(color: notifire.getblackcolor,fontSize: 14,fontFamily: 'InterRegular'),),
              ],
            ),
            const SizedBox(height: 20,),

            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),
              itemCount: model().dis.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => container2(constraints),)),
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: notifire.getbgcolor11),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(  mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                model().dis[index],
                                style:  TextStyle(
                                  fontSize: 16,color: notifire.getblackcolor,
                                  fontFamily: 'InterRegular',
                                  fontWeight: FontWeight.w600,
                                ),maxLines: 2,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              model().dis1[index],
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color(0xff9DA2A7),
                                fontFamily: 'InterRegular',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(model().dis2[index],
                            style: const TextStyle(
                                fontSize: 14,
                                fontFamily: 'InterRegular',
                                color: Color(0xff727880),
                                fontWeight: FontWeight.w400)),
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: notifire.Getblg2),
                                  child: Text(model().dis3[index],
                                      style: const TextStyle(
                                          fontFamily: 'InterRegular',
                                          color: Color(0xff727880),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500)),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Image.asset(
                                  'assets/Ellipse 88.png',
                                  height: 5,
                                  color: const Color(0xffC6C8CB),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: model().dis5[index]),
                                  child: Text(model().dis6[index],
                                      style: TextStyle(
                                          fontFamily: 'InterRegular',
                                          color: model().dis4[index],
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500)),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Image.asset(
                                  'assets/Ellipse 88.png',
                                  height: 5,
                                  color: const Color(0xffC6C8CB),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                SvgPicture.asset(
                                  'assets/messages-3.svg',
                                  height: 16,
                                  color: const Color(0xff9DA2A7),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  model().dis7[index],
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'InterRegular',
                                    color: Color(0xff727880),
                                  ),
                                ),

                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  model().dis8[index],
                                  height: 30,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  model().dis9[index],
                                  style: const TextStyle(
                                    color: Color(0xff727880),
                                    fontFamily: 'InterRegular',
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ):
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: model().dis.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    if (cont == false) {
                      cont = true;
                    } else {
                      cont = false;
                    }
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(14),
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: notifire.getbgcolor11),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              model().dis[index],
                              style:  TextStyle(
                                fontSize: 16,
                                fontFamily: 'InterRegular',
                                fontWeight: FontWeight.w600,color: notifire.getblackcolor
                              ),
                            ),
                          ),
                          const Spacer(),
                          Text(
                            model().dis1[index],
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xff9DA2A7),
                              fontFamily: 'InterRegular',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(model().dis2[index],
                          style: const TextStyle(
                              fontSize: 14,
                              fontFamily: 'InterRegular',
                              color: Color(0xff727880),
                              fontWeight: FontWeight.w400)),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: notifire.Getblg2),
                            child: Text(model().dis3[index],
                                style: const TextStyle(
                                    fontFamily: 'InterRegular',
                                    color: Color(0xff727880),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500)),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Image.asset(
                            'assets/Ellipse 88.png',
                            height: 5,
                            color: const Color(0xffC6C8CB),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: model().dis5[index]),
                            child: Text(model().dis6[index],
                                style: TextStyle(
                                    fontFamily: 'InterRegular',
                                    color: model().dis4[index],
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500)),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Image.asset(
                            'assets/Ellipse 88.png',
                            height: 5,
                            color: const Color(0xffC6C8CB),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SvgPicture.asset(
                            'assets/messages-3.svg',
                            height: 16,
                            color: const Color(0xff9DA2A7),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            model().dis7[index],
                            style: const TextStyle(
                              fontSize: 12,
                              fontFamily: 'InterRegular',
                              color: Color(0xff727880),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Image.asset(
                            'assets/Ellipse 88.png',
                            height: 5,
                            color: const Color(0xffC6C8CB),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Image.asset(
                            model().dis8[index],
                            height: 30,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            model().dis9[index],
                            style: const TextStyle(
                              color: Color(0xff727880),
                              fontFamily: 'InterRegular',
                              fontSize: 14,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          )
        ],
      );
  }

  Widget container1(constraints) {
    return
      constraints < 600 ?
      Container(
        padding: const EdgeInsets.all(12),
        decoration:  BoxDecoration(borderRadius: BorderRadius.circular(12),
          color: notifire.getbgcolor11,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Filter',
              style: TextStyle(
                fontFamily: 'InterRegular',
                fontSize: 14,color: notifire.getblackcolor,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Sort by',
                  style: TextStyle(
                    fontFamily: 'InterRegular',
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff727880),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
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
                                    'Newest',
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
                            .map((String item) => DropdownMenuItem<String>(
                          value: item,
                          child: Row(
                            children: [
                              Text(
                                item,
                                style:  TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: notifire.getblackcolor,
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

                          padding: const EdgeInsets.only(left: 14, right: 14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: const Color(0xffEEEEEE),
                            ),

                          ),
                          elevation: 0,
                        ),
                        iconStyleData:  IconStyleData(
                          icon: Icon(
                              Icons.keyboard_arrow_down_outlined,
                              size: 25,color: notifire.getblackcolor
                          ),
                          iconSize: 14,
                          iconEnabledColor: Colors.black,
                          iconDisabledColor: Colors.grey,
                        ),
                        dropdownStyleData: DropdownStyleData(
                          maxHeight: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),

                          ),
                          offset: const Offset(-20, 0),
                          scrollbarTheme: ScrollbarThemeData(
                            radius: const Radius.circular(40),
                            thickness: MaterialStateProperty.all<double>(6),
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
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Create Date',
                  style: TextStyle(
                    fontFamily: 'InterRegular',
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff727880),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
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
                                    'Last 30 days',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'InterRegular',
                                      color: notifire.getblackcolor,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        items: items
                            .map((String item1) => DropdownMenuItem<String>(
                          value: item1,
                          child: Row(
                            children: [
                              Text(
                                item1,
                                style:  const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,

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

                          padding: const EdgeInsets.only(left: 14, right: 14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: const Color(0xffEEEEEE),
                            ),

                          ),
                          elevation: 0,
                        ),
                        iconStyleData:  IconStyleData(
                          icon: Icon(
                              Icons.keyboard_arrow_down_outlined,
                              size: 25,color: notifire.getblackcolor
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
                            thickness: MaterialStateProperty.all<double>(6),
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
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Priority',
                  style: TextStyle(
                    fontFamily: 'InterRegular',
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff727880),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
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
                                    'Any',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'InterRegular',
                                      color: notifire.getblackcolor,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        items: items
                            .map((String item2) => DropdownMenuItem<String>(
                          value: item2,
                          child: Row(
                            children: [
                              Text(
                                item2,
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

                          padding: const EdgeInsets.only(left: 14, right: 14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: const Color(0xffEEEEEE),
                            ),

                          ),
                          elevation: 0,
                        ),
                        iconStyleData:  IconStyleData(
                          icon: Icon(
                              Icons.keyboard_arrow_down_outlined,
                              size: 25,color: notifire.getblackcolor
                          ),
                          iconSize: 14,
                          iconEnabledColor: Colors.black,
                          iconDisabledColor: Colors.grey,
                        ),
                        dropdownStyleData: DropdownStyleData(
                          maxHeight: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),

                          ),
                          offset: const Offset(-20, 0),
                          scrollbarTheme: ScrollbarThemeData(
                            radius: const Radius.circular(40),
                            thickness: MaterialStateProperty.all<double>(6),
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
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Due Date',
                  style: TextStyle(
                    fontFamily: 'InterRegular',
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff727880),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: grey2,
                      ),
                      borderRadius: BorderRadius.circular(15)),
                  child: TextField(
                    onTap: () {
                      buildDialog();
                    },
                    controller: dateController1,
                    readOnly: true,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      suffixIcon: Image.asset(AppContent.calendar,
                          scale: 3, color: const Color(0xff9DA2A7)),
                      hintText:
                      "${selectedDate1.day}-${selectedDate1.month}-${selectedDate1.year}",
                      hintStyle: TextStyle(
                          color: notifire.getblackcolor,
                          fontFamily: 'UrbanistBold',
                          fontSize: 15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: grey2)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(12)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: blue),
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Tags',
                  style: TextStyle(
                    fontFamily: 'InterRegular',
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff727880),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
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
                                    'Any',
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
                            .map((String item3) => DropdownMenuItem<String>(
                          value: item3,
                          child: Row(
                            children: [
                              Text(
                                item3,
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

                          padding: const EdgeInsets.only(left: 14, right: 14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: const Color(0xffEEEEEE),
                            ),

                          ),
                          elevation: 0,
                        ),
                        iconStyleData:  IconStyleData(
                          icon: Icon(
                              Icons.keyboard_arrow_down_outlined,
                              size: 25,color: notifire.getblackcolor
                          ),
                          iconSize: 14,
                          iconEnabledColor: Colors.black,
                          iconDisabledColor: Colors.grey,
                        ),
                        dropdownStyleData: DropdownStyleData(
                          maxHeight: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),

                          ),
                          offset: const Offset(-20, 0),
                          scrollbarTheme: ScrollbarThemeData(
                            radius: const Radius.circular(40),
                            thickness: MaterialStateProperty.all<double>(6),
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
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Sources',
                  style: TextStyle(
                    fontFamily: 'InterRegular',
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff727880),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
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
                                    'Any',
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
                            .map((String item4) => DropdownMenuItem<String>(
                          value: item4,
                          child: Row(
                            children: [
                              Text(
                                item4,
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

                          padding: const EdgeInsets.only(left: 14, right: 14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: const Color(0xffEEEEEE),
                            ),

                          ),
                          elevation: 0,
                        ),
                        iconStyleData:  IconStyleData(
                          icon: Icon(
                              Icons.keyboard_arrow_down_outlined,
                              size: 25,color: notifire.getblackcolor
                          ),
                          iconSize: 14,
                          iconEnabledColor: Colors.black,
                          iconDisabledColor: Colors.grey,
                        ),
                        dropdownStyleData: DropdownStyleData(
                          maxHeight: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),

                          ),
                          offset: const Offset(-20, 0),
                          scrollbarTheme: ScrollbarThemeData(
                            radius: const Radius.circular(40),
                            thickness: MaterialStateProperty.all<double>(6),
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
              ],
            ),
          ],
        ),
      ):
      Container(
        padding: const EdgeInsets.all(12),
      decoration:  BoxDecoration(borderRadius: BorderRadius.circular(12),
          color: notifire.getbgcolor11,
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
           Text(
            'Filter',
            style: TextStyle(
              fontFamily: 'InterRegular',
              fontSize: 14,color: notifire.getblackcolor,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Sort by',
                style: TextStyle(
                  fontFamily: 'InterRegular',
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff727880),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
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
                                  'Newest',
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
                          .map((String item) => DropdownMenuItem<String>(
                                value: item,
                                child: Row(
                                  children: [
                                    Text(
                                      item,
                                      style:  TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: notifire.getblackcolor,
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
                        width: Get.width * 0.25,
                        padding: const EdgeInsets.only(left: 14, right: 14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: notifire.getgrey1,
                          ),

                        ),
                        elevation: 0,
                      ),
                      iconStyleData:  IconStyleData(
                        icon: Icon(
                          Icons.keyboard_arrow_down_outlined,
                          size: 25,color: notifire.getblackcolor
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
                          thickness: MaterialStateProperty.all<double>(6),
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
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Create Date',
                style: TextStyle(
                  fontFamily: 'InterRegular',
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff727880),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
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
                                  'Last 30 days',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'InterRegular',
                                    color: notifire.getblackcolor,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      items: items1
                          .map((String item1) => DropdownMenuItem<String>(
                                value: item1,
                                child: Row(
                                  children: [
                                    Text(
                                      item1,
                                      style:   TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: notifire.getblackcolor,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ))
                          .toList(),
                      value: selectedValue1,
                      onChanged: (String? value) {
                        setState(() {
                          selectedValue1 = value;
                        });
                      },
                      buttonStyleData: ButtonStyleData(
                        height: 45,
                        width: Get.width * 0.25,
                        padding: const EdgeInsets.only(left: 14, right: 14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: notifire.getgrey1,
                          ),

                        ),
                        elevation: 0,
                      ),
                      iconStyleData:  IconStyleData(
                        icon: Icon(
                          Icons.keyboard_arrow_down_outlined,
                          size: 25,color: notifire.getblackcolor
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
                          thickness: MaterialStateProperty.all<double>(6),
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
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Priority',
                style: TextStyle(
                  fontFamily: 'InterRegular',
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff727880),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
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
                                  'Any',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'InterRegular',
                                      color: notifire.getblackcolor,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      items: items2
                          .map((String item2) => DropdownMenuItem<String>(
                                value: item2,
                                child: Row(
                                  children: [
                                    Text(
                                      item2,
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
                      value: selectedValue2,
                      onChanged: (String? value) {
                        setState(() {
                          selectedValue2 = value;
                        });
                      },
                      buttonStyleData: ButtonStyleData(
                        height: 45,
                        width: Get.width * 0.25,
                        padding: const EdgeInsets.only(left: 14, right: 14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: notifire.getgrey1,
                          ),

                        ),
                        elevation: 0,
                      ),
                      iconStyleData:  IconStyleData(
                        icon: Icon(
                          Icons.keyboard_arrow_down_outlined,
                          size: 25,color: notifire.getblackcolor
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
                          thickness: MaterialStateProperty.all<double>(6),
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
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Due Date',
                style: TextStyle(
                  fontFamily: 'InterRegular',
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff727880),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 45,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: notifire.getgrey1,
                    ),
                    borderRadius: BorderRadius.circular(15)),
                child: TextField(
                  onTap: () {
                    buildDialog();
                  },
                  controller: dateController1,
                  readOnly: true,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(fillColor: notifire.getbgcolor11,
                    suffixIcon: Image.asset(AppContent.calendar,
                        scale: 3, color: const Color(0xff9DA2A7)),
                    hintText:
                        "${selectedDate1.day}-${selectedDate1.month}-${selectedDate1.year}",
                    hintStyle: TextStyle(
                        color: notifire.getblackcolor,
                        fontFamily: 'InterRegular',
                        fontSize: 15),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: grey2)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(12)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: blue),
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Tags',
                style: TextStyle(
                  fontFamily: 'InterRegular',
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff727880),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
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
                                  'Any',
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
                      items: items3
                          .map((String item3) => DropdownMenuItem<String>(
                                value: item3,
                                child: Row(
                                  children: [
                                    Text(
                                      item3,
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
                      value: selectedValue3,
                      onChanged: (String? value) {
                        setState(() {
                          selectedValue3 = value;
                        });
                      },
                      buttonStyleData: ButtonStyleData(
                        height: 45,
                        width: Get.width * 0.25,
                        padding: const EdgeInsets.only(left: 14, right: 14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: notifire.getgrey1,
                          ),

                        ),
                        elevation: 0,
                      ),
                      iconStyleData:  IconStyleData(
                        icon: Icon(
                          Icons.keyboard_arrow_down_outlined,
                          size: 25,color: notifire.getblackcolor
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
                          thickness: MaterialStateProperty.all<double>(6),
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
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Sources',
                style: TextStyle(
                  fontFamily: 'InterRegular',
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff727880),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
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
                                  'Any',
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
                      items: items4
                          .map((String item4) => DropdownMenuItem<String>(
                                value: item4,
                                child: Row(
                                  children: [
                                    Text(
                                      item4,
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
                      value: selectedValue4,
                      onChanged: (String? value) {
                        setState(() {
                          selectedValue4 = value;
                        });
                      },
                      buttonStyleData: ButtonStyleData(
                        height: 45,
                        width: Get.width * 0.25,
                        padding: const EdgeInsets.only(left: 14, right: 14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: notifire.getgrey1,
                          ),

                        ),
                        elevation: 0,
                      ),
                      iconStyleData:  IconStyleData(
                        icon: Icon(
                          Icons.keyboard_arrow_down_outlined,
                          size: 25,color: notifire.getblackcolor
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
                          thickness: MaterialStateProperty.all<double>(6),
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
            ],
          ),
        ],
      ),
    );
  }

  Widget container2(constraints) {
    if (constraints < 600) {
      return StatefulBuilder(
        builder: (context, setState) {
          return  Scaffold(
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
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
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
                          Text('Discussion',style: TextStyle(color: notifire.getblackcolor,fontSize: 14,fontFamily: 'InterRegular'),),
                        ],
                      ),
                      const SizedBox(height: 20,),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: notifire.getbgcolor11,
                            borderRadius: BorderRadius.circular(12)),
                        child: Column(   crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Need help! Would like to upgrade plan',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'InterRegular',color: notifire.getblackcolor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Ticket Type',
                                      style: TextStyle(
                                          fontFamily: 'InterRegular',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff9DA2A7)),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Payments & Plan Pricing',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'InterRegular',color: notifire.getblackcolor,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      'Ticket ID',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'InterRegular',
                                          color: Color(0xff9DA2A7),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      '#53326622',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'InterRegular',color: notifire.getblackcolor,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      'Create by',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'InterRegular',
                                          color: Color(0xff9DA2A7),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/avatar-6 1.png',
                                          height: 32,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Brooklyn Simmons',
                                          style: TextStyle(
                                            fontFamily: 'InterRegular',
                                            fontSize: 14,color: notifire.getblackcolor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Status',
                                      style: TextStyle(
                                          fontFamily: 'InterRegular',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff9DA2A7)),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      width: 60,
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: const Color(0xffEAF6FC),
                                      ),
                                      child: const Center(
                                          child: Text('New',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xff59B4D1),
                                                fontFamily: 'InterRegular',
                                              ))),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      'Create on',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'InterRegular',
                                          color: Color(0xff9DA2A7),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Dec 30, 2019 05:18',
                                      style: TextStyle(
                                        fontSize: 14,color: notifire.getblackcolor,
                                        fontFamily: 'InterRegular',
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      'Assign to',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'InterRegular',
                                          color: Color(0xff9DA2A7),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/avatar-7 1.png',
                                          height: 32,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Nguyen Savannah',
                                          style: TextStyle(
                                            fontFamily: 'InterRegular',
                                            fontSize: 14,color: notifire.getblackcolor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Prioty',
                                      style: TextStyle(
                                          fontFamily: 'InterRegular',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff9DA2A7)),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Medium',
                                      style: TextStyle(
                                        fontSize: 14,color: notifire.getblackcolor,
                                        fontFamily: 'InterRegular',
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      'Latest Update',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'InterRegular',
                                          color: Color(0xff9DA2A7),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Dec 30, 2019 05:18',
                                      style: TextStyle(
                                        fontSize: 14,color: notifire.getblackcolor,
                                        fontFamily: 'InterRegular',
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.',
                              style:
                              TextStyle(fontFamily: 'InterRegular', color: Color(0xff727880)),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(    padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: notifire.getbgcolor11,
                            borderRadius: BorderRadius.circular(12)),
                        child: Column(   crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Discussion (68)',
                              style: TextStyle(
                                fontFamily: 'InterRegular',
                                fontSize: 14,color: notifire.getblackcolor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    width: Get.width,
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: notifire.Getblg2),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                              'assets/text-italic.png',
                                              height: 16,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Image.asset(
                                              'assets/text-bold.png',
                                              height: 16,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Image.asset(
                                              'assets/text-underline.png',
                                              height: 16,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Image.asset(
                                              'assets/Ellipse 88.png',
                                              height: 5,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Image.asset(
                                              'assets/textalign-left.png',
                                              height: 16,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Image.asset(
                                              'assets/textalign-center.png',
                                              height: 16,
                                            ),
                                            const SizedBox(
                                              width: 10,
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
                                              width: 10,
                                            ),
                                            Image.asset(
                                              'assets/Ellipse 88.png',
                                              height: 5,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Image.asset(
                                              'assets/quote-up.png',
                                              height: 16,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Image.asset('assets/code.png',
                                                height: 16, color: const Color(0xff9DA2A7)),
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
                                                borderRadius: BorderRadius.circular(20)),
                                            child: TextField(
                                              style:  TextStyle(color: notifire.getblackcolor,),
                                              decoration: InputDecoration(
                                                hintText: 'Write messages ...',
                                                hintStyle: TextStyle(color: grey3),
                                                contentPadding:
                                                const EdgeInsets.only(left: 20, right: 20),
                                                border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(20),
                                                    borderSide: BorderSide(color: grey2)),
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
                                        Row(
                                          children: [
                                            Image.asset('assets/add-square.png', height: 16),
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            Image.asset('assets/microphone.png', height: 16),
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            Image.asset('assets/emoji-happy.png', height: 16),
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            const Icon(Icons.link,
                                                size: 20, color: Color(0xff727880)),
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
                                                child: Image.asset(
                                                  'assets/send.png',
                                                  height: 18,
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ListView.builder(
                              shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemCount: model().dis9.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          model().dis8[index],
                                          height: 32,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Flexible(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    model().dis9[index],
                                                    style: const TextStyle(
                                                        color: Color(0xff727880),
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w600,
                                                        fontFamily: 'InterRegular'),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Image.asset(
                                                    'assets/Ellipse 88.png',
                                                    height: 5,
                                                    color: const Color(0xffC6C8CB),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    model().dis10[index],
                                                    style: const TextStyle(
                                                      fontSize: 12,
                                                      color: Color(0xff727880),
                                                      fontFamily: 'InterRegular',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                model().dis2[index],
                                                style:  TextStyle(
                                                  fontFamily: 'InterRegular',
                                                  fontSize: 14,color: notifire.getblackcolor,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    'assets/lovely.png',
                                                    height: 16,
                                                  ),
                                                  const SizedBox(
                                                    width: 12,
                                                  ),
                                                  SvgPicture.asset(
                                                    'assets/reply.svg',
                                                    height: 16,
                                                  ),
                                                  const SizedBox(
                                                    width: 8,
                                                  ),
                                                  const Text(
                                                    'Reply',
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 14,
                                                      color: Color(0XFF9DA2A7),
                                                      fontFamily: 'InterRegular',
                                                    ),
                                                  )
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                );
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),

                          ],
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Container(
                        padding: const EdgeInsets.all(12),

                        decoration:  BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: notifire.getbgcolor11),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {

                                },
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),

                                      color: notifire.getbgcolor10
                                  ),

                                  child: Center(
                                    child: Row(children: [
                                      Image.asset('assets/note.png',
                                          height: 16, color: const Color(0xff727880)),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Text(
                                        'Add Note',
                                        style: TextStyle(
                                          color: Color(0xff727880),
                                          fontFamily: 'InterRegular',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ]),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              InkWell(
                                onTap: () {

                                },
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: notifire.getbgcolor10
                                  ),
                                  child: Center(
                                    child: Row(children: [
                                      SvgPicture.asset('assets/forward.svg',
                                          height: 16, color: const Color(0xff727880)),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Text(
                                        'Forward',
                                        style: TextStyle(
                                          color: Color(0xff727880),
                                          fontFamily: 'InterRegular',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ]),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              InkWell(
                                onTap: () {

                                },
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: notifire.getbgcolor10
                                  ),
                                  child: const Center(
                                    child: Row(children: [
                                      Icon(Icons.arrow_forward, size: 20, color: Color(0xff727880)),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Move',
                                        style: TextStyle(
                                          color: Color(0xff727880),
                                          fontFamily: 'InterRegular',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ]),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              InkWell(
                                onTap: () {

                                },
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: notifire.getbgcolor10
                                  ),
                                  child: Center(
                                    child: Row(children: [
                                      SvgPicture.asset(
                                        'assets/tick-circle.svg',
                                        height: 16,
                                        color: const Color(0xff727880),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Text(
                                        'Close Ticket',
                                        style: TextStyle(
                                          color: Color(0xff727880),
                                          fontFamily: 'InterRegular',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ]),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              InkWell(
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: notifire.getbgcolor10
                                  ),
                                  child: Center(
                                    child: Row(children: [
                                      SvgPicture.asset(
                                        'assets/archive.svg',
                                        height: 16,
                                        color: const Color(0xff727880),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Text(
                                        'Archive',
                                        style: TextStyle(
                                          color: Color(0xff727880),
                                          fontFamily: 'InterRegular',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ]),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Attach files',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,color: notifire.getblackcolor,
                                    fontFamily: 'InterRegular'),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 60,
                                child: InkWell(
                                  onTap: () {},
                                  child: DottedBorder(
                                    color: const Color(0xffEEEEEE),
                                    borderType: BorderType.RRect,
                                    radius: const Radius.circular(12),
                                    padding: const EdgeInsets.all(12),
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                                      child: SizedBox(
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
                                                  'SAML18920-An-.html',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: notifire.getblackcolor,
                                                    fontFamily: 'InterRegular',
                                                  ),
                                                ),
                                                const Text(
                                                  '441.72 KB   ',
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
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 60,
                                child: InkWell(
                                  onTap: () {},
                                  child: DottedBorder(
                                    color: const Color(0xffEEEEEE),
                                    borderType: BorderType.RRect,
                                    radius: const Radius.circular(12),
                                    padding: const EdgeInsets.all(12),
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                                      child: SizedBox(
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
                                                    color: notifire.getblackcolor,
                                                    fontFamily: 'InterRegular',
                                                  ),
                                                ),
                                                const Text(
                                                  '441.72 KB   ',
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
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10,)
                      ,            ]
                ),
              ),
            ),
          );
        },
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
           Container(
             padding: const EdgeInsets.all(12),
             decoration: BoxDecoration(
             color: notifire.getbgcolor11,
                 borderRadius: BorderRadius.circular(12)),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 Text(
                  'Need help! Would like to upgrade plan',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'InterRegular',color: notifire.getblackcolor,
                    fontWeight: FontWeight.w600,
                  ),
                           ),
                 const SizedBox(
                   height: 20,
                 ),
                 Row(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.start,
                       children: [
                         const Text(
                           'Ticket Type',
                           style: TextStyle(
                               fontFamily: 'InterRegular',
                               fontSize: 12,
                               fontWeight: FontWeight.w600,
                               color: Color(0xff9DA2A7)),
                         ),
                         const SizedBox(
                           height: 5,
                         ),
                         Text(
                           'Payments & Plan Pricing',
                           style: TextStyle(
                             fontSize: 14,
                             fontFamily: 'InterRegular',color: notifire.getblackcolor,
                           ),
                         ),
                         const SizedBox(
                           height: 10,
                         ),
                         const Text(
                           'Ticket ID',
                           style: TextStyle(
                               fontSize: 12,
                               fontFamily: 'InterRegular',
                               color: Color(0xff9DA2A7),
                               fontWeight: FontWeight.w600),
                         ),
                         const SizedBox(
                           height: 5,
                         ),
                         Text(
                           '#53326622',
                           style: TextStyle(
                             fontSize: 14,color: notifire.getblackcolor,
                             fontFamily: 'InterRegular',
                           ),
                         ),
                         const SizedBox(
                           height: 10,
                         ),
                         const Text(
                           'Create by',
                           style: TextStyle(
                               fontSize: 12,
                               fontFamily: 'InterRegular',
                               color: Color(0xff9DA2A7),
                               fontWeight: FontWeight.w600),
                         ),
                         const SizedBox(
                           height: 10,
                         ),
                         Row(
                           children: [
                             Image.asset(
                               'assets/avatar-6 1.png',
                               height: 32,
                             ),
                             const SizedBox(
                               width: 10,
                             ),
                             Text(
                               'Brooklyn Simmons',
                               style: TextStyle(
                                   fontFamily: 'InterRegular',
                                   fontSize: 14,color: notifire.getblackcolor
                               ),
                             ),
                           ],
                         ),
                       ],
                     ),
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.start,
                       children: [
                         const Text(
                           'Status',
                           style: TextStyle(
                               fontFamily: 'InterRegular',
                               fontSize: 12,
                               fontWeight: FontWeight.w600,
                               color: Color(0xff9DA2A7)),
                         ),
                         const SizedBox(
                           height: 5,
                         ),
                         Container(
                           padding: const EdgeInsets.all(4),
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(12),
                             color: const Color(0xffEAF6FC),
                           ),
                           child: const Center(
                               child: Text('New',
                                   style: TextStyle(
                                     fontSize: 12,
                                     color: Color(0xff59B4D1),
                                     fontFamily: 'InterRegular',
                                   ))),
                         ),
                         const SizedBox(
                           height: 10,
                         ),
                         const Text(
                           'Create on',
                           style: TextStyle(
                               fontSize: 12,
                               fontFamily: 'InterRegular',
                               color: Color(0xff9DA2A7),
                               fontWeight: FontWeight.w600),
                         ),
                         const SizedBox(
                           height: 5,
                         ),
                         Text(
                           'Dec 30, 2019 05:18',
                           style: TextStyle(
                               fontSize: 14,
                               fontFamily: 'InterRegular',color: notifire.getblackcolor
                           ),
                         ),
                         const SizedBox(
                           height: 10,
                         ),
                         const Text(
                           'Assign to',
                           style: TextStyle(
                               fontSize: 12,
                               fontFamily: 'InterRegular',
                               color: Color(0xff9DA2A7),
                               fontWeight: FontWeight.w600),
                         ),
                         const SizedBox(
                           height: 10,
                         ),
                         Row(
                           children: [
                             Image.asset(
                               'assets/avatar-7 1.png',
                               height: 32,
                             ),
                             const SizedBox(
                               width: 10,
                             ),
                             Text(
                               'Nguyen Savannah',
                               style: TextStyle(
                                   fontFamily: 'InterRegular',
                                   fontSize: 14,color: notifire.getblackcolor
                               ),
                             ),
                           ],
                         ),
                       ],
                     ),
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.start,
                       children: [
                         const Text(
                           'Prioty',
                           style: TextStyle(
                               fontFamily: 'InterRegular',
                               fontSize: 12,
                               fontWeight: FontWeight.w600,
                               color: Color(0xff9DA2A7)),
                         ),
                         const SizedBox(
                           height: 5,
                         ),
                         Text(
                           'Medium',
                           style: TextStyle(
                             fontSize: 14,
                             fontFamily: 'InterRegular',color: notifire.getblackcolor,
                           ),
                         ),
                         const SizedBox(
                           height: 10,
                         ),
                         const Text(
                           'Latest Update',
                           style: TextStyle(
                               fontSize: 12,
                               fontFamily: 'InterRegular',
                               color: Color(0xff9DA2A7),
                               fontWeight: FontWeight.w600),
                         ),
                         const SizedBox(
                           height: 5,
                         ),
                         Text(
                           'Dec 30, 2019 05:18',
                           style: TextStyle(
                               fontSize: 14,
                               fontFamily: 'InterRegular',color: notifire.getblackcolor
                           ),
                         ),
                       ],
                     ),
                   ],
                 ),
                 const SizedBox(
                   height: 20,
                 ),
                 const Text(
                   'But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.',
                   style:
                   TextStyle(fontFamily: 'InterRegular', color: Color(0xff727880)),
                 ),
                 const SizedBox(
                   height: 20,
                 ),
               ],
             ),
           ),
const SizedBox(height: 10,),
           Container(
             padding: const EdgeInsets.all(12),
             decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: notifire.getbgcolor11),
             child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 Text(
                  'Discussion (68)',
                  style: TextStyle(
                    fontFamily: 'InterRegular',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,color: notifire.getblackcolor
                  ),
                           ),
                 const SizedBox(
                   height: 10,
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: <Widget>[
                     Expanded(
                       child: Container(
                         width: Get.width,
                         padding: const EdgeInsets.all(12),
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(12),
                             color: notifire.Getblg2),
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.start,
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
                                     height: 16, color: const Color(0xff9DA2A7)),
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
                                     borderRadius: BorderRadius.circular(20)),
                                 child: TextField(
                                   style:  TextStyle(color: notifire.getblackcolor),
                                   decoration: InputDecoration(
                                     hintText: 'Write messages ...',
                                     hintStyle: TextStyle(color: grey3),
                                     contentPadding:
                                     const EdgeInsets.only(left: 20, right: 20),
                                     border: OutlineInputBorder(
                                         borderRadius: BorderRadius.circular(20),
                                         borderSide: BorderSide(color: grey2)),
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
                             Row(
                               children: [
                                 Image.asset('assets/add-square.png', height: 16),
                                 const SizedBox(
                                   width: 15,
                                 ),
                                 Image.asset('assets/microphone.png', height: 16),
                                 const SizedBox(
                                   width: 15,
                                 ),
                                 Image.asset('assets/emoji-happy.png', height: 16),
                                 const SizedBox(
                                   width: 15,
                                 ),
                                 const Icon(Icons.link,
                                     size: 20, color: Color(0xff727880)),
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
                                     child: Image.asset(
                                       'assets/send.png',
                                       height: 18,
                                     )),
                               ],
                             ),
                           ],
                         ),
                       ),
                     )
                   ],
                 ),
                 const SizedBox(
                   height: 20,
                 ),
                 ListView.builder(
                   shrinkWrap: true,
                   scrollDirection: Axis.vertical,
                   itemCount: model().dis9.length,
                   itemBuilder: (context, index) {
                     return Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Image.asset(
                               model().dis8[index],
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
                                     Text(
                                       model().dis9[index],
                                       style: const TextStyle(
                                           color: Color(0xff727880),
                                           fontSize: 14,
                                           fontWeight: FontWeight.w600,
                                           fontFamily: 'InterRegular'),
                                     ),
                                     const SizedBox(
                                       width: 10,
                                     ),
                                     Image.asset(
                                       'assets/Ellipse 88.png',
                                       height: 5,
                                       color: const Color(0xffC6C8CB),
                                     ),
                                     const SizedBox(
                                       width: 10,
                                     ),
                                     Text(
                                       model().dis10[index],
                                       style: const TextStyle(
                                         fontSize: 12,
                                         color: Color(0xff727880),
                                         fontFamily: 'InterRegular',
                                       ),
                                     ),
                                   ],
                                 ),
                                 const SizedBox(
                                   height: 10,
                                 ),
                                 Text(
                                   model().dis2[index],
                                   style:  TextStyle(
                                     fontFamily: 'InterRegular',
                                     fontSize: 14,color: notifire.getblackcolor,
                                     fontWeight: FontWeight.w500,
                                   ),
                                 ),
                                 const SizedBox(
                                   height: 10,
                                 ),
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.start,
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Image.asset(
                                       'assets/lovely.png',
                                       height: 16,
                                     ),
                                     const SizedBox(
                                       width: 12,
                                     ),
                                     SvgPicture.asset(
                                       'assets/reply.svg',
                                       height: 16,
                                     ),
                                     const SizedBox(
                                       width: 8,
                                     ),
                                     const Text(
                                       'Reply',
                                       style: TextStyle(
                                         fontWeight: FontWeight.w600,
                                         fontSize: 14,
                                         color: Color(0XFF9DA2A7),
                                         fontFamily: 'InterRegular',
                                       ),
                                     )
                                   ],
                                 ),
                                 const SizedBox(
                                   height: 20,
                                 ),
                               ],
                             ),
                           ],
                         )
                       ],
                     );
                   },
                 )
               ],
             ),
           ),

        ],
      );
    }
  }

  Widget container3() {
    return
      Container(
padding: const EdgeInsets.all(12),

      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(12),
          color: notifire.getbgcolor11),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {

              },
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),

                    color: notifire.getbgcolor10
                  ),

                child: Center(
                  child: Row(children: [
                    Image.asset('assets/note.png',
                        height: 16, color: const Color(0xff727880)),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Add Note',
                      style: TextStyle(
                        color: Color(0xff727880),
                        fontFamily: 'InterRegular',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ]),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {

              },
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                    color: notifire.getbgcolor10
                ),
                child: Center(
                  child: Row(children: [
                    SvgPicture.asset('assets/forward.svg',
                        height: 16, color: const Color(0xff727880)),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Forward',
                      style: TextStyle(
                        color: Color(0xff727880),
                        fontFamily: 'InterRegular',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ]),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {

              },
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                    color: notifire.getbgcolor10
                ),
                child: const Center(
                  child: Row(children: [
                    Icon(Icons.arrow_forward, size: 20, color: Color(0xff727880)),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Move',
                      style: TextStyle(
                        color: Color(0xff727880),
                        fontFamily: 'InterRegular',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ]),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                    color: notifire.getbgcolor10
                ),
                child: Center(
                  child: Row(children: [
                    SvgPicture.asset(
                      'assets/tick-circle.svg',
                      height: 16,
                      color: const Color(0xff727880),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Close Ticket',
                      style: TextStyle(
                        color: Color(0xff727880),
                        fontFamily: 'InterRegular',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ]),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                    color: notifire.getbgcolor10
                ),
                child: Center(
                  child: Row(children: [
                    SvgPicture.asset(
                      'assets/archive.svg',
                      height: 16,
                      color: const Color(0xff727880),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Archive',
                      style: TextStyle(
                        color: Color(0xff727880),
                        fontFamily: 'InterRegular',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ]),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
             Text(
              'Attach files',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,color: notifire.getblackcolor,
                  fontFamily: 'InterRegular'),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 60,
              child: InkWell(
                onTap: () {},
                child: DottedBorder(
                  color: notifire.getgrey1,
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(12),
                  padding: const EdgeInsets.all(12),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    child: SizedBox(
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
                                'SAML18920-An-.html',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: notifire.getblackcolor,
                                  fontFamily: 'InterRegular',
                                ),
                              ),
                              const Text(
                                '441.72 KB   ',
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
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 60,
              child: InkWell(
                onTap: () {},
                child: DottedBorder(
                  color: notifire.getgrey1,
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(12),
                  padding: const EdgeInsets.all(12),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    child: SizedBox(
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
                                  color: notifire.getblackcolor,
                                  fontFamily: 'InterRegular',
                                ),
                              ),
                              const Text(
                                '441.72 KB   ',
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
              ),
            ),
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
}
