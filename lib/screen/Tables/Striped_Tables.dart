// ignore_for_file: non_constant_identifier_names, file_names

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
// ignore_for_file: deprecated_member_use

class StripedTables extends StatefulWidget {
   const StripedTables({super.key});

  @override
  State<StripedTables> createState() => _StripedTablesState();
}

class _StripedTablesState extends State<StripedTables> {
  final DataTableSource _data = MyData();

  bool isActive = false;
  int value = 0;
  late ColorNotifier notifire;
  bool tap = false;
  SampleItem? selectedMenu;
  DateTime selectedDate = DateTime.now();
  InboxController inboxController = Get.put(InboxController());
  TextEditingController dateController = TextEditingController();

  DateRangePickerController dateSelecter = DateRangePickerController();


  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifier>(context, listen: true);
    return LayoutBuilder(
      builder: (context, raints) {
        if (raints.maxWidth < 700) {
          return Container(
              color: notifire.getbgcolor10,
              child: SingleChildScrollView(
                child: Column(
                  children: [

                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Search(context, raints.maxHeight),
                           const SizedBox(
                            height: 20,
                          ),
                          data(raints),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );

        }
        else if (raints.maxWidth < 1000) {
          return Container(
            decoration:  BoxDecoration(
                color:notifire.getbgcolor10
                ,),
            child: SingleChildScrollView(
              child: Column(
                children: [

                  ListView.builder(
                    itemCount: 1,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return  Padding(
                        padding: const EdgeInsets.only(bottom: 20,right: 20,left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Search(context, raints.maxHeight),
                             const SizedBox(
                              height: 20,
                            ),
                            data(raints),
                          ],
                        ),
                      );
                    },

                  ),
                ],
              ),
            ),
          );
        }
        else {
          return Container(
            decoration: BoxDecoration(
                color: notifire.getbgcolor10
                ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(

                  ),
                  ListView.builder(
                    itemCount: 1,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                    return  Padding(
                      padding: const EdgeInsets.only(right: 20,left: 20,bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Search(context, raints.maxHeight),
                           const SizedBox(
                            height: 20,
                          ),
                          data(raints),
                        ],
                      ),
                    );
                  },

                  ),
                ],
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
          size < 600 ?
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
                  Text('Striped',style: TextStyle(color: notifire.getblackcolor,fontSize: 14,fontFamily: 'InterRegular'),),
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                children: [

                   const Spacer(),
                   const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        color: notifire.getbgcolor11,),
                      padding:  const EdgeInsets.all(14),
                      child:   Center(child: Image.asset('assets/setting-5.png', scale: 4)),
                    ),
                  ),
                   const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding:  const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                          color:  const Color(0xff595FE5),
                          borderRadius: BorderRadius.circular(12)),
                      child:   Center(child: Image.asset('assets/add.png', scale: 4)),
                    ),
                  )
                ],
              ),
            ],
          ) :
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
                  Text('Striped',style: TextStyle(color: notifire.getblackcolor,fontSize: 14,fontFamily: 'InterRegular'),),
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                children: [

                   const Spacer(),
                   const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                      color: notifire.getbgcolor11,),
                      padding:  const EdgeInsets.all(11),
                      child: Row(
                        children: [
                          Image.asset('assets/setting-5.png', scale: 4),

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
                      padding:  const EdgeInsets.all(11),
                      decoration: BoxDecoration(
                          color:  const Color(0xff595FE5),
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(children: [
                        Image.asset('assets/add.png', scale: 4),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text('Create New Order',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Colors.white),)
                      ]),
                    ),
                  )
                ],
              ),
            ],
          )
          ;
      },
    );
  }

  Widget data(raints) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Theme(
            data: Theme.of(context).copyWith(
                cardColor: notifire.getbgcolor11,

                // dividerColor:  notifire.getgrey1,
                // dataTableTheme: DataTableThemeData(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)))
            ),
            child: SizedBox(
              width: raints.maxWidth < 1400 ? 1500 : Get.width,
              child: PaginatedDataTable(
                source: _data,
                header: Column(
                  children: [
                     const SizedBox(
                      height: 10,
                    ),
                    Row(children: [
                       const Text('3 selected',
                          style: TextStyle(
                              color: Color(0xff727880),
                              fontFamily: 'InterRegular',
                              fontSize: 14)),
                       const SizedBox(
                        width: 15,
                      ),
                      InkWell(
                          onTap: () {},
                          child: Image.asset('assets/archive1.png', scale: 3,color:  const Color(0xff9DA2A7),)),
                       const SizedBox(
                        width: 15,
                      ),
                      InkWell(
                          onTap: () {},
                          child: Image.asset('assets/Read.png', scale: 3)),
                       const SizedBox(
                        width: 15,
                      ),
                      InkWell(
                          onTap: () {},
                          child: Image.asset('assets/warning-2Iquestion.png',
                              scale: 3)),
                       const SizedBox(
                        width: 15,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Image.asset(
                          'assets/trash1.png',
                          scale: 3,
                        ),
                      )
                    ]),
                     const SizedBox(
                      height: 10,
                    ),
                     const Divider(
                      height: 10,
                      color: Color(0xffEEEEEE),
                    )
                  ],
                ),
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
                                color:  const Color(0xffF5F5F5),
                              ),
                              child: Checkbox(
                                  side:  const BorderSide(style: BorderStyle.none),
                                  visualDensity:
                                       const VisualDensity(horizontal: -4),
                                  activeColor:  const Color(0xff595FE5),
                                  shape: RoundedRectangleBorder(
                                    side:  const BorderSide(
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
                            'Order No',
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
                            'Tracking ID',
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
                            'Created On',
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
                            'Source',
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
                arrowHeadColor: Colors.black,
                horizontalMargin: 30,
                rowsPerPage: 15,
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
          color: MaterialStateColor.resolveWith((states) =>
          index % 1 == 1 ? Colors.red : const Color(0xffF5F5F5)),
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
                        color: Colors.white,
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
              '0000982551',
              style: TextStyle(color: Color(0xff595FE5)),
            )),
             DataCell(Text(
              'BrQv91mWzywzmvzg',
              style: TextStyle(color: greyy,
                  fontFamily: 'InterRegular', fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '28 Nov 1988, 00:38',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Gloves',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Container(
              height: 22,
              width: 65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: const Color(0xffB0E4C8),
              ),
              child: const Center(
                  child: Text('Opened',
                      style: TextStyle(
                          fontFamily: 'InterRegular',
                          fontSize: 12,
                          fontWeight: FontWeight.w600))),
            )),
            DataCell(Text(
              '120',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              '\$788.41',
              style: TextStyle(
                  color: Color(0xff727880), fontWeight: FontWeight.w600),
            )),
            DataCell(Row(
              children: [
                Image.asset(
                  'assets/more.png',
                  scale: 3,
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
            DataCell(Text(
              '${index + 1}',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              '0000982557',
              style: TextStyle(color: Color(0xff595FE5)),
            )),
             DataCell(Text(
              '1MwvM5j6J1bkvry',
              style: TextStyle(color: greyy,
                  fontFamily: 'InterRegular', fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '10 Apr 2003, 09:53',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Sports Outlet',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Container(
              height: 22,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: const Color(0xffF8BEC1),
              ),
              child: const Center(
                  child: Text('Closed',
                      style: TextStyle(
                          fontFamily: 'InterRegular',
                          fontSize: 12,
                          fontWeight: FontWeight.w600))),
            )),
            DataCell(Text(
              '30',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              '\$200.76',
              style: TextStyle(
                  color: Color(0xff727880), fontWeight: FontWeight.w600),
            )),
            DataCell(Row(
              children: [
                Image.asset(
                  'assets/more.png',
                  scale: 3,
                ),
              ],
            )),
          ],
        );
      case 2:
        return DataRow(
          color: MaterialStateColor.resolveWith((states) =>
          index % 1 == 1 ? Colors.red : const Color(0xffF5F5F5)),
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
                        color: Colors.white,
                      ),
                      child: Checkbox(
                          side:  const BorderSide(style: BorderStyle.none),
                          visualDensity:  const VisualDensity(horizontal: -4),
                          activeColor:  const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side:  const BorderSide(color: Colors.transparent),
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
              '0000675578',
              style: TextStyle(color: Color(0xff595FE5)),
            )),
             DataCell(Text(
              'BrQv91mWzywzmvzg',
              style: TextStyle(color: greyy,
                  fontFamily: 'InterRegular', fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '17 May 1996, 19:11',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Sports Outlet',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Container(
              height: 22,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color:  const Color(0xffB0E4C8),
              ),
              child:  const Center(
                  child: Text('Delivered',
                      style: TextStyle(
                          fontFamily: 'InterRegular',
                          fontSize: 12,
                          fontWeight: FontWeight.w600))),
            )),
            DataCell(Text(
              '30',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
             const DataCell(Text(
              '\$500.88',
              style: TextStyle(
                  color: Color(0xff727880),
                  fontWeight: FontWeight.w600,
                  fontFamily: 'InterRegular'),
            )),
            DataCell(Row(
              children: [
                InkWell(
                  onTap: () {

                  },
                  child: Image.asset(
                    'assets/more.png',
                    scale: 3,
                  ),
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
                        color:  const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side:  const BorderSide(style: BorderStyle.none),
                          visualDensity:  const VisualDensity(horizontal: -4),
                          activeColor:  const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side:  const BorderSide(color: Colors.transparent),
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
              '000580486',
              style: TextStyle(color: Color(0xff595FE5)),
            )),
             DataCell(Text(
              'H8jfoism9jf94m',
              style: TextStyle(color: greyy,
                  fontFamily: 'InterRegular', fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '24 Mar 2016, 09:37',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Belts',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Container(
              height: 22,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color:  const Color(0xffA9DDF5),
              ),
              child:  const Center(
                  child: Text('Opened',
                      style: TextStyle(
                          fontFamily: 'InterRegular',
                          fontSize: 12,
                          fontWeight: FontWeight.w600))),
            )),
            DataCell(Text(
              '150',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
             const DataCell(Text(
              '\$600.44',
              style: TextStyle(
                  color: Color(0xff727880), fontWeight: FontWeight.w600),
            )),
            DataCell(Row(
              children: [
                InkWell(
                  onTap: () {

                  },
                  child: Image.asset(
                    'assets/more.png',
                    scale: 3,
                  ),
                ),
              ],
            )),
          ],
        );
      case 4:
        return DataRow(
          color: MaterialStateColor.resolveWith((states) =>
          index % 1 == 1 ? Colors.red : const Color(0xffF5F5F5)),
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
                        color: Colors.white,
                      ),
                      child: Checkbox(
                          side:  const BorderSide(style: BorderStyle.none),
                          visualDensity:  const VisualDensity(horizontal: -4),
                          activeColor:  const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side:  const BorderSide(color: Colors.transparent),
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
              '006485868',
              style: TextStyle(color: Color(0xff595FE5)),
            )),
             DataCell(Text(
              'K8jfu8kdk8jddg',
              style: TextStyle(color: greyy,
                  fontFamily: 'InterRegular', fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '27 Jan 2016, 15:25',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Socks',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Container(
              height: 22,
              width: 65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color:  const Color(0xffFFC9AC),
              ),
              child:  const Center(
                  child: Text('Shipping',
                      style: TextStyle(
                          fontFamily: 'InterRegular',
                          fontSize: 12,
                          fontWeight: FontWeight.w600))),
            )),
            DataCell(Text(
              '15',
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
                    'assets/more.png',
                    scale: 3,
                  ),
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
                        color:  const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side:  const BorderSide(style: BorderStyle.none),
                          visualDensity:  const VisualDensity(horizontal: -4),
                          activeColor:  const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side:  const BorderSide(color: Colors.transparent),
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
              '000058669',
              style: TextStyle(color: Color(0xff595FE5)),
            )),
             DataCell(Text(
              'K9jdjJ9Wjdi2kasjd',
              style: TextStyle(color: greyy,
                  fontFamily: 'InterRegular', fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '16 Aug 2022, 19.54',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Boots',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Container(
              height: 22,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color:  const Color(0xffF8BEC1),
              ),
              child:  const Center(
                  child: Text('Closed',
                      style: TextStyle(
                          fontFamily: 'InterRegular',
                          fontSize: 12,
                          fontWeight: FontWeight.w600))),
            )),
            DataCell(Text(
              '40',
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
                    'assets/more.png',
                    scale: 3,
                  ),
                ),
              ],
            )),
          ],
        );
      case 6:
        return DataRow(
          color: MaterialStateColor.resolveWith((states) =>
          index % 1 == 1 ? Colors.red : const Color(0xffF5F5F5)),
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
                        color: Colors.white,
                      ),
                      child: Checkbox(
                          side:  const BorderSide(style: BorderStyle.none),
                          visualDensity:  const VisualDensity(horizontal: -4),
                          activeColor:  const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side:  const BorderSide(color: Colors.transparent),
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
              '0000495869',
              style: TextStyle(color: Color(0xff595FE5)),
            )),
             DataCell(Text(
              'J8dhU3Shyd7hsyh',
              style: TextStyle(color: greyy,
                  fontFamily: 'InterRegular', fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '5 Aug 2022, 02.56',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Accessories',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Container(
              height: 22,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color:  const Color(0xffA9DDF5),
              ),
              child:  const Center(
                  child: Text('Opened',
                      style: TextStyle(
                          fontFamily: 'InterRegular',
                          fontSize: 12,
                          fontWeight: FontWeight.w600))),
            )),
            DataCell(Text(
              '200',
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
                    'assets/more.png',
                    scale: 3,
                  ),
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
                        color:  const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side:  const BorderSide(style: BorderStyle.none),
                          visualDensity:  const VisualDensity(horizontal: -4),
                          activeColor:  const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side:  const BorderSide(color: Colors.transparent),
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
              '0000347465',
              style: TextStyle(color: Color(0xff595FE5)),
            )),
             DataCell(Text(
              'G7hdhfy8Hu44hcff',
              style: TextStyle(color: greyy,
                  fontFamily: 'InterRegular', fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '7 Aug 2022, 01.44',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Sunglasses',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Container(
              height: 22,
              width: 65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color:  const Color(0xffFFC9AC),
              ),
              child:  const Center(
                  child: Text('Shipping',
                      style: TextStyle(
                          fontFamily: 'InterRegular',
                          fontSize: 12,
                          fontWeight: FontWeight.w600))),
            )),
            DataCell(Text(
              '36',
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
                    'assets/more.png',
                    scale: 3,
                  ),
                ),
              ],
            )),
          ],
        );
      case 8:
        return DataRow(
          color: MaterialStateColor.resolveWith((states) =>
          index % 1 == 1 ? Colors.red : const Color(0xffF5F5F5)),
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
                        color: Colors.white,
                      ),
                      child: Checkbox(
                          side:  const BorderSide(style: BorderStyle.none),
                          visualDensity:  const VisualDensity(horizontal: -4),
                          activeColor:  const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side:  const BorderSide(color: Colors.transparent),
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
              '0000886786',
              style: TextStyle(color: Color(0xff595FE5)),
            )),
             DataCell(Text(
              'B8fjkwtyshHyeueowd',
              style: TextStyle(color: greyy,
                  fontFamily: 'InterRegular', fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '3 Dec 2022, 02.45',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Hoodies',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Container(
              height: 22,
              width: 64,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color:  const Color(0xffF8BEC1),
              ),
              child:  const Center(
                  child: Text('Closed',
                      style: TextStyle(
                          fontFamily: 'InterRegular',
                          fontSize: 12,
                          fontWeight: FontWeight.w600))),
            )),
            DataCell(Text(
              '80',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
             const DataCell(Text(
              '\$1,150',
              style: TextStyle(
                  color: Color(0xff727880), fontWeight: FontWeight.w600),
            )),
            DataCell(Row(
              children: [
                InkWell(
                  onTap: () {

                  },
                  child: Image.asset(
                    'assets/more.png',
                    scale: 3,
                  ),
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
                        color:  const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side:  const BorderSide(style: BorderStyle.none),
                          visualDensity:  const VisualDensity(horizontal: -4),
                          activeColor:  const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side:  const BorderSide(color: Colors.transparent),
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
              '0000675578',
              style: TextStyle(color: Color(0xff595FE5)),
            )),
            DataCell(Text(
              'BrQv91mWzywzmvzg',
              style: TextStyle(color: greyy,
                  fontFamily: 'InterRegular', fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '17 May 1996, 19:11',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Sports Outlet',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Container(
              height: 22,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color:  const Color(0xffB0E4C8),
              ),
              child:  const Center(
                  child: Text('Delivered',
                      style: TextStyle(
                          fontFamily: 'InterRegular',
                          fontSize: 12,
                          fontWeight: FontWeight.w600))),
            )),
            DataCell(Text(
              '30',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              '\$500.88',
              style: TextStyle(
                  color: Color(0xff727880),
                  fontWeight: FontWeight.w600,
                  fontFamily: 'InterRegular'),
            )),
            DataCell(Row(
              children: [
                InkWell(
                  onTap: () {

                  },
                  child: Image.asset(
                    'assets/more.png',
                    scale: 3,
                  ),
                ),
              ],
            )),
          ],
        );
      case 10:
        return DataRow(
          color: MaterialStateColor.resolveWith((states) =>
          index % 1 == 1 ? Colors.red : const Color(0xffF5F5F5)),
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
                        color: Colors.white,
                      ),
                      child: Checkbox(
                          side:  const BorderSide(style: BorderStyle.none),
                          visualDensity:  const VisualDensity(horizontal: -4),
                          activeColor:  const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side:  const BorderSide(color: Colors.transparent),
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
              '000580486',
              style: TextStyle(color: Color(0xff595FE5)),
            )),
            DataCell(Text(
              'H8jfoism9jf94m',
              style: TextStyle(color: greyy,
                  fontFamily: 'InterRegular', fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '24 Mar 2016, 09:37',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Belts',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Container(
              height: 22,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color:  const Color(0xffA9DDF5),
              ),
              child:  const Center(
                  child: Text('Opened',
                      style: TextStyle(
                          fontFamily: 'InterRegular',
                          fontSize: 12,
                          fontWeight: FontWeight.w600))),
            )),
            DataCell(Text(
              '150',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              '\$600.44',
              style: TextStyle(
                  color: Color(0xff727880), fontWeight: FontWeight.w600),
            )),
            DataCell(Row(
              children: [
                InkWell(
                  onTap: () {

                  },
                  child: Image.asset(
                    'assets/more.png',
                    scale: 3,
                  ),
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
                        color:  const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side:  const BorderSide(style: BorderStyle.none),
                          visualDensity:  const VisualDensity(horizontal: -4),
                          activeColor:  const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side:  const BorderSide(color: Colors.transparent),
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
              '006485868',
              style: TextStyle(color: Color(0xff595FE5)),
            )),
            DataCell(Text(
              'K8jfu8kdk8jddg',
              style: TextStyle(color: greyy,
                  fontFamily: 'InterRegular', fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '27 Jan 2016, 15:25',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Socks',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Container(
              height: 22,
              width: 65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color:  const Color(0xffFFC9AC),
              ),
              child:  const Center(
                  child: Text('Shipping',
                      style: TextStyle(
                          fontFamily: 'InterRegular',
                          fontSize: 12,
                          fontWeight: FontWeight.w600))),
            )),
            DataCell(Text(
              '15',
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
                    'assets/more.png',
                    scale: 3,
                  ),
                ),
              ],
            )),
          ],
        );
      case 12:
        return DataRow(
          color: MaterialStateColor.resolveWith((states) =>
          index % 1 == 1 ? Colors.red : const Color(0xffF5F5F5)),
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
                        color: Colors.white,
                      ),
                      child: Checkbox(
                          side:  const BorderSide(style: BorderStyle.none),
                          visualDensity:  const VisualDensity(horizontal: -4),
                          activeColor:  const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side:  const BorderSide(color: Colors.transparent),
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
              '000058669',
              style: TextStyle(color: Color(0xff595FE5)),
            )),
            DataCell(Text(
              'K9jdjJ9Wjdi2kasjd',
              style: TextStyle(color: greyy,
                  fontFamily: 'InterRegular', fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '16 Aug 2022, 19.54',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Boots',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Container(
              height: 22,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color:  const Color(0xffF8BEC1),
              ),
              child:  const Center(
                  child: Text('Closed',
                      style: TextStyle(
                          fontFamily: 'InterRegular',
                          fontSize: 12,
                          fontWeight: FontWeight.w600))),
            )),
            DataCell(Text(
              '40',
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
                    'assets/more.png',
                    scale: 3,
                  ),
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
                        color:  const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side:  const BorderSide(style: BorderStyle.none),
                          visualDensity:  const VisualDensity(horizontal: -4),
                          activeColor:  const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side:  const BorderSide(color: Colors.transparent),
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
              '0000495869',
              style: TextStyle(color: Color(0xff595FE5)),
            )),
            DataCell(Text(
              'J8dhU3Shyd7hsyh',
              style: TextStyle(color: greyy,
                  fontFamily: 'InterRegular', fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '5 Aug 2022, 02.56',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Accessories',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Container(
              height: 22,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color:  const Color(0xffA9DDF5),
              ),
              child:  const Center(
                  child: Text('Opened',
                      style: TextStyle(
                          fontFamily: 'InterRegular',
                          fontSize: 12,
                          fontWeight: FontWeight.w600))),
            )),
            DataCell(Text(
              '200',
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
                    'assets/more.png',
                    scale: 3,
                  ),
                ),
              ],
            )),
          ],
        );
      case 14:
        return DataRow(   color: MaterialStateColor.resolveWith((states) =>
        index % 1 == 1 ? Colors.red : const Color(0xffF5F5F5)),
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
                        color: Colors.white,
                      ),
                      child: Checkbox(
                          side:  const BorderSide(style: BorderStyle.none),
                          visualDensity:  const VisualDensity(horizontal: -4),
                          activeColor:  const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side:  const BorderSide(color: Colors.transparent),
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
              '0000347465',
              style: TextStyle(color: Color(0xff595FE5)),
            )),
            DataCell(Text(
              'G7hdhfy8Hu44hcff',
              style: TextStyle(color: greyy,
                  fontFamily: 'InterRegular', fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '7 Aug 2022, 01.44',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Sunglasses',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Container(
              height: 22,
              width: 65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color:  const Color(0xffFFC9AC),
              ),
              child:  const Center(
                  child: Text('Shipping',
                      style: TextStyle(
                          fontFamily: 'InterRegular',
                          fontSize: 12,
                          fontWeight: FontWeight.w600))),
            )),
            DataCell(Text(
              '36',
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
                    'assets/more.png',
                    scale: 3,
                  ),
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
                        color:  const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side:  const BorderSide(style: BorderStyle.none),
                          visualDensity:  const VisualDensity(horizontal: -4),
                          activeColor:  const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side:  const BorderSide(color: Colors.transparent),
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
              '0000886786',
              style: TextStyle(color: Color(0xff595FE5)),
            )),
            DataCell(Text(
              'B8fjkwtyshHyeueowd',
              style: TextStyle(color: greyy,
                  fontFamily: 'InterRegular', fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '3 Dec 2022, 02.45',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Hoodies',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Container(
              height: 22,
              width: 64,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color:  const Color(0xffF8BEC1),
              ),
              child:  const Center(
                  child: Text('Closed',
                      style: TextStyle(
                          fontFamily: 'InterRegular',
                          fontSize: 12,
                          fontWeight: FontWeight.w600))),
            )),
            DataCell(Text(
              '80',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              '\$1,150',
              style: TextStyle(
                  color: Color(0xff727880), fontWeight: FontWeight.w600),
            )),
            DataCell(Row(
              children: [
                InkWell(
                  onTap: () {

                  },
                  child: Image.asset(
                    'assets/more.png',
                    scale: 3,
                  ),
                ),
              ],
            )),
          ],
        );
      case 16:
        return DataRow(
          color: MaterialStateColor.resolveWith((states) =>
          index % 1 == 1 ? Colors.red : const Color(0xffF5F5F5)),
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
                        color: Colors.white,
                      ),
                      child: Checkbox(
                          side:  const BorderSide(style: BorderStyle.none),
                          visualDensity:  const VisualDensity(horizontal: -4),
                          activeColor:  const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side:  const BorderSide(color: Colors.transparent),
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
              '0000675578',
              style: TextStyle(color: Color(0xff595FE5)),
            )),
            DataCell(Text(
              'BrQv91mWzywzmvzg',
              style: TextStyle(color: greyy,
                  fontFamily: 'InterRegular', fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '17 May 1996, 19:11',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Sports Outlet',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Container(
              height: 22,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color:  const Color(0xffB0E4C8),
              ),
              child:  const Center(
                  child: Text('Delivered',
                      style: TextStyle(
                          fontFamily: 'InterRegular',
                          fontSize: 12,
                          fontWeight: FontWeight.w600))),
            )),
            DataCell(Text(
              '30',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              '\$500.88',
              style: TextStyle(
                  color: Color(0xff727880),
                  fontWeight: FontWeight.w600,
                  fontFamily: 'InterRegular'),
            )),
            DataCell(Row(
              children: [
                InkWell(
                  onTap: () {

                  },
                  child: Image.asset(
                    'assets/more.png',
                    scale: 3,
                  ),
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
                        color:  const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side:  const BorderSide(style: BorderStyle.none),
                          visualDensity:  const VisualDensity(horizontal: -4),
                          activeColor:  const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side:  const BorderSide(color: Colors.transparent),
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
              '000580486',
              style: TextStyle(color: Color(0xff595FE5)),
            )),
            DataCell(Text(
              'H8jfoism9jf94m',
              style: TextStyle(color: greyy,
                  fontFamily: 'InterRegular', fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '24 Mar 2016, 09:37',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Belts',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Container(
              height: 22,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color:  const Color(0xffA9DDF5),
              ),
              child:  const Center(
                  child: Text('Opened',
                      style: TextStyle(
                          fontFamily: 'InterRegular',
                          fontSize: 12,
                          fontWeight: FontWeight.w600))),
            )),
            DataCell(Text(
              '150',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              '\$600.44',
              style: TextStyle(
                  color: Color(0xff727880), fontWeight: FontWeight.w600),
            )),
            DataCell(Row(
              children: [
                InkWell(
                  onTap: () {

                  },
                  child: Image.asset(
                    'assets/more.png',
                    scale: 3,
                  ),
                ),
              ],
            )),
          ],
        );
      case 18:
        return DataRow(
          color: MaterialStateColor.resolveWith((states) =>
          index % 1 == 1 ? Colors.red : const Color(0xffF5F5F5)),
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
                        color: Colors.white,
                      ),
                      child: Checkbox(
                          side:  const BorderSide(style: BorderStyle.none),
                          visualDensity:  const VisualDensity(horizontal: -4),
                          activeColor:  const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side:  const BorderSide(color: Colors.transparent),
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
              '006485868',
              style: TextStyle(color: Color(0xff595FE5)),
            )),
            DataCell(Text(
              'K8jfu8kdk8jddg',
              style: TextStyle(color: greyy,
                  fontFamily: 'InterRegular', fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '27 Jan 2016, 15:25',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Socks',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Container(
              height: 22,
              width: 65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color:  const Color(0xffFFC9AC),
              ),
              child:  const Center(
                  child: Text('Shipping',
                      style: TextStyle(
                          fontFamily: 'InterRegular',
                          fontSize: 12,
                          fontWeight: FontWeight.w600))),
            )),
            DataCell(Text(
              '15',
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
                    'assets/more.png',
                    scale: 3,
                  ),
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
                        color:  const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side:  const BorderSide(style: BorderStyle.none),
                          visualDensity:  const VisualDensity(horizontal: -4),
                          activeColor:  const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side:  const BorderSide(color: Colors.transparent),
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
              '000058669',
              style: TextStyle(color: Color(0xff595FE5)),
            )),
            DataCell(Text(
              'K9jdjJ9Wjdi2kasjd',
              style: TextStyle(color: greyy,
                  fontFamily: 'InterRegular', fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '16 Aug 2022, 19.54',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Boots',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Container(
              height: 22,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color:  const Color(0xffF8BEC1),
              ),
              child:  const Center(
                  child: Text('Closed',
                      style: TextStyle(
                          fontFamily: 'InterRegular',
                          fontSize: 12,
                          fontWeight: FontWeight.w600))),
            )),
            DataCell(Text(
              '40',
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
                    'assets/more.png',
                    scale: 3,
                  ),
                ),
              ],
            )),
          ],
        );
      case 20:
        return DataRow(
          color: MaterialStateColor.resolveWith((states) =>
          index % 1 == 1 ? Colors.red : const Color(0xffF5F5F5)),
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
                        color: Colors.white,
                      ),
                      child: Checkbox(
                          side:  const BorderSide(style: BorderStyle.none),
                          visualDensity:  const VisualDensity(horizontal: -4),
                          activeColor:  const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side:  const BorderSide(color: Colors.transparent),
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
              '0000495869',
              style: TextStyle(color: Color(0xff595FE5)),
            )),
            DataCell(Text(
              'J8dhU3Shyd7hsyh',
              style: TextStyle(color: greyy,
                  fontFamily: 'InterRegular', fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '5 Aug 2022, 02.56',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Accessories',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Container(
              height: 22,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color:  const Color(0xffA9DDF5),
              ),
              child:  const Center(
                  child: Text('Opened',
                      style: TextStyle(
                          fontFamily: 'InterRegular',
                          fontSize: 12,
                          fontWeight: FontWeight.w600))),
            )),
            DataCell(Text(
              '200',
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
                    'assets/more.png',
                    scale: 3,
                  ),
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
                        color:  const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side:  const BorderSide(style: BorderStyle.none),
                          visualDensity:  const VisualDensity(horizontal: -4),
                          activeColor:  const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side:  const BorderSide(color: Colors.transparent),
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
              '0000347465',
              style: TextStyle(color: Color(0xff595FE5)),
            )),
            DataCell(Text(
              'G7hdhfy8Hu44hcff',
              style: TextStyle(color: greyy,
                  fontFamily: 'InterRegular', fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '7 Aug 2022, 01.44',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Sunglasses',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Container(
              height: 22,
              width: 65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color:  const Color(0xffFFC9AC),
              ),
              child:  const Center(
                  child: Text('Shipping',
                      style: TextStyle(
                          fontFamily: 'InterRegular',
                          fontSize: 12,
                          fontWeight: FontWeight.w600))),
            )),
            DataCell(Text(
              '36',
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
                    'assets/more.png',
                    scale: 3,
                  ),
                ),
              ],
            )),
          ],
        );
      case 22:
        return DataRow(
          color: MaterialStateColor.resolveWith((states) =>
          index % 1 == 1 ? Colors.red : const Color(0xffF5F5F5)),
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
                        color: Colors.white,
                      ),
                      child: Checkbox(
                          side:  const BorderSide(style: BorderStyle.none),
                          visualDensity:  const VisualDensity(horizontal: -4),
                          activeColor:  const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side:  const BorderSide(color: Colors.transparent),
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
              '0000886786',
              style: TextStyle(color: Color(0xff595FE5)),
            )),
            DataCell(Text(
              'B8fjkwtyshHyeueowd',
              style: TextStyle(color: greyy,
                  fontFamily: 'InterRegular', fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '3 Dec 2022, 02.45',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Hoodies',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Container(
              height: 22,
              width: 64,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color:  const Color(0xffF8BEC1),
              ),
              child:  const Center(
                  child: Text('Closed',
                      style: TextStyle(
                          fontFamily: 'InterRegular',
                          fontSize: 12,
                          fontWeight: FontWeight.w600))),
            )),
            DataCell(Text(
              '80',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              '\$1,150',
              style: TextStyle(
                  color: Color(0xff727880), fontWeight: FontWeight.w600),
            )),
            DataCell(Row(
              children: [
                InkWell(
                  onTap: () {

                  },
                  child: Image.asset(
                    'assets/more.png',
                    scale: 3,
                  ),
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
                        color:  const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side:  const BorderSide(style: BorderStyle.none),
                          visualDensity:  const VisualDensity(horizontal: -4),
                          activeColor:  const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side:  const BorderSide(color: Colors.transparent),
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
              '0000675578',
              style: TextStyle(color: Color(0xff595FE5)),
            )),
            DataCell(Text(
              'BrQv91mWzywzmvzg',
              style: TextStyle(color: greyy,
                  fontFamily: 'InterRegular', fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '17 May 1996, 19:11',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Sports Outlet',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Container(
              height: 22,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color:  const Color(0xffB0E4C8),
              ),
              child:  const Center(
                  child: Text('Delivered',
                      style: TextStyle(
                          fontFamily: 'InterRegular',
                          fontSize: 12,
                          fontWeight: FontWeight.w600))),
            )),
            DataCell(Text(
              '30',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              '\$500.88',
              style: TextStyle(
                  color: Color(0xff727880),
                  fontWeight: FontWeight.w600,
                  fontFamily: 'InterRegular'),
            )),
            DataCell(Row(
              children: [
                InkWell(
                  onTap: () {

                  },
                  child: Image.asset(
                    'assets/more.png',
                    scale: 3,
                  ),
                ),
              ],
            )),
          ],
        );
      case 24:
        return DataRow(
          color: MaterialStateColor.resolveWith((states) =>
          index % 1 == 1 ? Colors.red : const Color(0xffF5F5F5)),
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
                        color: Colors.white,
                      ),
                      child: Checkbox(
                          side:  const BorderSide(style: BorderStyle.none),
                          visualDensity:  const VisualDensity(horizontal: -4),
                          activeColor:  const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side:  const BorderSide(color: Colors.transparent),
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
              '000580486',
              style: TextStyle(color: Color(0xff595FE5)),
            )),
            DataCell(Text(
              'H8jfoism9jf94m',
              style: TextStyle(color: greyy,
                  fontFamily: 'InterRegular', fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '24 Mar 2016, 09:37',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Belts',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Container(
              height: 22,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color:  const Color(0xffA9DDF5),
              ),
              child:  const Center(
                  child: Text('Opened',
                      style: TextStyle(
                          fontFamily: 'InterRegular',
                          fontSize: 12,
                          fontWeight: FontWeight.w600))),
            )),
            DataCell(Text(
              '150',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              '\$600.44',
              style: TextStyle(
                  color: Color(0xff727880), fontWeight: FontWeight.w600),
            )),
            DataCell(Row(
              children: [
                InkWell(
                  onTap: () {

                  },
                  child: Image.asset(
                    'assets/more.png',
                    scale: 3,
                  ),
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
                        color:  const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side:  const BorderSide(style: BorderStyle.none),
                          visualDensity:  const VisualDensity(horizontal: -4),
                          activeColor:  const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side:  const BorderSide(color: Colors.transparent),
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
              '006485868',
              style: TextStyle(color: Color(0xff595FE5)),
            )),
            DataCell(Text(
              'K8jfu8kdk8jddg',
              style: TextStyle(color: greyy,
                  fontFamily: 'InterRegular', fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '27 Jan 2016, 15:25',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Socks',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Container(
              height: 22,
              width: 65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color:  const Color(0xffFFC9AC),
              ),
              child:  const Center(
                  child: Text('Shipping',
                      style: TextStyle(
                          fontFamily: 'InterRegular',
                          fontSize: 12,
                          fontWeight: FontWeight.w600))),
            )),
            DataCell(Text(
              '15',
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
                    'assets/more.png',
                    scale: 3,
                  ),
                ),
              ],
            )),
          ],
        );
      case 26:
        return DataRow(
          color: MaterialStateColor.resolveWith((states) =>
          index % 1 == 1 ? Colors.red : const Color(0xffF5F5F5)),
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
                        color: Colors.white,
                      ),
                      child: Checkbox(
                          side:  const BorderSide(style: BorderStyle.none),
                          visualDensity:  const VisualDensity(horizontal: -4),
                          activeColor:  const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side:  const BorderSide(color: Colors.transparent),
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
              '000058669',
              style: TextStyle(color: Color(0xff595FE5)),
            )),
            DataCell(Text(
              'K9jdjJ9Wjdi2kasjd',
              style: TextStyle(color: greyy,
                  fontFamily: 'InterRegular', fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '16 Aug 2022, 19.54',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Boots',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Container(
              height: 22,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color:  const Color(0xffF8BEC1),
              ),
              child:  const Center(
                  child: Text('Closed',
                      style: TextStyle(
                          fontFamily: 'InterRegular',
                          fontSize: 12,
                          fontWeight: FontWeight.w600))),
            )),
            DataCell(Text(
              '40',
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
                    'assets/more.png',
                    scale: 3,
                  ),
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
                        color:  const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side:  const BorderSide(style: BorderStyle.none),
                          visualDensity:  const VisualDensity(horizontal: -4),
                          activeColor:  const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side:  const BorderSide(color: Colors.transparent),
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
              '0000982557',
              style: TextStyle(color: Color(0xff595FE5)),
            )),
            DataCell(Text(
              '1MwvM5j6J1bkvry',
              style: TextStyle(color: greyy,
                  fontFamily: 'InterRegular', fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '10 Apr 2003, 09:53',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Sports Outlet',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Container(
              height: 22,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color:  const Color(0xffF8BEC1),
              ),
              child:  const Center(
                  child: Text('Closed',
                      style: TextStyle(
                          fontFamily: 'InterRegular',
                          fontSize: 12,
                          fontWeight: FontWeight.w600))),
            )),
            DataCell(Text(
              '30',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              '\$200.76',
              style: TextStyle(
                  color: Color(0xff727880), fontWeight: FontWeight.w600),
            )),
            DataCell(Row(
              children: [
                InkWell(
                  onTap: () {

                  },
                  child: Image.asset(
                    'assets/more.png',
                    scale: 3,
                  ),
                ),
              ],
            )),
          ],
        );
      case 28:
        return DataRow(
          color: MaterialStateColor.resolveWith((states) =>
          index % 1 == 1 ? Colors.red : const Color(0xffF5F5F5)),
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
                        color: Colors.white,
                      ),
                      child: Checkbox(
                          side:  const BorderSide(style: BorderStyle.none),
                          visualDensity:  const VisualDensity(horizontal: -4),
                          activeColor:  const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side:  const BorderSide(color: Colors.transparent),
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
              '0000675578',
              style: TextStyle(color: Color(0xff595FE5)),
            )),
            DataCell(Text(
              'BrQv91mWzywzmvzg',
              style: TextStyle(color: greyy,
                  fontFamily: 'InterRegular', fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '17 May 1996, 19:11',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Sports Outlet',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Container(
              height: 22,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color:  const Color(0xffB0E4C8),
              ),
              child:  const Center(
                  child: Text('Delivered',
                      style: TextStyle(
                          fontFamily: 'InterRegular',
                          fontSize: 12,
                          fontWeight: FontWeight.w600))),
            )),
            DataCell(Text(
              '30',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              '\$500.88',
              style: TextStyle(
                  color: Color(0xff727880),
                  fontWeight: FontWeight.w600,
                  fontFamily: 'InterRegular'),
            )),
            DataCell(Row(
              children: [
                InkWell(
                  onTap: () {

                  },
                  child: Image.asset(
                    'assets/more.png',
                    scale: 3,
                  ),
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
                        color:  const Color(0xffF5F5F5),
                      ),
                      child: Checkbox(
                          side:  const BorderSide(style: BorderStyle.none),
                          visualDensity:  const VisualDensity(horizontal: -4),
                          activeColor:  const Color(0xff595FE5),
                          shape: RoundedRectangleBorder(
                            side:  const BorderSide(color: Colors.transparent),
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
              '000580486',
              style: TextStyle(color: Color(0xff595FE5)),
            )),
            DataCell(Text(
              'H8jfoism9jf94m',
              style: TextStyle(color: greyy,
                  fontFamily: 'InterRegular', fontWeight: FontWeight.bold),
            )),
            DataCell(Text(
              '24 Mar 2016, 09:37',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Belts',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Container(
              height: 22,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color:  const Color(0xffA9DDF5),
              ),
              child:  const Center(
                  child: Text('Opened',
                      style: TextStyle(
                          fontFamily: 'InterRegular',
                          fontSize: 12,
                          fontWeight: FontWeight.w600))),
            )),
            DataCell(Text(
              '150',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            const DataCell(Text(
              '\$600.44',
              style: TextStyle(
                  color: Color(0xff727880), fontWeight: FontWeight.w600),
            )),
            DataCell(Row(
              children: [
                InkWell(
                  onTap: () {

                  },
                  child: Image.asset(
                    'assets/more.png',
                    scale: 3,
                  ),
                ),
              ],
            )),
          ],
        );
    }

    return null;
  }
}
