// ignore_for_file: deprecated_member_use, non_constant_identifier_names
// ignore_for_file: prefer_const_constructors, file_names, camel_case_types


import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';


import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

// import 'package:html_editor_enhanced/html_editor.dart';
import 'package:textfield_tags/textfield_tags.dart';
import 'package:provider/provider.dart';
import 'package:evcp/confing/list.dart';
import 'package:evcp/controller/page_controller.dart';
import 'package:evcp/screen/Dashboard/Dashboard_main.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';


import '../../confing/Rtl.dart';
import '../../confing/colors.dart';
import '../../confing/image.dart';
import '../../confing/notifier.dart';

import '../de.dart';

import '../login/login.dart';



class Grid extends StatefulWidget {
  const Grid({super.key});

  @override
  State<Grid> createState() => _GridState();
}

class _GridState extends State<Grid> {
  int selectIndex = 0;
  late ColorNotifier notifire;
  bool tap = false;
  SampleItem? selectedMenu;
  DateTime selectedDate = DateTime.now();
  InboxController inboxController = Get.put(InboxController());
  TextEditingController dateController = TextEditingController();

  DateRangePickerController dateSelecter = DateRangePickerController();
  TextEditingController dateController1 = TextEditingController();

  // HtmlEditorController controller = HtmlEditorController();
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


