// ignore_for_file: prefer_const_constructors, file_names, camel_case_types
import 'dart:math';
import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:timeline_tile/timeline_tile.dart';
import '../../confing/Rtl.dart';
import '../../confing/colors.dart';

import '../../confing/list.dart';
import '../../confing/notifier.dart';
import '../../controller/page_controller.dart';
import '../Dashboard/Dashboard_main.dart';
import '../login/login.dart';

// ignore_for_file: deprecated_member_use

class Simple extends StatefulWidget {
  const Simple({super.key});

  @override
  State<Simple> createState() => _SimpleState();
}

class _SimpleState extends State<Simple> {
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
  SampleItem? selectedMenu;
  InboxController inboxController = Get.put(InboxController());
  bool isActive = false;
  bool cont = false;
  late ColorNotifier notifire;

  // ignore: annotate_overrides
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
                      data(constraints.maxWidth),
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
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  color: notifire.getbgcolor10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      data(constraints.maxWidth),
                    ],
                  ),
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

  PageController pageController = PageController();

  final DataTableSource _data = MyData();

  Widget firstContainer({
    context,
    constraints,
  }) {
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
              Text('Simple',style: TextStyle(color: notifire.getblackcolor,fontSize: 14,fontFamily: 'InterRegular'),),
            ],
          ),
          const SizedBox(height: 20,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(flex: 5, child: cont ? container(constraints) : data(constraints)),
              const SizedBox(width: 10,),
              cont ? Expanded(flex: 2, child: container1(constraints)) : const SizedBox(),
            ],
          ),
        ],
      ),
    );
  }

  Widget data(constraints) {
    return
      constraints < 600 ?
      SingleChildScrollView(
          child: Column(
          children: [
            Column(
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
                    Text('Simple',style: TextStyle(color: notifire.getblackcolor,fontSize: 14,fontFamily: 'InterRegular'),),
                  ],
                ),
                const SizedBox(height: 20,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 18,
                        width: 18,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: notifire.Getblg2,
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
                      const SizedBox(
                        width: 10,
                      ),
                       Text(
                        'All',
                        style: TextStyle(
                          fontFamily: 'InterRegular',
                          fontSize: 14,color: notifire.getblackcolor
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Sort by :',
                        style: TextStyle(
                            fontFamily: 'InterRegular',
                            fontSize: 14,
                            color: Color(0xff9DA2A7),
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Date Created',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'InterRegular',
                            color: Color(0xff727880)),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Image.asset(
                        'assets/arrow-down.png',
                        height: 12,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Status:',
                        style: TextStyle(
                            fontFamily: 'InterRegular',
                            fontSize: 14,
                            color: Color(0xff9DA2A7),
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'All Status',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'InterRegular',
                            color: Color(0xff727880)),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Image.asset(
                        'assets/arrow-down.png',
                        height: 12,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Supporter :',
                        style: TextStyle(
                            fontFamily: 'InterRegular',
                            fontSize: 14,
                            color: Color(0xff9DA2A7),
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'All Supporters',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'InterRegular',
                            color: Color(0xff727880)),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Image.asset(
                        'assets/arrow-down.png',
                        height: 12,
                      ),


                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                          color: notifire.getbgcolor11,),
                        padding: const EdgeInsets.all(11),
                        child: Row(
                          children: [
                            Image.asset('assets/import.png',
                                height: 16, color: const Color(0xff727880)),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              'Import',
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
                            Image.asset('assets/read1.png',
                                height: 16, color: const Color(0xff727880)),
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
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                          color: notifire.getbgcolor11,),
                        padding: const EdgeInsets.all(11),
                        child: Row(
                          children: [
                            Image.asset('assets/trash.png',
                                height: 16, color: const Color(0xff727880)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
              ],
            ),
            Theme(
              data: Theme.of(context).copyWith(
                  cardColor: notifire.getbgcolor11,
                  dividerColor: notifire.getgrey1,
                  dataTableTheme: DataTableThemeData(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)))),
              child: SizedBox(
                width: constraints < 1400 ? 1500 : Get.width,
                child: InkWell(
                 onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => container(constraints),)),
                  child: PaginatedDataTable(
                    source: _data,
                    columns: const <DataColumn>[
                      DataColumn(
                        label: Expanded(
                          child: Row(
                            children: [
                              Text(
                                '',
                                style: TextStyle(
                                  fontFamily: 'InterRegular',
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
                              Text(
                                '',
                                style: TextStyle(
                                  fontFamily: 'InterRegular',
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
                              Text(
                                '',
                                style: TextStyle(
                                  fontFamily: 'InterRegular',
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
                              Text(
                                '',
                                style: TextStyle(
                                  fontFamily: 'InterRegular',
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
                              Text(
                                '',
                                style: TextStyle(
                                  fontFamily: 'InterRegular',
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
                              Text(
                                '',
                                style: TextStyle(
                                  fontFamily: 'InterRegular',
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
                              Text(
                                '',
                                style: TextStyle(
                                  fontFamily: 'InterRegular',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                    columnSpacing: 50,
                    arrowHeadColor: Colors.black,
                    horizontalMargin: 10,
                    rowsPerPage: 15,
                    showCheckboxColumn: true,
                  ),
                ),
              ),
            ),
          ],
        )) :
      SingleChildScrollView(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 18,
                width: 18,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: notifire.getbgcolor11,
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
              const SizedBox(
                width: 10,
              ),
               Text(
                'All',
                style: TextStyle(
                  fontFamily: 'InterRegular',
                  fontSize: 14,color: notifire.getblackcolor
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'Sort by :',
                style: TextStyle(
                    fontFamily: 'InterRegular',
                    fontSize: 14,
                    color: Color(0xff9DA2A7),
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'Date Created',
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'InterRegular',
                    color: Color(0xff727880)),
              ),
              const SizedBox(
                width: 10,
              ),
              Image.asset(
                'assets/arrow-down.png',
                height: 12,
              ),
              const SizedBox(
                width: 20,
              ),
              const Text(
                'Status:',
                style: TextStyle(
                    fontFamily: 'InterRegular',
                    fontSize: 14,
                    color: Color(0xff9DA2A7),
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'All Status',
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'InterRegular',
                    color: Color(0xff727880)),
              ),
              const SizedBox(
                width: 10,
              ),
              Image.asset(
                'assets/arrow-down.png',
                height: 12,
              ),
              const SizedBox(
                width: 20,
              ),
              const Text(
                'Supporter :',
                style: TextStyle(
                    fontFamily: 'InterRegular',
                    fontSize: 14,
                    color: Color(0xff9DA2A7),
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'All Supporters',
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'InterRegular',
                    color: Color(0xff727880)),
              ),
              const SizedBox(
                width: 10,
              ),
              Image.asset(
                'assets/arrow-down.png',
                height: 12,
              ),
              const Spacer(),
              InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    color: notifire.getbgcolor11,),
                  padding: const EdgeInsets.all(11),
                  child: Row(
                    children: [
                      Image.asset('assets/import.png',
                          height: 16, color: const Color(0xff727880)),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        'Import',
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
                      Image.asset('assets/read1.png',
                          height: 16, color: const Color(0xff727880)),
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
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    color: notifire.getbgcolor11,),
                  padding: const EdgeInsets.all(11),
                  child: Row(
                    children: [
                      Image.asset('assets/trash.png',
                          height: 16, color: const Color(0xff727880)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10,),
          Theme(
            data: Theme.of(context).copyWith(
                cardColor: notifire.getbgcolor11,
                dividerColor: notifire.getgrey1,
                dataTableTheme: DataTableThemeData(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20)))),
            child: SizedBox(
              width: constraints < 1400 ? 1500 : Get.width,
              child: InkWell(
                onTap: () {
                  setState(() {
                    if (cont == false) {
                      cont = true;
                    } else {
                      cont = false;
                    }
                  });
                },
                child: PaginatedDataTable(
                  source: _data,
                  columns: const <DataColumn>[
                    DataColumn(
                      label: Expanded(
                        child: Row(
                          children: [
                            Text(
                              '',
                              style: TextStyle(
                                fontFamily: 'InterRegular',
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
                            Text(
                              '',
                              style: TextStyle(
                                fontFamily: 'InterRegular',
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
                            Text(
                              '',
                              style: TextStyle(
                                fontFamily: 'InterRegular',
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
                            Text(
                              '',
                              style: TextStyle(
                                fontFamily: 'InterRegular',
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
                            Text(
                              '',
                              style: TextStyle(
                                fontFamily: 'InterRegular',
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
                            Text(
                              '',
                              style: TextStyle(
                                fontFamily: 'InterRegular',
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
                            Text(
                              '',
                              style: TextStyle(
                                fontFamily: 'InterRegular',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                  columnSpacing: 50,
                  arrowHeadColor: Colors.black,
                  horizontalMargin: 10,
                  rowsPerPage: 15,
                  showCheckboxColumn: true,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  bool isdark = false;



  Widget container(constraints) {
    return
      constraints < 600 ?
      StatefulBuilder(
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
                        Text('Simple',style: TextStyle(color: notifire.getblackcolor,fontSize: 14,fontFamily: 'InterRegular'),),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: notifire.getbgcolor11,
                              ),
                              child: Center(
                                child: Row(
                                  children: [
                                    SvgPicture.asset('assets/reply.svg',
                                        height: 16, color: const Color(0xff727880)),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text(
                                      'Reply',
                                      style: TextStyle(
                                        color: Color(0xff727880),
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'InterRegular',
                                        fontSize: 14,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 10,),
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: notifire.getbgcolor11,
                              ),
                              child: Center(
                                child: Row(
                                  children: [
                                    SvgPicture.asset('assets/calendar-2.svg',
                                        height: 16, color: const Color(0xff727880)),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text(
                                      'Add Note',
                                      style: TextStyle(
                                        color: Color(0xff727880),
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'InterRegular',
                                        fontSize: 14,
                                      ),
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
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: notifire.getbgcolor11,
                              ),
                              child: Center(
                                child: Row(
                                  children: [
                                    SvgPicture.asset('assets/forward.svg',
                                        height: 16, color: const Color(0xff727880)),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text(
                                      'Forward',
                                      style: TextStyle(
                                        color: Color(0xff727880),
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'InterRegular',
                                        fontSize: 14,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 10,),
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: notifire.getbgcolor11,
                              ),
                              child: Center(
                                child: Row(
                                  children: [
                                    SvgPicture.asset('assets/tick-circle.svg',
                                        height: 16, color: const Color(0xff727880)),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text(
                                      'Close Ticket',
                                      style: TextStyle(
                                        color: Color(0xff727880),
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'InterRegular',
                                        fontSize: 14,
                                      ),
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
                        Row(children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: notifire.getbgcolor11,
                            ),
                            child: Center(
                              child: Row(
                                children: [
                                  SvgPicture.asset('assets/archive.svg',
                                      height: 16, color: const Color(0xff727880)),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    'Archive',
                                    style: TextStyle(
                                      color: Color(0xff727880),
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'InterRegular',
                                      fontSize: 14,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 10,),
                          PopupMenuButton(
                            tooltip: '',
                            offset: const Offset(10, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            elevation: 1,
                            splashRadius: 1,
                            constraints: const BoxConstraints(
                              maxWidth: 300,
                              minWidth: 300,
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
                                        child: Padding(
                                          padding: const EdgeInsets.all(12),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                               Text(
                                                'Delete 5 Tickets?',
                                                style: TextStyle(color: notifire.getblackcolor,
                                                    fontFamily: 'InterRegular',
                                                    fontSize: 18),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                               Text(
                                                  'All data will be lost. You can’t restore Please check again!',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontFamily: 'InterRegular',
                                                    color: notifire.getblackcolor,),
                                                  textAlign: TextAlign.center),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    padding: const EdgeInsets.all(12),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: notifire.Getblg2),
                                                      borderRadius:
                                                      BorderRadius.circular(12),
                                                    ),
                                                    child: const Text('Cancel',
                                                        style: TextStyle(
                                                            fontFamily: 'InterRegular',
                                                            fontSize: 14,
                                                            color: Color(0xff727880),
                                                            fontWeight: FontWeight.w600)),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Container(
                                                    padding: const EdgeInsets.all(12),
                                                    decoration: BoxDecoration(
                                                      color: const Color(0xffE5646C),
                                                      borderRadius:
                                                      BorderRadius.circular(12),
                                                    ),
                                                    child: const Text('Delete',
                                                        style: TextStyle(
                                                            fontFamily: 'InterRegular',
                                                            fontSize: 14,
                                                            color: Colors.white,
                                                            fontWeight: FontWeight.w600)),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  )),
                            ],
                            child: Container(
                              padding: const EdgeInsets.all(14),
                              decoration: BoxDecoration(
                                color: notifire.getbgcolor11,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Image.asset('assets/trash.png',
                                  height: 16, color: const Color(0xff727880)),
                            ),
                          )
                        ],
                        )

                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: notifire.getbgcolor11),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Excepteur sint occaecat cupidatat non proident, sunt in culpa',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'InterRegular',color: notifire.getblackcolor,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              const Spacer(),
                              const Text(
                                '#4567654365',
                                style: TextStyle(
                                  fontFamily: 'InterRegular',
                                  fontSize: 16,
                                  color: Color(0xff595FE5),
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            '5 hours ago (Thursday, 23 July, 2033 at 02:38 AM)',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'InterRegular',
                              color: Color(0xff727880),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Dear',
                                style: TextStyle(
                                    fontFamily: 'InterRegular',
                                    fontSize: 14,color: notifire.getblackcolor,
                                    fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugit nulla pariatur',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'InterRegular',color: notifire.getblackcolor
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Thank you!',
                                style: TextStyle(
                                    fontFamily: 'InterRegular',
                                    fontSize: 14,color: notifire.getblackcolor,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
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
                      child: Column(  mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/attach-circle.png',
                                height: 16,
                                color: const Color(0xff727880),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                'Attach Files',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'InterRegular',
                                    color: Color(0xff727880),
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 240,
                                child: DottedBorder(
                                  color: notifire.Getblg2
                                  ,                              borderType: BorderType.RRect,
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
                                            child: Image.asset('assets/pdf.png'),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'SAML18920-An-1293.html',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: notifire.getblackcolor,
                                                  fontFamily: 'InterRegular',
                                                ),
                                              ),
                                              const Text(
                                                '231.72 KB ',
                                                style: TextStyle(
                                                    color: Color(0xff727880), fontSize: 10),
                                              )
                                            ],
                                          ),
                                          const Spacer(),
                                          Image.asset('assets/Download.png', height: 20),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: 240,
                                child: DottedBorder(
                                  color: notifire.Getblg2,
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
                                            width: 10,
                                          ),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'SAML18920-An-1293.html',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: notifire.getblackcolor,
                                                  fontFamily: 'InterRegular',
                                                ),
                                              ),
                                              const Text(
                                                '231.72 KB ',
                                                style: TextStyle(
                                                    color: Color(0xff727880), fontSize: 10),
                                              )
                                            ],
                                          ),
                                          const Spacer(),
                                          Image.asset('assets/Download.png', height: 20),
                                        ],
                                      ),
                                    ),
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
                            Text(
                              'Properties',
                              style: TextStyle(
                                  fontFamily: 'InterRegular',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,color: notifire.getblackcolor
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
                                  'Status',
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
                                    Container(

                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12),
                                          border: Border.all(color: notifire.Getblg2,)),
                                      child: TextField(
                                        style:  TextStyle(color: notifire.getblackcolor),
                                        decoration: InputDecoration(
                                          hintText: 'Opened',
                                          hintStyle:  TextStyle(
                                              color: notifire.getblackcolor, fontSize: 15),
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
                                    Container(

                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12),
                                          border: Border.all(color: notifire.Getblg2,)),
                                      child: TextField(
                                        style:  TextStyle(color: notifire.getblackcolor),
                                        decoration: InputDecoration(
                                          hintText: 'Low',
                                          hintStyle:  TextStyle(
                                              color: notifire.getblackcolor, fontSize: 15),
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
                                    const Text('Assign to',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            fontFamily: 'InterRegular',
                                            color: Color(0xff727880))),
                                    const SizedBox(
                                      height: 10,
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
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Image.asset('assets/Avatar51.png',
                                                      height: 32),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    'Ananya Ishana',
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
                                              color: notifire.Getblg2,
                                            ),

                                          ),
                                          elevation: 0,
                                        ),
                                        iconStyleData:  IconStyleData(
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_outlined,
                                            color: notifire.getblackcolor,
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
                                const SizedBox(
                                  height: 20,
                                ),
                                Divider(
                                  color: notifire.Getblg2,
                                  height: 10,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Time Logs',
                                  style: TextStyle(
                                      fontFamily: 'InterRegular',
                                      fontSize: 14,color: notifire.getblackcolor,
                                      fontWeight: FontWeight.w600),
                                ),
                                Transform.translate(
                                  offset: const Offset(0, -30),
                                  child: TimelineTile(
                                    isFirst: true,
                                    hasIndicator: true,
                                    endChild:  Padding(
                                      padding: const EdgeInsets.only(top: 40, left: 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              const Text(
                                                '2h ago',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: 'InterRegular',
                                                    color: Color(0xff595FE5)),
                                              ),
                                              Text(
                                                'classical literature, discovered ',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: 'InterRegular',color: notifire.getblackcolor
                                                ),
                                              ),
                                              const Text(
                                                'Albert Flores',
                                                style: TextStyle(
                                                    color: Color(0xff727880),
                                                    fontSize: 14,
                                                    fontFamily: 'InterRegular'),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    // isFirst: true,
                                    beforeLineStyle:
                                    LineStyle(color: notifire.Getblg2, thickness: 2),
                                    indicatorStyle: IndicatorStyle(
                                      height: 10,
                                      width: 10,
                                      indicator: Container(
                                        height: 15,
                                        width: 15,
                                        decoration: const BoxDecoration(
                                            color: Color(0xffC6C8CB), shape: BoxShape.circle),
                                      ),
                                    ),
                                  ),
                                ),
                                Transform.translate(
                                  offset: const Offset(0, -30),
                                  child: TimelineTile(
                                    endChild:  Padding(
                                      padding: const EdgeInsets.only(top: 38, left: 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              const Text(
                                                '25 July, 2024, 11:02 PM',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: 'InterRegular',
                                                    color: Color(0xff595FE5)),
                                              ),
                                              Text(
                                                'Add Note ',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: 'InterRegular',color: notifire.getblackcolor
                                                ),
                                              ),
                                              const Text(
                                                'Albert Flores',
                                                style: TextStyle(
                                                    color: Color(0xff727880),
                                                    fontSize: 14,
                                                    fontFamily: 'InterRegular'),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    // isFirst: true,
                                    beforeLineStyle:
                                    LineStyle(color: notifire.Getblg2, thickness: 2),
                                    indicatorStyle: IndicatorStyle(
                                      height: 10,
                                      width: 10,
                                      indicator: Container(
                                        height: 15,
                                        width: 15,
                                        decoration: const BoxDecoration(
                                            color: Color(0xffC6C8CB), shape: BoxShape.circle),
                                      ),
                                    ),
                                  ),
                                ),
                                Transform.translate(
                                  offset: const Offset(0, -30),
                                  child: TimelineTile(
                                    endChild:  Padding(
                                      padding: const EdgeInsets.only(top: 38, left: 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              const Text(
                                                '16 July, 2024, 01:45 PM',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: 'InterRegular',
                                                    color: Color(0xff595FE5)),
                                              ),
                                              Text(
                                                'accident, sometimes on purpose',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: 'InterRegular',color: notifire.getblackcolor
                                                ),
                                              ),
                                              const Text(
                                                'Albert Flores',
                                                style: TextStyle(
                                                    color: Color(0xff727880),
                                                    fontSize: 14,
                                                    fontFamily: 'InterRegular'),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    // isFirst: true,
                                    beforeLineStyle:
                                    LineStyle(color: notifire.Getblg2, thickness: 2),
                                    indicatorStyle: IndicatorStyle(
                                      height: 10,
                                      width: 10,
                                      indicator: Container(
                                        height: 15,
                                        width: 15,
                                        decoration: const BoxDecoration(
                                            color: Color(0xffC6C8CB), shape: BoxShape.circle),
                                      ),
                                    ),
                                  ),
                                ),
                                Transform.translate(
                                  offset: const Offset(0, -30),
                                  child: TimelineTile(
                                    endChild:  Padding(
                                      padding: const EdgeInsets.only(top: 38, left: 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              const Text(
                                                '22h ago',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: 'InterRegular',
                                                    color: Color(0xff595FE5)),
                                              ),
                                              Text(
                                                'printing and typesetting industry',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: 'InterRegular',color: notifire.getblackcolor
                                                ),
                                              ),
                                              const Text(
                                                'By Albert Flores',
                                                style: TextStyle(
                                                    color: Color(0xff727880),
                                                    fontSize: 14,
                                                    fontFamily: 'InterRegular'),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    // isFirst: true,
                                    beforeLineStyle:
                                    LineStyle(color: notifire.Getblg2, thickness: 2),
                                    indicatorStyle: IndicatorStyle(
                                      height: 10,
                                      width: 10,
                                      indicator: Container(
                                        height: 15,
                                        width: 15,
                                        decoration: const BoxDecoration(
                                            color: Color(0xffC6C8CB), shape: BoxShape.circle),
                                      ),
                                    ),
                                  ),
                                ),
                                Transform.translate(
                                  offset: const Offset(0, -30),
                                  child: TimelineTile(
                                    endChild:  Padding(
                                      padding: const EdgeInsets.only(top: 38, left: 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              const Text(
                                                '01:45 PM',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: 'InterRegular',
                                                    color: Color(0xff595FE5)),
                                              ),
                                              Text(
                                                'accident, sometimes on purpose',
                                                style: TextStyle(
                                                  fontSize: 14,color: notifire.getblackcolor,
                                                  fontFamily: 'InterRegular',
                                                ),
                                              ),
                                              const Text(
                                                'Albert Flores',
                                                style: TextStyle(
                                                    color: Color(0xff727880),
                                                    fontSize: 14,
                                                    fontFamily: 'InterRegular'),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    // isFirst: true,
                                    beforeLineStyle:
                                    LineStyle(color: notifire.Getblg2, thickness: 2),
                                    indicatorStyle: IndicatorStyle(
                                      height: 10,
                                      width: 10,
                                      indicator: Container(
                                        height: 15,
                                        width: 15,
                                        decoration: const BoxDecoration(
                                            color: Color(0xffC6C8CB), shape: BoxShape.circle),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },

      ):
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
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: notifire.getbgcolor11,
                  ),
                  child: Center(
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/reply.svg',
                            height: 16, color: const Color(0xff727880)),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Reply',
                          style: TextStyle(
                            color: Color(0xff727880),
                            fontWeight: FontWeight.w600,
                            fontFamily: 'InterRegular',
                            fontSize: 14,
                          ),
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
                  onTap: () {

                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: notifire.getbgcolor11,
                  ),
                  child: Center(
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/calendar-2.svg',
                            height: 16, color: const Color(0xff727880)),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Add Note',
                          style: TextStyle(
                            color: Color(0xff727880),
                            fontWeight: FontWeight.w600,
                            fontFamily: 'InterRegular',
                            fontSize: 14,
                          ),
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
                onTap: () {

                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: notifire.getbgcolor11,
                  ),
                  child: Center(
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/forward.svg',
                            height: 16, color: const Color(0xff727880)),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Forward',
                          style: TextStyle(
                            color: Color(0xff727880),
                            fontWeight: FontWeight.w600,
                            fontFamily: 'InterRegular',
                            fontSize: 14,
                          ),
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
                onTap: () {

                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: notifire.getbgcolor11,
                  ),
                  child: Center(
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/tick-circle.svg',
                            height: 16, color: const Color(0xff727880)),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Close Ticket',
                          style: TextStyle(
                            color: Color(0xff727880),
                            fontWeight: FontWeight.w600,
                            fontFamily: 'InterRegular',
                            fontSize: 14,
                          ),
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
                  onTap: () {

                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: notifire.getbgcolor11,
                  ),
                  child: Center(
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/archive.svg',
                            height: 16, color: const Color(0xff727880)),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Archive',
                          style: TextStyle(
                            color: Color(0xff727880),
                            fontWeight: FontWeight.w600,
                            fontFamily: 'InterRegular',
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(),
              PopupMenuButton(
                tooltip: '',
                offset: const Offset(10, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 1,
                splashRadius: 1,
                constraints: const BoxConstraints(
                  maxWidth: 300,
                  minWidth: 300,
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
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                   Text(
                                    'Delete 5 Tickets?',
                                    style: TextStyle(color: notifire.getblackcolor,
                                        fontFamily: 'InterRegular',
                                        fontSize: 18),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                      'All data will be lost. You can’t restore Please check again!',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'InterRegular',
                                          color: Color(0xff727880)),
                                      textAlign: TextAlign.center),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          color: notifire.getbgcolor10,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: const Text('Cancel',
                                            style: TextStyle(
                                                fontFamily: 'InterRegular',
                                                fontSize: 14,
                                                color: Color(0xff727880),
                                                fontWeight: FontWeight.w600)),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          color: const Color(0xffE5646C),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: const Text('Delete',
                                            style: TextStyle(
                                                fontFamily: 'InterRegular',
                                                fontSize: 14,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600)),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      )),
                ],
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: notifire.getbgcolor11,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset('assets/trash.png',
                      height: 16, color: const Color(0xff727880)),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
           Container(
             padding: const EdgeInsets.all(10),
             decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: notifire.getbgcolor11),
             child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Excepteur sint occaecat cupidatat non proident, sunt in culpa',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'InterRegular',color: notifire.getblackcolor,
                          fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    const Text(
                      '#4567654365',
                      style: TextStyle(
                        fontFamily: 'InterRegular',
                        fontSize: 16,
                        color: Color(0xff595FE5),
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  '5 hours ago (Thursday, 23 July, 2033 at 02:38 AM)',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'InterRegular',
                    color: Color(0xff727880),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dear',
                      style: TextStyle(
                          fontFamily: 'InterRegular',
                          fontSize: 14,color: notifire.getblackcolor,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur',
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'InterRegular',color: notifire.getblackcolor
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Thank you!',
                      style: TextStyle(
                          fontFamily: 'InterRegular',
                          fontSize: 14,color: notifire.getblackcolor,
                          fontWeight: FontWeight.w400),
                    )
                  ],
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
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/attach-circle.png',
                      height: 16,
                      color: const Color(0xff727880),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Attach Files',
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'InterRegular',
                          color: Color(0xff727880),
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 240,
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
                                  child: Image.asset('assets/pdf.png'),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'SAML18920-An-1293.html',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: notifire.getblackcolor,
                                        fontFamily: 'InterRegular',
                                      ),
                                    ),
                                    const Text(
                                      '231.72 KB ',
                                      style: TextStyle(
                                          color: Color(0xff727880), fontSize: 10),
                                    )
                                  ],
                                ),
                                const Spacer(),
                                Image.asset('assets/Download.png', height: 20),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 240,
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
                                  width: 10,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'SAML18920-An-1293.html',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: notifire.getblackcolor,
                                        fontFamily: 'InterRegular',
                                      ),
                                    ),
                                    const Text(
                                      '231.72 KB ',
                                      style: TextStyle(
                                          color: Color(0xff727880), fontSize: 10),
                                    )
                                  ],
                                ),
                                const Spacer(),
                                Image.asset('assets/Download.png', height: 20),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

        ],
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
  Widget container1(constraints) {
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
             Text(
              'Properties',
              style: TextStyle(
                fontFamily: 'InterRegular',
                fontSize: 14,
                fontWeight: FontWeight.w600,color: notifire.getblackcolor
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
                  'Status',
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
                    Container(
                      width: Get.width * 0.25,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: notifire.getgrey1,)),
                      child: TextField(
                        style:  TextStyle(color: notifire.getblackcolor),
                        decoration: InputDecoration(
                          hintText: 'Opened',
                          hintStyle:  TextStyle(
                              color: notifire.getblackcolor, fontSize: 15),
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
                    Container(
                      width: Get.width * 0.25,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: notifire.getgrey1,)),
                      child: TextField(
                        style:  TextStyle(color: notifire.getblackcolor),
                        decoration: InputDecoration(
                          hintText: 'Low',
                          hintStyle:  TextStyle(
                              color: notifire.getblackcolor, fontSize: 15),
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
                    const Text('Assign to',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            fontFamily: 'InterRegular',
                            color: Color(0xff727880))),
                    const SizedBox(
                      height: 10,
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
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset('assets/Avatar51.png',
                                      height: 32),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                   Text(
                                    'Ananya Ishana',
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
                            color: notifire.getblackcolor,
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
color: notifire.getbgcolor10
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
                const SizedBox(
                  height: 20,
                ),
                 Divider(
                  color: notifire.getgrey1,
                  height: 10,
                ),
                const SizedBox(
                  height: 20,
                ),
                 Text(
                  'Time Logs',
                  style: TextStyle(
                      fontFamily: 'InterRegular',
                      fontSize: 14,color: notifire.getblackcolor,
                      fontWeight: FontWeight.w600),
                ),
                Transform.translate(
                  offset: const Offset(0, -30),
                  child: TimelineTile(
                    isFirst: true,
                    hasIndicator: true,
                    endChild:  Padding(
                      padding: const EdgeInsets.only(top: 40, left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text(
                                '2h ago',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'InterRegular',
                                    color: Color(0xff595FE5)),
                              ),
                              Text(
                                'classical literature, discovered ',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'InterRegular',color: notifire.getblackcolor
                                ),
                              ),
                              const Text(
                                'Albert Flores',
                                style: TextStyle(
                                    color: Color(0xff727880),
                                    fontSize: 14,
                                    fontFamily: 'InterRegular'),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    // isFirst: true,
                    beforeLineStyle:
                        const LineStyle(color: Color(0xffEEEEEE), thickness: 2),
                    indicatorStyle: IndicatorStyle(
                      height: 10,
                      width: 10,
                      indicator: Container(
                        height: 15,
                        width: 15,
                        decoration: const BoxDecoration(
                            color: Color(0xffC6C8CB), shape: BoxShape.circle),
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: const Offset(0, -30),
                  child: TimelineTile(
                    endChild:  Padding(
                      padding: const EdgeInsets.only(top: 38, left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text(
                                '25 July, 2024, 11:02 PM',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'InterRegular',
                                    color: Color(0xff595FE5)),
                              ),
                              Text(
                                'Add Note ',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'InterRegular',color: notifire.getblackcolor
                                ),
                              ),
                              const Text(
                                'Albert Flores',
                                style: TextStyle(
                                    color: Color(0xff727880),
                                    fontSize: 14,
                                    fontFamily: 'InterRegular'),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    // isFirst: true,
                    beforeLineStyle:
                        const LineStyle(color: Color(0xffEEEEEE), thickness: 2),
                    indicatorStyle: IndicatorStyle(
                      height: 10,
                      width: 10,
                      indicator: Container(
                        height: 15,
                        width: 15,
                        decoration: const BoxDecoration(
                            color: Color(0xffC6C8CB), shape: BoxShape.circle),
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: const Offset(0, -30),
                  child: TimelineTile(
                    endChild:  Padding(
                      padding: const EdgeInsets.only(top: 38, left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text(
                                '16 July, 2024, 01:45 PM',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'InterRegular',
                                    color: Color(0xff595FE5)),
                              ),
                              Text(
                                'accident, sometimes on purpose',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'InterRegular',color: notifire.getblackcolor
                                ),
                              ),
                              const Text(
                                'Albert Flores',
                                style: TextStyle(
                                    color: Color(0xff727880),
                                    fontSize: 14,
                                    fontFamily: 'InterRegular'),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    // isFirst: true,
                    beforeLineStyle:
                        const LineStyle(color: Color(0xffEEEEEE), thickness: 2),
                    indicatorStyle: IndicatorStyle(
                      height: 10,
                      width: 10,
                      indicator: Container(
                        height: 15,
                        width: 15,
                        decoration: const BoxDecoration(
                            color: Color(0xffC6C8CB), shape: BoxShape.circle),
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: const Offset(0, -30),
                  child: TimelineTile(
                    endChild:  Padding(
                      padding: const EdgeInsets.only(top: 38, left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text(
                                '22h ago',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'InterRegular',
                                    color: Color(0xff595FE5)),
                              ),
                              Text(
                                'printing and typesetting industry',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'InterRegular',color: notifire.getblackcolor
                                ),
                              ),
                              const Text(
                                'By Albert Flores',
                                style: TextStyle(
                                    color: Color(0xff727880),
                                    fontSize: 14,
                                    fontFamily: 'InterRegular'),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    // isFirst: true,
                    beforeLineStyle:
                        const LineStyle(color: Color(0xffEEEEEE), thickness: 2),
                    indicatorStyle: IndicatorStyle(
                      height: 10,
                      width: 10,
                      indicator: Container(
                        height: 15,
                        width: 15,
                        decoration: const BoxDecoration(
                            color: Color(0xffC6C8CB), shape: BoxShape.circle),
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: const Offset(0, -30),
                  child: TimelineTile(
                    endChild:  Padding(
                      padding: const EdgeInsets.only(top: 38, left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text(
                                '01:45 PM',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'InterRegular',
                                    color: Color(0xff595FE5)),
                              ),
                              Text(
                                'accident, sometimes on purpose',
                                style: TextStyle(
                                  fontSize: 14,color: notifire.getblackcolor,
                                  fontFamily: 'InterRegular',
                                ),
                              ),
                              const Text(
                                'Albert Flores',
                                style: TextStyle(
                                    color: Color(0xff727880),
                                    fontSize: 14,
                                    fontFamily: 'InterRegular'),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    // isFirst: true,
                    beforeLineStyle:
                        const LineStyle(color: Color(0xffEEEEEE), thickness: 2),
                    indicatorStyle: IndicatorStyle(
                      height: 10,
                      width: 10,
                      indicator: Container(
                        height: 15,
                        width: 15,
                        decoration: const BoxDecoration(
                            color: Color(0xffC6C8CB), shape: BoxShape.circle),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
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
            DataCell(
              Container(
                height: 30,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xffB0E4C8),
                ),
                child: const Center(
                    child: Text('Resolved',
                        style: TextStyle(
                            fontFamily: 'InterRegular',
                            fontSize: 12,
                            fontWeight: FontWeight.w500))),
              ),
            ),
             const DataCell(Text(
              '#5857487585',
              style: TextStyle(
                  fontSize: 14,  color: Color(0xff727880),
                  fontFamily: 'InterRegular',
                  fontWeight: FontWeight.w600),
            )),
            const DataCell(Text(
              'Excepteur sint occaecat cupidatat non proident, sunt in culpa',
              style: TextStyle(
                  fontFamily: 'InterRegular',
                  fontSize: 14,
                  color: Color(0xff727880)),
            )),
            const DataCell(Text(
              '5: 20 am',
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'InterRegular',
                  fontWeight: FontWeight.w600,
                  color: Color(0xff9DA2A7)),
            )),
            DataCell(Image.asset(
              'assets/avatar-6 1.png',
              height: 32,
            )),
            DataCell(Image.asset(
              'assets/more.png',
              height: 16,
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
            DataCell(
              Container(
                height: 30,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xffB0E4C8),
                ),
                child: const Center(
                    child: Text('Resolved',
                        style: TextStyle(
                            fontFamily: 'InterRegular',
                            fontSize: 12,
                            fontWeight: FontWeight.w500))),
              ),
            ),
             const DataCell(Text(
              '#456543453',
              style: TextStyle(
                  fontSize: 14,  color: Color(0xff727880),
                  fontFamily: 'InterRegular',
                  fontWeight: FontWeight.w600),
            )),
            const DataCell(Text(
              'It has survived not only five',
              style: TextStyle(
                  fontFamily: 'InterRegular',
                  fontSize: 14,
                  color: Color(0xff727880)),
            )),
            const DataCell(Text(
              '6: 30 am',
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'InterRegular',
                  fontWeight: FontWeight.w600,
                  color: Color(0xff9DA2A7)),
            )),
            DataCell(Image.asset(
              'assets/avatar-7 1.png',
              height: 32,
            )),
            DataCell(Image.asset(
              'assets/more.png',
              height: 16,
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
            DataCell(
              Container(
                height: 30,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xffFFC9AC),
                ),
                child: const Center(
                    child: Text('On Hold',
                        style: TextStyle(
                            fontFamily: 'InterRegular',
                            fontSize: 12,
                            fontWeight: FontWeight.w500))),
              ),
            ),
             const DataCell(Text(
              '#857494733',
              style: TextStyle(
                  fontSize: 14,  color: Color(0xff727880),
                  fontFamily: 'InterRegular',
                  fontWeight: FontWeight.w600),
            )),
            const DataCell(Text(
              'who chooses to enjoy a pleasure that has no annoying ',
              style: TextStyle(
                  fontFamily: 'InterRegular',
                  fontSize: 14,
                  color: Color(0xff727880)),
            )),
            const DataCell(Text(
              '11: 34 am',
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'InterRegular',
                  fontWeight: FontWeight.w600,
                  color: Color(0xff9DA2A7)),
            )),
            DataCell(Image.asset(
              'assets/avatar-8 1.png',
              height: 32,
            )),
            DataCell(Image.asset(
              'assets/more.png',
              height: 16,
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
            DataCell(
              Container(
                height: 30,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xffD9B7FB),
                ),
                child: const Center(
                    child: Text('In Progress',
                        style: TextStyle(
                            fontFamily: 'InterRegular',
                            fontSize: 12,
                            fontWeight: FontWeight.w500))),
              ),
            ),
             const DataCell(Text(
              '#3454565434',
              style: TextStyle(
                  fontSize: 14,  color: Color(0xff727880),
                  fontFamily: 'InterRegular',
                  fontWeight: FontWeight.w600),
            )),
            const DataCell(Text(
              'when our power of choice is untrammelled and when',
              style: TextStyle(
                  fontFamily: 'InterRegular',
                  fontSize: 14,
                  color: Color(0xff727880)),
            )),
            const DataCell(Text(
              '6: 30 am',
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'InterRegular',
                  fontWeight: FontWeight.w600,
                  color: Color(0xff9DA2A7)),
            )),
            DataCell(Image.asset(
              'assets/Avatar62.png',
              height: 32,
            )),
            DataCell(Image.asset(
              'assets/more.png',
              height: 16,
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
            DataCell(
              Container(
                height: 30,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xffC6C8CB),
                ),
                child: const Center(
                    child: Text('Closed',
                        style: TextStyle(
                            fontFamily: 'InterRegular',
                            fontSize: 12,
                            fontWeight: FontWeight.w500))),
              ),
            ),
             const DataCell(Text(
              '#959550584',
              style: TextStyle(
                  fontSize: 14,  color: Color(0xff727880),
                  fontFamily: 'InterRegular',
                  fontWeight: FontWeight.w600),
            )),
            const DataCell(Text(
              'On the other hand, we denounce with righteous indignation',
              style: TextStyle(
                  fontFamily: 'InterRegular',
                  fontSize: 14,
                  color: Color(0xff727880)),
            )),
            const DataCell(Text(
              '7: 43 am',
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'InterRegular',
                  fontWeight: FontWeight.w600,
                  color: Color(0xff9DA2A7)),
            )),
            DataCell(Image.asset(
              'assets/avatar-6 1.png',
              height: 32,
            )),
            DataCell(Image.asset(
              'assets/more.png',
              height: 16,
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
            DataCell(
              Container(
                height: 30,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xffB0E4C8),
                ),
                child: const Center(
                    child: Text('Resolved',
                        style: TextStyle(
                            fontFamily: 'InterRegular',
                            fontSize: 12,
                            fontWeight: FontWeight.w500))),
              ),
            ),
             const DataCell(Text(
              '#456543453',
              style: TextStyle(
                  fontSize: 14,  color: Color(0xff727880),
                  fontFamily: 'InterRegular',
                  fontWeight: FontWeight.w600),
            )),
            const DataCell(Text(
              'It has survived not only five',
              style: TextStyle(
                  fontFamily: 'InterRegular',
                  fontSize: 14,
                  color: Color(0xff727880)),
            )),
            const DataCell(Text(
              '6: 30 am',
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'InterRegular',
                  fontWeight: FontWeight.w600,
                  color: Color(0xff9DA2A7)),
            )),
            DataCell(Image.asset(
              'assets/avatar-7 1.png',
              height: 32,
            )),
            DataCell(Image.asset(
              'assets/more.png',
              height: 16,
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
            DataCell(
              Container(
                height: 30,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xffFFC9AC),
                ),
                child: const Center(
                    child: Text('On Hold',
                        style: TextStyle(
                            fontFamily: 'InterRegular',
                            fontSize: 12,
                            fontWeight: FontWeight.w500))),
              ),
            ),
             const DataCell(Text(
              '#857494733',
              style: TextStyle(
                  fontSize: 14,  color: Color(0xff727880),
                  fontFamily: 'InterRegular',
                  fontWeight: FontWeight.w600),
            )),
            const DataCell(Text(
              'who chooses to enjoy a pleasure that has no annoying ',
              style: TextStyle(
                  fontFamily: 'InterRegular',
                  fontSize: 14,
                  color: Color(0xff727880)),
            )),
            const DataCell(Text(
              '11: 34 am',
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'InterRegular',
                  fontWeight: FontWeight.w600,
                  color: Color(0xff9DA2A7)),
            )),
            DataCell(Image.asset(
              'assets/avatar-8 1.png',
              height: 32,
            )),
            DataCell(Image.asset(
              'assets/more.png',
              height: 16,
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
            DataCell(
              Container(
                height: 30,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xffD9B7FB),
                ),
                child:  const Center(
                    child: Text('In Progress',
                        style: TextStyle(
                            fontFamily: 'InterRegular',
                            fontSize: 12,  color: Color(0xff727880),
                            fontWeight: FontWeight.w500))),
              ),
            ),
            const DataCell(Text(
              '#3454565434',
              style: TextStyle(
                  fontSize: 14,color: Color(0xff727880),
                  fontFamily: 'InterRegular',
                  fontWeight: FontWeight.w600),
            )),
            const DataCell(Text(
              'when our power of choice is untrammelled and when',
              style: TextStyle(
                  fontFamily: 'InterRegular',
                  fontSize: 14,
                  color: Color(0xff727880)),
            )),
            const DataCell(Text(
              '6: 30 am',
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'InterRegular',
                  fontWeight: FontWeight.w600,
                  color: Color(0xff9DA2A7)),
            )),
            DataCell(Image.asset(
              'assets/Avatar62.png',
              height: 32,
            )),
            DataCell(Image.asset(
              'assets/more.png',
              height: 16,
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
            DataCell(
              Container(
                height: 30,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xffB0E4C8),
                ),
                child:  const Center(
                    child: Text('Resolved',
                        style: TextStyle(
                            fontFamily: 'InterRegular',
                            fontSize: 12,color: Color(0xff727880),
                            fontWeight: FontWeight.w500))),
              ),
            ),
            const DataCell(Text(
              '#5857487585',
              style: TextStyle(
                  fontSize: 14,color: Color(0xff727880),
                  fontFamily: 'InterRegular',
                  fontWeight: FontWeight.w600),
            )),
            const DataCell(Text(
              'Excepteur sint occaecat cupidatat non proident, sunt in culpa',
              style: TextStyle(
                  fontFamily: 'InterRegular',
                  fontSize: 14,
                  color: Color(0xff727880)),
            )),
            const DataCell(Text(
              '5: 20 am',
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'InterRegular',
                  fontWeight: FontWeight.w600,
                  color: Color(0xff9DA2A7)),
            )),
            DataCell(Image.asset(
              'assets/avatar-6 1.png',
              height: 32,
            )),
            DataCell(Image.asset(
              'assets/more.png',
              height: 16,
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
            DataCell(
              Container(
                height: 30,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xffB0E4C8),
                ),
                child:  const Center(
                    child: Text('Resolved',
                        style: TextStyle(
                            fontFamily: 'InterRegular',
                            fontSize: 12,color: Color(0xff727880),
                            fontWeight: FontWeight.w500))),
              ),
            ),
            const DataCell(Text(
              '#456543453',
              style: TextStyle(
                  fontSize: 14,color: Color(0xff727880),
                  fontFamily: 'InterRegular',
                  fontWeight: FontWeight.w600),
            )),
            const DataCell(Text(
              'It has survived not only five',
              style: TextStyle(
                  fontFamily: 'InterRegular',
                  fontSize: 14,
                  color: Color(0xff727880)),
            )),
            const DataCell(Text(
              '6: 30 am',
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'InterRegular',
                  fontWeight: FontWeight.w600,
                  color: Color(0xff9DA2A7)),
            )),
            DataCell(Image.asset(
              'assets/avatar-7 1.png',
              height: 32,
            )),
            DataCell(Image.asset(
              'assets/more.png',
              height: 16,
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
            DataCell(
              Container(
                height: 30,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xffB0E4C8),
                ),
                child: const Center(
                    child: Text('Resolved',
                        style: TextStyle(
                            fontFamily: 'InterRegular',
                            fontSize: 12,
                            fontWeight: FontWeight.w500))),
              ),
            ),
            const DataCell(Text(
              '#5857487585',
              style: TextStyle(
                  fontSize: 14,  color: Color(0xff727880),
                  fontFamily: 'InterRegular',
                  fontWeight: FontWeight.w600),
            )),
            const DataCell(Text(
              'Excepteur sint occaecat cupidatat non proident, sunt in culpa',
              style: TextStyle(
                  fontFamily: 'InterRegular',
                  fontSize: 14,
                  color: Color(0xff727880)),
            )),
            const DataCell(Text(
              '5: 20 am',
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'InterRegular',
                  fontWeight: FontWeight.w600,
                  color: Color(0xff9DA2A7)),
            )),
            DataCell(Image.asset(
              'assets/avatar-6 1.png',
              height: 32,
            )),
            DataCell(Image.asset(
              'assets/more.png',
              height: 16,
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
            DataCell(
              Container(
                height: 30,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xffB0E4C8),
                ),
                child: const Center(
                    child: Text('Resolved',
                        style: TextStyle(
                            fontFamily: 'InterRegular',
                            fontSize: 12,
                            fontWeight: FontWeight.w500))),
              ),
            ),
            const DataCell(Text(
              '#456543453',
              style: TextStyle(
                  fontSize: 14,  color: Color(0xff727880),
                  fontFamily: 'InterRegular',
                  fontWeight: FontWeight.w600),
            )),
            const DataCell(Text(
              'It has survived not only five',
              style: TextStyle(
                  fontFamily: 'InterRegular',
                  fontSize: 14,
                  color: Color(0xff727880)),
            )),
            const DataCell(Text(
              '6: 30 am',
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'InterRegular',
                  fontWeight: FontWeight.w600,
                  color: Color(0xff9DA2A7)),
            )),
            DataCell(Image.asset(
              'assets/avatar-7 1.png',
              height: 32,
            )),
            DataCell(Image.asset(
              'assets/more.png',
              height: 16,
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
            DataCell(
              Container(
                height: 30,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xffFFC9AC),
                ),
                child: const Center(
                    child: Text('On Hold',
                        style: TextStyle(
                            fontFamily: 'InterRegular',
                            fontSize: 12,
                            fontWeight: FontWeight.w500))),
              ),
            ),
            const DataCell(Text(
              '#857494733',
              style: TextStyle(
                  fontSize: 14,  color: Color(0xff727880),
                  fontFamily: 'InterRegular',
                  fontWeight: FontWeight.w600),
            )),
            const DataCell(Text(
              'who chooses to enjoy a pleasure that has no annoying ',
              style: TextStyle(
                  fontFamily: 'InterRegular',
                  fontSize: 14,
                  color: Color(0xff727880)),
            )),
            const DataCell(Text(
              '11: 34 am',
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'InterRegular',
                  fontWeight: FontWeight.w600,
                  color: Color(0xff9DA2A7)),
            )),
            DataCell(Image.asset(
              'assets/avatar-8 1.png',
              height: 32,
            )),
            DataCell(Image.asset(
              'assets/more.png',
              height: 16,
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
            DataCell(
              Container(
                height: 30,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xffD9B7FB),
                ),
                child: const Center(
                    child: Text('In Progress',
                        style: TextStyle(
                            fontFamily: 'InterRegular',
                            fontSize: 12,
                            fontWeight: FontWeight.w500))),
              ),
            ),
            const DataCell(Text(
              '#3454565434',
              style: TextStyle(
                  fontSize: 14,  color: Color(0xff727880),
                  fontFamily: 'InterRegular',
                  fontWeight: FontWeight.w600),
            )),
            const DataCell(Text(
              'when our power of choice is untrammelled and when',
              style: TextStyle(
                  fontFamily: 'InterRegular',
                  fontSize: 14,
                  color: Color(0xff727880)),
            )),
            const DataCell(Text(
              '6: 30 am',
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'InterRegular',
                  fontWeight: FontWeight.w600,
                  color: Color(0xff9DA2A7)),
            )),
            DataCell(Image.asset(
              'assets/Avatar62.png',
              height: 32,
            )),
            DataCell(Image.asset(
              'assets/more.png',
              height: 16,
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
            DataCell(
              Container(
                height: 30,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xffC6C8CB),
                ),
                child: const Center(
                    child: Text('Closed',
                        style: TextStyle(
                            fontFamily: 'InterRegular',
                            fontSize: 12,
                            fontWeight: FontWeight.w500))),
              ),
            ),
            const DataCell(Text(
              '#959550584',
              style: TextStyle(
                  fontSize: 14,  color: Color(0xff727880),
                  fontFamily: 'InterRegular',
                  fontWeight: FontWeight.w600),
            )),
            const DataCell(Text(
              'On the other hand, we denounce with righteous indignation',
              style: TextStyle(
                  fontFamily: 'InterRegular',
                  fontSize: 14,
                  color: Color(0xff727880)),
            )),
            const DataCell(Text(
              '7: 43 am',
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'InterRegular',
                  fontWeight: FontWeight.w600,
                  color: Color(0xff9DA2A7)),
            )),
            DataCell(Image.asset(
              'assets/avatar-6 1.png',
              height: 32,
            )),
            DataCell(Image.asset(
              'assets/more.png',
              height: 16,
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
            DataCell(
              Container(
                height: 30,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xffB0E4C8),
                ),
                child: const Center(
                    child: Text('Resolved',
                        style: TextStyle(
                            fontFamily: 'InterRegular',
                            fontSize: 12,
                            fontWeight: FontWeight.w500))),
              ),
            ),
            const DataCell(Text(
              '#456543453',
              style: TextStyle(
                  fontSize: 14,  color: Color(0xff727880),
                  fontFamily: 'InterRegular',
                  fontWeight: FontWeight.w600),
            )),
            const DataCell(Text(
              'It has survived not only five',
              style: TextStyle(
                  fontFamily: 'InterRegular',
                  fontSize: 14,
                  color: Color(0xff727880)),
            )),
            const DataCell(Text(
              '6: 30 am',
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'InterRegular',
                  fontWeight: FontWeight.w600,
                  color: Color(0xff9DA2A7)),
            )),
            DataCell(Image.asset(
              'assets/avatar-7 1.png',
              height: 32,
            )),
            DataCell(Image.asset(
              'assets/more.png',
              height: 16,
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
            DataCell(
              Container(
                height: 30,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xffFFC9AC),
                ),
                child: const Center(
                    child: Text('On Hold',
                        style: TextStyle(
                            fontFamily: 'InterRegular',
                            fontSize: 12,
                            fontWeight: FontWeight.w500))),
              ),
            ),
            const DataCell(Text(
              '#857494733',
              style: TextStyle(
                  fontSize: 14,  color: Color(0xff727880),
                  fontFamily: 'InterRegular',
                  fontWeight: FontWeight.w600),
            )),
            const DataCell(Text(
              'who chooses to enjoy a pleasure that has no annoying ',
              style: TextStyle(
                  fontFamily: 'InterRegular',
                  fontSize: 14,
                  color: Color(0xff727880)),
            )),
            const DataCell(Text(
              '11: 34 am',
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'InterRegular',
                  fontWeight: FontWeight.w600,
                  color: Color(0xff9DA2A7)),
            )),
            DataCell(Image.asset(
              'assets/avatar-8 1.png',
              height: 32,
            )),
            DataCell(Image.asset(
              'assets/more.png',
              height: 16,
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
            DataCell(
              Container(
                height: 30,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xffD9B7FB),
                ),
                child:  const Center(
                    child: Text('In Progress',
                        style: TextStyle(
                            fontFamily: 'InterRegular',
                            fontSize: 12,  color: Color(0xff727880),
                            fontWeight: FontWeight.w500))),
              ),
            ),
            const DataCell(Text(
              '#3454565434',
              style: TextStyle(
                  fontSize: 14,color: Color(0xff727880),
                  fontFamily: 'InterRegular',
                  fontWeight: FontWeight.w600),
            )),
            const DataCell(Text(
              'when our power of choice is untrammelled and when',
              style: TextStyle(
                  fontFamily: 'InterRegular',
                  fontSize: 14,
                  color: Color(0xff727880)),
            )),
            const DataCell(Text(
              '6: 30 am',
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'InterRegular',
                  fontWeight: FontWeight.w600,
                  color: Color(0xff9DA2A7)),
            )),
            DataCell(Image.asset(
              'assets/Avatar62.png',
              height: 32,
            )),
            DataCell(Image.asset(
              'assets/more.png',
              height: 16,
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
            DataCell(
              Container(
                height: 30,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xffB0E4C8),
                ),
                child:  const Center(
                    child: Text('Resolved',
                        style: TextStyle(
                            fontFamily: 'InterRegular',
                            fontSize: 12,color: Color(0xff727880),
                            fontWeight: FontWeight.w500))),
              ),
            ),
            const DataCell(Text(
              '#5857487585',
              style: TextStyle(
                  fontSize: 14,color: Color(0xff727880),
                  fontFamily: 'InterRegular',
                  fontWeight: FontWeight.w600),
            )),
            const DataCell(Text(
              'Excepteur sint occaecat cupidatat non proident, sunt in culpa',
              style: TextStyle(
                  fontFamily: 'InterRegular',
                  fontSize: 14,
                  color: Color(0xff727880)),
            )),
            const DataCell(Text(
              '5: 20 am',
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'InterRegular',
                  fontWeight: FontWeight.w600,
                  color: Color(0xff9DA2A7)),
            )),
            DataCell(Image.asset(
              'assets/avatar-6 1.png',
              height: 32,
            )),
            DataCell(Image.asset(
              'assets/more.png',
              height: 16,
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
            DataCell(
              Container(
                height: 30,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xffB0E4C8),
                ),
                child:  const Center(
                    child: Text('Resolved',
                        style: TextStyle(
                            fontFamily: 'InterRegular',
                            fontSize: 12,color: Color(0xff727880),
                            fontWeight: FontWeight.w500))),
              ),
            ),
            const DataCell(Text(
              '#456543453',
              style: TextStyle(
                  fontSize: 14,color: Color(0xff727880),
                  fontFamily: 'InterRegular',
                  fontWeight: FontWeight.w600),
            )),
            const DataCell(Text(
              'It has survived not only five',
              style: TextStyle(
                  fontFamily: 'InterRegular',
                  fontSize: 14,
                  color: Color(0xff727880)),
            )),
            const DataCell(Text(
              '6: 30 am',
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'InterRegular',
                  fontWeight: FontWeight.w600,
                  color: Color(0xff9DA2A7)),
            )),
            DataCell(Image.asset(
              'assets/avatar-7 1.png',
              height: 32,
            )),
            DataCell(Image.asset(
              'assets/more.png',
              height: 16,
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
            DataCell(
              Container(
                height: 30,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xffB0E4C8),
                ),
                child: const Center(
                    child: Text('Resolved',
                        style: TextStyle(
                            fontFamily: 'InterRegular',
                            fontSize: 12,
                            fontWeight: FontWeight.w500))),
              ),
            ),
            const DataCell(Text(
              '#456543453',
              style: TextStyle(
                  fontSize: 14,  color: Color(0xff727880),
                  fontFamily: 'InterRegular',
                  fontWeight: FontWeight.w600),
            )),
            const DataCell(Text(
              'It has survived not only five',
              style: TextStyle(
                  fontFamily: 'InterRegular',
                  fontSize: 14,
                  color: Color(0xff727880)),
            )),
            const DataCell(Text(
              '6: 30 am',
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'InterRegular',
                  fontWeight: FontWeight.w600,
                  color: Color(0xff9DA2A7)),
            )),
            DataCell(Image.asset(
              'assets/avatar-7 1.png',
              height: 32,
            )),
            DataCell(Image.asset(
              'assets/more.png',
              height: 16,
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
            DataCell(
              Container(
                height: 30,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xffFFC9AC),
                ),
                child: const Center(
                    child: Text('On Hold',
                        style: TextStyle(
                            fontFamily: 'InterRegular',
                            fontSize: 12,
                            fontWeight: FontWeight.w500))),
              ),
            ),
            const DataCell(Text(
              '#857494733',
              style: TextStyle(
                  fontSize: 14,  color: Color(0xff727880),
                  fontFamily: 'InterRegular',
                  fontWeight: FontWeight.w600),
            )),
            const DataCell(Text(
              'who chooses to enjoy a pleasure that has no annoying ',
              style: TextStyle(
                  fontFamily: 'InterRegular',
                  fontSize: 14,
                  color: Color(0xff727880)),
            )),
            const DataCell(Text(
              '11: 34 am',
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'InterRegular',
                  fontWeight: FontWeight.w600,
                  color: Color(0xff9DA2A7)),
            )),
            DataCell(Image.asset(
              'assets/avatar-8 1.png',
              height: 32,
            )),
            DataCell(Image.asset(
              'assets/more.png',
              height: 16,
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
            DataCell(
              Container(
                height: 30,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xffD9B7FB),
                ),
                child:  const Center(
                    child: Text('In Progress',
                        style: TextStyle(
                            fontFamily: 'InterRegular',
                            fontSize: 12,  color: Color(0xff727880),
                            fontWeight: FontWeight.w500))),
              ),
            ),
            const DataCell(Text(
              '#3454565434',
              style: TextStyle(
                  fontSize: 14,color: Color(0xff727880),
                  fontFamily: 'InterRegular',
                  fontWeight: FontWeight.w600),
            )),
            const DataCell(Text(
              'when our power of choice is untrammelled and when',
              style: TextStyle(
                  fontFamily: 'InterRegular',
                  fontSize: 14,
                  color: Color(0xff727880)),
            )),
            const DataCell(Text(
              '6: 30 am',
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'InterRegular',
                  fontWeight: FontWeight.w600,
                  color: Color(0xff9DA2A7)),
            )),
            DataCell(Image.asset(
              'assets/Avatar62.png',
              height: 32,
            )),
            DataCell(Image.asset(
              'assets/more.png',
              height: 16,
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
            DataCell(
              Container(
                height: 30,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xffB0E4C8),
                ),
                child:  const Center(
                    child: Text('Resolved',
                        style: TextStyle(
                            fontFamily: 'InterRegular',
                            fontSize: 12,color: Color(0xff727880),
                            fontWeight: FontWeight.w500))),
              ),
            ),
            const DataCell(Text(
              '#5857487585',
              style: TextStyle(
                  fontSize: 14,color: Color(0xff727880),
                  fontFamily: 'InterRegular',
                  fontWeight: FontWeight.w600),
            )),
            const DataCell(Text(
              'Excepteur sint occaecat cupidatat non proident, sunt in culpa',
              style: TextStyle(
                  fontFamily: 'InterRegular',
                  fontSize: 14,
                  color: Color(0xff727880)),
            )),
            const DataCell(Text(
              '5: 20 am',
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'InterRegular',
                  fontWeight: FontWeight.w600,
                  color: Color(0xff9DA2A7)),
            )),
            DataCell(Image.asset(
              'assets/avatar-6 1.png',
              height: 32,
            )),
            DataCell(Image.asset(
              'assets/more.png',
              height: 16,
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
            DataCell(
              Container(
                height: 30,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xffB0E4C8),
                ),
                child:  const Center(
                    child: Text('Resolved',
                        style: TextStyle(
                            fontFamily: 'InterRegular',
                            fontSize: 12,color: Color(0xff727880),
                            fontWeight: FontWeight.w500))),
              ),
            ),
            const DataCell(Text(
              '#456543453',
              style: TextStyle(
                  fontSize: 14,color: Color(0xff727880),
                  fontFamily: 'InterRegular',
                  fontWeight: FontWeight.w600),
            )),
            const DataCell(Text(
              'It has survived not only five',
              style: TextStyle(
                  fontFamily: 'InterRegular',
                  fontSize: 14,
                  color: Color(0xff727880)),
            )),
            const DataCell(Text(
              '6: 30 am',
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'InterRegular',
                  fontWeight: FontWeight.w600,
                  color: Color(0xff9DA2A7)),
            )),
            DataCell(Image.asset(
              'assets/avatar-7 1.png',
              height: 32,
            )),
            DataCell(Image.asset(
              'assets/more.png',
              height: 16,
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
            DataCell(
              Container(
                height: 30,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xffB0E4C8),
                ),
                child: const Center(
                    child: Text('Resolved',
                        style: TextStyle(
                            fontFamily: 'InterRegular',
                            fontSize: 12,
                            fontWeight: FontWeight.w500))),
              ),
            ),
            const DataCell(Text(
              '#5857487585',
              style: TextStyle(
                  fontSize: 14,  color: Color(0xff727880),
                  fontFamily: 'InterRegular',
                  fontWeight: FontWeight.w600),
            )),
            const DataCell(Text(
              'Excepteur sint occaecat cupidatat non proident, sunt in culpa',
              style: TextStyle(
                  fontFamily: 'InterRegular',
                  fontSize: 14,
                  color: Color(0xff727880)),
            )),
            const DataCell(Text(
              '5: 20 am',
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'InterRegular',
                  fontWeight: FontWeight.w600,
                  color: Color(0xff9DA2A7)),
            )),
            DataCell(Image.asset(
              'assets/avatar-6 1.png',
              height: 32,
            )),
            DataCell(Image.asset(
              'assets/more.png',
              height: 16,
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
            DataCell(
              Container(
                height: 30,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xffB0E4C8),
                ),
                child: const Center(
                    child: Text('Resolved',
                        style: TextStyle(
                            fontFamily: 'InterRegular',
                            fontSize: 12,
                            fontWeight: FontWeight.w500))),
              ),
            ),
            const DataCell(Text(
              '#456543453',
              style: TextStyle(
                  fontSize: 14,  color: Color(0xff727880),
                  fontFamily: 'InterRegular',
                  fontWeight: FontWeight.w600),
            )),
            const DataCell(Text(
              'It has survived not only five',
              style: TextStyle(
                  fontFamily: 'InterRegular',
                  fontSize: 14,
                  color: Color(0xff727880)),
            )),
            const DataCell(Text(
              '6: 30 am',
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'InterRegular',
                  fontWeight: FontWeight.w600,
                  color: Color(0xff9DA2A7)),
            )),
            DataCell(Image.asset(
              'assets/avatar-7 1.png',
              height: 32,
            )),
            DataCell(Image.asset(
              'assets/more.png',
              height: 16,
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
            DataCell(
              Container(
                height: 30,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xffFFC9AC),
                ),
                child: const Center(
                    child: Text('On Hold',
                        style: TextStyle(
                            fontFamily: 'InterRegular',
                            fontSize: 12,
                            fontWeight: FontWeight.w500))),
              ),
            ),
            const DataCell(Text(
              '#857494733',
              style: TextStyle(
                  fontSize: 14,  color: Color(0xff727880),
                  fontFamily: 'InterRegular',
                  fontWeight: FontWeight.w600),
            )),
            const DataCell(Text(
              'who chooses to enjoy a pleasure that has no annoying ',
              style: TextStyle(
                  fontFamily: 'InterRegular',
                  fontSize: 14,
                  color: Color(0xff727880)),
            )),
            const DataCell(Text(
              '11: 34 am',
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'InterRegular',
                  fontWeight: FontWeight.w600,
                  color: Color(0xff9DA2A7)),
            )),
            DataCell(Image.asset(
              'assets/avatar-8 1.png',
              height: 32,
            )),
            DataCell(Image.asset(
              'assets/more.png',
              height: 16,
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
            DataCell(
              Container(
                height: 30,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xffD9B7FB),
                ),
                child: const Center(
                    child: Text('In Progress',
                        style: TextStyle(
                            fontFamily: 'InterRegular',
                            fontSize: 12,
                            fontWeight: FontWeight.w500))),
              ),
            ),
            const DataCell(Text(
              '#3454565434',
              style: TextStyle(
                  fontSize: 14,  color: Color(0xff727880),
                  fontFamily: 'InterRegular',
                  fontWeight: FontWeight.w600),
            )),
            const DataCell(Text(
              'when our power of choice is untrammelled and when',
              style: TextStyle(
                  fontFamily: 'InterRegular',
                  fontSize: 14,
                  color: Color(0xff727880)),
            )),
            const DataCell(Text(
              '6: 30 am',
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'InterRegular',
                  fontWeight: FontWeight.w600,
                  color: Color(0xff9DA2A7)),
            )),
            DataCell(Image.asset(
              'assets/Avatar62.png',
              height: 32,
            )),
            DataCell(Image.asset(
              'assets/more.png',
              height: 16,
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
            DataCell(
              Container(
                height: 30,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xffC6C8CB),
                ),
                child: const Center(
                    child: Text('Closed',
                        style: TextStyle(
                            fontFamily: 'InterRegular',
                            fontSize: 12,
                            fontWeight: FontWeight.w500))),
              ),
            ),
            const DataCell(Text(
              '#959550584',
              style: TextStyle(
                  fontSize: 14,  color: Color(0xff727880),
                  fontFamily: 'InterRegular',
                  fontWeight: FontWeight.w600),
            )),
            const DataCell(Text(
              'On the other hand, we denounce with righteous indignation',
              style: TextStyle(
                  fontFamily: 'InterRegular',
                  fontSize: 14,
                  color: Color(0xff727880)),
            )),
            const DataCell(Text(
              '7: 43 am',
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'InterRegular',
                  fontWeight: FontWeight.w600,
                  color: Color(0xff9DA2A7)),
            )),
            DataCell(Image.asset(
              'assets/avatar-6 1.png',
              height: 32,
            )),
            DataCell(Image.asset(
              'assets/more.png',
              height: 16,
            )),
          ],
        );


    }
    return null;
  }
}
