// ignore_for_file: file_names, non_constant_identifier_names
// ignore_for_file: deprecated_member_use
import 'dart:math';


import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../confing/colors.dart';

import '../../confing/notifier.dart';
import '../../controller/page_controller.dart';
import '../Dashboard/Dashboard_main.dart';


class BasicTables extends StatefulWidget {
  const BasicTables({super.key});

  @override
  State<BasicTables> createState() => _BasicTablesState();
}


class _BasicTablesState extends State<BasicTables> {

  int value = 0;
  late ColorNotifier notifire;
  bool tap = false;
  SampleItem? selectedMenu;
  DateTime selectedDate = DateTime.now();
  InboxController inboxController = Get.put(InboxController());
  TextEditingController dateController = TextEditingController();

  DateRangePickerController dateSelecter = DateRangePickerController();

  var selectedPageNumber = 4;
  String dropdownvalue = '15';
  bool isActive = false;

  List<String> list1 = <String>[
    '15',
    '50',
    '75',
    '100',
    '150',
  ];
  final DataTableSource _data = MyData();

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifier>(context, listen: true);
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return
           Container(
                color: notifire.getbgcolor10,
              child: SingleChildScrollView(

                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Search(
                            context,
                            constraints.maxWidth,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          data(constraints),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
                        );
        }
        else if (constraints.maxWidth < 1000) {
          return Container(
            decoration:  BoxDecoration(
                color: notifire.getbgcolor10,
           ),
            child: SingleChildScrollView(
              child: Column(
                children: [

                  ListView.builder(
                    itemCount: 1,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return  Padding(
                        padding: const EdgeInsets.only(bottom: 20,right: 20,left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Search(
                              context,
                              constraints.maxWidth,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            // table(context, constraints.maxWidth, constraints),
                            data(constraints),
                            const SizedBox(
                              height: 20,
                            ),
                            // page(context, constraints.maxHeight),
                          ],
                        ),
                      );
                    },

                  ),
                ],
              ),
            ),
          );
        } else {
          return Container(
            decoration:  BoxDecoration(
                color: notifire.getbgcolor10
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(right: 20,left: 20,bottom: 20),
                child: Column(
                  children: [
                    ListView.builder(
                      itemCount: 1,
                      scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                      itemBuilder: (context, index) {
                      return  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Search(
                            context,
                            constraints.maxWidth,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          // table(context, constraints.maxWidth, constraints),
                          data(constraints),
                          const SizedBox(
                            height: 20,
                          ),
                          // page(context, constraints.maxHeight),
                        ],
                      );
                    },

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

  Widget Search(BuildContext context, size) {
    return GetBuilder<InboxController>(
      builder: (controller) {
        return
          size < 700 ?
          Column(
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
                  Text('Table',style: TextStyle(color: greyy,fontSize: 14,fontFamily: 'InterRegular'),),
                  const SizedBox(width: 10,),
                  Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: greyy,),),
                  const SizedBox(width: 10,),
                  Text('Basic',style: TextStyle(color: notifire.getblackcolor,fontSize: 14,fontFamily: 'InterRegular'),),
                ],
              ),
              const SizedBox(height: 20,),
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
                      child: Padding(
                        padding: const EdgeInsets.all(14),
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
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        color: notifire.getbgcolor11,),
                      padding: const EdgeInsets.all(14),
                child:   Center(child: Image.asset('assets/additem.png', scale: 4)),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                          color: const Color(0xff595FE5),
                          borderRadius: BorderRadius.circular(12)),
                      child:   Center(child: Image.asset('assets/add.png', scale: 4)),
                    ),
                  )
                ],
              ),
            ],
          ):
          Column(
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
                  Text('Table',style: TextStyle(color: greyy,fontSize: 14,fontFamily: 'InterRegular'),),
                  const SizedBox(width: 10,),
                  Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: greyy,),),
                  const SizedBox(width: 10,),
                  Text('Basic',style: TextStyle(color: notifire.getblackcolor,fontSize: 14,fontFamily: 'InterRegular'),),
                ],
              ),
              const SizedBox(height: 20,),
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
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: notifire.getbgcolor11,),
                    padding: const EdgeInsets.all(11),
                    child: Row(
                      children: [
                        Image.asset('assets/additem.png', scale: 4),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Create Category',
                          style: TextStyle(
                              fontSize: 12,
                              color: Color(0xff727880),
                              fontFamily: 'InterRegular',
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {},
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
                        'Add New Product',
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'InterRegular',
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      )
                    ]),
                  ),
                )
              ],
                      ),
            ],
          );
      },
    );
  }

  PageController pageController = PageController();

  Widget data(constraints) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Theme(
            data: Theme.of(context).copyWith(
              cardColor: notifire.getbgcolor11,
                dividerColor: notifire.getgrey1,
              dataTableTheme: DataTableThemeData(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)))
               ),
            child: SizedBox(
              width: constraints.maxWidth < 1400 ? 1500 : Get.width,
              child: PaginatedDataTable(

                source: _data,
                controller: PageController(),
                columns: <DataColumn>[
                  DataColumn(
                    label: Expanded(
                      child: Row(
                        children: [
                          Transform.scale(
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
                                  visualDensity:
                                      const VisualDensity(horizontal: -4),
                                  activeColor: const Color(0xff595FE5),
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  value: isActive,
                                  onChanged: (val) {
                                    setState(() {
                                      isActive = val!;
                                    });
                                  }),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Row(
                        children: [
                          const Text(
                            'No.',
                            style: TextStyle(
                                fontFamily: 'InterRegular',
                                color: Color(0xff9DA2A7)),
                          ),
                          Image.asset(
                            'assets/arrow-up.png',
                            scale: 3.5,
                          )
                        ],
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Row(
                        children: [
                          const Text(
                            'SKU',
                            style: TextStyle(
                                fontFamily: 'InterRegular',
                                color: Color(0xff9DA2A7)),
                          ),
                          Image.asset(
                            'assets/arrow-up.png',
                            scale: 3.5,
                          )
                        ],
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Row(
                        children: [
                          const Text(
                            'Product Name',
                            style: TextStyle(
                                fontFamily: 'InterRegular',
                                color: Color(0xff9DA2A7)),
                          ),
                          Image.asset(
                            'assets/arrow-up.png',
                            scale: 3.5,
                          )
                        ],
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Row(
                        children: [
                          const Text(
                            'Last Updated',
                            style: TextStyle(
                                fontFamily: 'InterRegular',
                                color: Color(0xff9DA2A7)),
                          ),
                          Image.asset(
                            'assets/arrow-up.png',
                            scale: 3.5,
                          )
                        ],
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Row(
                        children: [
                          const Text(
                            'Category',
                            style: TextStyle(
                                fontFamily: 'InterRegular',
                                color: Color(0xff9DA2A7)),
                          ),
                          Image.asset(
                            'assets/arrow-up.png',
                            scale: 3.5,
                          )
                        ],
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Row(
                        children: [
                          const Text(
                            'Status',
                            style: TextStyle(
                                fontFamily: 'InterRegular',
                                color: Color(0xff9DA2A7)),
                          ),
                          Image.asset(
                            'assets/arrow-up.png',
                            scale: 3.5,
                          )
                        ],
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Row(
                        children: [
                          const Text(
                            'Quantity',
                            style: TextStyle(
                                fontFamily: 'InterRegular',
                                color: Color(0xff9DA2A7)),
                          ),
                          Image.asset(
                            'assets/arrow-up.png',
                            scale: 3.5,
                          )
                        ],
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Row(
                        children: [
                          const Text(
                            'Cost',
                            style: TextStyle(
                                fontFamily: 'InterRegular',
                                color: Color(0xff9DA2A7)),
                          ),
                          Image.asset(
                            'assets/arrow-up.png',
                            scale: 3.5,
                          )
                        ],
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Row(
                        children: [
                          const Text(
                            'Price',
                            style: TextStyle(
                                fontFamily: 'InterRegular',
                                color: Color(0xff9DA2A7)),
                          ),
                          Image.asset(
                            'assets/arrow-up.png',
                            scale: 3.5,
                          )
                        ],
                      ),
                    ),
                  ),
                  const DataColumn(
                    label: Expanded(
                      child: Row(
                        children: [
                          Text(
                            'Price',
                            style: TextStyle(
                                fontFamily: 'InterRegular',
                                color: Colors.transparent),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
                columnSpacing: 50,
                horizontalMargin: 30,
                rowsPerPage: 15,
                arrowHeadColor: Colors.black,
                showCheckboxColumn: true,

              ),

            ),
          ),
        ],
      ),
    );
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
            DataCell(Text(
              '${index + 1}',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              'LG85J8JG8',
              style: TextStyle(color: Color(0xff595FE5)),
            )),
             DataCell(Text(
              'Coach Tabby for sale',
              style: TextStyle(
                  fontFamily: 'InterRegular', fontWeight: FontWeight.bold,color: greyy,),
            )),
            DataCell(Text(
              '21 Aug 2022',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Activewear',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Active',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '100',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '\$10,593',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              '\$788.41',
              style: TextStyle(
                  color: Color(0xff727880), fontWeight: FontWeight.w600),
            )),
            DataCell(Row(
              children: [
                InkWell(
                  onTap: () {
                  },
                  child: Image.asset(
                    'assets/edit-2.png',
                    scale: 4,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                    onTap: () {


                  },
                  child: Image.asset(
                    'assets/trash.png',
                    scale: 4,
                  ),
                )
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
            DataCell(Text(
              '${index + 1}',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              'LD995HDJ9',
              style: TextStyle(color: Color(0xff595FE5)),
            )),
             DataCell(Text(
              'HP Computer Monitor',
              style: TextStyle(color: greyy,
                  fontFamily: 'InterRegular', fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '25 Aug 2022',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Gloves',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Inactive',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '50',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '\$8,593',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              '\$700.41',
              style: TextStyle(
                  color: Color(0xff727880), fontWeight: FontWeight.w600),
            )),
            DataCell(Row(
              children: [
                InkWell(
                  onTap: () {


                  },
                  child: Image.asset(
                    'assets/edit-2.png',
                    scale: 4,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {


                  },
                  child: Image.asset(
                    'assets/trash.png',
                    scale: 4,
                  ),
                )
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
            DataCell(Text(
              '${index + 1}',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              'I0J8N8D8H',
              style: TextStyle(color: Color(0xff595FE5)),
            )),
             DataCell(Text(
              'Heimer Miller Sofa',
              style: TextStyle(color: greyy,
                  fontFamily: 'InterRegular', fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '2 Aug 2022',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Sports Outlet',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Active',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '30',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '\$10,593',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              '\$788.41',
              style: TextStyle(
                  color: Color(0xff727880), fontWeight: FontWeight.w600),
            )),
            DataCell(Row(
              children: [
                InkWell(
                  onTap: () {


                  },
                  child: Image.asset(
                    'assets/edit-2.png',
                    scale: 4,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {


                  },
                  child: Image.asset(
                    'assets/trash.png',
                    scale: 4,
                  ),
                )
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
            DataCell(Text(
              '${index + 1}',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              'KFJIJI85',
              style: TextStyle(color: Color(0xff595FE5)),
            )),
             DataCell(Text(
              'Playstation 6 Limited Edition',
              style: TextStyle(color: greyy,
                  fontFamily: 'InterRegular', fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '12 Aug 2022',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Belts',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Inactive',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '150',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '\$12,000',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              '\$600',
              style: TextStyle(
                  color: Color(0xff727880), fontWeight: FontWeight.w600),
            )),
            DataCell(Row(
              children: [
                InkWell(
                  onTap: () {


                  },
                  child: Image.asset(
                    'assets/edit-2.png',
                    scale: 4,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {


                  },
                  child: Image.asset(
                    'assets/trash.png',
                    scale: 4,
                  ),
                )
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
            DataCell(Text(
              '${index + 1}',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              'G7H7YB79',
              style: TextStyle(color: Color(0xff595FE5)),
            )),
             DataCell(Text(
              'Gaming Chair',
              style: TextStyle(color: greyy,
                  fontFamily: 'InterRegular', fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '21 Aug 2022',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Socks',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Active',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '15',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '\$19,000',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              '\$800',
              style: TextStyle(
                  color: Color(0xff727880), fontWeight: FontWeight.w600),
            )),
            DataCell(Row(
              children: [
                InkWell(
                  onTap: () {


                  },
                  child: Image.asset(
                    'assets/edit-2.png',
                    scale: 4,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {


                  },
                  child: Image.asset(
                    'assets/trash.png',
                    scale: 4,
                  ),
                )
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
            DataCell(Text(
              '${index + 1}',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              'I9IWJF9W',
              style: TextStyle(color: Color(0xff595FE5)),
            )),
             DataCell(Text(
              'DJI Mavic Pro 5',
              style: TextStyle(color: greyy,
                  fontFamily: 'InterRegular', fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '16 Aug 2022',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Boots',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Inactive',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '40',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '\$13,000',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              '\$750.41',
              style: TextStyle(
                  color: Color(0xff727880), fontWeight: FontWeight.w600),
            )),
            DataCell(Row(
              children: [
                InkWell(
                  onTap: () {


                  },
                  child: Image.asset(
                    'assets/edit-2.png',
                    scale: 4,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {


                  },
                  child: Image.asset(
                    'assets/trash.png',
                    scale: 4,
                  ),
                )
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
            DataCell(Text(
              '${index + 1}',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              'I55K9T55',
              style: TextStyle(color: Color(0xff595FE5)),
            )),
             DataCell(Text(
              'Gopro hero 7',
              style: TextStyle(color: greyy,
                  fontFamily: 'InterRegular', fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '5 Aug 2022',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Accessories',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Active',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '200',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '\$24,000',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              '\$800',
              style: TextStyle(
                  color: Color(0xff727880), fontWeight: FontWeight.w600),
            )),
            DataCell(Row(
              children: [
                InkWell(
                  onTap: () {


                  },
                  child: Image.asset(
                    'assets/edit-2.png',
                    scale: 4,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
    InkWell(
    onTap: () {


    },
                  child: Image.asset(
                    'assets/trash.png',
                    scale: 4,
                  ),
                )
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
            DataCell(Text(
              '${index + 1}',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              'H38N8N83',
              style: TextStyle(color: Color(0xff595FE5)),
            )),
             DataCell(Text(
              'iPad Pro 16',
              style: TextStyle(color: greyy,
                  fontFamily: 'InterRegular', fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '7 Aug 2022',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Sunglasses',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Active',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '36',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '\$15,000',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              '\$600',
              style: TextStyle(
                  color: Color(0xff727880), fontWeight: FontWeight.w600),
            )),
            DataCell(Row(
              children: [
                InkWell(
                  onTap: () {


                  },
                  child: Image.asset(
                    'assets/edit-2.png',
                    scale: 4,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {


                  },
                  child: Image.asset(
                    'assets/trash.png',
                    scale: 4,
                  ),
                )
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
            DataCell(Text(
              '${index + 1}',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              'LG85J8JG8',
              style: TextStyle(color: Color(0xff595FE5)),
            )),
            DataCell(Text(
              'Coach Tabby for sale',
              style: TextStyle(
                fontFamily: 'InterRegular', fontWeight: FontWeight.bold,color: greyy,),
            )),
            DataCell(Text(
              '21 Aug 2022',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Activewear',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Active',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '100',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '\$10,593',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              '\$788.41',
              style: TextStyle(
                  color: Color(0xff727880), fontWeight: FontWeight.w600),
            )),
            DataCell(Row(
              children: [
                InkWell(
                  onTap: () {
                  },
                  child: Image.asset(
                    'assets/edit-2.png',
                    scale: 4,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {


                  },
                  child: Image.asset(
                    'assets/trash.png',
                    scale: 4,
                  ),
                )
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
            DataCell(Text(
              '${index + 1}',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              'LD995HDJ9',
              style: TextStyle(color: Color(0xff595FE5)),
            )),
            DataCell(Text(
              'HP Computer Monitor',
              style: TextStyle(color: greyy,
                  fontFamily: 'InterRegular', fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '25 Aug 2022',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Gloves',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Inactive',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '50',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '\$8,593',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              '\$700.41',
              style: TextStyle(
                  color: Color(0xff727880), fontWeight: FontWeight.w600),
            )),
            DataCell(Row(
              children: [
                InkWell(
                  onTap: () {


                  },
                  child: Image.asset(
                    'assets/edit-2.png',
                    scale: 4,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {


                  },
                  child: Image.asset(
                    'assets/trash.png',
                    scale: 4,
                  ),
                )
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
            DataCell(Text(
              '${index + 1}',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              'I0J8N8D8H',
              style: TextStyle(color: Color(0xff595FE5)),
            )),
            DataCell(Text(
              'Heimer Miller Sofa',
              style: TextStyle(color: greyy,
                  fontFamily: 'InterRegular', fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '2 Aug 2022',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Sports Outlet',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Active',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '30',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '\$10,593',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              '\$788.41',
              style: TextStyle(
                  color: Color(0xff727880), fontWeight: FontWeight.w600),
            )),
            DataCell(Row(
              children: [
                InkWell(
                  onTap: () {


                  },
                  child: Image.asset(
                    'assets/edit-2.png',
                    scale: 4,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {


                  },
                  child: Image.asset(
                    'assets/trash.png',
                    scale: 4,
                  ),
                )
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
            DataCell(Text(
              '${index + 1}',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              'KFJIJI85',
              style: TextStyle(color: Color(0xff595FE5)),
            )),
            DataCell(Text(
              'Playstation 6 Limited Edition',
              style: TextStyle(color: greyy,
                  fontFamily: 'InterRegular', fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '12 Aug 2022',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Belts',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Inactive',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '150',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '\$12,000',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              '\$600',
              style: TextStyle(
                  color: Color(0xff727880), fontWeight: FontWeight.w600),
            )),
            DataCell(Row(
              children: [
                InkWell(
                  onTap: () {


                  },
                  child: Image.asset(
                    'assets/edit-2.png',
                    scale: 4,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {


                  },
                  child: Image.asset(
                    'assets/trash.png',
                    scale: 4,
                  ),
                )
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
            DataCell(Text(
              '${index + 1}',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              'G7H7YB79',
              style: TextStyle(color: Color(0xff595FE5)),
            )),
            DataCell(Text(
              'Gaming Chair',
              style: TextStyle(color: greyy,
                  fontFamily: 'InterRegular', fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '21 Aug 2022',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Socks',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Active',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '15',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '\$19,000',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              '\$800',
              style: TextStyle(
                  color: Color(0xff727880), fontWeight: FontWeight.w600),
            )),
            DataCell(Row(
              children: [
                InkWell(
                  onTap: () {


                  },
                  child: Image.asset(
                    'assets/edit-2.png',
                    scale: 4,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {


                  },
                  child: Image.asset(
                    'assets/trash.png',
                    scale: 4,
                  ),
                )
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
            DataCell(Text(
              '${index + 1}',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              'I9IWJF9W',
              style: TextStyle(color: Color(0xff595FE5)),
            )),
            DataCell(Text(
              'DJI Mavic Pro 5',
              style: TextStyle(color: greyy,
                  fontFamily: 'InterRegular', fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '16 Aug 2022',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Boots',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Inactive',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '40',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '\$13,000',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              '\$750.41',
              style: TextStyle(
                  color: Color(0xff727880), fontWeight: FontWeight.w600),
            )),
            DataCell(Row(
              children: [
                InkWell(
                  onTap: () {


                  },
                  child: Image.asset(
                    'assets/edit-2.png',
                    scale: 4,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {


                  },
                  child: Image.asset(
                    'assets/trash.png',
                    scale: 4,
                  ),
                )
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
            DataCell(Text(
              '${index + 1}',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              'I55K9T55',
              style: TextStyle(color: Color(0xff595FE5)),
            )),
            DataCell(Text(
              'Gopro hero 7',
              style: TextStyle(color: greyy,
                  fontFamily: 'InterRegular', fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '5 Aug 2022',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Accessories',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Active',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '200',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '\$24,000',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              '\$800',
              style: TextStyle(
                  color: Color(0xff727880), fontWeight: FontWeight.w600),
            )),
            DataCell(Row(
              children: [
                InkWell(
                  onTap: () {


                  },
                  child: Image.asset(
                    'assets/edit-2.png',
                    scale: 4,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {


                  },
                  child: Image.asset(
                    'assets/trash.png',
                    scale: 4,
                  ),
                )
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
            DataCell(Text(
              '${index + 1}',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              'H38N8N83',
              style: TextStyle(color: Color(0xff595FE5)),
            )),
            DataCell(Text(
              'iPad Pro 16',
              style: TextStyle(color: greyy,
                  fontFamily: 'InterRegular', fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '7 Aug 2022',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Sunglasses',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Active',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '36',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '\$15,000',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              '\$600',
              style: TextStyle(
                  color: Color(0xff727880), fontWeight: FontWeight.w600),
            )),
            DataCell(Row(
              children: [
                InkWell(
                  onTap: () {


                  },
                  child: Image.asset(
                    'assets/edit-2.png',
                    scale: 4,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {


                  },
                  child: Image.asset(
                    'assets/trash.png',
                    scale: 4,
                  ),
                )
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
            DataCell(Text(
              '${index + 1}',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              'I0J8N8D8H',
              style: TextStyle(color: Color(0xff595FE5)),
            )),
            DataCell(Text(
              'Heimer Miller Sofa',
              style: TextStyle(color: greyy,
                  fontFamily: 'InterRegular', fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '2 Aug 2022',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Sports Outlet',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Active',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '30',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '\$10,593',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              '\$788.41',
              style: TextStyle(
                  color: Color(0xff727880), fontWeight: FontWeight.w600),
            )),
            DataCell(Row(
              children: [
                InkWell(
                  onTap: () {


                  },
                  child: Image.asset(
                    'assets/edit-2.png',
                    scale: 4,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {


                  },
                  child: Image.asset(
                    'assets/trash.png',
                    scale: 4,
                  ),
                )
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
            DataCell(Text(
              '${index + 1}',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              'KFJIJI85',
              style: TextStyle(color: Color(0xff595FE5)),
            )),
            DataCell(Text(
              'Playstation 6 Limited Edition',
              style: TextStyle(color: greyy,
                  fontFamily: 'InterRegular', fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '12 Aug 2022',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Belts',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Inactive',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '150',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '\$12,000',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              '\$600',
              style: TextStyle(
                  color: Color(0xff727880), fontWeight: FontWeight.w600),
            )),
            DataCell(Row(
              children: [
                InkWell(
                  onTap: () {


                  },
                  child: Image.asset(
                    'assets/edit-2.png',
                    scale: 4,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {


                  },
                  child: Image.asset(
                    'assets/trash.png',
                    scale: 4,
                  ),
                )
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
            DataCell(Text(
              '${index + 1}',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              'G7H7YB79',
              style: TextStyle(color: Color(0xff595FE5)),
            )),
            DataCell(Text(
              'Gaming Chair',
              style: TextStyle(color: greyy,
                  fontFamily: 'InterRegular', fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '21 Aug 2022',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Socks',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Active',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '15',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '\$19,000',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              '\$800',
              style: TextStyle(
                  color: Color(0xff727880), fontWeight: FontWeight.w600),
            )),
            DataCell(Row(
              children: [
                InkWell(
                  onTap: () {


                  },
                  child: Image.asset(
                    'assets/edit-2.png',
                    scale: 4,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {


                  },
                  child: Image.asset(
                    'assets/trash.png',
                    scale: 4,
                  ),
                )
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
            DataCell(Text(
              '${index + 1}',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              'I9IWJF9W',
              style: TextStyle(color: Color(0xff595FE5)),
            )),
            DataCell(Text(
              'DJI Mavic Pro 5',
              style: TextStyle(color: greyy,
                  fontFamily: 'InterRegular', fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '16 Aug 2022',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Boots',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Inactive',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '40',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '\$13,000',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              '\$750.41',
              style: TextStyle(
                  color: Color(0xff727880), fontWeight: FontWeight.w600),
            )),
            DataCell(Row(
              children: [
                InkWell(
                  onTap: () {


                  },
                  child: Image.asset(
                    'assets/edit-2.png',
                    scale: 4,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {


                  },
                  child: Image.asset(
                    'assets/trash.png',
                    scale: 4,
                  ),
                )
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
            DataCell(Text(
              '${index + 1}',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              'I55K9T55',
              style: TextStyle(color: Color(0xff595FE5)),
            )),
            DataCell(Text(
              'Gopro hero 7',
              style: TextStyle(color: greyy,
                  fontFamily: 'InterRegular', fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '5 Aug 2022',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Accessories',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Active',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '200',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '\$24,000',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              '\$800',
              style: TextStyle(
                  color: Color(0xff727880), fontWeight: FontWeight.w600),
            )),
            DataCell(Row(
              children: [
                InkWell(
                  onTap: () {


                  },
                  child: Image.asset(
                    'assets/edit-2.png',
                    scale: 4,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {


                  },
                  child: Image.asset(
                    'assets/trash.png',
                    scale: 4,
                  ),
                )
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
            DataCell(Text(
              '${index + 1}',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              'H38N8N83',
              style: TextStyle(color: Color(0xff595FE5)),
            )),
            DataCell(Text(
              'iPad Pro 16',
              style: TextStyle(color: greyy,
                  fontFamily: 'InterRegular', fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '7 Aug 2022',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Sunglasses',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Active',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '36',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '\$15,000',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              '\$600',
              style: TextStyle(
                  color: Color(0xff727880), fontWeight: FontWeight.w600),
            )),
            DataCell(Row(
              children: [
                InkWell(
                  onTap: () {


                  },
                  child: Image.asset(
                    'assets/edit-2.png',
                    scale: 4,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {


                  },
                  child: Image.asset(
                    'assets/trash.png',
                    scale: 4,
                  ),
                )
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
            DataCell(Text(
              '${index + 1}',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              'LG85J8JG8',
              style: TextStyle(color: Color(0xff595FE5)),
            )),
            DataCell(Text(
              'Coach Tabby for sale',
              style: TextStyle(
                fontFamily: 'InterRegular', fontWeight: FontWeight.bold,color: greyy,),
            )),
            DataCell(Text(
              '21 Aug 2022',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Activewear',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Active',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '100',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '\$10,593',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              '\$788.41',
              style: TextStyle(
                  color: Color(0xff727880), fontWeight: FontWeight.w600),
            )),
            DataCell(Row(
              children: [
                InkWell(
                  onTap: () {
                  },
                  child: Image.asset(
                    'assets/edit-2.png',
                    scale: 4,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {


                  },
                  child: Image.asset(
                    'assets/trash.png',
                    scale: 4,
                  ),
                )
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
            DataCell(Text(
              '${index + 1}',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              'LD995HDJ9',
              style: TextStyle(color: Color(0xff595FE5)),
            )),
            DataCell(Text(
              'HP Computer Monitor',
              style: TextStyle(color: greyy,
                  fontFamily: 'InterRegular', fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '25 Aug 2022',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Gloves',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Inactive',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '50',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '\$8,593',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              '\$700.41',
              style: TextStyle(
                  color: Color(0xff727880), fontWeight: FontWeight.w600),
            )),
            DataCell(Row(
              children: [
                InkWell(
                  onTap: () {


                  },
                  child: Image.asset(
                    'assets/edit-2.png',
                    scale: 4,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {


                  },
                  child: Image.asset(
                    'assets/trash.png',
                    scale: 4,
                  ),
                )
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
            DataCell(Text(
              '${index + 1}',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              'I0J8N8D8H',
              style: TextStyle(color: Color(0xff595FE5)),
            )),
            DataCell(Text(
              'Heimer Miller Sofa',
              style: TextStyle(color: greyy,
                  fontFamily: 'InterRegular', fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '2 Aug 2022',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Sports Outlet',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Active',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '30',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '\$10,593',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              '\$788.41',
              style: TextStyle(
                  color: Color(0xff727880), fontWeight: FontWeight.w600),
            )),
            DataCell(Row(
              children: [
                InkWell(
                  onTap: () {


                  },
                  child: Image.asset(
                    'assets/edit-2.png',
                    scale: 4,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {


                  },
                  child: Image.asset(
                    'assets/trash.png',
                    scale: 4,
                  ),
                )
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
            DataCell(Text(
              '${index + 1}',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              'KFJIJI85',
              style: TextStyle(color: Color(0xff595FE5)),
            )),
            DataCell(Text(
              'Playstation 6 Limited Edition',
              style: TextStyle(color: greyy,
                  fontFamily: 'InterRegular', fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '12 Aug 2022',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Belts',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Inactive',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '150',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '\$12,000',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              '\$600',
              style: TextStyle(
                  color: Color(0xff727880), fontWeight: FontWeight.w600),
            )),
            DataCell(Row(
              children: [
                InkWell(
                  onTap: () {


                  },
                  child: Image.asset(
                    'assets/edit-2.png',
                    scale: 4,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {


                  },
                  child: Image.asset(
                    'assets/trash.png',
                    scale: 4,
                  ),
                )
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
            DataCell(Text(
              '${index + 1}',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              'G7H7YB79',
              style: TextStyle(color: Color(0xff595FE5)),
            )),
            DataCell(Text(
              'Gaming Chair',
              style: TextStyle(color: greyy,
                  fontFamily: 'InterRegular', fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '21 Aug 2022',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Socks',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Active',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '15',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '\$19,000',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              '\$800',
              style: TextStyle(
                  color: Color(0xff727880), fontWeight: FontWeight.w600),
            )),
            DataCell(Row(
              children: [
                InkWell(
                  onTap: () {


                  },
                  child: Image.asset(
                    'assets/edit-2.png',
                    scale: 4,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {


                  },
                  child: Image.asset(
                    'assets/trash.png',
                    scale: 4,
                  ),
                )
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
            DataCell(Text(
              '${index + 1}',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              'I0J8N8D8H',
              style: TextStyle(color: Color(0xff595FE5)),
            )),
            DataCell(Text(
              'Heimer Miller Sofa',
              style: TextStyle(color: greyy,
                  fontFamily: 'InterRegular', fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '2 Aug 2022',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Sports Outlet',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Active',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '30',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '\$10,593',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              '\$788.41',
              style: TextStyle(
                  color: Color(0xff727880), fontWeight: FontWeight.w600),
            )),
            DataCell(Row(
              children: [
                InkWell(
                  onTap: () {


                  },
                  child: Image.asset(
                    'assets/edit-2.png',
                    scale: 4,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {


                  },
                  child: Image.asset(
                    'assets/trash.png',
                    scale: 4,
                  ),
                )
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
            DataCell(Text(
              '${index + 1}',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              'KFJIJI85',
              style: TextStyle(color: Color(0xff595FE5)),
            )),
            DataCell(Text(
              'Playstation 6 Limited Edition',
              style: TextStyle(color: greyy,
                  fontFamily: 'InterRegular', fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '12 Aug 2022',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Belts',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Inactive',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '150',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '\$12,000',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              '\$600',
              style: TextStyle(
                  color: Color(0xff727880), fontWeight: FontWeight.w600),
            )),
            DataCell(Row(
              children: [
                InkWell(
                  onTap: () {


                  },
                  child: Image.asset(
                    'assets/edit-2.png',
                    scale: 4,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {


                  },
                  child: Image.asset(
                    'assets/trash.png',
                    scale: 4,
                  ),
                )
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
            DataCell(Text(
              '${index + 1}',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              'G7H7YB79',
              style: TextStyle(color: Color(0xff595FE5)),
            )),
            DataCell(Text(
              'Gaming Chair',
              style: TextStyle(color: greyy,
                  fontFamily: 'InterRegular', fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '21 Aug 2022',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Socks',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Active',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '15',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '\$19,000',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              '\$800',
              style: TextStyle(
                  color: Color(0xff727880), fontWeight: FontWeight.w600),
            )),
            DataCell(Row(
              children: [
                InkWell(
                  onTap: () {


                  },
                  child: Image.asset(
                    'assets/edit-2.png',
                    scale: 4,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {


                  },
                  child: Image.asset(
                    'assets/trash.png',
                    scale: 4,
                  ),
                )
              ],
            )),
          ],
        );
    }
    return null;
  }
}

