
// ignore_for_file: deprecated_member_use
// ignore_for_file: non_constant_identifier_names, file_names
import '../login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:evcp/confing/colors.dart';
import 'package:evcp/confing/list.dart';

import '../../confing/Rtl.dart';
import '../../confing/notifier.dart';
import '../../controller/page_controller.dart';
import '../Dashboard/Dashboard_main.dart';
import 'Billing Details.dart';


class AccountInfo extends StatefulWidget {
  const AccountInfo({super.key});

  @override
  State<AccountInfo> createState() => _AccountInfoState();
}

class _AccountInfoState extends State<AccountInfo> {
  late ColorNotifier notifire;

  int selectIndex = 0;
  int selectIndex1 = 0;
  bool isdark = false;
  InboxController inboxController = Get.put(InboxController());

  @override

  Widget build(BuildContext context) {

    notifire = Provider.of<ColorNotifier>(context, listen: true);
    return SizedBox(
      height: Get.height,
      child: Scaffold(
        backgroundColor: notifire.getbgcolor10,

        body: LayoutBuilder(builder: (context, constraints) {
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              // alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth < 600) {
                      return SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Center(child: Account_Info(constraints.maxWidth)),

                          ],
                        ),
                      );
                    } else if (constraints.maxWidth < 1000) {
                      return SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Center(child: Account_Info(constraints.maxWidth)),

                          ],
                        ),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.all(20),
                        child: Scaffold(
                          appBar: appbar(constraints:  constraints.maxWidth),
                          backgroundColor: notifire.getbgcolor10,
                          body: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Center(child: Account_Info(constraints.maxWidth)),
                              ],
                            ),
                          ),
                        ),
                      );

                    }
                  },
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget Account_Info(constraints) {
    return GetBuilder<InboxController>(builder: (inboxController) {
      return
        constraints < 600 ?
        StatefulBuilder(
          builder: (context, setState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: Get.height * 0.05),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: notifire.getbgcolor11,
                        // border: Border.all(color: Colors.grey.withOpacity(0.4)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                           Center(
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Account Info',
                                  style: TextStyle(
                                      fontFamily: 'InterRegular',
                                      fontSize: 20,color: notifire.getblackcolor,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'If you need info please check out ',
                                  style: TextStyle(
                                      color: notifire.getblackcolor,
                                      fontFamily: 'InterRegular',fontSize: 14),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Text(
                                    'Help Page',
                                    style: TextStyle(
                                        color: blue,
                                        fontFamily: 'InterRegular',fontSize: 14
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                           Row(
                            children: [
                              Text(
                                'Specify Team Size',
                                style: TextStyle(color: notifire.getblackcolor,
                                    fontFamily: 'InterRegular',
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),

                          SizedBox(
                            height: 80,
                            width: Get.width,
                            child: ListView.builder(
                              itemCount: 4,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              // physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      right: 10,),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                          onTap: () {
                                            setState(() {
                                              selectIndex1 = index;
                                            });
                                          },
                                          child: Container(
                                            height: 40,
                                            width: 80,
                                            // margin: EdgeInsets.symmetric(horizontal: 10),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 2,
                                                  color: selectIndex1 == index
                                                      ? notifire.getblackcolor
                                                      : notifire.getbgcolor10),
                                              color: notifire.getbgcolor10,
                                              borderRadius:
                                              const BorderRadius.all(
                                                  Radius.circular(8)),
                                            ),
                                            child: Center(
                                              child: Text(model().info[index],
                                                  style:  TextStyle(
                                                      fontFamily:
                                                      'InterRegular',color: notifire.getblackcolor,
                                                      fontWeight:
                                                      FontWeight.w600)),
                                            ),
                                          ))
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Customers will see this shortened version of your statement descriptor.',
                                  style: TextStyle(
                                    fontFamily: 'InterRegular',
                                    color: notifire.getblackcolor,
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                           Row(
                            children: [
                              Text(
                                'Team Account Name',
                                style: TextStyle(color: notifire.getblackcolor,
                                    fontFamily: 'InterRegular',
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                              style:  TextStyle(color: notifire.getblackcolor,),
                              decoration: InputDecoration(hintStyle: TextStyle(color: notifire.getblackcolor,),
                                contentPadding: const EdgeInsets.only(
                                    left: 20, right: 20),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(color: notifire.getgrey1)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(color: notifire.getgrey1)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: blue),
                                    borderRadius: BorderRadius.circular(8)),
                                suffixIcon: const Padding(
                                  padding: EdgeInsets.only(right: 10),
                                ),
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                           Row(
                            children: [
                              Text(
                                'Select Account Plan',
                                style: TextStyle(color: notifire.getblackcolor,
                                    fontFamily: 'InterRegular',
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          ListView.builder(physics: const NeverScrollableScrollPhysics(),
                            itemCount: model().info1.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(12),
                                    margin: const EdgeInsets.only(bottom: 20),

                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 2,
                                          color: selectIndex == index
                                              ? notifire.getblackcolor
                                              : notifire.getbgcolor10),
                                      color: notifire.getbgcolor10,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(8)),
                                    ),
                                    child: Center(
                                      child: ListTile(
                                        onTap: () {
                                          setState(() {
                                            selectIndex = index;
                                          });
                                        },
                                        leading: Image.asset(
                                            model().inforimage[index],color: notifire.getblackcolor,
                                            scale: 4),
                                        title: Text(model().info1[index],
                                            style:  TextStyle(
                                                color: notifire.getblackcolor,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'InterRegular')),
                                        subtitle: Text(model().infor2[index],
                                            style: TextStyle(
                                                fontFamily: 'InterRegular',
                                                color: notifire.getblackcolor)),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Container(
                                   padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                        color: notifire.getbgcolor10,
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(8),
                                        )),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Center(
                                            child: Image.asset(
                                                'assets/ArrowLineLeft-s.png',color: notifire.getblackcolor,
                                                scale: 4)),
                                         Text(
                                          'Previous',
                                          style: TextStyle(
                                            fontSize: 18,color: notifire.getblackcolor,
                                            fontFamily: 'InterRegular',
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
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    Get.to(const BillingDetails());
                                  },
                                  child: Container(
                                   padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                        color: notifire.blublack1,
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(8),
                                        )),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                         Center(
                                            child: Text(
                                              'Continue',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontFamily: 'InterRegular',
                                                color: notifire.getbgcolor),
                                            )),
                                        Image.asset(
                                            'assets/ArrowLineRight-s.png',color: notifire.getbgcolor,
                                            scale: 4),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text('',
                              style: TextStyle(color: Colors.transparent)),
                        ],
                      )),
                ),

                // SizedBox(height: Get.height * 0.05),
              ],
            );
          },
        ):
        StatefulBuilder(
        builder: (context, setState) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: Get.height * 0.05),
                Container(
                  padding: const EdgeInsets.all(40),
                    width: 500,
                    decoration: BoxDecoration(
                      color: notifire.getbgcolor11,
                      // border: Border.all(color: Colors.grey.withOpacity(0.4)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                         Center(
                          child: Column(
                            children: [

                              Text(
                                'Account Info',
                                style: TextStyle(
                                    fontFamily: 'InterRegular',
                                    fontSize: 20,color: notifire.getblackcolor,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'If you need more info, please check out ',
                                style: TextStyle(
                                    color: notifire.getblackcolor,
                                    fontFamily: 'InterRegular'),
                                overflow: TextOverflow.ellipsis,
                              ),
                              InkWell(
                                onTap: () {},
                                child: Text(
                                  'Help Page',
                                  style: TextStyle(
                                      color: blue,
                                      fontFamily: 'InterRegular'),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                         Row(
                          children: [
                            Text(
                              'Specify Team Size',
                              style: TextStyle(color: notifire.getblackcolor,
                                  fontFamily: 'InterRegular',
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                                
                        SizedBox(
                          height: 80,
                          width: Get.width,
                          child: ListView.builder(
                            itemCount: 4,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            // physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          selectIndex1 = index;
                                        });
                                      },
                                      child: Container(
                                        height: 40,
                                        width: 80,
                                        margin: const EdgeInsets.symmetric(horizontal: 10),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 2,
                                              color: selectIndex1 == index
                                                  ? notifire.getblackcolor
                                                  : notifire.getbgcolor10),
                                          color: notifire.getbgcolor10,
                                          borderRadius:
                                          const BorderRadius.all(
                                              Radius.circular(8)),
                                        ),
                                        child: Center(
                                          child: Text(model().info[index],
                                              style:  TextStyle(
                                                  fontFamily:
                                                  'InterRegular',color: notifire.getblackcolor,
                                                  fontWeight:
                                                  FontWeight.w600)),
                                        ),
                                      ))
                                ],
                              );
                            },
                          ),
                        ),
                                
                        Row(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Expanded(
                              child: Text(
                                'Customers will see this shortened version of your statement descriptor.',
                                style: TextStyle(
                                  fontFamily: 'InterRegular',
                                  color: notifire.getblackcolor,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                         Row(
                          children: [
                            Text(
                              'Team Account Name',
                              style: TextStyle(color: notifire.getblackcolor,
                                  fontFamily: 'InterRegular',
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                            style:  TextStyle(color: notifire.getblackcolor,),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(
                                  left: 20, right: 20),hintStyle:  TextStyle(color: notifire.getblackcolor,),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: notifire.getgrey1)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: notifire.getgrey1)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: blue),
                                  borderRadius: BorderRadius.circular(8)),
                              suffixIcon: const Padding(
                                padding: EdgeInsets.only(right: 10),
                              ),
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                         Row(
                          children: [
                            Text(
                              'Select Account Plan',
                              style: TextStyle(color: notifire.getblackcolor,
                                  fontFamily: 'InterRegular',
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ListView.builder(
                          itemCount: model().info1.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(bottom: 20),
                                  height: 70,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2,
                                        color: selectIndex == index
                                            ? notifire.getblackcolor
                                            : notifire.getbgcolor10),
                                    color: notifire.getbgcolor10,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8)),
                                  ),
                                  child: Center(
                                    child: ListTile(
                                      onTap: () {
                                        setState(() {
                                          selectIndex = index;
                                        });
                                      },
                                      leading: Image.asset(
                                          model().inforimage[index],color: notifire.getblackcolor,
                                          scale: 4),
                                      title: Text(model().info1[index],
                                          style:  TextStyle(
                                              color: notifire.getblackcolor,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'InterRegular')),
                                      subtitle: Text(model().infor2[index],
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',
                                            color: notifire.getblackcolor,)),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      color: notifire.getbgcolor10,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(8),
                                      )),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Center(
                                          child: Image.asset(
                                              'assets/ArrowLineLeft-s.png',color: notifire.getblackcolor,
                                              scale: 4)),
                                       Text(
                                        'Previous',
                                        style: TextStyle(
                                          fontSize: 18,color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular',
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
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Get.to(const BillingDetails());
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration:  BoxDecoration(
                                      color: notifire.blublack1,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(8),
                                      )),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                       Center(
                                          child: Text(
                                            'Continue',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontFamily: 'InterRegular',
                                              color: notifire.getbgcolor,),
                                          )),
                                      Image.asset(
                                          'assets/ArrowLineRight-s.png',color: notifire.getbgcolor,
                                          scale: 4),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
              ],
            ),
          );
        },
      );
    });
  }

  PreferredSizeWidget appbar({required double constraints,}) {return AppBar(
    automaticallyImplyLeading: false,
    title: constraints < 600
        ? Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Transform.translate(
          offset: const Offset(-8, 0),
          child: Container(
            width: Get.width * 0.4,
            height: 45,
            decoration: BoxDecoration(
                color: notifire.Getblg2,
                borderRadius: BorderRadius.circular(6)),
            child: TextField(
              style: TextStyle(color: notifire.getblackcolor),
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Image.asset('assets/search-normal.png',
                    scale: 4, color: const Color(0xff9DA2A7)),
                hintStyle: TextStyle(color: grey3),
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
          ),
        ),
      ],
    )
        : Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Transform.translate(
          offset: const Offset(-8, 0),
          child: Container(
            width: Get.width * 0.4,
            height: 45,
            decoration: BoxDecoration(
                color: notifire.Getblg2,
                borderRadius: BorderRadius.circular(6)),
            child: TextField(
              style: TextStyle(color: notifire.getblackcolor),
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Image.asset('assets/search-normal.png',
                    scale: 4, color: const Color(0xff9DA2A7)),
                hintStyle: TextStyle(color: grey3),
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
          ),
        ),
      ],
    ),
    elevation: 0,
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    shape: ContinuousRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    backgroundColor: notifire.getbgcolor11,
    actions: [
      PopupMenuButton(
        tooltip: '',
        offset: const Offset(0, 50),
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
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
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                model().Popo[index],
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
                                      Text(model().Popo1[index],
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'InterRegular',
                                            color: notifire.getblackcolor,
                                          )),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        model().popo2[index],
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'InterRegular',
                                          color: notifire.getblackcolor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(model().popo1[index],
                                      style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        fontSize: 12,
                                        color: notifire.getblackcolor,
                                      )),
                                ],
                              ),
                              const Spacer(),
                              Container(
                                height: 10,
                                width: 10,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: const Color(0xff595FE5)),
                              )
                            ],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
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
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        initialValue: selectedMenu,
        elevation: 1,
        splashRadius: 1,
        constraints: const BoxConstraints(
          maxWidth: 300,
          minWidth: 300,
        ),
        shadowColor: Colors.grey,
        color: notifire.getbgcolor11,
        child:
        SvgPicture.asset('assets/bell.svg', color: Neutral, height: 20),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                    color: notifire.getbgcolor10,
                                    borderRadius: BorderRadius.circular(20)),
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(model().popo1[index],
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'InterRegular',
                                        color: notifire.getblackcolor,
                                      )),
                                  Text(model().popo2[index],
                                      style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        fontSize: 12,
                                        color: notifire.getblackcolor,
                                      )),
                                ],
                              ),
                              const Spacer(),
                              Container(
                                height: 10,
                                width: 10,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: const Color(0xff595FE5)),
                              )
                            ],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => const login(),));
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
                        const SizedBox(width: 10,),
                        Text('RTL',style: TextStyle(color: notifire.getblackcolor,fontFamily: 'InterRegular')),
                        const Spacer(),
                        Transform.translate(
                            offset: const Offset(12, 0),
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
  );}

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
  bool switc = false;
  SampleItem? selectedMenu;
}

Widget divider() {
  return Expanded(
    child: Divider(
      color: grey1,
      thickness: 0.7,
      endIndent: 10,
    ),
  );
}
