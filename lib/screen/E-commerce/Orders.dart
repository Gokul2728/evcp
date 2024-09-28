// ignore_for_file: deprecated_member_use, non_constant_identifier_names
// ignore_for_file: prefer_const_constructors, file_names, camel_case_types



import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:evcp/controller/page_controller.dart';
import 'package:evcp/screen/Dashboard/Dashboard_main.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../confing/colors.dart';

import '../../confing/image.dart';
import '../../confing/notifier.dart';
import '../de.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  int value = 0;
  int selectIndex = 0;
  int selectTime1 = 0;
  late ColorNotifier notifire;
  bool tap = false;
  SampleItem? selectedMenu;
  DateTime selectedDate = DateTime.now();
  InboxController inboxController = Get.put(InboxController());
  TextEditingController dateController = TextEditingController();
  DateRangePickerController dateSelecter = DateRangePickerController();
  TextEditingController dateController1 = TextEditingController();
  String? selectedValue;
  String? selectedValue1;
  String? selectedValue2;
  DateTime selectedDate1 = DateTime.now();
  final List<String> items3 = [
    'Macbook Pro',
    'Gopro',
    'Chair',
    'Dell',
    'Fashion',
    'HP',
  ];
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
  List iteamcolor = [
    const Color(0xffF3935D),
    const Color(0xff7DC066),
    const Color(0xff59B4D1),
    const Color(0xff9DA2A7),
    const Color(0xffF3935D),
    const Color(0xff7DC066),
    const Color(0xff59B4D1),
    const Color(0xff9DA2A7),
    const Color(0xffF3935D),
    const Color(0xff7DC066),
    const Color(0xff59B4D1),
    const Color(0xff9DA2A7),
    const Color(0xffF3935D),
    const Color(0xff7DC066),
    const Color(0xff59B4D1),
    const Color(0xff9DA2A7),
    const Color(0xffF3935D),
  ];
  String dropdownvalue = 'All Date';
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
    'Bank Transfer',
    'Visa Card',
    'Bitcoin',
    'Bank Transfer',
    'Visa Card',
    'Bitcoin',
    'Bitcoin',
    'Bank Transfer',
    'Bank Transfer',
    'Bank Transfer',
    'Visa Card',
    'Bitcoin',
    'Bank Transfer',
    'Visa Card',
    'Bitcoin',
    'Bitcoin',
    'Bank Transfer',
    'Bank Transfer',
  ];
  List orders = [
    'Pickups',
    'Delivered',
    'In Progress',
    'Canceled',
    'Pickups',
    'Delivered',
    'In Progress',
    'Canceled',
    'Pickups',
    'Delivered',
    'In Progress',
    'Canceled',
    'Pickups',
    'Delivered',
    'In Progress',
    'Canceled',
    'In Progress',
  ];
  List ster = [
    '5',
    '9',
    '45',
    '23',
    '42',
    '32',
    '58',
    '33',
    '12',
    '29',
    '42',
    '45',
    '23',
    '42',
    '32',
    '50',
    '35',
    '12',
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
  bool isActive = false;
  var selectedPageNumber = 4;

  int _itemCount = 0;
  DateTime? sdate;
  TimeOfDay? selectTime;

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
                    container1(constraints.maxWidth),
                  ],
                ),
              ),
            ),
          );
        } else if (constraints.maxWidth < 1000) {
          return Container(
            decoration: BoxDecoration(color: notifire.getbgcolor10),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    container1(constraints.maxWidth),
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
                color: notifire.getbgcolor10,
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

  Widget firstContainer({context, constraints}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      child: Column(
        children: [
          Row(
            children: [
              const Spacer(),
              SvgPicture.asset(
                'assets/house-door.svg',
                height: 16,
                color: Colors.blue,
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                  onTap: () {
                    inboxController.setTextIsTrue(1);
                  },
                  child: Text('Dashboard',
                      style: TextStyle(
                        fontFamily: 'InterRegular',
                        fontSize: 14,
                        color: greyy,
                      ))),
              const SizedBox(
                width: 10,
              ),
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: greyy,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'E-commerce',
                style: TextStyle(
                    color: greyy, fontSize: 14, fontFamily: 'InterRegular'),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: greyy,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Orders',
                style: TextStyle(
                    color: notifire.getblackcolor,
                    fontSize: 14,
                    fontFamily: 'InterRegular'),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              constraints < 600
                  ? const SizedBox()
                  : Expanded(flex: 5, child: container1(constraints)),
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

        Padding(
          padding: const EdgeInsets.only(top: 15,bottom: 15),
          child: Text(title,
              style: TextStyle(color: notifire.getblackcolor,fontFamily: 'InterRegular')),
        ),


      ],
    );
  }
  Widget container1(constraints) {
    return constraints < 600
        ? Column(
            children: [
              Row(
                children: [
                  const Spacer(),
                  SvgPicture.asset(
                    'assets/house-door.svg',
                    height: 16,
                    color: Colors.blue,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                      onTap: () {
                        inboxController.setTextIsTrue(1);
                      },
                      child: Text('Dashboard',
                          style: TextStyle(
                            fontFamily: 'InterRegular',
                            fontSize: 14,
                            color: greyy,
                          ))),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: greyy,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'E-commerce',
                    style: TextStyle(
                        color: greyy, fontSize: 14, fontFamily: 'InterRegular'),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: greyy,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Orders',
                    style: TextStyle(
                        color: notifire.getblackcolor,
                        fontSize: 14,
                        fontFamily: 'InterRegular'),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
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
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            height: 50,
                            padding: EdgeInsets.zero,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadiusDirectional.circular(10),
                              color: notifire.getbgcolor11,
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
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10),
                                                          topLeft:
                                                              Radius.circular(
                                                                  10))))),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Published',
                                            style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                              color: notifire.getblackcolor,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: notifire.Getblg2),
                                            padding: const EdgeInsets.all(5),
                                            child: const Text('12,666',
                                                style: TextStyle(
                                                    fontFamily: 'InterRegular',
                                                    fontSize: 10,
                                                    color: Color(0xff9DA2A7))),
                                          )
                                        ],
                                      ),
                                      onPressed: () {},
                                    ),
                                    Container(
                                      height: 48,
                                      width: 1,
                                      decoration: BoxDecoration(
                                        color: notifire.getgrey1,
                                      ),
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
                                              color: notifire.getblackcolor,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: notifire.Getblg2),
                                            padding: const EdgeInsets.all(5),
                                            child: const Text('789',
                                                style: TextStyle(
                                                    fontFamily: 'InterRegular',
                                                    fontSize: 10,
                                                    color: Color(0xff9DA2A7))),
                                          )
                                        ],
                                      ),
                                      onPressed: () {},
                                    ),
                                    Container(
                                      height: 48,
                                      width: 1,
                                      decoration: BoxDecoration(
                                        color: notifire.getgrey1,
                                      ),
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
                                              color: notifire.getblackcolor,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: notifire.Getblg2),
                                            padding: const EdgeInsets.all(5),
                                            child: const Text('166',
                                                style: TextStyle(
                                                    fontFamily: 'InterRegular',
                                                    fontSize: 10,
                                                    color: Color(0xff9DA2A7))),
                                          )
                                        ],
                                      ),
                                      onPressed: () {},
                                    ),
                                    Container(
                                      height: 48,
                                      width: 1,
                                      decoration: BoxDecoration(
                                        color: notifire.getgrey1,
                                      ),
                                    ),
                                    TextButton(
                                      style: const ButtonStyle(
                                          shape: MaterialStatePropertyAll(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topRight:
                                                              Radius.circular(
                                                                  10),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  10))))),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Deleted',
                                            style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                              color: notifire.getblackcolor,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Container(
                                            width: 14,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: notifire.Getblg2),
                                            padding: const EdgeInsets.all(5),
                                            child: const Center(
                                                child: Text('9',
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'InterRegular',
                                                        fontSize: 10,
                                                        color: Color(
                                                            0xff9DA2A7)))),
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
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Spacer(),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: notifire.getbgcolor11,
                                ),
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
                                    child: SingleChildScrollView(
                                      child: StatefulBuilder(
                                        builder: (context, setState) {
                                          return Padding(
                                            padding: const EdgeInsets.all(12),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Create New Order',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontFamily: 'InterRegular',
                                                    fontWeight: FontWeight.w500,
                                                    color:
                                                        notifire.getblackcolor,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                      'Customer Name',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontFamily:
                                                              'InterRegular',
                                                          color: Color(
                                                              0xff727880)),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Container(
                                                      height: 45,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          border: Border.all(
                                                              color: notifire
                                                                  .Getblg2)),
                                                      child: TextField(
                                                        style: TextStyle(
                                                          color: notifire
                                                              .getblackcolor,
                                                        ),
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              'Enter Name',
                                                          hintStyle: TextStyle(
                                                              color: notifire
                                                                  .getblackcolor,
                                                              fontSize: 15),
                                                          contentPadding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 20,
                                                                  right: 20),
                                                          border: OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12),
                                                              borderSide: BorderSide(
                                                                  color: notifire
                                                                      .getgrey1)),
                                                          enabledBorder:
                                                              OutlineInputBorder(
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
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                const Text(
                                                  'Order Date',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontFamily: 'InterRegular',
                                                    color: Color(0xff727880),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        height: 45,
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color: notifire
                                                                    .getgrey1),
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
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Expanded(
                                                      child: InkWell(
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
                                                                color: notifire
                                                                    .Getblg2),
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
                                                                          15,
                                                                      color: notifire
                                                                          .getblackcolor,
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
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .start,
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                        children: [
                                                          Text(
                                                            'Payment Method',
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                fontFamily:
                                                                'InterRegular',
                                                                color: Color(0xff727880),
                                                                fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                          ),
                                                          const SizedBox(
                                                            height: 5,
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
                                                               
                                                                padding: const EdgeInsets.only(
                                                                    left: 14, right: 14),
                                                                decoration: BoxDecoration(
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
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .start,
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                        children: [
                                                          const Text(
                                                            'Status',
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                fontFamily:
                                                                'InterRegular',
                                                                color: Color(
                                                                    0xff727880),
                                                                fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                          ),
                                                          const SizedBox(
                                                            height: 5,
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
                                                              
                                                                padding: const EdgeInsets.only(
                                                                    left: 14, right: 14),
                                                                decoration: BoxDecoration(
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
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
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
                                                          color: notifire
                                                              .getgrey1)),
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
                                                          "Details about the order",
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
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  'Products',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: 'InterRegular',
                                                    color:
                                                        notifire.getblackcolor,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const Text(
                                                            'Product',
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                fontFamily:
                                                                    'InterRegular',
                                                                color: Color(
                                                                    0xff727880),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                          const SizedBox(
                                                            height: 5,
                                                          ),
                                                          Container(
                                                            height: 45,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12),
                                                                border: Border.all(
                                                                    color: notifire
                                                                        .getgrey1)),
                                                            child: TextField(
                                                              style: TextStyle(
                                                                color: notifire
                                                                    .getblackcolor,
                                                              ),
                                                              decoration:
                                                                  InputDecoration(
                                                                hintText:
                                                                    'Select',
                                                                suffixIcon:
                                                                    Icon(
                                                                  Icons
                                                                      .keyboard_arrow_down,
                                                                  color: notifire
                                                                      .getblackcolor,
                                                                ),
                                                                hintStyle: TextStyle(
                                                                    color: notifire
                                                                        .getblackcolor,
                                                                    fontSize:
                                                                        15),
                                                                contentPadding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        left:
                                                                            20,
                                                                        right:
                                                                            20),
                                                                border: OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
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
                                                                        BorderRadius.circular(
                                                                            12)),
                                                                focusedBorder: OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                blue),
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
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 22),
                                                      child: Container(
                                                        height: 45,
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                              color: notifire
                                                                  .Getblg2),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                        ),
                                                        child: Row(
                                                          children: [
                                                            Row(
                                                              children: <Widget>[
                                                                IconButton(
                                                                  icon: Icon(
                                                                    Icons
                                                                        .remove,
                                                                    color: notifire
                                                                        .getblackcolor,
                                                                  ),
                                                                  onPressed: () =>
                                                                      setState(() =>
                                                                          _itemCount--),
                                                                ),
                                                                Container(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .all(
                                                                            12),
                                                                    decoration: BoxDecoration(
                                                                        border: Border(
                                                                            right: BorderSide(
                                                                              color: notifire.Getblg2,
                                                                            ),
                                                                            left: BorderSide(
                                                                              color: notifire.Getblg2,
                                                                            ))),
                                                                    child: Text(
                                                                      _itemCount
                                                                          .toString(),
                                                                      style:
                                                                          TextStyle(
                                                                        color: notifire
                                                                            .getblackcolor,
                                                                      ),
                                                                    )),
                                                                IconButton(
                                                                    icon: Icon(
                                                                      Icons.add,
                                                                      color: notifire
                                                                          .getblackcolor,
                                                                    ),
                                                                    onPressed: () =>
                                                                        setState(() =>
                                                                            _itemCount++))
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                InkWell(
                                                  onTap: () {},
                                                  child: Container(
                                                    width: 80,
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color:
                                                              notifire.Getblg2),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Icon(Icons.add,
                                                            color: notifire
                                                                .getblackcolor,
                                                            size: 20),
                                                        const SizedBox(
                                                          width: 8,
                                                        ),
                                                        const Text(
                                                          'Add',
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              color: Color(
                                                                  0xff727880),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontFamily:
                                                                  'InterRegular'),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
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
                                                          color: notifire
                                                              .getbgcolor10,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                        ),
                                                        child: const Center(
                                                            child: Text(
                                                          'Cancel',
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontFamily:
                                                                  'InterRegular',
                                                              color: Color(
                                                                  0xff727880)),
                                                        )),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
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
                                                  ],
                                                )
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    )),
                              ],
                              child: Container(
                                padding: const EdgeInsets.all(11),
                                decoration: BoxDecoration(
                                    color: const Color(0xff595FE5),
                                    borderRadius: BorderRadius.circular(12)),
                                child: Row(children: [
                                  Image.asset(
                                    'assets/add.png',
                                    scale: 4,
                                  ),
                                ]),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 760,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Table(
                                          border: TableBorder(horizontalInside: BorderSide(color: notifire.Getblg2)),
                                          // columnWidths: const {
                                          //   0: FixedColumnWidth(100),
                                          //   1: FixedColumnWidth(140),
                                          //   2: FixedColumnWidth(250),
                                          //   3: FixedColumnWidth(240),
                                          //   4: FixedColumnWidth(140),
                                          //   5: FixedColumnWidth(140),
                                          //   6: FixedColumnWidth(200),
                                          //   7: FixedColumnWidth(150),
                                          //   8: FixedColumnWidth(130),
                                          // },
                                          children: [

                                            TableRow(children: [
                                              dataColumn1(
                                                  title: "",
                                                  iscenter: true),
                                              dataColumn1(
                                                  title: "Orders ID",
                                                  iscenter: false),
                                              dataColumn1(
                                                  title: "Product ",
                                                  iscenter: false),
                                              dataColumn1(
                                                  title: "Order Date",
                                                  iscenter: false),
                                              dataColumn1(
                                                  title: "Payment Method",
                                                  iscenter: true),
                                              dataColumn1(
                                                  title: "Status",
                                                  iscenter: true),
                                              dataColumn1(
                                                  title: "Q.ty",
                                                  iscenter: true),
                                              dataColumn1(
                                                  title: "Amount",
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
                                                          vertical: 20,horizontal: 2),
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
                                                          vertical: 35),
                                                      child: Text(
                                                          listtiletitle[a],
                                                          style: TextStyle(color: notifire.getblackcolor,fontSize: 13,fontFamily: 'InterRegular')),
                                                    ),
                                                    Transform.translate(offset: Offset(-10, 0),
                                                      child: Padding(
                                                        padding: const EdgeInsets.symmetric(
                                                          vertical: 15,),
                                                        child: Center(
                                                          child:ListTile(

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

                                                      ),
                                                    ),
                                                    Padding(
                                                        padding: const EdgeInsets.symmetric(
                                                          vertical: 35,),
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
                                                          vertical: 35),
                                                      child: Center(
                                                        child: Text(stoek[a],
                                                            style: TextStyle(color: notifire.getblackcolor,  fontFamily: 'InterRegular',
                                                              fontSize: 13,)),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(
                                                          vertical: 35),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Text(
                                                            orders[a],
                                                            style: TextStyle(
                                                              fontFamily: 'InterRegular',
                                                              fontSize: 13,
                                                              color: iteamcolor[a],
                                                            ),
                                                          )
                                                        ],
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
                                                      padding: const EdgeInsets.symmetric(vertical: 35),
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
            ],
          )
        : SingleChildScrollView(
            child: Column(
              children: [
                DefaultTabController(
                  length: 2,
                  initialIndex: 0,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 40,
                            padding: EdgeInsets.zero,
                            decoration: BoxDecoration(
                              color: notifire.getbgcolor11,
                              borderRadius:
                                  BorderRadiusDirectional.circular(10),
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
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10),
                                                          topLeft:
                                                              Radius.circular(
                                                                  10))))),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Published',
                                            style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                              color: notifire.getblackcolor,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                              color: notifire.Getblg2,
                                            ),
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
                                        color: notifire.getgrey1,
                                      ),
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
                                              color: notifire.getblackcolor,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                              color: notifire.Getblg2,
                                            ),
                                            padding: const EdgeInsets.all(3),
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
                                        color: notifire.getgrey1,
                                      ),
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
                                              color: notifire.getblackcolor,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                              color: notifire.Getblg2,
                                            ),
                                            padding: const EdgeInsets.all(3),
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
                                        color: notifire.getgrey1,
                                      ),
                                    ),
                                    TextButton(
                                      style: const ButtonStyle(
                                          shape: MaterialStatePropertyAll(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topRight:
                                                              Radius.circular(
                                                                  10),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  10))))),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Deleted',
                                            style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                              color: notifire.getblackcolor,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Container(
                                            width: 12,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                              color: notifire.Getblg2,
                                            ),
                                            padding: const EdgeInsets.all(3),
                                            child: const Center(
                                                child: Text('9',
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'InterRegular',
                                                        fontSize: 8,
                                                        color: Color(
                                                            0xff9DA2A7)))),
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
                                color: notifire.getbgcolor11,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Center(
                                    child: Image.asset(
                                  'assets/setting-5.png',
                                  color: notifire.getblackcolor,
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Create New Order',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontFamily: 'InterRegular',
                                                  fontWeight: FontWeight.w500,
                                                  color: notifire.getblackcolor,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    'Customer Name',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontFamily:
                                                            'InterRegular',
                                                        color:
                                                            Color(0xff727880)),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Container(
                                                    height: 45,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        border: Border.all(
                                                          color:
                                                              notifire.getgrey1,
                                                        )),
                                                    child: TextField(
                                                      style: TextStyle(
                                                        color: notifire
                                                            .getblackcolor,
                                                      ),
                                                      decoration:
                                                          InputDecoration(
                                                        hintText: 'Enter Name',
                                                        hintStyle: TextStyle(
                                                            color: notifire
                                                                .getblackcolor,
                                                            fontSize: 15),
                                                        contentPadding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 20,
                                                                right: 20),
                                                        border:
                                                            OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12),
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: notifire
                                                                      .getgrey1,
                                                                )),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide
                                                                        .none,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12)),
                                                        focusedBorder:
                                                            OutlineInputBorder(
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
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              const Text(
                                                'Order Date',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'InterRegular',
                                                  color: Color(0xff727880),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      height: 45,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                            color: notifire
                                                                .getgrey1,
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
                                                          border:
                                                              OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12),
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: notifire
                                                                        .getgrey1,
                                                                  )),
                                                          enabledBorder:
                                                              OutlineInputBorder(
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
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Expanded(
                                                    child: InkWell(
                                                      onTap: () async {
                                                        final TimeOfDay? time =
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
                                                                  .circular(13),
                                                          border: Border.all(
                                                            color: notifire
                                                                .getgrey1,
                                                          ),
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
                                                                        15,
                                                                    color: notifire
                                                                        .getblackcolor,
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
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Payment Method',
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  'InterRegular',
                                                              color: notifire
                                                                  .getblackcolor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        const SizedBox(
                                                          height: 5,
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
                                                                ),
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
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Text(
                                                          'Status',
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  'InterRegular',
                                                              color: Color(
                                                                  0xff727880),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        const SizedBox(
                                                          height: 5,
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
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              const Text(
                                                'Note',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontFamily: 'InterRegular',
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
                                                      color: notifire.getgrey1,
                                                    )),
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
                                                        "Details about the order",
                                                    hintStyle: TextStyle(
                                                        color:
                                                            Color(0xffC6C8CB)),
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
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                'Products',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'InterRegular',
                                                  color: notifire.getblackcolor,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Text(
                                                          'Product',
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  'InterRegular',
                                                              color: Color(
                                                                  0xff727880),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                        const SizedBox(
                                                          height: 5,
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
                                                                    'Select',
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
                                                            value: selectedValue2,
                                                            onChanged: (String? value) {
                                                              setState(() {
                                                                selectedValue2 = value;
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
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 22),
                                                    child: Container(
                                                      height: 45,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                            color: notifire
                                                                .getgrey1,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          color: notifire
                                                              .getbgcolor10),
                                                      child: Row(
                                                        children: [
                                                          Row(
                                                            children: <Widget>[
                                                              IconButton(
                                                                icon: Icon(
                                                                  Icons.remove,
                                                                  color: notifire
                                                                      .getblackcolor,
                                                                ),
                                                                onPressed: () =>
                                                                    setState(() =>
                                                                        _itemCount--),
                                                              ),
                                                              Container(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          12),
                                                                  decoration: BoxDecoration(
                                                                      color: notifire.getbgcolor10,
                                                                      border: Border(
                                                                          right: BorderSide(
                                                                            color:
                                                                                notifire.getgrey1,
                                                                          ),
                                                                          left: BorderSide(
                                                                            color:
                                                                                notifire.getgrey1,
                                                                          ))),
                                                                  child: Text(
                                                                    _itemCount
                                                                        .toString(),
                                                                    style:
                                                                        TextStyle(
                                                                      color: notifire
                                                                          .getblackcolor,
                                                                    ),
                                                                  )),
                                                              IconButton(
                                                                  icon: Icon(
                                                                    Icons.add,
                                                                    color: notifire
                                                                        .getblackcolor,
                                                                  ),
                                                                  onPressed: () =>
                                                                      setState(() =>
                                                                          _itemCount++))
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              InkWell(
                                                onTap: () {},
                                                child: Container(
                                                  width: 80,
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                    color:
                                                        notifire.getbgcolor10,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Icon(Icons.add,
                                                          color: notifire
                                                              .getblackcolor,
                                                          size: 20),
                                                      const SizedBox(
                                                        width: 8,
                                                      ),
                                                      const Text(
                                                        'Add',
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            color: Color(
                                                                0xff727880),
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontFamily:
                                                                'InterRegular'),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      Get.back();
                                                    },
                                                    child: Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              12),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        color: notifire
                                                            .getbgcolor10,
                                                      ),
                                                      child: const Center(
                                                          child: Text(
                                                        'Cancel',
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontFamily:
                                                                'InterRegular',
                                                            color: Color(
                                                                0xff727880)),
                                                      )),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  InkWell(
                                                    onTap: () {},
                                                    child: Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              12),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          color: const Color(
                                                              0xff595FE5)),
                                                      child: const Center(
                                                          child: Text('Done',
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      'InterRegular',
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600))),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  )),
                            ],
                            child: Container(
                              padding: const EdgeInsets.all(11),
                              decoration: BoxDecoration(
                                  color: const Color(0xff595FE5),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Row(children: [
                                Image.asset(
                                  'assets/add.png',
                                  scale: 4,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  'Create Order',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'InterRegular',
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                )
                              ]),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 755,
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
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Table(
                                            border: TableBorder(horizontalInside: BorderSide(color: notifire.Getblg2)),
                                            // columnWidths: const {
                                            //   0: FixedColumnWidth(100),
                                            //   1: FixedColumnWidth(140),
                                            //   2: FixedColumnWidth(250),
                                            //   3: FixedColumnWidth(240),
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
                                                    title: "Orders ID",
                                                    iscenter: false),
                                                dataColumn1(
                                                    title: "Product ",
                                                    iscenter: false),
                                                dataColumn1(
                                                    title: "Order Date",
                                                    iscenter: false),
                                                dataColumn1(
                                                    title: "Payment Method",
                                                    iscenter: true),
                                                dataColumn1(
                                                    title: "Status",
                                                    iscenter: true),
                                                dataColumn1(
                                                    title: "Q.ty",
                                                    iscenter: true),
                                                dataColumn1(
                                                    title: "Amount",
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
                                                            vertical: 25),
                                                        child: Text(
                                                            listtiletitle[a],
                                                            style: TextStyle(color: notifire.getblackcolor,fontSize: 13,fontFamily: 'InterRegular')),
                                                      ),
                                                      Transform.translate(offset: Offset(-10, 0),
                                                        child: Padding(
                                                          padding: const EdgeInsets.symmetric(
                                                              vertical: 15,),
                                                          child: Center(
                                                            child:ListTile(

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
                                                        
                                                        ),
                                                      ),
                                                      Padding(
                                                          padding: const EdgeInsets.symmetric(
                                                              vertical: 25,),
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
                                                            Text(
                                                              orders[a],
                                                              style: TextStyle(
                                                                fontFamily: 'InterRegular',
                                                                fontSize: 13,
                                                                color: iteamcolor[a],
                                                              ),
                                                            )
                                                          ],
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
                                                        padding: const EdgeInsets.symmetric(vertical: 25),
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
              ],
            ),
          );
  }
}


