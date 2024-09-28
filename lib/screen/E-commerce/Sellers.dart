// ignore_for_file: non_constant_identifier_names

import 'dart:math' show Random;
// ignore_for_file: prefer_const_constructors, file_names, camel_case_types
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../confing/colors.dart';

import '../../confing/list.dart';
import '../../confing/notifier.dart';
import '../../controller/page_controller.dart';
import '../Dashboard/Dashboard_main.dart';
import '../de.dart';
// ignore_for_file: deprecated_member_use

class Sellers extends StatefulWidget {
  const Sellers({super.key});

  @override
  State<Sellers> createState() => _SellersState();
}

class _SellersState extends State<Sellers> {
  final List<String> items = [
    'India',
    'Australia',
    'Germany',
    'Us',
    'Uk',
  ];

  int selectIndex = 0;
  late ColorNotifier notifire;
  SampleItem? selectedMenu;
  DateTime selectedDate = DateTime.now();
  InboxController inboxController = Get.put(InboxController());
  TextEditingController dateController = TextEditingController();
  DateRangePickerController dateSelecter = DateRangePickerController();
  TextEditingController dateController1 = TextEditingController();

  DateTime selectedDate1 = DateTime.now();

  String dropdownvalue = 'All Date';


  bool switc = false;
  var selectedPageNumber = 4;
  String? selectedValue;
  String? selectedValue1;
  String? selectedValue2;
  String? selectedValue3;
  String? selectedValue4;
  bool container = false;

