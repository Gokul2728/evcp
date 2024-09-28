// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../confing/colors.dart';
import '../../confing/notifier.dart';
import '../../controller/page_controller.dart';
import '../Dashboard/Dashboard_main.dart';

// ignore_for_file: deprecated_member_use
class BorderedTables extends StatefulWidget {
  const BorderedTables({super.key});

  @override
  State<BorderedTables> createState() => _BorderedTablesState();
}

class _BorderedTablesState extends State<BorderedTables> {
  bool isActive = false;
  final DataTableSource _data = MyData();

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
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Search(context, raints.maxHeight),
                    const SizedBox(
                      height: 20,
                    ),
                    data1(raints)
                  ],
                ),
              ),
            ),
          );
        } else if (raints.maxWidth < 1000) {
          return Container(
            decoration: BoxDecoration(color: notifire.getbgcolor10),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Search(context, raints.maxHeight), data1(raints)],
                ),
              ),
            ),
          );
        } else {
          return Container(
            decoration: BoxDecoration(color: notifire.getbgcolor10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(),
                  ListView.builder(
                    itemCount: 1,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            right: 20, left: 20, bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Search(context, raints.maxHeight),
                            const SizedBox(
                              height: 20,
                            ),
                            data1(raints)
                          ],
                        ),
                      );
                    },
                  )
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
        return size < 600
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
                        'Table',
                        style: TextStyle(
                            color: greyy,
                            fontSize: 14,
                            fontFamily: 'InterRegular'),
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
                        'Bordered',
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
                    children: [
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: notifire.getbgcolor11,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(14),
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
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                              color: const Color(0xff595FE5),
                              borderRadius: BorderRadius.circular(12)),
                          child: Center(
                              child: Image.asset('assets/add.png', scale: 4)),
                        ),
                      )
                    ],
                  ),
                ],
              )
            : Column(
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
                        'Table',
                        style: TextStyle(
                            color: greyy,
                            fontSize: 14,
                            fontFamily: 'InterRegular'),
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
                        'Bordered',
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
                    children: [
                      const Spacer(),
                      InkWell(
                        onTap: () {},
                        child: Container(
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
                              'Add New Customer',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'InterRegular',
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

  Widget data1(raints) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Theme(
            data: Theme.of(context).copyWith(
                cardColor: notifire.getbgcolor11,
                dividerColor: Colors.black,
                dataTableTheme: DataTableThemeData(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20)))),
            child: SizedBox(
              width: raints.maxWidth < 1400 ? 1500 : Get.width,
              child: PaginatedDataTable(
                // headingRowColor: MaterialStateColor.resolveWith((states) =>  Color(0xffEEEEEE)),
                source: _data,
                columns: <DataColumn>[
                  DataColumn(
                    numeric: true,
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
                                  side:
                                      const BorderSide(style: BorderStyle.none),
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
                            '#',
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
                            'SKU',
                            style: TextStyle(
                                fontFamily: 'InterRegular',
                                color: Colors.transparent),
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
                            'First Name',
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
                            'Last Name',
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
                            'Email',
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
                            'Phone Number',
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
                            'Date Added',
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
            DataCell(
              Image.asset('assets/Avatar50.png', height: 30, width: 30),
            ),
            DataCell(Text(
              'Stanislav',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Davis',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'deanna.curtis@example.com',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '(480) 555-0103',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '100',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Inactive',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Row(
              children: [
                InkWell(
                    onTap: () {},
                    child: Image.asset('assets/save.png', scale: 4)),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    'assets/edit-2.png',
                    scale: 4,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
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
            DataCell(Image.asset(
              'assets/Avatar51.png',
              height: 30,
              width: 30,
            )),
            DataCell(Text(
              'Thomas',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Lopez',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'felicia.reid@example.com',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '(702) 555-0122',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '50',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Active',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Row(
              children: [
                InkWell(
                    onTap: () {},
                    child: Image.asset('assets/save.png', scale: 4)),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    'assets/edit-2.png',
                    scale: 4,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
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
            DataCell(Image.asset(
              'assets/Avatar52.png',
              width: 30,
              height: 30,
            )),
            DataCell(Text(
              'Harry',
              style: TextStyle(
                fontFamily: 'InterRegular',
                color: greyy,
              ),
            )),
            DataCell(Text(
              'Martinez',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'michael.mitc@example.com',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '(219) 555-0114',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '30',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Active',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Row(
              children: [
                InkWell(
                    onTap: () {},
                    child: Image.asset('assets/save.png', scale: 4)),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    'assets/edit-2.png',
                    scale: 4,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
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
            DataCell(Image.asset(
              'assets/Avatar51.png',
              height: 30,
              width: 30,
            )),
            DataCell(Text(
              'Rodriguez ',
              style: TextStyle(
                fontFamily: 'InterRegular',
                color: greyy,
              ),
            )),
            DataCell(Text(
              'Brown',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'deanna.curtis@example.com',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '(308) 555-0121',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '150',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Inactive',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Row(
              children: [
                InkWell(
                    onTap: () {},
                    child: Image.asset('assets/save.png', scale: 4)),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    'assets/edit-2.png',
                    scale: 4,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
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
            DataCell(Image.asset(
              'assets/Avatar50.png',
              height: 30,
              width: 30,
            )),
            DataCell(Text(
              'Smith',
              style: TextStyle(
                fontFamily: 'InterRegular',
                color: greyy,
              ),
            )),
            DataCell(Text(
              'Anderson',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'nevaeh.simmons@example.com',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '(252) 555-0126',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '15',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Active',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Row(
              children: [
                InkWell(
                    onTap: () {},
                    child: Image.asset('assets/save.png', scale: 4)),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    'assets/edit-2.png',
                    scale: 4,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
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
            DataCell(Image.asset(
              'assets/Avatar52.png',
              height: 30,
              width: 30,
            )),
            DataCell(Text(
              'Graham',
              style: TextStyle(
                fontFamily: 'InterRegular',
                color: greyy,
              ),
            )),
            DataCell(Text(
              'Hernandez',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'michelle.rivera@example.com',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '(201) 555-0124',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '40',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Inactive',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Row(
              children: [
                InkWell(
                    onTap: () {},
                    child: Image.asset('assets/save.png', scale: 4)),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    'assets/edit-2.png',
                    scale: 4,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
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
            DataCell(Image.asset(
              'assets/Avatar51.png',
              height: 30,
              width: 30,
            )),
            DataCell(Text(
              'Thomas',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Lopez',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'felicia.reid@example.com',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '(702) 555-0122',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '50',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Active',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Row(
              children: [
                InkWell(
                    onTap: () {},
                    child: Image.asset('assets/save.png', scale: 4)),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    'assets/edit-2.png',
                    scale: 4,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
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
            DataCell(Image.asset(
              'assets/Avatar52.png',
              width: 30,
              height: 30,
            )),
            DataCell(Text(
              'Harry',
              style: TextStyle(
                fontFamily: 'InterRegular',
                color: greyy,
              ),
            )),
            DataCell(Text(
              'Martinez',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'michael.mitc@example.com',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '(219) 555-0114',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '30',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Active',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Row(
              children: [
                InkWell(
                    onTap: () {},
                    child: Image.asset('assets/save.png', scale: 4)),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    'assets/edit-2.png',
                    scale: 4,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
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
            DataCell(Image.asset(
              'assets/Avatar51.png',
              height: 30,
              width: 30,
            )),
            DataCell(Text(
              'Rodriguez ',
              style: TextStyle(
                fontFamily: 'InterRegular',
                color: greyy,
              ),
            )),
            DataCell(Text(
              'Brown',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'deanna.curtis@example.com',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '(308) 555-0121',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '150',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Inactive',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Row(
              children: [
                InkWell(
                    onTap: () {},
                    child: Image.asset('assets/save.png', scale: 4)),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    'assets/edit-2.png',
                    scale: 4,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
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
            DataCell(Image.asset(
              'assets/Avatar51.png',
              height: 30,
              width: 30,
            )),
            DataCell(Text(
              'Thomas',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Lopez',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'felicia.reid@example.com',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '(702) 555-0122',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '50',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Active',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Row(
              children: [
                InkWell(
                    onTap: () {},
                    child: Image.asset('assets/save.png', scale: 4)),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    'assets/edit-2.png',
                    scale: 4,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
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
            DataCell(Image.asset(
              'assets/Avatar52.png',
              width: 30,
              height: 30,
            )),
            DataCell(Text(
              'Harry',
              style: TextStyle(
                fontFamily: 'InterRegular',
                color: greyy,
              ),
            )),
            DataCell(Text(
              'Martinez',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'michael.mitc@example.com',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '(219) 555-0114',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '30',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Active',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Row(
              children: [
                InkWell(
                    onTap: () {},
                    child: Image.asset('assets/save.png', scale: 4)),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    'assets/edit-2.png',
                    scale: 4,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
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
            DataCell(Image.asset(
              'assets/Avatar51.png',
              height: 30,
              width: 30,
            )),
            DataCell(Text(
              'Rodriguez ',
              style: TextStyle(
                fontFamily: 'InterRegular',
                color: greyy,
              ),
            )),
            DataCell(Text(
              'Brown',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'deanna.curtis@example.com',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '(308) 555-0121',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '150',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Inactive',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Row(
              children: [
                InkWell(
                    onTap: () {},
                    child: Image.asset('assets/save.png', scale: 4)),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    'assets/edit-2.png',
                    scale: 4,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
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
            DataCell(Image.asset(
              'assets/Avatar50.png',
              height: 30,
              width: 30,
            )),
            DataCell(Text(
              'Smith',
              style: TextStyle(
                fontFamily: 'InterRegular',
                color: greyy,
              ),
            )),
            DataCell(Text(
              'Anderson',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'nevaeh.simmons@example.com',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '(252) 555-0126',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '15',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Active',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Row(
              children: [
                InkWell(
                    onTap: () {},
                    child: Image.asset('assets/save.png', scale: 4)),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    'assets/edit-2.png',
                    scale: 4,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
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
            DataCell(Image.asset(
              'assets/Avatar52.png',
              height: 30,
              width: 30,
            )),
            DataCell(Text(
              'Graham',
              style: TextStyle(
                fontFamily: 'InterRegular',
                color: greyy,
              ),
            )),
            DataCell(Text(
              'Hernandez',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'michelle.rivera@example.com',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '(201) 555-0124',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '40',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Inactive',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Row(
              children: [
                InkWell(
                    onTap: () {},
                    child: Image.asset('assets/save.png', scale: 4)),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    'assets/edit-2.png',
                    scale: 4,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
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
            DataCell(Image.asset(
              'assets/Avatar51.png',
              height: 30,
              width: 30,
            )),
            DataCell(Text(
              'Thomas',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Lopez',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'felicia.reid@example.com',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '(702) 555-0122',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '50',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Active',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Row(
              children: [
                InkWell(
                    onTap: () {},
                    child: Image.asset('assets/save.png', scale: 4)),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    'assets/edit-2.png',
                    scale: 4,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
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
            DataCell(Image.asset(
              'assets/Avatar52.png',
              width: 30,
              height: 30,
            )),
            DataCell(Text(
              'Harry',
              style: TextStyle(
                fontFamily: 'InterRegular',
                color: greyy,
              ),
            )),
            DataCell(Text(
              'Martinez',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'michael.mitc@example.com',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '(219) 555-0114',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '30',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Active',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Row(
              children: [
                InkWell(
                    onTap: () {},
                    child: Image.asset('assets/save.png', scale: 4)),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    'assets/edit-2.png',
                    scale: 4,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
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
            DataCell(Image.asset(
              'assets/Avatar51.png',
              height: 30,
              width: 30,
            )),
            DataCell(Text(
              'Rodriguez ',
              style: TextStyle(
                fontFamily: 'InterRegular',
                color: greyy,
              ),
            )),
            DataCell(Text(
              'Brown',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'deanna.curtis@example.com',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '(308) 555-0121',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '150',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Inactive',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Row(
              children: [
                InkWell(
                    onTap: () {},
                    child: Image.asset('assets/save.png', scale: 4)),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    'assets/edit-2.png',
                    scale: 4,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
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
            DataCell(Image.asset(
              'assets/Avatar51.png',
              height: 30,
              width: 30,
            )),
            DataCell(Text(
              'Thomas',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Lopez',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'felicia.reid@example.com',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '(702) 555-0122',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '50',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Active',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Row(
              children: [
                InkWell(
                    onTap: () {},
                    child: Image.asset('assets/save.png', scale: 4)),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    'assets/edit-2.png',
                    scale: 4,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
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
            DataCell(Image.asset(
              'assets/Avatar52.png',
              width: 30,
              height: 30,
            )),
            DataCell(Text(
              'Harry',
              style: TextStyle(
                fontFamily: 'InterRegular',
                color: greyy,
              ),
            )),
            DataCell(Text(
              'Martinez',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'michael.mitc@example.com',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '(219) 555-0114',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '30',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Active',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Row(
              children: [
                InkWell(
                    onTap: () {},
                    child: Image.asset('assets/save.png', scale: 4)),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    'assets/edit-2.png',
                    scale: 4,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
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
            DataCell(Image.asset(
              'assets/Avatar51.png',
              height: 30,
              width: 30,
            )),
            DataCell(Text(
              'Rodriguez ',
              style: TextStyle(
                fontFamily: 'InterRegular',
                color: greyy,
              ),
            )),
            DataCell(Text(
              'Brown',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'deanna.curtis@example.com',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '(308) 555-0121',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '150',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Inactive',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Row(
              children: [
                InkWell(
                    onTap: () {},
                    child: Image.asset('assets/save.png', scale: 4)),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    'assets/edit-2.png',
                    scale: 4,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
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
            DataCell(Image.asset(
              'assets/Avatar51.png',
              height: 30,
              width: 30,
            )),
            DataCell(Text(
              'Thomas',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Lopez',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'felicia.reid@example.com',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '(702) 555-0122',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '50',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Active',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Row(
              children: [
                InkWell(
                    onTap: () {},
                    child: Image.asset('assets/save.png', scale: 4)),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    'assets/edit-2.png',
                    scale: 4,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
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
            DataCell(Image.asset(
              'assets/Avatar52.png',
              width: 30,
              height: 30,
            )),
            DataCell(Text(
              'Harry',
              style: TextStyle(
                fontFamily: 'InterRegular',
                color: greyy,
              ),
            )),
            DataCell(Text(
              'Martinez',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'michael.mitc@example.com',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '(219) 555-0114',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '30',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Active',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Row(
              children: [
                InkWell(
                    onTap: () {},
                    child: Image.asset('assets/save.png', scale: 4)),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    'assets/edit-2.png',
                    scale: 4,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
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
            DataCell(Image.asset(
              'assets/Avatar51.png',
              height: 30,
              width: 30,
            )),
            DataCell(Text(
              'Rodriguez ',
              style: TextStyle(
                fontFamily: 'InterRegular',
                color: greyy,
              ),
            )),
            DataCell(Text(
              'Brown',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'deanna.curtis@example.com',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '(308) 555-0121',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '150',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Inactive',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Row(
              children: [
                InkWell(
                    onTap: () {},
                    child: Image.asset('assets/save.png', scale: 4)),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    'assets/edit-2.png',
                    scale: 4,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
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
            DataCell(Image.asset(
              'assets/Avatar50.png',
              height: 30,
              width: 30,
            )),
            DataCell(Text(
              'Smith',
              style: TextStyle(
                fontFamily: 'InterRegular',
                color: greyy,
              ),
            )),
            DataCell(Text(
              'Anderson',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'nevaeh.simmons@example.com',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '(252) 555-0126',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '15',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Active',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Row(
              children: [
                InkWell(
                    onTap: () {},
                    child: Image.asset('assets/save.png', scale: 4)),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    'assets/edit-2.png',
                    scale: 4,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
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
            DataCell(Image.asset(
              'assets/Avatar52.png',
              height: 30,
              width: 30,
            )),
            DataCell(Text(
              'Graham',
              style: TextStyle(
                fontFamily: 'InterRegular',
                color: greyy,
              ),
            )),
            DataCell(Text(
              'Hernandez',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'michelle.rivera@example.com',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '(201) 555-0124',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '40',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Inactive',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Row(
              children: [
                InkWell(
                    onTap: () {},
                    child: Image.asset('assets/save.png', scale: 4)),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    'assets/edit-2.png',
                    scale: 4,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
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
            DataCell(Image.asset(
              'assets/Avatar51.png',
              height: 30,
              width: 30,
            )),
            DataCell(Text(
              'Thomas',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Lopez',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'felicia.reid@example.com',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '(702) 555-0122',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '50',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Active',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Row(
              children: [
                InkWell(
                    onTap: () {},
                    child: Image.asset('assets/save.png', scale: 4)),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    'assets/edit-2.png',
                    scale: 4,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
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
            DataCell(Image.asset(
              'assets/Avatar52.png',
              width: 30,
              height: 30,
            )),
            DataCell(Text(
              'Harry',
              style: TextStyle(
                fontFamily: 'InterRegular',
                color: greyy,
              ),
            )),
            DataCell(Text(
              'Martinez',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'michael.mitc@example.com',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '(219) 555-0114',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '30',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Active',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Row(
              children: [
                InkWell(
                    onTap: () {},
                    child: Image.asset('assets/save.png', scale: 4)),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    'assets/edit-2.png',
                    scale: 4,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
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
            DataCell(Image.asset(
              'assets/Avatar51.png',
              height: 30,
              width: 30,
            )),
            DataCell(Text(
              'Rodriguez ',
              style: TextStyle(
                fontFamily: 'InterRegular',
                color: greyy,
              ),
            )),
            DataCell(Text(
              'Brown',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'deanna.curtis@example.com',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '(308) 555-0121',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '150',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Inactive',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Row(
              children: [
                InkWell(
                    onTap: () {},
                    child: Image.asset('assets/save.png', scale: 4)),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    'assets/edit-2.png',
                    scale: 4,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
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
            DataCell(
              Image.asset('assets/Avatar50.png', height: 30, width: 30),
            ),
            DataCell(Text(
              'Stanislav',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Davis',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'deanna.curtis@example.com',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '(480) 555-0103',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '100',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Inactive',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Row(
              children: [
                InkWell(
                    onTap: () {},
                    child: Image.asset('assets/save.png', scale: 4)),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    'assets/edit-2.png',
                    scale: 4,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
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
            DataCell(Image.asset(
              'assets/Avatar51.png',
              height: 30,
              width: 30,
            )),
            DataCell(Text(
              'Thomas',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Lopez',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'felicia.reid@example.com',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '(702) 555-0122',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              '50',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Text(
              'Active',
              style: TextStyle(color: greyy, fontFamily: 'InterRegular'),
            )),
            DataCell(Row(
              children: [
                InkWell(
                    onTap: () {},
                    child: Image.asset('assets/save.png', scale: 4)),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    'assets/edit-2.png',
                    scale: 4,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {},
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