  var selectedPageNumber = 4;
  bool isActive = false;
  String? selectedValue;
  String? selectedValue1;
  String? selectedValue2;
  String? selectedValue3;
  String? selectedValue4;
  bool container = false;

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifier>(context, listen: true);
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 700) {
          return Container(

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
            decoration: BoxDecoration(
                color: notifire.getbgcolor10
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    container2(constraints.maxWidth),
                  ],
                ),
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

  List dataa = [];
  List dataa1 = [];

  Widget firstContainer({context, constraints}) {
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
              Text('products Grid', style: TextStyle(
                  color: notifire.getblackcolor,
                  fontSize: 14,
                  fontFamily: 'InterRegular'),),
            ],
          ),
          const SizedBox(height: 20,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  flex: 5,
                  child: container ? screen2(constraints) : container2(
                      constraints)),
            ],
          ),
        ],
      ),
    );
  }

  final _stringTagController = StringTagController();
  bool isdark = false;

  InvoiceController invoiceController = Get.put(InvoiceController());
  List listtiletitle = [
    "SP-37695",
    "SP-37695",
    "SP-75849",
    "SP-47596",
    "SP-35484",
    "SP-67795",
    "SP-75849",
    "SP-97345",
    "SP-45633",
    "SP-13556",
    "SP-65557",
    "SP-97776",
    "SP-45678",
    "SP-75849",
    "SP-07655",
    "SP-78646",
    "SP-86788",
    "SP-67887",
  ];
  List imageintable = [
    'assets/Brand Logo.png',
    'assets/Brand Logo1.png',
    'assets/Brand Logo2.png',
    'assets/Brand Logo4.png',
    'assets/Brand Logo5.png',
    'assets/Brand Logo.png',
    'assets/Brand Logo1.png',
    'assets/Brand Logo5.png',
    'assets/Media(1)1.png',
    'assets/Brand Logo2.png',
    'assets/Brand Logo1.png',
    'assets/Media(22).png',
    'assets/Brand Logo.png',
    'assets/Media(1)1.png',
    'assets/Brand Logo5.png',
    'assets/Media(22).png',
    'assets/Brand Logo2.png',
    'assets/Brand Logo1.png',
  ];
  List proname = [
    'DJI Mavic Pro 2',
    'Coach Tabby for sale',
    'Playstation 4 ',
    'Air Jordan 1',
    'Macbook Pro 16 inch',
    'DJI Mavic 2',
    'Coach Tabby for sale',
    'Playstation 4 ',
    'Air Jordan 1',
    'Macbook Pro 14 inch',
    'DJI Mavic Pro 2',
    'Coach Tabby for sale',
    'Playstation 6 ',
    'Coach Tabby for sale',
    'Playstation 2 ',
    'Air Jordan 1',
    'Macbook Pro 16 inch',
    'Playstation 5 ',
  ];
  List stoek = [
    '23,567',
    '12,000',
    '1,200',
    '24,677',
    '2,402',
    '1,100',
    '12,233',
    '23,567',
    '12,000',
    '1,200',
    '24,677',
    '2,402',
    '1,100',
    '12,233',
    '2,402',
    '1,100',
    '12,233',
    '23,567',
  ];
  List Orders = [
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
  List ster = [
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
  List Price = [
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
  List name1 = [
    'Furniture',
    'Grocery',
    'Watches',
    'Furniture',
    'Furniture',
    'Grocery',
    'Watches',
    'Furniture',
    'Furniture',
    'Grocery',
    'Watches',
    'Furniture',
    'Furniture',
    'Grocery',
    'Watches',
    'Furniture',
    'Furniture',
    'Grocery',
  ];
  List name2 = [
    'Fashion',
    'Furniture',
    'Grocery',
    'Watches',
    'Fashion',
    'Furniture',
    'Grocery',
    'Watches',
    'Furniture',
    'Grocery',
    'Watches',
    'Fashion',
    'Furniture',
    'Grocery',
    'Watches',
    'Watches',
    'Furniture',
    'Grocery',
  ];

  Widget container2(constraints) {
    return
      constraints < 600 ?
      Column(
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
              Text('E-commerce', style: TextStyle(
                  color: greyy, fontSize: 14, fontFamily: 'InterRegular'),),
              const SizedBox(width: 10,),
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: greyy,),),
              const SizedBox(width: 10,),
              Text('Grid', style: TextStyle(color: notifire.getblackcolor,
                  fontSize: 14,
                  fontFamily: 'InterRegular'),),
            ],
          ),
          const SizedBox(height: 20,),
          DefaultTabController(
            length: 2,
            initialIndex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        height: 50,
                        padding: EdgeInsets.zero,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(10),
                          color: notifire.getbgcolor11,),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const SizedBox(
                                  width: 1,
                                ),
                                TextButton(
                                  style: const ButtonStyle(
                                      shape: MaterialStatePropertyAll(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft: Radius.circular(
                                                      10),
                                                  topLeft:
                                                  Radius.circular(10))))),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Published',
                                        style: TextStyle(
                                          fontFamily: 'InterRegular',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          color: notifire.getblackcolor,),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(6),
                                          color: notifire.Getblg2,),
                                        padding: const EdgeInsets.all(5),
                                        child: const Text('126',
                                            style: TextStyle(
                                                fontFamily: 'InterRegular',
                                                fontSize: 8,
                                                color: Color(0xff9DA2A7))),
                                      )
                                    ],
                                  ),
                                  onPressed: () {},
                                ),
                                Container(
                                  height: 38,
                                  width: 1,
                                  decoration: BoxDecoration(
                                    color: notifire.getgrey1,),
                                ),
                                TextButton(
                                  style: const ButtonStyle(),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Sold Out',
                                        style: TextStyle(
                                          fontFamily: 'InterRegular',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          color: notifire.getblackcolor,),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(6),
                                          color: notifire.Getblg2,),
                                        padding: const EdgeInsets.all(5),
                                        child: const Text('789',
                                            style: TextStyle(
                                                fontFamily: 'InterRegular',
                                                fontSize: 8,
                                                color: Color(0xff9DA2A7))),
                                      )
                                    ],
                                  ),
                                  onPressed: () {},
                                ),
                                Container(
                                  height: 38,
                                  width: 1,
                                  decoration: BoxDecoration(
                                    color: notifire.getgrey1,),
                                ),
                                TextButton(
                                  style: const ButtonStyle(),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Draft',
                                        style: TextStyle(
                                          fontFamily: 'InterRegular',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          color: notifire.getblackcolor,),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(6),
                                          color: notifire.Getblg2,),
                                        padding: const EdgeInsets.all(5),
                                        child: const Text('166',
                                            style: TextStyle(
                                                fontFamily: 'InterRegular',
                                                fontSize: 8,
                                                color: Color(0xff9DA2A7))),
                                      )
                                    ],
                                  ),
                                  onPressed: () {},
                                ),
                                Container(
                                  height: 38,
                                  width: 1,
                                  decoration: BoxDecoration(
                                    color: notifire.getgrey1,),
                                ),
                                TextButton(
                                  style: const ButtonStyle(
                                      shape: MaterialStatePropertyAll(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(10),
                                                  bottomRight:
                                                  Radius.circular(10))))),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Deleted',
                                        style: TextStyle(
                                          fontFamily: 'InterRegular',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          color: notifire.getblackcolor,),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        width: 14,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(6),
                                          color: notifire.Getblg2,),
                                        padding: const EdgeInsets.all(5),
                                        child: const Center(
                                            child: Text('9',
                                                style: TextStyle(
                                                    fontFamily: 'InterRegular',
                                                    fontSize: 8,
                                                    color: Color(0xff9DA2A7)))),
                                      )
                                    ],
                                  ),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      children: [

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
                                    scale: 4, color: notifire.getblackcolor,
                                  )),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () =>
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (
                                  context) => screen2(constraints),)),
                          child: Container(
                            padding: const EdgeInsets.all(11),
                            decoration: BoxDecoration(
                                color: const Color(0xff595FE5),
                                borderRadius: BorderRadius.circular(12)),
                            child: Row(children: [
                              Image.asset('assets/add.png', scale: 4),
                            ]),
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
                              labelColor: Colors.red,
                              tabs: [
                                Tab(
                                  child: Tab(
                                      child: SvgPicture.asset(
                                        'assets/row-vertical.svg',
                                        height: 12,
                                        color: notifire.getblackcolor,
                                      )),
                                ),
                                Tab(
                                  child: Tab(
                                      child: SvgPicture.asset(
                                        'assets/element-3.svg',
                                        height: 12,
                                        color: notifire.getblackcolor,
                                      )),
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
                                height: 750,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: notifire.getbgcolor11,
                                      borderRadius: BorderRadius.circular(10)   ),
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
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.start,
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
                                                                  title: "Product ID",
                                                                  iscenter: false),
                                                              dataColumn1(
                                                                  title: "Product Name",
                                                                  iscenter: false),
                                                              dataColumn1(
                                                                  title: "Published",
                                                                  iscenter: false),
                                                              dataColumn1(
                                                                  title: "in Stocks",
                                                                  iscenter: true),
                                                              dataColumn1(
                                                                  title: "Orders",
                                                                  iscenter: true),
                                                              dataColumn1(
                                                                  title: "Rating",
                                                                  iscenter: true),
                                                              dataColumn1(
                                                                  title: "Price",
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
                                                                          vertical: 6,horizontal: 0),
                                                                      child:
                                                                      StatefulBuilder(
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
                                                                          vertical: 20),
                                                                      child: Text(
                                                                          listtiletitle[a],
                                                                          style: TextStyle(color: notifire.getblackcolor,fontSize: 13,fontFamily: 'InterRegular')),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets.symmetric(
                                                                        vertical: 3,),
                                                                      child: ListTile(

                                                                        leading:  Padding(
                                                                          padding: const EdgeInsets.only(top:10),
                                                                          child: Image.asset(imageintable[a],   height: 40,),
                                                                        ),
                                                                        title: Padding(
                                                                          padding: const EdgeInsets.only(bottom: 4),
                                                                          child: Text(proname[a],
                                                                              overflow: TextOverflow.ellipsis,
                                                                              style: TextStyle(
                                                                                fontSize: 13,
                                                                                color: notifire.getblackcolor,
                                                                                fontFamily: 'InterRegular',
                                                                              )),
                                                                        ),
                                                                        subtitle: Padding(
                                                                          padding: const EdgeInsets.only(bottom: 5),
                                                                          child: Row(
                                                                            children: [
                                                                              Container(
                                                                                padding: const EdgeInsets.only(top: 3,bottom:3 ,left:6, right:6),
                                                                                height: 22,
                                                                                decoration: BoxDecoration(
                                                                                    color: notifire.getbgcolor10,
                                                                                    borderRadius: BorderRadius.circular(8)),
                                                                                child:  Center(
                                                                                    child: Text(
                                                                                      name1[a],
                                                                                      style: TextStyle(
                                                                                          fontSize: 8,
                                                                                          fontFamily: 'InterRegular',
                                                                                          color: notifire.getblackcolor),
                                                                                    )),
                                                                              ),
                                                                              SizedBox(
                                                                                width: 5,
                                                                              ),
                                                                              Container(
                                                                                padding: const EdgeInsets.only(top: 3,bottom:3 ,left:6, right:6),
                                                                                height: 22,
                                                                                decoration: BoxDecoration(
                                                                                    color: notifire.getbgcolor10,
                                                                                    borderRadius: BorderRadius.circular(8)),
                                                                                child:  Center(
                                                                                    child: Text(
                                                                                      name2[a],
                                                                                      style: TextStyle(
                                                                                          fontSize: 8,
                                                                                          fontFamily: 'InterRegular',
                                                                                          color: notifire.getblackcolor),
                                                                                    )),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                        padding: const EdgeInsets.symmetric(
                                                                            vertical: 20,horizontal: 8),
                                                                        child: Row(
                                                                          children: [
                                                                            Text(
                                                                              '21 Aug 2022',
                                                                              style: TextStyle(
                                                                                  color: notifire.getblackcolor,
                                                                                  fontFamily: 'InterRegular',
                                                                                  fontSize: 13),
                                                                            ),
                                                                            SizedBox(
                                                                              width: 5,
                                                                            ),
                                                                            Text(
                                                                              '10:09 am',
                                                                              style: TextStyle(
                                                                                  color: Color(0xff9DA2A7),
                                                                                  fontFamily: 'InterRegular',
                                                                                  fontSize: 13),
                                                                            )
                                                                          ],
                                                                        )
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets.symmetric(
                                                                          vertical: 20),
                                                                      child: Center(
                                                                        child: Text(stoek[a],
                                                                            style: TextStyle(color: notifire.getblackcolor,  fontFamily: 'InterRegular',
                                                                              fontSize: 13,)),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets.symmetric(
                                                                          vertical: 20),
                                                                      child: Row(
                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            Orders[a],
                                                                            style: TextStyle(
                                                                              fontFamily: 'InterRegular',
                                                                              fontSize: 13,
                                                                              color: notifire.getblackcolor,
                                                                            ),
                                                                          )
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                        padding: const EdgeInsets.symmetric(
                                                                            vertical: 20),
                                                                        child: Row(
                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                          children: [
                                                                            SvgPicture.asset('assets/star.svg'),
                                                                            const SizedBox(
                                                                              width: 6,
                                                                            ),
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
                                                                          vertical: 20),
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
                                                                      padding: const EdgeInsets.symmetric(vertical: 20),
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
                                              )
                                          )
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
                                crossAxisCount: 1,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                mainAxisExtent: Get.height * 0.5),
                            itemCount: 3,
                            // shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return InkWell(
                          
                                child: Container(
                                 
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: notifire.getbgcolor11,
                          
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment
                                        .start,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Image.asset(model().proimage[index]),
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          mainAxisAlignment: MainAxisAlignment
                                              .spaceAround,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  'SP-37695',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily: 'InterRegular',
                                                      color: Color(
                                                          0xff727880)),
                                                ),
                                                const Spacer(),
                                                SvgPicture.asset(
                                                  'assets/star.svg',
                                                ),
                                                const SizedBox(
                                                  width: 3,
                                                ),
                                                Text(model().prolist3[index],
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: notifire
                                                            .getblackcolor,
                                                        fontFamily: 'InterRegular')),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              model().prolist[index],
                                              style: TextStyle(
                                                  fontFamily: 'InterRegular',
                                                  fontSize: 16,
                                                  color: notifire
                                                      .getblackcolor,
                                                  fontWeight: FontWeight
                                                      .w600),
                                            ),
                                            const SizedBox(
                                              height: 2,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  padding: const EdgeInsets
                                                      .all(5),
                          
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xffF5F5F5),
                                                      borderRadius: BorderRadius
                                                          .circular(10)),
                                                  child: const Center(
                                                      child: Text(
                                                        'Furniture',
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            fontFamily: 'InterRegular',
                                                            color: Color(
                                                                0xff727880)),
                                                      )),
                                                ),
                                                const SizedBox(
                                                  width: 3,
                                                ),
                                                Container(
                                                  padding: const EdgeInsets
                                                      .all(5),
                          
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xffF5F5F5),
                                                      borderRadius: BorderRadius
                                                          .circular(10)),
                                                  child: const Center(
                                                      child: Text(
                                                        'Grocery',
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            fontFamily: 'InterRegular',
                                                            color: Color(
                                                                0xff727880)),
                                                      )),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/Vector1.svg'),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  model().prodlist[index],
                                                  style: const TextStyle(
                                                      fontFamily: 'InterRegular',
                                                      fontSize: 13,
                                                      color: Color(
                                                          0xff727880)),
                                                ),
                                                const Spacer(),
                                                const SizedBox(
                                                  width: 175,
                                                  child: StepProgressIndicator(
                                                    totalSteps: 200,
                                                    currentStep: 80,
                                                    size: 5,
                                                    padding: 0,
                                                    selectedColor: Color(
                                                        0xffEEEEEE),
                                                    unselectedColor: Color(
                                                        0xffF8BEC1),
                                                    roundedEdges: Radius
                                                        .circular(10),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 12,
                                                ),
                                                Text(
                                                  model().prolist1[index],
                                                  style: const TextStyle(
                                                      fontFamily: 'InterRegular',
                                                      color: Color(
                                                          0xff9DA2A7),
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/shopping-cart.svg'),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  model().prodlist1[index],
                                                  style: const TextStyle(
                                                      fontFamily: 'InterRegular',
                                                      fontSize: 13,
                                                      color: Color(
                                                          0xff727880)),
                                                ),
                                                const Spacer(),
                                                const SizedBox(
                                                  width: 175,
                                                  child: StepProgressIndicator(
                                                    totalSteps: 40,
                                                    currentStep: 20,
                                                    size: 5,
                                                    padding: 0,
                                                    selectedColor: Color(
                                                        0xffb0e4c8),
                                                    unselectedColor: Color(
                                                        0xffEEEEEE),
                                                    roundedEdges: Radius
                                                        .circular(10),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 12,
                                                ),
                                                Text(
                                                  model().prolist2[index],
                                                  style: const TextStyle(
                                                      fontFamily: 'InterRegular',
                                                      color: Color(
                                                          0xff9DA2A7),
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(12),
                                        decoration: const BoxDecoration(
                                            color: Color(0xff595FE5),
                                            borderRadius: BorderRadius.only(
                                                bottomRight: Radius.circular(
                                                    12),
                                                bottomLeft: Radius.circular(
                                                    12))),
                                        child: Row(
                                          children: [
                                            Text(
                                              model().prodlist2[index],
                                              style: const TextStyle(
                                                  fontFamily: 'InterRegular',
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight
                                                      .w600),
                                            ),
                                            const Spacer(),
                                            const Text(
                                              '11 Sep 2022 10:09 am',
                                              style: TextStyle(
                                                fontFamily: 'InterRegular',
                                                fontSize: 12,
                                                color: Colors.white,),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Image.asset(
                                              'assets/more.png',
                                              height: 24,
                                              color: Colors.white,
                                            )
                                          ],
                                        ),
                                      )
                                    ],
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
      ) :
      DefaultTabController(
        length: 2,
        initialIndex: 1,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 40,
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(color: notifire.getbgcolor11,
                    borderRadius: BorderRadiusDirectional.circular(10),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 1,
                          ),
                          TextButton(
                            style: const ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10),
                                            topLeft:
                                            Radius.circular(10))))),
                            child: Row(
                              children: [
                                Text(
                                  'Published',
                                  style: TextStyle(
                                    fontFamily: 'InterRegular',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: notifire.getblackcolor,),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(6),
                                    color: notifire.Getblg2,),
                                  padding: const EdgeInsets.all(5),
                                  child: const Text('126',
                                      style: TextStyle(
                                          fontFamily: 'InterRegular',
                                          fontSize: 8,
                                          color: Color(0xff9DA2A7))),
                                )
                              ],
                            ),
                            onPressed: () {},
                          ),
                          Container(
                            height: 38,
                            width: 1,
                            decoration: BoxDecoration(
                              color: notifire.getgrey1,),
                          ),
                          TextButton(
                            style: const ButtonStyle(),
                            child: Row(
                              children: [
                                Text(
                                  'Sold Out',
                                  style: TextStyle(
                                    fontFamily: 'InterRegular',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: notifire.getblackcolor,),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(6),
                                    color: notifire.Getblg2,),
                                  padding: const EdgeInsets.all(5),
                                  child: const Text('789',
                                      style: TextStyle(
                                          fontFamily: 'InterRegular',
                                          fontSize: 8,
                                          color: Color(0xff9DA2A7))),
                                )
                              ],
                            ),
                            onPressed: () {},
                          ),
                          Container(
                            height: 38,
                            width: 1,
                            decoration: BoxDecoration(
                              color: notifire.getgrey1,),
                          ),
                          TextButton(
                            style: const ButtonStyle(),
                            child: Row(
                              children: [
                                Text(
                                  'Draft',
                                  style: TextStyle(
                                    fontFamily: 'InterRegular',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: notifire.getblackcolor,),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(6),
                                    color: notifire.Getblg2,),
                                  padding: const EdgeInsets.all(5),
                                  child: const Text('166',
                                      style: TextStyle(
                                          fontFamily: 'InterRegular',
                                          fontSize: 8,
                                          color: Color(0xff9DA2A7))),
                                )
                              ],
                            ),
                            onPressed: () {},
                          ),
                          Container(
                            height: 38,
                            width: 1,
                            decoration: BoxDecoration(
                              color: notifire.getgrey1,),
                          ),
                          TextButton(
                            style: const ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(10),
                                            bottomRight:
                                            Radius.circular(10))))),
                            child: Row(
                              children: [
                                Text(
                                  'Deleted',
                                  style: TextStyle(
                                    fontFamily: 'InterRegular',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: notifire.getblackcolor,),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  width: 14,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(6),
                                    color: notifire.Getblg2,),
                                  padding: const EdgeInsets.all(5),
                                  child: const Center(
                                      child: Text('9',
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              fontSize: 8,
                                              color: Color(0xff9DA2A7)))),
                                )
                              ],
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
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
                const SizedBox(
                  width: 10,
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
                  child: Container(
                    padding: const EdgeInsets.all(11),
                    decoration: BoxDecoration(
                        color: const Color(0xff595FE5),
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(children: [
                      Image.asset('assets/add.png', scale: 4),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Add Product',
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'InterRegular',
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      )
                    ]),
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
                      indicator: BoxDecoration(
                          color: notifire.Tab,
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(12),
                              topRight: Radius.circular(12),
                              bottomLeft: Radius.circular(12),
                              topLeft: Radius.circular(12))),
                      isScrollable: true,
                      physics: const NeverScrollableScrollPhysics(),

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
                            height: 740,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: notifire.getbgcolor11,
                                  borderRadius: BorderRadius.circular(10)   ),
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
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  children: [
                                                    Table(
                                                      border: TableBorder(horizontalInside: BorderSide(color: notifire.Getblg2)),
                                                      // columnWidths: const {
                                                      //   0: FixedColumnWidth(100),
                                                      //   1: FixedColumnWidth(140),
                                                      //   2: FixedColumnWidth(240),
                                                      //   3: FixedColumnWidth(200),
                                                      //   4: FixedColumnWidth(140),
                                                      //   5: FixedColumnWidth(140),
                                                      //   6: FixedColumnWidth(200),
                                                      //   7: FixedColumnWidth(150),
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
                                                              title: "Product ID",
                                                              iscenter: false),
                                                          dataColumn1(
                                                              title: "Product Name",
                                                              iscenter: false),
                                                          dataColumn1(
                                                              title: "Published",
                                                              iscenter: false),
                                                          dataColumn1(
                                                              title: "in Stocks",
                                                              iscenter: true),
                                                          dataColumn1(
                                                              title: "Orders",
                                                              iscenter: true),
                                                          dataColumn1(
                                                              title: "Rating",
                                                              iscenter: true),
                                                          dataColumn1(
                                                              title: "Price",
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
                                                                      vertical: 8,horizontal: 0),
                                                                  child:
                                                                  StatefulBuilder(
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
                                                                      vertical: 13),
                                                                  child: Text(
                                                                      listtiletitle[a],
                                                                      style: TextStyle(color: notifire.getblackcolor,fontSize: 13,fontFamily: 'InterRegular')),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets.symmetric(
                                                                    vertical: 8,),
                                                                  child: ListTile(

                                                                    leading:  Image.asset(imageintable[a],   height: 40,),
                                                                    title: Padding(
                                                                      padding: const EdgeInsets.only(bottom: 2),
                                                                      child: Text(proname[a],
                                                                          overflow: TextOverflow.ellipsis,
                                                                          style: TextStyle(
                                                                            fontSize: 13,
                                                                            color: notifire.getblackcolor,
                                                                            fontFamily: 'InterRegular',
                                                                          )),
                                                                    ),
                                                                    subtitle: Padding(
                                                                      padding: const EdgeInsets.only(bottom: 2),
                                                                      child: Row(
                                                                        children: [
                                                                          Container(
                                                                            padding: const EdgeInsets.only(top: 3,bottom:3 ,left:6, right:6),
                                                                            height: 22,
                                                                            decoration: BoxDecoration(
                                                                                color: notifire.getbgcolor10,
                                                                                borderRadius: BorderRadius.circular(8)),
                                                                            child:  Center(
                                                                                child: Text(
                                                                                  name1[a],
                                                                                  style: TextStyle(
                                                                                      fontSize: 8,
                                                                                      fontFamily: 'InterRegular',
                                                                                      color: notifire.getblackcolor),
                                                                                )),
                                                                          ),
                                                                          SizedBox(
                                                                            width: 5,
                                                                          ),
                                                                          Container(
                                                                            padding: const EdgeInsets.only(top: 3,bottom:3 ,left:6, right:6),
                                                                            height: 22,
                                                                            decoration: BoxDecoration(
                                                                                color: notifire.getbgcolor10,
                                                                                borderRadius: BorderRadius.circular(8)),
                                                                            child:  Center(
                                                                                child: Text(
                                                                                  name2[a],
                                                                                  style: TextStyle(
                                                                                      fontSize: 8,
                                                                                      fontFamily: 'InterRegular',
                                                                                      color: notifire.getblackcolor),
                                                                                )),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                    padding: const EdgeInsets.symmetric(
                                                                        vertical: 13,horizontal: 8),
                                                                    child: Row(
                                                                      children: [
                                                                        Text(
                                                                          '21 Aug 2022',
                                                                          style: TextStyle(
                                                                              color: notifire.getblackcolor,
                                                                              fontFamily: 'InterRegular',
                                                                              fontSize: 13),
                                                                        ),
                                                                        SizedBox(
                                                                          width: 5,
                                                                        ),
                                                                        Text(
                                                                          '10:09 am',
                                                                          style: TextStyle(
                                                                              color: Color(0xff9DA2A7),
                                                                              fontFamily: 'InterRegular',
                                                                              fontSize: 13),
                                                                        )
                                                                      ],
                                                                    )
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets.symmetric(
                                                                      vertical: 13),
                                                                  child: Center(
                                                                    child: Text(stoek[a],
                                                                        style: TextStyle(color: notifire.getblackcolor,  fontFamily: 'InterRegular',
                                                                          fontSize: 13,)),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets.symmetric(
                                                                      vertical: 13),
                                                                  child: Row(
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    children: [
                                                                      Text(
                                                                        Orders[a],
                                                                        style: TextStyle(
                                                                          fontFamily: 'InterRegular',
                                                                          fontSize: 13,
                                                                          color: notifire.getblackcolor,
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                    padding: const EdgeInsets.symmetric(
                                                                        vertical: 13),
                                                                    child: Row(
                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                      children: [
                                                                        SvgPicture.asset('assets/star.svg'),
                                                                        const SizedBox(
                                                                          width: 6,
                                                                        ),
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
                                                                      vertical: 13),
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
                                                                  padding: const EdgeInsets.symmetric(vertical: 13),
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
                                          )
                                      )
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
                            mainAxisExtent: Get.height * 0.556),
                        itemCount: model().prolist.length,
                        // shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {

                            },
                            child: Container(
                              height: 400,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: notifire.getgrey1,),
                                color: notifire.getbgcolor11,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  Image.asset(model().proimage[index]),
                                  Padding(

                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      mainAxisAlignment: MainAxisAlignment
                                          .start,
                                      children: [
                                        Row(
                                          children: [
                                            const Text(
                                              'SP-37695',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'InterRegular',
                                                  color: Color(0xff727880)),
                                            ),
                                            const Spacer(),
                                            SvgPicture.asset(
                                              'assets/star.svg',
                                            ),
                                            const SizedBox(
                                              width: 3,
                                            ),
                                            Text(model().prolist3[index],
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: notifire
                                                        .getblackcolor,
                                                    fontFamily: 'InterRegular')),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          model().prolist[index],
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              fontSize: 16,
                                              color: notifire.getblackcolor,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(5),

                                              decoration: BoxDecoration(
                                                  color: notifire.getbgcolor10,
                                                  borderRadius: BorderRadius
                                                      .circular(10)),
                                              child: const Center(
                                                  child: Text(
                                                    'Furniture',
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        fontFamily: 'InterRegular',
                                                        color: Color(
                                                            0xff727880)),
                                                  )),
                                            ),
                                            const SizedBox(
                                              width: 3,
                                            ),
                                            Container(
                                              padding: const EdgeInsets.all(5),

                                              decoration: BoxDecoration(
                                                  color: notifire.getbgcolor10,
                                                  borderRadius: BorderRadius
                                                      .circular(10)),
                                              child: const Center(
                                                  child: Text(
                                                    'Grocery',
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        fontFamily: 'InterRegular',
                                                        color: Color(
                                                            0xff727880)),
                                                  )),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                                'assets/Vector1.svg'),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              model().prodlist[index],
                                              style: const TextStyle(
                                                  fontFamily: 'InterRegular',
                                                  fontSize: 13,
                                                  color: Color(0xff727880)),
                                            ),
                                            const Spacer(),
                                            const SizedBox(
                                              width: 175,
                                              child: StepProgressIndicator(
                                                totalSteps: 200,
                                                currentStep: 80,
                                                size: 5,
                                                padding: 0,
                                                selectedColor: Color(
                                                    0xffEEEEEE),
                                                unselectedColor: Color(
                                                    0xffF8BEC1),
                                                roundedEdges: Radius.circular(
                                                    10),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 12,
                                            ),
                                            Text(
                                              model().prolist1[index],
                                              style: const TextStyle(
                                                  fontFamily: 'InterRegular',
                                                  color: Color(0xff9DA2A7),
                                                  fontSize: 12),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                                'assets/shopping-cart.svg'),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              model().prodlist1[index],
                                              style: const TextStyle(
                                                  fontFamily: 'InterRegular',
                                                  fontSize: 13,
                                                  color: Color(0xff727880)),
                                            ),
                                            const Spacer(),
                                            const SizedBox(
                                              width: 175,
                                              child: StepProgressIndicator(
                                                totalSteps: 40,
                                                currentStep: 20,
                                                size: 5,
                                                padding: 0,
                                                selectedColor: Color(
                                                    0xffb0e4c8),
                                                unselectedColor: Color(
                                                    0xffEEEEEE),
                                                roundedEdges: Radius.circular(
                                                    10),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 12,
                                            ),
                                            Text(
                                              model().prolist2[index],
                                              style: const TextStyle(
                                                  fontFamily: 'InterRegular',
                                                  color: Color(0xff9DA2A7),
                                                  fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: const BoxDecoration(
                                        color: Color(0xff595FE5),
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(12),
                                            bottomLeft: Radius.circular(12))),
                                    child: Row(
                                      children: [
                                        Text(
                                          model().prodlist2[index],
                                          style: const TextStyle(
                                              fontFamily: 'InterRegular',
                                              fontSize: 16, color: Colors.white,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const Spacer(),
                                        const Text(
                                          '11 Sep 2022 10:09 am',
                                          style: TextStyle(
                                            fontFamily: 'InterRegular',
                                            fontSize: 12,
                                            color: Colors.white,),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Image.asset(
                                          'assets/more.png',
                                          height: 24,
                                          color: Colors.white,
                                        )
                                      ],
                                    ),
                                  )
                                ],
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

  Widget dataColumn1({required String title, required bool iscenter}) {
    return Row(
      mainAxisAlignment:
      iscenter ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        const SizedBox(width: 8,),
        Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 15),
          child: Text(title,
              style: TextStyle(
                  color: notifire.getblackcolor, fontFamily: 'InterRegular')),
        ),
        const SizedBox(
          width: 10,
        ),

      ],
    );
  }

  Widget screen2(constraints) {
    if (constraints < 600) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Scaffold(
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
                            Icons.dehaze_outlined, size: 15,
                            color: notifire
                                .getblackcolor, // Change Custom Drawer Icon Color
                          ),
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                          tooltip: MaterialLocalizations
                              .of(context)
                              .openAppDrawerTooltip,
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
                  itemBuilder: (context) =>
                  <PopupMenuEntry<SampleItem>>[
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
                  itemBuilder: (context) =>
                  <PopupMenuEntry<SampleItem>>[
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
                  itemBuilder: (context) =>
                  <PopupMenuEntry<SampleItem>>[
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
                const Flexible(child: SizedBox(width: 10)),
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
                itemBuilder: (context) =>
                <PopupMenuEntry<SampleItem>>[
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: Get.width,
                          height: 50,
                          decoration: BoxDecoration(
                            color: notifire.getbgcolor11,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: TextField(
                            style: TextStyle(
                              color: notifire.getblackcolor,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Product Name',
                              suffix: const Text('200 words',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'InterRegular',
                                      color: Color(0xff9DA2A7))),
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
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Product Desciption',
                          style: TextStyle(
                              color: notifire.getblackcolor,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'InterRegular',
                              fontSize: 12),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(color: notifire
                              .getbgcolor11,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: notifire.Getblg2)),
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: notifire.getbgcolor11,
                                    border: Border(bottom: BorderSide(
                                        color: notifire.Getblg2)),
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(12),
                                        topLeft: Radius.circular(12))),
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/text-bold.svg',
                                      height: 14,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    SvgPicture.asset(
                                      'assets/text-italic.svg',
                                      height: 14,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    SvgPicture.asset(
                                      'assets/text-underline.svg',
                                      height: 14,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    SvgPicture.asset(
                                      'assets/quote-down-circle.svg',
                                      height: 14,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    SvgPicture.asset(
                                      'assets/link-circle.svg',
                                      height: 14,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    SvgPicture.asset(
                                      'assets/smallcaps.svg',
                                      height: 14,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    SvgPicture.asset(
                                      'assets/paperclip-2.svg',
                                      height: 14,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Image.asset('assets/textalign-left.png',
                                        height: 14,
                                        color: const Color(0xff9DA2A7)),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Image.asset('assets/textalign-center.png',
                                        height: 14,
                                        color: const Color(0xff9DA2A7)),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Image.asset('assets/textalign-right.png',
                                        height: 14,
                                        color: const Color(0xff9DA2A7)),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Image.asset(
                                        'assets/textalign-justifycenter.png',
                                        height: 14,
                                        color: const Color(0xff9DA2A7)),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, left: 1),
                                    child: TextField(

                                      maxLines: 6,
                                      style: const TextStyle(),
                                      decoration: InputDecoration(
                                        hintText: 'Enter Desciption',
                                        hintStyle: const TextStyle(
                                            color: Color(0xffC6C8CB),
                                            fontSize: 15),
                                        contentPadding: const EdgeInsets.only(
                                            left: 20, right: 20),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                12),
                                            borderSide: BorderSide.none),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.circular(
                                                12)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.circular(
                                                12)),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Gallery',
                          style: TextStyle(
                              fontSize: 16,
                              color: notifire.getblackcolor,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'InterRegular'),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: notifire.getbgcolor11,
                              borderRadius: BorderRadius.circular(12)),
                          child: DottedBorder(
                            color: notifire.Getblg2,
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(12),
                            padding: const EdgeInsets.all(12),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: SizedBox(
                                width: Get.width,
                                child: ClipRRect(
                                  borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .center,
                                    children: [
                                      const Text(
                                        'Drop files here or click to upload',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: 'InterRegular',
                                            color: Color(0xff9DA2A7)),
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      InkWell(
                                        // onTap: () => _pickImage(),
                                        child: SizedBox(
                                          width: 150,
                                          child: DottedBorder(
                                              color: notifire.Getblg2,
                                              borderType: BorderType.RRect,
                                              radius: const Radius.circular(12),
                                              padding: const EdgeInsets.all(12),
                                              child: Row(
                                                children: [
                                                  Image.asset(
                                                      'assets/cloud-plus.png',
                                                      height: 16),
                                                  const SizedBox(
                                                    width: 8,
                                                  ),
                                                  const Center(
                                                      child: Text(
                                                        'Upload Image',
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight: FontWeight
                                                                .w600,
                                                            fontFamily: 'InterRegular',
                                                            color: Color(
                                                                0xff727880)),
                                                      ))
                                                ],
                                              )),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: notifire.getbgcolor11),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'General Info',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: notifire.getblackcolor,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'InterRegular'),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      mainAxisAlignment: MainAxisAlignment
                                          .start,
                                      children: [
                                        const Text(
                                          'Manufacturer Name',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xff727880),
                                              fontFamily: 'InterRegular',
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Container(
                                          height: 45,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(12),
                                              border: Border.all(
                                                color: notifire.getgrey1,
                                              )),
                                          child: TextField(
                                            style: TextStyle(
                                              color: notifire.getblackcolor,
                                            ),
                                            decoration: InputDecoration(
                                              hintText: 'Manufacturer Name',
                                              hintStyle: TextStyle(
                                                  color: notifire.getblackcolor,
                                                  fontSize: 15),
                                              contentPadding: const EdgeInsets
                                                  .only(
                                                  left: 20, right: 20),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(12),
                                                  borderSide:
                                                  BorderSide(color: grey2)),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                  BorderRadius.circular(12)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide:
                                                  BorderSide(color: blue),
                                                  borderRadius:
                                                  BorderRadius.circular(12)),
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
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      mainAxisAlignment: MainAxisAlignment
                                          .start,
                                      children: [
                                        const Text(
                                          'Manufacturer Brand',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xff727880),
                                              fontFamily: 'InterRegular',
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Container(
                                          height: 45,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(12),
                                              border: Border.all(
                                                color: notifire.getgrey1,
                                              )),
                                          child: TextField(
                                            style: TextStyle(
                                              color: notifire.getblackcolor,
                                            ),
                                            decoration: InputDecoration(
                                              hintText: 'Manufacturer Brand',
                                              hintStyle: TextStyle(
                                                  color: notifire.getblackcolor,
                                                  fontSize: 15),
                                              contentPadding: const EdgeInsets
                                                  .only(
                                                  left: 20, right: 20),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(12),
                                                  borderSide:
                                                  BorderSide(color: grey2)),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                  BorderRadius.circular(12)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide:
                                                  BorderSide(color: blue),
                                                  borderRadius:
                                                  BorderRadius.circular(12)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      mainAxisAlignment: MainAxisAlignment
                                          .start,
                                      children: [
                                        const Text(
                                          'In Stocks',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xff727880),
                                              fontFamily: 'InterRegular',
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Container(
                                          height: 45,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(12),
                                              border: Border.all(
                                                color: notifire.getgrey1,
                                              )),
                                          child: TextField(
                                            style: TextStyle(
                                              color: notifire.getblackcolor,
                                            ),
                                            decoration: InputDecoration(
                                              hintText: 'In Stocks',
                                              hintStyle: TextStyle(
                                                  color: notifire.getblackcolor,
                                                  fontSize: 15),
                                              contentPadding: const EdgeInsets
                                                  .only(
                                                  left: 20, right: 20),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(12),
                                                  borderSide:
                                                  BorderSide(color: grey2)),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                  BorderRadius.circular(12)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide:
                                                  BorderSide(color: blue),
                                                  borderRadius:
                                                  BorderRadius.circular(12)),
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
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      mainAxisAlignment: MainAxisAlignment
                                          .start,
                                      children: [
                                        const Text(
                                          'Orders',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xff727880),
                                              fontFamily: 'InterRegular',
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Container(
                                          height: 45,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(12),
                                              border: Border.all(
                                                color: notifire.getgrey1,
                                              )),
                                          child: TextField(
                                            style: TextStyle(
                                              color: notifire.getblackcolor,
                                            ),
                                            decoration: InputDecoration(
                                              hintText: 'Orders',
                                              hintStyle: TextStyle(
                                                  color: notifire.getblackcolor,
                                                  fontSize: 15),
                                              contentPadding: const EdgeInsets
                                                  .only(
                                                  left: 20, right: 20),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(12),
                                                  borderSide:
                                                  BorderSide(color: grey2)),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                  BorderRadius.circular(12)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide:
                                                  BorderSide(color: blue),
                                                  borderRadius:
                                                  BorderRadius.circular(12)),
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
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      mainAxisAlignment: MainAxisAlignment
                                          .start,
                                      children: [
                                        const Text(
                                          'Price',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xff727880),
                                              fontFamily: 'InterRegular',
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Container(
                                          height: 45,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(12),
                                              border: Border.all(
                                                color: notifire.getgrey1,
                                              )),
                                          child: TextField(
                                            style: TextStyle(
                                              color: notifire.getblackcolor,
                                            ),
                                            decoration: InputDecoration(
                                              hintText: 'Price',
                                              suffix: const Text('USD',
                                                  style: TextStyle(
                                                      fontFamily: 'InterRegular',
                                                      fontSize: 12,
                                                      color: Color(
                                                          0xff727880))),
                                              hintStyle: TextStyle(
                                                  color: notifire.getblackcolor,
                                                  fontSize: 15),
                                              contentPadding: const EdgeInsets
                                                  .only(
                                                  left: 20, right: 20),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(12),
                                                  borderSide:
                                                  BorderSide(color: grey2)),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                  BorderRadius.circular(12)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide:
                                                  BorderSide(color: blue),
                                                  borderRadius:
                                                  BorderRadius.circular(12)),
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
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      mainAxisAlignment: MainAxisAlignment
                                          .start,
                                      children: [
                                        const Text(
                                          'Discount',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xff727880),
                                              fontFamily: 'InterRegular',
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Container(
                                          height: 45,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(12),
                                              border: Border.all(
                                                color: notifire.getgrey1,
                                              )),
                                          child: TextField(
                                            style: TextStyle(
                                              color: notifire.getblackcolor,
                                            ),
                                            decoration: InputDecoration(
                                              hintText: 'Discount',
                                              suffix: const Text('USD',
                                                  style: TextStyle(
                                                      fontFamily: 'InterRegular',
                                                      fontSize: 12,
                                                      color: Color(
                                                          0xff727880))),
                                              hintStyle: TextStyle(
                                                  color: notifire.getblackcolor,
                                                  fontSize: 15),
                                              contentPadding: const EdgeInsets
                                                  .only(
                                                  left: 20, right: 20),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(12),
                                                  borderSide:
                                                  BorderSide(color: grey2)),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                  BorderRadius.circular(12)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide:
                                                  BorderSide(color: blue),
                                                  borderRadius:
                                                  BorderRadius.circular(12)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: notifire.getbgcolor11),
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Meta Data',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: notifire.getblackcolor,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'InterRegular'),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      mainAxisAlignment: MainAxisAlignment
                                          .start,
                                      children: [
                                        const Text(
                                          'Meta Title',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xff727880),
                                              fontFamily: 'InterRegular',
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Container(
                                          height: 45,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(12),
                                              border: Border.all(
                                                color: notifire.getgrey1,
                                              )),
                                          child: TextField(
                                            style: TextStyle(
                                              color: notifire.getblackcolor,
                                            ),
                                            decoration: InputDecoration(
                                              hintText: 'Meta Title',
                                              hintStyle: TextStyle(
                                                  color: notifire.getblackcolor,
                                                  fontSize: 15),
                                              contentPadding: const EdgeInsets
                                                  .only(
                                                  left: 20, right: 20),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(12),
                                                  borderSide:
                                                  BorderSide(color: grey2)),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                  BorderRadius.circular(12)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide:
                                                  BorderSide(color: blue),
                                                  borderRadius:
                                                  BorderRadius.circular(12)),
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
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      mainAxisAlignment: MainAxisAlignment
                                          .start,
                                      children: [
                                        const Text(
                                          'Meta Keywords',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xff727880),
                                              fontFamily: 'InterRegular',
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Container(
                                          height: 45,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(12),
                                              border: Border.all(
                                                color: notifire.getgrey1,
                                              )),
                                          child: TextField(
                                            style: TextStyle(
                                              color: notifire.getblackcolor,
                                            ),
                                            decoration: InputDecoration(
                                              hintText: 'Meta Keywords',
                                              hintStyle: TextStyle(
                                                  color: notifire.getblackcolor,
                                                  fontSize: 15),
                                              contentPadding: const EdgeInsets
                                                  .only(
                                                  left: 20, right: 20),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(12),
                                                  borderSide:
                                                  BorderSide(color: grey2)),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                  BorderRadius.circular(12)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide:
                                                  BorderSide(color: blue),
                                                  borderRadius:
                                                  BorderRadius.circular(12)),
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
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      mainAxisAlignment: MainAxisAlignment
                                          .start,
                                      children: [
                                        const Text(
                                          'Meta Description',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xff727880),
                                              fontFamily: 'InterRegular',
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Container(
                                          height: 45,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(12),
                                              border: Border.all(
                                                color: notifire.getgrey1,
                                              )),
                                          child: TextField(
                                            style: TextStyle(
                                              color: notifire.getblackcolor,
                                            ),
                                            decoration: InputDecoration(
                                              hintText: 'Meta Description',
                                              hintStyle: const TextStyle(
                                                  color: Color(0xffC6C8CB),
                                                  fontSize: 15),
                                              contentPadding: const EdgeInsets
                                                  .only(
                                                  left: 20, right: 20),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(12),
                                                  borderSide:
                                                  BorderSide(color: grey2)),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                  BorderRadius.circular(12)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide:
                                                  BorderSide(color: blue),
                                                  borderRadius:
                                                  BorderRadius.circular(12)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: 1,
                                itemBuilder: (context, index) {
                                  return Row(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              20),
                                          color: const Color(0xff7DC066),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 45,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(12),
                                                  border: Border.all(
                                                    color: notifire.getgrey1,
                                                  )),
                                              child: TextField(
                                                style: TextStyle(
                                                  color: notifire.getblackcolor,
                                                ),
                                                decoration: InputDecoration(
                                                  hintText: 'Color Hex',
                                                  hintStyle: TextStyle(
                                                      color: notifire
                                                          .getblackcolor,
                                                      fontSize: 15),
                                                  contentPadding:
                                                  const EdgeInsets.only(
                                                      left: 20, right: 20),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(12),
                                                      borderSide:
                                                      BorderSide(color: grey2)),
                                                  enabledBorder: OutlineInputBorder(
                                                      borderSide: BorderSide
                                                          .none,
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          12)),
                                                  focusedBorder: OutlineInputBorder(
                                                      borderSide:
                                                      BorderSide(color: blue),
                                                      borderRadius:
                                                      BorderRadius.circular(
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
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 45,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(12),
                                                  border: Border.all(
                                                    color: notifire.getgrey1,
                                                  )),
                                              child: TextField(
                                                style: TextStyle(
                                                  color: notifire.getblackcolor,
                                                ),
                                                decoration: InputDecoration(
                                                  hintText: 'Name',
                                                  hintStyle: TextStyle(
                                                      color: notifire
                                                          .getblackcolor,
                                                      fontSize: 15),
                                                  contentPadding:
                                                  const EdgeInsets.only(
                                                      left: 20, right: 20),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(12),
                                                      borderSide:
                                                      BorderSide(color: grey2)),
                                                  enabledBorder: OutlineInputBorder(
                                                      borderSide: BorderSide
                                                          .none,
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          12)),
                                                  focusedBorder: OutlineInputBorder(
                                                      borderSide:
                                                      BorderSide(color: blue),
                                                      borderRadius:
                                                      BorderRadius.circular(
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
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 45,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(12),
                                                  border: Border.all(
                                                    color: notifire.getgrey1,
                                                  )),
                                              child: TextField(
                                                style: TextStyle(
                                                  color: notifire.getblackcolor,
                                                ),
                                                decoration: InputDecoration(
                                                  hintText: 'In Stocks',
                                                  hintStyle: TextStyle(
                                                      color: notifire
                                                          .getblackcolor,
                                                      fontSize: 15),
                                                  contentPadding:
                                                  const EdgeInsets.only(
                                                      left: 20, right: 20),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(12),
                                                      borderSide:
                                                      BorderSide(color: grey2)),
                                                  enabledBorder: OutlineInputBorder(
                                                      borderSide: BorderSide
                                                          .none,
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          12)),
                                                  focusedBorder: OutlineInputBorder(
                                                      borderSide:
                                                      BorderSide(color: blue),
                                                      borderRadius:
                                                      BorderRadius.circular(
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
                                      Center(
                                        child: InkWell(
                                          onTap: () {
                                            dataa.removeAt(0);
                                            setState(() {});
                                          },
                                          child: Image.asset(
                                            'assets/trash.png',
                                            height: 16,
                                          ),
                                        ),
                                      )
                                    ],
                                  );
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: dataa.length,
                                itemBuilder: (context, index) {
                                  return dataa[index];
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              InkWell(
                                onTap: () {
                                  dataa.add(Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .center,
                                      mainAxisAlignment: MainAxisAlignment
                                          .start,
                                      children: [
                                        Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                20),
                                            color: model().detcol[selectIndex],
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 45,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(12),
                                                    border: Border.all(
                                                      color: notifire.getgrey1,
                                                    )),
                                                child: TextField(
                                                  style: TextStyle(
                                                    color: notifire
                                                        .getblackcolor,
                                                  ),
                                                  decoration: InputDecoration(
                                                    hintText: 'Color Hex',
                                                    hintStyle: TextStyle(
                                                        color:
                                                        notifire.getblackcolor,
                                                        fontSize: 15),
                                                    contentPadding:
                                                    const EdgeInsets.only(
                                                        left: 20, right: 20),
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                        borderSide: BorderSide(
                                                            color: grey2)),
                                                    enabledBorder:
                                                    OutlineInputBorder(
                                                        borderSide:
                                                        BorderSide.none,
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(12)),
                                                    focusedBorder:
                                                    OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: blue),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(12)),
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
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 45,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(12),
                                                    border: Border.all(
                                                      color: notifire.getgrey1,
                                                    )),
                                                child: TextField(
                                                  style: TextStyle(
                                                    color: notifire
                                                        .getblackcolor,
                                                  ),
                                                  decoration: InputDecoration(
                                                    hintText: 'Name',
                                                    hintStyle: TextStyle(
                                                        color:
                                                        notifire.getblackcolor,
                                                        fontSize: 15),
                                                    contentPadding:
                                                    const EdgeInsets.only(
                                                        left: 20, right: 20),
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                        borderSide: BorderSide(
                                                            color: grey2)),
                                                    enabledBorder:
                                                    OutlineInputBorder(
                                                        borderSide:
                                                        BorderSide.none,
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(12)),
                                                    focusedBorder:
                                                    OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: blue),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(12)),
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
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 45,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(12),
                                                    border: Border.all(
                                                      color: notifire.getgrey1,
                                                    )),
                                                child: TextField(
                                                  style: TextStyle(
                                                    color: notifire
                                                        .getblackcolor,
                                                  ),
                                                  decoration: InputDecoration(
                                                    hintText: 'In Stocks',
                                                    hintStyle: TextStyle(
                                                        color:
                                                        notifire.getblackcolor,
                                                        fontSize: 15),
                                                    contentPadding:
                                                    const EdgeInsets.only(
                                                        left: 20, right: 20),
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                        borderSide: BorderSide(
                                                            color: grey2)),
                                                    enabledBorder:
                                                    OutlineInputBorder(
                                                        borderSide:
                                                        BorderSide.none,
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(12)),
                                                    focusedBorder:
                                                    OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: blue),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(12)),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Center(
                                          child: InkWell(
                                            onTap: () {
                                              dataa.removeAt(0);
                                              setState(() {});
                                            },
                                            child: Image.asset(
                                              'assets/trash.png',
                                              height: 16,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ));
                                  setState(() {});
                                },
                                child: Container(
                                  width: 80,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: notifire.getgrey1,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.add,
                                        size: 20,
                                        color: notifire.getblackcolor,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      const Text(
                                        'Add',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xff727880),
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'InterRegular'),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: notifire.getbgcolor11),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Sizes',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: notifire.getblackcolor,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'InterRegular'),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              ListView.builder(
                                itemCount: 1,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Row(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 45,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(12),
                                                  border: Border.all(
                                                    color: notifire.getgrey1,
                                                  )),
                                              child: TextField(
                                                style: TextStyle(
                                                  color: notifire.getblackcolor,
                                                ),
                                                decoration: InputDecoration(
                                                  hintText: 'Name',
                                                  hintStyle: TextStyle(
                                                      color: notifire
                                                          .getblackcolor,
                                                      fontSize: 15),
                                                  contentPadding:
                                                  const EdgeInsets.only(
                                                      left: 20, right: 20),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(12),
                                                      borderSide:
                                                      BorderSide(color: grey2)),
                                                  enabledBorder: OutlineInputBorder(
                                                      borderSide: BorderSide
                                                          .none,
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          12)),
                                                  focusedBorder: OutlineInputBorder(
                                                      borderSide:
                                                      BorderSide(color: blue),
                                                      borderRadius:
                                                      BorderRadius.circular(
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
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 45,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(12),
                                                  border: Border.all(
                                                    color: notifire.getgrey1,
                                                  )),
                                              child: TextField(
                                                style: TextStyle(
                                                  color: notifire.getblackcolor,
                                                ),
                                                decoration: InputDecoration(
                                                  hintText: 'In Stocks',
                                                  hintStyle: TextStyle(
                                                      color: notifire
                                                          .getblackcolor,
                                                      fontSize: 15),
                                                  contentPadding:
                                                  const EdgeInsets.only(
                                                      left: 20, right: 20),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(12),
                                                      borderSide:
                                                      BorderSide(color: grey2)),
                                                  enabledBorder: OutlineInputBorder(
                                                      borderSide: BorderSide
                                                          .none,
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          12)),
                                                  focusedBorder: OutlineInputBorder(
                                                      borderSide:
                                                      BorderSide(color: blue),
                                                      borderRadius:
                                                      BorderRadius.circular(
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
                                      InkWell(
                                        onTap: () {
                                          dataa1.removeAt(1);
                                          setState(() {});
                                        },
                                        child: Image.asset(
                                          'assets/trash.png',
                                          height: 16,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: dataa1.length,
                                itemBuilder: (context, index) {
                                  return dataa1[index];
                                },
                              ),
                              InkWell(
                                onTap: () {
                                  dataa1.add(Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .center,
                                      mainAxisAlignment: MainAxisAlignment
                                          .start,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 45,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(12),
                                                  color: notifire.getbgcolor11,
                                                ),
                                                child: TextField(
                                                  style: TextStyle(
                                                    color: notifire
                                                        .getblackcolor,
                                                  ),
                                                  decoration: InputDecoration(
                                                    hintText: 'Name',
                                                    hintStyle: TextStyle(
                                                        color:
                                                        notifire.getblackcolor,
                                                        fontSize: 15),
                                                    contentPadding:
                                                    const EdgeInsets.only(
                                                        left: 20, right: 20),
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                        borderSide: BorderSide(
                                                            color: notifire
                                                                .Getblg2)),
                                                    enabledBorder:
                                                    OutlineInputBorder(
                                                        borderSide:
                                                        BorderSide.none,
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(12)),
                                                    focusedBorder:
                                                    OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: blue),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(12)),
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
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 45,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(12),
                                                    border: Border.all(
                                                      color: notifire.getgrey1,
                                                    )),
                                                child: TextField(
                                                  style: TextStyle(
                                                    color: notifire
                                                        .getblackcolor,
                                                  ),
                                                  decoration: InputDecoration(
                                                    hintText: 'In Stocks',
                                                    hintStyle: TextStyle(
                                                        color:
                                                        notifire.getblackcolor,
                                                        fontSize: 15),
                                                    contentPadding:
                                                    const EdgeInsets.only(
                                                        left: 20, right: 20),
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                        borderSide: BorderSide(
                                                            color: notifire
                                                                .Getblg2)),
                                                    enabledBorder:
                                                    OutlineInputBorder(
                                                        borderSide:
                                                        BorderSide.none,
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(12)),
                                                    focusedBorder:
                                                    OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: blue),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(12)),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            dataa1.removeAt(0);
                                            setState(() {});
                                          },
                                          child: Image.asset(
                                            'assets/trash.png',
                                            height: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ));
                                  setState(() {});
                                },
                                child: Container(
                                  width: 80,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: notifire.getgrey1,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.add,
                                        size: 20,
                                        color: notifire.getblackcolor,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      const Text(
                                        'Add',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xff727880),
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'InterRegular'),
                                      )
                                    ],
                                  ),
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
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              color: notifire.getbgcolor11,
                              borderRadius:
                              const BorderRadius.all(Radius.circular(12))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Publish',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: notifire.getblackcolor,
                                      fontFamily: 'InterRegular',
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .start,
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        const Text(
                                          'Status',
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              fontSize: 12,
                                              color: Color(0xff727880),
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        DropdownButtonHideUnderline(
                                          child: DropdownButton2<String>(
                                            isExpanded: true,
                                            hint: Row(
                                              children: [
                                                const SizedBox(
                                                  width: 4,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    'Draft',
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
                                            items: items
                                                .map((String item) =>
                                                DropdownMenuItem<String>(
                                                  value: item,
                                                  child: Text(
                                                    item,
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                      FontWeight.bold,
                                                      color: notifire
                                                          .getblackcolor,
                                                    ),
                                                    overflow:
                                                    TextOverflow.ellipsis,
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
                                                color: notifire.getbgcolor10,
                                                borderRadius:
                                                BorderRadius.circular(14),
                                                border: Border.all(
                                                  color: notifire.getgrey1,
                                                ),
                                              ),
                                              elevation: 0,
                                            ),
                                            iconStyleData: const IconStyleData(
                                              icon: Icon(
                                                Icons
                                                    .keyboard_arrow_down_outlined,
                                                size: 25,
                                                color: Color(0xff9DA2A7),
                                              ),
                                              iconSize: 14,
                                              iconEnabledColor: Colors.black,
                                              iconDisabledColor: Colors.grey,
                                            ),
                                            dropdownStyleData: DropdownStyleData(
                                              maxHeight: 200,
                                              width: 200,
                                              decoration: BoxDecoration(
                                                color: notifire.getbgcolor10,
                                                borderRadius:
                                                BorderRadius.circular(14),
                                              ),
                                              offset: const Offset(-20, 0),
                                              scrollbarTheme: ScrollbarThemeData(
                                                radius: const Radius.circular(
                                                    40),
                                                thickness: MaterialStateProperty
                                                    .all<double>(6),
                                                thumbVisibility:
                                                MaterialStateProperty.all<bool>(
                                                    true),
                                              ),
                                            ),
                                            menuItemStyleData:
                                            const MenuItemStyleData(
                                              height: 40,
                                              padding: EdgeInsets.only(
                                                  left: 14, right: 14),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text(
                                          'Visibility',
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              fontSize: 12,
                                              color: Color(0xff727880),
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        DropdownButtonHideUnderline(
                                          child: DropdownButton2<String>(
                                            isExpanded: true,
                                            hint: Row(
                                              children: [
                                                const SizedBox(
                                                  width: 4,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    'Hide',
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
                                            items: items1
                                                .map((String item1) =>
                                                DropdownMenuItem<String>(
                                                  value: item1,
                                                  child: Text(
                                                    item1,
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                      FontWeight.bold,
                                                      color: notifire
                                                          .getblackcolor,
                                                    ),
                                                    overflow:
                                                    TextOverflow.ellipsis,
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
                                              padding: const EdgeInsets.only(
                                                  left: 14, right: 14),
                                              decoration: BoxDecoration(
                                                color: notifire.getbgcolor10,
                                                borderRadius:
                                                BorderRadius.circular(14),
                                                border: Border.all(
                                                  color: notifire.getgrey1,
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
                                                  borderRadius:
                                                  BorderRadius.circular(14),
                                                  color: notifire.getbgcolor10),
                                              offset: const Offset(-20, 0),
                                              scrollbarTheme: ScrollbarThemeData(
                                                radius: const Radius.circular(
                                                    40),
                                                thickness: MaterialStateProperty
                                                    .all<double>(6),
                                                thumbVisibility:
                                                MaterialStateProperty.all<bool>(
                                                    true),
                                              ),
                                            ),
                                            menuItemStyleData:
                                            const MenuItemStyleData(
                                              height: 40,
                                              padding: EdgeInsets.only(
                                                  left: 14, right: 14),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text(
                                          'Schedule Date & Time',
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              fontSize: 12,
                                              color: Color(0xff727880),
                                              fontWeight: FontWeight.w600),
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
                                              borderRadius:
                                              BorderRadius.circular(15)),
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
                                                  scale: 3,
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
                                                  borderRadius:
                                                  BorderRadius.circular(12),
                                                  borderSide:
                                                  BorderSide(color: grey2)),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                  BorderRadius.circular(12)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide:
                                                  BorderSide(color: blue),
                                                  borderRadius:
                                                  BorderRadius.circular(12)),
                                            ),
                                          ),
                                        ),
                                      ]),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'Categories',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: notifire.getblackcolor,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'InterRegular'),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      color: notifire.getbgcolor10,
                                    ),
                                    child: const Text('Automotive Accessories',
                                        style: TextStyle(
                                            fontFamily: 'InterRegular',
                                            color: Color(0xff727880),
                                            fontSize: 14)),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .start,
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        const Text(
                                          'Select Categories',
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              fontSize: 12,
                                              color: Color(0xff727880),
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        DropdownButtonHideUnderline(
                                          child: DropdownButton2<String>(
                                            isExpanded: true,
                                            hint: Row(
                                              children: [
                                                const SizedBox(
                                                  width: 4,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    'Select Categories',
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
                                            items: items2
                                                .map((String item2) =>
                                                DropdownMenuItem<String>(
                                                  value: item2,
                                                  child: Text(
                                                    item2,
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                      FontWeight.bold,
                                                      color: notifire
                                                          .getblackcolor,
                                                    ),
                                                    overflow:
                                                    TextOverflow.ellipsis,
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
                                                  borderRadius:
                                                  BorderRadius.circular(14),
                                                  border: Border.all(
                                                    color: notifire.getgrey1,
                                                  ),
                                                  color: notifire.getbgcolor10),
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
                                                  borderRadius:
                                                  BorderRadius.circular(14),
                                                  border: Border.all(
                                                    color: notifire.getgrey1,
                                                  ),
                                                  color: notifire.getbgcolor10),
                                              offset: const Offset(-20, 0),
                                              scrollbarTheme: ScrollbarThemeData(
                                                radius: const Radius.circular(
                                                    40),
                                                thickness: MaterialStateProperty
                                                    .all<double>(6),
                                                thumbVisibility:
                                                MaterialStateProperty.all<bool>(
                                                    true),
                                              ),
                                            ),
                                            menuItemStyleData:
                                            const MenuItemStyleData(
                                              height: 40,
                                              padding: EdgeInsets.only(
                                                  left: 14, right: 14),
                                            ),
                                          ),
                                        ),
                                      ]),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: Get.width * 1,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              15),
                                          color: notifire.getbgcolor10),
                                      child: TextFieldTags<String>(
                                          textfieldTagsController:
                                          _stringTagController,
                                          initialTags: const ['python', 'java'],
                                          textSeparators: const [' ', ','],
                                          inputFieldBuilder:
                                              (context, inputFieldValues) {
                                            return TextField(
                                              onTap: () {
                                                _stringTagController
                                                    .getFocusNode
                                                    ?.requestFocus();
                                              },
                                              // maxLines: 6,
                                              decoration: InputDecoration(
                                                enabledBorder: OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(15),
                                                    borderSide: BorderSide
                                                        .none),
                                                focusedBorder: OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(15),
                                                    borderSide: BorderSide(
                                                        color: notifire
                                                            .getgrey1)),
                                                disabledBorder: OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(15),
                                                    borderSide: BorderSide
                                                        .none),
                                                hintStyle: TextStyle(
                                                    color: notifire
                                                        .getblackcolor),
                                                hintText:
                                                inputFieldValues.tags.isNotEmpty
                                                    ? ''
                                                    : "Enter tag...".tr,
                                                prefixIcon:
                                                inputFieldValues.tags.isNotEmpty
                                                    ? SingleChildScrollView(
                                                  controller: inputFieldValues
                                                      .tagScrollController,
                                                  scrollDirection:
                                                  Axis.vertical,
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets
                                                        .all(8),
                                                    child: Wrap(
                                                        runSpacing: 4.0,
                                                        spacing: 4.0,
                                                        children:
                                                        inputFieldValues
                                                            .tags
                                                            .map((String
                                                        tag) {
                                                          return Container(
                                                            decoration:
                                                            BoxDecoration(
                                                              borderRadius:
                                                              const BorderRadius
                                                                  .all(
                                                                  Radius
                                                                      .circular(
                                                                      15)),
                                                              color: notifire
                                                                  .getbgcolor11,
                                                            ),
                                                            margin:
                                                            const EdgeInsets
                                                                .only(
                                                                right:
                                                                10),
                                                            padding:
                                                            const EdgeInsets
                                                                .all(
                                                                8),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                              mainAxisSize:
                                                              MainAxisSize
                                                                  .min,
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                              children: [
                                                                Center(
                                                                    child: Text(
                                                                        '#$tag',
                                                                        style: TextStyle(
                                                                            color: notifire
                                                                                .getblackcolor,
                                                                            fontFamily: 'InterRegular'))),
                                                                const SizedBox(
                                                                    width:
                                                                    5),
                                                                InkWell(
                                                                  child: const Icon(
                                                                      Icons
                                                                          .cancel_outlined,
                                                                      size:
                                                                      18,
                                                                      color:
                                                                      Color(
                                                                          0xff595FE5)),
                                                                  onTap:
                                                                      () {
                                                                    inputFieldValues
                                                                        .onTagRemoved(
                                                                        tag);
                                                                  },
                                                                )
                                                              ],
                                                            ),
                                                          );
                                                        }).toList()),
                                                  ),
                                                )
                                                    : null,
                                                suffixIcon: inputFieldValues
                                                    .tags.isNotEmpty
                                                    ? InkWell(
                                                    onTap: () {
                                                      _stringTagController
                                                          .clearTags();
                                                    },
                                                    child: Padding(
                                                      padding:
                                                      const EdgeInsets.only(
                                                          top: 10,
                                                          right: 10),
                                                      child: Text(
                                                          'All Clear'.tr,
                                                          style: TextStyle(
                                                              color: notifire
                                                                  .getblackcolor,
                                                              fontFamily:
                                                              'InterRegular')),
                                                    ))
                                                    : Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 10, right: 10),
                                                  child: Text('All Clear'.tr,
                                                      style: TextStyle(
                                                          color: notifire
                                                              .getblackcolor,
                                                          fontFamily:
                                                          'InterRegular')),
                                                ),
                                              ),
                                              controller: inputFieldValues
                                                  .textEditingController,
                                              focusNode: inputFieldValues
                                                  .focusNode,
                                              onChanged:
                                              inputFieldValues.onTagChanged,
                                              onSubmitted:
                                              inputFieldValues.onTagSubmitted,
                                            );
                                          }),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                12),
                                            border: Border.all(
                                              color: notifire.getgrey1,
                                            )),
                                        child: const Center(
                                            child: Text(
                                              'Canccel',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'InterRegular',
                                                  color: Color(0xff727880)),
                                            )),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                12),
                                            color: const Color(0xff595FE5)),
                                        child: const Center(
                                            child: Text('Update',
                                                style: TextStyle(
                                                    fontFamily: 'InterRegular',
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight
                                                        .w500))),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
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
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: Get.width,
                    height: 50,
                    decoration: BoxDecoration(
                      color: notifire.getbgcolor11,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      style: TextStyle(
                        color: notifire.getblackcolor,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Product Name',
                        suffix: const Text('200 words',
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'InterRegular',
                                color: Color(0xff9DA2A7))),
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
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Product Desciption',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: 'InterRegular',
                        color: notifire.getblackcolor,
                        fontSize: 12),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(color: notifire.getbgcolor11,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: notifire.Getblg2)),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: notifire.getbgcolor11, border: Border(
                              bottom: BorderSide(color: notifire.Getblg2)),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(12),
                                  topLeft: Radius.circular(12))),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                'assets/text-bold.svg',
                                height: 14,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              SvgPicture.asset(
                                'assets/text-italic.svg',
                                height: 14,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              SvgPicture.asset(
                                'assets/text-underline.svg',
                                height: 14,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              SvgPicture.asset(
                                'assets/quote-down-circle.svg',
                                height: 14,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              SvgPicture.asset(
                                'assets/link-circle.svg',
                                height: 14,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              SvgPicture.asset(
                                'assets/smallcaps.svg',
                                height: 14,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              SvgPicture.asset(
                                'assets/paperclip-2.svg',
                                height: 14,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Image.asset('assets/textalign-left.png',
                                  height: 14, color: const Color(0xff9DA2A7)),
                              const SizedBox(
                                width: 8,
                              ),
                              Image.asset('assets/textalign-center.png',
                                  height: 14, color: const Color(0xff9DA2A7)),
                              const SizedBox(
                                width: 8,
                              ),
                              Image.asset('assets/textalign-right.png',
                                  height: 14, color: const Color(0xff9DA2A7)),
                              const SizedBox(
                                width: 8,
                              ),
                              Image.asset(
                                  'assets/textalign-justifycenter.png',
                                  height: 14, color: const Color(0xff9DA2A7)),
                              const SizedBox(
                                width: 8,
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 1),
                              child: TextField(

                                maxLines: 6,
                                style: const TextStyle(),
                                decoration: InputDecoration(
                                  hintText: 'Enter Desciption',
                                  hintStyle: const TextStyle(
                                      color: Color(0xffC6C8CB), fontSize: 15),
                                  contentPadding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide.none),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(
                                          12)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(
                                          12)),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Gallery',
                    style: TextStyle(
                        fontSize: 16,
                        color: notifire.getblackcolor,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'InterRegular'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: notifire.getbgcolor11,
                        borderRadius: BorderRadius.circular(12)),
                    child: DottedBorder(
                      color: const Color(0xffC6C8CB),
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(12),
                      padding: const EdgeInsets.all(12),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: SizedBox(
                          width: Get.width,
                          child: ClipRRect(
                            borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  'Drop files here or click to upload',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'InterRegular',
                                      color: Color(0xff9DA2A7)),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                InkWell(
                                  // onTap: () => _pickImage(),
                                  child: SizedBox(
                                    width: 150,
                                    child: DottedBorder(
                                        color: const Color(0xffC6C8CB),
                                        borderType: BorderType.RRect,
                                        radius: const Radius.circular(12),
                                        padding: const EdgeInsets.all(12),
                                        child: Row(
                                          children: [
                                            Image.asset('assets/cloud-plus.png',
                                                height: 16),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            const Center(
                                                child: Text(
                                                  'Upload Image',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight
                                                          .w600,
                                                      fontFamily: 'InterRegular',
                                                      color: Color(0xff727880)),
                                                ))
                                          ],
                                        )),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: notifire.getbgcolor11),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'General Info',
                          style: TextStyle(
                              fontSize: 16,
                              color: notifire.getblackcolor,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'InterRegular'),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Manufacturer Name',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xff727880),
                                        fontFamily: 'InterRegular',
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    height: 45,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          color: notifire.getgrey1,
                                        )),
                                    child: TextField(
                                      style: TextStyle(
                                        color: notifire.getblackcolor,
                                      ),
                                      decoration: InputDecoration(
                                        hintText: 'Manufacturer Name',
                                        hintStyle: TextStyle(
                                            color: notifire.getblackcolor,
                                            fontSize: 15),
                                        contentPadding: const EdgeInsets.only(
                                            left: 20, right: 20),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(12),
                                            borderSide:
                                            BorderSide(color: grey2)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                            BorderRadius.circular(12)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: blue),
                                            borderRadius:
                                            BorderRadius.circular(12)),
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
                                  const Text(
                                    'Manufacturer Brand',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xff727880),
                                        fontFamily: 'InterRegular',
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    height: 45,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          color: notifire.getgrey1,
                                        )),
                                    child: TextField(
                                      style: TextStyle(
                                        color: notifire.getblackcolor,
                                      ),
                                      decoration: InputDecoration(
                                        hintText: 'Manufacturer Brand',
                                        hintStyle: TextStyle(
                                            color: notifire.getblackcolor,
                                            fontSize: 15),
                                        contentPadding: const EdgeInsets.only(
                                            left: 20, right: 20),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(12),
                                            borderSide:
                                            BorderSide(color: grey2)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                            BorderRadius.circular(12)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: blue),
                                            borderRadius:
                                            BorderRadius.circular(12)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Text(
                                    'In Stocks',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xff727880),
                                        fontFamily: 'InterRegular',
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    height: 45,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          color: notifire.getgrey1,
                                        )),
                                    child: TextField(
                                      style: TextStyle(
                                        color: notifire.getblackcolor,
                                      ),
                                      decoration: InputDecoration(
                                        hintText: 'In Stocks',
                                        hintStyle: TextStyle(
                                            color: notifire.getblackcolor,
                                            fontSize: 15),
                                        contentPadding: const EdgeInsets.only(
                                            left: 20, right: 20),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(12),
                                            borderSide:
                                            BorderSide(color: grey2)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                            BorderRadius.circular(12)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: blue),
                                            borderRadius:
                                            BorderRadius.circular(12)),
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
                                  const Text(
                                    'Orders',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xff727880),
                                        fontFamily: 'InterRegular',
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    height: 45,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          color: notifire.getgrey1,
                                        )),
                                    child: TextField(
                                      style: TextStyle(
                                        color: notifire.getblackcolor,
                                      ),
                                      decoration: InputDecoration(
                                        hintText: 'Orders',
                                        hintStyle: TextStyle(
                                            color: notifire.getblackcolor,
                                            fontSize: 15),
                                        contentPadding: const EdgeInsets.only(
                                            left: 20, right: 20),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(12),
                                            borderSide:
                                            BorderSide(color: grey2)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                            BorderRadius.circular(12)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: blue),
                                            borderRadius:
                                            BorderRadius.circular(12)),
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
                                  const Text(
                                    'Price',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xff727880),
                                        fontFamily: 'InterRegular',
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    height: 45,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          color: notifire.getgrey1,
                                        )),
                                    child: TextField(
                                      style: TextStyle(
                                        color: notifire.getblackcolor,
                                      ),
                                      decoration: InputDecoration(
                                        hintText: 'Price',
                                        suffix: const Text('USD',
                                            style: TextStyle(
                                                fontFamily: 'InterRegular',
                                                fontSize: 12,
                                                color: Color(0xff727880))),
                                        hintStyle: TextStyle(
                                            color: notifire.getblackcolor,
                                            fontSize: 15),
                                        contentPadding: const EdgeInsets.only(
                                            left: 20, right: 20),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(12),
                                            borderSide:
                                            BorderSide(color: grey2)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                            BorderRadius.circular(12)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: blue),
                                            borderRadius:
                                            BorderRadius.circular(12)),
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
                                  const Text(
                                    'Discount',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xff727880),
                                        fontFamily: 'InterRegular',
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    height: 45,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          color: notifire.getgrey1,
                                        )),
                                    child: TextField(
                                      style: TextStyle(
                                        color: notifire.getblackcolor,
                                      ),
                                      decoration: InputDecoration(
                                        hintText: 'Discount',
                                        suffix: const Text('USD',
                                            style: TextStyle(
                                                fontFamily: 'InterRegular',
                                                fontSize: 12,
                                                color: Color(0xff727880))),
                                        hintStyle: TextStyle(
                                            color: notifire.getblackcolor,
                                            fontSize: 15),
                                        contentPadding: const EdgeInsets.only(
                                            left: 20, right: 20),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(12),
                                            borderSide:
                                            BorderSide(color: grey2)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                            BorderRadius.circular(12)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: blue),
                                            borderRadius:
                                            BorderRadius.circular(12)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: notifire.getbgcolor11),
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Meta Data',
                          style: TextStyle(
                              fontSize: 16,
                              color: notifire.getblackcolor,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'InterRegular'),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Meta Title',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xff727880),
                                        fontFamily: 'InterRegular',
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    height: 45,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          color: notifire.getgrey1,
                                        )),
                                    child: TextField(
                                      style: TextStyle(
                                        color: notifire.getblackcolor,
                                      ),
                                      decoration: InputDecoration(
                                        hintText: 'Meta Title',
                                        hintStyle: TextStyle(
                                            color: notifire.getblackcolor,
                                            fontSize: 15),
                                        contentPadding: const EdgeInsets.only(
                                            left: 20, right: 20),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(12),
                                            borderSide:
                                            BorderSide(color: grey2)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                            BorderRadius.circular(12)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: blue),
                                            borderRadius:
                                            BorderRadius.circular(12)),
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
                                  const Text(
                                    'Meta Keywords',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xff727880),
                                        fontFamily: 'InterRegular',
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    height: 45,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          color: notifire.getgrey1,
                                        )),
                                    child: TextField(
                                      style: TextStyle(
                                        color: notifire.getblackcolor,
                                      ),
                                      decoration: InputDecoration(
                                        hintText: 'Meta Keywords',
                                        hintStyle: TextStyle(
                                            color: notifire.getblackcolor,
                                            fontSize: 15),
                                        contentPadding: const EdgeInsets.only(
                                            left: 20, right: 20),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(12),
                                            borderSide:
                                            BorderSide(color: grey2)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                            BorderRadius.circular(12)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: blue),
                                            borderRadius:
                                            BorderRadius.circular(12)),
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
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Meta Description',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xff727880),
                                        fontFamily: 'InterRegular',
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    height: 45,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          color: notifire.getgrey1,
                                        )),
                                    child: TextField(
                                      style: TextStyle(
                                        color: notifire.getblackcolor,
                                      ),
                                      decoration: InputDecoration(
                                        hintText: 'Meta Description',
                                        hintStyle: const TextStyle(
                                            color: Color(0xffC6C8CB),
                                            fontSize: 15),
                                        contentPadding: const EdgeInsets.only(
                                            left: 20, right: 20),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(12),
                                            borderSide:
                                            BorderSide(color: grey2)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                            BorderRadius.circular(12)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: blue),
                                            borderRadius:
                                            BorderRadius.circular(12)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color(0xff7DC066),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 45,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(12),
                                            border: Border.all(
                                              color: notifire.getgrey1,
                                            )),
                                        child: TextField(
                                          style: TextStyle(
                                            color: notifire.getblackcolor,
                                          ),
                                          decoration: InputDecoration(
                                            hintText: 'Color Hex',
                                            hintStyle: TextStyle(
                                                color: notifire.getblackcolor,
                                                fontSize: 15),
                                            contentPadding:
                                            const EdgeInsets.only(
                                                left: 20, right: 20),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(12),
                                                borderSide:
                                                BorderSide(color: grey2)),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius:
                                                BorderRadius.circular(12)),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide:
                                                BorderSide(color: blue),
                                                borderRadius:
                                                BorderRadius.circular(12)),
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
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 45,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(12),
                                            border: Border.all(
                                              color: notifire.getgrey1,
                                            )),
                                        child: TextField(
                                          style: TextStyle(
                                            color: notifire.getblackcolor,
                                          ),
                                          decoration: InputDecoration(
                                            hintText: 'Name',
                                            hintStyle: TextStyle(
                                                color: notifire.getblackcolor,
                                                fontSize: 15),
                                            contentPadding:
                                            const EdgeInsets.only(
                                                left: 20, right: 20),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(12),
                                                borderSide:
                                                BorderSide(color: grey2)),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius:
                                                BorderRadius.circular(12)),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide:
                                                BorderSide(color: blue),
                                                borderRadius:
                                                BorderRadius.circular(12)),
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
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 45,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(12),
                                            border: Border.all(
                                              color: notifire.getgrey1,
                                            )),
                                        child: TextField(
                                          style: TextStyle(
                                            color: notifire.getblackcolor,
                                          ),
                                          decoration: InputDecoration(
                                            hintText: 'In Stocks',
                                            hintStyle: TextStyle(
                                                color: notifire.getblackcolor,
                                                fontSize: 15),
                                            contentPadding:
                                            const EdgeInsets.only(
                                                left: 20, right: 20),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(12),
                                                borderSide:
                                                BorderSide(color: grey2)),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius:
                                                BorderRadius.circular(12)),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide:
                                                BorderSide(color: blue),
                                                borderRadius:
                                                BorderRadius.circular(12)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Center(
                                  child: InkWell(
                                    onTap: () {
                                      dataa.removeAt(0);
                                      setState(() {});
                                    },
                                    child: Image.asset(
                                      'assets/trash.png',
                                      height: 16,
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: dataa.length,
                          itemBuilder: (context, index) {
                            return dataa[index];
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            dataa.add(Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: model().detcol[selectIndex],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 45,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(12),
                                              border: Border.all(
                                                color: notifire.getgrey1,
                                              )),
                                          child: TextField(
                                            style: TextStyle(
                                              color: notifire.getblackcolor,
                                            ),
                                            decoration: InputDecoration(
                                              hintText: 'Color Hex',
                                              hintStyle: TextStyle(
                                                  color: notifire.getblackcolor,
                                                  fontSize: 15),
                                              contentPadding:
                                              const EdgeInsets.only(
                                                  left: 20, right: 20),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(12),
                                                  borderSide:
                                                  BorderSide(color: grey2)),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      12)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide:
                                                  BorderSide(color: blue),
                                                  borderRadius:
                                                  BorderRadius.circular(
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
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 45,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(12),
                                              border: Border.all(
                                                color: notifire.getgrey1,
                                              )),
                                          child: TextField(
                                            style: TextStyle(
                                              color: notifire.getblackcolor,
                                            ),
                                            decoration: InputDecoration(
                                              hintText: 'Name',
                                              hintStyle: TextStyle(
                                                  color: notifire.getblackcolor,
                                                  fontSize: 15),
                                              contentPadding:
                                              const EdgeInsets.only(
                                                  left: 20, right: 20),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(12),
                                                  borderSide:
                                                  BorderSide(color: grey2)),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      12)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide:
                                                  BorderSide(color: blue),
                                                  borderRadius:
                                                  BorderRadius.circular(
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
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 45,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(12),
                                              border: Border.all(
                                                color: notifire.getgrey1,
                                              )),
                                          child: TextField(
                                            style: TextStyle(
                                              color: notifire.getblackcolor,
                                            ),
                                            decoration: InputDecoration(
                                              hintText: 'In Stocks',
                                              hintStyle: TextStyle(
                                                  color: notifire.getblackcolor,
                                                  fontSize: 15),
                                              contentPadding:
                                              const EdgeInsets.only(
                                                  left: 20, right: 20),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(12),
                                                  borderSide:
                                                  BorderSide(color: grey2)),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      12)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide:
                                                  BorderSide(color: blue),
                                                  borderRadius:
                                                  BorderRadius.circular(
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
                                  Center(
                                    child: InkWell(
                                      onTap: () {
                                        dataa.removeAt(0);
                                        setState(() {});
                                      },
                                      child: Image.asset(
                                        'assets/trash.png',
                                        height: 16,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ));
                            setState(() {});
                          },
                          child: Container(
                            width: 80,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: notifire.getbgcolor10,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.add,
                                  size: 20,
                                  color: notifire.getblackcolor,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                const Text(
                                  'Add',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xff727880),
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'InterRegular'),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: notifire.getbgcolor11),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sizes',
                          style: TextStyle(
                              fontSize: 16,
                              color: notifire.getblackcolor,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'InterRegular'),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ListView.builder(
                          itemCount: 1,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 45,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(12),
                                            border: Border.all(
                                              color: notifire.getgrey1,
                                            )),
                                        child: TextField(
                                          style: TextStyle(
                                            color: notifire.getblackcolor,
                                          ),
                                          decoration: InputDecoration(
                                            hintText: 'Name',
                                            hintStyle: TextStyle(
                                                color: notifire.getblackcolor,
                                                fontSize: 15),
                                            contentPadding:
                                            const EdgeInsets.only(
                                                left: 20, right: 20),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(12),
                                                borderSide:
                                                BorderSide(color: grey2)),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius:
                                                BorderRadius.circular(12)),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide:
                                                BorderSide(color: blue),
                                                borderRadius:
                                                BorderRadius.circular(12)),
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
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 45,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(12),
                                            border: Border.all(
                                              color: notifire.getgrey1,
                                            )),
                                        child: TextField(
                                          style: TextStyle(
                                            color: notifire.getblackcolor,
                                          ),
                                          decoration: InputDecoration(
                                            hintText: 'In Stocks',
                                            hintStyle: TextStyle(
                                                color: notifire.getblackcolor,
                                                fontSize: 15),
                                            contentPadding:
                                            const EdgeInsets.only(
                                                left: 20, right: 20),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(12),
                                                borderSide:
                                                BorderSide(color: grey2)),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius:
                                                BorderRadius.circular(12)),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide:
                                                BorderSide(color: blue),
                                                borderRadius:
                                                BorderRadius.circular(12)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    dataa1.removeAt(1);
                                    setState(() {});
                                  },
                                  child: Image.asset(
                                    'assets/trash.png',
                                    height: 16,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: dataa1.length,
                          itemBuilder: (context, index) {
                            return dataa1[index];
                          },
                        ),
                        InkWell(
                          onTap: () {
                            dataa1.add(Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 45,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(12),
                                              border: Border.all(
                                                color: notifire.getgrey1,
                                              )),
                                          child: TextField(
                                            style: TextStyle(
                                              color: notifire.getblackcolor,
                                            ),
                                            decoration: InputDecoration(
                                              hintText: 'Name',
                                              hintStyle: TextStyle(
                                                  color: notifire.getblackcolor,
                                                  fontSize: 15),
                                              contentPadding:
                                              const EdgeInsets.only(
                                                  left: 20, right: 20),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(12),
                                                  borderSide:
                                                  BorderSide(color: grey2)),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      12)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide:
                                                  BorderSide(color: blue),
                                                  borderRadius:
                                                  BorderRadius.circular(
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
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 45,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(12),
                                              border: Border.all(
                                                color: notifire.getgrey1,
                                              )),
                                          child: TextField(
                                            style: TextStyle(
                                              color: notifire.getblackcolor,
                                            ),
                                            decoration: InputDecoration(
                                              hintText: 'In Stocks',
                                              hintStyle: TextStyle(
                                                  color: notifire.getblackcolor,
                                                  fontSize: 15),
                                              contentPadding:
                                              const EdgeInsets.only(
                                                  left: 20, right: 20),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(12),
                                                  borderSide:
                                                  BorderSide(color: grey2)),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      12)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide:
                                                  BorderSide(color: blue),
                                                  borderRadius:
                                                  BorderRadius.circular(
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
                                  InkWell(
                                    onTap: () {
                                      dataa1.removeAt(0);
                                      setState(() {});
                                    },
                                    child: Image.asset(
                                      'assets/trash.png',
                                      height: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ));
                            setState(() {});
                          },
                          child: Container(
                            width: 80,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: notifire.getbgcolor10,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.add,
                                  size: 20,
                                  color: notifire.getblackcolor,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                const Text(
                                  'Add',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xff727880),
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'InterRegular'),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            children: [
              Container(
                  height: Get.height,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: notifire.getbgcolor11,
                  ),
                  child: SizedBox(
                    height: Get.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Publish',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: notifire.getblackcolor,
                                fontFamily: 'InterRegular',
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Status',
                                    style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        fontSize: 12,
                                        color: Color(0xff727880),
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  DropdownButtonHideUnderline(
                                    child: DropdownButton2<String>(
                                      isExpanded: true,
                                      hint: Row(
                                        children: [
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Expanded(
                                            child: Text(
                                              'Published',
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
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight:
                                                  FontWeight.bold,
                                                  color: notifire
                                                      .getblackcolor),
                                              overflow:
                                              TextOverflow.ellipsis,
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
                                            borderRadius:
                                            BorderRadius.circular(14),
                                            border: Border.all(
                                              color: notifire.getgrey1,
                                            ),
                                            color: notifire.getbgcolor10),
                                        elevation: 0,
                                      ),
                                      iconStyleData: const IconStyleData(
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_outlined,
                                          size: 25,
                                          color: Color(0xff9DA2A7),
                                        ),
                                        iconSize: 14,
                                        iconEnabledColor: Colors.black,
                                        iconDisabledColor: Colors.grey,
                                      ),
                                      dropdownStyleData: DropdownStyleData(
                                        maxHeight: 200,
                                        width: 200,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(14),
                                            color: notifire.getbgcolor10),
                                        offset: const Offset(-20, 0),
                                        scrollbarTheme: ScrollbarThemeData(
                                          radius: const Radius.circular(40),
                                          thickness:
                                          MaterialStateProperty.all<double>(
                                              6),
                                          thumbVisibility:
                                          MaterialStateProperty.all<bool>(
                                              true),
                                        ),
                                      ),
                                      menuItemStyleData:
                                      const MenuItemStyleData(
                                        height: 40,
                                        padding: EdgeInsets.only(
                                            left: 14, right: 14),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'Visibility',
                                    style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        fontSize: 12,
                                        color: Color(0xff727880),
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  DropdownButtonHideUnderline(
                                    child: DropdownButton2<String>(
                                      isExpanded: true,
                                      hint: Row(
                                        children: [
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Expanded(
                                            child: Text(
                                              'Public',
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
                                      items: items1
                                          .map((String item1) =>
                                          DropdownMenuItem<String>(
                                            value: item1,
                                            child: Text(
                                              item1,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight:
                                                  FontWeight.bold,
                                                  color: notifire
                                                      .getblackcolor),
                                              overflow:
                                              TextOverflow.ellipsis,
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
                                        width: Get.width * 0.2,
                                        padding: const EdgeInsets.only(
                                            left: 14, right: 14),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(14),
                                            border: Border.all(
                                              color: notifire.getgrey1,
                                            ),
                                            color: notifire.getbgcolor10),
                                        elevation: 0,
                                      ),
                                      iconStyleData: const IconStyleData(
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_outlined,
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
                                            borderRadius:
                                            BorderRadius.circular(14),
                                            color: notifire.getbgcolor10),
                                        offset: const Offset(-20, 0),
                                        scrollbarTheme: ScrollbarThemeData(
                                          radius: const Radius.circular(40),
                                          thickness:
                                          MaterialStateProperty.all<double>(
                                              6),
                                          thumbVisibility:
                                          MaterialStateProperty.all<bool>(
                                              true),
                                        ),
                                      ),
                                      menuItemStyleData:
                                      const MenuItemStyleData(
                                        height: 40,
                                        padding: EdgeInsets.only(
                                            left: 14, right: 14),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'Schedule Date & Time',
                                    style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        fontSize: 12,
                                        color: Color(0xff727880),
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: Get.width * 0.2,
                                    height: 45,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: notifire.getgrey1,
                                        ),
                                        borderRadius:
                                        BorderRadius.circular(15)),
                                    child: TextField(
                                      onTap: () {
                                        buildDialog();
                                      },
                                      controller: dateController1,
                                      readOnly: true,
                                      keyboardType: TextInputType.datetime,
                                      decoration: InputDecoration(
                                        suffixIcon: Image.asset(
                                            AppContent.calendar,
                                            scale: 3,
                                            color: const Color(0xff9DA2A7)),
                                        hintText:
                                        "${selectedDate1.day}-${selectedDate1
                                            .month}-${selectedDate1.year}",
                                        hintStyle: TextStyle(
                                            color: notifire.getblackcolor,
                                            fontFamily: 'UrbanistBold',
                                            fontSize: 15),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(12),
                                            borderSide:
                                            BorderSide(color: grey2)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                            BorderRadius.circular(12)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: blue),
                                            borderRadius:
                                            BorderRadius.circular(12)),
                                      ),
                                    ),
                                  ),
                                ]),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Categories',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: notifire.getblackcolor,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'InterRegular'),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: notifire.getbgcolor10,
                              ),
                              child: const Text('Automotive Accessories',
                                  style: TextStyle(
                                      fontFamily: 'InterRegular',
                                      color: Color(0xff727880),
                                      fontSize: 14)),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Select Categories',
                                    style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        fontSize: 12,
                                        color: Color(0xff727880),
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  DropdownButtonHideUnderline(
                                    child: DropdownButton2<String>(
                                      isExpanded: true,
                                      hint: Row(
                                        children: [
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Expanded(
                                            child: Text(
                                              'Select Categories',
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
                                      items: items2
                                          .map((String item2) =>
                                          DropdownMenuItem<String>(
                                            value: item2,
                                            child: Text(
                                              item2,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight:
                                                  FontWeight.bold,
                                                  color: notifire
                                                      .getblackcolor),
                                              overflow:
                                              TextOverflow.ellipsis,
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
                                          borderRadius:
                                          BorderRadius.circular(14),
                                          color: notifire.getbgcolor10,
                                          border: Border.all(
                                            color: notifire.getgrey1,
                                          ),
                                        ),
                                        elevation: 0,
                                      ),
                                      iconStyleData: const IconStyleData(
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_outlined,
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
                                            borderRadius:
                                            BorderRadius.circular(14),
                                            border: Border.all(
                                              color: notifire.getgrey1,
                                            ),
                                            color: notifire.getbgcolor10),
                                        offset: const Offset(-20, 0),
                                        scrollbarTheme: ScrollbarThemeData(
                                          radius: const Radius.circular(40),
                                          thickness:
                                          MaterialStateProperty.all<double>(
                                              6),
                                          thumbVisibility:
                                          MaterialStateProperty.all<bool>(
                                              true),
                                        ),
                                      ),
                                      menuItemStyleData:
                                      const MenuItemStyleData(
                                        height: 40,
                                        padding: EdgeInsets.only(
                                            left: 14, right: 14),
                                      ),
                                    ),
                                  ),
                                ]),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: Get.width * 0.2,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: notifire.getbgcolor10),
                                child: TextFieldTags<String>(
                                    textfieldTagsController:
                                    _stringTagController,
                                    initialTags: const ['python', 'java'],
                                    textSeparators: const [' ', ','],
                                    inputFieldBuilder:
                                        (context, inputFieldValues) {
                                      return TextField(
                                        onTap: () {
                                          _stringTagController.getFocusNode
                                              ?.requestFocus();
                                        },
                                        // maxLines: 6,
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.circular(15),
                                              borderSide: BorderSide.none),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.circular(15),
                                              borderSide: BorderSide(
                                                  color: notifire.getgrey1)),
                                          disabledBorder: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.circular(15),
                                              borderSide: BorderSide.none),
                                          hintText:
                                          inputFieldValues.tags.isNotEmpty
                                              ? ''
                                              : "Enter tag...",
                                          hintStyle: TextStyle(color: grey3),
                                          prefixIcon: inputFieldValues
                                              .tags.isNotEmpty
                                              ? SingleChildScrollView(
                                            controller: inputFieldValues
                                                .tagScrollController,
                                            scrollDirection:
                                            Axis.vertical,
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.all(8),
                                              child: Wrap(
                                                  runSpacing: 4.0,
                                                  spacing: 4.0,
                                                  children:
                                                  inputFieldValues
                                                      .tags
                                                      .map((String
                                                  tag) {
                                                    return Container(
                                                      decoration:
                                                      BoxDecoration(
                                                        borderRadius:
                                                        const BorderRadius
                                                            .all(
                                                            Radius.circular(
                                                                15)),
                                                        color: notifire
                                                            .getbgcolor11,
                                                      ),
                                                      margin:
                                                      const EdgeInsets
                                                          .only(
                                                          right: 10),
                                                      padding:
                                                      const EdgeInsets
                                                          .all(8),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        mainAxisSize:
                                                        MainAxisSize
                                                            .min,
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                        children: [
                                                          Center(
                                                              child: Text(
                                                                  '#$tag',
                                                                  style: TextStyle(
                                                                      color:
                                                                      notifire
                                                                          .getblackcolor,
                                                                      fontFamily: 'InterRegular'))),
                                                          const SizedBox(
                                                              width: 5),
                                                          InkWell(
                                                            child: const Icon(
                                                                Icons
                                                                    .cancel_outlined,
                                                                size: 18,
                                                                color: Color(
                                                                    0xff595FE5)),
                                                            onTap: () {
                                                              inputFieldValues
                                                                  .onTagRemoved(
                                                                  tag);
                                                            },
                                                          )
                                                        ],
                                                      ),
                                                    );
                                                  }).toList()),
                                            ),
                                          )
                                              : null,
                                          suffixIcon: inputFieldValues
                                              .tags.isNotEmpty
                                              ? InkWell(
                                              onTap: () {
                                                _stringTagController
                                                    .clearTags();
                                              },
                                              child: Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    top: 10, right: 10),
                                                child: Text('All Clear'.tr,
                                                    style: TextStyle(
                                                        color: notifire
                                                            .getblackcolor,
                                                        fontFamily:
                                                        'InterRegular')),
                                              ))
                                              : Padding(
                                            padding:
                                            const EdgeInsets.only(
                                                top: 10, right: 10),
                                            child: Text('All Clear'.tr,
                                                style: TextStyle(
                                                    color: notifire
                                                        .getblackcolor,
                                                    fontFamily:
                                                    'InterRegular')),
                                          ),
                                        ),
                                        controller: inputFieldValues
                                            .textEditingController,
                                        focusNode: inputFieldValues.focusNode,
                                        onChanged:
                                        inputFieldValues.onTagChanged,
                                        onSubmitted:
                                        inputFieldValues.onTagSubmitted,
                                      );
                                    }),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: Get.width * 0.2,
                          child: Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {},
                                  child: Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: notifire.getbgcolor10,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: const Center(
                                        child: Text(
                                          'Canccel',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'InterRegular',
                                              color: Color(0xff727880)),
                                        )),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {},
                                  child: Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: const Color(0xff595FE5)),
                                    child: const Center(
                                        child: Text('Update',
                                            style: TextStyle(
                                                fontFamily: 'InterRegular',
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500))),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
            ],
          )
        ],
      );
    }
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

