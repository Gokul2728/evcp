// ignore_for_file: deprecated_member_use
import 'package:textfield_tags/textfield_tags.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
// import 'package:html_editor_enhanced/html_editor.dart';

import 'package:provider/provider.dart';
import 'package:evcp/confing/list.dart';
import 'package:evcp/controller/page_controller.dart';
import 'package:evcp/screen/Dashboard/Dashboard_main.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../confing/colors.dart';
import '../../confing/image.dart';
import '../../confing/notifier.dart';
// ignore_for_file: prefer_const_constructors, file_names, camel_case_types

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final _stringTagController = StringTagController();
  int selectIndex = 0;
  late ColorNotifier notifire;
  SampleItem? selectedMenu;
  DateTime selectedDate = DateTime.now();
  InboxController inboxController = Get.put(InboxController());
   TextEditingController dateController = TextEditingController();
  DateRangePickerController dateSelecter = DateRangePickerController();
  TextEditingController dateController1 = TextEditingController();

  DateTime selectedDate1 = DateTime.now();

  List dataa = [];
  List dataa1 = [];

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

  String? selectedValue;
  String? selectedValue1;
  String dropdownvalue = 'All Date';

  var selectedPageNumber = 4;

  final List<String> items = [
    '299',
    '399',
    '599',
    '999',
    '1500',
    '2000',
  ];
  final List<String> items1 = [
    '299',
    '399',
    '599',
    '999',
    '1500',
    '2000',
  ];
  final List<String> items2 = [
    'Macbook Pro',
    'Gopro',
    'Chair',
    'Dell',
    'Fashion',
    'HP',
  ];
  // HtmlEditorController controller = HtmlEditorController();

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
                    screen1(constraints.maxWidth),
                  ],
                ),
              ),
            ),
          );
        } else if (constraints.maxWidth < 1000) {
          return Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    screen1(constraints.maxWidth),
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
              decoration: BoxDecoration(color: notifire.getbgcolor10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        firstContainer(
                            context: context,
                            constraints: constraints.maxWidth),
                      ],
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
                'Product Details',
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
              Expanded(flex: 5, child: screen1(constraints)),
            ],
          ),
        ],
      ),
    );
  }

  Widget screen1(constraints) {
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
                    'Details',
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
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: Get.width,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: notifire.getbgcolor11,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Text('Heimer Miller Sofa',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontFamily: 'InterRegular',
                                color: notifire.getblackcolor,
                                fontSize: 18)),
                        const Spacer(),
                        const Text(
                          '200',
                          style: TextStyle(
                              color: Color(0xff9DA2A7),
                              fontSize: 12,
                              fontFamily: 'InterRegular',
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Product Desciption',
                    style: TextStyle(
                        color: Color(0xff727880),
                        fontWeight: FontWeight.w600,
                        fontFamily: 'InterRegular',
                        fontSize: 12),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(color: notifire.getbgcolor11,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: notifire.Getblg2)),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration:  BoxDecoration(
                              color: notifire.getbgcolor11,border: Border(bottom: BorderSide(color: notifire.Getblg2)),
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
                                                  fontWeight: FontWeight.w600,
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
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
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
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Container(
                      // height: constraints < 1500 ?  Get.height * 2.46: constraints > 1500 ? Get.height * 2.09: null,
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: notifire.getbgcolor11,
                      ),
                      child: SizedBox(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                    color:
                                                        notifire.getblackcolor,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
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
                                                borderRadius:
                                                    BorderRadius.circular(14),
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
                                              color: notifire.getbgcolor10,
                                            ),
                                            offset: const Offset(-20, 0),
                                            scrollbarTheme: ScrollbarThemeData(
                                              radius: const Radius.circular(40),
                                              thickness: MaterialStateProperty
                                                  .all<double>(6),
                                              thumbVisibility:
                                                  MaterialStateProperty.all<
                                                      bool>(true),
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
                                                    color:
                                                        notifire.getblackcolor,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
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
                                              borderRadius:
                                                  BorderRadius.circular(14),
                                              color: notifire.getbgcolor10,
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
                                              color: notifire.getbgcolor10,
                                            ),
                                            offset: const Offset(-20, 0),
                                            scrollbarTheme: ScrollbarThemeData(
                                              radius: const Radius.circular(40),
                                              thickness: MaterialStateProperty
                                                  .all<double>(6),
                                              thumbVisibility:
                                                  MaterialStateProperty.all<
                                                      bool>(true),
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
                                            color: notifire.getbgcolor10,
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
                                                "${selectedDate1.day}-${selectedDate1.month}-${selectedDate1.year}",
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                    color:
                                                        notifire.getblackcolor,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
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
                                              color: notifire.getbgcolor10,
                                            ),
                                            offset: const Offset(-20, 0),
                                            scrollbarTheme: ScrollbarThemeData(
                                              radius: const Radius.circular(40),
                                              thickness: MaterialStateProperty
                                                  .all<double>(6),
                                              thumbVisibility:
                                                  MaterialStateProperty.all<
                                                      bool>(true),
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
                                                      color:
                                                          notifire.getgrey1)),
                                              disabledBorder:
                                                  OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      borderSide:
                                                          BorderSide.none),
                                              hintText: inputFieldValues
                                                      .tags.isNotEmpty
                                                  ? ''
                                                  : "Enter tag...".tr,
                                              prefixIcon:
                                                  inputFieldValues
                                                          .tags.isNotEmpty
                                                      ? SingleChildScrollView(
                                                          controller:
                                                              inputFieldValues
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
                                                                children: inputFieldValues
                                                                    .tags
                                                                    .map((String
                                                                        tag) {
                                                                  return Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius: const BorderRadius
                                                                          .all(
                                                                          Radius.circular(
                                                                              15)),
                                                                      color: notifire
                                                                          .getbgcolor11,
                                                                    ),
                                                                    margin: const EdgeInsets
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
                                                                            child:
                                                                                Text('#$tag', style: TextStyle(color: notifire.getblackcolor, fontFamily: 'InterRegular'))),
                                                                        const SizedBox(
                                                                            width:
                                                                                5),
                                                                        InkWell(
                                                                          child: const Icon(
                                                                              Icons.cancel_outlined,
                                                                              size: 18,
                                                                              color: Color(0xff595FE5)),
                                                                          onTap:
                                                                              () {
                                                                            inputFieldValues.onTagRemoved(tag);
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
                                                            const EdgeInsets
                                                                .only(
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
                                                              top: 10,
                                                              right: 10),
                                                      child: Text(
                                                          'All Clear'.tr,
                                                          style: TextStyle(
                                                              color: notifire
                                                                  .getblackcolor,
                                                              fontFamily:
                                                                  'InterRegular')),
                                                    ),
                                            ),
                                            controller: inputFieldValues
                                                .textEditingController,
                                            focusNode:
                                                inputFieldValues.focusNode,
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
                              height: 100,
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: notifire.getbgcolor10,
                                    ),
                                    child: Image.asset('assets/trash.png',
                                        height: 16,
                                        color: const Color(0xffE5646C)),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: 200,
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
                              ],
                            )
                          ],
                        ),
                      )),
                ],
              ),
            ],
          )
        : Row(
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
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: notifire.getbgcolor11,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Text('Heimer Miller Sofa (Mint Condition)',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'InterRegular',
                                    color: notifire.getblackcolor,
                                    fontSize: 18)),
                            const Spacer(),
                            const Text(
                              '200',
                              style: TextStyle(
                                  color: Color(0xff9DA2A7),
                                  fontSize: 12,
                                  fontFamily: 'InterRegular',
                                  fontWeight: FontWeight.w500),
                            )
                          ],
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
                        decoration: BoxDecoration(color: notifire.getbgcolor11,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: notifire.Getblg2)),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration:  BoxDecoration(
                                  color: notifire.getbgcolor11,border: Border(bottom: BorderSide(color: notifire.Getblg2)),
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
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontFamily:
                                                          'InterRegular',
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
                        padding: const EdgeInsets.all(10),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                    color: Color(0xff727880))),
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
                                                    color: Color(0xff727880))),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                color: notifire.getblackcolor,
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
                                                color: notifire.getblackcolor,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
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
                                                      color: notifire
                                                          .getblackcolor,
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
                                                          borderSide: BorderSide
                                                              .none,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12)),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: blue),
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
                                                          BorderRadius.circular(
                                                              12),
                                                      borderSide: BorderSide(
                                                          color: grey2)),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                          borderSide: BorderSide
                                                              .none,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12)),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: blue),
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
                                                          BorderRadius.circular(
                                                              12),
                                                      borderSide: BorderSide(
                                                          color: grey2)),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                          borderSide: BorderSide
                                                              .none,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12)),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: blue),
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
                                                color: notifire.getblackcolor,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                                          BorderRadius.circular(
                                                              12),
                                                      borderSide: BorderSide(
                                                          color: grey2)),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                          borderSide: BorderSide
                                                              .none,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12)),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: blue),
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
                                                          BorderRadius.circular(
                                                              12),
                                                      borderSide: BorderSide(
                                                          color: grey2)),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                          borderSide: BorderSide
                                                              .none,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12)),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: blue),
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
                      // height: constraints < 1500 ?  Get.height * 2.46: constraints > 1500 ? Get.height * 2.09: null,
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: notifire.getbgcolor11,
                      ),
                      child: SizedBox(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                    color:
                                                        notifire.getblackcolor,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
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
                                            width: Get.width * 0.2,
                                            padding: const EdgeInsets.only(
                                                left: 14, right: 14),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(14),
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
                                              color: notifire.getbgcolor10,
                                            ),
                                            offset: const Offset(-20, 0),
                                            scrollbarTheme: ScrollbarThemeData(
                                              radius: const Radius.circular(40),
                                              thickness: MaterialStateProperty
                                                  .all<double>(6),
                                              thumbVisibility:
                                                  MaterialStateProperty.all<
                                                      bool>(true),
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
                                                    color:
                                                        notifire.getblackcolor,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
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
                                            width: Get.width * 0.2,
                                            padding: const EdgeInsets.only(
                                                left: 14, right: 14),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(14),
                                              color: notifire.getbgcolor10,
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
                                              color: notifire.getbgcolor10,
                                            ),
                                            offset: const Offset(-20, 0),
                                            scrollbarTheme: ScrollbarThemeData(
                                              radius: const Radius.circular(40),
                                              thickness: MaterialStateProperty
                                                  .all<double>(6),
                                              thumbVisibility:
                                                  MaterialStateProperty.all<
                                                      bool>(true),
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
                                            color: notifire.getbgcolor10,
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
                                                "${selectedDate1.day}-${selectedDate1.month}-${selectedDate1.year}",
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                    color:
                                                        notifire.getblackcolor,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
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
                                            width: Get.width * 0.2,
                                            padding: const EdgeInsets.only(
                                                left: 14, right: 14),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(14),
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
                                              color: notifire.getbgcolor10,
                                            ),
                                            offset: const Offset(-20, 0),
                                            scrollbarTheme: ScrollbarThemeData(
                                              radius: const Radius.circular(40),
                                              thickness: MaterialStateProperty
                                                  .all<double>(6),
                                              thumbVisibility:
                                                  MaterialStateProperty.all<
                                                      bool>(true),
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
                                                      color:
                                                          notifire.getgrey1)),
                                              disabledBorder:
                                                  OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      borderSide:
                                                          BorderSide.none),
                                              hintText: inputFieldValues
                                                      .tags.isNotEmpty
                                                  ? ''
                                                  : "Enter tag...".tr,
                                              prefixIcon:
                                                  inputFieldValues
                                                          .tags.isNotEmpty
                                                      ? SingleChildScrollView(
                                                          controller:
                                                              inputFieldValues
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
                                                                children: inputFieldValues
                                                                    .tags
                                                                    .map((String
                                                                        tag) {
                                                                  return Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius: const BorderRadius
                                                                          .all(
                                                                          Radius.circular(
                                                                              15)),
                                                                      color: notifire
                                                                          .getbgcolor11,
                                                                    ),
                                                                    margin: const EdgeInsets
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
                                                                            child:
                                                                                Text('#$tag', style: TextStyle(color: notifire.getblackcolor, fontFamily: 'InterRegular'))),
                                                                        const SizedBox(
                                                                            width:
                                                                                5),
                                                                        InkWell(
                                                                          child: const Icon(
                                                                              Icons.cancel_outlined,
                                                                              size: 18,
                                                                              color: Color(0xff595FE5)),
                                                                          onTap:
                                                                              () {
                                                                            inputFieldValues.onTagRemoved(tag);
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
                                                            const EdgeInsets
                                                                .only(
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
                                                              top: 10,
                                                              right: 10),
                                                      child: Text(
                                                          'All Clear'.tr,
                                                          style: TextStyle(
                                                              color: notifire
                                                                  .getblackcolor,
                                                              fontFamily:
                                                                  'InterRegular')),
                                                    ),
                                            ),
                                            controller: inputFieldValues
                                                .textEditingController,
                                            focusNode:
                                                inputFieldValues.focusNode,
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
                              height: 100,
                            ),
                            SizedBox(
                              width: Get.width * 0.2,
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      padding: const EdgeInsets.all(14),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: notifire.getbgcolor10,
                                      ),
                                      child: Image.asset('assets/trash.png',
                                          height: 16,
                                          color: const Color(0xffE5646C)),
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
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            color: const Color(0xff595FE5)),
                                        child: const Center(
                                            child: Text('Update',
                                                style: TextStyle(
                                                    fontFamily: 'InterRegular',
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500))),
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
              ),
            ],
          );
  }
}

TableRow dividerTable(BuildContext context, constraints) {
  return TableRow(
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Divider(
          height: 10,
          color: grey2,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Divider(
          height: 10,
          color: grey2,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Divider(
          height: 10,
          color: grey2,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Divider(
          height: 10,
          color: grey2,
        ),
      ),
    ],
  );
}
