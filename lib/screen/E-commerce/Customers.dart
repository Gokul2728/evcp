// ignore_for_file: deprecated_member_use, non_constant_identifier_names
// ignore_for_file: prefer_const_constructors, file_names, camel_case_types



import 'package:dropdown_button2/dropdown_button2.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';


import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../confing/colors.dart';
import '../../confing/image.dart';

import '../../confing/list.dart';
import '../../confing/notifier.dart';
import '../../controller/page_controller.dart';
import '../Dashboard/Dashboard_main.dart';
import '../de.dart';


class Customers extends StatefulWidget {
  const Customers({super.key});

  @override
  State<Customers> createState() => _CustomersState();
}

class _CustomersState extends State<Customers> {

  int value = 0;

  late ColorNotifier notifire;

  String? selectedValue;
  SampleItem? selectedMenu;
  DateTime selectedDate = DateTime.now();
  InboxController inboxController = Get.put(InboxController());
  TextEditingController dateController = TextEditingController();

  DateRangePickerController dateSelecter = DateRangePickerController();
  TextEditingController dateController1 = TextEditingController();

  DateTime selectedDate1 = DateTime.now();

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
    if (args.value is PickerDateRange) {} else
    if (args.value is DateTime) {} else
    if (args.value is List<DateTime>) {} else {}
  }

  final List<String> items = [
    '299',
    '399',
    '599',
    '999',
    '1500',
    '2000',
  ];
  final List<String> items1 = [
    '0',
    '1',
    '3.5',
    '4.5',
    '5',
  ];
  final List<String> items2 = [
    'Macbook Pro',
    'Gopro',
    'Chair',
    'Dell',
    'Fashion',
    'HP',
  ];
  final List<String> items3 = [
    'Macbook Pro',
    'Gopro',
    'Chair',
    'Dell',
    'Fashion',
    'HP',
  ];
  final List<String> items4 = [
    'Macbook Pro',
    'Gopro',
    'Chair',
    'Dell',
    'Fashion',
    'HP',
  ];

  String dropdownvalue = 'All Date';

  bool profilePage = false;

  var selectedPageNumber = 4;
  bool isActive = false;

  String? selectedValue1;
  String? selectedValue2;
  String? selectedValue3;
  String? selectedValue4;
  bool container = false;

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
    'Ananya23@gmail.com',
    'RahulKohli87@gmail.com',
    'MahavirAgrawal@gmail.com',
    'HarshAgrawal@gmail.com',
    'Kavya343@gmail.com',
    'IshanaSharma@gmail.com',
    'Ananya23@gmail.com',
    'RahulKohli87@gmail.com',
    'MahavirAgraw@gmail.com',
    'HarshAgrawal@gmail.com',
    'Kavya343@gmail.com',
    'IshanaSharma3@gmail.com',
    'HarshAgrawal@gmail.com',
    'Kavya343@gmail.com',
    'IshanaSharma3@gmail.com',
    'Ananya23@gmail.com',
    'RahulKohli87@gmail.com',
    'MahavirAgraw@gmail.com',
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
  bool add = false;


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
                    container2(constraints.maxWidth)
                  ],
                ),
              ),
            ),

          );
        } else if (constraints.maxWidth < 1000) {
          return Container(
            decoration: BoxDecoration(
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
                        container2(constraints.maxWidth)
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
              decoration: BoxDecoration(
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

  Widget firstContainer({ context, constraints,}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      child: Column(
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
              Text('E-commerce', style: TextStyle(
                  color: greyy, fontSize: 14, fontFamily: 'InterRegular'),),
              const SizedBox(width: 10,),
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: greyy,),),
              const SizedBox(width: 10,),
              Text('Customers', style: TextStyle(color: notifire.getblackcolor,
                  fontSize: 14,
                  fontFamily: 'InterRegular'),),
            ],
          ),
          const SizedBox(height: 20,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              constraints < 600
                  ? const SizedBox()
                  : Expanded(
                  flex: 5,
                  child: container2(constraints)),
            ],
          ),
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
          child: Text(title,style: TextStyle(color: notifire.getblackcolor,fontFamily: 'InterRegular',fontSize: 14)),
        ),
        const SizedBox(
          width: 10,
        ),

      ],
    );
  }


  Widget container2(constraints) {
    if (constraints < 600) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
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
              Text('Customers', style: TextStyle(color: notifire.getblackcolor,
                  fontSize: 14,
                  fontFamily: 'InterRegular'),),
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {

                          },
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius
                                .circular(14), color: notifire.getbgcolor11,),
                            padding: const EdgeInsets.all(11),
                            child: Row(
                              children: [
                                Image.asset('assets/import.png', height: 16,),

                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 10,),
                        InkWell(
                          onTap: () {

                          },
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius
                                .circular(14), color: notifire.getbgcolor11,),
                            padding: const EdgeInsets.all(11),
                            child: Center(
                              child: Row(
                                children: [
                                  Image.asset('assets/export.png', height: 16,),

                                ],
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 44,
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
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
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
                                child: SingleChildScrollView(
                                  child: StatefulBuilder(
                                    builder: (context, setState) {
                                      return Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          mainAxisAlignment: MainAxisAlignment
                                              .start,
                                          children: [
                                            Text('Add Customer',
                                              style: TextStyle(fontSize: 20,
                                                fontFamily: 'InterRegular',
                                                fontWeight: FontWeight.w500,
                                                color: notifire
                                                    .getblackcolor,),),
                                            const SizedBox(height: 15,),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .start,
                                              mainAxisAlignment: MainAxisAlignment
                                                  .start,
                                              children: [
                                                const Text('Customer Name',
                                                  style: TextStyle(fontSize: 12,
                                                      fontFamily: 'InterRegular',
                                                      color: Color(0xff727880),
                                                      fontWeight: FontWeight
                                                          .w600),),
                                                const SizedBox(height: 5,),
                                                Container(
                                                  height: 45,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius
                                                          .circular(12),
                                                      border: Border.all(
                                                          color: notifire
                                                              .getgrey1)),
                                                  child: TextField(
                                                    style: TextStyle(
                                                      color: notifire
                                                          .getblackcolor,),
                                                    decoration: InputDecoration(
                                                      hintText: 'Enter Name',
                                                      hintStyle: const TextStyle(
                                                          color: Color(
                                                              0xffC6C8CB),
                                                          fontSize: 15),
                                                      contentPadding: const EdgeInsets
                                                          .only(
                                                          left: 20, right: 20),
                                                      border: OutlineInputBorder(
                                                          borderRadius: BorderRadius
                                                              .circular(12),
                                                          borderSide: BorderSide(
                                                              color: grey2)),
                                                      enabledBorder: OutlineInputBorder(
                                                          borderSide: BorderSide
                                                              .none,
                                                          borderRadius: BorderRadius
                                                              .circular(12)),
                                                      focusedBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: blue),
                                                          borderRadius: BorderRadius
                                                              .circular(12)),
                                                    ),
                                                  ),
                                                ),

                                              ],),
                                            const SizedBox(height: 10,),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .start,
                                              mainAxisAlignment: MainAxisAlignment
                                                  .start,
                                              children: [
                                                const Text('Phone Number',
                                                  style: TextStyle(fontSize: 12,
                                                      fontFamily: 'InterRegular',
                                                      color: Color(0xff727880),
                                                      fontWeight: FontWeight
                                                          .w600),),
                                                const SizedBox(height: 5,),
                                                Container(
                                                  height: 45,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius
                                                          .circular(12),
                                                      border: Border.all(
                                                          color: notifire
                                                              .getgrey1)),
                                                  child: TextField(
                                                    style: TextStyle(
                                                      color: notifire
                                                          .getblackcolor,),
                                                    decoration: InputDecoration(
                                                      hintText: 'Enter Phone Number',
                                                      hintStyle: const TextStyle(
                                                          color: Color(
                                                              0xffC6C8CB),
                                                          fontSize: 15),
                                                      contentPadding: const EdgeInsets
                                                          .only(
                                                          left: 20, right: 20),
                                                      border: OutlineInputBorder(
                                                          borderRadius: BorderRadius
                                                              .circular(12),
                                                          borderSide: BorderSide(
                                                              color: grey2)),
                                                      enabledBorder: OutlineInputBorder(
                                                          borderSide: BorderSide
                                                              .none,
                                                          borderRadius: BorderRadius
                                                              .circular(12)),
                                                      focusedBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: blue),
                                                          borderRadius: BorderRadius
                                                              .circular(12)),
                                                    ),
                                                  ),
                                                ),

                                              ],),
                                            const SizedBox(height: 10,),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .start,
                                              mainAxisAlignment: MainAxisAlignment
                                                  .start,
                                              children: [
                                                const Text('Email',
                                                  style: TextStyle(fontSize: 12,
                                                      fontWeight: FontWeight
                                                          .w600,
                                                      fontFamily: 'InterRegular',
                                                      color: Color(
                                                          0xff727880)),),
                                                const SizedBox(height: 5,),
                                                Container(
                                                  height: 45,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius
                                                          .circular(12),
                                                      border: Border.all(
                                                          color: notifire
                                                              .getgrey1)),
                                                  child: TextField(
                                                    style: TextStyle(
                                                      color: notifire
                                                          .getblackcolor,),
                                                    decoration: InputDecoration(
                                                      hintText: 'Enter Email',
                                                      hintStyle: const TextStyle(
                                                          color: Color(
                                                              0xffC6C8CB),
                                                          fontSize: 15),
                                                      contentPadding: const EdgeInsets
                                                          .only(
                                                          left: 20, right: 20),
                                                      border: OutlineInputBorder(
                                                          borderRadius: BorderRadius
                                                              .circular(12),
                                                          borderSide: BorderSide(
                                                              color: grey2)),
                                                      enabledBorder: OutlineInputBorder(
                                                          borderSide: BorderSide
                                                              .none,
                                                          borderRadius: BorderRadius
                                                              .circular(12)),
                                                      focusedBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: blue),
                                                          borderRadius: BorderRadius
                                                              .circular(12)),
                                                    ),
                                                  ),
                                                ),

                                              ],),
                                            const SizedBox(height: 10,),
                                            const Text('Join Date',
                                              style: TextStyle(fontSize: 12,
                                                  fontFamily: 'InterRegular',
                                                  color: Color(0xff727880),
                                                  fontWeight: FontWeight
                                                      .w600),),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    height: 45,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: notifire
                                                                .getgrey1
                                                        ),
                                                        borderRadius: BorderRadius
                                                            .circular(15)),
                                                    child: TextField(
                                                      onTap: () {
                                                        buildDialog();
                                                      },
                                                      controller: dateController1,
                                                      readOnly: true,
                                                      keyboardType: TextInputType
                                                          .datetime,
                                                      decoration: InputDecoration(
                                                        suffixIcon: Image.asset(
                                                            AppContent.calendar,
                                                            scale: 3.5,
                                                            color: const Color(
                                                                0xff9DA2A7)),
                                                        hintText:
                                                        "${selectedDate1
                                                            .day}-${selectedDate1
                                                            .month}-${selectedDate1
                                                            .year}",
                                                        hintStyle: TextStyle(
                                                            color: notifire
                                                                .getblackcolor,
                                                            fontFamily: 'UrbanistBold',
                                                            fontSize: 15),
                                                        border: OutlineInputBorder(
                                                            borderRadius: BorderRadius
                                                                .circular(
                                                                12),
                                                            borderSide: BorderSide(
                                                                color: grey2)),
                                                        enabledBorder: OutlineInputBorder(
                                                            borderSide: BorderSide
                                                                .none,
                                                            borderRadius: BorderRadius
                                                                .circular(
                                                                12)),
                                                        focusedBorder: OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color: blue),
                                                            borderRadius: BorderRadius
                                                                .circular(
                                                                12)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 10,),
                                            const Text('Status',
                                              style: TextStyle(fontSize: 12,
                                                  fontFamily: 'InterRegular',
                                                  color: Color(0xff727880),
                                                  fontWeight: FontWeight
                                                      .w600),),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: DropdownButtonHideUnderline(
                                                    child: DropdownButton2<String>(
                                                      isExpanded: true,
                                                      hint: Row(
                                                        children: [
                                                          const SizedBox(
                                                            width: 4,
                                                          ),
                                                          Expanded(
                                                            child: Text(
                                                              'COD',
                                                              style: TextStyle(
                                                                fontSize: 14,
                                                                fontFamily: 'InterRegular',
                                                                color: notifire
                                                                    .getblackcolor,
                                                              ),
                                                              overflow: TextOverflow
                                                                  .ellipsis,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      items: items3
                                                          .map((String item) =>
                                                          DropdownMenuItem<String>(
                                                            value: item,
                                                            child: Text(
                                                              item,
                                                              style:  TextStyle(
                                                                fontSize: 14,
                                                                fontWeight: FontWeight
                                                                    .bold,
                                                                color: notifire.getblackcolor,
                                                              ),
                                                              overflow: TextOverflow
                                                                  .ellipsis,
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
                                                        width: Get.width * 0.2,
                                                        padding: const EdgeInsets.only(
                                                            left: 14, right: 14),
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius
                                                              .circular(14),
                                                          border: Border.all(
                                                              color: notifire.getgrey1
                                                          ),

                                                        ),
                                                        elevation: 0,
                                                      ),
                                                      iconStyleData: const IconStyleData(
                                                        icon: Icon(
                                                          Icons
                                                              .keyboard_arrow_down_outlined,
                                                          color: Color(0xff9DA2A7),
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
                                                          borderRadius: BorderRadius
                                                              .circular(14),
                                                          color: notifire.getbgcolor11,
                                                        ),
                                                        offset: const Offset(-20, 0),
                                                        scrollbarTheme: ScrollbarThemeData(
                                                          radius: const Radius.circular(
                                                              40),
                                                          thickness:
                                                          MaterialStateProperty.all<
                                                              double>(6),
                                                          thumbVisibility:
                                                          MaterialStateProperty.all<bool>(
                                                              true),
                                                        ),
                                                      ),
                                                      menuItemStyleData: const MenuItemStyleData(
                                                        height: 40,
                                                        padding: EdgeInsets.only(
                                                            left: 14, right: 14),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 15,),
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .end,
                                              mainAxisAlignment: MainAxisAlignment
                                                  .end,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    Get.back();
                                                  },
                                                  child: Container(

                                                    padding: const EdgeInsets
                                                        .all(12),
                                                    decoration: BoxDecoration(
                                                      color: notifire
                                                          .getbgcolor10,
                                                      borderRadius: BorderRadius
                                                          .circular(12),
                                                    ),
                                                    child: const Center(
                                                        child: Text('Cancel',
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight: FontWeight
                                                                  .w600,
                                                              fontFamily: 'InterRegular',
                                                              color: Color(
                                                                  0xff727880)),)),
                                                  ),
                                                ),
                                                const SizedBox(width: 10,),
                                                InkWell(
                                                  onTap: () {

                                                  },
                                                  child: Container(

                                                    padding: const EdgeInsets
                                                        .all(12),
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius
                                                            .circular(12),
                                                        color: const Color(
                                                            0xff595FE5)),
                                                    child: const Center(
                                                        child: Text(
                                                            'Add Customer',
                                                            style: TextStyle(
                                                                fontFamily: 'InterRegular',
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 14,
                                                                fontWeight: FontWeight
                                                                    .w600))),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      );
                                    },),
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
                        const SizedBox(width: 10,),
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                              color: notifire.getbgcolor11,
                              borderRadius: BorderRadius.circular(12)),
                          child: TabBar(
                            // indicatorColor: Color(0xffEEEEEE),
                              indicator: BoxDecoration(
                                  color: notifire.Tab,
                                  borderRadius: const BorderRadius.only(
                                      bottomRight: Radius.circular(12),
                                      topRight: Radius.circular(12),
                                      bottomLeft: Radius.circular(12),
                                      topLeft: Radius.circular(12))),
                              isScrollable: true,
                              labelColor: Colors.red,
                              tabs: [
                                Tab(
                                  child: InkWell(
                                      onTap: () {},
                                      child: Tab(
                                          child: SvgPicture.asset(
                                            'assets/row-vertical.svg',
                                            height: 12,
                                            color: notifire.getblackcolor,
                                          ))),
                                ),
                                InkWell(
                                  onTap: () {

                                  },
                                  child: Tab(
                                    child: Tab(
                                        child: SvgPicture.asset(
                                          'assets/element-3.svg',
                                          height: 12,
                                          color: notifire.getblackcolor,
                                        )),
                                  ),
                                )
                              ]),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 10,),
                SizedBox(
                    height: Get.height * 1.15,
                    child: TabBarView(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 700,
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
                                                      // columnWidths: const {
                                                      //   0: FixedColumnWidth(100),
                                                      //   1: FixedColumnWidth(240),
                                                      //   2: FixedColumnWidth(220),
                                                      //   3: FixedColumnWidth(210),
                                                      //   4: FixedColumnWidth(240),
                                                      //   5: FixedColumnWidth(140),
                                                      //   6: FixedColumnWidth(200),
                                                      //   7: FixedColumnWidth(100),
                                                      //   8: FixedColumnWidth(130),
                                                      // },
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
                                                              title: "Custmer Name",
                                                              iscenter: false),
                                                          dataColumn1(
                                                              title: "PHone",
                                                              iscenter: false),
                                                          dataColumn1(
                                                              title: "Email",
                                                              iscenter: false),
                                                          dataColumn1(
                                                              title: "Joined Date",
                                                              iscenter: true),
                                                          dataColumn1(
                                                              title: "Balance",
                                                              iscenter: true),
                                                          dataColumn1(
                                                              title: "Orders",
                                                              iscenter: true),
                                                          dataColumn1(
                                                              title: "Status",
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
                                                                      vertical: 15),
                                                                  child:  ListTile(

                                                                    leading:  Image.asset(imageintable[a],   height: 40,),
                                                                    title: Text(proname[a],
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
                                                                      vertical: 35),
                                                                  child: Text(
                                                                      listtiletitle[a],
                                                                      style: TextStyle(color: notifire.getblackcolor,fontSize: 13,fontFamily: 'InterRegular')),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets.symmetric(
                                                                      vertical: 35),
                                                                  child: Text(stoek[a],
                                                                      style: TextStyle(color: notifire.getblackcolor,  fontFamily: 'InterRegular',
                                                                        fontSize: 13,)),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets.symmetric(
                                                                      vertical: 35),
                                                                  child: Center(
                                                                    child: Text(
                                                                      '11 Sep 2024',
                                                                      style: TextStyle(
                                                                        fontFamily: 'InterRegular',
                                                                        fontSize: 13,
                                                                        color: notifire.getblackcolor,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                    padding: const EdgeInsets.symmetric(
                                                                        vertical: 35),
                                                                    child: Row(
                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                      children: [

                                                                        Text(
                                                                          ster[a],
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
                                                                      vertical: 35),
                                                                  child: Center(
                                                                    child: Text(
                                                                      Price[a],
                                                                      style: TextStyle(
                                                                          fontFamily: 'InterRegular',
                                                                          fontWeight: FontWeight.w600,
                                                                          color: notifire.getblackcolor,
                                                                          fontSize: 13),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                    padding: const EdgeInsets.symmetric(
                                                                        vertical: 35),
                                                                    child:       Center(
                                                                      child:  Text(Orders[a], style: TextStyle(fontSize: 14,
                                                                          fontFamily: 'InterRegular',
                                                                          fontWeight: FontWeight.w500,
                                                                          color: name2[a])),
                                                                    )
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets.symmetric(vertical: 35,horizontal: 25),
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
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                            ),
                            itemCount: 5,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {},
                                child: Container(

                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: notifire.getbgcolor11,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(14),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceAround,
                                      children: [
                                        CircleAvatar(
                                          radius: 30,
                                          backgroundImage: AssetImage(
                                              model().custom[index]),),

                                        Text(model().custome[index],
                                          style: TextStyle(fontSize: 18,
                                            fontFamily: 'InterRegular',
                                            color: notifire.getblackcolor,),),

                                        Text(model().custo[index],
                                          style: const TextStyle(fontSize: 14,
                                            fontFamily: 'InterRegular',
                                            color: Color(0xff727880),),),

                                        Text(model().customs[index],
                                          style: const TextStyle(fontSize: 14,
                                              fontFamily: 'InterRegular',
                                              color: Color(0xff727880)),),

                                        Row(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(12),
                                              decoration: BoxDecoration(
                                                color: model().Custo[index],
                                                borderRadius: BorderRadius
                                                    .circular(16),
                                              ),
                                              child: Text(model().Active[index],
                                                  style: TextStyle(
                                                      fontFamily: 'InterRegular',
                                                      fontSize: 14,
                                                      color: model()
                                                          .InterRegular[index])),
                                            ),
                                            const Spacer(),
                                            Image.asset(
                                              'assets/call.png', height: 16,
                                              color: const Color(0xffC6C8CB),),
                                            const SizedBox(width: 20,),
                                            Image.asset(
                                                'assets/sms.png', height: 16),
                                            const SizedBox(width: 20,),
                                            Image.asset(
                                              'assets/more.png', height: 16,
                                              color: const Color(0xffC6C8CB),)
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ]
                    )
                ),

              ],
            ),
          ),
        ],
      );
    } else {
      return DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Column(
          children: [
            Row(
              children: [

                const Spacer(),
                InkWell(
                  onTap: () {

                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: notifire.getbgcolor11,),
                    padding: const EdgeInsets.all(11),
                    child: Row(
                      children: [
                        Image.asset('assets/import.png', height: 16,),
                        const SizedBox(width: 5,),
                        const Text('Import', style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'InterRegular',
                            fontWeight: FontWeight.w600, color: Color(
                            0xff727880)
                        ),)
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10,),
                InkWell(
                  onTap: () {

                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: notifire.getbgcolor11,),
                    padding: const EdgeInsets.all(11),
                    child: Center(
                      child: Row(
                        children: [
                          Image.asset('assets/export.png', height: 16,),
                          const SizedBox(width: 5,),
                          const Text('Export', style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'InterRegular',
                              fontWeight: FontWeight.w600,
                              color: Color(0xff727880)
                          ),)
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
                      borderRadius: BorderRadius.circular(11),
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
                const SizedBox(
                  width: 10,
                ),
                PopupMenuButton(
                  tooltip: '',
                  offset: const Offset(10, 50),
                  shape:
                  RoundedRectangleBorder(
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
                        child: SingleChildScrollView(
                          child: StatefulBuilder(builder: (context, setState) {
                            return Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('Add Customer', style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'InterRegular',
                                    fontWeight: FontWeight.w500,
                                    color: notifire.getblackcolor,),),
                                  const SizedBox(height: 15,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Text('Customer Name',
                                        style: TextStyle(fontSize: 12,
                                            fontFamily: 'InterRegular',
                                            color: Color(0xff727880),
                                            fontWeight: FontWeight.w600),),
                                      const SizedBox(height: 5,),
                                      Container(
                                        height: 45,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                12),
                                            border: Border.all(
                                                color: notifire.getgrey1)),
                                        child: TextField(
                                          style: TextStyle(
                                            color: notifire.getblackcolor,),
                                          decoration: InputDecoration(
                                            hintText: 'Enter Name',
                                            hintStyle: const TextStyle(
                                                color: Color(0xffC6C8CB),
                                                fontSize: 15),
                                            contentPadding: const EdgeInsets
                                                .only(
                                                left: 20, right: 20),
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius
                                                    .circular(12),
                                                borderSide: BorderSide(
                                                    color: grey2)),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius: BorderRadius
                                                    .circular(12)),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: blue),
                                                borderRadius: BorderRadius
                                                    .circular(12)),
                                          ),
                                        ),
                                      ),

                                    ],),
                                  const SizedBox(height: 10,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Text('Phone Number',
                                        style: TextStyle(fontSize: 12,
                                            fontFamily: 'InterRegular',
                                            color: Color(0xff727880),
                                            fontWeight: FontWeight.w600),),
                                      const SizedBox(height: 5,),
                                      Container(
                                        height: 45,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                12),
                                            border: Border.all(
                                                color: notifire.getgrey1)),
                                        child: TextField(
                                          style: const TextStyle(),
                                          decoration: InputDecoration(
                                            hintText: 'Enter Phone Number',
                                            hintStyle: const TextStyle(
                                                color: Color(0xffC6C8CB),
                                                fontSize: 15),
                                            contentPadding: const EdgeInsets
                                                .only(
                                                left: 20, right: 20),
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius
                                                    .circular(12),
                                                borderSide: BorderSide(
                                                    color: grey2)),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius: BorderRadius
                                                    .circular(12)),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: blue),
                                                borderRadius: BorderRadius
                                                    .circular(12)),
                                          ),
                                        ),
                                      ),

                                    ],),
                                  const SizedBox(height: 10,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Text('Email', style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'InterRegular',
                                          color: Color(0xff727880)),),
                                      const SizedBox(height: 5,),
                                      Container(
                                        height: 45,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                12),
                                            border: Border.all(
                                                color: notifire.getgrey1)),
                                        child: TextField(
                                          style: TextStyle(
                                            color: notifire.getblackcolor,),
                                          decoration: InputDecoration(
                                            hintText: 'Enter Email',
                                            hintStyle: const TextStyle(
                                                color: Color(0xffC6C8CB),
                                                fontSize: 15),
                                            contentPadding: const EdgeInsets
                                                .only(
                                                left: 20, right: 20),
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius
                                                    .circular(12),
                                                borderSide: BorderSide(
                                                    color: grey2)),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius: BorderRadius
                                                    .circular(12)),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: blue),
                                                borderRadius: BorderRadius
                                                    .circular(12)),
                                          ),
                                        ),
                                      ),

                                    ],),
                                  const SizedBox(height: 10,),
                                  const Text('Join Date', style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'InterRegular',
                                      color: Color(0xff727880),
                                      fontWeight: FontWeight.w600),),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          height: 45,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: notifire.getgrey1
                                              ),
                                              borderRadius: BorderRadius
                                                  .circular(15)),
                                          child: TextField(
                                            onTap: () {
                                              buildDialog();
                                            },
                                            controller: dateController1,
                                            readOnly: true,
                                            keyboardType: TextInputType
                                                .datetime,
                                            decoration: InputDecoration(
                                              suffixIcon: Image.asset(
                                                  AppContent.calendar,
                                                  scale: 3.5,
                                                  color: const Color(
                                                      0xff9DA2A7)),
                                              hintText:
                                              "${selectedDate1
                                                  .day}-${selectedDate1
                                                  .month}-${selectedDate1
                                                  .year}",
                                              hintStyle: TextStyle(
                                                  color: notifire.getblackcolor,
                                                  fontFamily: 'UrbanistBold',
                                                  fontSize: 15),
                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius
                                                      .circular(
                                                      12),
                                                  borderSide: BorderSide(
                                                      color: grey2)),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius: BorderRadius
                                                      .circular(
                                                      12)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: blue),
                                                  borderRadius: BorderRadius
                                                      .circular(
                                                      12)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10,),
                                  const Text('Status', style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'InterRegular',
                                      color: Color(0xff727880),
                                      fontWeight: FontWeight.w600),),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton2<String>(
                                            isExpanded: true,
                                            hint: Row(
                                              children: [
                                                const SizedBox(
                                                  width: 4,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    'COD',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontFamily: 'InterRegular',
                                                      color: notifire
                                                          .getblackcolor,
                                                    ),
                                                    overflow: TextOverflow
                                                        .ellipsis,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            items: items3
                                                .map((String item) =>
                                                DropdownMenuItem<String>(
                                                  value: item,
                                                  child: Text(
                                                    item,
                                                    style:  TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight
                                                          .bold,
                                                      color: notifire.getblackcolor,
                                                    ),
                                                    overflow: TextOverflow
                                                        .ellipsis,
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
                                              width: Get.width * 0.2,
                                              padding: const EdgeInsets.only(
                                                  left: 14, right: 14),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius
                                                    .circular(14),
                                                border: Border.all(
                                                    color: notifire.getgrey1
                                                ),

                                              ),
                                              elevation: 0,
                                            ),
                                            iconStyleData: const IconStyleData(
                                              icon: Icon(
                                                Icons
                                                    .keyboard_arrow_down_outlined,
                                                color: Color(0xff9DA2A7),
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
                                                borderRadius: BorderRadius
                                                    .circular(14),
                                                color: notifire.getbgcolor11,
                                              ),
                                              offset: const Offset(-20, 0),
                                              scrollbarTheme: ScrollbarThemeData(
                                                radius: const Radius.circular(
                                                    40),
                                                thickness:
                                                MaterialStateProperty.all<
                                                    double>(6),
                                                thumbVisibility:
                                                MaterialStateProperty.all<bool>(
                                                    true),
                                              ),
                                            ),
                                            menuItemStyleData: const MenuItemStyleData(
                                              height: 40,
                                              padding: EdgeInsets.only(
                                                  left: 14, right: 14),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 15,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Get.back();
                                        },
                                        child: Container(

                                          padding: const EdgeInsets.all(12),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                12),
                                            color: notifire.getbgcolor10,),
                                          child: const Center(
                                              child: Text('Cancel',
                                                style: TextStyle(fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: 'InterRegular',
                                                    color: Color(
                                                        0xff727880)),)),
                                        ),
                                      ),
                                      const SizedBox(width: 10,),
                                      InkWell(
                                        onTap: () {

                                        },
                                        child: Container(

                                          padding: const EdgeInsets.all(12),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius
                                                  .circular(12),
                                              color: const Color(0xff595FE5)),
                                          child: const Center(
                                              child: Text('Add Customer',
                                                  style: TextStyle(
                                                      fontFamily: 'InterRegular',
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontWeight: FontWeight
                                                          .w600))),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          },),
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
                        const SizedBox(width: 10,),
                        const Text('Add Customer', style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'InterRegular',
                            fontWeight: FontWeight.w600,
                            color: Colors.white),)
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
                      indicator: BoxDecoration(
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
                                height: 12, color: notifire.getblackcolor,
                              )),
                        ),
                        Tab(
                          child: Tab(
                              child: SvgPicture.asset(
                                'assets/element-3.svg',
                                height: 12, color: notifire.getblackcolor,
                              )),
                        )
                      ]),

                )
              ],
            ),
            const SizedBox(height: 20,),
            SizedBox(
                height: Get.height * 1.11,
                child: TabBarView(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 705,
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
                                                  // columnWidths: const {
                                                  //   0: FixedColumnWidth(100),
                                                  //   1: FixedColumnWidth(240),
                                                  //   2: FixedColumnWidth(220),
                                                  //   3: FixedColumnWidth(210),
                                                  //   4: FixedColumnWidth(240),
                                                  //   5: FixedColumnWidth(140),
                                                  //   6: FixedColumnWidth(200),
                                                  //   7: FixedColumnWidth(100),
                                                  //   8: FixedColumnWidth(130),
                                                  // },
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
                                                          title: "Custmer Name",
                                                          iscenter: false),
                                                      dataColumn1(
                                                          title: "PHone",
                                                          iscenter: false),
                                                      dataColumn1(
                                                          title: "Email",
                                                          iscenter: false),
                                                      dataColumn1(
                                                          title: "Joined Date",
                                                          iscenter: true),
                                                      dataColumn1(
                                                          title: "Balance",
                                                          iscenter: true),
                                                      dataColumn1(
                                                          title: "Orders",
                                                          iscenter: true),
                                                      dataColumn1(
                                                          title: "Status",
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
                                                              child: Text(
                                                                  listtiletitle[a],
                                                                  style: TextStyle(color: notifire.getblackcolor,fontSize: 13,fontFamily: 'InterRegular')),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets.symmetric(
                                                                  vertical: 25),
                                                              child: Text(stoek[a],
                                                                  style: TextStyle(color: notifire.getblackcolor,  fontFamily: 'InterRegular',
                                                                    fontSize: 13,)),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets.symmetric(
                                                                  vertical: 25),
                                                              child: Center(
                                                                child: Text(
                                                                  '11 Sep 2024',
                                                                  style: TextStyle(
                                                                    fontFamily: 'InterRegular',
                                                                    fontSize: 13,
                                                                    color: notifire.getblackcolor,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                                padding: const EdgeInsets.symmetric(
                                                                    vertical: 25),
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  children: [

                                                                    Text(
                                                                      ster[a],
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
                                                                  Price[a],
                                                                  style: TextStyle(
                                                                      fontFamily: 'InterRegular',
                                                                      fontWeight: FontWeight.w600,
                                                                      color: notifire.getblackcolor,
                                                                      fontSize: 13),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets.symmetric(
                                                                  vertical: 25),
                                                              child:       Center(
                                                                child:  Text(Orders[a], style: TextStyle(fontSize: 14,
                                                                    fontFamily: 'InterRegular',
                                                                    fontWeight: FontWeight.w500,
                                                                    color: name2[a])),
                                                              )
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
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: constraints < 1200 ? 3 : 4,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: model().custom.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {},
                            child: Container(

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: notifire.getgrey1,),
                                color: notifire.getbgcolor11,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(14),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceAround,
                                  children: [
                                    CircleAvatar(
                                      radius: 30,
                                      backgroundImage: AssetImage(
                                          model().custom[index]),),

                                    Text(model().custome[index],
                                      style: TextStyle(fontSize: 18,
                                        fontFamily: 'InterRegular',
                                        color: notifire.getblackcolor,),),

                                    Text(model().custo[index],
                                      style: const TextStyle(fontSize: 14,
                                        fontFamily: 'InterRegular',
                                        color: Color(0xff727880),),),

                                    Text(model().customs[index],
                                      style: const TextStyle(fontSize: 14,
                                          fontFamily: 'InterRegular',
                                          color: Color(0xff727880)),),

                                    Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(12),
                                          decoration: BoxDecoration(
                                            color: model().Custo[index],
                                            borderRadius: BorderRadius.circular(
                                                16),
                                          ),
                                          child: Text(model().Active[index],
                                              style: TextStyle(
                                                  fontFamily: 'InterRegular',
                                                  fontSize: 14,
                                                  color: model()
                                                      .InterRegular[index])),
                                        ),
                                        const Spacer(),
                                        Image.asset(
                                          'assets/call.png', height: 16,
                                          color: const Color(0xffC6C8CB),),
                                        const SizedBox(width: 20,),
                                        Image.asset(
                                            'assets/sms.png', height: 16),
                                        const SizedBox(width: 20,),
                                        Image.asset(
                                          'assets/more.png', height: 16,
                                          color: const Color(0xffC6C8CB),)
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ]
                )
            )
          ],
        ),
      );
    }
  }


}