  final List<String> items1 = [
    'India',
    'Australia',
    'Germany',
    'Us',
    'Uk',
  ];

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifier>(context, listen: true);
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return  Container(

              color: notifire.getbgcolor10,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      container2(constraints.maxWidth),
                    ],
                  ),
                ),
              ),

          );
        } else if (constraints.maxWidth < 1000) {
          return Container(
            decoration:  BoxDecoration(
                color: notifire.getbgcolor10
                ),
            child: SingleChildScrollView(
              child: Column(
                children: [

                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        container2(constraints.maxWidth),
                      ],
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
                  children: [

                    SingleChildScrollView(
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
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
  int _currentStep = 0;
  _stepState(int step) {
    if (_currentStep > step) {
      return StepState.complete;
    } else {
      return StepState.editing;
    }
  }
  InvoiceController invoiceController = Get.put(InvoiceController());
  List listtiletitle = [
    '(319) 555-0115',
    '(343) 467-3664',
    '(312) 577-4574',
    '(345) 987-3456',
    '(355) 457-9873',
    '(363) 543-2688',
    '(319) 555-0115',
    '(343) 467-3664',
    '(312) 577-4574',
    '(345) 987-3456',
    '(355) 457-9873',
    '(363) 543-2688',
    '(363) 543-2688',
    '(319) 555-0115',
    '(343) 467-3664',
    '(312) 577-4574',
    '(345) 987-3456',
  ];
  List imageintable = [
    'assets/Brand Logo11.png',
    'assets/Brand23.png',
    'assets/Media13.png',
    'assets/Media14.png',
    'assets/Media10.png',
    'assets/Brand Logo21.png',
    'assets/Brand Logo11.png',
    'assets/Brand23.png',
    'assets/Media13.png',
    'assets/Media14.png',
    'assets/Media10.png',
    'assets/Brand Logo21.png',
    'assets/Media14.png',
    'assets/Media10.png',
    'assets/Brand Logo21.png',
    'assets/Brand Logo11.png',
    'assets/Brand23.png',
  ];
  List imageintable1 = [
    'assets/Avatar52.png',
    'assets/avatar-6 1.png',
    'assets/avatar-7 1.png',
    'assets/avatar-8 1.png',
    'assets/Avatar51.png',
    'assets/Avatar71.png',
    'assets/avatar-6 1.png',
    'assets/Avatar52.png',
    'assets/avatar-6 1.png',
    'assets/avatar-7 1.png',
    'assets/avatar-8 1.png',
    'assets/Avatar51.png',
    'assets/Avatar71.png',
    'assets/avatar-6 1.png',
    'assets/Avatar71.png',
    'assets/avatar-6 1.png',
    'assets/Avatar52.png',
    'assets/avatar-6 1.png',
  ];
  List proname = [
    'DJI Mavic Pro 2',
    'Coach Tabby',
    'Playstation 4',
    'Air Jordan 1',
    'Macbook Pro',
    'DJI Mavic 2',
    'Coach Tabby',
    'Playstation 4',
    'Air Jordan 1',
    'Macbook Pro 14',
    'DJI Mavic Pro 2',
    'Coach Tabby f',
    'Playstation 6',
    'Coach Tabby',
    'Playstation 2',
    'Air Jordan 1',
    'Macbook Pro',
    'Playstation 5',
  ];
  List proname1 = [
    'Ananya Ishana',
    'Rahul Kohli',
    'Akshay Kumar',
    'Harsha Agrawal',
    'Mahavir Agrawal',
    'Kavya Sharma',
    'Rahul Kohli',
    'Akshay Kumar',
    'Harsha Agrawal',
    'Mahavir Agrawal',
    'Kavya Sharma',
    'Ananya Ishana',
    'Rahul Kohli',
    'Akshay Kumar',
    'Harsha Agrawal',
    'Mahavir Agrawal',
    'Kavya Sharma',
    'Ananya Ishana',
  ];
  List stoek = [
'20 Feb 2022',
'24 Feb 2021',
'21 Feb 2002',
'21 Feb 2002',
'12 Nov 2042',
'27 Feb 2032',
        '20 Feb 2022',
    '24 Feb 2021',
    '21 Feb 2002',
    '21 Feb 2002',
    '12 Nov 2042',
    '27 Feb 2032',
    '21 Feb 2002',
    '12 Nov 2042',
    '27 Feb 2032',
    '20 Feb 2022',
    '24 Feb 2021',
    '21 Feb 2002',
  ];
  List Orders = [
    'Active',
    'Blocked',
    'Active',
    'Active',
    'Inactive',
    'Blocked',
    'Active',
    'Blocked',
    'Active',
    'Active',
    'Inactive',
    'Blocked',
    'Active',
    'Blocked',
    'Active',
    'Active',
    'Inactive',
    'Blocked',
  ];
  List ster1 = [
    '2',
    '4',
    '4.5',
    '2.3',
    '4.2',
    '3.2',
    '5',
    '3',
    '1.2',
    '2',
    '4',
    '4.5',
    '2.3',
    '4.2',
    '3.2',
    '5',
    '3',
    '1.2',
  ];
  List ster = [
    '\$354.66',
    '\$466.44',
    '\$344.55',
    '\$645.56',
    '\$45.55',
    '\$577.55',
    '\$466.44',
    '\$344.55',
    '\$354.66',
    '\$466.44',
    '\$344.55',
    '\$645.56',
    '\$45.55',
    '\$577.55',
    '\$466.44',
    '\$344.55',
    '\$344.55',
    '\$354.66',
  ];
  List Price = [
    '345',
    '566',
    '123',
    '446',
    '354',
    '865',
    '567',
    '234',
    '532',
    '321',
    '345',
    '765',
    '895',
    '342',
    '345',
    '234',
    '233',
    '231',
  ];
  List name1 = [
    const Color(0xffE6F9EF),
    const Color(0xffFAEBEC),
    const Color(0xffE6F9EF),
    const Color(0xffE6F9EF),
    const Color(0xffFAEBEC),
    const Color(0xffEEEEEE),
    const Color(0xffE6F9EF),
    const Color(0xffFAEBEC),
    const Color(0xffE6F9EF),
    const Color(0xffE6F9EF),
    const Color(0xffFAEBEC),
    const Color(0xffE6F9EF),
    const Color(0xffFAEBEC),
    const Color(0xffE6F9EF),
    const Color(0xffE6F9EF),
    const Color(0xffFAEBEC),
    const Color(0xffEEEEEE),
    const Color(0xffEEEEEE),
  ];
  List name2 = [
    const Color(0xff7DC066),
    const Color(0xffE5646C),
    const Color(0xff7DC066),
    const Color(0xff7DC066),
    const Color(0xffE5646C),
    const Color(0xff9DA2A7),
    const Color(0xff7DC066),
    const Color(0xffE5646C),
    const Color(0xff7DC066),
    const Color(0xff7DC066),
    const Color(0xffE5646C),
    const Color(0xff9DA2A7),
    const Color(0xffE5646C),
    const Color(0xff7DC066),
    const Color(0xff7DC066),
    const Color(0xffE5646C),
    const Color(0xff9DA2A7),
  ];
  bool isActive = false;
  List Price1 = [
    '\$200',
    '\$450',
    '\$304',
    '\$230',
    '\$505',
    '\$900',
    '\$604',
    '\$200',
    '\$450',
    '\$304',
    '\$230',
    '\$505',
    '\$900',
    '\$604',
    '\$230',
    '\$505',
    '\$900',
    '\$604',
  ];
  bool light = true;

  _steps() => [
        Step(

          title: Text('Owner',
              style: TextStyle(
                  fontFamily: 'InterRegular',
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: _currentStep == 0 ? notifire.getblackcolor: Colors.black)),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'First Name',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'InterRegular',
                        color: Color(0xff727880)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all( color: notifire.getgrey1)),
                    child: TextField(
                      style:  TextStyle(color:  notifire.getblackcolor,),
                      decoration: InputDecoration(
                        hintText: 'Enter First Name',
                        hintStyle: const TextStyle(
                            color: Color(0xffC6C8CB), fontSize: 15),
                        contentPadding:
                            const EdgeInsets.only(left: 20, right: 20),
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
                    'Last Name',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'InterRegular',
                        color: Color(0xff727880)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all( color: notifire.getgrey1)),
                    child: TextField(
                      style:  TextStyle(color:  notifire.getblackcolor,),
                      decoration: InputDecoration(
                        hintText: 'Enter Last Name',
                        hintStyle: const TextStyle(
                            color: Color(0xffC6C8CB), fontSize: 15),
                        contentPadding:
                            const EdgeInsets.only(left: 20, right: 20),
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
                    'Phone Number',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'InterRegular',
                        color: Color(0xff727880)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all( color: notifire.getgrey1)),
                    child: TextField(
                      style:  TextStyle(color:  notifire.getblackcolor,),
                      decoration: InputDecoration(
                        hintText: 'Enter Phone Number',
                        hintStyle: const TextStyle(
                            color: Color(0xffC6C8CB), fontSize: 15),
                        contentPadding:
                            const EdgeInsets.only(left: 20, right: 20),
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
                    'Email',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'InterRegular',
                        color: Color(0xff727880)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all( color: notifire.getgrey1)),
                    child: TextField(
                      style:  TextStyle(color:  notifire.getblackcolor,),
                      decoration: InputDecoration(
                        hintText: 'Enter Email',
                        hintStyle: const TextStyle(
                            color: Color(0xffC6C8CB), fontSize: 15),
                        contentPadding:
                            const EdgeInsets.only(left: 20, right: 20),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                       child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Country',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'InterRegular',
                              color: Color(0xff727880)),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
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
                                    'Country',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'InterRegular',
                                      color:  notifire.getblackcolor,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            items: items
                                .map((String item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style:  TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color:  notifire.getblackcolor,
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
                              width: 200,
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
                                size: 25,color:  notifire.getblackcolor,
                              ),
                              iconSize: 14,
                              iconEnabledColor: Colors.black,
                              iconDisabledColor: Colors.grey,
                            ),
                            dropdownStyleData: DropdownStyleData(
                              maxHeight: 200,
                              width: 250,
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
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'City',
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'InterRegular',
                              color: Color(0xff727880),
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
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
                                    'City',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'InterRegular',
                                      color:  notifire.getblackcolor,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            items: items1
                                .map((String item1) => DropdownMenuItem<String>(
                                      value: item1,
                                      child: Text(
                                        item1,
                                        style:  TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: notifire.getblackcolor,
                                        ),
                                        overflow: TextOverflow.ellipsis,
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
                              width: 200,
                              padding: const EdgeInsets.only(left: 14, right: 14),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(
                                    color: notifire.getgrey1
                                ),
                    
                              ),
                              elevation: 0,
                            ),
                            iconStyleData:  IconStyleData(
                              icon: Icon(
                                Icons.keyboard_arrow_down_outlined,
                                size: 25,color:  notifire.getblackcolor,
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
                    'Zipcode',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'InterRegular',
                        color: Color(0xff727880)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 45,

                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all( color: notifire.getgrey1)),
                    child: TextField(
                      style:  TextStyle(color:  notifire.getblackcolor,),
                      decoration: InputDecoration(
                        hintText: 'Enter code',
                        hintStyle: const TextStyle(
                            color: Color(0xffC6C8CB), fontSize: 15),
                        contentPadding:
                        const EdgeInsets.only(left: 20, right: 20),
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
              const Text('Note',
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'InterRegular',
                      color: Color(0xff727880),
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.start),
              const SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all( color: notifire.getgrey1)),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 4,
                  style: TextStyle(color: notifire.getblackcolor),
                  decoration: const InputDecoration(
                    hintText: "Details",
                    hintStyle: TextStyle(color: Color(0xffC6C8CB)),
                    focusedBorder:
                        OutlineInputBorder(borderSide: BorderSide.none),
                    disabledBorder:
                        OutlineInputBorder(borderSide: BorderSide.none),
                    enabledBorder:
                        OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
          state: _stepState(0),
          isActive: _currentStep == 0,
        ),
        Step(
          title: Text('Store',
              style: TextStyle(
                  fontFamily: 'InterRegular',
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: _currentStep == 1
                      ?   notifire.getblackcolor
                      : const Color(0xff9DA2A7))),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Store Name',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'InterRegular',
                        color: Color(0xff727880)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all( color: notifire.getgrey1)),
                    child: TextField(
                      style:  TextStyle(color:  notifire.getblackcolor,),
                      decoration: InputDecoration(
                        hintText: 'Enter Store Name',
                        hintStyle: const TextStyle(
                            color: Color(0xffC6C8CB), fontSize: 15),
                        contentPadding:
                            const EdgeInsets.only(left: 20, right: 20),
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
                    'Last Name',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'InterRegular',
                        color: Color(0xff727880)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all( color: notifire.getgrey1)),
                    child: TextField(
                      style:  TextStyle(color:  notifire.getblackcolor,),
                      decoration: InputDecoration(
                        hintText: 'Enter Last Name',
                        hintStyle: const TextStyle(
                            color: Color(0xffC6C8CB), fontSize: 15),
                        contentPadding:
                            const EdgeInsets.only(left: 20, right: 20),
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
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Business Type',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'InterRegular',
                              color: Color(0xff727880)),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        DropdownButtonHideUnderline(
                          child: DropdownButton2<String>(
                            isExpanded: true,
                            hint:  const Row(
                              children: [
                                SizedBox(
                                  width: 4,
                                ),
                                Expanded(
                                  child: Text(
                                    'Business Type',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'InterRegular',
                                      color: Color(0xff727880),
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            items: items
                                .map((String item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style:  TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color:  notifire.getblackcolor,
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
                              padding:
                                  const EdgeInsets.only(left: 14, right: 14),
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
                                color: Color(0xff727880),
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
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              StatefulBuilder(builder: (context, setState) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Transform.translate(
                        offset: const Offset(-20, 0), child: switchButton()),

                    Transform.translate(
                        offset: const Offset(-20, 10),
                        child:  Text(
                          'Same contacts the owner',
                          style: TextStyle(
                            fontFamily: 'InterRegular',
                            fontSize: 14,
                            color:  notifire.getblackcolor,),
                        ))
                  ],
                );
              },
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Website',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'InterRegular',
                        color: Color(0xff727880)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all( color: notifire.getgrey1)),
                    child: TextField(
                      style:  TextStyle(color:  notifire.getblackcolor,),
                      decoration: InputDecoration(
                        hintText: 'https://',
                        hintStyle: const TextStyle(
                            color: Color(0xffC6C8CB), fontSize: 15),
                        contentPadding:
                            const EdgeInsets.only(left: 20, right: 20),
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
                    'Fax',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'InterRegular',
                        color: Color(0xff727880)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all( color: notifire.getgrey1)),
                    child: TextField(
                      style:  TextStyle(color:  notifire.getblackcolor,),
                      decoration: InputDecoration(
                        hintText: 'Enter Fax Number',
                        hintStyle: const TextStyle(
                            color: Color(0xffC6C8CB), fontSize: 15),
                        contentPadding:
                            const EdgeInsets.only(left: 20, right: 20),
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
                height: 20,
              ),
            ],
          ),
          state: _stepState(1),
          isActive: _currentStep == 1,
        ),
        Step(
          title:  Text('Payment',
              style: TextStyle(
                fontFamily: 'InterRegular',
                fontSize: 10,color:  notifire.getblackcolor,
                fontWeight: FontWeight.w600,
              )),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Bank Name',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'InterRegular',
                        color: Color(0xff727880)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all( color: notifire.getgrey1)),
                    child: TextField(
                      style:  TextStyle(color:  notifire.getblackcolor,),
                      decoration: InputDecoration(
                        hintText: 'Enter Bank Name',
                        hintStyle: const TextStyle(
                            color: Color(0xffC6C8CB), fontSize: 15),
                        contentPadding:
                            const EdgeInsets.only(left: 20, right: 20),
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
                    'Branch',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'InterRegular',
                        color: Color(0xff727880)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all( color: notifire.getgrey1)),
                    child: TextField(
                      style:  TextStyle(color:  notifire.getblackcolor,),
                      decoration: InputDecoration(
                        hintText: 'Enter Branch Name',
                        hintStyle: const TextStyle(
                            color: Color(0xffC6C8CB), fontSize: 15),
                        contentPadding:
                            const EdgeInsets.only(left: 20, right: 20),
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
                    'Account Holder Name',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'InterRegular',
                        color: Color(0xff727880)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all( color: notifire.getgrey1)),
                    child: TextField(
                      style:  TextStyle(color:  notifire.getblackcolor,),
                      decoration: InputDecoration(
                        hintText: 'Enter Holder Number',
                        hintStyle: const TextStyle(
                            color: Color(0xffC6C8CB), fontSize: 15),
                        contentPadding:
                            const EdgeInsets.only(left: 20, right: 20),
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
                    'Account Number',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'InterRegular',
                        color: Color(0xff727880)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all( color: notifire.getgrey1)),
                    child: TextField(
                      style:  TextStyle(color:  notifire.getblackcolor,),
                      decoration: InputDecoration(
                        hintText: 'Enter Account Number',
                        hintStyle: const TextStyle(
                            color: Color(0xffC6C8CB), fontSize: 15),
                        contentPadding:
                            const EdgeInsets.only(left: 20, right: 20),
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
                    'Fax',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'InterRegular',
                        color: Color(0xff727880)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all( color: notifire.getgrey1)),
                    child: TextField(
                      style:  TextStyle(color:  notifire.getblackcolor,),
                      decoration: InputDecoration(
                        hintText: 'Enter Fax Number',
                        hintStyle: const TextStyle(
                            color: Color(0xffC6C8CB), fontSize: 15),
                        contentPadding:
                            const EdgeInsets.only(left: 20, right: 20),
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
                height: 20,
              ),
            ],
          ),
          state: _stepState(2),
        )
      ];

  Widget firstContainer({context, constraints}) {
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
              Text('E-commerce',style: TextStyle(color: greyy,fontSize: 14,fontFamily: 'InterRegular'),),
              const SizedBox(width: 10,),
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: greyy,),),
              const SizedBox(width: 10,),
              Text('Sellers',style: TextStyle(color: notifire.getblackcolor,fontSize: 14,fontFamily: 'InterRegular'),),
            ],
          ),
          const SizedBox(height: 20,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  flex: 5,
                  child: container2(constraints)),
            ],
          ),
        ],
      ),
    );
  }


  Widget container2(constraints) {
    return constraints < 600
        ? SingleChildScrollView(
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
                    Text('E-commerce',style: TextStyle(color: greyy,fontSize: 14,fontFamily: 'InterRegular'),),
                    const SizedBox(width: 10,),
                    Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: greyy,),),
                    const SizedBox(width: 10,),
                    Text('Sellers',style: TextStyle(color: notifire.getblackcolor,fontSize: 14,fontFamily: 'InterRegular'),),
                  ],
                ),
                const SizedBox(height: 20,),
                DefaultTabController(
                  length: 2,
                  initialIndex: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Row(
          
                            children: [
          
                              const Spacer(),
          
          
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  padding: const EdgeInsets.all(11),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                    color: notifire.getbgcolor11,),
                                  child: Center(
                                      child: Image.asset(
                                    'assets/setting-5.png',
                                    scale: 4,
                                  )),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              PopupMenuButton(
                                tooltip: '',
                                offset: const Offset(10, 50),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                elevation: 1,
                                splashRadius: 1,
                                constraints: const BoxConstraints(
                                  maxWidth: 400,
                                  minWidth: 400,
                                ),
                                shadowColor: Colors.grey,
                                color: notifire.getbgcolor11,
                                itemBuilder: (context) =>
                                    <PopupMenuEntry<SampleItem>>[
                                  PopupMenuItem(
                                      height: 30,
                                      padding: EdgeInsets.zero,
                                      enabled: false,
                                      child: StatefulBuilder(
                                        builder: (context, setState) {
                                          return SingleChildScrollView(
                                            child: SizedBox(
                                              height: 500,
                                              child: Theme(
                                                data: ThemeData(
                                                    canvasColor: notifire.getbgcolor10),
                                                child: Stepper(
          
                                                  elevation: 0,
                                                  type: StepperType.horizontal,
                                                  controlsBuilder: (BuildContext
                                                          context,
                                                      ControlsDetails controls) {
                                                    return Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.end,
                                                      children: <Widget>[
                                                        if (_currentStep != 0)
                                                          Container(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(5),
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12),
                                                                border: Border.all(
                                                                    color: notifire.getgrey1)),
                                                            child: TextButton(
                                                              onPressed: controls
                                                                  .onStepCancel,
                                                              child: const Text(
                                                                'Back to Owner',
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        0xff727880),
                                                                    fontSize: 12,
                                                                    fontFamily:
                                                                        'InterRegular',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                            ),
                                                          ),
                                                        const Spacer(),
                                                        InkWell(
                                                          onTap: () {
                                                            Get.back();
                                                          },
                                                          child: Container(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(12),
                                                            decoration:
                                                                BoxDecoration(
                                                              border: Border.all(
                                                                  color: notifire.getgrey1),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(12),
                                                            ),
                                                            child: const Center(
                                                                child: Text(
                                                                    'Cancel',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        fontFamily:
                                                                            'InterRegular',
                                                                        color: Color(
                                                                            0xff727880)))),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                if (_currentStep <
                                                                    _steps().length -
                                                                        3) {
                                                                  _currentStep += 3;
                                                                } else if (_currentStep <
                                                                    _steps().length -
                                                                        1) {
                                                                  _currentStep += 1;
                                                                } else {
                                                                  _currentStep = 0;
                                                                }
                                                              });
                                                            },
                                                            child: Container(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(12),
                                                                decoration: BoxDecoration(
                                                                    color:
                                                                        const Color(
                                                                            0xff595FE5),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                12)),
                                                                child: const Text(
                                                                    'Next',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        fontFamily:
                                                                            'InterRegular',
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        color: Colors
                                                                            .white)))),
                                                      ],
                                                    );
                                                  },
                                                  onStepTapped: (step) => setState(
                                                      () => _currentStep = step),
                                                  onStepContinue: () {
                                                    setState(() {
                                                      if (_currentStep <
                                                          _steps().length - 1) {
                                                        _currentStep += 1;
                                                      } else {
                                                        _currentStep = 0;
                                                      }
                                                    });
                                                  },
                                                  onStepCancel: () {
                                                    setState(() {
                                                      if (_currentStep > 0) {
                                                        _currentStep -= 1;
                                                      } else {
                                                        _currentStep = 0;
                                                      }
                                                    });
                                                  },
                                                  currentStep: _currentStep,
                                                  steps: _steps(),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      )),
                                ],
                                child: Container(
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
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 40,
                                decoration: BoxDecoration(
                                    color: notifire.getbgcolor11,
                                    borderRadius: BorderRadius.circular(12)),
                                child: TabBar(
                                    labelColor: Colors.black,
                                    unselectedLabelColor: Colors.red,
                                    // indicatorColor: Color(0xffEEEEEE),
                                    indicator:  BoxDecoration(
                                        color: notifire.Tab,
                                        borderRadius: const BorderRadius.only(
                                            bottomRight: Radius.circular(12),
                                            topRight: Radius.circular(12),
                                            bottomLeft: Radius.circular(12),
                                            topLeft: Radius.circular(12))),
                                    isScrollable: true,
                                
                                    tabs: [
                                      Tab(
                                        child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                if (container == false) {
                                                  container = true;
                                                } else {
                                                  container = false;
                                                }
                                              });
                                            },
                                            child: Tab(
                                                child: SvgPicture.asset(
                                              'assets/row-vertical.svg',
                                              height: 12,color:  notifire.getblackcolor,
                                            ))),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            if (container == false) {
                                              container = true;
                                            } else {
                                              container = false;
                                            }
                                          });
                                        },
                                        child: Tab(
                                          child: Tab(
                                              child: SvgPicture.asset(
                                            'assets/element-3.svg',
                                            height: 12,color:  notifire.getblackcolor,
                                          )),
                                        ),
                                      )
                                    ]),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: Get.height * 1.15,
                        child: TabBarView(children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 725,
                                child: Container(
                                  padding: EdgeInsets.zero,
                                  decoration: BoxDecoration(
                                      color: notifire.getbgcolor11,
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: ListView(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      SizedBox(
                                        width: constraints < 1400 ? 1800 : Get.width,
                                        child: SingleChildScrollView(
                                          physics: const NeverScrollableScrollPhysics(),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  children: [
                                                    Table(
                                                      border: TableBorder(horizontalInside: BorderSide(color: notifire.Getblg2)),

                                                      children: [

                                                        TableRow(children: [
                                                          TableCell(
                                                            verticalAlignment:
                                                            TableCellVerticalAlignment
                                                                .middle,
                                                            child: StatefulBuilder(
                                                              builder: (BuildContext context,
                                                                  void Function(void Function()) setState) {
                                                                return Transform.scale(
                                                                  scale: 1.2,
                                                                  child: Checkbox(
                                                                      side: BorderSide(color: notifire.Getblg2),
                                                                      activeColor: const Color(0xff595FE5),
                                                                      shape: RoundedRectangleBorder(
                                                                        side: const BorderSide(color: Colors.black),
                                                                        borderRadius: BorderRadius.circular(5),
                                                                      ),
                                                                      value: isActive,
                                                                      onChanged: (val) {
                                                                        setState(() {
                                                                          isActive = val!;
                                                                        });
                                                                      }),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                          dataColumn1(
                                                              title: "Store Name",
                                                              iscenter: false),
                                                          dataColumn1(
                                                              title: "Owner Name",
                                                              iscenter: false),
                                                          dataColumn1(
                                                              title: "Create Date",
                                                              iscenter: true),
                                                          dataColumn1(
                                                              title: "Rating",
                                                              iscenter: true),
                                                          dataColumn1(
                                                              title: "Products",
                                                              iscenter: true),
                                                          dataColumn1(
                                                              title: "Wallet",
                                                              iscenter: true),
                                                          dataColumn1(
                                                              title: "Revenue",
                                                              iscenter: true),
                                                          dataColumn1(
                                                              title: "",
                                                              iscenter: true),
                                                        ]),
                                                        for (var a = invoiceController.loadmore; a < invoiceController.loadmore + invoiceController.selectindex; a++)
                                                          TableRow(
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsets.symmetric(
                                                                      vertical: 18,horizontal: 2),
                                                                  child: StatefulBuilder(
                                                                    builder: (BuildContext context,
                                                                        void Function(void Function()) setState) {
                                                                      return Transform.scale(
                                                                        scale: 1.2,
                                                                        child: Checkbox(
                                                                            side: BorderSide(color: notifire.Getblg2),
                                                                            activeColor: const Color(0xff595FE5),
                                                                            shape: RoundedRectangleBorder(
                                                                              side: const BorderSide(color: Colors.black),
                                                                              borderRadius: BorderRadius.circular(5),
                                                                            ),
                                                                            value: isActive,
                                                                            onChanged: (val) {
                                                                              setState(() {
                                                                                isActive = val!;
                                                                              });
                                                                            }),
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets.symmetric(
                                                                      vertical: 12),
                                                                  child:  ListTile(
                                                                    leading:  Image.asset(imageintable[a],   height: 40,),
                                                                    title: Text(proname[a],
                                                                        style: TextStyle(
                                                                          fontSize: 13,
                                                                          color: notifire.getblackcolor,
                                                                          fontFamily: 'InterRegular',
                                                                        )),

                                                                  ),

                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets.symmetric(
                                                                      vertical: 12),
                                                                  child:  ListTile(

                                                                    leading:  Image.asset(imageintable1[a],   height: 40,),
                                                                    title: Text(proname1[a],
                                                                        overflow: TextOverflow.ellipsis,
                                                                        style: TextStyle(
                                                                          fontSize: 13,
                                                                          color: notifire.getblackcolor,
                                                                          fontFamily: 'InterRegular',
                                                                        )),

                                                                  ),

                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets.symmetric(
                                                                      vertical: 30),
                                                                  child: Center(
                                                                    child: Text(stoek[a],
                                                                        style: TextStyle(color: notifire.getblackcolor,  fontFamily: 'InterRegular',
                                                                          fontSize: 13,)),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                    padding: const EdgeInsets.symmetric(
                                                                        vertical: 30),
                                                                    child: Row(
                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                      children: [
                                                                        SvgPicture.asset('assets/star.svg'),
                                                                        const SizedBox(
                                                                          width: 6,
                                                                        ),
                                                                        Text(
                                                                          ster1[a],
                                                                          style: TextStyle(
                                                                            fontFamily: 'InterRegular',
                                                                            fontSize: 13,
                                                                            color: notifire.getblackcolor,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    )
                                                                ),
                                                                Padding(
                                                                    padding: const EdgeInsets.symmetric(
                                                                        vertical: 30),
                                                                    child: Row(
                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                      children: [

                                                                        Text(
                                                                          Price[a],
                                                                          style: TextStyle(
                                                                            fontFamily: 'InterRegular',
                                                                            fontSize: 13,
                                                                            color: notifire.getblackcolor,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    )
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets.symmetric(
                                                                      vertical: 30),
                                                                  child: Center(
                                                                    child: Text(
                                                                      ster[a],
                                                                      style: TextStyle(
                                                                          fontFamily: 'InterRegular',

                                                                          color: notifire.getblackcolor,
                                                                          fontSize: 13),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets.symmetric(
                                                                      vertical: 30),
                                                                  child: Center(
                                                                    child: Text(
                                                                      Price1[a],
                                                                      style: TextStyle(
                                                                          fontFamily: 'InterRegular',
                                                                          fontWeight: FontWeight.w600,
                                                                          color: notifire.getblackcolor,
                                                                          fontSize: 13),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 25),
                                                                  child: Row(
                                                                    children: [
                                                                      Image.asset(
                                                                        'assets/more.png',
                                                                        height: 20,color: notifire.getblackcolor,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                )
                                                              ]),
                                                      ],
                                                    ),
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
                              ),
                              GetBuilder<InvoiceController> (
                                  builder: (invoiceController) {
                                    return Row(
                                      children: [
                                        Expanded(
                                            child: Padding(padding: const EdgeInsets.symmetric(horizontal:  15 ,vertical: 8),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [

                                                  const Spacer(),
                                                  Row(
                                                    children: [
                                                      InkWell(
                                                          onTap: () {
                                                            invoiceController.scrollController.animateTo(-40, duration: const Duration(milliseconds: 1000), curve: Curves.bounceOut);
                                                          },
                                                          child: Icon(Icons.chevron_left,color: Color(0xff738096).withOpacity(0.5),)
                                                      ),
                                                      SizedBox(
                                                        height: 37,
                                                        width: 140,
                                                        child: Center(
                                                          child: ListView.builder(
                                                            controller: invoiceController.scrollController,
                                                            scrollDirection: Axis.horizontal,
                                                            itemCount: 5,
                                                            shrinkWrap: true,
                                                            itemBuilder: (context, index) {
                                                              return InkWell(
                                                                onTap: () {
                                                                  setState(() {
                                                                    listtiletitle.shuffle();
                                                                  });
                                                                  invoiceController.setloadmore(invoiceController.selectpage);
                                                                  invoiceController.setpage(index);
                                                                },

                                                                child: Container(
                                                                    width: 37,
                                                                    margin: const EdgeInsets.symmetric(horizontal: 5),
                                                                    height: 50,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius: BorderRadius.circular(8),
                                                                        border: Border.all(color: invoiceController.selectpage == index? Colors.blue : Color(0xff738096).withOpacity(0.5)),
                                                                        color: Colors.transparent
                                                                    ),
                                                                    child: Center(child: Text("$index",style: TextStyle(color: invoiceController.selectpage == index? Colors.blue : notifire.getblackcolor),))),
                                                              );
                                                            },),
                                                        ),
                                                      ),
                                                      InkWell(
                                                          onTap: () {
                                                            invoiceController.scrollController.animateTo(10 * 100, duration: const Duration(milliseconds: 1000), curve: Curves.easeIn);
                                                          },
                                                          child: Icon(Icons.chevron_right,color: Color(0xff738096).withOpacity(0.5))
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            )),
                                      ],
                                    );
                                  }),
                            ],
                          ),
                              GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1,
                                  mainAxisExtent: Get.height / 1.5,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                ),
                                itemCount: model().sell.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {

                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: notifire.getbgcolor11,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(14),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 80,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(12)),
                                              child: Image.asset(
                                                model().seller[index],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              model().sell[index],
                                              style:  TextStyle(
                                                fontSize: 18,color:  notifire.getblackcolor,
                                                fontFamily: 'InterRegular',
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Image.asset(
                                              'assets/Rating.png',
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Text(
                                              'Created at 18 Nov 2004',
                                              style: TextStyle(
                                                  fontFamily: 'InterRegular',
                                                  fontSize: 12,
                                                  color: Color(0xff9DA2A7)),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Text(
                                              'Owner by Ananya Ishana',
                                              style: TextStyle(
                                                  fontFamily: 'InterRegular',
                                                  fontSize: 12,
                                                  color: Color(0xff9DA2A7)),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.all(12),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                      color:
                                                      notifire.getbgcolor10,
                                                    ),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          model().selll[index],
                                                          style:  TextStyle(
                                                              fontSize: 14,color:  notifire.getblackcolor,
                                                              fontFamily:
                                                                  'InterRegular',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        const Text(
                                                          'Products',
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  'InterRegular',
                                                              color: Color(
                                                                  0xff727880)),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
                                                Expanded(
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.all(12),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                      color:
                                                          notifire.getbgcolor10,
                                                    ),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          model().selll1[index],
                                                          style:  TextStyle(
                                                              fontSize: 14,color:  notifire.getblackcolor,
                                                              fontFamily:
                                                                  'InterRegular',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        const SizedBox(
                                                          height: 15,
                                                        ),
                                                        Row(
                                                          children: [
                                                            const Text(
                                                              'Revenue',
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  fontFamily:
                                                                      'InterRegular',
                                                                  color: Color(
                                                                      0xff727880)),
                                                            ),
                                                            const SizedBox(
                                                              width: 10,
                                                            ),
                                                            Text(
                                                              model().sellerss[
                                                                  index],
                                                              style: TextStyle(
                                                                color: model()
                                                                        .selcol[
                                                                    index],
                                                                fontFamily:
                                                                    'InterRegular',
                                                                fontSize: 12,
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Image.asset(model().chart[index]),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.all(12),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                12),
                                                       color: notifire.getbgcolor10,),
                                                    child: const Center(
                                                        child: Text('See Details',
                                                            style: TextStyle(
                                                                color: Color(
                                                                    0xff727880),
                                                                fontSize: 14,
                                                                fontFamily:
                                                                    'InterRegular',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600))),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(12),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                      color: notifire.getbgcolor10,),
                                                  child: Image.asset(
                                                      'assets/more.png',
                                                      height: 20),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ])),
          
                    ],
                  ),
                ),
              ],
            ),
        )
        : DefaultTabController(
            length: 2,
            initialIndex: 0,
            child: Column(
              children: [
                Row(
                  children: [

                    const Spacer(),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                          color: notifire.getbgcolor11,),
                        padding: const EdgeInsets.all(11),
                        child: Center(
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/export.png',
                                height: 16,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                'Export',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'InterRegular',
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff727880)),
                              )
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
                          color: notifire.getbgcolor11,),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Center(
                              child: Image.asset(
                            'assets/setting-5.png',color:  notifire.getblackcolor,
                            scale: 4,
                          )),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    PopupMenuButton(
                      tooltip: '',
                      offset: const Offset(10, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 1,
                      splashRadius: 1,
                      constraints: const BoxConstraints(
                        maxWidth: 400,
                        minWidth: 400,
                      ),
                      shadowColor: Colors.grey,
                      color: notifire.getbgcolor11,
                      itemBuilder: (context) => <PopupMenuEntry<SampleItem>>[
                        PopupMenuItem(
                            height: 30,
                            padding: EdgeInsets.zero,
                            enabled: false,
                            child: StatefulBuilder(
                              builder: (context, setState) {
                                return SingleChildScrollView(
                                  child: SizedBox(
                                    height: 500,
                                    child: Theme(
                                      data: ThemeData(
                                        primaryColor: const Color(0xffF5F5F5),

                                        canvasColor: notifire.getbgcolor10
                                      ),
                                      child: Stepper(
                                        elevation: 0,
                                        type: StepperType.horizontal,
                                        controlsBuilder: (BuildContext context,
                                            ControlsDetails controls) {
                                          return Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: <Widget>[
                                              if (_currentStep != 0)
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(7),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                      border: Border.all(
                                                          color: notifire.getgrey1)),
                                                  child: TextButton(
                                                    onPressed:
                                                        controls.onStepCancel,
                                                    child: const Text(
                                                      'Back to Owner',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xff727880),
                                                          fontSize: 12,
                                                          fontFamily:
                                                              'InterRegular',
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ),
                                                ),
                                              const Spacer(),
                                              InkWell(
                                                onTap: () {
                                                  Get.back();
                                                },
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(12),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: notifire.getgrey1),
                                                    borderRadius:
                                                        BorderRadius.circular(12),
                                                  ),
                                                  child: const Center(
                                                      child: Text('Cancel',
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight.w600,
                                                              fontFamily:
                                                                  'InterRegular',
                                                              color: Color(
                                                                  0xff727880)))),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      if (_currentStep <
                                                          _steps().length - 3) {
                                                        _currentStep += 3;
                                                      } else if (_currentStep <
                                                          _steps().length - 1) {
                                                        _currentStep += 1;
                                                      } else {
                                                        _currentStep = 0;
                                                      }
                                                    });
                                                  },
                                                  child: Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              12),
                                                      decoration: BoxDecoration(
                                                          color: const Color(
                                                              0xff595FE5),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12)),
                                                      child: const Text('Next',
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  'InterRegular',
                                                              fontWeight:
                                                                  FontWeight.w600,
                                                              color: Colors
                                                                  .white)))),
                                            ],
                                          );
                                        },
                                        onStepTapped: (step) =>
                                            setState(() => _currentStep = step),
                                        onStepContinue: () {
                                          setState(() {
                                            if (_currentStep <
                                                _steps().length - 1) {
                                              _currentStep += 1;
                                            } else {
                                              _currentStep = 0;
                                            }
                                          });
                                        },
                                        onStepCancel: () {
                                          setState(() {
                                            if (_currentStep > 0) {
                                              _currentStep -= 1;
                                            } else {
                                              _currentStep = 0;
                                            }
                                          });
                                        },
                                        currentStep: _currentStep,
                                        steps: _steps(),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            )),
                      ],
                      child: Container(
                        padding: const EdgeInsets.all(11),
                        decoration: BoxDecoration(
                            color: const Color(0xff595FE5),
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: Row(children: [
                            Image.asset('assets/add.png', scale: 4),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text('Add Seller',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'InterRegular',
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white))
                          ]),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                          color: notifire.getbgcolor11,
                          borderRadius: BorderRadius.circular(12)),
                      child: TabBar(
                          // indicatorColor: Color(0xffEEEEEE),
                          indicator:  BoxDecoration(
                              color: notifire.Tab,
                              borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                  bottomLeft: Radius.circular(12),
                                  topLeft: Radius.circular(12))),
                          isScrollable: true,
                          physics: const NeverScrollableScrollPhysics(),
                          labelColor: Colors.red,
                          tabs: [
                            Tab(
                              child: Tab(
                                  child: SvgPicture.asset(
                                'assets/row-vertical.svg',
                                height: 12,color:  notifire.getblackcolor,
                              )),
                            ),
                            Tab(
                              child: Tab(
                                  child: SvgPicture.asset(
                                'assets/element-3.svg',
                                height: 12,color:  notifire.getblackcolor,
                              )),
                            )
                          ]),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: Get.height * 1.11,
                  child: NestedScrollView(
                      headerSliverBuilder: (context, innerBoxIsScrolled) {
                        return [];
                      },
                      body: TabBarView(children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 750,
                              child: Container(
                                padding: EdgeInsets.zero,
                                decoration: BoxDecoration(
                                    color: notifire.getbgcolor11,
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: ListView(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    SizedBox(
                                      width: constraints < 1400 ? 1800 : Get.width,
                                      child: SingleChildScrollView(
                                        physics: const NeverScrollableScrollPhysics(),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                children: [
                                                  Table(
                                                    border: TableBorder(horizontalInside: BorderSide(color: notifire.Getblg2)),

                                                    children: [

                                                      TableRow(children: [
                                                        TableCell(
                                                          verticalAlignment:
                                                          TableCellVerticalAlignment
                                                              .middle,
                                                          child: StatefulBuilder(
                                                            builder: (BuildContext context,
                                                                void Function(void Function()) setState) {
                                                              return Transform.scale(
                                                                scale: 1.2,
                                                                child: Checkbox(
                                                                    side: BorderSide(color: notifire.Getblg2),
                                                                    activeColor: const Color(0xff595FE5),
                                                                    shape: RoundedRectangleBorder(
                                                                      side: const BorderSide(color: Colors.black),
                                                                      borderRadius: BorderRadius.circular(5),
                                                                    ),
                                                                    value: isActive,
                                                                    onChanged: (val) {
                                                                      setState(() {
                                                                        isActive = val!;
                                                                      });
                                                                    }),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                        dataColumn1(
                                                            title: "Store Name",
                                                            iscenter: false),
                                                        dataColumn1(
                                                            title: "Owner Name",
                                                            iscenter: false),
                                                        dataColumn1(
                                                            title: "Create Date",
                                                            iscenter: true),
                                                        dataColumn1(
                                                            title: "Rating",
                                                            iscenter: true),
                                                        dataColumn1(
                                                            title: "Products",
                                                            iscenter: true),
                                                        dataColumn1(
                                                            title: "Wallet",
                                                            iscenter: true),
                                                        dataColumn1(
                                                            title: "Revenue",
                                                            iscenter: true),
                                                        dataColumn1(
                                                            title: "",
                                                            iscenter: true),
                                                      ]),
                                                      for (var a = invoiceController.loadmore; a < invoiceController.loadmore + invoiceController.selectindex; a++)
                                                        TableRow(
                                                            children: [
                                                              Padding(
                                                                padding: const EdgeInsets.symmetric(
                                                                    vertical: 22,horizontal: 2),
                                                                child: StatefulBuilder(
                                                                  builder: (BuildContext context,
                                                                      void Function(void Function()) setState) {
                                                                    return Transform.scale(
                                                                      scale: 1.2,
                                                                      child: Checkbox(
                                                                          side: BorderSide(color: notifire.Getblg2),
                                                                          activeColor: const Color(0xff595FE5),
                                                                          shape: RoundedRectangleBorder(
                                                                            side: const BorderSide(color: Colors.black),
                                                                            borderRadius: BorderRadius.circular(5),
                                                                          ),
                                                                          value: isActive,
                                                                          onChanged: (val) {
                                                                            setState(() {
                                                                              isActive = val!;
                                                                            });
                                                                          }),
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsets.symmetric(
                                                                    vertical: 15),
                                                                child:  ListTile(
                                                                  leading:  Image.asset(imageintable[a],   height: 40,),
                                                                  title: Text(proname[a],
                                                                      style: TextStyle(
                                                                        fontSize: 13,
                                                                        color: notifire.getblackcolor,
                                                                        fontFamily: 'InterRegular',
                                                                      )),
                                                            
                                                                ),

                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsets.symmetric(
                                                                    vertical: 12),
                                                                child:  ListTile(

                                                                  leading:  Image.asset(imageintable1[a],   height: 40,),
                                                                  title: Text(proname1[a],
                                                                      overflow: TextOverflow.ellipsis,
                                                                      style: TextStyle(
                                                                        fontSize: 13,
                                                                        color: notifire.getblackcolor,
                                                                        fontFamily: 'InterRegular',
                                                                      )),
                                                              
                                                                ),

                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsets.symmetric(
                                                                    vertical: 25),
                                                                child: Center(
                                                                  child: Text(stoek[a],
                                                                      style: TextStyle(color: notifire.getblackcolor,  fontFamily: 'InterRegular',
                                                                        fontSize: 13,)),
                                                                ),
                                                              ),
                                                              Padding(
                                                                  padding: const EdgeInsets.symmetric(
                                                                      vertical: 25),
                                                                  child: Row(
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    children: [
                                                                      SvgPicture.asset('assets/star.svg'),
                                                                      const SizedBox(
                                                                        width: 6,
                                                                      ),
                                                                      Text(
                                                                        ster1[a],
                                                                        style: TextStyle(
                                                                          fontFamily: 'InterRegular',
                                                                          fontSize: 13,
                                                                          color: notifire.getblackcolor,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  )
                                                              ),
                                                              Padding(
                                                                  padding: const EdgeInsets.symmetric(
                                                                      vertical: 25),
                                                                  child: Row(
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    children: [

                                                                      Text(
                                                                        Price[a],
                                                                        style: TextStyle(
                                                                          fontFamily: 'InterRegular',
                                                                          fontSize: 13,
                                                                          color: notifire.getblackcolor,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  )
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsets.symmetric(
                                                                    vertical: 25),
                                                                child: Center(
                                                                  child: Text(
                                                                    ster[a],
                                                                    style: TextStyle(
                                                                        fontFamily: 'InterRegular',

                                                                        color: notifire.getblackcolor,
                                                                        fontSize: 13),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsets.symmetric(
                                                                    vertical: 25),
                                                                child: Center(
                                                                  child: Text(
                                                                    Price1[a],
                                                                    style: TextStyle(
                                                                        fontFamily: 'InterRegular',
                                                                        fontWeight: FontWeight.w600,
                                                                        color: notifire.getblackcolor,
                                                                        fontSize: 13),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 25),
                                                                child: Row(
                                                                  children: [
                                                                    Image.asset(
                                                                      'assets/more.png',
                                                                      height: 20,color: notifire.getblackcolor,
                                                                    ),
                                                                  ],
                                                                ),
                                                              )
                                                            ]),
                                                    ],
                                                  ),
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
                            ),
                            GetBuilder<InvoiceController> (
                                builder: (invoiceController) {
                                  return Row(
                                    children: [
                                      Expanded(
                                          child: Padding(padding: const EdgeInsets.symmetric(horizontal:  15 ,vertical: 8),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [

                                                const Spacer(),
                                                Row(
                                                  children: [
                                                    InkWell(
                                                        onTap: () {
                                                          invoiceController.scrollController.animateTo(-40, duration: const Duration(milliseconds: 1000), curve: Curves.bounceOut);
                                                        },
                                                        child: Icon(Icons.chevron_left,color: Color(0xff738096).withOpacity(0.5),)
                                                    ),
                                                    SizedBox(
                                                      height: 37,
                                                      width: 140,
                                                      child: Center(
                                                        child: ListView.builder(
                                                          controller: invoiceController.scrollController,
                                                          scrollDirection: Axis.horizontal,
                                                          itemCount: 5,
                                                          shrinkWrap: true,
                                                          itemBuilder: (context, index) {
                                                            return InkWell(
                                                              onTap: () {
                                                                setState(() {
                                                                  listtiletitle.shuffle();
                                                                });
                                                                invoiceController.setloadmore(invoiceController.selectpage);
                                                                invoiceController.setpage(index);
                                                              },

                                                              child: Container(
                                                                  width: 37,
                                                                  margin: const EdgeInsets.symmetric(horizontal: 5),
                                                                  height: 50,
                                                                  decoration: BoxDecoration(
                                                                      borderRadius: BorderRadius.circular(8),
                                                                      border: Border.all(color: invoiceController.selectpage == index? Colors.blue : Color(0xff738096).withOpacity(0.5)),
                                                                      color: Colors.transparent
                                                                  ),
                                                                  child: Center(child: Text("$index",style: TextStyle(color: invoiceController.selectpage == index? Colors.blue : notifire.getblackcolor),))),
                                                            );
                                                          },),
                                                      ),
                                                    ),
                                                    InkWell(
                                                        onTap: () {
                                                          invoiceController.scrollController.animateTo(10 * 100, duration: const Duration(milliseconds: 1000), curve: Curves.easeIn);
                                                        },
                                                        child: Icon(Icons.chevron_right,color: Color(0xff738096).withOpacity(0.5))
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )),
                                    ],
                                  );
                                }),
                          ],
                        ),
                        GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: constraints < 1200 ? 3 : 4,
                            mainAxisExtent: Get.height / 1.53,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                          ),
                          itemCount: model().sell.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: notifire.getbgcolor11,

                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(14),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 80,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        child: Image.asset(
                                          model().seller[index],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        model().sell[index],
                                        style:  TextStyle(
                                          fontSize: 18,color:  notifire.getblackcolor,
                                          fontFamily: 'InterRegular',
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Image.asset(
                                        'assets/Rating.png',
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      const Text(
                                        'Created at 18 Nov 2004',
                                        style: TextStyle(
                                            fontFamily: 'InterRegular',
                                            fontSize: 12,
                                            color: Color(0xff9DA2A7)),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        'Owner by Ananya Ishana',
                                        style: TextStyle(
                                            fontFamily: 'InterRegular',
                                            fontSize: 12,
                                            color: Color(0xff9DA2A7)),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              padding: const EdgeInsets.all(12),
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
                                                  Text(
                                                    model().selll[index],
                                                    style:  TextStyle(
                                                        fontSize: 14,color:  notifire.getblackcolor,
                                                        fontFamily:
                                                            'InterRegular',
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  const SizedBox(
                                                    height: 15,
                                                  ),
                                                   const Text(
                                                    'Products',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontFamily:
                                                            'InterRegular',
                                                        color:
                                                            Color(0xff727880)),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Expanded(
                                            child: Container(
                                              padding: const EdgeInsets.all(12),
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
                                                  Text(
                                                    model().selll1[index],
                                                    style:  TextStyle(
                                                        fontSize: 14,
                                                        fontFamily:
                                                            'InterRegular',color:  notifire.getblackcolor,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  const SizedBox(
                                                    height: 15,
                                                  ),
                                                  Row(
                                                    children: [
                                                      const Text(
                                                        'Revenue',
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontFamily:
                                                                'InterRegular',
                                                            color: Color(
                                                                0xff727880)),
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        model().sellerss[index],
                                                        style: TextStyle(
                                                          color: model()
                                                              .selcol[index],
                                                          fontFamily:
                                                              'InterRegular',
                                                          fontSize: 12,
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Image.asset(model().chart[index],),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              padding: const EdgeInsets.all(12),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  border: Border.all(
                                                      color: const Color(
                                                          0xffEEEEEE))),
                                              child: const Center(
                                                  child: Text('See Details',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xff727880),
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'InterRegular',
                                                          fontWeight: FontWeight
                                                              .w600))),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            padding: const EdgeInsets.all(12),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                border: Border.all(
                                                    color: const Color(
                                                        0xffEEEEEE))),
                                            child: Image.asset(
                                                'assets/more.png',
                                                height: 20),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ])),
                )
              ],
            ),
          );
  }
  Widget dataColumn1({required String title, required bool iscenter}) {
    return Row(
      mainAxisAlignment:
      iscenter ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        const SizedBox(width: 8,),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Text(title,
              style: TextStyle(color: notifire.getblackcolor,fontFamily: 'InterRegular',fontSize: 14)),
        ),
        const SizedBox(
          width: 10,
        ),

      ],
    );
  }
  Widget switchButton() {
    return StatefulBuilder(builder: (context, setState) {
      return Transform.scale(
        scale: 0.6,
        child: CupertinoSwitch(
          trackColor: const Color(0xffE0E0E0),
          activeColor: const Color(0xff7B2BFF),
          thumbColor: Colors.white,
          value: switc ? true : false,
          onChanged: (bool value) {
            setState(() {
              if (switc == false) {
                switc = true;
              } else {
                switc = false;
              }
            });
          },
        ),
      );
    },);

  }
}

class MyData extends DataTableSource {
  bool isActive = false;

  final List<Map<String, dynamic>> _data = List.generate(
      30,
      (index) => {
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
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return Transform.scale(
                    scale: 1.2,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side: const BorderSide(style: BorderStyle.none),
                          visualDensity: const VisualDensity(horizontal: -4),
                          activeColor: const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          value: isActive,
                          onChanged: (val) {
                            setState(() {
                              isActive = val!;
                            });
                          }),
                    ),
                  );
                },
              ),
            ),
            DataCell(Row(
              children: [
                Container(
                  height: 40,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Image.asset('assets/Brand Logo11.png'),
                      const SizedBox(
                        width: 10,
                      ),
                       const Text(
                        'Whiteheads Store',
                        style: TextStyle(
                          fontSize: 14, color: Color(0xff9DA2A7),
                          fontFamily: 'InterRegular',
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
            const DataCell(Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/artist.png'),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Ananya Ishana',
                  style: TextStyle(
                    fontSize: 14, color: Color(0xff9DA2A7),
                    fontFamily: 'InterRegular',
                  ),
                )
              ],
            )),
            const DataCell(Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('21 Sep 2022',
                        style: TextStyle(
                          fontSize: 14, color: Color(0xff9DA2A7),
                          fontFamily: 'InterRegular',
                        )),
                  ],
                )
              ],
            )),
            DataCell(Row(
              children: [
                SvgPicture.asset('assets/star.svg'),
                const SizedBox(
                  width: 6,
                ),
                const Text(
                  '5',
                  style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
                ),
              ],
            )),
            const DataCell(Text(
              '596',
              style: TextStyle( color: Color(0xff9DA2A7),fontFamily:  'InterRegular', fontSize: 14),
            )),
            const DataCell(Row(
              children: [
                Text(
                  '\$544.67',
                  style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
                ),
              ],
            )),
            const DataCell(
              Text(
                '\$789.67',
                style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
              ),
            ),
            DataCell(Row(
              children: [
                Image.asset(
                  'assets/more.png',
                  height: 16,
                ),
              ],
            )),
          ],
        );
      case 1:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return Transform.scale(
                    scale: 1.2,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side: const BorderSide(style: BorderStyle.none),
                          visualDensity: const VisualDensity(horizontal: -4),
                          activeColor: const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          value: isActive,
                          onChanged: (val) {
                            setState(() {
                              isActive = val!;
                            });
                          }),
                    ),
                  );
                },
              ),
            ),
            DataCell(Row(
              children: [
                Container(
                  height: 40,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Image.asset('assets/Brand Logo21.png'),
                      const SizedBox(
                        width: 10,
                      ),
                       const Text(
                        'Dark circles Store',
                        style: TextStyle(
                          fontSize: 14, color: Color(0xff9DA2A7),
                          fontFamily: 'InterRegular',
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
            const DataCell(Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/avatar-6 1.png'),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Mahavir Agrawal',
                  style: TextStyle(
                    fontSize: 14, color: Color(0xff9DA2A7),
                    fontFamily: 'InterRegular',
                  ),
                )
              ],
            )),
            const DataCell(Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('12 Sep 2022',
                        style: TextStyle(
                          fontSize: 14, color: Color(0xff9DA2A7),
                          fontFamily: 'InterRegular',
                        )),
                  ],
                )
              ],
            )),
            DataCell(Row(
              children: [
                SvgPicture.asset('assets/star.svg'),
                const SizedBox(
                  width: 6,
                ),
                const Text(
                  '3.5',
                  style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
                ),
              ],
            )),
            const DataCell(Text(
              '345',
              style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
            )),
            const DataCell(Row(
              children: [
                Text(
                  '\$145.48',
                  style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
                ),
              ],
            )),
            const DataCell(
              Text(
                '\$456.43',
                style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
              ),
            ),
            DataCell(Row(
              children: [
                Image.asset(
                  'assets/more.png',
                  height: 16,
                ),
              ],
            )),
          ],
        );
      case 2:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return Transform.scale(
                    scale: 1.2,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side: const BorderSide(style: BorderStyle.none),
                          visualDensity: const VisualDensity(horizontal: -4),
                          activeColor: const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          value: isActive,
                          onChanged: (val) {
                            setState(() {
                              isActive = val!;
                            });
                          }),
                    ),
                  );
                },
              ),
            ),
            DataCell(Row(
              children: [
                Container(
                  height: 40,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Image.asset('assets/Brand Logo22.png'),
                      const SizedBox(
                        width: 10,
                      ),
                       const Text(
                        'circles Store',
                        style: TextStyle(
                          fontSize: 14, color: Color(0xff9DA2A7),
                          fontFamily: 'InterRegular',
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
            const DataCell(Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/avatar-7 1.png'),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Agrawal Mahavir',
                  style: TextStyle(
                    fontSize: 14, color: Color(0xff9DA2A7),
                    fontFamily: 'InterRegular',
                  ),
                )
              ],
            )),
            const DataCell(Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('11 Nov 2022',
                        style: TextStyle(
                          fontSize: 14, color: Color(0xff9DA2A7),
                          fontFamily: 'InterRegular',
                        )),
                  ],
                )
              ],
            )),
            DataCell(Row(
              children: [
                SvgPicture.asset('assets/star.svg'),
                const SizedBox(
                  width: 6,
                ),
                const Text(
                  '4.5',
                  style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
                ),
              ],
            )),
            const DataCell(Text(
              '876',
              style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
            )),
            const DataCell(Row(
              children: [
                Text(
                  '\$908.48',
                  style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
                ),
              ],
            )),
            const DataCell(
              Text(
                '\$277.43',
                style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
              ),
            ),
            DataCell(Row(
              children: [
                Image.asset(
                  'assets/more.png',
                  height: 16,
                ),
              ],
            )),
          ],
        );
      case 3:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return Transform.scale(
                    scale: 1.2,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side: const BorderSide(style: BorderStyle.none),
                          visualDensity: const VisualDensity(horizontal: -4),
                          activeColor: const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          value: isActive,
                          onChanged: (val) {
                            setState(() {
                              isActive = val!;
                            });
                          }),
                    ),
                  );
                },
              ),
            ),
            DataCell(Row(
              children: [
                Container(
                  height: 40,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Image.asset('assets/Team 1.png'),
                      const SizedBox(
                        width: 10,
                      ),
                       const Text(
                        'Oiliness Strore',
                        style: TextStyle(
                          fontSize: 14, color: Color(0xff9DA2A7),
                          fontFamily: 'InterRegular',
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
            const DataCell(Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/avatar-8 1.png'),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Akshay Kumar',
                  style: TextStyle(
                    fontSize: 14, color: Color(0xff9DA2A7),
                    fontFamily: 'InterRegular',
                  ),
                )
              ],
            )),
            const DataCell(Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('25 Oct 2022',
                        style: TextStyle(
                          fontSize: 14, color: Color(0xff9DA2A7),
                          fontFamily: 'InterRegular',
                        )),
                  ],
                )
              ],
            )),
            DataCell(Row(
              children: [
                SvgPicture.asset('assets/star.svg'),
                const SizedBox(
                  width: 6,
                ),
                const Text(
                  '2.5',
                  style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
                ),
              ],
            )),
            const DataCell(Text(
              '500',
              style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
            )),
            const DataCell(Row(
              children: [
                Text(
                  '\$96.48',
                  style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
                ),
              ],
            )),
            const DataCell(
              Text(
                '\$455.43',
                style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
              ),
            ),
            DataCell(Row(
              children: [
                Image.asset(
                  'assets/more.png',
                  height: 16,
                ),
              ],
            )),
          ],
        );
      case 4:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return Transform.scale(
                    scale: 1.2,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side: const BorderSide(style: BorderStyle.none),
                          visualDensity: const VisualDensity(horizontal: -4),
                          activeColor: const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          value: isActive,
                          onChanged: (val) {
                            setState(() {
                              isActive = val!;
                            });
                          }),
                    ),
                  );
                },
              ),
            ),
            DataCell(Row(
              children: [
                Container(
                  height: 40,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Image.asset('assets/Store Avatar.png'),
                      const SizedBox(
                        width: 10,
                      ),
                       const Text(
                        'Sharma Strore',
                        style: TextStyle(
                          fontSize: 14, color: Color(0xff9DA2A7),
                          fontFamily: 'InterRegular',
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
            const DataCell(Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/download 1.png'),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Kavya Sharma',
                  style: TextStyle(
                    fontSize: 14, color: Color(0xff9DA2A7),
                    fontFamily: 'InterRegular',
                  ),
                )
              ],
            )),
            const DataCell(Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('22 Oct 2022',
                        style: TextStyle(
                          fontSize: 14, color: Color(0xff9DA2A7),
                          fontFamily: 'InterRegular',
                        )),
                  ],
                )
              ],
            )),
            DataCell(Row(
              children: [
                SvgPicture.asset('assets/star.svg'),
                const SizedBox(
                  width: 6,
                ),
                const Text(
                  '1.5',
                  style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
                ),
              ],
            )),
            const DataCell(Text(
              '677',
              style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
            )),
            const DataCell(Row(
              children: [
                Text(
                  '\$796.48',
                  style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
                ),
              ],
            )),
            const DataCell(
              Text(
                '\$585.88',
                style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
              ),
            ),
            DataCell(Row(
              children: [
                Image.asset(
                  'assets/more.png',
                  height: 16,
                ),
              ],
            )),
          ],
        );
      case 5:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return Transform.scale(
                    scale: 1.2,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side: const BorderSide(style: BorderStyle.none),
                          visualDensity: const VisualDensity(horizontal: -4),
                          activeColor: const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          value: isActive,
                          onChanged: (val) {
                            setState(() {
                              isActive = val!;
                            });
                          }),
                    ),
                  );
                },
              ),
            ),
            DataCell(Row(
              children: [
                Container(
                  height: 40,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Image.asset('assets/Store Avatar(1).png'),
                      const SizedBox(
                        width: 10,
                      ),
                       const Text(
                        'Ishana Strore',
                        style: TextStyle(
                          fontSize: 14, color: Color(0xff9DA2A7),
                          fontFamily: 'InterRegular',
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
            const DataCell(Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/avatar-1-51c6502a 1.png'),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Kumar Ishana',
                  style: TextStyle(
                    fontSize: 14, color: Color(0xff9DA2A7),
                    fontFamily: 'InterRegular',
                  ),
                )
              ],
            )),
            const DataCell(Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('25 Oct 2022',
                        style: TextStyle(
                          fontSize: 14, color: Color(0xff9DA2A7),
                          fontFamily: 'InterRegular',
                        )),
                  ],
                )
              ],
            )),
            DataCell(Row(
              children: [
                SvgPicture.asset('assets/star.svg'),
                const SizedBox(
                  width: 6,
                ),
                const Text(
                  '2.5',
                  style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
                ),
              ],
            )),
            const DataCell(Text(
              '500',
              style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
            )),
            const DataCell(Row(
              children: [
                Text(
                  '\$205.48',
                  style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
                ),
              ],
            )),
            const DataCell(
              Text(
                '\$350.43',
                style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
              ),
            ),
            DataCell(Row(
              children: [
                Image.asset(
                  'assets/more.png',
                  height: 16,
                ),
              ],
            )),
          ],
        );
      case 6:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return Transform.scale(
                    scale: 1.2,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side: const BorderSide(style: BorderStyle.none),
                          visualDensity: const VisualDensity(horizontal: -4),
                          activeColor: const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          value: isActive,
                          onChanged: (val) {
                            setState(() {
                              isActive = val!;
                            });
                          }),
                    ),
                  );
                },
              ),
            ),
            DataCell(Row(
              children: [
                Container(
                  height: 40,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Image.asset('assets/Brand Logo21.png'),
                      const SizedBox(
                        width: 10,
                      ),
                       const Text(
                        'Dark circles Store',
                        style: TextStyle(
                          fontSize: 14, color: Color(0xff9DA2A7),
                          fontFamily: 'InterRegular',
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
            const DataCell(Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/avatar-6 1.png'),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Mahavir Agrawal',
                  style: TextStyle(
                    fontSize: 14, color: Color(0xff9DA2A7),
                    fontFamily: 'InterRegular',
                  ),
                )
              ],
            )),
            const DataCell(Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('12 Sep 2022',
                        style: TextStyle(
                          fontSize: 14, color: Color(0xff9DA2A7),
                          fontFamily: 'InterRegular',
                        )),
                  ],
                )
              ],
            )),
            DataCell(Row(
              children: [
                SvgPicture.asset('assets/star.svg'),
                const SizedBox(
                  width: 6,
                ),
                const Text(
                  '3.5',
                  style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
                ),
              ],
            )),
            const DataCell(Text(
              '345',
              style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
            )),
            const DataCell(Row(
              children: [
                Text(
                  '\$145.48',
                  style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
                ),
              ],
            )),
            const DataCell(
              Text(
                '\$456.43',
                style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
              ),
            ),
            DataCell(Row(
              children: [
                Image.asset(
                  'assets/more.png',
                  height: 16,
                ),
              ],
            )),
          ],
        );
      case 7:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return Transform.scale(
                    scale: 1.2,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side: const BorderSide(style: BorderStyle.none),
                          visualDensity: const VisualDensity(horizontal: -4),
                          activeColor: const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          value: isActive,
                          onChanged: (val) {
                            setState(() {
                              isActive = val!;
                            });
                          }),
                    ),
                  );
                },
              ),
            ),
            DataCell(Row(
              children: [
                Container(
                  height: 40,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Image.asset('assets/Brand Logo22.png'),
                      const SizedBox(
                        width: 10,
                      ),
                       const Text(
                        'circles Store',
                        style: TextStyle(
                          fontSize: 14, color: Color(0xff9DA2A7),
                          fontFamily: 'InterRegular',
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
            const DataCell(Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/avatar-7 1.png'),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Agrawal Mahavir',
                  style: TextStyle(
                    fontSize: 14, color: Color(0xff9DA2A7),
                    fontFamily: 'InterRegular',
                  ),
                )
              ],
            )),
            const DataCell(Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('11 Nov 2022',
                        style: TextStyle(
                          fontSize: 14, color: Color(0xff9DA2A7),
                          fontFamily: 'InterRegular',
                        )),
                  ],
                )
              ],
            )),
            DataCell(Row(
              children: [
                SvgPicture.asset('assets/star.svg'),
                const SizedBox(
                  width: 6,
                ),
                const Text(
                  '4.5',
                  style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
                ),
              ],
            )),
            const DataCell(Text(
              '876',
              style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
            )),
            const DataCell(Row(
              children: [
                Text(
                  '\$908.48',
                  style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
                ),
              ],
            )),
            const DataCell(
              Text(
                '\$277.43',
                style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
              ),
            ),
            DataCell(Row(
              children: [
                Image.asset(
                  'assets/more.png',
                  height: 16,
                ),
              ],
            )),
          ],
        );
      case 8:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return Transform.scale(
                    scale: 1.2,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side: const BorderSide(style: BorderStyle.none),
                          visualDensity: const VisualDensity(horizontal: -4),
                          activeColor: const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          value: isActive,
                          onChanged: (val) {
                            setState(() {
                              isActive = val!;
                            });
                          }),
                    ),
                  );
                },
              ),
            ),
            DataCell(Row(
              children: [
                Container(
                  height: 40,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Image.asset('assets/Team 1.png'),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Oiliness Strore',
                        style: TextStyle(
                          fontSize: 14, color: Color(0xff9DA2A7),
                          fontFamily: 'InterRegular',
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
            const DataCell(Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/avatar-8 1.png'),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Akshay Kumar',
                  style: TextStyle(
                    fontSize: 14, color: Color(0xff9DA2A7),
                    fontFamily: 'InterRegular',
                  ),
                )
              ],
            )),
            const DataCell(Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('25 Oct 2022',
                        style: TextStyle(
                          fontSize: 14, color: Color(0xff9DA2A7),
                          fontFamily: 'InterRegular',
                        )),
                  ],
                )
              ],
            )),
            DataCell(Row(
              children: [
                SvgPicture.asset('assets/star.svg'),
                const SizedBox(
                  width: 6,
                ),
                const Text(
                  '2.5',
                  style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
                ),
              ],
            )),
            const DataCell(Text(
              '500',
              style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
            )),
            const DataCell(Row(
              children: [
                Text(
                  '\$96.48',
                  style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
                ),
              ],
            )),
            const DataCell(
              Text(
                '\$455.43',
                style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
              ),
            ),
            DataCell(Row(
              children: [
                Image.asset(
                  'assets/more.png',
                  height: 16,
                ),
              ],
            )),
          ],
        );
      case 9:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return Transform.scale(
                    scale: 1.2,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side: const BorderSide(style: BorderStyle.none),
                          visualDensity: const VisualDensity(horizontal: -4),
                          activeColor: const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          value: isActive,
                          onChanged: (val) {
                            setState(() {
                              isActive = val!;
                            });
                          }),
                    ),
                  );
                },
              ),
            ),
            DataCell(Row(
              children: [
                Container(
                  height: 40,
                  decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Image.asset('assets/Brand Logo11.png'),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Whiteheads Store',
                        style: TextStyle(
                          fontSize: 14, color: Color(0xff9DA2A7),
                          fontFamily: 'InterRegular',
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
            const DataCell(Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/artist.png'),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Ananya Ishana',
                  style: TextStyle(
                    fontSize: 14, color: Color(0xff9DA2A7),
                    fontFamily: 'InterRegular',
                  ),
                )
              ],
            )),
            const DataCell(Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('21 Sep 2022',
                        style: TextStyle(
                          fontSize: 14, color: Color(0xff9DA2A7),
                          fontFamily: 'InterRegular',
                        )),
                  ],
                )
              ],
            )),
            DataCell(Row(
              children: [
                SvgPicture.asset('assets/star.svg'),
                const SizedBox(
                  width: 6,
                ),
                const Text(
                  '5',
                  style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
                ),
              ],
            )),
            const DataCell(Text(
              '596',
              style: TextStyle( color: Color(0xff9DA2A7),fontFamily:  'InterRegular', fontSize: 14),
            )),
            const DataCell(Row(
              children: [
                Text(
                  '\$544.67',
                  style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
                ),
              ],
            )),
            const DataCell(
              Text(
                '\$789.67',
                style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
              ),
            ),
            DataCell(Row(
              children: [
                Image.asset(
                  'assets/more.png',
                  height: 16,
                ),
              ],
            )),
          ],
        );
      case 10:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return Transform.scale(
                    scale: 1.2,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side: const BorderSide(style: BorderStyle.none),
                          visualDensity: const VisualDensity(horizontal: -4),
                          activeColor: const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          value: isActive,
                          onChanged: (val) {
                            setState(() {
                              isActive = val!;
                            });
                          }),
                    ),
                  );
                },
              ),
            ),
            DataCell(Row(
              children: [
                Container(
                  height: 40,
                  decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Image.asset('assets/Brand Logo21.png'),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Dark circles Store',
                        style: TextStyle(
                          fontSize: 14, color: Color(0xff9DA2A7),
                          fontFamily: 'InterRegular',
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
            const DataCell(Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/avatar-6 1.png'),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Mahavir Agrawal',
                  style: TextStyle(
                    fontSize: 14, color: Color(0xff9DA2A7),
                    fontFamily: 'InterRegular',
                  ),
                )
              ],
            )),
            const DataCell(Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('12 Sep 2022',
                        style: TextStyle(
                          fontSize: 14, color: Color(0xff9DA2A7),
                          fontFamily: 'InterRegular',
                        )),
                  ],
                )
              ],
            )),
            DataCell(Row(
              children: [
                SvgPicture.asset('assets/star.svg'),
                const SizedBox(
                  width: 6,
                ),
                const Text(
                  '3.5',
                  style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
                ),
              ],
            )),
            const DataCell(Text(
              '345',
              style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
            )),
            const DataCell(Row(
              children: [
                Text(
                  '\$145.48',
                  style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
                ),
              ],
            )),
            const DataCell(
              Text(
                '\$456.43',
                style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
              ),
            ),
            DataCell(Row(
              children: [
                Image.asset(
                  'assets/more.png',
                  height: 16,
                ),
              ],
            )),
          ],
        );
      case 11:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return Transform.scale(
                    scale: 1.2,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side: const BorderSide(style: BorderStyle.none),
                          visualDensity: const VisualDensity(horizontal: -4),
                          activeColor: const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          value: isActive,
                          onChanged: (val) {
                            setState(() {
                              isActive = val!;
                            });
                          }),
                    ),
                  );
                },
              ),
            ),
            DataCell(Row(
              children: [
                Container(
                  height: 40,
                  decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Image.asset('assets/Brand Logo22.png'),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'circles Store',
                        style: TextStyle(
                          fontSize: 14, color: Color(0xff9DA2A7),
                          fontFamily: 'InterRegular',
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
            const DataCell(Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/avatar-7 1.png'),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Agrawal Mahavir',
                  style: TextStyle(
                    fontSize: 14, color: Color(0xff9DA2A7),
                    fontFamily: 'InterRegular',
                  ),
                )
              ],
            )),
            const DataCell(Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('11 Nov 2022',
                        style: TextStyle(
                          fontSize: 14, color: Color(0xff9DA2A7),
                          fontFamily: 'InterRegular',
                        )),
                  ],
                )
              ],
            )),
            DataCell(Row(
              children: [
                SvgPicture.asset('assets/star.svg'),
                const SizedBox(
                  width: 6,
                ),
                const Text(
                  '4.5',
                  style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
                ),
              ],
            )),
            const DataCell(Text(
              '876',
              style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
            )),
            const DataCell(Row(
              children: [
                Text(
                  '\$908.48',
                  style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
                ),
              ],
            )),
            const DataCell(
              Text(
                '\$277.43',
                style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
              ),
            ),
            DataCell(Row(
              children: [
                Image.asset(
                  'assets/more.png',
                  height: 16,
                ),
              ],
            )),
          ],
        );
      case 12:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return Transform.scale(
                    scale: 1.2,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side: const BorderSide(style: BorderStyle.none),
                          visualDensity: const VisualDensity(horizontal: -4),
                          activeColor: const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          value: isActive,
                          onChanged: (val) {
                            setState(() {
                              isActive = val!;
                            });
                          }),
                    ),
                  );
                },
              ),
            ),
            DataCell(Row(
              children: [
                Container(
                  height: 40,
                  decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Image.asset('assets/Team 1.png'),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Oiliness Strore',
                        style: TextStyle(
                          fontSize: 14, color: Color(0xff9DA2A7),
                          fontFamily: 'InterRegular',
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
            const DataCell(Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/avatar-8 1.png'),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Akshay Kumar',
                  style: TextStyle(
                    fontSize: 14, color: Color(0xff9DA2A7),
                    fontFamily: 'InterRegular',
                  ),
                )
              ],
            )),
            const DataCell(Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('25 Oct 2022',
                        style: TextStyle(
                          fontSize: 14, color: Color(0xff9DA2A7),
                          fontFamily: 'InterRegular',
                        )),
                  ],
                )
              ],
            )),
            DataCell(Row(
              children: [
                SvgPicture.asset('assets/star.svg'),
                const SizedBox(
                  width: 6,
                ),
                const Text(
                  '2.5',
                  style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
                ),
              ],
            )),
            const DataCell(Text(
              '500',
              style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
            )),
            const DataCell(Row(
              children: [
                Text(
                  '\$96.48',
                  style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
                ),
              ],
            )),
            const DataCell(
              Text(
                '\$455.43',
                style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
              ),
            ),
            DataCell(Row(
              children: [
                Image.asset(
                  'assets/more.png',
                  height: 16,
                ),
              ],
            )),
          ],
        );
      case 13:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return Transform.scale(
                    scale: 1.2,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side: const BorderSide(style: BorderStyle.none),
                          visualDensity: const VisualDensity(horizontal: -4),
                          activeColor: const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          value: isActive,
                          onChanged: (val) {
                            setState(() {
                              isActive = val!;
                            });
                          }),
                    ),
                  );
                },
              ),
            ),
            DataCell(Row(
              children: [
                Container(
                  height: 40,
                  decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Image.asset('assets/Store Avatar.png'),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Sharma Strore',
                        style: TextStyle(
                          fontSize: 14, color: Color(0xff9DA2A7),
                          fontFamily: 'InterRegular',
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
            const DataCell(Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/download 1.png'),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Kavya Sharma',
                  style: TextStyle(
                    fontSize: 14, color: Color(0xff9DA2A7),
                    fontFamily: 'InterRegular',
                  ),
                )
              ],
            )),
            const DataCell(Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('22 Oct 2022',
                        style: TextStyle(
                          fontSize: 14, color: Color(0xff9DA2A7),
                          fontFamily: 'InterRegular',
                        )),
                  ],
                )
              ],
            )),
            DataCell(Row(
              children: [
                SvgPicture.asset('assets/star.svg'),
                const SizedBox(
                  width: 6,
                ),
                const Text(
                  '1.5',
                  style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
                ),
              ],
            )),
            const DataCell(Text(
              '677',
              style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
            )),
            const DataCell(Row(
              children: [
                Text(
                  '\$796.48',
                  style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
                ),
              ],
            )),
            const DataCell(
              Text(
                '\$585.88',
                style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
              ),
            ),
            DataCell(Row(
              children: [
                Image.asset(
                  'assets/more.png',
                  height: 16,
                ),
              ],
            )),
          ],
        );
      case 14:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return Transform.scale(
                    scale: 1.2,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side: const BorderSide(style: BorderStyle.none),
                          visualDensity: const VisualDensity(horizontal: -4),
                          activeColor: const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          value: isActive,
                          onChanged: (val) {
                            setState(() {
                              isActive = val!;
                            });
                          }),
                    ),
                  );
                },
              ),
            ),
            DataCell(Row(
              children: [
                Container(
                  height: 40,
                  decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Image.asset('assets/Store Avatar(1).png'),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Ishana Strore',
                        style: TextStyle(
                          fontSize: 14, color: Color(0xff9DA2A7),
                          fontFamily: 'InterRegular',
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
            const DataCell(Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/avatar-1-51c6502a 1.png'),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Kumar Ishana',
                  style: TextStyle(
                    fontSize: 14, color: Color(0xff9DA2A7),
                    fontFamily: 'InterRegular',
                  ),
                )
              ],
            )),
            const DataCell(Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('25 Oct 2022',
                        style: TextStyle(
                          fontSize: 14, color: Color(0xff9DA2A7),
                          fontFamily: 'InterRegular',
                        )),
                  ],
                )
              ],
            )),
            DataCell(Row(
              children: [
                SvgPicture.asset('assets/star.svg'),
                const SizedBox(
                  width: 6,
                ),
                const Text(
                  '2.5',
                  style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
                ),
              ],
            )),
            const DataCell(Text(
              '500',
              style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
            )),
            const DataCell(Row(
              children: [
                Text(
                  '\$205.48',
                  style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
                ),
              ],
            )),
            const DataCell(
              Text(
                '\$350.43',
                style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
              ),
            ),
            DataCell(Row(
              children: [
                Image.asset(
                  'assets/more.png',
                  height: 16,
                ),
              ],
            )),
          ],
        );
      case 15:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return Transform.scale(
                    scale: 1.2,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side: const BorderSide(style: BorderStyle.none),
                          visualDensity: const VisualDensity(horizontal: -4),
                          activeColor: const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          value: isActive,
                          onChanged: (val) {
                            setState(() {
                              isActive = val!;
                            });
                          }),
                    ),
                  );
                },
              ),
            ),
            DataCell(Row(
              children: [
                Container(
                  height: 40,
                  decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Image.asset('assets/Brand Logo21.png'),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Dark circles Store',
                        style: TextStyle(
                          fontSize: 14, color: Color(0xff9DA2A7),
                          fontFamily: 'InterRegular',
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
            const DataCell(Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/avatar-6 1.png'),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Mahavir Agrawal',
                  style: TextStyle(
                    fontSize: 14, color: Color(0xff9DA2A7),
                    fontFamily: 'InterRegular',
                  ),
                )
              ],
            )),
            const DataCell(Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('12 Sep 2022',
                        style: TextStyle(
                          fontSize: 14, color: Color(0xff9DA2A7),
                          fontFamily: 'InterRegular',
                        )),
                  ],
                )
              ],
            )),
            DataCell(Row(
              children: [
                SvgPicture.asset('assets/star.svg'),
                const SizedBox(
                  width: 6,
                ),
                const Text(
                  '3.5',
                  style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
                ),
              ],
            )),
            const DataCell(Text(
              '345',
              style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
            )),
            const DataCell(Row(
              children: [
                Text(
                  '\$145.48',
                  style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
                ),
              ],
            )),
            const DataCell(
              Text(
                '\$456.43',
                style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
              ),
            ),
            DataCell(Row(
              children: [
                Image.asset(
                  'assets/more.png',
                  height: 16,
                ),
              ],
            )),
          ],
        );
      case 16:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return Transform.scale(
                    scale: 1.2,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side: const BorderSide(style: BorderStyle.none),
                          visualDensity: const VisualDensity(horizontal: -4),
                          activeColor: const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          value: isActive,
                          onChanged: (val) {
                            setState(() {
                              isActive = val!;
                            });
                          }),
                    ),
                  );
                },
              ),
            ),
            DataCell(Row(
              children: [
                Container(
                  height: 40,
                  decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Image.asset('assets/Brand Logo22.png'),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'circles Store',
                        style: TextStyle(
                          fontSize: 14, color: Color(0xff9DA2A7),
                          fontFamily: 'InterRegular',
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
            const DataCell(Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/avatar-7 1.png'),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Agrawal Mahavir',
                  style: TextStyle(
                    fontSize: 14, color: Color(0xff9DA2A7),
                    fontFamily: 'InterRegular',
                  ),
                )
              ],
            )),
            const DataCell(Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('11 Nov 2022',
                        style: TextStyle(
                          fontSize: 14, color: Color(0xff9DA2A7),
                          fontFamily: 'InterRegular',
                        )),
                  ],
                )
              ],
            )),
            DataCell(Row(
              children: [
                SvgPicture.asset('assets/star.svg'),
                const SizedBox(
                  width: 6,
                ),
                const Text(
                  '4.5',
                  style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
                ),
              ],
            )),
            const DataCell(Text(
              '876',
              style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
            )),
            const DataCell(Row(
              children: [
                Text(
                  '\$908.48',
                  style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
                ),
              ],
            )),
            const DataCell(
              Text(
                '\$277.43',
                style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
              ),
            ),
            DataCell(Row(
              children: [
                Image.asset(
                  'assets/more.png',
                  height: 16,
                ),
              ],
            )),
          ],
        );
      case 17:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return Transform.scale(
                    scale: 1.2,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side: const BorderSide(style: BorderStyle.none),
                          visualDensity: const VisualDensity(horizontal: -4),
                          activeColor: const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          value: isActive,
                          onChanged: (val) {
                            setState(() {
                              isActive = val!;
                            });
                          }),
                    ),
                  );
                },
              ),
            ),
            DataCell(Row(
              children: [
                Container(
                  height: 40,
                  decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Image.asset('assets/Team 1.png'),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Oiliness Strore',
                        style: TextStyle(
                          fontSize: 14, color: Color(0xff9DA2A7),
                          fontFamily: 'InterRegular',
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
            const DataCell(Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/avatar-8 1.png'),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Akshay Kumar',
                  style: TextStyle(
                    fontSize: 14, color: Color(0xff9DA2A7),
                    fontFamily: 'InterRegular',
                  ),
                )
              ],
            )),
            const DataCell(Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('25 Oct 2022',
                        style: TextStyle(
                          fontSize: 14, color: Color(0xff9DA2A7),
                          fontFamily: 'InterRegular',
                        )),
                  ],
                )
              ],
            )),
            DataCell(Row(
              children: [
                SvgPicture.asset('assets/star.svg'),
                const SizedBox(
                  width: 6,
                ),
                const Text(
                  '2.5',
                  style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
                ),
              ],
            )),
            const DataCell(Text(
              '500',
              style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
            )),
            const DataCell(Row(
              children: [
                Text(
                  '\$96.48',
                  style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
                ),
              ],
            )),
            const DataCell(
              Text(
                '\$455.43',
                style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
              ),
            ),
            DataCell(Row(
              children: [
                Image.asset(
                  'assets/more.png',
                  height: 16,
                ),
              ],
            )),
          ],
        );
      case 18:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return Transform.scale(
                    scale: 1.2,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side: const BorderSide(style: BorderStyle.none),
                          visualDensity: const VisualDensity(horizontal: -4),
                          activeColor: const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          value: isActive,
                          onChanged: (val) {
                            setState(() {
                              isActive = val!;
                            });
                          }),
                    ),
                  );
                },
              ),
            ),
            DataCell(Row(
              children: [
                Container(
                  height: 40,
                  decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Image.asset('assets/Team 1.png'),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Oiliness Strore',
                        style: TextStyle(
                          fontSize: 14, color: Color(0xff9DA2A7),
                          fontFamily: 'InterRegular',
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
            const DataCell(Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/avatar-8 1.png'),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Akshay Kumar',
                  style: TextStyle(
                    fontSize: 14, color: Color(0xff9DA2A7),
                    fontFamily: 'InterRegular',
                  ),
                )
              ],
            )),
            const DataCell(Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('25 Oct 2022',
                        style: TextStyle(
                          fontSize: 14, color: Color(0xff9DA2A7),
                          fontFamily: 'InterRegular',
                        )),
                  ],
                )
              ],
            )),
            DataCell(Row(
              children: [
                SvgPicture.asset('assets/star.svg'),
                const SizedBox(
                  width: 6,
                ),
                const Text(
                  '2.5',
                  style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
                ),
              ],
            )),
            const DataCell(Text(
              '500',
              style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
            )),
            const DataCell(Row(
              children: [
                Text(
                  '\$96.48',
                  style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
                ),
              ],
            )),
            const DataCell(
              Text(
                '\$455.43',
                style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
              ),
            ),
            DataCell(Row(
              children: [
                Image.asset(
                  'assets/more.png',
                  height: 16,
                ),
              ],
            )),
          ],
        );
      case 19:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return Transform.scale(
                    scale: 1.2,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side: const BorderSide(style: BorderStyle.none),
                          visualDensity: const VisualDensity(horizontal: -4),
                          activeColor: const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          value: isActive,
                          onChanged: (val) {
                            setState(() {
                              isActive = val!;
                            });
                          }),
                    ),
                  );
                },
              ),
            ),
            DataCell(Row(
              children: [
                Container(
                  height: 40,
                  decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Image.asset('assets/Store Avatar.png'),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Sharma Strore',
                        style: TextStyle(
                          fontSize: 14, color: Color(0xff9DA2A7),
                          fontFamily: 'InterRegular',
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
            const DataCell(Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/download 1.png'),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Kavya Sharma',
                  style: TextStyle(
                    fontSize: 14, color: Color(0xff9DA2A7),
                    fontFamily: 'InterRegular',
                  ),
                )
              ],
            )),
            const DataCell(Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('22 Oct 2022',
                        style: TextStyle(
                          fontSize: 14, color: Color(0xff9DA2A7),
                          fontFamily: 'InterRegular',
                        )),
                  ],
                )
              ],
            )),
            DataCell(Row(
              children: [
                SvgPicture.asset('assets/star.svg'),
                const SizedBox(
                  width: 6,
                ),
                const Text(
                  '1.5',
                  style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
                ),
              ],
            )),
            const DataCell(Text(
              '677',
              style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
            )),
            const DataCell(Row(
              children: [
                Text(
                  '\$796.48',
                  style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
                ),
              ],
            )),
            const DataCell(
              Text(
                '\$585.88',
                style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
              ),
            ),
            DataCell(Row(
              children: [
                Image.asset(
                  'assets/more.png',
                  height: 16,
                ),
              ],
            )),
          ],
        );
      case 20:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return Transform.scale(
                    scale: 1.2,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side: const BorderSide(style: BorderStyle.none),
                          visualDensity: const VisualDensity(horizontal: -4),
                          activeColor: const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          value: isActive,
                          onChanged: (val) {
                            setState(() {
                              isActive = val!;
                            });
                          }),
                    ),
                  );
                },
              ),
            ),
            DataCell(Row(
              children: [
                Container(
                  height: 40,
                  decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Image.asset('assets/Store Avatar(1).png'),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Ishana Strore',
                        style: TextStyle(
                          fontSize: 14, color: Color(0xff9DA2A7),
                          fontFamily: 'InterRegular',
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
            const DataCell(Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/avatar-1-51c6502a 1.png'),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Kumar Ishana',
                  style: TextStyle(
                    fontSize: 14, color: Color(0xff9DA2A7),
                    fontFamily: 'InterRegular',
                  ),
                )
              ],
            )),
            const DataCell(Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('25 Oct 2022',
                        style: TextStyle(
                          fontSize: 14, color: Color(0xff9DA2A7),
                          fontFamily: 'InterRegular',
                        )),
                  ],
                )
              ],
            )),
            DataCell(Row(
              children: [
                SvgPicture.asset('assets/star.svg'),
                const SizedBox(
                  width: 6,
                ),
                const Text(
                  '2.5',
                  style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
                ),
              ],
            )),
            const DataCell(Text(
              '500',
              style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
            )),
            const DataCell(Row(
              children: [
                Text(
                  '\$205.48',
                  style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
                ),
              ],
            )),
            const DataCell(
              Text(
                '\$350.43',
                style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
              ),
            ),
            DataCell(Row(
              children: [
                Image.asset(
                  'assets/more.png',
                  height: 16,
                ),
              ],
            )),
          ],
        );
      case 21:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return Transform.scale(
                    scale: 1.2,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side: const BorderSide(style: BorderStyle.none),
                          visualDensity: const VisualDensity(horizontal: -4),
                          activeColor: const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          value: isActive,
                          onChanged: (val) {
                            setState(() {
                              isActive = val!;
                            });
                          }),
                    ),
                  );
                },
              ),
            ),
            DataCell(Row(
              children: [
                Container(
                  height: 40,
                  decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Image.asset('assets/Brand Logo21.png'),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Dark circles Store',
                        style: TextStyle(
                          fontSize: 14, color: Color(0xff9DA2A7),
                          fontFamily: 'InterRegular',
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
            const DataCell(Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/avatar-6 1.png'),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Mahavir Agrawal',
                  style: TextStyle(
                    fontSize: 14, color: Color(0xff9DA2A7),
                    fontFamily: 'InterRegular',
                  ),
                )
              ],
            )),
            const DataCell(Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('12 Sep 2022',
                        style: TextStyle(
                          fontSize: 14, color: Color(0xff9DA2A7),
                          fontFamily: 'InterRegular',
                        )),
                  ],
                )
              ],
            )),
            DataCell(Row(
              children: [
                SvgPicture.asset('assets/star.svg'),
                const SizedBox(
                  width: 6,
                ),
                const Text(
                  '3.5',
                  style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
                ),
              ],
            )),
            const DataCell(Text(
              '345',
              style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
            )),
            const DataCell(Row(
              children: [
                Text(
                  '\$145.48',
                  style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
                ),
              ],
            )),
            const DataCell(
              Text(
                '\$456.43',
                style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
              ),
            ),
            DataCell(Row(
              children: [
                Image.asset(
                  'assets/more.png',
                  height: 16,
                ),
              ],
            )),
          ],
        );
      case 22:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return Transform.scale(
                    scale: 1.2,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side: const BorderSide(style: BorderStyle.none),
                          visualDensity: const VisualDensity(horizontal: -4),
                          activeColor: const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          value: isActive,
                          onChanged: (val) {
                            setState(() {
                              isActive = val!;
                            });
                          }),
                    ),
                  );
                },
              ),
            ),
            DataCell(Row(
              children: [
                Container(
                  height: 40,
                  decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Image.asset('assets/Brand Logo22.png'),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'circles Store',
                        style: TextStyle(
                          fontSize: 14, color: Color(0xff9DA2A7),
                          fontFamily: 'InterRegular',
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
            const DataCell(Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/avatar-7 1.png'),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Agrawal Mahavir',
                  style: TextStyle(
                    fontSize: 14, color: Color(0xff9DA2A7),
                    fontFamily: 'InterRegular',
                  ),
                )
              ],
            )),
            const DataCell(Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('11 Nov 2022',
                        style: TextStyle(
                          fontSize: 14, color: Color(0xff9DA2A7),
                          fontFamily: 'InterRegular',
                        )),
                  ],
                )
              ],
            )),
            DataCell(Row(
              children: [
                SvgPicture.asset('assets/star.svg'),
                const SizedBox(
                  width: 6,
                ),
                const Text(
                  '4.5',
                  style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
                ),
              ],
            )),
            const DataCell(Text(
              '876',
              style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
            )),
            const DataCell(Row(
              children: [
                Text(
                  '\$908.48',
                  style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
                ),
              ],
            )),
            const DataCell(
              Text(
                '\$277.43',
                style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
              ),
            ),
            DataCell(Row(
              children: [
                Image.asset(
                  'assets/more.png',
                  height: 16,
                ),
              ],
            )),
          ],
        );
      case 23:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return Transform.scale(
                    scale: 1.2,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side: const BorderSide(style: BorderStyle.none),
                          visualDensity: const VisualDensity(horizontal: -4),
                          activeColor: const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          value: isActive,
                          onChanged: (val) {
                            setState(() {
                              isActive = val!;
                            });
                          }),
                    ),
                  );
                },
              ),
            ),
            DataCell(Row(
              children: [
                Container(
                  height: 40,
                  decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Image.asset('assets/Team 1.png'),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Oiliness Strore',
                        style: TextStyle(
                          fontSize: 14, color: Color(0xff9DA2A7),
                          fontFamily: 'InterRegular',
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
            const DataCell(Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/avatar-8 1.png'),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Akshay Kumar',
                  style: TextStyle(
                    fontSize: 14, color: Color(0xff9DA2A7),
                    fontFamily: 'InterRegular',
                  ),
                )
              ],
            )),
            const DataCell(Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('25 Oct 2022',
                        style: TextStyle(
                          fontSize: 14, color: Color(0xff9DA2A7),
                          fontFamily: 'InterRegular',
                        )),
                  ],
                )
              ],
            )),
            DataCell(Row(
              children: [
                SvgPicture.asset('assets/star.svg'),
                const SizedBox(
                  width: 6,
                ),
                const Text(
                  '2.5',
                  style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
                ),
              ],
            )),
            const DataCell(Text(
              '500',
              style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
            )),
            const DataCell(Row(
              children: [
                Text(
                  '\$96.48',
                  style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
                ),
              ],
            )),
            const DataCell(
              Text(
                '\$455.43',
                style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
              ),
            ),
            DataCell(Row(
              children: [
                Image.asset(
                  'assets/more.png',
                  height: 16,
                ),
              ],
            )),
          ],
        );
      case 24:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return Transform.scale(
                    scale: 1.2,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side: const BorderSide(style: BorderStyle.none),
                          visualDensity: const VisualDensity(horizontal: -4),
                          activeColor: const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          value: isActive,
                          onChanged: (val) {
                            setState(() {
                              isActive = val!;
                            });
                          }),
                    ),
                  );
                },
              ),
            ),
            DataCell(Row(
              children: [
                Container(
                  height: 40,
                  decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Image.asset('assets/Brand Logo11.png'),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Whiteheads Store',
                        style: TextStyle(
                          fontSize: 14, color: Color(0xff9DA2A7),
                          fontFamily: 'InterRegular',
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
            const DataCell(Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/artist.png'),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Ananya Ishana',
                  style: TextStyle(
                    fontSize: 14, color: Color(0xff9DA2A7),
                    fontFamily: 'InterRegular',
                  ),
                )
              ],
            )),
            const DataCell(Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('21 Sep 2022',
                        style: TextStyle(
                          fontSize: 14, color: Color(0xff9DA2A7),
                          fontFamily: 'InterRegular',
                        )),
                  ],
                )
              ],
            )),
            DataCell(Row(
              children: [
                SvgPicture.asset('assets/star.svg'),
                const SizedBox(
                  width: 6,
                ),
                const Text(
                  '5',
                  style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
                ),
              ],
            )),
            const DataCell(Text(
              '596',
              style: TextStyle( color: Color(0xff9DA2A7),fontFamily:  'InterRegular', fontSize: 14),
            )),
            const DataCell(Row(
              children: [
                Text(
                  '\$544.67',
                  style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
                ),
              ],
            )),
            const DataCell(
              Text(
                '\$789.67',
                style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
              ),
            ),
            DataCell(Row(
              children: [
                Image.asset(
                  'assets/more.png',
                  height: 16,
                ),
              ],
            )),
          ],
        );
      case 25:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return Transform.scale(
                    scale: 1.2,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side: const BorderSide(style: BorderStyle.none),
                          visualDensity: const VisualDensity(horizontal: -4),
                          activeColor: const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          value: isActive,
                          onChanged: (val) {
                            setState(() {
                              isActive = val!;
                            });
                          }),
                    ),
                  );
                },
              ),
            ),
            DataCell(Row(
              children: [
                Container(
                  height: 40,
                  decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Image.asset('assets/Brand Logo21.png'),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Dark circles Store',
                        style: TextStyle(
                          fontSize: 14, color: Color(0xff9DA2A7),
                          fontFamily: 'InterRegular',
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
            const DataCell(Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/avatar-6 1.png'),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Mahavir Agrawal',
                  style: TextStyle(
                    fontSize: 14, color: Color(0xff9DA2A7),
                    fontFamily: 'InterRegular',
                  ),
                )
              ],
            )),
            const DataCell(Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('12 Sep 2022',
                        style: TextStyle(
                          fontSize: 14, color: Color(0xff9DA2A7),
                          fontFamily: 'InterRegular',
                        )),
                  ],
                )
              ],
            )),
            DataCell(Row(
              children: [
                SvgPicture.asset('assets/star.svg'),
                const SizedBox(
                  width: 6,
                ),
                const Text(
                  '3.5',
                  style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
                ),
              ],
            )),
            const DataCell(Text(
              '345',
              style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
            )),
            const DataCell(Row(
              children: [
                Text(
                  '\$145.48',
                  style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
                ),
              ],
            )),
            const DataCell(
              Text(
                '\$456.43',
                style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
              ),
            ),
            DataCell(Row(
              children: [
                Image.asset(
                  'assets/more.png',
                  height: 16,
                ),
              ],
            )),
          ],
        );
      case 26:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return Transform.scale(
                    scale: 1.2,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side: const BorderSide(style: BorderStyle.none),
                          visualDensity: const VisualDensity(horizontal: -4),
                          activeColor: const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          value: isActive,
                          onChanged: (val) {
                            setState(() {
                              isActive = val!;
                            });
                          }),
                    ),
                  );
                },
              ),
            ),
            DataCell(Row(
              children: [
                Container(
                  height: 40,
                  decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Image.asset('assets/Brand Logo22.png'),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'circles Store',
                        style: TextStyle(
                          fontSize: 14, color: Color(0xff9DA2A7),
                          fontFamily: 'InterRegular',
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
            const DataCell(Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/avatar-7 1.png'),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Agrawal Mahavir',
                  style: TextStyle(
                    fontSize: 14, color: Color(0xff9DA2A7),
                    fontFamily: 'InterRegular',
                  ),
                )
              ],
            )),
            const DataCell(Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('11 Nov 2022',
                        style: TextStyle(
                          fontSize: 14, color: Color(0xff9DA2A7),
                          fontFamily: 'InterRegular',
                        )),
                  ],
                )
              ],
            )),
            DataCell(Row(
              children: [
                SvgPicture.asset('assets/star.svg'),
                const SizedBox(
                  width: 6,
                ),
                const Text(
                  '4.5',
                  style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
                ),
              ],
            )),
            const DataCell(Text(
              '876',
              style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
            )),
            const DataCell(Row(
              children: [
                Text(
                  '\$908.48',
                  style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
                ),
              ],
            )),
            const DataCell(
              Text(
                '\$277.43',
                style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
              ),
            ),
            DataCell(Row(
              children: [
                Image.asset(
                  'assets/more.png',
                  height: 16,
                ),
              ],
            )),
          ],
        );
      case 27:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return Transform.scale(
                    scale: 1.2,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side: const BorderSide(style: BorderStyle.none),
                          visualDensity: const VisualDensity(horizontal: -4),
                          activeColor: const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          value: isActive,
                          onChanged: (val) {
                            setState(() {
                              isActive = val!;
                            });
                          }),
                    ),
                  );
                },
              ),
            ),
            DataCell(Row(
              children: [
                Container(
                  height: 40,
                  decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Image.asset('assets/Brand Logo21.png'),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Dark circles Store',
                        style: TextStyle(
                          fontSize: 14, color: Color(0xff9DA2A7),
                          fontFamily: 'InterRegular',
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
            const DataCell(Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/avatar-6 1.png'),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Mahavir Agrawal',
                  style: TextStyle(
                    fontSize: 14, color: Color(0xff9DA2A7),
                    fontFamily: 'InterRegular',
                  ),
                )
              ],
            )),
            const DataCell(Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('12 Sep 2022',
                        style: TextStyle(
                          fontSize: 14, color: Color(0xff9DA2A7),
                          fontFamily: 'InterRegular',
                        )),
                  ],
                )
              ],
            )),
            DataCell(Row(
              children: [
                SvgPicture.asset('assets/star.svg'),
                const SizedBox(
                  width: 6,
                ),
                const Text(
                  '3.5',
                  style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
                ),
              ],
            )),
            const DataCell(Text(
              '345',
              style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
            )),
            const DataCell(Row(
              children: [
                Text(
                  '\$145.48',
                  style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
                ),
              ],
            )),
            const DataCell(
              Text(
                '\$456.43',
                style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
              ),
            ),
            DataCell(Row(
              children: [
                Image.asset(
                  'assets/more.png',
                  height: 16,
                ),
              ],
            )),
          ],
        );
      case 28:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return Transform.scale(
                    scale: 1.2,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side: const BorderSide(style: BorderStyle.none),
                          visualDensity: const VisualDensity(horizontal: -4),
                          activeColor: const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          value: isActive,
                          onChanged: (val) {
                            setState(() {
                              isActive = val!;
                            });
                          }),
                    ),
                  );
                },
              ),
            ),
            DataCell(Row(
              children: [
                Container(
                  height: 40,
                  decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Image.asset('assets/Brand Logo22.png'),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'circles Store',
                        style: TextStyle(
                          fontSize: 14, color: Color(0xff9DA2A7),
                          fontFamily: 'InterRegular',
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
            const DataCell(Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/avatar-7 1.png'),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Agrawal Mahavir',
                  style: TextStyle(
                    fontSize: 14, color: Color(0xff9DA2A7),
                    fontFamily: 'InterRegular',
                  ),
                )
              ],
            )),
            const DataCell(Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('11 Nov 2022',
                        style: TextStyle(
                          fontSize: 14, color: Color(0xff9DA2A7),
                          fontFamily: 'InterRegular',
                        )),
                  ],
                )
              ],
            )),
            DataCell(Row(
              children: [
                SvgPicture.asset('assets/star.svg'),
                const SizedBox(
                  width: 6,
                ),
                const Text(
                  '4.5',
                  style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
                ),
              ],
            )),
            const DataCell(Text(
              '876',
              style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
            )),
            const DataCell(Row(
              children: [
                Text(
                  '\$908.48',
                  style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
                ),
              ],
            )),
            const DataCell(
              Text(
                '\$277.43',
                style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
              ),
            ),
            DataCell(Row(
              children: [
                Image.asset(
                  'assets/more.png',
                  height: 16,
                ),
              ],
            )),
          ],
        );
      case 29:
        return DataRow(
          cells: <DataCell>[
            DataCell(
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return Transform.scale(
                    scale: 1.2,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side: const BorderSide(style: BorderStyle.none),
                          visualDensity: const VisualDensity(horizontal: -4),
                          activeColor: const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          value: isActive,
                          onChanged: (val) {
                            setState(() {
                              isActive = val!;
                            });
                          }),
                    ),
                  );
                },
              ),
            ),
            DataCell(Row(
              children: [
                Container(
                  height: 40,
                  decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Image.asset('assets/Team 1.png'),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Oiliness Strore',
                        style: TextStyle(
                          fontSize: 14, color: Color(0xff9DA2A7),
                          fontFamily: 'InterRegular',
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
            const DataCell(Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/avatar-8 1.png'),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Akshay Kumar',
                  style: TextStyle(
                    fontSize: 14, color: Color(0xff9DA2A7),
                    fontFamily: 'InterRegular',
                  ),
                )
              ],
            )),
            const DataCell(Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('25 Oct 2022',
                        style: TextStyle(
                          fontSize: 14, color: Color(0xff9DA2A7),
                          fontFamily: 'InterRegular',
                        )),
                  ],
                )
              ],
            )),
            DataCell(Row(
              children: [
                SvgPicture.asset('assets/star.svg'),
                const SizedBox(
                  width: 6,
                ),
                const Text(
                  '2.5',
                  style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
                ),
              ],
            )),
            const DataCell(Text(
              '500',
              style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
            )),
            const DataCell(Row(
              children: [
                Text(
                  '\$96.48',
                  style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
                ),
              ],
            )),
            const DataCell(
              Text(
                '\$455.43',
                style: TextStyle( color: Color(0xff9DA2A7),fontFamily: 'InterRegular', fontSize: 14),
              ),
            ),
            DataCell(Row(
              children: [
                Image.asset(
                  'assets/more.png',
                  height: 16,
                ),
              ],
            )),
          ],
        );
    }
    return null;
  }
}
