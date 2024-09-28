// ignore_for_file: deprecated_member_use, unused_field

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../confing/colors.dart';

import '../../confing/list.dart';
import '../../confing/notifier.dart';
import '../../controller/page_controller.dart';
import '../Dashboard/Dashboard_main.dart';
// ignore_for_file: prefer_const_constructors, file_names, camel_case_types



class Version21 extends StatefulWidget {
  const Version21({super.key});

  @override
  State<Version21> createState() => _Version21State();
}

class _Version21State extends State<Version21> {
  final int _currentStep = 0;
  SampleItem? selectedMenu;

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

  late ColorNotifier notifire;


  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifier>(context, listen: true);
    return GetBuilder<InboxController>(builder: (inboxController) {
      return LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return Container(
                color: notifire.getbgcolor10,
                child:  SingleChildScrollView(
                  child: Column(
                    children: [
                      container(constraints.maxWidth),
                    ],
                  ),
                ),

            );

          }
          else if (constraints.maxWidth < 1000) {
            return Theme(
              data: Theme.of(context).copyWith(
                  scrollbarTheme: const ScrollbarThemeData(
                      trackVisibility: MaterialStatePropertyAll(false),
                      thumbVisibility: MaterialStatePropertyAll(false),
                      thickness: MaterialStatePropertyAll(0),
                      thumbColor: MaterialStatePropertyAll(
                        Color(0xff883DCF),
                      ))),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            container(constraints.maxWidth),
                          ],
                        ),
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
              child: SingleChildScrollView(
                child: Container(
                  color: notifire.getbgcolor10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: Get.width,
                        height: Get.height,
                        child: firstContainer(
                            context: context,
                            constraints: constraints.maxWidth),),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      );
    }
    );
  }
  InboxController inboxController = Get.put(InboxController());
  Widget firstContainer({
    context,
    constraints,
  }) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20,left: 20,right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            constraints < 600
                ? const SizedBox()
                : container(constraints),
          ],
        ),
      ),
    );
  }

  
  Widget container(constraints){
    if (constraints < 600) {
      return Column(
        children: [
          DefaultTabController(
            length: 2,
            child:
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(children: [
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
                    Text('Management',style: TextStyle(color: greyy,fontSize: 14,fontFamily: 'InterRegular'),),
                    const SizedBox(width: 10,),
                    Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: greyy,),),
                    const SizedBox(width: 10,),
                    Text('Version2',style: TextStyle(color: notifire.getblackcolor,fontSize: 14,fontFamily: 'InterRegular'),),
                  ],),
                  const SizedBox(height: 20,),
                  Center(
                    child: SizedBox(
                      width: Get.width,
                      child: Container(
                        decoration:  BoxDecoration(color: notifire.getbgcolor11,borderRadius: BorderRadius.circular(12),),
                        child: Row(
              
                            children: [
                            TabBar(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              indicatorColor: const Color(0xff2a70fe),
                              isScrollable: true,
                              tabs: <Widget>[
                                Tab(
                                    child: Row(
                                      children: [
                                        Image.asset('assets/kanban.png',color: notifire.getblackcolor
                                           , scale: 3.5),
                                      ],
                                    )),
                                Tab(
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/element-3.svg',
                                          height: 16,color: notifire.getblackcolor
                                        ),
                                 
                                      ],
                                    )),
                              ],
                            ),
                            const Spacer(),

                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color:notifire.getbgcolor10),
                                padding: const EdgeInsets.all(11),
                                child: Center(
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/star2.png',
                                        height: 16,
                                      ),
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
                                    color:notifire.getbgcolor10),
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
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                  color:notifire.getbgcolor10),
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Center(
                                      child: Image.asset(
                                        'assets/more.png',
                                        scale: 4,
                                      )),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10,),
                            Container(
                              height: 40,
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
                            const SizedBox(width: 10,),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height :20),
                  Column(
                    children: [
                      Row(children: [
              
                         Text('Workspace',style: TextStyle(fontFamily: 'InterRegular',fontSize: 12,color: notifire.getblackcolor)),
                        const SizedBox(width: 8,),
                        Image.asset('assets/Ellipse 88.png',height: 4,),
                        const SizedBox(width: 8,),
                         Text('Team',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                        const SizedBox(width: 8,),
                        Image.asset('assets/Ellipse 88.png',height: 4,),
                        const SizedBox(width: 8,),
                        const Text('Web Design',style: TextStyle(fontFamily: 'InterRegular',fontSize: 12,color: Color(0xff9DA2A7)),)
                      ],),
                      const SizedBox(height: 10,),
                      Row(
                        children: [
                           Text('Dashboard Design',style: TextStyle(fontSize: 28,fontFamily: 'InterRegular',fontWeight: FontWeight.w500,color:  notifire.getblackcolor),),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: Get.height ,
                        child: TabBarView(
                          children: [
                            SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      height: Get.height,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                             Text(
                                              'Backlogs',
                                              style: TextStyle(
                                                  color: notifire.getblackcolor,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                  fontFamily: 'InterRegular'),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Container(
                                                padding: const EdgeInsets.all(4),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(12),
                                                    border: Border.all(color: const Color(0xffEEEEEE))
                                                ),
                                                child: const Text(
                                                  '4',
                                                  style: TextStyle(
                                                      fontFamily: 'InterRegular',
                                                      fontSize: 12,
                                                      color: Color(0xff9DA2A7)),
                                                )),
                                            const Spacer(),
                                            Image.asset('assets/add.png',height: 16,color: const Color(0xff9DA2A7)),
                                            const SizedBox(width: 10,),
                                            Image.asset(
                                              'assets/more.png',
                                              height: 16,color: const Color(0xff9DA2A7),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Expanded(
                                          child: ListView.builder( physics: const NeverScrollableScrollPhysics(),
                                            scrollDirection: Axis.vertical,
                                            itemCount: model().Wor.length,
                                            itemBuilder: (context, index) {
                                              return Container(
                                                margin:
                                                const EdgeInsets.only(bottom: 20),
                                                padding: const EdgeInsets.all(14),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(12),
                                                  color: notifire.getbgcolor11,
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                                  children: [
                                                    index == 1 ?  Image.asset('assets/Media12.png',):const SizedBox(),
                                                    const SizedBox(height: 10,),
                                                    index ==  0 ?
                                                    Row(
                                                      children: [
                                                        Container(
                                                          width: 30,
                                                          height: 10,
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(5),
                                                            color: const Color(0xffB0E4C8),
                                                          ),
                                                        ),
                                                        const SizedBox(width: 5,),
                                                        Container(
                                                          width: 30,
                                                          height: 10,
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(5),
                                                            color: const Color(0xffF8BEC1),
                                                          ),
                                                        ),
                                                        const SizedBox(width: 5,),
                                                        Container(
                                                          width: 30,
                                                          height: 10,
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(5),
                                                            color: const Color(0xffA9DDF5),
                                                          ),
                                                        ),
                                                      ],
                                                    ): const SizedBox(),
                                                    index ==  1 ?
                                                    Row(
                                                      children: [
                                                        Container(
                                                          width: 30,
                                                          height: 10,
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(5),
                                                            color: const Color(0xffD9B7FB),
                                                          ),
                                                        ),
                                                        const SizedBox(width: 5,),
                                                        Container(
                                                          width: 30,
                                                          height: 10,
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(5),
                                                            color: const Color(0xffFFC9AC),
                                                          ),
                                                        ),
                              
                                                      ],
                                                    ): const SizedBox(),
                                                    index ==  2 ?
                                                    Row(
                                                      children: [
                                                        Container(
                                                          width: 30,
                                                          height: 10,
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(5),
                                                            color: const Color(0xffB0E4C8),
                                                          ),
                                                        ),
                                                        const SizedBox(width: 5,),
                                                        Container(
                                                          width: 30,
                                                          height: 10,
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(5),
                                                            color: const Color(0xffF8BEC1),
                                                          ),
                                                        ),
                                                        const SizedBox(width: 5,),
                                                        Container(
                                                          width: 30,
                                                          height: 10,
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(5),
                                                            color: const Color(0xffA9DDF5),
                                                          ),
                                                        ),
                                                      ],
                                                    ): const SizedBox(),
                                                    const SizedBox(height: 10,),
                                                    Row(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          model().Wor[index],
                                                          style:  TextStyle(
                                                              fontSize: 14,
                                                              fontFamily:
                                                              'InterRegular',
                                                              fontWeight:
                                                              FontWeight.w600,
                                                              color: notifire.getblackcolor),
                                                        ),
                                                        const Spacer(),
                                                        Image.asset(
                                                          'assets/more.png',
                                                          height: 16,
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    index == 0
                                                        ? const Text(
                                                        'Review vendor rules and regulations',
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            color:
                                                            Color(0xff9DA2A7),
                                                            fontFamily:
                                                            'InterRegular'))
                                                        : const SizedBox(),
                                                    index == 2
                                                        ? const Text(
                                                        'Review lead retrieval system',
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            color:
                                                            Color(0xff9DA2A7),
                                                            fontFamily:
                                                            'InterRegular'))
                                                        : const SizedBox(),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(model().ver1[index],style: const TextStyle(color: Color(0xff727880),fontFamily: 'InterRegular',fontSize: 12),),
                                                        const SizedBox(width: 10,),
                                                        index ==  0 ? const Expanded(
                                                          child: StepProgressIndicator(
                                                            totalSteps: 100,
                                                            currentStep: 32,
                                                            size: 5,
                                                            padding: 0,
                                                            selectedColor: Color(0xff7DC066),
                                                            unselectedColor: Color(0xffEEEEEE),
                                                            roundedEdges: Radius.circular(10),
                                                          ),
                                                        ): const SizedBox(),
                                                        index ==  1 ? const Expanded(
                                                          child: StepProgressIndicator(
                                                            totalSteps: 100,
                                                            currentStep: 80,
                                                            size: 5,
                                                            padding: 0,
                                                            selectedColor: Color(0xff7DC066),
                                                            unselectedColor: Color(0xffEEEEEE),
                                                            roundedEdges: Radius.circular(10),
                                                          ),
                                                        ): const SizedBox(),
                                                        index ==  2 ? const Expanded(
                                                          child: StepProgressIndicator(
                                                            totalSteps: 100,
                                                            currentStep: 60,
                                                            size: 5,
                                                            padding: 0,
                                                            selectedColor: Color(0xff7DC066),
                                                            unselectedColor: Color(0xffEEEEEE),
                                                            roundedEdges: Radius.circular(10),
                                                          ),
                                                        ): const SizedBox(),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Container(
                                                          padding: const EdgeInsets.all(5),
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(12),
                                                            color: const Color(0xffF5F5F5),
                                                          ),
                                                          child: Center(
                                                            child: Row(
                                                              children: [
                                                                Image.asset('assets/timer.png',height: 16,color: const Color(0xff727880)),
                                                                const SizedBox(width: 10,),
                                                                Text(model().ver2[index],style: const TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880))),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        const Spacer(),
                                                        index == 0
                                                            ? Transform.translate(
                                                          offset: const Offset(
                                                              -50, 0),
                                                          child: Stack(
                                                            clipBehavior:
                                                            Clip.none,
                                                            children: [
                                                              Transform
                                                                  .translate(
                                                                offset:
                                                                const Offset(
                                                                    -30, 0),
                                                                child:
                                                                Container(
                                                                  width: 32,
                                                                  height: 32,
                                                                  decoration:
                                                                  BoxDecoration(
                                                                    borderRadius:
                                                                    BorderRadius.circular(
                                                                        15),
                                                                  ),
                                                                  child: Center(
                                                                      child: Image
                                                                          .asset(
                                                                          'assets/avatar-6 1.png')),
                                                                ),
                                                              ),
                                                              Positioned(
                                                                  left: -10,
                                                                  child: Transform
                                                                      .translate(
                                                                    offset:
                                                                    const Offset(
                                                                        5,
                                                                        0),
                                                                    child:
                                                                    Container(
                                                                      width: 32,
                                                                      height:
                                                                      32,
                                                                      decoration:
                                                                      BoxDecoration(
                                                                        borderRadius:
                                                                        BorderRadius.circular(15),
                                                                      ),
                                                                      child: Center(
                                                                          child:
                                                                          Image.asset('assets/avatar-7 1.png')),
                                                                    ),
                                                                  )),
                                                              Positioned(
                                                                  left: 5,
                                                                  child: Transform
                                                                      .translate(
                                                                    offset:
                                                                    const Offset(
                                                                        15,
                                                                        0),
                                                                    child:
                                                                    Container(
                                                                      width: 32,
                                                                      height:
                                                                      32,
                                                                      decoration:
                                                                      BoxDecoration(
                                                                        borderRadius:
                                                                        BorderRadius.circular(15),
                                                                      ),
                                                                      child: Center(
                                                                          child:
                                                                          Image.asset('assets/avatar-8 1.png')),
                                                                    ),
                                                                  )),
                                                              Positioned(
                                                                  child: Transform
                                                                      .translate(
                                                                    offset:
                                                                    const Offset(
                                                                        45, 0),
                                                                    child:
                                                                    Container(
                                                                      width: 32,
                                                                      height: 32,
                                                                      decoration:
                                                                      BoxDecoration(
                                                                        borderRadius:
                                                                        BorderRadius.circular(
                                                                            15),
                                                                        color: const Color(
                                                                            0xffEEEEEE),
                                                                      ),
                                                                      child:
                                                                      const Center(
                                                                          child:
                                                                          Text(
                                                                            '+5',
                                                                            style: TextStyle(
                                                                                color: Color(
                                                                                    0xffE5646C),
                                                                                fontSize:
                                                                                14),
                                                                          )),
                                                                    ),
                                                                  )),
                                                            ],
                                                          ),
                                                        )
                                                            : const SizedBox(),
                                                        index == 1
                                                            ? Transform.translate(
                                                          offset: const Offset(
                                                              -50, 0),
                                                          child: Stack(
                                                            clipBehavior:
                                                            Clip.none,
                                                            children: [
                                                              Positioned(
                                                                  left: 5,
                                                                  child: Transform
                                                                      .translate(
                                                                    offset:
                                                                    const Offset(
                                                                        15,
                                                                        0),
                                                                    child:
                                                                    Container(
                                                                      width: 32,
                                                                      height:
                                                                      32,
                                                                      decoration:
                                                                      BoxDecoration(
                                                                        borderRadius:
                                                                        BorderRadius.circular(15),
                                                                      ),
                                                                      child: Center(
                                                                          child:
                                                                          Image.asset('assets/avatar-8 1.png')),
                                                                    ),
                                                                  )),
                                                              Positioned(
                                                                  child: Transform
                                                                      .translate(
                                                                    offset:
                                                                    const Offset(
                                                                        45, 0),
                                                                    child:
                                                                    Container(
                                                                      width: 32,
                                                                      height: 32,
                                                                      decoration:
                                                                      BoxDecoration(
                                                                        borderRadius:
                                                                        BorderRadius.circular(
                                                                            15),
                                                                        color: const Color(
                                                                            0xffEEEEEE),
                                                                      ),
                                                                      child:
                                                                      const Center(
                                                                          child:
                                                                          Text(
                                                                            '+16',
                                                                            style: TextStyle(
                                                                                color: Color(
                                                                                    0xffE5646C),
                                                                                fontSize:
                                                                                14),
                                                                          )),
                                                                    ),
                                                                  )),
                                                            ],
                                                          ),
                                                        )
                                                            : const SizedBox(),
                                                        index == 2
                                                            ? Transform.translate(
                                                          offset: const Offset(
                                                              -50, 0),
                                                          child: Stack(
                                                            clipBehavior:
                                                            Clip.none,
                                                            children: [
                                                              Positioned(
                                                                  left: -10,
                                                                  child: Transform
                                                                      .translate(
                                                                    offset:
                                                                    const Offset(
                                                                        5,
                                                                        0),
                                                                    child:
                                                                    Container(
                                                                      width: 32,
                                                                      height:
                                                                      32,
                                                                      decoration:
                                                                      BoxDecoration(
                                                                        borderRadius:
                                                                        BorderRadius.circular(15),
                                                                      ),
                                                                      child: Center(
                                                                          child:
                                                                          Image.asset('assets/avatar-7 1.png')),
                                                                    ),
                                                                  )),
                                                              Positioned(
                                                                  left: 5,
                                                                  child: Transform
                                                                      .translate(
                                                                    offset:
                                                                    const Offset(
                                                                        15,
                                                                        0),
                                                                    child:
                                                                    Container(
                                                                      width: 32,
                                                                      height:
                                                                      32,
                                                                      decoration:
                                                                      BoxDecoration(
                                                                        borderRadius:
                                                                        BorderRadius.circular(15),
                                                                      ),
                                                                      child: Center(
                                                                          child:
                                                                          Image.asset('assets/avatar-8 1.png')),
                                                                    ),
                                                                  )),
                                                              Positioned(
                                                                  child: Transform
                                                                      .translate(
                                                                    offset:
                                                                    const Offset(
                                                                        45, 0),
                                                                    child:
                                                                    Container(
                                                                      width: 32,
                                                                      height: 32,
                                                                      decoration:
                                                                      BoxDecoration(
                                                                        borderRadius:
                                                                        BorderRadius.circular(
                                                                            15),
                                                                        color: const Color(
                                                                            0xffEEEEEE),
                                                                      ),
                                                                      child:
                                                                      const Center(
                                                                          child:
                                                                          Text(
                                                                            '+12',
                                                                            style: TextStyle(
                                                                                color: Color(
                                                                                    0xffE5646C),
                                                                                fontSize:
                                                                                14),
                                                                          )),
                                                                    ),
                                                                  )),
                                                            ],
                                                          ),
                                                        )
                                                            : const SizedBox(),
                                                      ],
                                                    ),
                                                    const SizedBox(height: 10,),
                                                    const Divider(
                                                      color: Color(0xffEEEEEE),
                                                      height: 10,
                              
                                                    ),
                                                    const SizedBox(height: 10,),
                                                    Row(
                                                      children: [
                                                        SvgPicture.asset('assets/attach-circle.svg',height: 16,),
                                                        const SizedBox(width: 10,),
                                                        Text(model().War6[index],style: const TextStyle(color: Color(0xffC6C8CB),fontFamily: 'InterRegular',fontSize: 12),),
                                                        const SizedBox(width: 10,),
                                                        SvgPicture.asset('assets/comment-2.svg',height: 16,),
                                                        const SizedBox(width: 10,),
                                                        Text(model().War7[index],style: const TextStyle(color: Color(0xffC6C8CB),fontFamily: 'InterRegular',fontSize: 12),),
                                                        const SizedBox(width: 10,),
                                                        SvgPicture.asset('assets/link12.svg',height: 16,),
                                                        const SizedBox(width: 10,),
                                                        Text(model().ver3[index],style: const TextStyle(color: Color(0xffC6C8CB),fontFamily: 'InterRegular',fontSize: 12)),
                                                        const Spacer(),
                                                        Image.asset('assets/more.png',height: 16,),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                              
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    height: Get.height,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                             Text(
                                              'In Work',
                                              style: TextStyle(
                                                  color: notifire.getblackcolor,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                  fontFamily: 'InterRegular'),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Container(
                                                padding: const EdgeInsets.all(4),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(12),
                                                    border: Border.all(color: const Color(0xffEEEEEE))
                                                ),
                                                child: const Text(
                                                  '12',
                                                  style: TextStyle(
                                                      fontFamily: 'InterRegular',
                                                      fontSize: 12,
                                                      color: Color(0xff9DA2A7)),
                                                )),
                                            const Spacer(),
                                            Image.asset('assets/add.png',height: 16,color: const Color(0xff9DA2A7)),
                                            const SizedBox(width: 10,),
                                            Image.asset(
                                              'assets/more.png',
                                              height: 16,color: const Color(0xff9DA2A7),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Expanded(
                                          child: ListView.builder( physics: const NeverScrollableScrollPhysics(),
                                            scrollDirection: Axis.vertical,
                                            itemCount: model().Wor.length,
                                            itemBuilder: (context, index) {
                                              return Container(
                                                margin:
                                                const EdgeInsets.only(bottom: 20),
                                                padding: const EdgeInsets.all(14),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(12),
                                                  color: notifire.getbgcolor11,
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                                  children: [
                                                    index == 0 ?  Image.asset('assets/image40.png',):const SizedBox(),
                                                    index == 2 ?  Image.asset('assets/Media12.png',):const SizedBox(),
                                                    const SizedBox(height: 10,),
                                                    index ==  1 ?
                                                    Row(
                                                      children: [
                                                        Container(
                                                          width: 30,
                                                          height: 10,
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(5),
                                                            color: const Color(0xffB0E4C8),
                                                          ),
                                                        ),
                                                        const SizedBox(width: 5,),
                                                        Container(
                                                          width: 30,
                                                          height: 10,
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(5),
                                                            color: const Color(0xffF8BEC1),
                                                          ),
                                                        ),
                                                        const SizedBox(width: 5,),
                                                        Container(
                                                          width: 30,
                                                          height: 10,
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(5),
                                                            color: const Color(0xffA9DDF5),
                                                          ),
                                                        ),
                                                      ],
                                                    ): const SizedBox(),
                                                    index ==  0 ?
                                                    Row(
                                                      children: [
                                                        Container(
                                                          width: 30,
                                                          height: 10,
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(5),
                                                            color: const Color(0xffD9B7FB),
                                                          ),
                                                        ),
                                                        const SizedBox(width: 5,),
                                                        Container(
                                                          width: 30,
                                                          height: 10,
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(5),
                                                            color: const Color(0xffFFC9AC),
                                                          ),
                                                        ),
                              
                                                      ],
                                                    ): const SizedBox(),
                                                    index ==  2 ?
                                                    Row(
                                                      children: [
                                                        Container(
                                                          width: 30,
                                                          height: 10,
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(5),
                                                            color: const Color(0xffB0E4C8),
                                                          ),
                                                        ),
                                                        const SizedBox(width: 5,),
                                                        Container(
                                                          width: 30,
                                                          height: 10,
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(5),
                                                            color: const Color(0xffF8BEC1),
                                                          ),
                                                        ),
                                                        const SizedBox(width: 5,),
                                                        Container(
                                                          width: 30,
                                                          height: 10,
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(5),
                                                            color: const Color(0xffA9DDF5),
                                                          ),
                                                        ),
                                                      ],
                                                    ): const SizedBox(),
                                                    const SizedBox(height: 10,),
                                                    Row(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          model().Wor[index],
                                                          style:  TextStyle(
                                                              fontSize: 14,
                                                              fontFamily:
                                                              'InterRegular',
                                                              fontWeight:
                                                              FontWeight.w600,
                                                              color: notifire.getblackcolor),
                                                        ),
                                                        const Spacer(),
                                                        Image.asset(
                                                          'assets/more.png',
                                                          height: 16,
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    index == 0
                                                        ? const Text(
                                                        'Review vendor rules and regulations',
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            color:
                                                            Color(0xff9DA2A7),
                                                            fontFamily:
                                                            'InterRegular'))
                                                        : const SizedBox(),
                                                    index == 2
                                                        ? const Text(
                                                        'Review lead retrieval system',
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            color:
                                                            Color(0xff9DA2A7),
                                                            fontFamily:
                                                            'InterRegular'))
                                                        : const SizedBox(),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(model().ver1[index],style: const TextStyle(color: Color(0xff727880),fontFamily: 'InterRegular',fontSize: 12),),
                                                        const SizedBox(width: 10,),
                                                        index ==  0 ? const Expanded(
                                                          child: StepProgressIndicator(
                                                            totalSteps: 100,
                                                            currentStep: 32,
                                                            size: 5,
                                                            padding: 0,
                                                            selectedColor: Color(0xff7DC066),
                                                            unselectedColor: Color(0xffEEEEEE),
                                                            roundedEdges: Radius.circular(10),
                                                          ),
                                                        ): const SizedBox(),
                                                        index ==  1 ? const Expanded(
                                                          child: StepProgressIndicator(
                                                            totalSteps: 100,
                                                            currentStep: 80,
                                                            size: 5,
                                                            padding: 0,
                                                            selectedColor: Color(0xff7DC066),
                                                            unselectedColor: Color(0xffEEEEEE),
                                                            roundedEdges: Radius.circular(10),
                                                          ),
                                                        ): const SizedBox(),
                                                        index ==  2 ? const Expanded(
                                                          child: StepProgressIndicator(
                                                            totalSteps: 100,
                                                            currentStep: 60,
                                                            size: 5,
                                                            padding: 0,
                                                            selectedColor: Color(0xff7DC066),
                                                            unselectedColor: Color(0xffEEEEEE),
                                                            roundedEdges: Radius.circular(10),
                                                          ),
                                                        ): const SizedBox(),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Container(
                                                          padding: const EdgeInsets.all(5),
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(12),
                                                            color: const Color(0xffF5F5F5),
                                                          ),
                                                          child: Center(
                                                            child: Row(
                                                              children: [
                                                                Image.asset('assets/timer.png',height: 16,color: const Color(0xff727880)),
                                                                const SizedBox(width: 10,),
                                                                Text(model().ver2[index],style: const TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880))),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        const Spacer(),
                                                        index == 0
                                                            ? Transform.translate(
                                                          offset: const Offset(
                                                              -50, 0),
                                                          child: Stack(
                                                            clipBehavior:
                                                            Clip.none,
                                                            children: [
                                                              Transform
                                                                  .translate(
                                                                offset:
                                                                const Offset(
                                                                    -30, 0),
                                                                child:
                                                                Container(
                                                                  width: 32,
                                                                  height: 32,
                                                                  decoration:
                                                                  BoxDecoration(
                                                                    borderRadius:
                                                                    BorderRadius.circular(
                                                                        15),
                                                                  ),
                                                                  child: Center(
                                                                      child: Image
                                                                          .asset(
                                                                          'assets/avatar-6 1.png')),
                                                                ),
                                                              ),
                                                              Positioned(
                                                                  left: -10,
                                                                  child: Transform
                                                                      .translate(
                                                                    offset:
                                                                    const Offset(
                                                                        5,
                                                                        0),
                                                                    child:
                                                                    Container(
                                                                      width: 32,
                                                                      height:
                                                                      32,
                                                                      decoration:
                                                                      BoxDecoration(
                                                                        borderRadius:
                                                                        BorderRadius.circular(15),
                                                                      ),
                                                                      child: Center(
                                                                          child:
                                                                          Image.asset('assets/avatar-7 1.png')),
                                                                    ),
                                                                  )),
                                                              Positioned(
                                                                  left: 5,
                                                                  child: Transform
                                                                      .translate(
                                                                    offset:
                                                                    const Offset(
                                                                        15,
                                                                        0),
                                                                    child:
                                                                    Container(
                                                                      width: 32,
                                                                      height:
                                                                      32,
                                                                      decoration:
                                                                      BoxDecoration(
                                                                        borderRadius:
                                                                        BorderRadius.circular(15),
                                                                      ),
                                                                      child: Center(
                                                                          child:
                                                                          Image.asset('assets/avatar-8 1.png')),
                                                                    ),
                                                                  )),
                                                              Positioned(
                                                                  child: Transform
                                                                      .translate(
                                                                    offset:
                                                                    const Offset(
                                                                        45, 0),
                                                                    child:
                                                                    Container(
                                                                      width: 32,
                                                                      height: 32,
                                                                      decoration:
                                                                      BoxDecoration(
                                                                        borderRadius:
                                                                        BorderRadius.circular(
                                                                            15),
                                                                        color: const Color(
                                                                            0xffEEEEEE),
                                                                      ),
                                                                      child:
                                                                      const Center(
                                                                          child:
                                                                          Text(
                                                                            '+5',
                                                                            style: TextStyle(
                                                                                color: Color(
                                                                                    0xffE5646C),
                                                                                fontSize:
                                                                                14),
                                                                          )),
                                                                    ),
                                                                  )),
                                                            ],
                                                          ),
                                                        )
                                                            : const SizedBox(),
                                                        index == 1
                                                            ? Transform.translate(
                                                          offset: const Offset(
                                                              -50, 0),
                                                          child: Stack(
                                                            clipBehavior:
                                                            Clip.none,
                                                            children: [
                                                              Positioned(
                                                                  left: 5,
                                                                  child: Transform
                                                                      .translate(
                                                                    offset:
                                                                    const Offset(
                                                                        15,
                                                                        0),
                                                                    child:
                                                                    Container(
                                                                      width: 32,
                                                                      height:
                                                                      32,
                                                                      decoration:
                                                                      BoxDecoration(
                                                                        borderRadius:
                                                                        BorderRadius.circular(15),
                                                                      ),
                                                                      child: Center(
                                                                          child:
                                                                          Image.asset('assets/avatar-8 1.png')),
                                                                    ),
                                                                  )),
                                                              Positioned(
                                                                  child: Transform
                                                                      .translate(
                                                                    offset:
                                                                    const Offset(
                                                                        45, 0),
                                                                    child:
                                                                    Container(
                                                                      width: 32,
                                                                      height: 32,
                                                                      decoration:
                                                                      BoxDecoration(
                                                                        borderRadius:
                                                                        BorderRadius.circular(
                                                                            15),
                                                                        color: const Color(
                                                                            0xffEEEEEE),
                                                                      ),
                                                                      child:
                                                                      const Center(
                                                                          child:
                                                                          Text(
                                                                            '+16',
                                                                            style: TextStyle(
                                                                                color: Color(
                                                                                    0xffE5646C),
                                                                                fontSize:
                                                                                14),
                                                                          )),
                                                                    ),
                                                                  )),
                                                            ],
                                                          ),
                                                        )
                                                            : const SizedBox(),
                                                        index == 2
                                                            ? Transform.translate(
                                                          offset: const Offset(
                                                              -50, 0),
                                                          child: Stack(
                                                            clipBehavior:
                                                            Clip.none,
                                                            children: [
                                                              Positioned(
                                                                  left: -10,
                                                                  child: Transform
                                                                      .translate(
                                                                    offset:
                                                                    const Offset(
                                                                        5,
                                                                        0),
                                                                    child:
                                                                    Container(
                                                                      width: 32,
                                                                      height:
                                                                      32,
                                                                      decoration:
                                                                      BoxDecoration(
                                                                        borderRadius:
                                                                        BorderRadius.circular(15),
                                                                      ),
                                                                      child: Center(
                                                                          child:
                                                                          Image.asset('assets/avatar-7 1.png')),
                                                                    ),
                                                                  )),
                                                              Positioned(
                                                                  left: 5,
                                                                  child: Transform
                                                                      .translate(
                                                                    offset:
                                                                    const Offset(
                                                                        15,
                                                                        0),
                                                                    child:
                                                                    Container(
                                                                      width: 32,
                                                                      height:
                                                                      32,
                                                                      decoration:
                                                                      BoxDecoration(
                                                                        borderRadius:
                                                                        BorderRadius.circular(15),
                                                                      ),
                                                                      child: Center(
                                                                          child:
                                                                          Image.asset('assets/avatar-8 1.png')),
                                                                    ),
                                                                  )),
                                                              Positioned(
                                                                  child: Transform
                                                                      .translate(
                                                                    offset:
                                                                    const Offset(
                                                                        45, 0),
                                                                    child:
                                                                    Container(
                                                                      width: 32,
                                                                      height: 32,
                                                                      decoration:
                                                                      BoxDecoration(
                                                                        borderRadius:
                                                                        BorderRadius.circular(
                                                                            15),
                                                                        color: const Color(
                                                                            0xffEEEEEE),
                                                                      ),
                                                                      child:
                                                                      const Center(
                                                                          child:
                                                                          Text(
                                                                            '+12',
                                                                            style: TextStyle(
                                                                                color: Color(
                                                                                    0xffE5646C),
                                                                                fontSize:
                                                                                14),
                                                                          )),
                                                                    ),
                                                                  )),
                                                            ],
                                                          ),
                                                        )
                                                            : const SizedBox(),
                                                      ],
                                                    ),
                                                    const SizedBox(height: 10,),
                                                    const Divider(
                                                      color: Color(0xffEEEEEE),
                                                      height: 10,
                              
                                                    ),
                                                    const SizedBox(height: 10,),
                                                    Row(
                                                      children: [
                                                        SvgPicture.asset('assets/attach-circle.svg',height: 16,),
                                                        const SizedBox(width: 10,),
                                                        Text(model().War6[index],style: const TextStyle(color: Color(0xffC6C8CB),fontFamily: 'InterRegular',fontSize: 12),),
                                                        const SizedBox(width: 10,),
                                                        SvgPicture.asset('assets/comment-2.svg',height: 16,),
                                                        const SizedBox(width: 10,),
                                                        Text(model().War7[index],style: const TextStyle(color: Color(0xffC6C8CB),fontFamily: 'InterRegular',fontSize: 12),),
                                                        const SizedBox(width: 10,),
                                                        SvgPicture.asset('assets/link12.svg',height: 16,),
                                                        const SizedBox(width: 10,),
                                                        Text(model().ver3[index],style: const TextStyle(color: Color(0xffC6C8CB),fontFamily: 'InterRegular',fontSize: 12)),
                                                        const Spacer(),
                                                        Image.asset('assets/more.png',height: 16,),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                              
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    height: Get.height,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                             Text(
                                              'Q & A',
                                              style: TextStyle(
                                                  color: notifire.getblackcolor,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                  fontFamily: 'InterRegular'),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Container(
                                                padding: const EdgeInsets.all(4),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(12),
                                                    border: Border.all(color: const Color(0xffEEEEEE))
                                                ),
                                                child: const Text(
                                                  '12',
                                                  style: TextStyle(
                                                      fontFamily: 'InterRegular',
                                                      fontSize: 12,
                                                      color: Color(0xff9DA2A7)),
                                                )),
                                            const Spacer(),
                                            Image.asset('assets/add.png',height: 16,color: const Color(0xff9DA2A7)),
                                            const SizedBox(width: 10,),
                                            Image.asset(
                                              'assets/more.png',
                                              height: 16,color: const Color(0xff9DA2A7),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Expanded(
                                          child: ListView.builder( physics: const NeverScrollableScrollPhysics(),
                                            scrollDirection: Axis.vertical,
                                            itemCount: model().Wor.length,
                                            itemBuilder: (context, index) {
                                              return Container(
                                                margin:
                                                const EdgeInsets.only(bottom: 20),
                                                padding: const EdgeInsets.all(14),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(12),
                                                  color: notifire.getbgcolor11,
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                                  children: [
                                                    index == 0 ?  Image.asset('assets/Media12.png',):const SizedBox(),
                                                    index == 1 ?  Image.asset('assets/image40.png',):const SizedBox(),
                                                    const SizedBox(height: 10,),
                                                    index ==  2 ?
                                                    Row(
                                                      children: [
                                                        Container(
                                                          width: 30,
                                                          height: 10,
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(5),
                                                            color: const Color(0xffB0E4C8),
                                                          ),
                                                        ),
                                                        const SizedBox(width: 5,),
                                                        Container(
                                                          width: 30,
                                                          height: 10,
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(5),
                                                            color: const Color(0xffF8BEC1),
                                                          ),
                                                        ),
                                                        const SizedBox(width: 5,),
                                                        Container(
                                                          width: 30,
                                                          height: 10,
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(5),
                                                            color: const Color(0xffA9DDF5),
                                                          ),
                                                        ),
                                                      ],
                                                    ): const SizedBox(),
                                                    index ==  1 ?
                                                    Row(
                                                      children: [
                                                        Container(
                                                          width: 30,
                                                          height: 10,
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(5),
                                                            color: const Color(0xffD9B7FB),
                                                          ),
                                                        ),
                                                        const SizedBox(width: 5,),
                                                        Container(
                                                          width: 30,
                                                          height: 10,
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(5),
                                                            color: const Color(0xffFFC9AC),
                                                          ),
                                                        ),
                              
                                                      ],
                                                    ): const SizedBox(),
                                                    index ==  0 ?
                                                    Row(
                                                      children: [
                                                        Container(
                                                          width: 30,
                                                          height: 10,
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(5),
                                                            color: const Color(0xffB0E4C8),
                                                          ),
                                                        ),
                                                        const SizedBox(width: 5,),
                                                        Container(
                                                          width: 30,
                                                          height: 10,
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(5),
                                                            color: const Color(0xffF8BEC1),
                                                          ),
                                                        ),
                                                        const SizedBox(width: 5,),
                                                        Container(
                                                          width: 30,
                                                          height: 10,
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(5),
                                                            color: const Color(0xffA9DDF5),
                                                          ),
                                                        ),
                                                      ],
                                                    ): const SizedBox(),
                                                    const SizedBox(height: 10,),
                                                    Row(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          model().Wor[index],
                                                          style:  TextStyle(
                                                              fontSize: 14,
                                                              fontFamily:
                                                              'InterRegular',
                                                              fontWeight:
                                                              FontWeight.w600,
                                                              color: notifire.getblackcolor),
                                                        ),
                                                        const Spacer(),
                                                        Image.asset(
                                                          'assets/more.png',
                                                          height: 16,
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    index == 0
                                                        ? const Text(
                                                        'Review vendor rules and regulations',
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            color:
                                                            Color(0xff9DA2A7),
                                                            fontFamily:
                                                            'InterRegular'))
                                                        : const SizedBox(),
                                                    index == 2
                                                        ? const Text(
                                                        'Review lead retrieval system',
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            color:
                                                            Color(0xff9DA2A7),
                                                            fontFamily:
                                                            'InterRegular'))
                                                        : const SizedBox(),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(model().ver1[index],style: const TextStyle(color: Color(0xff727880),fontFamily: 'InterRegular',fontSize: 12),),
                                                        const SizedBox(width: 10,),
                                                        index ==  0 ? const Expanded(
                                                          child: StepProgressIndicator(
                                                            totalSteps: 100,
                                                            currentStep: 32,
                                                            size: 5,
                                                            padding: 0,
                                                            selectedColor: Color(0xff7DC066),
                                                            unselectedColor: Color(0xffEEEEEE),
                                                            roundedEdges: Radius.circular(10),
                                                          ),
                                                        ): const SizedBox(),
                                                        index ==  1 ? const Expanded(
                                                          child: StepProgressIndicator(
                                                            totalSteps: 100,
                                                            currentStep: 80,
                                                            size: 5,
                                                            padding: 0,
                                                            selectedColor: Color(0xff7DC066),
                                                            unselectedColor: Color(0xffEEEEEE),
                                                            roundedEdges: Radius.circular(10),
                                                          ),
                                                        ): const SizedBox(),
                                                        index ==  2 ? const Expanded(
                                                          child: StepProgressIndicator(
                                                            totalSteps: 100,
                                                            currentStep: 60,
                                                            size: 5,
                                                            padding: 0,
                                                            selectedColor: Color(0xff7DC066),
                                                            unselectedColor: Color(0xffEEEEEE),
                                                            roundedEdges: Radius.circular(10),
                                                          ),
                                                        ): const SizedBox(),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Container(
                                                          padding: const EdgeInsets.all(5),
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(12),
                                                            color: const Color(0xffF5F5F5),
                                                          ),
                                                          child: Center(
                                                            child: Row(
                                                              children: [
                                                                Image.asset('assets/timer.png',height: 16,color: const Color(0xff727880)),
                                                                const SizedBox(width: 10,),
                                                                Text(model().ver2[index],style: const TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880))),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        const Spacer(),
                                                        index == 0
                                                            ? Transform.translate(
                                                          offset: const Offset(
                                                              -50, 0),
                                                          child: Stack(
                                                            clipBehavior:
                                                            Clip.none,
                                                            children: [
                                                              Transform
                                                                  .translate(
                                                                offset:
                                                                const Offset(
                                                                    -30, 0),
                                                                child:
                                                                Container(
                                                                  width: 32,
                                                                  height: 32,
                                                                  decoration:
                                                                  BoxDecoration(
                                                                    borderRadius:
                                                                    BorderRadius.circular(
                                                                        15),
                                                                  ),
                                                                  child: Center(
                                                                      child: Image
                                                                          .asset(
                                                                          'assets/avatar-6 1.png')),
                                                                ),
                                                              ),
                                                              Positioned(
                                                                  left: -10,
                                                                  child: Transform
                                                                      .translate(
                                                                    offset:
                                                                    const Offset(
                                                                        5,
                                                                        0),
                                                                    child:
                                                                    Container(
                                                                      width: 32,
                                                                      height:
                                                                      32,
                                                                      decoration:
                                                                      BoxDecoration(
                                                                        borderRadius:
                                                                        BorderRadius.circular(15),
                                                                      ),
                                                                      child: Center(
                                                                          child:
                                                                          Image.asset('assets/avatar-7 1.png')),
                                                                    ),
                                                                  )),
                                                              Positioned(
                                                                  left: 5,
                                                                  child: Transform
                                                                      .translate(
                                                                    offset:
                                                                    const Offset(
                                                                        15,
                                                                        0),
                                                                    child:
                                                                    Container(
                                                                      width: 32,
                                                                      height:
                                                                      32,
                                                                      decoration:
                                                                      BoxDecoration(
                                                                        borderRadius:
                                                                        BorderRadius.circular(15),
                                                                      ),
                                                                      child: Center(
                                                                          child:
                                                                          Image.asset('assets/avatar-8 1.png')),
                                                                    ),
                                                                  )),
                                                              Positioned(
                                                                  child: Transform
                                                                      .translate(
                                                                    offset:
                                                                    const Offset(
                                                                        45, 0),
                                                                    child:
                                                                    Container(
                                                                      width: 32,
                                                                      height: 32,
                                                                      decoration:
                                                                      BoxDecoration(
                                                                        borderRadius:
                                                                        BorderRadius.circular(
                                                                            15),
                                                                        color: const Color(
                                                                            0xffEEEEEE),
                                                                      ),
                                                                      child:
                                                                      const Center(
                                                                          child:
                                                                          Text(
                                                                            '+5',
                                                                            style: TextStyle(
                                                                                color: Color(
                                                                                    0xffE5646C),
                                                                                fontSize:
                                                                                14),
                                                                          )),
                                                                    ),
                                                                  )),
                                                            ],
                                                          ),
                                                        )
                                                            : const SizedBox(),
                                                        index == 1
                                                            ? Transform.translate(
                                                          offset: const Offset(
                                                              -50, 0),
                                                          child: Stack(
                                                            clipBehavior:
                                                            Clip.none,
                                                            children: [
                                                              Positioned(
                                                                  left: 5,
                                                                  child: Transform
                                                                      .translate(
                                                                    offset:
                                                                    const Offset(
                                                                        15,
                                                                        0),
                                                                    child:
                                                                    Container(
                                                                      width: 32,
                                                                      height:
                                                                      32,
                                                                      decoration:
                                                                      BoxDecoration(
                                                                        borderRadius:
                                                                        BorderRadius.circular(15),
                                                                      ),
                                                                      child: Center(
                                                                          child:
                                                                          Image.asset('assets/avatar-8 1.png')),
                                                                    ),
                                                                  )),
                                                              Positioned(
                                                                  child: Transform
                                                                      .translate(
                                                                    offset:
                                                                    const Offset(
                                                                        45, 0),
                                                                    child:
                                                                    Container(
                                                                      width: 32,
                                                                      height: 32,
                                                                      decoration:
                                                                      BoxDecoration(
                                                                        borderRadius:
                                                                        BorderRadius.circular(
                                                                            15),
                                                                        color: const Color(
                                                                            0xffEEEEEE),
                                                                      ),
                                                                      child:
                                                                      const Center(
                                                                          child:
                                                                          Text(
                                                                            '+16',
                                                                            style: TextStyle(
                                                                                color: Color(
                                                                                    0xffE5646C),
                                                                                fontSize:
                                                                                14),
                                                                          )),
                                                                    ),
                                                                  )),
                                                            ],
                                                          ),
                                                        )
                                                            : const SizedBox(),
                                                        index == 2
                                                            ? Transform.translate(
                                                          offset: const Offset(
                                                              -50, 0),
                                                          child: Stack(
                                                            clipBehavior:
                                                            Clip.none,
                                                            children: [
                                                              Positioned(
                                                                  left: -10,
                                                                  child: Transform
                                                                      .translate(
                                                                    offset:
                                                                    const Offset(
                                                                        5,
                                                                        0),
                                                                    child:
                                                                    Container(
                                                                      width: 32,
                                                                      height:
                                                                      32,
                                                                      decoration:
                                                                      BoxDecoration(
                                                                        borderRadius:
                                                                        BorderRadius.circular(15),
                                                                      ),
                                                                      child: Center(
                                                                          child:
                                                                          Image.asset('assets/avatar-7 1.png')),
                                                                    ),
                                                                  )),
                                                              Positioned(
                                                                  left: 5,
                                                                  child: Transform
                                                                      .translate(
                                                                    offset:
                                                                    const Offset(
                                                                        15,
                                                                        0),
                                                                    child:
                                                                    Container(
                                                                      width: 32,
                                                                      height:
                                                                      32,
                                                                      decoration:
                                                                      BoxDecoration(
                                                                        borderRadius:
                                                                        BorderRadius.circular(15),
                                                                      ),
                                                                      child: Center(
                                                                          child:
                                                                          Image.asset('assets/avatar-8 1.png')),
                                                                    ),
                                                                  )),
                                                              Positioned(
                                                                  child: Transform
                                                                      .translate(
                                                                    offset:
                                                                    const Offset(
                                                                        45, 0),
                                                                    child:
                                                                    Container(
                                                                      width: 32,
                                                                      height: 32,
                                                                      decoration:
                                                                      BoxDecoration(
                                                                        borderRadius:
                                                                        BorderRadius.circular(
                                                                            15),
                                                                        color: const Color(
                                                                            0xffEEEEEE),
                                                                      ),
                                                                      child:
                                                                      const Center(
                                                                          child:
                                                                          Text(
                                                                            '+12',
                                                                            style: TextStyle(
                                                                                color: Color(
                                                                                    0xffE5646C),
                                                                                fontSize:
                                                                                14),
                                                                          )),
                                                                    ),
                                                                  )),
                                                            ],
                                                          ),
                                                        )
                                                            : const SizedBox(),
                                                      ],
                                                    ),
                                                    const SizedBox(height: 10,),
                                                    const Divider(
                                                      color: Color(0xffEEEEEE),
                                                      height: 10,
                              
                                                    ),
                                                    const SizedBox(height: 10,),
                                                    Row(
                                                      children: [
                                                        SvgPicture.asset('assets/attach-circle.svg',height: 16,),
                                                        const SizedBox(width: 10,),
                                                        Text(model().War6[index],style: const TextStyle(color: Color(0xffC6C8CB),fontFamily: 'InterRegular',fontSize: 12),),
                                                        const SizedBox(width: 10,),
                                                        SvgPicture.asset('assets/comment-2.svg',height: 16,),
                                                        const SizedBox(width: 10,),
                                                        Text(model().War7[index],style: const TextStyle(color: Color(0xffC6C8CB),fontFamily: 'InterRegular',fontSize: 12),),
                                                        const SizedBox(width: 10,),
                                                        SvgPicture.asset('assets/link12.svg',height: 16,),
                                                        const SizedBox(width: 10,),
                                                        Text(model().ver3[index],style: const TextStyle(color: Color(0xffC6C8CB),fontFamily: 'InterRegular',fontSize: 12)),
                                                        const Spacer(),
                                                        Image.asset('assets/more.png',height: 16,),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                              
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    height: Get.height,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                             Text(
                                              'Archive',
                                              style: TextStyle(
                                                  color: notifire.getblackcolor,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                  fontFamily: 'InterRegular'),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Container(
                                                padding: const EdgeInsets.all(4),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(12),
                                                    border: Border.all(color: const Color(0xffEEEEEE))
                                                ),
                                                child: const Text(
                                                  '6',
                                                  style: TextStyle(
                                                      fontFamily: 'InterRegular',
                                                      fontSize: 12,
                                                      color: Color(0xff9DA2A7)),
                                                )),
                                            const Spacer(),
                                            Image.asset('assets/add.png',height: 16,color: const Color(0xff9DA2A7)),
                                            const SizedBox(width: 10,),
                                            Image.asset(
                                              'assets/more.png',
                                              height: 16,color: const Color(0xff9DA2A7),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Expanded(
                                          child: ListView.builder( physics: const NeverScrollableScrollPhysics(),
                                            scrollDirection: Axis.vertical,
                                            itemCount: model().Wor.length,
                                            itemBuilder: (context, index) {
                                              return Container(
                                                margin:
                                                const EdgeInsets.only(bottom: 20),
                                                padding: const EdgeInsets.all(14),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(12),
                                                  color: notifire.getbgcolor11,
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                                  children: [
                                                    index == 1 ?  Image.asset('assets/image40.png',):const SizedBox(),
                                                    index == 0 ?  Image.asset('assets/Media12.png',):const SizedBox(),
                                                    index == 2 ?  Image.asset('assets/Media12.png',):const SizedBox(),
                              
                                                    const SizedBox(height: 10,),
                                                    index ==  2 ?
                                                    Row(
                                                      children: [
                                                        Container(
                                                          width: 30,
                                                          height: 10,
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(5),
                                                            color: const Color(0xffB0E4C8),
                                                          ),
                                                        ),
                                                      ],
                                                    ): const SizedBox(),
                                                    index ==  1 ?
                                                    Row(
                                                      children: [
                                                        Container(
                                                          width: 30,
                                                          height: 10,
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(5),
                                                            color: const Color(0xffD9B7FB),
                                                          ),
                                                        ),
                                                        const SizedBox(width: 5,),
                                                        Container(
                                                          width: 30,
                                                          height: 10,
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(5),
                                                            color: const Color(0xffFFC9AC),
                                                          ),
                                                        ),
                              
                                                      ],
                                                    ): const SizedBox(),
                                                    index ==  0 ?
                                                    Row(
                                                      children: [
                                                        Container(
                                                          width: 30,
                                                          height: 10,
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(5),
                                                            color: const Color(0xffB0E4C8),
                                                          ),
                                                        ),
                                                        const SizedBox(width: 5,),
                                                        Container(
                                                          width: 30,
                                                          height: 10,
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(5),
                                                            color: const Color(0xffF8BEC1),
                                                          ),
                                                        ),
                              
                                                      ],
                                                    ): const SizedBox(),
                                                    const SizedBox(height: 10,),
                                                    Row(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          model().Wor[index],
                                                          style:  TextStyle(
                                                              fontSize: 14,
                                                              fontFamily:
                                                              'InterRegular',
                                                              fontWeight:
                                                              FontWeight.w600,
                                                              color: notifire.getblackcolor),
                                                        ),
                                                        const Spacer(),
                                                        Image.asset(
                                                          'assets/more.png',
                                                          height: 16,
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    index == 0
                                                        ? const Text(
                                                        'Review vendor rules and regulations',
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            color:
                                                            Color(0xff9DA2A7),
                                                            fontFamily:
                                                            'InterRegular'))
                                                        : const SizedBox(),
                                                    index == 2
                                                        ? const Text(
                                                        'Review lead retrieval system',
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            color:
                                                            Color(0xff9DA2A7),
                                                            fontFamily:
                                                            'InterRegular'))
                                                        : const SizedBox(),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(model().ver1[index],style: const TextStyle(color: Color(0xff727880),fontFamily: 'InterRegular',fontSize: 12),),
                                                        const SizedBox(width: 10,),
                                                        index ==  0 ? const Expanded(
                                                          child: StepProgressIndicator(
                                                            totalSteps: 100,
                                                            currentStep: 32,
                                                            size: 5,
                                                            padding: 0,
                                                            selectedColor: Color(0xff7DC066),
                                                            unselectedColor: Color(0xffEEEEEE),
                                                            roundedEdges: Radius.circular(10),
                                                          ),
                                                        ): const SizedBox(),
                                                        index ==  1 ? const Expanded(
                                                          child: StepProgressIndicator(
                                                            totalSteps: 100,
                                                            currentStep: 80,
                                                            size: 5,
                                                            padding: 0,
                                                            selectedColor: Color(0xff7DC066),
                                                            unselectedColor: Color(0xffEEEEEE),
                                                            roundedEdges: Radius.circular(10),
                                                          ),
                                                        ): const SizedBox(),
                                                        index ==  2 ? const Expanded(
                                                          child: StepProgressIndicator(
                                                            totalSteps: 100,
                                                            currentStep: 60,
                                                            size: 5,
                                                            padding: 0,
                                                            selectedColor: Color(0xff7DC066),
                                                            unselectedColor: Color(0xffEEEEEE),
                                                            roundedEdges: Radius.circular(10),
                                                          ),
                                                        ): const SizedBox(),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Container(
                                                          padding: const EdgeInsets.all(5),
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(12),
                                                            color: const Color(0xffF5F5F5),
                                                          ),
                                                          child: Center(
                                                            child: Row(
                                                              children: [
                                                                Image.asset('assets/timer.png',height: 16,color: const Color(0xff727880)),
                                                                const SizedBox(width: 10,),
                                                                Text(model().ver2[index],style: const TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880))),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        const Spacer(),
                                                        index == 0
                                                            ? Transform.translate(
                                                          offset: const Offset(
                                                              -50, 0),
                                                          child: Stack(
                                                            clipBehavior:
                                                            Clip.none,
                                                            children: [
                                                              Transform
                                                                  .translate(
                                                                offset:
                                                                const Offset(
                                                                    -30, 0),
                                                                child:
                                                                Container(
                                                                  width: 32,
                                                                  height: 32,
                                                                  decoration:
                                                                  BoxDecoration(
                                                                    borderRadius:
                                                                    BorderRadius.circular(
                                                                        15),
                                                                  ),
                                                                  child: Center(
                                                                      child: Image
                                                                          .asset(
                                                                          'assets/avatar-6 1.png')),
                                                                ),
                                                              ),
                                                              Positioned(
                                                                  left: -10,
                                                                  child: Transform
                                                                      .translate(
                                                                    offset:
                                                                    const Offset(
                                                                        5,
                                                                        0),
                                                                    child:
                                                                    Container(
                                                                      width: 32,
                                                                      height:
                                                                      32,
                                                                      decoration:
                                                                      BoxDecoration(
                                                                        borderRadius:
                                                                        BorderRadius.circular(15),
                                                                      ),
                                                                      child: Center(
                                                                          child:
                                                                          Image.asset('assets/avatar-7 1.png')),
                                                                    ),
                                                                  )),
                                                              Positioned(
                                                                  left: 5,
                                                                  child: Transform
                                                                      .translate(
                                                                    offset:
                                                                    const Offset(
                                                                        15,
                                                                        0),
                                                                    child:
                                                                    Container(
                                                                      width: 32,
                                                                      height:
                                                                      32,
                                                                      decoration:
                                                                      BoxDecoration(
                                                                        borderRadius:
                                                                        BorderRadius.circular(15),
                                                                      ),
                                                                      child: Center(
                                                                          child:
                                                                          Image.asset('assets/avatar-8 1.png')),
                                                                    ),
                                                                  )),
                                                              Positioned(
                                                                  child: Transform
                                                                      .translate(
                                                                    offset:
                                                                    const Offset(
                                                                        45, 0),
                                                                    child:
                                                                    Container(
                                                                      width: 32,
                                                                      height: 32,
                                                                      decoration:
                                                                      BoxDecoration(
                                                                        borderRadius:
                                                                        BorderRadius.circular(
                                                                            15),
                                                                        color: const Color(
                                                                            0xffEEEEEE),
                                                                      ),
                                                                      child:
                                                                      const Center(
                                                                          child:
                                                                          Text(
                                                                            '+5',
                                                                            style: TextStyle(
                                                                                color: Color(
                                                                                    0xffE5646C),
                                                                                fontSize:
                                                                                14),
                                                                          )),
                                                                    ),
                                                                  )),
                                                            ],
                                                          ),
                                                        )
                                                            : const SizedBox(),
                                                        index == 1
                                                            ? Transform.translate(
                                                          offset: const Offset(
                                                              -50, 0),
                                                          child: Stack(
                                                            clipBehavior:
                                                            Clip.none,
                                                            children: [
                                                              Positioned(
                                                                  left: 5,
                                                                  child: Transform
                                                                      .translate(
                                                                    offset:
                                                                    const Offset(
                                                                        15,
                                                                        0),
                                                                    child:
                                                                    Container(
                                                                      width: 32,
                                                                      height:
                                                                      32,
                                                                      decoration:
                                                                      BoxDecoration(
                                                                        borderRadius:
                                                                        BorderRadius.circular(15),
                                                                      ),
                                                                      child: Center(
                                                                          child:
                                                                          Image.asset('assets/avatar-8 1.png')),
                                                                    ),
                                                                  )),
                                                              Positioned(
                                                                  child: Transform
                                                                      .translate(
                                                                    offset:
                                                                    const Offset(
                                                                        45, 0),
                                                                    child:
                                                                    Container(
                                                                      width: 32,
                                                                      height: 32,
                                                                      decoration:
                                                                      BoxDecoration(
                                                                        borderRadius:
                                                                        BorderRadius.circular(
                                                                            15),
                                                                        color: const Color(
                                                                            0xffEEEEEE),
                                                                      ),
                                                                      child:
                                                                      const Center(
                                                                          child:
                                                                          Text(
                                                                            '+16',
                                                                            style: TextStyle(
                                                                                color: Color(
                                                                                    0xffE5646C),
                                                                                fontSize:
                                                                                14),
                                                                          )),
                                                                    ),
                                                                  )),
                                                            ],
                                                          ),
                                                        )
                                                            : const SizedBox(),
                                                        index == 2
                                                            ? Transform.translate(
                                                          offset: const Offset(
                                                              -50, 0),
                                                          child: Stack(
                                                            clipBehavior:
                                                            Clip.none,
                                                            children: [
                                                              Positioned(
                                                                  left: -10,
                                                                  child: Transform
                                                                      .translate(
                                                                    offset:
                                                                    const Offset(
                                                                        5,
                                                                        0),
                                                                    child:
                                                                    Container(
                                                                      width: 32,
                                                                      height:
                                                                      32,
                                                                      decoration:
                                                                      BoxDecoration(
                                                                        borderRadius:
                                                                        BorderRadius.circular(15),
                                                                      ),
                                                                      child: Center(
                                                                          child:
                                                                          Image.asset('assets/avatar-7 1.png')),
                                                                    ),
                                                                  )),
                                                              Positioned(
                                                                  left: 5,
                                                                  child: Transform
                                                                      .translate(
                                                                    offset:
                                                                    const Offset(
                                                                        15,
                                                                        0),
                                                                    child:
                                                                    Container(
                                                                      width: 32,
                                                                      height:
                                                                      32,
                                                                      decoration:
                                                                      BoxDecoration(
                                                                        borderRadius:
                                                                        BorderRadius.circular(15),
                                                                      ),
                                                                      child: Center(
                                                                          child:
                                                                          Image.asset('assets/avatar-8 1.png')),
                                                                    ),
                                                                  )),
                                                              Positioned(
                                                                  child: Transform
                                                                      .translate(
                                                                    offset:
                                                                    const Offset(
                                                                        45, 0),
                                                                    child:
                                                                    Container(
                                                                      width: 32,
                                                                      height: 32,
                                                                      decoration:
                                                                      BoxDecoration(
                                                                        borderRadius:
                                                                        BorderRadius.circular(
                                                                            15),
                                                                        color: const Color(
                                                                            0xffEEEEEE),
                                                                      ),
                                                                      child:
                                                                      const Center(
                                                                          child:
                                                                          Text(
                                                                            '+12',
                                                                            style: TextStyle(
                                                                                color: Color(
                                                                                    0xffE5646C),
                                                                                fontSize:
                                                                                14),
                                                                          )),
                                                                    ),
                                                                  )),
                                                            ],
                                                          ),
                                                        )
                                                            : const SizedBox(),
                                                      ],
                                                    ),
                                                    const SizedBox(height: 10,),
                                                    const Divider(
                                                      color: Color(0xffEEEEEE),
                                                      height: 10,
                              
                                                    ),
                                                    const SizedBox(height: 10,),
                                                    Row(
                                                      children: [
                                                        SvgPicture.asset('assets/attach-circle.svg',height: 16,),
                                                        const SizedBox(width: 10,),
                                                        Text(model().War6[index],style: const TextStyle(color: Color(0xffC6C8CB),fontFamily: 'InterRegular',fontSize: 12),),
                                                        const SizedBox(width: 10,),
                                                        SvgPicture.asset('assets/comment-2.svg',height: 16,),
                                                        const SizedBox(width: 10,),
                                                        Text(model().War7[index],style: const TextStyle(color: Color(0xffC6C8CB),fontFamily: 'InterRegular',fontSize: 12),),
                                                        const SizedBox(width: 10,),
                                                        SvgPicture.asset('assets/link12.svg',height: 16,),
                                                        const SizedBox(width: 10,),
                                                        Text(model().ver3[index],style: const TextStyle(color: Color(0xffC6C8CB),fontFamily: 'InterRegular',fontSize: 12)),
                                                        const Spacer(),
                                                        Image.asset('assets/more.png',height: 16,),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                              
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                     Text(
                                      'Backlogs',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'InterRegular',
                                        fontSize: 16,color: notifire.getblackcolor
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                        padding: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12),
                                          color: notifire.getbgcolor11,
                                        ),
                                        child: const Text(
                                          '4',
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              fontSize: 12,
                                              color: Color(0xff727880)),
                                        )),
                                  ],
                                ),
                                const SizedBox(height: 10,),
                                Container(
                                  padding: const EdgeInsets.all(15),
                                  width: Get.width,
                                  decoration: BoxDecoration(

                                      color:notifire.getbgcolor11,
                                      // color: Colors.red,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          // width: constraints < 1400 ? 1500 : Get.width,
                                          child: Table(
                                            border: TableBorder.all(color: Colors.transparent),
                                            columnWidths: const <int, TableColumnWidth>{
                                              0: FixedColumnWidth(130),
                                              1: FixedColumnWidth(300),
                                              2: FixedColumnWidth(250),
                                              3: FixedColumnWidth(300),
                                              4: FixedColumnWidth(150),
                                              5: FixedColumnWidth(150),
                                              6: FixedColumnWidth(50),
                                            },
                                            children: <TableRow>[
                                              TableRow(
                                                children: <Widget>[
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 18, left: 3),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          padding: const EdgeInsets.all(5),
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(12),
                                                            color: const Color(0xffF5F5F5),
                                                          ),
                                                          child: Center(
                                                            child: Row(
                                                              children: [
                                                                Image.asset('assets/timer.png',height: 16,color: const Color(0xff727880)),
                                                                const SizedBox(width: 10,),
                                                                const Text('May 17',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880))),
                                                              ],
                                                            ),
                                                          ),
                                                        ),

                                                      ],
                                                    ),
                                                  ),
                                                   Padding(
                                                    padding: const EdgeInsets.only(top: 22, left: 8),
                                                    child: Text(
                                                      'Various versions have evolved over',
                                                      style: TextStyle(
                                                          fontFamily: 'InterRegular',
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: 14,
                                                          color: notifire.getblackcolor),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 18, left: 3),
                                                    child: Row(
                                                      children: [
                                                        Container(

                                                          padding:
                                                          const EdgeInsets.all(6),
                                                          decoration: BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius.circular(
                                                                16),
                                                            color:const Color(0xffB0E4C8),
                                                          ),
                                                          child: const Row(
                                                            children: [
                                                              Center(
                                                                  child: Text('UI',
                                                                      style: TextStyle(

                                                                        fontFamily:
                                                                        'InterRegular',
                                                                        fontSize: 12,
                                                                      ))),
                                                            ],
                                                          ),
                                                        ),
                                                        const SizedBox(width: 10,),
                                                        Container(padding:
                                                        const EdgeInsets.all(6),
                                                          decoration: BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius.circular(
                                                                16),
                                                            color:const Color(0xffA9DDF5),
                                                          ),
                                                          child: const Row(
                                                            children: [
                                                              Center(
                                                                  child: Text('IOS',
                                                                      style: TextStyle(

                                                                        fontFamily:
                                                                        'InterRegular',
                                                                        fontSize: 12,
                                                                      ))),
                                                            ],
                                                          ),
                                                        ),
                                                        const SizedBox(width: 10,),
                                                        Container(padding:
                                                        const EdgeInsets.all(6),
                                                          decoration: BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius.circular(
                                                                16),
                                                            color:const Color(0xffF8BEC1),
                                                          ),
                                                          child: const Row(
                                                            children: [
                                                              Center(
                                                                  child: Text('Research',
                                                                      style: TextStyle(

                                                                        fontFamily:
                                                                        'InterRegular',
                                                                        fontSize: 12,
                                                                      ))),
                                                            ],
                                                          ),
                                                        ),

                                                      ],
                                                    ),
                                                  ),
                                                  const Padding(
                                                    padding: EdgeInsets.only(top: 25, left: 8),
                                                    child:  Row(
                                                      children: [
                                                        Text('5/34',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880),),),
                                                        SizedBox(width: 10,),
                                                        SizedBox(
                                                          width: 150,
                                                          child: StepProgressIndicator(
                                                            totalSteps: 100,
                                                            currentStep: 60,
                                                            size: 5,
                                                            padding: 0,
                                                            selectedColor: Color(0xff7DC066),
                                                            unselectedColor: Color(0xffEEEEEE),
                                                            roundedEdges: Radius.circular(10),
                                                          ),
                                                        ),

                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 5, top: 18),
                                                    child: Transform.translate(
                                                      offset: const Offset(
                                                          -50, 0),
                                                      child: Stack(
                                                        clipBehavior:
                                                        Clip.none,
                                                        children: [
                                                          Positioned(
                                                              left: 5,
                                                              child: Transform
                                                                  .translate(
                                                                offset:
                                                                const Offset(
                                                                    15,
                                                                    0),
                                                                child:
                                                                Container(
                                                                  width: 32,
                                                                  height:
                                                                  32,
                                                                  decoration:
                                                                  BoxDecoration(
                                                                    borderRadius:
                                                                    BorderRadius.circular(15),
                                                                  ),
                                                                  child: Center(
                                                                      child:
                                                                      Image.asset('assets/avatar-8 1.png')),
                                                                ),
                                                              )),
                                                          Positioned(
                                                              child: Transform
                                                                  .translate(
                                                                offset:
                                                                const Offset(
                                                                    45, 0),
                                                                child:
                                                                Container(
                                                                  width: 32,
                                                                  height: 32,
                                                                  decoration:
                                                                  BoxDecoration(
                                                                    borderRadius:
                                                                    BorderRadius.circular(
                                                                        15),
                                                                    color: const Color(
                                                                        0xffEEEEEE),
                                                                  ),
                                                                  child:
                                                                  const Center(
                                                                      child:
                                                                      Text(
                                                                        '+16',
                                                                        style: TextStyle(
                                                                            color: Color(
                                                                                0xffE5646C),
                                                                            fontSize:
                                                                            14),
                                                                      )),
                                                                ),
                                                              )),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 25, left: 8),
                                                    child:  Row(
                                                      children: [
                                                        Image.asset('assets/profile-add.png',height: 16,color: const Color(0xff9DA2A7),)
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 25, left: 8),
                                                    child: Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),),
                                                  ),

                                                ],
                                              ),
                                              TableRow(
                                                children: <Widget>[
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 18, left: 3),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          padding: const EdgeInsets.all(5),
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(12),
                                                            color: const Color(0xffF5F5F5),
                                                          ),
                                                          child: Center(
                                                            child: Row(
                                                              children: [
                                                                Image.asset('assets/timer.png',height: 16,color: const Color(0xff727880)),
                                                                const SizedBox(width: 10,),
                                                                const Text('May 20',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880))),
                                                              ],
                                                            ),
                                                          ),
                                                        ),

                                                      ],
                                                    ),
                                                  ),
                                                   Padding(
                                                    padding: const EdgeInsets.only(top: 22, left: 8),
                                                    child: Text(
                                                      'versions have evolved over Various',
                                                      style: TextStyle(
                                                          fontFamily: 'InterRegular',
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: 14,
                                                          color: notifire.getblackcolor),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 18, left: 3),
                                                    child: Row(
                                                      children: [
                                                        Container(

                                                          padding:
                                                          const EdgeInsets.all(6),
                                                          decoration: BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius.circular(
                                                                16),
                                                            color:const Color(0xffD9B7FB),
                                                          ),
                                                          child: const Row(
                                                            children: [
                                                              Center(
                                                                  child: Text('Web',
                                                                      style: TextStyle(

                                                                        fontFamily:
                                                                        'InterRegular',
                                                                        fontSize: 12,
                                                                      ))),
                                                            ],
                                                          ),
                                                        ),
                                                        const SizedBox(width: 10,),
                                                        Container(padding:
                                                        const EdgeInsets.all(6),
                                                          decoration: BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius.circular(
                                                                16),
                                                            color:const Color(0xffFFC9AC),
                                                          ),
                                                          child: const Row(
                                                            children: [
                                                              Center(
                                                                  child: Text('Android',
                                                                      style: TextStyle(

                                                                        fontFamily:
                                                                        'InterRegular',
                                                                        fontSize: 12,
                                                                      ))),
                                                            ],
                                                          ),
                                                        ),

                                                      ],
                                                    ),
                                                  ),
                                                  const Padding(
                                                    padding: EdgeInsets.only(top: 25, left: 8),
                                                    child:  Row(
                                                      children: [
                                                        Text('2/24',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880),),),
                                                        SizedBox(width: 10,),
                                                        SizedBox(
                                                          width: 150,
                                                          child: StepProgressIndicator(
                                                            totalSteps: 100,
                                                            currentStep: 80,
                                                            size: 5,
                                                            padding: 0,
                                                            selectedColor: Color(0xff7DC066),
                                                            unselectedColor: Color(0xffEEEEEE),
                                                            roundedEdges: Radius.circular(10),
                                                          ),
                                                        ),

                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 5, top: 18),
                                                    child: Transform.translate(
                                                      offset: const Offset(0, 0),
                                                      child: Stack(
                                                        clipBehavior: Clip.none,
                                                        children: [
                                                          Transform.translate(
                                                            offset: const Offset(-30, 0),
                                                            child: Container(
                                                              width: 32,
                                                              height: 32,
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(15),
                                                              ),
                                                              child:
                                                              Center(child: Image.asset('assets/avatar-6 1.png')),
                                                            ),
                                                          ),
                                                          Positioned(
                                                              left: -10,
                                                              child: Transform.translate(
                                                                offset: const Offset(5, 0),
                                                                child: Container(
                                                                  width: 32,
                                                                  height: 32,
                                                                  decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(15),
                                                                  ),
                                                                  child: Center(
                                                                      child: Image.asset('assets/avatar-7 1.png')),
                                                                ),
                                                              )),
                                                          Positioned(
                                                              left: 5,
                                                              child: Transform.translate(
                                                                offset: const Offset(15, 0),
                                                                child: Container(
                                                                  width: 32,
                                                                  height: 32,
                                                                  decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(15),
                                                                  ),
                                                                  child: Center(
                                                                      child: Image.asset('assets/avatar-8 1.png')),
                                                                ),
                                                              )),
                                                          Positioned(
                                                              child: Transform.translate(
                                                                offset: const Offset(45, 0),
                                                                child: Container(
                                                                  width: 32,
                                                                  height: 32,
                                                                  decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(15),
                                                                    color: const Color(0xffEEEEEE),
                                                                  ),
                                                                  child: const Center(
                                                                      child: Text(
                                                                        '+5',
                                                                        style:
                                                                        TextStyle(color: Color(0xffE5646C), fontSize: 14),
                                                                      )),
                                                                ),
                                                              )),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 25, left: 8),
                                                    child:  Row(
                                                      children: [
                                                        Image.asset('assets/profile-add.png',height: 16,color: const Color(0xff9DA2A7),)
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 25, left: 8),
                                                    child: Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),),
                                                  ),

                                                ],
                                              ),
                                              TableRow(
                                                children: <Widget>[
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 18, left: 3),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          padding: const EdgeInsets.all(5),
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(12),
                                                            color: const Color(0xffF5F5F5),
                                                          ),
                                                          child: Center(
                                                            child: Row(
                                                              children: [
                                                                Image.asset('assets/timer.png',height: 16,color: const Color(0xff727880)),
                                                                const SizedBox(width: 10,),
                                                                const Text('Nov 10',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880))),
                                                              ],
                                                            ),
                                                          ),
                                                        ),

                                                      ],
                                                    ),
                                                  ),
                                                   Padding(
                                                    padding: const EdgeInsets.only(top: 22, left: 8),
                                                    child: Text(
                                                      'All the Lorem Ipsum generators',
                                                      style: TextStyle(
                                                          fontFamily: 'InterRegular',
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: 14,
                                                          color: notifire.getblackcolor),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 18, left: 3),
                                                    child: Row(
                                                      children: [
                                                        Container(

                                                          padding:
                                                          const EdgeInsets.all(6),
                                                          decoration: BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius.circular(
                                                                16),
                                                            color:const Color(0xffA9DDF5),
                                                          ),
                                                          child: const Row(
                                                            children: [
                                                              Center(
                                                                  child: Text('Web',
                                                                      style: TextStyle(

                                                                        fontFamily:
                                                                        'InterRegular',
                                                                        fontSize: 12,
                                                                      ))),
                                                            ],
                                                          ),
                                                        ),
                                                        const SizedBox(width: 10,),
                                                        Container(padding:
                                                        const EdgeInsets.all(6),
                                                          decoration: BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius.circular(
                                                                16),
                                                            color:const Color(0xffFFC9AC),
                                                          ),
                                                          child: const Row(
                                                            children: [
                                                              Center(
                                                                  child: Text('IOS',
                                                                      style: TextStyle(

                                                                        fontFamily:
                                                                        'InterRegular',
                                                                        fontSize: 12,
                                                                      ))),
                                                            ],
                                                          ),
                                                        ),

                                                      ],
                                                    ),
                                                  ),
                                                  const Padding(
                                                    padding: EdgeInsets.only(top: 25, left: 8),
                                                    child:  Row(
                                                      children: [
                                                        Text('2/24',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880),),),
                                                        SizedBox(width: 10,),
                                                        SizedBox(
                                                          width: 150,
                                                          child: StepProgressIndicator(
                                                            totalSteps: 100,
                                                            currentStep: 30,
                                                            size: 5,
                                                            padding: 0,
                                                            selectedColor: Color(0xff7DC066),
                                                            unselectedColor: Color(0xffEEEEEE),
                                                            roundedEdges: Radius.circular(10),
                                                          ),
                                                        ),

                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 5, top: 18),
                                                    child: Transform.translate(
                                                      offset: const Offset(0, 0),
                                                      child: Stack(
                                                        clipBehavior: Clip.none,
                                                        children: [
                                                          Transform.translate(
                                                            offset: const Offset(-30, 0),
                                                            child: Container(
                                                              width: 32,
                                                              height: 32,
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(15),
                                                              ),
                                                              child:
                                                              Center(child: Image.asset('assets/avatar-7 1.png')),
                                                            ),
                                                          ),
                                                          Positioned(
                                                              left: -10,
                                                              child: Transform.translate(
                                                                offset: const Offset(5, 0),
                                                                child: Container(
                                                                  width: 32,
                                                                  height: 32,
                                                                  decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(15),
                                                                  ),
                                                                  child: Center(
                                                                      child: Image.asset('assets/avatar-6 1.png')),
                                                                ),
                                                              )),

                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 25, left: 8),
                                                    child:  Row(
                                                      children: [
                                                        Image.asset('assets/profile-add.png',height: 16,color: const Color(0xff9DA2A7),)
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 25, left: 8),
                                                    child: Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),),
                                                  ),

                                                ],
                                              ),
                                              const TableRow(children: [

                                                Padding(
                                                  padding: EdgeInsets.only(top: 10),
                                                  child: Divider(
                                                    height: 10,
                                                    color: Colors.transparent,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(top: 10),
                                                  child: Divider(
                                                    height: 10,
                                                    color: Colors.transparent,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(top: 10),
                                                  child: Divider(
                                                    height: 10,
                                                    color: Colors.transparent,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(top: 10),
                                                  child: Divider(
                                                    height: 10,
                                                    color: Colors.transparent,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(top: 10),
                                                  child: Divider(
                                                    height: 10,
                                                    color: Colors.transparent,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(top: 10),
                                                  child: Divider(
                                                    height: 10,
                                                    color: Colors.transparent,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(top: 10),
                                                  child: Divider(
                                                    height: 10,
                                                    color: Colors.transparent,
                                                  ),
                                                ),
                                              ]),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10,),

                                Row(
                                  children: [
                                     Text(
                                      'In Work',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'InterRegular',
                                        fontSize: 16,color: notifire.getblackcolor
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                        padding: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12),
                                          color: notifire.getbgcolor11,
                                        ),
                                        child: const Text(
                                          '4',
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              fontSize: 12,
                                              color: Color(0xff727880)),
                                        )),
                                  ],
                                ),
                                const SizedBox(height: 10,),
                                Container(
                                  padding: const EdgeInsets.all(15),
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                      color:notifire.getbgcolor11,
                                      // color: Colors.red,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          // width: constraints < 1400 ? 1500 : Get.width,
                                          child: Table(
                                            border: TableBorder.all(color: Colors.transparent),
                                            columnWidths: const <int, TableColumnWidth>{
                                              0: FixedColumnWidth(130),
                                              1: FixedColumnWidth(300),
                                              2: FixedColumnWidth(250),
                                              3: FixedColumnWidth(300),
                                              4: FixedColumnWidth(150),
                                              5: FixedColumnWidth(150),
                                              6: FixedColumnWidth(50),
                                            },
                                            children: <TableRow>[
                                              TableRow(
                                                children: <Widget>[
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 18, left: 3),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          padding: const EdgeInsets.all(5),
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(12),
                                                            color: const Color(0xffF5F5F5),
                                                          ),
                                                          child: Center(
                                                            child: Row(
                                                              children: [
                                                                Image.asset('assets/timer.png',height: 16,color: const Color(0xff727880)),
                                                                const SizedBox(width: 10,),
                                                                const Text('May 20',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880))),
                                                              ],
                                                            ),
                                                          ),
                                                        ),

                                                      ],
                                                    ),
                                                  ),
                                                   Padding(
                                                    padding: const EdgeInsets.only(top: 22, left: 8),
                                                    child: Text(
                                                      'versions have evolved over Various',
                                                      style: TextStyle(
                                                          fontFamily: 'InterRegular',
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: 14,
                                                          color:notifire.getblackcolor),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 18, left: 3),
                                                    child: Row(
                                                      children: [
                                                        Container(

                                                          padding:
                                                          const EdgeInsets.all(6),
                                                          decoration: BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius.circular(
                                                                16),
                                                            color:const Color(0xffD9B7FB),
                                                          ),
                                                          child: const Row(
                                                            children: [
                                                              Center(
                                                                  child: Text('Web',
                                                                      style: TextStyle(

                                                                        fontFamily:
                                                                        'InterRegular',
                                                                        fontSize: 12,
                                                                      ))),
                                                            ],
                                                          ),
                                                        ),
                                                        const SizedBox(width: 10,),
                                                        Container(padding:
                                                        const EdgeInsets.all(6),
                                                          decoration: BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius.circular(
                                                                16),
                                                            color:const Color(0xffFFC9AC),
                                                          ),
                                                          child: const Row(
                                                            children: [
                                                              Center(
                                                                  child: Text('Android',
                                                                      style: TextStyle(

                                                                        fontFamily:
                                                                        'InterRegular',
                                                                        fontSize: 12,
                                                                      ))),
                                                            ],
                                                          ),
                                                        ),

                                                      ],
                                                    ),
                                                  ),
                                                  const Padding(
                                                    padding: EdgeInsets.only(top: 25, left: 8),
                                                    child:  Row(
                                                      children: [
                                                        Text('2/24',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880),),),
                                                        SizedBox(width: 10,),
                                                        SizedBox(
                                                          width: 150,
                                                          child: StepProgressIndicator(
                                                            totalSteps: 100,
                                                            currentStep: 80,
                                                            size: 5,
                                                            padding: 0,
                                                            selectedColor: Color(0xff7DC066),
                                                            unselectedColor: Color(0xffEEEEEE),
                                                            roundedEdges: Radius.circular(10),
                                                          ),
                                                        ),

                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 5, top: 18),
                                                    child: Transform.translate(
                                                      offset: const Offset(0, 0),
                                                      child: Stack(
                                                        clipBehavior: Clip.none,
                                                        children: [
                                                          Transform.translate(
                                                            offset: const Offset(-30, 0),
                                                            child: Container(
                                                              width: 32,
                                                              height: 32,
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(15),
                                                              ),
                                                              child:
                                                              Center(child: Image.asset('assets/avatar-6 1.png')),
                                                            ),
                                                          ),
                                                          Positioned(
                                                              left: -10,
                                                              child: Transform.translate(
                                                                offset: const Offset(5, 0),
                                                                child: Container(
                                                                  width: 32,
                                                                  height: 32,
                                                                  decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(15),
                                                                  ),
                                                                  child: Center(
                                                                      child: Image.asset('assets/avatar-7 1.png')),
                                                                ),
                                                              )),
                                                          Positioned(
                                                              left: 5,
                                                              child: Transform.translate(
                                                                offset: const Offset(15, 0),
                                                                child: Container(
                                                                  width: 32,
                                                                  height: 32,
                                                                  decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(15),
                                                                  ),
                                                                  child: Center(
                                                                      child: Image.asset('assets/avatar-8 1.png')),
                                                                ),
                                                              )),
                                                          Positioned(
                                                              child: Transform.translate(
                                                                offset: const Offset(45, 0),
                                                                child: Container(
                                                                  width: 32,
                                                                  height: 32,
                                                                  decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(15),
                                                                    color: const Color(0xffEEEEEE),
                                                                  ),
                                                                  child: const Center(
                                                                      child: Text(
                                                                        '+5',
                                                                        style:
                                                                        TextStyle(color: Color(0xffE5646C), fontSize: 14),
                                                                      )),
                                                                ),
                                                              )),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 25, left: 8),
                                                    child:  Row(
                                                      children: [
                                                        Image.asset('assets/profile-add.png',height: 16,color: const Color(0xff9DA2A7),)
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 25, left: 8),
                                                    child: Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),),
                                                  ),

                                                ],
                                              ),
                                              TableRow(
                                                children: <Widget>[
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 18, left: 3),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          padding: const EdgeInsets.all(5),
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(12),
                                                            color: const Color(0xffF5F5F5),
                                                          ),
                                                          child: Center(
                                                            child: Row(
                                                              children: [
                                                                Image.asset('assets/timer.png',height: 16,color: const Color(0xff727880)),
                                                                const SizedBox(width: 10,),
                                                                const Text('Nov 10',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880))),
                                                              ],
                                                            ),
                                                          ),
                                                        ),

                                                      ],
                                                    ),
                                                  ),
                                                   Padding(
                                                    padding: const EdgeInsets.only(top: 22, left: 8),
                                                    child: Text(
                                                      'All the Lorem Ipsum generators',
                                                      style: TextStyle(
                                                          fontFamily: 'InterRegular',
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: 14,
                                                          color: notifire.getblackcolor),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 18, left: 3),
                                                    child: Row(
                                                      children: [
                                                        Container(

                                                          padding:
                                                          const EdgeInsets.all(6),
                                                          decoration: BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius.circular(
                                                                16),
                                                            color:const Color(0xffA9DDF5),
                                                          ),
                                                          child: const Row(
                                                            children: [
                                                              Center(
                                                                  child: Text('Web',
                                                                      style: TextStyle(

                                                                        fontFamily:
                                                                        'InterRegular',
                                                                        fontSize: 12,
                                                                      ))),
                                                            ],
                                                          ),
                                                        ),
                                                        const SizedBox(width: 10,),
                                                        Container(padding:
                                                        const EdgeInsets.all(6),
                                                          decoration: BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius.circular(
                                                                16),
                                                            color:const Color(0xffFFC9AC),
                                                          ),
                                                          child: const Row(
                                                            children: [
                                                              Center(
                                                                  child: Text('IOS',
                                                                      style: TextStyle(

                                                                        fontFamily:
                                                                        'InterRegular',
                                                                        fontSize: 12,
                                                                      ))),
                                                            ],
                                                          ),
                                                        ),

                                                      ],
                                                    ),
                                                  ),
                                                  const Padding(
                                                    padding: EdgeInsets.only(top: 25, left: 8),
                                                    child:  Row(
                                                      children: [
                                                        Text('2/24',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880),),),
                                                        SizedBox(width: 10,),
                                                        SizedBox(
                                                          width: 150,
                                                          child: StepProgressIndicator(
                                                            totalSteps: 100,
                                                            currentStep: 30,
                                                            size: 5,
                                                            padding: 0,
                                                            selectedColor: Color(0xff7DC066),
                                                            unselectedColor: Color(0xffEEEEEE),
                                                            roundedEdges: Radius.circular(10),
                                                          ),
                                                        ),

                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 5, top: 18),
                                                    child: Transform.translate(
                                                      offset: const Offset(0, 0),
                                                      child: Stack(
                                                        clipBehavior: Clip.none,
                                                        children: [
                                                          Transform.translate(
                                                            offset: const Offset(-30, 0),
                                                            child: Container(
                                                              width: 32,
                                                              height: 32,
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(15),
                                                              ),
                                                              child:
                                                              Center(child: Image.asset('assets/avatar-7 1.png')),
                                                            ),
                                                          ),
                                                          Positioned(
                                                              left: -10,
                                                              child: Transform.translate(
                                                                offset: const Offset(5, 0),
                                                                child: Container(
                                                                  width: 32,
                                                                  height: 32,
                                                                  decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(15),
                                                                  ),
                                                                  child: Center(
                                                                      child: Image.asset('assets/avatar-6 1.png')),
                                                                ),
                                                              )),

                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 25, left: 8),
                                                    child:  Row(
                                                      children: [
                                                        Image.asset('assets/profile-add.png',height: 16,color: const Color(0xff9DA2A7),)
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 25, left: 8),
                                                    child: Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),),
                                                  ),

                                                ],
                                              ),
                                              TableRow(
                                                children: <Widget>[
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 18, left: 3),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          padding: const EdgeInsets.all(5),
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(12),
                                                            color: const Color(0xffF5F5F5),
                                                          ),
                                                          child: Center(
                                                            child: Row(
                                                              children: [
                                                                Image.asset('assets/timer.png',height: 16,color: const Color(0xff727880)),
                                                                const SizedBox(width: 10,),
                                                                const Text('May 17',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880))),
                                                              ],
                                                            ),
                                                          ),
                                                        ),

                                                      ],
                                                    ),
                                                  ),
                                                   Padding(
                                                    padding: const EdgeInsets.only(top: 22, left: 8),
                                                    child: Text(
                                                      'Various versions have evolved over',
                                                      style: TextStyle(
                                                          fontFamily: 'InterRegular',
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: 14,
                                                          color: notifire.getblackcolor),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 18, left: 3),
                                                    child: Row(
                                                      children: [
                                                        Container(

                                                          padding:
                                                          const EdgeInsets.all(6),
                                                          decoration: BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius.circular(
                                                                16),
                                                            color:const Color(0xffB0E4C8),
                                                          ),
                                                          child: const Row(
                                                            children: [
                                                              Center(
                                                                  child: Text('UI',
                                                                      style: TextStyle(

                                                                        fontFamily:
                                                                        'InterRegular',
                                                                        fontSize: 12,
                                                                      ))),
                                                            ],
                                                          ),
                                                        ),
                                                        const SizedBox(width: 10,),
                                                        Container(padding:
                                                        const EdgeInsets.all(6),
                                                          decoration: BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius.circular(
                                                                16),
                                                            color:const Color(0xffA9DDF5),
                                                          ),
                                                          child: const Row(
                                                            children: [
                                                              Center(
                                                                  child: Text('IOS',
                                                                      style: TextStyle(

                                                                        fontFamily:
                                                                        'InterRegular',
                                                                        fontSize: 12,
                                                                      ))),
                                                            ],
                                                          ),
                                                        ),
                                                        const SizedBox(width: 10,),
                                                        Container(padding:
                                                        const EdgeInsets.all(6),
                                                          decoration: BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius.circular(
                                                                16),
                                                            color:const Color(0xffF8BEC1),
                                                          ),
                                                          child: const Row(
                                                            children: [
                                                              Center(
                                                                  child: Text('Research',
                                                                      style: TextStyle(

                                                                        fontFamily:
                                                                        'InterRegular',
                                                                        fontSize: 12,
                                                                      ))),
                                                            ],
                                                          ),
                                                        ),

                                                      ],
                                                    ),
                                                  ),
                                                  const Padding(
                                                    padding: EdgeInsets.only(top: 25, left: 8),
                                                    child:  Row(
                                                      children: [
                                                        Text('5/34',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880),),),
                                                        SizedBox(width: 10,),
                                                        SizedBox(
                                                          width: 150,
                                                          child: StepProgressIndicator(
                                                            totalSteps: 100,
                                                            currentStep: 60,
                                                            size: 5,
                                                            padding: 0,
                                                            selectedColor: Color(0xff7DC066),
                                                            unselectedColor: Color(0xffEEEEEE),
                                                            roundedEdges: Radius.circular(10),
                                                          ),
                                                        ),

                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 5, top: 18),
                                                    child: Transform.translate(
                                                      offset: const Offset(
                                                          -50, 0),
                                                      child: Stack(
                                                        clipBehavior:
                                                        Clip.none,
                                                        children: [
                                                          Positioned(
                                                              left: 5,
                                                              child: Transform
                                                                  .translate(
                                                                offset:
                                                                const Offset(
                                                                    15,
                                                                    0),
                                                                child:
                                                                Container(
                                                                  width: 32,
                                                                  height:
                                                                  32,
                                                                  decoration:
                                                                  BoxDecoration(
                                                                    borderRadius:
                                                                    BorderRadius.circular(15),
                                                                  ),
                                                                  child: Center(
                                                                      child:
                                                                      Image.asset('assets/avatar-8 1.png')),
                                                                ),
                                                              )),
                                                          Positioned(
                                                              child: Transform
                                                                  .translate(
                                                                offset:
                                                                const Offset(
                                                                    45, 0),
                                                                child:
                                                                Container(
                                                                  width: 32,
                                                                  height: 32,
                                                                  decoration:
                                                                  BoxDecoration(
                                                                    borderRadius:
                                                                    BorderRadius.circular(
                                                                        15),
                                                                    color: const Color(
                                                                        0xffEEEEEE),
                                                                  ),
                                                                  child:
                                                                  const Center(
                                                                      child:
                                                                      Text(
                                                                        '+16',
                                                                        style: TextStyle(
                                                                            color: Color(
                                                                                0xffE5646C),
                                                                            fontSize:
                                                                            14),
                                                                      )),
                                                                ),
                                                              )),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 25, left: 8),
                                                    child:  Row(
                                                      children: [
                                                        Image.asset('assets/profile-add.png',height: 16,color: const Color(0xff9DA2A7),)
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 25, left: 8),
                                                    child: Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),),
                                                  ),

                                                ],
                                              ),
                                              const TableRow(children: [

                                                Padding(
                                                  padding: EdgeInsets.only(top: 10),
                                                  child: Divider(
                                                    height: 10,
                                                    color: Colors.transparent,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(top: 10),
                                                  child: Divider(
                                                    height: 10,
                                                    color: Colors.transparent,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(top: 10),
                                                  child: Divider(
                                                    height: 10,
                                                    color: Colors.transparent,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(top: 10),
                                                  child: Divider(
                                                    height: 10,
                                                    color: Colors.transparent,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(top: 10),
                                                  child: Divider(
                                                    height: 10,
                                                    color: Colors.transparent,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(top: 10),
                                                 child: Divider(
                                                    height: 10,
                                                    color: Colors.transparent,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(top: 10),
                                                  child: Divider(
                                                    height: 10,
                                                    color: Colors.transparent,
                                                  ),
                                                ),
                                              ]),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10,),

                                Row(
                                  children: [
                                     Text(
                                      'Q & A',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'InterRegular',
                                        fontSize: 16,color: notifire.getblackcolor
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                        padding: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12),
                                          color: notifire.getbgcolor11,
                                        ),
                                        child: const Text(
                                          '4',
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              fontSize: 12,
                                              color: Color(0xff727880)),
                                        )),
                                  ],
                                ),
                                const SizedBox(height: 10,),
                                Container(
                                  padding: const EdgeInsets.all(15),
                                  width: Get.width,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                                      color: notifire.getbgcolor11
                                      ),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          // width: constraints < 1400 ? 1500 : Get.width,
                                          child: Table(
                                            border: TableBorder.all(color: Colors.transparent),
                                            columnWidths: const <int, TableColumnWidth>{
                                              0: FixedColumnWidth(130),
                                              1: FixedColumnWidth(300),
                                              2: FixedColumnWidth(250),
                                              3: FixedColumnWidth(300),
                                              4: FixedColumnWidth(150),
                                              5: FixedColumnWidth(150),
                                              6: FixedColumnWidth(50),
                                            },
                                            children: <TableRow>[
                                              TableRow(
                                                children: <Widget>[
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 18, left: 3),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          padding: const EdgeInsets.all(5),
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(12),
                                                            color: const Color(0xffF5F5F5),
                                                          ),
                                                          child: Center(
                                                            child: Row(
                                                              children: [
                                                                Image.asset('assets/timer.png',height: 16,color: const Color(0xff727880)),
                                                                const SizedBox(width: 10,),
                                                                const Text('Nov 10',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880))),
                                                              ],
                                                            ),
                                                          ),
                                                        ),

                                                      ],
                                                    ),
                                                  ),
                                                   Padding(
                                                    padding: const EdgeInsets.only(top: 22, left: 8),
                                                    child: Text(
                                                      'All the Lorem Ipsum generators',
                                                      style: TextStyle(
                                                          fontFamily: 'InterRegular',
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: 14,
                                                          color: notifire.getblackcolor),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 18, left: 3),
                                                    child: Row(
                                                      children: [
                                                        Container(

                                                          padding:
                                                          const EdgeInsets.all(6),
                                                          decoration: BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius.circular(
                                                                16),
                                                            color:const Color(0xffA9DDF5),
                                                          ),
                                                          child: const Row(
                                                            children: [
                                                              Center(
                                                                  child: Text('Web',
                                                                      style: TextStyle(

                                                                        fontFamily:
                                                                        'InterRegular',
                                                                        fontSize: 12,
                                                                      ))),
                                                            ],
                                                          ),
                                                        ),
                                                        const SizedBox(width: 10,),
                                                        Container(padding:
                                                        const EdgeInsets.all(6),
                                                          decoration: BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius.circular(
                                                                16),
                                                            color:const Color(0xffFFC9AC),
                                                          ),
                                                          child: const Row(
                                                            children: [
                                                              Center(
                                                                  child: Text('IOS',
                                                                      style: TextStyle(

                                                                        fontFamily:
                                                                        'InterRegular',
                                                                        fontSize: 12,
                                                                      ))),
                                                            ],
                                                          ),
                                                        ),

                                                      ],
                                                    ),
                                                  ),
                                                  const Padding(
                                                    padding: EdgeInsets.only(top: 25, left: 8),
                                                    child:  Row(
                                                      children: [
                                                        Text('2/24',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880),),),
                                                        SizedBox(width: 10,),
                                                        SizedBox(
                                                          width: 150,
                                                          child: StepProgressIndicator(
                                                            totalSteps: 100,
                                                            currentStep: 30,
                                                            size: 5,
                                                            padding: 0,
                                                            selectedColor: Color(0xff7DC066),
                                                            unselectedColor: Color(0xffEEEEEE),
                                                            roundedEdges: Radius.circular(10),
                                                          ),
                                                        ),

                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 5, top: 18),
                                                    child: Transform.translate(
                                                      offset: const Offset(0, 0),
                                                      child: Stack(
                                                        clipBehavior: Clip.none,
                                                        children: [
                                                          Transform.translate(
                                                            offset: const Offset(-30, 0),
                                                            child: Container(
                                                              width: 32,
                                                              height: 32,
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(15),
                                                              ),
                                                              child:
                                                              Center(child: Image.asset('assets/avatar-7 1.png')),
                                                            ),
                                                          ),
                                                          Positioned(
                                                              left: -10,
                                                              child: Transform.translate(
                                                                offset: const Offset(5, 0),
                                                                child: Container(
                                                                  width: 32,
                                                                  height: 32,
                                                                  decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(15),
                                                                  ),
                                                                  child: Center(
                                                                      child: Image.asset('assets/avatar-6 1.png')),
                                                                ),
                                                              )),

                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 25, left: 8),
                                                    child:  Row(
                                                      children: [
                                                        Image.asset('assets/profile-add.png',height: 16,color: const Color(0xff9DA2A7),)
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 25, left: 8),
                                                    child: Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),),
                                                  ),

                                                ],
                                              ),
                                              TableRow(
                                                children: <Widget>[
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 18, left: 3),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          padding: const EdgeInsets.all(5),
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(12),
                                                            color: const Color(0xffF5F5F5),
                                                          ),
                                                          child: Center(
                                                            child: Row(
                                                              children: [
                                                                Image.asset('assets/timer.png',height: 16,color: const Color(0xff727880)),
                                                                const SizedBox(width: 10,),
                                                                const Text('May 17',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880))),
                                                              ],
                                                            ),
                                                          ),
                                                        ),

                                                      ],
                                                    ),
                                                  ),
                                                   Padding(
                                                    padding: const EdgeInsets.only(top: 22, left: 8),
                                                    child: Text(
                                                      'Various versions have evolved over',
                                                      style: TextStyle(
                                                          fontFamily: 'InterRegular',
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: 14,
                                                          color: notifire.getblackcolor),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 18, left: 3),
                                                    child: Row(
                                                      children: [
                                                        Container(

                                                          padding:
                                                          const EdgeInsets.all(6),
                                                          decoration: BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius.circular(
                                                                16),
                                                            color:const Color(0xffB0E4C8),
                                                          ),
                                                          child: const Row(
                                                            children: [
                                                              Center(
                                                                  child: Text('UI',
                                                                      style: TextStyle(

                                                                        fontFamily:
                                                                        'InterRegular',
                                                                        fontSize: 12,
                                                                      ))),
                                                            ],
                                                          ),
                                                        ),
                                                        const SizedBox(width: 10,),
                                                        Container(padding:
                                                        const EdgeInsets.all(6),
                                                          decoration: BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius.circular(
                                                                16),
                                                            color:const Color(0xffA9DDF5),
                                                          ),
                                                          child: const Row(
                                                            children: [
                                                              Center(
                                                                  child: Text('IOS',
                                                                      style: TextStyle(

                                                                        fontFamily:
                                                                        'InterRegular',
                                                                        fontSize: 12,
                                                                      ))),
                                                            ],
                                                          ),
                                                        ),
                                                        const SizedBox(width: 10,),
                                                        Container(padding:
                                                        const EdgeInsets.all(6),
                                                          decoration: BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius.circular(
                                                                16),
                                                            color:const Color(0xffF8BEC1),
                                                          ),
                                                          child: const Row(
                                                            children: [
                                                              Center(
                                                                  child: Text('Research',
                                                                      style: TextStyle(

                                                                        fontFamily:
                                                                        'InterRegular',
                                                                        fontSize: 12,
                                                                      ))),
                                                            ],
                                                          ),
                                                        ),

                                                      ],
                                                    ),
                                                  ),
                                                  const Padding(
                                                    padding: EdgeInsets.only(top: 25, left: 8),
                                                    child:  Row(
                                                      children: [
                                                        Text('5/34',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880),),),
                                                        SizedBox(width: 10,),
                                                        SizedBox(
                                                          width: 150,
                                                          child: StepProgressIndicator(
                                                            totalSteps: 100,
                                                            currentStep: 60,
                                                            size: 5,
                                                            padding: 0,
                                                            selectedColor: Color(0xff7DC066),
                                                            unselectedColor: Color(0xffEEEEEE),
                                                            roundedEdges: Radius.circular(10),
                                                          ),
                                                        ),

                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 5, top: 18),
                                                    child: Transform.translate(
                                                      offset: const Offset(
                                                          -50, 0),
                                                      child: Stack(
                                                        clipBehavior:
                                                        Clip.none,
                                                        children: [
                                                          Positioned(
                                                              left: 5,
                                                              child: Transform
                                                                  .translate(
                                                                offset:
                                                                const Offset(
                                                                    15,
                                                                    0),
                                                                child:
                                                                Container(
                                                                  width: 32,
                                                                  height:
                                                                  32,
                                                                  decoration:
                                                                  BoxDecoration(
                                                                    borderRadius:
                                                                    BorderRadius.circular(15),
                                                                  ),
                                                                  child: Center(
                                                                      child:
                                                                      Image.asset('assets/avatar-8 1.png')),
                                                                ),
                                                              )),
                                                          Positioned(
                                                              child: Transform
                                                                  .translate(
                                                                offset:
                                                                const Offset(
                                                                    45, 0),
                                                                child:
                                                                Container(
                                                                  width: 32,
                                                                  height: 32,
                                                                  decoration:
                                                                  BoxDecoration(
                                                                    borderRadius:
                                                                    BorderRadius.circular(
                                                                        15),
                                                                    color: const Color(
                                                                        0xffEEEEEE),
                                                                  ),
                                                                  child:
                                                                  const Center(
                                                                      child:
                                                                      Text(
                                                                        '+16',
                                                                        style: TextStyle(
                                                                            color: Color(
                                                                                0xffE5646C),
                                                                            fontSize:
                                                                            14),
                                                                      )),
                                                                ),
                                                              )),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 25, left: 8),
                                                    child:  Row(
                                                      children: [
                                                        Image.asset('assets/profile-add.png',height: 16,color: const Color(0xff9DA2A7),)
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 25, left: 8),
                                                    child: Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),),
                                                  ),

                                                ],
                                              ),
                                              TableRow(
                                                children: <Widget>[
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 18, left: 3),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          padding: const EdgeInsets.all(5),
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(12),
                                                            color: const Color(0xffF5F5F5),
                                                          ),
                                                          child: Center(
                                                            child: Row(
                                                              children: [
                                                                Image.asset('assets/timer.png',height: 16,color: const Color(0xff727880)),
                                                                const SizedBox(width: 10,),
                                                                const Text('May 20',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880))),
                                                              ],
                                                            ),
                                                          ),
                                                        ),

                                                      ],
                                                    ),
                                                  ),
                                                   Padding(
                                                    padding: const EdgeInsets.only(top: 22, left: 8),
                                                    child: Text(
                                                      'versions have evolved over Various',
                                                      style: TextStyle(
                                                          fontFamily: 'InterRegular',
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: 14,
                                                          color: notifire.getblackcolor),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 18, left: 3),
                                                    child: Row(
                                                      children: [
                                                        Container(

                                                          padding:
                                                          const EdgeInsets.all(6),
                                                          decoration: BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius.circular(
                                                                16),
                                                            color:const Color(0xffD9B7FB),
                                                          ),
                                                          child: const Row(
                                                            children: [
                                                              Center(
                                                                  child: Text('Web',
                                                                      style: TextStyle(

                                                                        fontFamily:
                                                                        'InterRegular',
                                                                        fontSize: 12,
                                                                      ))),
                                                            ],
                                                          ),
                                                        ),
                                                        const SizedBox(width: 10,),
                                                        Container(padding:
                                                        const EdgeInsets.all(6),
                                                          decoration: BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius.circular(
                                                                16),
                                                            color:const Color(0xffFFC9AC),
                                                          ),
                                                          child: const Row(
                                                            children: [
                                                              Center(
                                                                  child: Text('Android',
                                                                      style: TextStyle(

                                                                        fontFamily:
                                                                        'InterRegular',
                                                                        fontSize: 12,
                                                                      ))),
                                                            ],
                                                          ),
                                                        ),

                                                      ],
                                                    ),
                                                  ),
                                                  const Padding(
                                                    padding: EdgeInsets.only(top: 25, left: 8),
                                                    child:  Row(
                                                      children: [
                                                        Text('2/24',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880),),),
                                                        SizedBox(width: 10,),
                                                        SizedBox(
                                                          width: 150,
                                                          child: StepProgressIndicator(
                                                            totalSteps: 100,
                                                            currentStep: 80,
                                                            size: 5,
                                                            padding: 0,
                                                            selectedColor: Color(0xff7DC066),
                                                            unselectedColor: Color(0xffEEEEEE),
                                                            roundedEdges: Radius.circular(10),
                                                          ),
                                                        ),

                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 5, top: 18),
                                                    child: Transform.translate(
                                                      offset: const Offset(0, 0),
                                                      child: Stack(
                                                        clipBehavior: Clip.none,
                                                        children: [
                                                          Transform.translate(
                                                            offset: const Offset(-30, 0),
                                                            child: Container(
                                                              width: 32,
                                                              height: 32,
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(15),
                                                              ),
                                                              child:
                                                              Center(child: Image.asset('assets/avatar-6 1.png')),
                                                            ),
                                                          ),
                                                          Positioned(
                                                              left: -10,
                                                              child: Transform.translate(
                                                                offset: const Offset(5, 0),
                                                                child: Container(
                                                                  width: 32,
                                                                  height: 32,
                                                                  decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(15),
                                                                  ),
                                                                  child: Center(
                                                                      child: Image.asset('assets/avatar-7 1.png')),
                                                                ),
                                                              )),
                                                          Positioned(
                                                              left: 5,
                                                              child: Transform.translate(
                                                                offset: const Offset(15, 0),
                                                                child: Container(
                                                                  width: 32,
                                                                  height: 32,
                                                                  decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(15),
                                                                  ),
                                                                  child: Center(
                                                                      child: Image.asset('assets/avatar-8 1.png')),
                                                                ),
                                                              )),
                                                          Positioned(
                                                              child: Transform.translate(
                                                                offset: const Offset(45, 0),
                                                                child: Container(
                                                                  width: 32,
                                                                  height: 32,
                                                                  decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(15),
                                                                    color: const Color(0xffEEEEEE),
                                                                  ),
                                                                  child: const Center(
                                                                      child: Text(
                                                                        '+5',
                                                                        style:
                                                                        TextStyle(color: Color(0xffE5646C), fontSize: 14),
                                                                      )),
                                                                ),
                                                              )),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 25, left: 8),
                                                    child:  Row(
                                                      children: [
                                                        Image.asset('assets/profile-add.png',height: 16,color: const Color(0xff9DA2A7),)
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 25, left: 8),
                                                    child: Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),),
                                                  ),

                                                ],
                                              ),
                                              const TableRow(children: [

                                                Padding(
                                                  padding: EdgeInsets.only(top: 10),
                                                  child: Divider(
                                                    height: 10,
                                                    color: Colors.transparent,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(top: 10),
                                                  child: Divider(
                                                    height: 10,
                                                    color: Colors.transparent,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(top: 10),
                                                  child: Divider(
                                                    height: 10,
                                                    color: Colors.transparent,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(top: 10),
                                                  child: Divider(
                                                    height: 10,
                                                    color: Colors.transparent,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(top: 10),
                                                  child: Divider(
                                                    height: 10,
                                                    color: Colors.transparent,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(top: 10),
                                                  child: Divider(
                                                    height: 10,
                                                    color: Colors.transparent,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(top: 10),
                                                  child: Divider(
                                                    height: 10,
                                                    color: Colors.transparent,
                                                  ),
                                                ),
                                              ]),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10,),

                 

                              ],
                            ),
                          ],
                        ),
              
                    ),
              
                ],
              ),
            ),
          ),
        ],
      );
    }
    else {
      return Column(
        children: [
          DefaultTabController(
            length: 2,
            child:
            Column(
              children: [
                Row(children: [

                  Text('Workspace',style: TextStyle(fontFamily: 'InterRegular',fontSize: 12,color:notifire.getblackcolor)),
                  const SizedBox(width: 8,),
                  Image.asset('assets/Ellipse 88.png',height: 4,),
                  const SizedBox(width: 8,),
                  Text('Team',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color:notifire.getblackcolor),),
                  const SizedBox(width: 8,),
                  Image.asset('assets/Ellipse 88.png',height: 4,),
                  const SizedBox(width: 8,),
                  const Text('Web Design',style: TextStyle(fontFamily: 'InterRegular',fontSize: 12,color: Color(0xff9DA2A7)),),
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
                  Text('Management',style: TextStyle(color: greyy,fontSize: 14,fontFamily: 'InterRegular'),),
                  const SizedBox(width: 10,),
                  Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: greyy,),),
                  const SizedBox(width: 10,),
                  Text('Version2',style: TextStyle(color: notifire.getblackcolor,fontSize: 14,fontFamily: 'InterRegular'),),
                ],),
                const SizedBox(height: 20,),
                Center(
                  child: SizedBox(
                    width: Get.width,
                    child: Container(
                      decoration:  BoxDecoration(color: notifire.getbgcolor11, borderRadius: BorderRadius.circular(12),),
                      child: Row(
                        children: [
                          TabBar(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            indicatorColor: const Color(0xff2a70fe),
                            isScrollable: true,
                            tabs: <Widget>[
                              Tab(
                                  child: Row(
                                    children: [
                                      Image.asset('assets/kanban.png',
                                          color: notifire.getblackcolor, scale: 3.5),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                       Text('Boards',
                                          style: TextStyle(color: notifire.getblackcolor,
                                              fontFamily: 'InterRegular',
                                              fontSize: 14)),
                                    ],
                                  )),
                              Tab(
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/element-3.svg',
                                        height: 16,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                       Text('Rows',
                                          style: TextStyle(color: notifire.getblackcolor,
                                              fontFamily: 'InterRegular',
                                              fontSize: 14)),
                                    ],
                                  )),
                            ],
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: notifire.getbgcolor10),
                              padding: const EdgeInsets.all(11),
                              child: Center(
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/flash.png',
                                      height: 16,
                                    ),
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
                                  color: notifire.getbgcolor10),
                              padding: const EdgeInsets.all(11),
                              child: Center(
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/star2.png',
                                      height: 16,
                                    ),
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
                                  color: notifire.getbgcolor10),
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
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: notifire.getbgcolor10),
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Center(
                                    child: Image.asset(
                                      'assets/more.png',
                                      scale: 4,
                                    )),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10,),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 40,
                              padding: const EdgeInsets.all(11),
                              decoration: BoxDecoration(
                                  color: const Color(0xff595FE5),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Center(
                                child: Row(children: [
                                  Image.asset('assets/add.png', scale: 4),
                                  const SizedBox(
                                    width: 10
                                  ),
                                  const Text(
                                    'Create Board',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'InterRegular',
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  )
                                ]),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10,),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height :20),
                Column(
                  children: [

                    Row(
                      children: [
                         Text('Responsive Dashboard Design',style: TextStyle(fontSize: 28,fontFamily: 'InterRegular',fontWeight: FontWeight.w500,color :notifire.getblackcolor),),
                        const Spacer(),
                     
                        Container(
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(color: notifire.getbgcolor11,borderRadius: BorderRadius.circular(20)),
                          child: Center(child: Image.asset('assets/add.png',height: 16,color: const Color(0xff727880))),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: Get.height * 1.45,
                  child:  TabBarView(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                       Text(
                                        'Backlogs',
                                        style: TextStyle(
                                            color: notifire.getblackcolor,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                            fontFamily: 'InterRegular'),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                          padding: const EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(12),
                                              color: notifire.getbgcolor11
                                          ),
                                          child: const Text(
                                            '4',
                                            style: TextStyle(
                                                fontFamily: 'InterRegular',
                                                fontSize: 12,
                                                color: Color(0xff9DA2A7)),
                                          )),
                                      const Spacer(),
                                      Image.asset('assets/add.png',height: 16,color: const Color(0xff9DA2A7)),
                                      const SizedBox(width: 10,),
                                      Image.asset(
                                        'assets/more.png',
                                        height: 16,color: const Color(0xff9DA2A7),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(
                                    child: ListView.builder(
                                      physics: const NeverScrollableScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      itemCount: model().Wor.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          margin:
                                          const EdgeInsets.only(bottom: 20),
                                          padding: const EdgeInsets.all(14),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(12),
                                            color: notifire.getbgcolor11
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              index == 1 ?  Image.asset('assets/Media12.png',):const SizedBox(),
                                              index == 2 ?  Image.asset('assets/Media12.png',):const SizedBox(),
                                              const SizedBox(height: 10,),
                                              index ==  0 ?
                                              Row(
                                                children: [
                                                  Container(
                                                    width: 30,
                                                    height: 10,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5),
                                                      color: const Color(0xffB0E4C8),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 5,),
                                                  Container(
                                                    width: 30,
                                                    height: 10,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5),
                                                      color: const Color(0xffF8BEC1),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 5,),
                                                  Container(
                                                    width: 30,
                                                    height: 10,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5),
                                                      color: const Color(0xffA9DDF5),
                                                    ),
                                                  ),
                                                ],
                                              ): const SizedBox(),
                                              index ==  1 ?
                                              Row(
                                                children: [
                                                  Container(
                                                    width: 30,
                                                    height: 10,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5),
                                                      color: const Color(0xffD9B7FB),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 5,),
                                                  Container(
                                                    width: 30,
                                                    height: 10,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5),
                                                      color: const Color(0xffFFC9AC),
                                                    ),
                                                  ),

                                                ],
                                              ): const SizedBox(),
                                              index ==  2 ?
                                              Row(
                                                children: [
                                                  Container(
                                                    width: 30,
                                                    height: 10,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5),
                                                      color: const Color(0xffB0E4C8),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 5,),
                                                  Container(
                                                    width: 30,
                                                    height: 10,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5),
                                                      color: const Color(0xffF8BEC1),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 5,),
                                                  Container(
                                                    width: 30,
                                                    height: 10,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5),
                                                      color: const Color(0xffA9DDF5),
                                                    ),
                                                  ),
                                                ],
                                              ): const SizedBox(),
                                              const SizedBox(height: 10,),
                                              Row(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      model().Wor[index],
                                                      style:  TextStyle(
                                                          fontSize: 14,
                                                          fontFamily:
                                                          'InterRegular',
                                                          fontWeight:
                                                          FontWeight.w600,
                                                          color: notifire.getblackcolor),
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  Image.asset(
                                                    'assets/more.png',
                                                    height: 16,
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              index == 0
                                                  ? const Text(
                                                  'Review vendor rules and regulations',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color:
                                                      Color(0xff9DA2A7),
                                                      fontFamily:
                                                      'InterRegular'))
                                                  : const SizedBox(),
                                              index == 2
                                                  ? const Text(
                                                  'Review lead retrieval system',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color:
                                                      Color(0xff9DA2A7),
                                                      fontFamily:
                                                      'InterRegular'))
                                                  : const SizedBox(),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Text(model().ver1[index],style: const TextStyle(color: Color(0xff727880),fontFamily: 'InterRegular',fontSize: 12),),
                                                  const SizedBox(width: 10,),
                                                  index ==  0 ? const Expanded(
                                                    child: StepProgressIndicator(
                                                      totalSteps: 100,
                                                      currentStep: 32,
                                                      size: 5,
                                                      padding: 0,
                                                      selectedColor: Color(0xff7DC066),
                                                      unselectedColor: Color(0xffEEEEEE),
                                                      roundedEdges: Radius.circular(10),
                                                    ),
                                                  ): const SizedBox(),
                                                  index ==  1 ? const Expanded(
                                                    child: StepProgressIndicator(
                                                      totalSteps: 100,
                                                      currentStep: 80,
                                                      size: 5,
                                                      padding: 0,
                                                      selectedColor: Color(0xff7DC066),
                                                      unselectedColor: Color(0xffEEEEEE),
                                                      roundedEdges: Radius.circular(10),
                                                    ),
                                                  ): const SizedBox(),
                                                  index ==  2 ? const Expanded(
                                                    child: StepProgressIndicator(
                                                      totalSteps: 100,
                                                      currentStep: 60,
                                                      size: 5,
                                                      padding: 0,
                                                      selectedColor: Color(0xff7DC066),
                                                      unselectedColor: Color(0xffEEEEEE),
                                                      roundedEdges: Radius.circular(10),
                                                    ),
                                                  ): const SizedBox(),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    padding: const EdgeInsets.all(5),
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(12),
                                                      color: notifire.Getblg2,
                                                    ),
                                                    child: Center(
                                                      child: Row(
                                                        children: [
                                                          Image.asset('assets/timer.png',height: 16,color: const Color(0xff727880)),
                                                          const SizedBox(width: 10,),
                                                          Text(model().ver2[index],style: const TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880))),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  index == 0
                                                      ? Transform.translate(
                                                    offset: const Offset(
                                                        -50, 0),
                                                    child: Stack(
                                                      clipBehavior:
                                                      Clip.none,
                                                      children: [
                                                        Transform
                                                            .translate(
                                                          offset:
                                                          const Offset(
                                                              -30, 0),
                                                          child:
                                                          Container(
                                                            width: 32,
                                                            height: 32,
                                                            decoration:
                                                            BoxDecoration(
                                                              borderRadius:
                                                              BorderRadius.circular(
                                                                  15),
                                                            ),
                                                            child: Center(
                                                                child: Image
                                                                    .asset(
                                                                    'assets/avatar-6 1.png')),
                                                          ),
                                                        ),
                                                        Positioned(
                                                            left: -10,
                                                            child: Transform
                                                                .translate(
                                                              offset:
                                                              const Offset(
                                                                  5,
                                                                  0),
                                                              child:
                                                              Container(
                                                                width: 32,
                                                                height:
                                                                32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius.circular(15),
                                                                ),
                                                                child: Center(
                                                                    child:
                                                                    Image.asset('assets/avatar-7 1.png')),
                                                              ),
                                                            )),
                                                        Positioned(
                                                            left: 5,
                                                            child: Transform
                                                                .translate(
                                                              offset:
                                                              const Offset(
                                                                  15,
                                                                  0),
                                                              child:
                                                              Container(
                                                                width: 32,
                                                                height:
                                                                32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius.circular(15),
                                                                ),
                                                                child: Center(
                                                                    child:
                                                                    Image.asset('assets/avatar-8 1.png')),
                                                              ),
                                                            )),
                                                        Positioned(
                                                            child: Transform
                                                                .translate(
                                                              offset:
                                                              const Offset(
                                                                  45, 0),
                                                              child:
                                                              Container(
                                                                width: 32,
                                                                height: 32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius.circular(
                                                                      15),
                                                                  color: const Color(
                                                                      0xffEEEEEE),
                                                                ),
                                                                child:
                                                                const Center(
                                                                    child:
                                                                    Text(
                                                                      '+5',
                                                                      style: TextStyle(
                                                                          color: Color(
                                                                              0xffE5646C),
                                                                          fontSize:
                                                                          14),
                                                                    )),
                                                              ),
                                                            )),
                                                      ],
                                                    ),
                                                  )
                                                      : const SizedBox(),
                                                  index == 1
                                                      ? Transform.translate(
                                                    offset: const Offset(
                                                        -50, 0),
                                                    child: Stack(
                                                      clipBehavior:
                                                      Clip.none,
                                                      children: [
                                                        Positioned(
                                                            left: 5,
                                                            child: Transform
                                                                .translate(
                                                              offset:
                                                              const Offset(
                                                                  15,
                                                                  0),
                                                              child:
                                                              Container(
                                                                width: 32,
                                                                height:
                                                                32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius.circular(15),
                                                                ),
                                                                child: Center(
                                                                    child:
                                                                    Image.asset('assets/avatar-8 1.png')),
                                                              ),
                                                            )),
                                                        Positioned(
                                                            child: Transform
                                                                .translate(
                                                              offset:
                                                              const Offset(
                                                                  45, 0),
                                                              child:
                                                              Container(
                                                                width: 32,
                                                                height: 32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius.circular(
                                                                      15),
                                                                  color: const Color(
                                                                      0xffEEEEEE),
                                                                ),
                                                                child:
                                                                const Center(
                                                                    child:
                                                                    Text(
                                                                      '+16',
                                                                      style: TextStyle(
                                                                          color: Color(
                                                                              0xffE5646C),
                                                                          fontSize:
                                                                          14),
                                                                    )),
                                                              ),
                                                            )),
                                                      ],
                                                    ),
                                                  )
                                                      : const SizedBox(),
                                                  index == 2
                                                      ? Transform.translate(
                                                    offset: const Offset(
                                                        -50, 0),
                                                    child: Stack(
                                                      clipBehavior:
                                                      Clip.none,
                                                      children: [
                                                        Positioned(
                                                            left: -10,
                                                            child: Transform
                                                                .translate(
                                                              offset:
                                                              const Offset(
                                                                  5,
                                                                  0),
                                                              child:
                                                              Container(
                                                                width: 32,
                                                                height:
                                                                32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius.circular(15),
                                                                ),
                                                                child: Center(
                                                                    child:
                                                                    Image.asset('assets/avatar-7 1.png')),
                                                              ),
                                                            )),
                                                        Positioned(
                                                            left: 5,
                                                            child: Transform
                                                                .translate(
                                                              offset:
                                                              const Offset(
                                                                  15,
                                                                  0),
                                                              child:
                                                              Container(
                                                                width: 32,
                                                                height:
                                                                32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius.circular(15),
                                                                ),
                                                                child: Center(
                                                                    child:
                                                                    Image.asset('assets/avatar-8 1.png')),
                                                              ),
                                                            )),
                                                        Positioned(
                                                            child: Transform
                                                                .translate(
                                                              offset:
                                                              const Offset(
                                                                  45, 0),
                                                              child:
                                                              Container(
                                                                width: 32,
                                                                height: 32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius.circular(
                                                                      15),
                                                                  color: const Color(
                                                                      0xffEEEEEE),
                                                                ),
                                                                child:
                                                                const Center(
                                                                    child:
                                                                    Text(
                                                                      '+12',
                                                                      style: TextStyle(
                                                                          color: Color(
                                                                              0xffE5646C),
                                                                          fontSize:
                                                                          14),
                                                                    )),
                                                              ),
                                                            )),
                                                      ],
                                                    ),
                                                  )
                                                      : const SizedBox(),
                                                ],
                                              ),
                                              const SizedBox(height: 10,),
                                              const Divider(
                                                color: Color(0xffEEEEEE),
                                                height: 10,

                                              ),
                                              const SizedBox(height: 10,),
                                              Row(
                                                children: [
                                                  SvgPicture.asset('assets/attach-circle.svg',height: 16,),
                                                  const SizedBox(width: 10,),
                                                  Text(model().War6[index],style: const TextStyle(color: Color(0xffC6C8CB),fontFamily: 'InterRegular',fontSize: 12),),
                                                  const SizedBox(width: 10,),
                                                  SvgPicture.asset('assets/comment-2.svg',height: 16,),
                                                  const SizedBox(width: 10,),
                                                  Text(model().War7[index],style: const TextStyle(color: Color(0xffC6C8CB),fontFamily: 'InterRegular',fontSize: 12),),
                                                  const SizedBox(width: 10,),
                                                  SvgPicture.asset('assets/link12.svg',height: 16,),
                                                  const SizedBox(width: 10,),
                                                  Text(model().ver3[index],style: const TextStyle(color: Color(0xffC6C8CB),fontFamily: 'InterRegular',fontSize: 12)),
                                                  const Spacer(),
                                                  Image.asset('assets/more.png',height: 16,),
                                                ],
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),

                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                       Text(
                                        'In Work',
                                        style: TextStyle(
                                            color: notifire.getblackcolor,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                            fontFamily: 'InterRegular'),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                          padding: const EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(12),
                                              color: notifire.getbgcolor11
                                          ),
                                          child: const Text(
                                            '12',
                                            style: TextStyle(
                                                fontFamily: 'InterRegular',
                                                fontSize: 12,
                                                color: Color(0xff9DA2A7)),
                                          )),
                                      const Spacer(),
                                      Image.asset('assets/add.png',height: 16,color: const Color(0xff9DA2A7)),
                                      const SizedBox(width: 10,),
                                      Image.asset(
                                        'assets/more.png',
                                        height: 16,color: const Color(0xff9DA2A7),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(

                                    child: ListView.builder(
                                        physics: const NeverScrollableScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      itemCount: model().Wor.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          margin:
                                          const EdgeInsets.only(bottom: 20),
                                          padding: const EdgeInsets.all(14),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(12),
                                            color: notifire.getbgcolor11,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              index == 0 ?  Image.asset('assets/image40.png',):const SizedBox(),
                                              index == 1 ?  Image.asset('assets/Media12.png',):const SizedBox(),
                                              const SizedBox(height: 10,),
                                              index ==  1 ?
                                              Row(
                                                children: [
                                                  Container(
                                                    width: 30,
                                                    height: 10,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5),
                                                      color: const Color(0xffB0E4C8),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 5,),
                                                  Container(
                                                    width: 30,
                                                    height: 10,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5),
                                                      color: const Color(0xffF8BEC1),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 5,),
                                                  Container(
                                                    width: 30,
                                                    height: 10,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5),
                                                      color: const Color(0xffA9DDF5),
                                                    ),
                                                  ),
                                                ],
                                              ): const SizedBox(),
                                              index ==  0 ?
                                              Row(
                                                children: [
                                                  Container(
                                                    width: 30,
                                                    height: 10,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5),
                                                      color: const Color(0xffD9B7FB),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 5,),
                                                  Container(
                                                    width: 30,
                                                    height: 10,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5),
                                                      color: const Color(0xffFFC9AC),
                                                    ),
                                                  ),

                                                ],
                                              ): const SizedBox(),
                                              index ==  2 ?
                                              Row(
                                                children: [
                                                  Container(
                                                    width: 30,
                                                    height: 10,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5),
                                                      color: const Color(0xffB0E4C8),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 5,),
                                                  Container(
                                                    width: 30,
                                                    height: 10,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5),
                                                      color: const Color(0xffF8BEC1),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 5,),
                                                  Container(
                                                    width: 30,
                                                    height: 10,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5),
                                                      color: const Color(0xffA9DDF5),
                                                    ),
                                                  ),
                                                ],
                                              ): const SizedBox(),
                                              const SizedBox(height: 10,),
                                              Row(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      model().Wor[index],
                                                      style:  TextStyle(
                                                          fontSize: 14,
                                                          fontFamily:
                                                          'InterRegular',
                                                          fontWeight:
                                                          FontWeight.w600,
                                                          color: notifire.getblackcolor),
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  Image.asset(
                                                    'assets/more.png',
                                                    height: 16,
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              index == 0
                                                  ? const Text(
                                                  'Review vendor rules and regulations',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color:
                                                      Color(0xff9DA2A7),
                                                      fontFamily:
                                                      'InterRegular'))
                                                  : const SizedBox(),
                                              index == 2
                                                  ? const Text(
                                                  'Review lead retrieval system',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color:
                                                      Color(0xff9DA2A7),
                                                      fontFamily:
                                                      'InterRegular'))
                                                  : const SizedBox(),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Text(model().ver1[index],style: const TextStyle(color: Color(0xff727880),fontFamily: 'InterRegular',fontSize: 12),),
                                                  const SizedBox(width: 10,),
                                                  index ==  0 ? const Expanded(
                                                    child: StepProgressIndicator(
                                                      totalSteps: 100,
                                                      currentStep: 32,
                                                      size: 5,
                                                      padding: 0,
                                                      selectedColor: Color(0xff7DC066),
                                                      unselectedColor: Color(0xffEEEEEE),
                                                      roundedEdges: Radius.circular(10),
                                                    ),
                                                  ): const SizedBox(),
                                                  index ==  1 ? const Expanded(
                                                    child: StepProgressIndicator(
                                                      totalSteps: 100,
                                                      currentStep: 80,
                                                      size: 5,
                                                      padding: 0,
                                                      selectedColor: Color(0xff7DC066),
                                                      unselectedColor: Color(0xffEEEEEE),
                                                      roundedEdges: Radius.circular(10),
                                                    ),
                                                  ): const SizedBox(),
                                                  index ==  2 ? const Expanded(
                                                    child: StepProgressIndicator(
                                                      totalSteps: 100,
                                                      currentStep: 60,
                                                      size: 5,
                                                      padding: 0,
                                                      selectedColor: Color(0xff7DC066),
                                                      unselectedColor: Color(0xffEEEEEE),
                                                      roundedEdges: Radius.circular(10),
                                                    ),
                                                  ): const SizedBox(),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    padding: const EdgeInsets.all(5),
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(12),
                                                      color: notifire.Getblg2,
                                                    ),
                                                    child: Center(
                                                      child: Row(
                                                        children: [
                                                          Image.asset('assets/timer.png',height: 16,color: const Color(0xff727880)),
                                                          const SizedBox(width: 10,),
                                                          Text(model().ver2[index],style: const TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880))),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  index == 0
                                                      ? Transform.translate(
                                                    offset: const Offset(
                                                        -50, 0),
                                                    child: Stack(
                                                      clipBehavior:
                                                      Clip.none,
                                                      children: [
                                                        Transform
                                                            .translate(
                                                          offset:
                                                          const Offset(
                                                              -30, 0),
                                                          child:
                                                          Container(
                                                            width: 32,
                                                            height: 32,
                                                            decoration:
                                                            BoxDecoration(
                                                              borderRadius:
                                                              BorderRadius.circular(
                                                                  15),
                                                            ),
                                                            child: Center(
                                                                child: Image
                                                                    .asset(
                                                                    'assets/avatar-6 1.png')),
                                                          ),
                                                        ),
                                                        Positioned(
                                                            left: -10,
                                                            child: Transform
                                                                .translate(
                                                              offset:
                                                              const Offset(
                                                                  5,
                                                                  0),
                                                              child:
                                                              Container(
                                                                width: 32,
                                                                height:
                                                                32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius.circular(15),
                                                                ),
                                                                child: Center(
                                                                    child:
                                                                    Image.asset('assets/avatar-7 1.png')),
                                                              ),
                                                            )),
                                                        Positioned(
                                                            left: 5,
                                                            child: Transform
                                                                .translate(
                                                              offset:
                                                              const Offset(
                                                                  15,
                                                                  0),
                                                              child:
                                                              Container(
                                                                width: 32,
                                                                height:
                                                                32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius.circular(15),
                                                                ),
                                                                child: Center(
                                                                    child:
                                                                    Image.asset('assets/avatar-8 1.png')),
                                                              ),
                                                            )),
                                                        Positioned(
                                                            child: Transform
                                                                .translate(
                                                              offset:
                                                              const Offset(
                                                                  45, 0),
                                                              child:
                                                              Container(
                                                                width: 32,
                                                                height: 32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius.circular(
                                                                      15),
                                                                  color: const Color(
                                                                      0xffEEEEEE),
                                                                ),
                                                                child:
                                                                const Center(
                                                                    child:
                                                                    Text(
                                                                      '+5',
                                                                      style: TextStyle(
                                                                          color: Color(
                                                                              0xffE5646C),
                                                                          fontSize:
                                                                          14),
                                                                    )),
                                                              ),
                                                            )),
                                                      ],
                                                    ),
                                                  )
                                                      : const SizedBox(),
                                                  index == 1
                                                      ? Transform.translate(
                                                    offset: const Offset(
                                                        -50, 0),
                                                    child: Stack(
                                                      clipBehavior:
                                                      Clip.none,
                                                      children: [
                                                        Positioned(
                                                            left: 5,
                                                            child: Transform
                                                                .translate(
                                                              offset:
                                                              const Offset(
                                                                  15,
                                                                  0),
                                                              child:
                                                              Container(
                                                                width: 32,
                                                                height:
                                                                32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius.circular(15),
                                                                ),
                                                                child: Center(
                                                                    child:
                                                                    Image.asset('assets/avatar-8 1.png')),
                                                              ),
                                                            )),
                                                        Positioned(
                                                            child: Transform
                                                                .translate(
                                                              offset:
                                                              const Offset(
                                                                  45, 0),
                                                              child:
                                                              Container(
                                                                width: 32,
                                                                height: 32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius.circular(
                                                                      15),
                                                                  color: const Color(
                                                                      0xffEEEEEE),
                                                                ),
                                                                child:
                                                                const Center(
                                                                    child:
                                                                    Text(
                                                                      '+16',
                                                                      style: TextStyle(
                                                                          color: Color(
                                                                              0xffE5646C),
                                                                          fontSize:
                                                                          14),
                                                                    )),
                                                              ),
                                                            )),
                                                      ],
                                                    ),
                                                  )
                                                      : const SizedBox(),
                                                  index == 2
                                                      ? Transform.translate(
                                                    offset: const Offset(
                                                        -50, 0),
                                                    child: Stack(
                                                      clipBehavior:
                                                      Clip.none,
                                                      children: [
                                                        Positioned(
                                                            left: -10,
                                                            child: Transform
                                                                .translate(
                                                              offset:
                                                              const Offset(
                                                                  5,
                                                                  0),
                                                              child:
                                                              Container(
                                                                width: 32,
                                                                height:
                                                                32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius.circular(15),
                                                                ),
                                                                child: Center(
                                                                    child:
                                                                    Image.asset('assets/avatar-7 1.png')),
                                                              ),
                                                            )),
                                                        Positioned(
                                                            left: 5,
                                                            child: Transform
                                                                .translate(
                                                              offset:
                                                              const Offset(
                                                                  15,
                                                                  0),
                                                              child:
                                                              Container(
                                                                width: 32,
                                                                height:
                                                                32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius.circular(15),
                                                                ),
                                                                child: Center(
                                                                    child:
                                                                    Image.asset('assets/avatar-8 1.png')),
                                                              ),
                                                            )),
                                                        Positioned(
                                                            child: Transform
                                                                .translate(
                                                              offset:
                                                              const Offset(
                                                                  45, 0),
                                                              child:
                                                              Container(
                                                                width: 32,
                                                                height: 32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius.circular(
                                                                      15),
                                                                  color: const Color(
                                                                      0xffEEEEEE),
                                                                ),
                                                                child:
                                                                const Center(
                                                                    child:
                                                                    Text(
                                                                      '+12',
                                                                      style: TextStyle(
                                                                          color: Color(
                                                                              0xffE5646C),
                                                                          fontSize:
                                                                          14),
                                                                    )),
                                                              ),
                                                            )),
                                                      ],
                                                    ),
                                                  )
                                                      : const SizedBox(),
                                                ],
                                              ),
                                              const SizedBox(height: 10,),
                                              const Divider(
                                                color: Color(0xffEEEEEE),
                                                height: 10,

                                              ),
                                              const SizedBox(height: 10,),
                                              Row(
                                                children: [
                                                  SvgPicture.asset('assets/attach-circle.svg',height: 16,),
                                                  const SizedBox(width: 10,),
                                                  Text(model().War6[index],style: const TextStyle(color: Color(0xffC6C8CB),fontFamily: 'InterRegular',fontSize: 12),),
                                                  const SizedBox(width: 10,),
                                                  SvgPicture.asset('assets/comment-2.svg',height: 16,),
                                                  const SizedBox(width: 10,),
                                                  Text(model().War7[index],style: const TextStyle(color: Color(0xffC6C8CB),fontFamily: 'InterRegular',fontSize: 12),),
                                                  const SizedBox(width: 10,),
                                                  SvgPicture.asset('assets/link12.svg',height: 16,),
                                                  const SizedBox(width: 10,),
                                                  Text(model().ver3[index],style: const TextStyle(color: Color(0xffC6C8CB),fontFamily: 'InterRegular',fontSize: 12)),
                                                  const Spacer(),
                                                  Image.asset('assets/more.png',height: 16,),
                                                ],
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),

                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                       Text(
                                        'Q & A',
                                        style: TextStyle(
                                            color: notifire.getblackcolor,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                            fontFamily: 'InterRegular'),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                          padding: const EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(12),
                                              color: notifire.getbgcolor11
                                          ),
                                          child: const Text(
                                            '12',
                                            style: TextStyle(
                                                fontFamily: 'InterRegular',
                                                fontSize: 12,
                                                color: Color(0xff9DA2A7)),
                                          )),
                                      const Spacer(),
                                      Image.asset('assets/add.png',height: 16,color: const Color(0xff9DA2A7)),
                                      const SizedBox(width: 10,),
                                      Image.asset(
                                        'assets/more.png',
                                        height: 16,color: const Color(0xff9DA2A7),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(
                                    child: ListView.builder(
                                        physics: const NeverScrollableScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      itemCount: model().Wor.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          margin:
                                          const EdgeInsets.only(bottom: 20),
                                          padding: const EdgeInsets.all(14),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(12),
                                            color: notifire.getbgcolor11,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              index == 0 ?  Image.asset('assets/Media12.png',):const SizedBox(),
                                              index == 1 ?  Image.asset('assets/image40.png',):const SizedBox(),
                                              const SizedBox(height: 10,),
                                              index ==  2 ?
                                              Row(
                                                children: [
                                                  Container(
                                                    width: 30,
                                                    height: 10,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5),
                                                      color: const Color(0xffB0E4C8),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 5,),
                                                  Container(
                                                    width: 30,
                                                    height: 10,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5),
                                                      color: const Color(0xffF8BEC1),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 5,),
                                                  Container(
                                                    width: 30,
                                                    height: 10,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5),
                                                      color: const Color(0xffA9DDF5),
                                                    ),
                                                  ),
                                                ],
                                              ): const SizedBox(),
                                              index ==  1 ?
                                              Row(
                                                children: [
                                                  Container(
                                                    width: 30,
                                                    height: 10,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5),
                                                      color: const Color(0xffD9B7FB),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 5,),
                                                  Container(
                                                    width: 30,
                                                    height: 10,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5),
                                                      color: const Color(0xffFFC9AC),
                                                    ),
                                                  ),

                                                ],
                                              ): const SizedBox(),
                                              index ==  0 ?
                                              Row(
                                                children: [
                                                  Container(
                                                    width: 30,
                                                    height: 10,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5),
                                                      color: const Color(0xffB0E4C8),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 5,),
                                                  Container(
                                                    width: 30,
                                                    height: 10,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5),
                                                      color: const Color(0xffF8BEC1),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 5,),
                                                  Container(
                                                    width: 30,
                                                    height: 10,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5),
                                                      color: const Color(0xffA9DDF5),
                                                    ),
                                                  ),
                                                ],
                                              ): const SizedBox(),
                                              const SizedBox(height: 10,),
                                              Row(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      model().Wor[index],
                                                      style:  TextStyle(
                                                          fontSize: 14,
                                                          fontFamily:
                                                          'InterRegular',
                                                          fontWeight:
                                                          FontWeight.w600,
                                                          color: notifire.getblackcolor),
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  Image.asset(
                                                    'assets/more.png',
                                                    height: 16,
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              index == 0
                                                  ? const Text(
                                                  'Review vendor rules and regulations',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color:
                                                      Color(0xff9DA2A7),
                                                      fontFamily:
                                                      'InterRegular'))
                                                  : const SizedBox(),
                                              index == 2
                                                  ? const Text(
                                                  'Review lead retrieval system',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color:
                                                      Color(0xff9DA2A7),
                                                      fontFamily:
                                                      'InterRegular'))
                                                  : const SizedBox(),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Text(model().ver1[index],style: const TextStyle(color: Color(0xff727880),fontFamily: 'InterRegular',fontSize: 12),),
                                                  const SizedBox(width: 10,),
                                                  index ==  0 ? const Expanded(
                                                    child: StepProgressIndicator(
                                                      totalSteps: 100,
                                                      currentStep: 32,
                                                      size: 5,
                                                      padding: 0,
                                                      selectedColor: Color(0xff7DC066),
                                                      unselectedColor: Color(0xffEEEEEE),
                                                      roundedEdges: Radius.circular(10),
                                                    ),
                                                  ): const SizedBox(),
                                                  index ==  1 ? const Expanded(
                                                    child: StepProgressIndicator(
                                                      totalSteps: 100,
                                                      currentStep: 80,
                                                      size: 5,
                                                      padding: 0,
                                                      selectedColor: Color(0xff7DC066),
                                                      unselectedColor: Color(0xffEEEEEE),
                                                      roundedEdges: Radius.circular(10),
                                                    ),
                                                  ): const SizedBox(),
                                                  index ==  2 ? const Expanded(
                                                    child: StepProgressIndicator(
                                                      totalSteps: 100,
                                                      currentStep: 60,
                                                      size: 5,
                                                      padding: 0,
                                                      selectedColor: Color(0xff7DC066),
                                                      unselectedColor: Color(0xffEEEEEE),
                                                      roundedEdges: Radius.circular(10),
                                                    ),
                                                  ): const SizedBox(),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    padding: const EdgeInsets.all(5),
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(12),
                                                      color: notifire.Getblg2,
                                                    ),
                                                    child: Center(
                                                      child: Row(
                                                        children: [
                                                          Image.asset('assets/timer.png',height: 16,color: const Color(0xff727880)),
                                                          const SizedBox(width: 10,),
                                                          Text(model().ver2[index],style: const TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880))),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  index == 0
                                                      ? Transform.translate(
                                                    offset: const Offset(
                                                        -50, 0),
                                                    child: Stack(
                                                      clipBehavior:
                                                      Clip.none,
                                                      children: [
                                                        Transform
                                                            .translate(
                                                          offset:
                                                          const Offset(
                                                              -30, 0),
                                                          child:
                                                          Container(
                                                            width: 32,
                                                            height: 32,
                                                            decoration:
                                                            BoxDecoration(
                                                              borderRadius:
                                                              BorderRadius.circular(
                                                                  15),
                                                            ),
                                                            child: Center(
                                                                child: Image
                                                                    .asset(
                                                                    'assets/avatar-6 1.png')),
                                                          ),
                                                        ),
                                                        Positioned(
                                                            left: -10,
                                                            child: Transform
                                                                .translate(
                                                              offset:
                                                              const Offset(
                                                                  5,
                                                                  0),
                                                              child:
                                                              Container(
                                                                width: 32,
                                                                height:
                                                                32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius.circular(15),
                                                                ),
                                                                child: Center(
                                                                    child:
                                                                    Image.asset('assets/avatar-7 1.png')),
                                                              ),
                                                            )),
                                                        Positioned(
                                                            left: 5,
                                                            child: Transform
                                                                .translate(
                                                              offset:
                                                              const Offset(
                                                                  15,
                                                                  0),
                                                              child:
                                                              Container(
                                                                width: 32,
                                                                height:
                                                                32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius.circular(15),
                                                                ),
                                                                child: Center(
                                                                    child:
                                                                    Image.asset('assets/avatar-8 1.png')),
                                                              ),
                                                            )),
                                                        Positioned(
                                                            child: Transform
                                                                .translate(
                                                              offset:
                                                              const Offset(
                                                                  45, 0),
                                                              child:
                                                              Container(
                                                                width: 32,
                                                                height: 32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius.circular(
                                                                      15),
                                                                  color: const Color(
                                                                      0xffEEEEEE),
                                                                ),
                                                                child:
                                                                const Center(
                                                                    child:
                                                                    Text(
                                                                      '+5',
                                                                      style: TextStyle(
                                                                          color: Color(
                                                                              0xffE5646C),
                                                                          fontSize:
                                                                          14),
                                                                    )),
                                                              ),
                                                            )),
                                                      ],
                                                    ),
                                                  )
                                                      : const SizedBox(),
                                                  index == 1
                                                      ? Transform.translate(
                                                    offset: const Offset(
                                                        -50, 0),
                                                    child: Stack(
                                                      clipBehavior:
                                                      Clip.none,
                                                      children: [
                                                        Positioned(
                                                            left: 5,
                                                            child: Transform
                                                                .translate(
                                                              offset:
                                                              const Offset(
                                                                  15,
                                                                  0),
                                                              child:
                                                              Container(
                                                                width: 32,
                                                                height:
                                                                32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius.circular(15),
                                                                ),
                                                                child: Center(
                                                                    child:
                                                                    Image.asset('assets/avatar-8 1.png')),
                                                              ),
                                                            )),
                                                        Positioned(
                                                            child: Transform
                                                                .translate(
                                                              offset:
                                                              const Offset(
                                                                  45, 0),
                                                              child:
                                                              Container(
                                                                width: 32,
                                                                height: 32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius.circular(
                                                                      15),
                                                                  color: const Color(
                                                                      0xffEEEEEE),
                                                                ),
                                                                child:
                                                                const Center(
                                                                    child:
                                                                    Text(
                                                                      '+16',
                                                                      style: TextStyle(
                                                                          color: Color(
                                                                              0xffE5646C),
                                                                          fontSize:
                                                                          14),
                                                                    )),
                                                              ),
                                                            )),
                                                      ],
                                                    ),
                                                  )
                                                      : const SizedBox(),
                                                  index == 2
                                                      ? Transform.translate(
                                                    offset: const Offset(
                                                        -50, 0),
                                                    child: Stack(
                                                      clipBehavior:
                                                      Clip.none,
                                                      children: [
                                                        Positioned(
                                                            left: -10,
                                                            child: Transform
                                                                .translate(
                                                              offset:
                                                              const Offset(
                                                                  5,
                                                                  0),
                                                              child:
                                                              Container(
                                                                width: 32,
                                                                height:
                                                                32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius.circular(15),
                                                                ),
                                                                child: Center(
                                                                    child:
                                                                    Image.asset('assets/avatar-7 1.png')),
                                                              ),
                                                            )),
                                                        Positioned(
                                                            left: 5,
                                                            child: Transform
                                                                .translate(
                                                              offset:
                                                              const Offset(
                                                                  15,
                                                                  0),
                                                              child:
                                                              Container(
                                                                width: 32,
                                                                height:
                                                                32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius.circular(15),
                                                                ),
                                                                child: Center(
                                                                    child:
                                                                    Image.asset('assets/avatar-8 1.png')),
                                                              ),
                                                            )),
                                                        Positioned(
                                                            child: Transform
                                                                .translate(
                                                              offset:
                                                              const Offset(
                                                                  45, 0),
                                                              child:
                                                              Container(
                                                                width: 32,
                                                                height: 32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius.circular(
                                                                      15),
                                                                  color: const Color(
                                                                      0xffEEEEEE),
                                                                ),
                                                                child:
                                                                const Center(
                                                                    child:
                                                                    Text(
                                                                      '+12',
                                                                      style: TextStyle(
                                                                          color: Color(
                                                                              0xffE5646C),
                                                                          fontSize:
                                                                          14),
                                                                    )),
                                                              ),
                                                            )),
                                                      ],
                                                    ),
                                                  )
                                                      : const SizedBox(),
                                                ],
                                              ),
                                              const SizedBox(height: 10,),
                                              const Divider(
                                                color: Color(0xffEEEEEE),
                                                height: 10,

                                              ),
                                              const SizedBox(height: 10,),
                                              Row(
                                                children: [
                                                  SvgPicture.asset('assets/attach-circle.svg',height: 16,),
                                                  const SizedBox(width: 10,),
                                                  Text(model().War6[index],style: const TextStyle(color: Color(0xffC6C8CB),fontFamily: 'InterRegular',fontSize: 12),),
                                                  const SizedBox(width: 10,),
                                                  SvgPicture.asset('assets/comment-2.svg',height: 16,),
                                                  const SizedBox(width: 10,),
                                                  Text(model().War7[index],style: const TextStyle(color: Color(0xffC6C8CB),fontFamily: 'InterRegular',fontSize: 12),),
                                                  const SizedBox(width: 10,),
                                                  SvgPicture.asset('assets/link12.svg',height: 16,),
                                                  const SizedBox(width: 10,),
                                                  Text(model().ver3[index],style: const TextStyle(color: Color(0xffC6C8CB),fontFamily: 'InterRegular',fontSize: 12)),
                                                  const Spacer(),
                                                  Image.asset('assets/more.png',height: 16,),
                                                ],
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),

                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                       Text(
                                        'Archive',
                                        style: TextStyle(
                                            color: notifire.getblackcolor,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                            fontFamily: 'InterRegular'),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                          padding: const EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(12),
                                            color: notifire.getbgcolor11,
                                          ),
                                          child: const Text(
                                            '6',
                                            style: TextStyle(
                                                fontFamily: 'InterRegular',
                                                fontSize: 12,
                                                color: Color(0xff9DA2A7)),
                                          )),
                                      const Spacer(),
                                      Image.asset('assets/add.png',height: 16,color: const Color(0xff9DA2A7)),
                                      const SizedBox(width: 10,),
                                      Image.asset(
                                        'assets/more.png',
                                        height: 16,color: const Color(0xff9DA2A7),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(
                                    child: ListView.builder(
                                        physics: const NeverScrollableScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      itemCount: model().Wor.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          margin:
                                          const EdgeInsets.only(bottom: 20),
                                          padding: const EdgeInsets.all(14),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(12),
                                            color: notifire.getbgcolor11,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              index == 1 ?  Image.asset('assets/image40.png',):const SizedBox(),
                                             //
                                              index == 2 ?  Image.asset('assets/Media12.png',):const SizedBox(),

                                              const SizedBox(height: 10,),
                                              index ==  2 ?
                                              Row(
                                                children: [
                                                  Container(
                                                    width: 30,
                                                    height: 10,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5),
                                                      color: const Color(0xffB0E4C8),
                                                    ),
                                                  ),
                                                ],
                                              ): const SizedBox(),
                                              index ==  1 ?
                                              Row(
                                                children: [
                                                  Container(
                                                    width: 30,
                                                    height: 10,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5),
                                                      color: const Color(0xffD9B7FB),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 5,),
                                                  Container(
                                                    width: 30,
                                                    height: 10,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5),
                                                      color: const Color(0xffFFC9AC),
                                                    ),
                                                  ),

                                                ],
                                              ): const SizedBox(),
                                              index ==  0 ?
                                              Row(
                                                children: [
                                                  Container(
                                                    width: 30,
                                                    height: 10,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5),
                                                      color: const Color(0xffB0E4C8),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 5,),
                                                  Container(
                                                    width: 30,
                                                    height: 10,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5),
                                                      color: const Color(0xffF8BEC1),
                                                    ),
                                                  ),

                                                ],
                                              ): const SizedBox(),
                                              const SizedBox(height: 10,),
                                              Row(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      model().Wor[index],
                                                      style:  TextStyle(
                                                          fontSize: 14,
                                                          fontFamily:
                                                          'InterRegular',
                                                          fontWeight:
                                                          FontWeight.w600,
                                                          color: notifire.getblackcolor),
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  Image.asset(
                                                    'assets/more.png',
                                                    height: 16,
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              index == 0
                                                  ? const Text(
                                                  'Review vendor rules and regulations',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color:
                                                      Color(0xff9DA2A7),
                                                      fontFamily:
                                                      'InterRegular'))
                                                  : const SizedBox(),
                                              index == 2
                                                  ? const Text(
                                                  'Review lead retrieval system',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color:
                                                      Color(0xff9DA2A7),
                                                      fontFamily:
                                                      'InterRegular'))
                                                  : const SizedBox(),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Text(model().ver1[index],style: const TextStyle(color: Color(0xff727880),fontFamily: 'InterRegular',fontSize: 12),),
                                                  const SizedBox(width: 10,),
                                                  index ==  0 ? const Expanded(
                                                    child: StepProgressIndicator(
                                                      totalSteps: 100,
                                                      currentStep: 32,
                                                      size: 5,
                                                      padding: 0,
                                                      selectedColor: Color(0xff7DC066),
                                                      unselectedColor: Color(0xffEEEEEE),
                                                      roundedEdges: Radius.circular(10),
                                                    ),
                                                  ): const SizedBox(),
                                                  index ==  1 ? const Expanded(
                                                    child: StepProgressIndicator(
                                                      totalSteps: 100,
                                                      currentStep: 80,
                                                      size: 5,
                                                      padding: 0,
                                                      selectedColor: Color(0xff7DC066),
                                                      unselectedColor: Color(0xffEEEEEE),
                                                      roundedEdges: Radius.circular(10),
                                                    ),
                                                  ): const SizedBox(),
                                                  index ==  2 ? const Expanded(
                                                    child: StepProgressIndicator(
                                                      totalSteps: 100,
                                                      currentStep: 60,
                                                      size: 5,
                                                      padding: 0,
                                                      selectedColor: Color(0xff7DC066),
                                                      unselectedColor: Color(0xffEEEEEE),
                                                      roundedEdges: Radius.circular(10),
                                                    ),
                                                  ): const SizedBox(),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    padding: const EdgeInsets.all(5),
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(12),
                                                      color: notifire.Getblg2,
                                                    ),
                                                    child: Center(
                                                      child: Row(
                                                        children: [
                                                          Image.asset('assets/timer.png',height: 16,color: const Color(0xff727880)),
                                                          const SizedBox(width: 10,),
                                                          Text(model().ver2[index],style: const TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880))),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  index == 0
                                                      ? Transform.translate(
                                                    offset: const Offset(
                                                        -50, 0),
                                                    child: Stack(
                                                      clipBehavior:
                                                      Clip.none,
                                                      children: [
                                                        Transform
                                                            .translate(
                                                          offset:
                                                          const Offset(
                                                              -30, 0),
                                                          child:
                                                          Container(
                                                            width: 32,
                                                            height: 32,
                                                            decoration:
                                                            BoxDecoration(
                                                              borderRadius:
                                                              BorderRadius.circular(
                                                                  15),
                                                            ),
                                                            child: Center(
                                                                child: Image
                                                                    .asset(
                                                                    'assets/avatar-6 1.png')),
                                                          ),
                                                        ),
                                                        Positioned(
                                                            left: -10,
                                                            child: Transform
                                                                .translate(
                                                              offset:
                                                              const Offset(
                                                                  5,
                                                                  0),
                                                              child:
                                                              Container(
                                                                width: 32,
                                                                height:
                                                                32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius.circular(15),
                                                                ),
                                                                child: Center(
                                                                    child:
                                                                    Image.asset('assets/avatar-7 1.png')),
                                                              ),
                                                            )),
                                                        Positioned(
                                                            left: 5,
                                                            child: Transform
                                                                .translate(
                                                              offset:
                                                              const Offset(
                                                                  15,
                                                                  0),
                                                              child:
                                                              Container(
                                                                width: 32,
                                                                height:
                                                                32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius.circular(15),
                                                                ),
                                                                child: Center(
                                                                    child:
                                                                    Image.asset('assets/avatar-8 1.png')),
                                                              ),
                                                            )),
                                                        Positioned(
                                                            child: Transform
                                                                .translate(
                                                              offset:
                                                              const Offset(
                                                                  45, 0),
                                                              child:
                                                              Container(
                                                                width: 32,
                                                                height: 32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius.circular(
                                                                      15),
                                                                  color: const Color(
                                                                      0xffEEEEEE),
                                                                ),
                                                                child:
                                                                const Center(
                                                                    child:
                                                                    Text(
                                                                      '+5',
                                                                      style: TextStyle(
                                                                          color: Color(
                                                                              0xffE5646C),
                                                                          fontSize:
                                                                          14),
                                                                    )),
                                                              ),
                                                            )),
                                                      ],
                                                    ),
                                                  )
                                                      : const SizedBox(),
                                                  index == 1
                                                      ? Transform.translate(
                                                    offset: const Offset(
                                                        -50, 0),
                                                    child: Stack(
                                                      clipBehavior:
                                                      Clip.none,
                                                      children: [
                                                        Positioned(
                                                            left: 5,
                                                            child: Transform
                                                                .translate(
                                                              offset:
                                                              const Offset(
                                                                  15,
                                                                  0),
                                                              child:
                                                              Container(
                                                                width: 32,
                                                                height:
                                                                32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius.circular(15),
                                                                ),
                                                                child: Center(
                                                                    child:
                                                                    Image.asset('assets/avatar-8 1.png')),
                                                              ),
                                                            )),
                                                        Positioned(
                                                            child: Transform
                                                                .translate(
                                                              offset:
                                                              const Offset(
                                                                  45, 0),
                                                              child:
                                                              Container(
                                                                width: 32,
                                                                height: 32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius.circular(
                                                                      15),
                                                                  color: const Color(
                                                                      0xffEEEEEE),
                                                                ),
                                                                child:
                                                                const Center(
                                                                    child:
                                                                    Text(
                                                                      '+16',
                                                                      style: TextStyle(
                                                                          color: Color(
                                                                              0xffE5646C),
                                                                          fontSize:
                                                                          14),
                                                                    )),
                                                              ),
                                                            )),
                                                      ],
                                                    ),
                                                  )
                                                      : const SizedBox(),
                                                  index == 2
                                                      ? Transform.translate(
                                                    offset: const Offset(
                                                        -50, 0),
                                                    child: Stack(
                                                      clipBehavior:
                                                      Clip.none,
                                                      children: [
                                                        Positioned(
                                                            left: -10,
                                                            child: Transform
                                                                .translate(
                                                              offset:
                                                              const Offset(
                                                                  5,
                                                                  0),
                                                              child:
                                                              Container(
                                                                width: 32,
                                                                height:
                                                                32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius.circular(15),
                                                                ),
                                                                child: Center(
                                                                    child:
                                                                    Image.asset('assets/avatar-7 1.png')),
                                                              ),
                                                            )),
                                                        Positioned(
                                                            left: 5,
                                                            child: Transform
                                                                .translate(
                                                              offset:
                                                              const Offset(
                                                                  15,
                                                                  0),
                                                              child:
                                                              Container(
                                                                width: 32,
                                                                height:
                                                                32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius.circular(15),
                                                                ),
                                                                child: Center(
                                                                    child:
                                                                    Image.asset('assets/avatar-8 1.png')),
                                                              ),
                                                            )),
                                                        Positioned(
                                                            child: Transform
                                                                .translate(
                                                              offset:
                                                              const Offset(
                                                                  45, 0),
                                                              child:
                                                              Container(
                                                                width: 32,
                                                                height: 32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius.circular(
                                                                      15),
                                                                  color: const Color(
                                                                      0xffEEEEEE),
                                                                ),
                                                                child:
                                                                const Center(
                                                                    child:
                                                                    Text(
                                                                      '+12',
                                                                      style: TextStyle(
                                                                          color: Color(
                                                                              0xffE5646C),
                                                                          fontSize:
                                                                          14),
                                                                    )),
                                                              ),
                                                            )),
                                                      ],
                                                    ),
                                                  )
                                                      : const SizedBox(),
                                                ],
                                              ),
                                              const SizedBox(height: 10,),
                                              const Divider(
                                                color: Color(0xffEEEEEE),
                                                height: 10,

                                              ),
                                              const SizedBox(height: 10,),
                                              Row(
                                                children: [
                                                  SvgPicture.asset('assets/attach-circle.svg',height: 16,),
                                                  const SizedBox(width: 10,),
                                                  Text(model().War6[index],style: const TextStyle(color: Color(0xffC6C8CB),fontFamily: 'InterRegular',fontSize: 12),),
                                                  const SizedBox(width: 10,),
                                                  SvgPicture.asset('assets/comment-2.svg',height: 16,),
                                                  const SizedBox(width: 10,),
                                                  Text(model().War7[index],style: const TextStyle(color: Color(0xffC6C8CB),fontFamily: 'InterRegular',fontSize: 12),),
                                                  const SizedBox(width: 10,),
                                                  SvgPicture.asset('assets/link12.svg',height: 16,),
                                                  const SizedBox(width: 10,),
                                                  Text(model().ver3[index],style: const TextStyle(color: Color(0xffC6C8CB),fontFamily: 'InterRegular',fontSize: 12)),
                                                  const Spacer(),
                                                  Image.asset('assets/more.png',height: 16,),
                                                ],
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ],
                        ),
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                   Text(
                                    'Backlogs',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'InterRegular',
                                      fontSize: 16,color:notifire.getblackcolor,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: const Color(0xffEEEEEE),
                                      ),
                                      child: const Text(
                                        '4',
                                        style: TextStyle(
                                            fontFamily: 'InterRegular',
                                            fontSize: 12,
                                            color: Color(0xff727880)),
                                      )),
                                ],
                              ),
                              const SizedBox(height: 10,),
                              Container(
                                padding: const EdgeInsets.all(15),
                                width: Get.width,
                                decoration: BoxDecoration(
                                  color:notifire.getbgcolor11,

                                    borderRadius: BorderRadius.circular(15)),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: constraints < 1400 ? 1500 : Get.width,
                                        child: Table(
                                          border: TableBorder.all(color: Colors.transparent),
                                          columnWidths: const <int, TableColumnWidth>{
                                            0: FixedColumnWidth(130),
                                            1: FixedColumnWidth(300),
                                            2: FixedColumnWidth(250),
                                            3: FixedColumnWidth(300),
                                            4: FixedColumnWidth(150),
                                            5: FixedColumnWidth(150),
                                            6: FixedColumnWidth(50),
                                          },
                                          children: <TableRow>[
                                            TableRow(
                                              children: <Widget>[
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 18, left: 3),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        padding: const EdgeInsets.all(5),
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(12),
                                                          color: const Color(0xffF5F5F5),
                                                        ),
                                                        child: Center(
                                                          child: Row(
                                                            children: [
                                                              Image.asset('assets/timer.png',height: 16,color: const Color(0xff727880)),
                                                              const SizedBox(width: 10,),
                                                              const Text('May 17',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880))),
                                                            ],
                                                          ),
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                 Padding(
                                                  padding: const EdgeInsets.only(top: 22, left: 8),
                                                  child: Text(
                                                    'Various versions have evolved over',
                                                    style: TextStyle(
                                                        fontFamily: 'InterRegular',
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 14,
                                                        color: notifire.getblackcolor),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 18, left: 3),
                                                  child: Row(
                                                    children: [
                                                      Container(

                                                        padding:
                                                        const EdgeInsets.all(6),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                          color:const Color(0xffB0E4C8),
                                                        ),
                                                        child: const Row(
                                                          children: [
                                                            Center(
                                                                child: Text('UI',
                                                                    style: TextStyle(

                                                                      fontFamily:
                                                                      'InterRegular',
                                                                      fontSize: 12,
                                                                    ))),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(width: 10,),
                                                      Container(padding:
                                                      const EdgeInsets.all(6),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                          color:const Color(0xffA9DDF5),
                                                        ),
                                                        child: const Row(
                                                          children: [
                                                            Center(
                                                                child: Text('IOS',
                                                                    style: TextStyle(

                                                                      fontFamily:
                                                                      'InterRegular',
                                                                      fontSize: 12,
                                                                    ))),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(width: 10,),
                                                      Container(padding:
                                                      const EdgeInsets.all(6),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                          color:const Color(0xffF8BEC1),
                                                        ),
                                                        child: const Row(
                                                          children: [
                                                            Center(
                                                                child: Text('Research',
                                                                    style: TextStyle(

                                                                      fontFamily:
                                                                      'InterRegular',
                                                                      fontSize: 12,
                                                                    ))),
                                                          ],
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(top: 25, left: 8),
                                                  child:  Row(
                                                    children: [
                                                      Text('5/34',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880),),),
                                                      SizedBox(width: 10,),
                                                      SizedBox(
                                                        width: 150,
                                                        child: StepProgressIndicator(
                                                          totalSteps: 100,
                                                          currentStep: 60,
                                                          size: 5,
                                                          padding: 0,
                                                          selectedColor: Color(0xff7DC066),
                                                          unselectedColor: Color(0xffEEEEEE),
                                                          roundedEdges: Radius.circular(10),
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 5, top: 18),
                                                  child: Transform.translate(
                                                    offset: const Offset(
                                                        -50, 0),
                                                    child: Stack(
                                                      clipBehavior:
                                                      Clip.none,
                                                      children: [
                                                        Positioned(
                                                            left: 5,
                                                            child: Transform
                                                                .translate(
                                                              offset:
                                                              const Offset(
                                                                  15,
                                                                  0),
                                                              child:
                                                              Container(
                                                                width: 32,
                                                                height:
                                                                32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius.circular(15),
                                                                ),
                                                                child: Center(
                                                                    child:
                                                                    Image.asset('assets/avatar-8 1.png')),
                                                              ),
                                                            )),
                                                        Positioned(
                                                            child: Transform
                                                                .translate(
                                                              offset:
                                                              const Offset(
                                                                  45, 0),
                                                              child:
                                                              Container(
                                                                width: 32,
                                                                height: 32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius.circular(
                                                                      15),
                                                                  color: const Color(
                                                                      0xffEEEEEE),
                                                                ),
                                                                child:
                                                                const Center(
                                                                    child:
                                                                    Text(
                                                                      '+16',
                                                                      style: TextStyle(
                                                                          color: Color(
                                                                              0xffE5646C),
                                                                          fontSize:
                                                                          14),
                                                                    )),
                                                              ),
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 25, left: 8),
                                                  child:  Row(
                                                    children: [
                                                      Image.asset('assets/profile-add.png',height: 16,color: const Color(0xff9DA2A7),)
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 25, left: 8),
                                                  child: Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),),
                                                ),

                                              ],
                                            ),
                                            TableRow(
                                              children: <Widget>[
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 18, left: 3),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        padding: const EdgeInsets.all(5),
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(12),
                                                          color: const Color(0xffF5F5F5),
                                                        ),
                                                        child: Center(
                                                          child: Row(
                                                            children: [
                                                              Image.asset('assets/timer.png',height: 16,color: const Color(0xff727880)),
                                                              const SizedBox(width: 10,),
                                                              const Text('May 20',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880))),
                                                            ],
                                                          ),
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 22, left: 8),
                                                  child: Text(
                                                    'versions have evolved over Various',
                                                    style: TextStyle(
                                                        fontFamily: 'InterRegular',
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 14,
                                                        color: notifire.getblackcolor),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 18, left: 3),
                                                  child: Row(
                                                    children: [
                                                      Container(

                                                        padding:
                                                        const EdgeInsets.all(6),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                          color:const Color(0xffD9B7FB),
                                                        ),
                                                        child: const Row(
                                                          children: [
                                                            Center(
                                                                child: Text('Web',
                                                                    style: TextStyle(

                                                                      fontFamily:
                                                                      'InterRegular',
                                                                      fontSize: 12,
                                                                    ))),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(width: 10,),
                                                      Container(padding:
                                                      const EdgeInsets.all(6),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                          color:const Color(0xffFFC9AC),
                                                        ),
                                                        child: const Row(
                                                          children: [
                                                            Center(
                                                                child: Text('Android',
                                                                    style: TextStyle(

                                                                      fontFamily:
                                                                      'InterRegular',
                                                                      fontSize: 12,
                                                                    ))),
                                                          ],
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(top: 25, left: 8),
                                                  child:  Row(
                                                    children: [
                                                      Text('2/24',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880),),),
                                                      SizedBox(width: 10,),
                                                      SizedBox(
                                                        width: 150,
                                                        child: StepProgressIndicator(
                                                          totalSteps: 100,
                                                          currentStep: 80,
                                                          size: 5,
                                                          padding: 0,
                                                          selectedColor: Color(0xff7DC066),
                                                          unselectedColor: Color(0xffEEEEEE),
                                                          roundedEdges: Radius.circular(10),
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 5, top: 18),
                                                  child: Transform.translate(
                                                    offset: const Offset(0, 0),
                                                    child: Stack(
                                                      clipBehavior: Clip.none,
                                                      children: [
                                                        Transform.translate(
                                                          offset: const Offset(-30, 0),
                                                          child: Container(
                                                            width: 32,
                                                            height: 32,
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(15),
                                                            ),
                                                            child:
                                                            Center(child: Image.asset('assets/avatar-6 1.png')),
                                                          ),
                                                        ),
                                                        Positioned(
                                                            left: -10,
                                                            child: Transform.translate(
                                                              offset: const Offset(5, 0),
                                                              child: Container(
                                                                width: 32,
                                                                height: 32,
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(15),
                                                                ),
                                                                child: Center(
                                                                    child: Image.asset('assets/avatar-7 1.png')),
                                                              ),
                                                            )),
                                                        Positioned(
                                                            left: 5,
                                                            child: Transform.translate(
                                                              offset: const Offset(15, 0),
                                                              child: Container(
                                                                width: 32,
                                                                height: 32,
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(15),
                                                                ),
                                                                child: Center(
                                                                    child: Image.asset('assets/avatar-8 1.png')),
                                                              ),
                                                            )),
                                                        Positioned(
                                                            child: Transform.translate(
                                                              offset: const Offset(45, 0),
                                                              child: Container(
                                                                width: 32,
                                                                height: 32,
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(15),
                                                                  color: const Color(0xffEEEEEE),
                                                                ),
                                                                child: const Center(
                                                                    child: Text(
                                                                      '+5',
                                                                      style:
                                                                      TextStyle(color: Color(0xffE5646C), fontSize: 14),
                                                                    )),
                                                              ),
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 25, left: 8),
                                                  child:  Row(
                                                    children: [
                                                      Image.asset('assets/profile-add.png',height: 16,color: const Color(0xff9DA2A7),)
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 25, left: 8),
                                                  child: Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),),
                                                ),

                                              ],
                                            ),
                                            TableRow(
                                              children: <Widget>[
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 18, left: 3),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        padding: const EdgeInsets.all(5),
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(12),
                                                          color: const Color(0xffF5F5F5),
                                                        ),
                                                        child: Center(
                                                          child: Row(
                                                            children: [
                                                              Image.asset('assets/timer.png',height: 16,color: const Color(0xff727880)),
                                                              const SizedBox(width: 10,),
                                                              const Text('Nov 10',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880))),
                                                            ],
                                                          ),
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 22, left: 8),
                                                  child: Text(
                                                    'All the Lorem Ipsum generators',
                                                    style: TextStyle(
                                                        fontFamily: 'InterRegular',
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 14,
                                                        color: notifire.getblackcolor),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 18, left: 3),
                                                  child: Row(
                                                    children: [
                                                      Container(

                                                        padding:
                                                        const EdgeInsets.all(6),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                          color:const Color(0xffA9DDF5),
                                                        ),
                                                        child: const Row(
                                                          children: [
                                                            Center(
                                                                child: Text('Web',
                                                                    style: TextStyle(

                                                                      fontFamily:
                                                                      'InterRegular',
                                                                      fontSize: 12,
                                                                    ))),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(width: 10,),
                                                      Container(padding:
                                                      const EdgeInsets.all(6),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                          color:const Color(0xffFFC9AC),
                                                        ),
                                                        child: const Row(
                                                          children: [
                                                            Center(
                                                                child: Text('IOS',
                                                                    style: TextStyle(

                                                                      fontFamily:
                                                                      'InterRegular',
                                                                      fontSize: 12,
                                                                    ))),
                                                          ],
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(top: 25, left: 8),
                                                  child:  Row(
                                                    children: [
                                                      Text('2/24',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880),),),
                                                      SizedBox(width: 10,),
                                                      SizedBox(
                                                        width: 150,
                                                        child: StepProgressIndicator(
                                                          totalSteps: 100,
                                                          currentStep: 30,
                                                          size: 5,
                                                          padding: 0,
                                                          selectedColor: Color(0xff7DC066),
                                                          unselectedColor: Color(0xffEEEEEE),
                                                          roundedEdges: Radius.circular(10),
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 5, top: 18),
                                                  child: Transform.translate(
                                                    offset: const Offset(0, 0),
                                                    child: Stack(
                                                      clipBehavior: Clip.none,
                                                      children: [
                                                        Transform.translate(
                                                          offset: const Offset(-30, 0),
                                                          child: Container(
                                                            width: 32,
                                                            height: 32,
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(15),
                                                            ),
                                                            child:
                                                            Center(child: Image.asset('assets/avatar-7 1.png')),
                                                          ),
                                                        ),
                                                        Positioned(
                                                            left: -10,
                                                            child: Transform.translate(
                                                              offset: const Offset(5, 0),
                                                              child: Container(
                                                                width: 32,
                                                                height: 32,
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(15),
                                                                ),
                                                                child: Center(
                                                                    child: Image.asset('assets/avatar-6 1.png')),
                                                              ),
                                                            )),

                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 25, left: 8),
                                                  child:  Row(
                                                    children: [
                                                      Image.asset('assets/profile-add.png',height: 16,color: const Color(0xff9DA2A7),)
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 25, left: 8),
                                                  child: Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),),
                                                ),

                                              ],
                                            ),
                                            TableRow(
                                              children: <Widget>[
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 18, left: 3),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        padding: const EdgeInsets.all(5),
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(12),
                                                          color: const Color(0xffF5F5F5),
                                                        ),
                                                        child: Center(
                                                          child: Row(
                                                            children: [
                                                              Image.asset('assets/timer.png',height: 16,color: const Color(0xff727880)),
                                                              const SizedBox(width: 10,),
                                                              const Text('May 20',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880))),
                                                            ],
                                                          ),
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 22, left: 8),
                                                  child: Text(
                                                    'versions have evolved over Various',
                                                    style: TextStyle(
                                                        fontFamily: 'InterRegular',
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 14,
                                                        color: notifire.getblackcolor),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 18, left: 3),
                                                  child: Row(
                                                    children: [
                                                      Container(

                                                        padding:
                                                        const EdgeInsets.all(6),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                          color:const Color(0xffD9B7FB),
                                                        ),
                                                        child: const Row(
                                                          children: [
                                                            Center(
                                                                child: Text('Web',
                                                                    style: TextStyle(

                                                                      fontFamily:
                                                                      'InterRegular',
                                                                      fontSize: 12,
                                                                    ))),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(width: 10,),
                                                      Container(padding:
                                                      const EdgeInsets.all(6),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                          color:const Color(0xffFFC9AC),
                                                        ),
                                                        child: const Row(
                                                          children: [
                                                            Center(
                                                                child: Text('Android',
                                                                    style: TextStyle(

                                                                      fontFamily:
                                                                      'InterRegular',
                                                                      fontSize: 12,
                                                                    ))),
                                                          ],
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(top: 25, left: 8),
                                                  child:  Row(
                                                    children: [
                                                      Text('2/24',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880),),),
                                                      SizedBox(width: 10,),
                                                      SizedBox(
                                                        width: 150,
                                                        child: StepProgressIndicator(
                                                          totalSteps: 100,
                                                          currentStep: 80,
                                                          size: 5,
                                                          padding: 0,
                                                          selectedColor: Color(0xff7DC066),
                                                          unselectedColor: Color(0xffEEEEEE),
                                                          roundedEdges: Radius.circular(10),
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 5, top: 18),
                                                  child: Transform.translate(
                                                    offset: const Offset(0, 0),
                                                    child: Stack(
                                                      clipBehavior: Clip.none,
                                                      children: [
                                                        Transform.translate(
                                                          offset: const Offset(-30, 0),
                                                          child: Container(
                                                            width: 32,
                                                            height: 32,
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(15),
                                                            ),
                                                            child:
                                                            Center(child: Image.asset('assets/avatar-6 1.png')),
                                                          ),
                                                        ),
                                                        Positioned(
                                                            left: -10,
                                                            child: Transform.translate(
                                                              offset: const Offset(5, 0),
                                                              child: Container(
                                                                width: 32,
                                                                height: 32,
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(15),
                                                                ),
                                                                child: Center(
                                                                    child: Image.asset('assets/avatar-7 1.png')),
                                                              ),
                                                            )),
                                                        Positioned(
                                                            left: 5,
                                                            child: Transform.translate(
                                                              offset: const Offset(15, 0),
                                                              child: Container(
                                                                width: 32,
                                                                height: 32,
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(15),
                                                                ),
                                                                child: Center(
                                                                    child: Image.asset('assets/avatar-8 1.png')),
                                                              ),
                                                            )),
                                                        Positioned(
                                                            child: Transform.translate(
                                                              offset: const Offset(45, 0),
                                                              child: Container(
                                                                width: 32,
                                                                height: 32,
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(15),
                                                                  color: const Color(0xffEEEEEE),
                                                                ),
                                                                child: const Center(
                                                                    child: Text(
                                                                      '+5',
                                                                      style:
                                                                      TextStyle(color: Color(0xffE5646C), fontSize: 14),
                                                                    )),
                                                              ),
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 25, left: 8),
                                                  child:  Row(
                                                    children: [
                                                      Image.asset('assets/profile-add.png',height: 16,color: const Color(0xff9DA2A7),)
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 25, left: 8),
                                                  child: Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),),
                                                ),

                                              ],
                                            ),
                                            TableRow(
                                              children: <Widget>[
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 18, left: 3),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        padding: const EdgeInsets.all(5),
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(12),
                                                          color: const Color(0xffF5F5F5),
                                                        ),
                                                        child: Center(
                                                          child: Row(
                                                            children: [
                                                              Image.asset('assets/timer.png',height: 16,color: const Color(0xff727880)),
                                                              const SizedBox(width: 10,),
                                                              const Text('Nov 10',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880))),
                                                            ],
                                                          ),
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 22, left: 8),
                                                  child: Text(
                                                    'All the Lorem Ipsum generators',
                                                    style: TextStyle(
                                                        fontFamily: 'InterRegular',
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 14,
                                                        color: notifire.getblackcolor),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 18, left: 3),
                                                  child: Row(
                                                    children: [
                                                      Container(

                                                        padding:
                                                        const EdgeInsets.all(6),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                          color:const Color(0xffA9DDF5),
                                                        ),
                                                        child: const Row(
                                                          children: [
                                                            Center(
                                                                child: Text('Web',
                                                                    style: TextStyle(

                                                                      fontFamily:
                                                                      'InterRegular',
                                                                      fontSize: 12,
                                                                    ))),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(width: 10,),
                                                      Container(padding:
                                                      const EdgeInsets.all(6),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                          color:const Color(0xffFFC9AC),
                                                        ),
                                                        child: const Row(
                                                          children: [
                                                            Center(
                                                                child: Text('IOS',
                                                                    style: TextStyle(

                                                                      fontFamily:
                                                                      'InterRegular',
                                                                      fontSize: 12,
                                                                    ))),
                                                          ],
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(top: 25, left: 8),
                                                  child:  Row(
                                                    children: [
                                                      Text('2/24',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880),),),
                                                      SizedBox(width: 10,),
                                                      SizedBox(
                                                        width: 150,
                                                        child: StepProgressIndicator(
                                                          totalSteps: 100,
                                                          currentStep: 30,
                                                          size: 5,
                                                          padding: 0,
                                                          selectedColor: Color(0xff7DC066),
                                                          unselectedColor: Color(0xffEEEEEE),
                                                          roundedEdges: Radius.circular(10),
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 5, top: 18),
                                                  child: Transform.translate(
                                                    offset: const Offset(0, 0),
                                                    child: Stack(
                                                      clipBehavior: Clip.none,
                                                      children: [
                                                        Transform.translate(
                                                          offset: const Offset(-30, 0),
                                                          child: Container(
                                                            width: 32,
                                                            height: 32,
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(15),
                                                            ),
                                                            child:
                                                            Center(child: Image.asset('assets/avatar-7 1.png')),
                                                          ),
                                                        ),
                                                        Positioned(
                                                            left: -10,
                                                            child: Transform.translate(
                                                              offset: const Offset(5, 0),
                                                              child: Container(
                                                                width: 32,
                                                                height: 32,
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(15),
                                                                ),
                                                                child: Center(
                                                                    child: Image.asset('assets/avatar-6 1.png')),
                                                              ),
                                                            )),

                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 25, left: 8),
                                                  child:  Row(
                                                    children: [
                                                      Image.asset('assets/profile-add.png',height: 16,color: const Color(0xff9DA2A7),)
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 25, left: 8),
                                                  child: Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),),
                                                ),

                                              ],
                                            ),
                                            const TableRow(children: [

                                              Padding(
                                                padding: EdgeInsets.only(top: 10),
                                                child: Divider(
                                                  height: 10,
                                                  color: Colors.transparent,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(top: 10),
                                                child: Divider(
                                                  height: 10,
                                                  color: Colors.transparent,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(top: 10),
                                                child: Divider(
                                                  height: 10,
                                                  color: Colors.transparent,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(top: 10),
                                                child: Divider(
                                                  height: 10,
                                                  color: Colors.transparent,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(top: 10),
                                                child: Divider(
                                                  height: 10,
                                                  color: Colors.transparent,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(top: 10),
                                                child: Divider(
                                                  height: 10,
                                                  color: Colors.transparent,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(top: 10),
                                                child: Divider(
                                                  height: 10,
                                                  color: Colors.transparent,
                                                ),
                                              ),
                                            ]),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10,),

                              Row(
                                children: [
                                   Text(
                                    'In Work',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'InterRegular',color: notifire.getblackcolor,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: const Color(0xffEEEEEE),
                                      ),
                                      child: const Text(
                                        '4',
                                        style: TextStyle(
                                            fontFamily: 'InterRegular',
                                            fontSize: 12,
                                            color: Color(0xff727880)),
                                      )),
                                ],
                              ),
                              const SizedBox(height: 10,),
                              Container(
                                padding: const EdgeInsets.all(15),
                                width: Get.width,
                                decoration: BoxDecoration(
                                   color:notifire.getbgcolor11,
                                    // color: Colors.red,
                                    borderRadius: BorderRadius.circular(15)),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                      width: constraints < 1400 ? 1500 : Get.width,
                                        child: Table(
                                          border: TableBorder.all(color: Colors.transparent),
                                          columnWidths: const <int, TableColumnWidth>{
                                            0: FixedColumnWidth(130),
                                            1: FixedColumnWidth(300),
                                            2: FixedColumnWidth(250),
                                            3: FixedColumnWidth(300),
                                            4: FixedColumnWidth(150),
                                            5: FixedColumnWidth(150),
                                            6: FixedColumnWidth(50),
                                          },
                                          children: <TableRow>[
                                            TableRow(
                                              children: <Widget>[
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 18, left: 3),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        padding: const EdgeInsets.all(5),
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(12),
                                                          color: const Color(0xffF5F5F5),
                                                        ),
                                                        child: Center(
                                                          child: Row(
                                                            children: [
                                                              Image.asset('assets/timer.png',height: 16,color: const Color(0xff727880)),
                                                              const SizedBox(width: 10,),
                                                              const Text('May 20',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880))),
                                                            ],
                                                          ),
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                 Padding(
                                                  padding: const EdgeInsets.only(top: 22, left: 8),
                                                  child: Text(
                                                    'versions have evolved over Various',
                                                    style: TextStyle(
                                                        fontFamily: 'InterRegular',
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 14,color: notifire.getblackcolor
                                                     ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 18, left: 3),
                                                  child: Row(
                                                    children: [
                                                      Container(

                                                        padding:
                                                        const EdgeInsets.all(6),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                          color:const Color(0xffD9B7FB),
                                                        ),
                                                        child: const Row(
                                                          children: [
                                                            Center(
                                                                child: Text('Web',
                                                                    style: TextStyle(

                                                                      fontFamily:
                                                                      'InterRegular',
                                                                      fontSize: 12,
                                                                    ))),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(width: 10,),
                                                      Container(padding:
                                                      const EdgeInsets.all(6),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                          color:const Color(0xffFFC9AC),
                                                        ),
                                                        child: const Row(
                                                          children: [
                                                            Center(
                                                                child: Text('Android',
                                                                    style: TextStyle(

                                                                      fontFamily:
                                                                      'InterRegular',
                                                                      fontSize: 12,
                                                                    ))),
                                                          ],
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(top: 25, left: 8),
                                                  child:  Row(
                                                    children: [
                                                      Text('2/24',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880),),),
                                                      SizedBox(width: 10,),
                                                      SizedBox(
                                                        width: 150,
                                                        child: StepProgressIndicator(
                                                          totalSteps: 100,
                                                          currentStep: 80,
                                                          size: 5,
                                                          padding: 0,
                                                          selectedColor: Color(0xff7DC066),
                                                          unselectedColor: Color(0xffEEEEEE),
                                                          roundedEdges: Radius.circular(10),
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 5, top: 18),
                                                  child: Transform.translate(
                                                    offset: const Offset(0, 0),
                                                    child: Stack(
                                                      clipBehavior: Clip.none,
                                                      children: [
                                                        Transform.translate(
                                                          offset: const Offset(-30, 0),
                                                          child: Container(
                                                            width: 32,
                                                            height: 32,
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(15),
                                                            ),
                                                            child:
                                                            Center(child: Image.asset('assets/avatar-6 1.png')),
                                                          ),
                                                        ),
                                                        Positioned(
                                                            left: -10,
                                                            child: Transform.translate(
                                                              offset: const Offset(5, 0),
                                                              child: Container(
                                                                width: 32,
                                                                height: 32,
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(15),
                                                                ),
                                                                child: Center(
                                                                    child: Image.asset('assets/avatar-7 1.png')),
                                                              ),
                                                            )),
                                                        Positioned(
                                                            left: 5,
                                                            child: Transform.translate(
                                                              offset: const Offset(15, 0),
                                                              child: Container(
                                                                width: 32,
                                                                height: 32,
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(15),
                                                                ),
                                                                child: Center(
                                                                    child: Image.asset('assets/avatar-8 1.png')),
                                                              ),
                                                            )),
                                                        Positioned(
                                                            child: Transform.translate(
                                                              offset: const Offset(45, 0),
                                                              child: Container(
                                                                width: 32,
                                                                height: 32,
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(15),
                                                                  color: const Color(0xffEEEEEE),
                                                                ),
                                                                child: const Center(
                                                                    child: Text(
                                                                      '+5',
                                                                      style:
                                                                      TextStyle(color: Color(0xffE5646C), fontSize: 14),
                                                                    )),
                                                              ),
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 25, left: 8),
                                                  child:  Row(
                                                    children: [
                                                      Image.asset('assets/profile-add.png',height: 16,color: const Color(0xff9DA2A7),)
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 25, left: 8),
                                                  child: Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),),
                                                ),

                                              ],
                                            ),
                                            TableRow(
                                              children: <Widget>[
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 18, left: 3),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        padding: const EdgeInsets.all(5),
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(12),
                                                          color: const Color(0xffF5F5F5),
                                                        ),
                                                        child: Center(
                                                          child: Row(
                                                            children: [
                                                              Image.asset('assets/timer.png',height: 16,color: const Color(0xff727880)),
                                                              const SizedBox(width: 10,),
                                                              const Text('Nov 10',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880))),
                                                            ],
                                                          ),
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                 Padding(
                                                  padding: const EdgeInsets.only(top: 22, left: 8),
                                                  child: Text(
                                                    'All the Lorem Ipsum generators',
                                                    style: TextStyle(
                                                        fontFamily: 'InterRegular',
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 14,
                                                        color: notifire.getblackcolor),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 18, left: 3),
                                                  child: Row(
                                                    children: [
                                                      Container(

                                                        padding:
                                                        const EdgeInsets.all(6),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                          color:const Color(0xffA9DDF5),
                                                        ),
                                                        child: const Row(
                                                          children: [
                                                            Center(
                                                                child: Text('Web',
                                                                    style: TextStyle(

                                                                      fontFamily:
                                                                      'InterRegular',
                                                                      fontSize: 12,
                                                                    ))),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(width: 10,),
                                                      Container(padding:
                                                      const EdgeInsets.all(6),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                          color:const Color(0xffFFC9AC),
                                                        ),
                                                        child: const Row(
                                                          children: [
                                                            Center(
                                                                child: Text('IOS',
                                                                    style: TextStyle(

                                                                      fontFamily:
                                                                      'InterRegular',
                                                                      fontSize: 12,
                                                                    ))),
                                                          ],
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(top: 25, left: 8),
                                                  child:  Row(
                                                    children: [
                                                      Text('2/24',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880),),),
                                                      SizedBox(width: 10,),
                                                      SizedBox(
                                                        width: 150,
                                                        child: StepProgressIndicator(
                                                          totalSteps: 100,
                                                          currentStep: 30,
                                                          size: 5,
                                                          padding: 0,
                                                          selectedColor: Color(0xff7DC066),
                                                          unselectedColor: Color(0xffEEEEEE),
                                                          roundedEdges: Radius.circular(10),
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 5, top: 18),
                                                  child: Transform.translate(
                                                    offset: const Offset(0, 0),
                                                    child: Stack(
                                                      clipBehavior: Clip.none,
                                                      children: [
                                                        Transform.translate(
                                                          offset: const Offset(-30, 0),
                                                          child: Container(
                                                            width: 32,
                                                            height: 32,
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(15),
                                                            ),
                                                            child:
                                                            Center(child: Image.asset('assets/avatar-7 1.png')),
                                                          ),
                                                        ),
                                                        Positioned(
                                                            left: -10,
                                                            child: Transform.translate(
                                                              offset: const Offset(5, 0),
                                                              child: Container(
                                                                width: 32,
                                                                height: 32,
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(15),
                                                                ),
                                                                child: Center(
                                                                    child: Image.asset('assets/avatar-6 1.png')),
                                                              ),
                                                            )),

                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 25, left: 8),
                                                  child:  Row(
                                                    children: [
                                                      Image.asset('assets/profile-add.png',height: 16,color: const Color(0xff9DA2A7),)
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 25, left: 8),
                                                  child: Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),),
                                                ),

                                              ],
                                            ),
                                            TableRow(
                                              children: <Widget>[
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 18, left: 3),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        padding: const EdgeInsets.all(5),
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(12),
                                                          color: const Color(0xffF5F5F5),
                                                        ),
                                                        child: Center(
                                                          child: Row(
                                                            children: [
                                                              Image.asset('assets/timer.png',height: 16,color: const Color(0xff727880)),
                                                              const SizedBox(width: 10,),
                                                              const Text('May 17',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880))),
                                                            ],
                                                          ),
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                 Padding(
                                                  padding: const EdgeInsets.only(top: 22, left: 8),
                                                  child: Text(
                                                    'Various versions have evolved over',
                                                    style: TextStyle(
                                                        fontFamily: 'InterRegular',
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 14,color: notifire.getblackcolor
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 18, left: 3),
                                                  child: Row(
                                                    children: [
                                                      Container(

                                                        padding:
                                                        const EdgeInsets.all(6),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                          color:const Color(0xffB0E4C8),
                                                        ),
                                                        child: const Row(
                                                          children: [
                                                            Center(
                                                                child: Text('UI',
                                                                    style: TextStyle(

                                                                      fontFamily:
                                                                      'InterRegular',
                                                                      fontSize: 12,
                                                                    ))),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(width: 10,),
                                                      Container(padding:
                                                      const EdgeInsets.all(6),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                          color:const Color(0xffA9DDF5),
                                                        ),
                                                        child: const Row(
                                                          children: [
                                                            Center(
                                                                child: Text('IOS',
                                                                    style: TextStyle(

                                                                      fontFamily:
                                                                      'InterRegular',
                                                                      fontSize: 12,
                                                                    ))),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(width: 10,),
                                                      Container(padding:
                                                      const EdgeInsets.all(6),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                          color:const Color(0xffF8BEC1),
                                                        ),
                                                        child: const Row(
                                                          children: [
                                                            Center(
                                                                child: Text('Research',
                                                                    style: TextStyle(

                                                                      fontFamily:
                                                                      'InterRegular',
                                                                      fontSize: 12,
                                                                    ))),
                                                          ],
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(top: 25, left: 8),
                                                  child:  Row(
                                                    children: [
                                                      Text('5/34',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880),),),
                                                      SizedBox(width: 10,),
                                                      SizedBox(
                                                        width: 150,
                                                        child: StepProgressIndicator(
                                                          totalSteps: 100,
                                                          currentStep: 60,
                                                          size: 5,
                                                          padding: 0,
                                                          selectedColor: Color(0xff7DC066),
                                                          unselectedColor: Color(0xffEEEEEE),
                                                          roundedEdges: Radius.circular(10),
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 5, top: 18),
                                                  child: Transform.translate(
                                                    offset: const Offset(
                                                        -50, 0),
                                                    child: Stack(
                                                      clipBehavior:
                                                      Clip.none,
                                                      children: [
                                                        Positioned(
                                                            left: 5,
                                                            child: Transform
                                                                .translate(
                                                              offset:
                                                              const Offset(
                                                                  15,
                                                                  0),
                                                              child:
                                                              Container(
                                                                width: 32,
                                                                height:
                                                                32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius.circular(15),
                                                                ),
                                                                child: Center(
                                                                    child:
                                                                    Image.asset('assets/avatar-8 1.png')),
                                                              ),
                                                            )),
                                                        Positioned(
                                                            child: Transform
                                                                .translate(
                                                              offset:
                                                              const Offset(
                                                                  45, 0),
                                                              child:
                                                              Container(
                                                                width: 32,
                                                                height: 32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius.circular(
                                                                      15),
                                                                  color: const Color(
                                                                      0xffEEEEEE),
                                                                ),
                                                                child:
                                                                const Center(
                                                                    child:
                                                                    Text(
                                                                      '+16',
                                                                      style: TextStyle(
                                                                          color: Color(
                                                                              0xffE5646C),
                                                                          fontSize:
                                                                          14),
                                                                    )),
                                                              ),
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 25, left: 8),
                                                  child:  Row(
                                                    children: [
                                                      Image.asset('assets/profile-add.png',height: 16,color: const Color(0xff9DA2A7),)
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 25, left: 8),
                                                  child: Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),),
                                                ),

                                              ],
                                            ),
                                            const TableRow(children: [

                                              Padding(
                                                padding: EdgeInsets.only(top: 10),
                                                child: Divider(
                                                  height: 10,
                                                  color: Colors.transparent,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(top: 10),
                                                child: Divider(
                                                  height: 10,
                                                  color: Colors.transparent,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(top: 10),
                                                child: Divider(
                                                  height: 10,
                                                  color: Colors.transparent,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(top: 10),
                                                child: Divider(
                                                  height: 10,
                                                  color: Colors.transparent,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(top: 10),
                                                child: Divider(
                                                  height: 10,
                                                  color: Colors.transparent,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(top: 10),
                                                child: Divider(
                                                  height: 10,
                                                  color: Colors.transparent,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(top: 10),
                                                child: Divider(
                                                  height: 10,
                                                  color: Colors.transparent,
                                                ),
                                              ),
                                            ]),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10,),

                              Row(
                                children: [
                                   Text(
                                    'Q & A',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'InterRegular',
                                      fontSize: 16,color: notifire.getblackcolor
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: const Color(0xffEEEEEE),
                                      ),
                                      child: const Text(
                                        '4',
                                        style: TextStyle(
                                            fontFamily: 'InterRegular',
                                            fontSize: 12,
                                            color: Color(0xff727880)),
                                      )),
                                ],
                              ),
                              const SizedBox(height: 10,),
                              Container(
                                padding: const EdgeInsets.all(15),
                                width: Get.width,
                                decoration: BoxDecoration(
                                  color: notifire.getbgcolor11,
                                    // color: Colors.red,
                                    borderRadius: BorderRadius.circular(15)),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: constraints < 1400 ? 1500 : Get.width,
                                        child: Table(
                                          border: TableBorder.all(color: Colors.transparent),
                                          columnWidths: const <int, TableColumnWidth>{
                                            0: FixedColumnWidth(130),
                                            1: FixedColumnWidth(300),
                                            2: FixedColumnWidth(250),
                                            3: FixedColumnWidth(300),
                                            4: FixedColumnWidth(150),
                                            5: FixedColumnWidth(150),
                                            6: FixedColumnWidth(50),
                                          },
                                          children: <TableRow>[
                                            TableRow(
                                              children: <Widget>[
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 18, left: 3),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        padding: const EdgeInsets.all(5),
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(12),
                                                          color: const Color(0xffF5F5F5),
                                                        ),
                                                        child: Center(
                                                          child: Row(
                                                            children: [
                                                              Image.asset('assets/timer.png',height: 16,color: const Color(0xff727880)),
                                                              const SizedBox(width: 10,),
                                                              const Text('Nov 10',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880))),
                                                            ],
                                                          ),
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                 Padding(
                                                  padding: const EdgeInsets.only(top: 22, left: 8),
                                                  child: Text(
                                                    'All the Lorem Ipsum generators',
                                                    style: TextStyle(
                                                        fontFamily: 'InterRegular',
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 14,color: notifire.getblackcolor
                                                       ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 18, left: 3),
                                                  child: Row(
                                                    children: [
                                                      Container(

                                                        padding:
                                                        const EdgeInsets.all(6),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                          color:const Color(0xffA9DDF5),
                                                        ),
                                                        child: const Row(
                                                          children: [
                                                            Center(
                                                                child: Text('Web',
                                                                    style: TextStyle(

                                                                      fontFamily:
                                                                      'InterRegular',
                                                                      fontSize: 12,
                                                                    ))),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(width: 10,),
                                                      Container(padding:
                                                      const EdgeInsets.all(6),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                          color:const Color(0xffFFC9AC),
                                                        ),
                                                        child: const Row(
                                                          children: [
                                                            Center(
                                                                child: Text('IOS',
                                                                    style: TextStyle(

                                                                      fontFamily:
                                                                      'InterRegular',
                                                                      fontSize: 12,
                                                                    ))),
                                                          ],
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(top: 25, left: 8),
                                                  child:  Row(
                                                    children: [
                                                      Text('2/24',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880),),),
                                                      SizedBox(width: 10,),
                                                      SizedBox(
                                                        width: 150,
                                                        child: StepProgressIndicator(
                                                          totalSteps: 100,
                                                          currentStep: 30,
                                                          size: 5,
                                                          padding: 0,
                                                          selectedColor: Color(0xff7DC066),
                                                          unselectedColor: Color(0xffEEEEEE),
                                                          roundedEdges: Radius.circular(10),
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 5, top: 18),
                                                  child: Transform.translate(
                                                    offset: const Offset(0, 0),
                                                    child: Stack(
                                                      clipBehavior: Clip.none,
                                                      children: [
                                                        Transform.translate(
                                                          offset: const Offset(-30, 0),
                                                          child: Container(
                                                            width: 32,
                                                            height: 32,
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(15),
                                                            ),
                                                            child:
                                                            Center(child: Image.asset('assets/avatar-7 1.png')),
                                                          ),
                                                        ),
                                                        Positioned(
                                                            left: -10,
                                                            child: Transform.translate(
                                                              offset: const Offset(5, 0),
                                                              child: Container(
                                                                width: 32,
                                                                height: 32,
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(15),
                                                                ),
                                                                child: Center(
                                                                    child: Image.asset('assets/avatar-6 1.png')),
                                                              ),
                                                            )),

                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 25, left: 8),
                                                  child:  Row(
                                                    children: [
                                                      Image.asset('assets/profile-add.png',height: 16,color: const Color(0xff9DA2A7),)
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 25, left: 8),
                                                  child: Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),),
                                                ),

                                              ],
                                            ),
                                            TableRow(
                                              children: <Widget>[
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 18, left: 3),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        padding: const EdgeInsets.all(5),
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(12),
                                                          color: const Color(0xffF5F5F5),
                                                        ),
                                                        child: Center(
                                                          child: Row(
                                                            children: [
                                                              Image.asset('assets/timer.png',height: 16,color: const Color(0xff727880)),
                                                              const SizedBox(width: 10,),
                                                              const Text('May 17',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880))),
                                                            ],
                                                          ),
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                 Padding(
                                                  padding: const EdgeInsets.only(top: 22, left: 8),
                                                  child: Text(
                                                    'Various versions have evolved over',
                                                    style: TextStyle(
                                                        fontFamily: 'InterRegular',
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 14,
                                                        color: notifire.getblackcolor),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 18, left: 3),
                                                  child: Row(
                                                    children: [
                                                      Container(

                                                        padding:
                                                        const EdgeInsets.all(6),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                          color:const Color(0xffB0E4C8),
                                                        ),
                                                        child: const Row(
                                                          children: [
                                                            Center(
                                                                child: Text('UI',
                                                                    style: TextStyle(

                                                                      fontFamily:
                                                                      'InterRegular',
                                                                      fontSize: 12,
                                                                    ))),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(width: 10,),
                                                      Container(padding:
                                                      const EdgeInsets.all(6),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                          color:const Color(0xffA9DDF5),
                                                        ),
                                                        child: const Row(
                                                          children: [
                                                            Center(
                                                                child: Text('IOS',
                                                                    style: TextStyle(

                                                                      fontFamily:
                                                                      'InterRegular',
                                                                      fontSize: 12,
                                                                    ))),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(width: 10,),
                                                      Container(padding:
                                                      const EdgeInsets.all(6),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                          color:const Color(0xffF8BEC1),
                                                        ),
                                                        child: const Row(
                                                          children: [
                                                            Center(
                                                                child: Text('Research',
                                                                    style: TextStyle(

                                                                      fontFamily:
                                                                      'InterRegular',
                                                                      fontSize: 12,
                                                                    ))),
                                                          ],
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(top: 25, left: 8),
                                                  child:  Row(
                                                    children: [
                                                      Text('5/34',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880),),),
                                                      SizedBox(width: 10,),
                                                      SizedBox(
                                                        width: 150,
                                                        child: StepProgressIndicator(
                                                          totalSteps: 100,
                                                          currentStep: 60,
                                                          size: 5,
                                                          padding: 0,
                                                          selectedColor: Color(0xff7DC066),
                                                          unselectedColor: Color(0xffEEEEEE),
                                                          roundedEdges: Radius.circular(10),
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 5, top: 18),
                                                  child: Transform.translate(
                                                    offset: const Offset(
                                                        -50, 0),
                                                    child: Stack(
                                                      clipBehavior:
                                                      Clip.none,
                                                      children: [
                                                        Positioned(
                                                            left: 5,
                                                            child: Transform
                                                                .translate(
                                                              offset:
                                                              const Offset(
                                                                  15,
                                                                  0),
                                                              child:
                                                              Container(
                                                                width: 32,
                                                                height:
                                                                32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius.circular(15),
                                                                ),
                                                                child: Center(
                                                                    child:
                                                                    Image.asset('assets/avatar-8 1.png')),
                                                              ),
                                                            )),
                                                        Positioned(
                                                            child: Transform
                                                                .translate(
                                                              offset:
                                                              const Offset(
                                                                  45, 0),
                                                              child:
                                                              Container(
                                                                width: 32,
                                                                height: 32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius.circular(
                                                                      15),
                                                                  color: const Color(
                                                                      0xffEEEEEE),
                                                                ),
                                                                child:
                                                                const Center(
                                                                    child:
                                                                    Text(
                                                                      '+16',
                                                                      style: TextStyle(
                                                                          color: Color(
                                                                              0xffE5646C),
                                                                          fontSize:
                                                                          14),
                                                                    )),
                                                              ),
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 25, left: 8),
                                                  child:  Row(
                                                    children: [
                                                      Image.asset('assets/profile-add.png',height: 16,color: const Color(0xff9DA2A7),)
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 25, left: 8),
                                                  child: Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),),
                                                ),

                                              ],
                                            ),
                                            TableRow(
                                              children: <Widget>[
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 18, left: 3),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        padding: const EdgeInsets.all(5),
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(12),
                                                          color: const Color(0xffF5F5F5),
                                                        ),
                                                        child: Center(
                                                          child: Row(
                                                            children: [
                                                              Image.asset('assets/timer.png',height: 16,color: const Color(0xff727880)),
                                                              const SizedBox(width: 10,),
                                                              const Text('May 20',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880))),
                                                            ],
                                                          ),
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                              Padding(
                                                  padding: const EdgeInsets.only(top: 22, left: 8),
                                                  child: Text(
                                                    'versions have evolved over Various',
                                                    style: TextStyle(
                                                        fontFamily: 'InterRegular',
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 14,color: notifire.getblackcolor
                                                       ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 18, left: 3),
                                                  child: Row(
                                                    children: [
                                                      Container(

                                                        padding:
                                                        const EdgeInsets.all(6),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                          color:const Color(0xffD9B7FB),
                                                        ),
                                                        child: const Row(
                                                          children: [
                                                            Center(
                                                                child: Text('Web',
                                                                    style: TextStyle(

                                                                      fontFamily:
                                                                      'InterRegular',
                                                                      fontSize: 12,
                                                                    ))),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(width: 10,),
                                                      Container(padding:
                                                      const EdgeInsets.all(6),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                          color:const Color(0xffFFC9AC),
                                                        ),
                                                        child: const Row(
                                                          children: [
                                                            Center(
                                                                child: Text('Android',
                                                                    style: TextStyle(

                                                                      fontFamily:
                                                                      'InterRegular',
                                                                      fontSize: 12,
                                                                    ))),
                                                          ],
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(top: 25, left: 8),
                                                  child:  Row(
                                                    children: [
                                                      Text('2/24',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880),),),
                                                      SizedBox(width: 10,),
                                                      SizedBox(
                                                        width: 150,
                                                        child: StepProgressIndicator(
                                                          totalSteps: 100,
                                                          currentStep: 80,
                                                          size: 5,
                                                          padding: 0,
                                                          selectedColor: Color(0xff7DC066),
                                                          unselectedColor: Color(0xffEEEEEE),
                                                          roundedEdges: Radius.circular(10),
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 5, top: 18),
                                                  child: Transform.translate(
                                                    offset: const Offset(0, 0),
                                                    child: Stack(
                                                      clipBehavior: Clip.none,
                                                      children: [
                                                        Transform.translate(
                                                          offset: const Offset(-30, 0),
                                                          child: Container(
                                                            width: 32,
                                                            height: 32,
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(15),
                                                            ),
                                                            child:
                                                            Center(child: Image.asset('assets/avatar-6 1.png')),
                                                          ),
                                                        ),
                                                        Positioned(
                                                            left: -10,
                                                            child: Transform.translate(
                                                              offset: const Offset(5, 0),
                                                              child: Container(
                                                                width: 32,
                                                                height: 32,
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(15),
                                                                ),
                                                                child: Center(
                                                                    child: Image.asset('assets/avatar-7 1.png')),
                                                              ),
                                                            )),
                                                        Positioned(
                                                            left: 5,
                                                            child: Transform.translate(
                                                              offset: const Offset(15, 0),
                                                              child: Container(
                                                                width: 32,
                                                                height: 32,
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(15),
                                                                ),
                                                                child: Center(
                                                                    child: Image.asset('assets/avatar-8 1.png')),
                                                              ),
                                                            )),
                                                        Positioned(
                                                            child: Transform.translate(
                                                              offset: const Offset(45, 0),
                                                              child: Container(
                                                                width: 32,
                                                                height: 32,
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(15),
                                                                  color: const Color(0xffEEEEEE),
                                                                ),
                                                                child: const Center(
                                                                    child: Text(
                                                                      '+5',
                                                                      style:
                                                                      TextStyle(color: Color(0xffE5646C), fontSize: 14),
                                                                    )),
                                                              ),
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 25, left: 8),
                                                  child:  Row(
                                                    children: [
                                                      Image.asset('assets/profile-add.png',height: 16,color: const Color(0xff9DA2A7),)
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 25, left: 8),
                                                  child: Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),),
                                                ),

                                              ],
                                            ),
                                            TableRow(
                                              children: <Widget>[
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 18, left: 3),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        padding: const EdgeInsets.all(5),
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(12),
                                                          color: const Color(0xffF5F5F5),
                                                        ),
                                                        child: Center(
                                                          child: Row(
                                                            children: [
                                                              Image.asset('assets/timer.png',height: 16,color: const Color(0xff727880)),
                                                              const SizedBox(width: 10,),
                                                              const Text('May 17',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880))),
                                                            ],
                                                          ),
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 22, left: 8),
                                                  child: Text(
                                                    'Various versions have evolved over',
                                                    style: TextStyle(
                                                        fontFamily: 'InterRegular',
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 14,
                                                        color: notifire.getblackcolor),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 18, left: 3),
                                                  child: Row(
                                                    children: [
                                                      Container(

                                                        padding:
                                                        const EdgeInsets.all(6),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                          color:const Color(0xffB0E4C8),
                                                        ),
                                                        child: const Row(
                                                          children: [
                                                            Center(
                                                                child: Text('UI',
                                                                    style: TextStyle(

                                                                      fontFamily:
                                                                      'InterRegular',
                                                                      fontSize: 12,
                                                                    ))),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(width: 10,),
                                                      Container(padding:
                                                      const EdgeInsets.all(6),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                          color:const Color(0xffA9DDF5),
                                                        ),
                                                        child: const Row(
                                                          children: [
                                                            Center(
                                                                child: Text('IOS',
                                                                    style: TextStyle(

                                                                      fontFamily:
                                                                      'InterRegular',
                                                                      fontSize: 12,
                                                                    ))),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(width: 10,),
                                                      Container(padding:
                                                      const EdgeInsets.all(6),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                          color:const Color(0xffF8BEC1),
                                                        ),
                                                        child: const Row(
                                                          children: [
                                                            Center(
                                                                child: Text('Research',
                                                                    style: TextStyle(

                                                                      fontFamily:
                                                                      'InterRegular',
                                                                      fontSize: 12,
                                                                    ))),
                                                          ],
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(top: 25, left: 8),
                                                  child:  Row(
                                                    children: [
                                                      Text('5/34',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880),),),
                                                      SizedBox(width: 10,),
                                                      SizedBox(
                                                        width: 150,
                                                        child: StepProgressIndicator(
                                                          totalSteps: 100,
                                                          currentStep: 60,
                                                          size: 5,
                                                          padding: 0,
                                                          selectedColor: Color(0xff7DC066),
                                                          unselectedColor: Color(0xffEEEEEE),
                                                          roundedEdges: Radius.circular(10),
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 5, top: 18),
                                                  child: Transform.translate(
                                                    offset: const Offset(
                                                        -50, 0),
                                                    child: Stack(
                                                      clipBehavior:
                                                      Clip.none,
                                                      children: [
                                                        Positioned(
                                                            left: 5,
                                                            child: Transform
                                                                .translate(
                                                              offset:
                                                              const Offset(
                                                                  15,
                                                                  0),
                                                              child:
                                                              Container(
                                                                width: 32,
                                                                height:
                                                                32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius.circular(15),
                                                                ),
                                                                child: Center(
                                                                    child:
                                                                    Image.asset('assets/avatar-8 1.png')),
                                                              ),
                                                            )),
                                                        Positioned(
                                                            child: Transform
                                                                .translate(
                                                              offset:
                                                              const Offset(
                                                                  45, 0),
                                                              child:
                                                              Container(
                                                                width: 32,
                                                                height: 32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius.circular(
                                                                      15),
                                                                  color: const Color(
                                                                      0xffEEEEEE),
                                                                ),
                                                                child:
                                                                const Center(
                                                                    child:
                                                                    Text(
                                                                      '+16',
                                                                      style: TextStyle(
                                                                          color: Color(
                                                                              0xffE5646C),
                                                                          fontSize:
                                                                          14),
                                                                    )),
                                                              ),
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 25, left: 8),
                                                  child:  Row(
                                                    children: [
                                                      Image.asset('assets/profile-add.png',height: 16,color: const Color(0xff9DA2A7),)
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 25, left: 8),
                                                  child: Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),),
                                                ),

                                              ],
                                            ),
                                            TableRow(
                                              children: <Widget>[
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 18, left: 3),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        padding: const EdgeInsets.all(5),
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(12),
                                                          color: const Color(0xffF5F5F5),
                                                        ),
                                                        child: Center(
                                                          child: Row(
                                                            children: [
                                                              Image.asset('assets/timer.png',height: 16,color: const Color(0xff727880)),
                                                              const SizedBox(width: 10,),
                                                              const Text('May 20',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880))),
                                                            ],
                                                          ),
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 22, left: 8),
                                                  child: Text(
                                                    'versions have evolved over Various',
                                                    style: TextStyle(
                                                        fontFamily: 'InterRegular',
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 14,color: notifire.getblackcolor
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 18, left: 3),
                                                  child: Row(
                                                    children: [
                                                      Container(

                                                        padding:
                                                        const EdgeInsets.all(6),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                          color:const Color(0xffD9B7FB),
                                                        ),
                                                        child: const Row(
                                                          children: [
                                                            Center(
                                                                child: Text('Web',
                                                                    style: TextStyle(

                                                                      fontFamily:
                                                                      'InterRegular',
                                                                      fontSize: 12,
                                                                    ))),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(width: 10,),
                                                      Container(padding:
                                                      const EdgeInsets.all(6),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                          color:const Color(0xffFFC9AC),
                                                        ),
                                                        child: const Row(
                                                          children: [
                                                            Center(
                                                                child: Text('Android',
                                                                    style: TextStyle(

                                                                      fontFamily:
                                                                      'InterRegular',
                                                                      fontSize: 12,
                                                                    ))),
                                                          ],
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(top: 25, left: 8),
                                                  child:  Row(
                                                    children: [
                                                      Text('2/24',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880),),),
                                                      SizedBox(width: 10,),
                                                      SizedBox(
                                                        width: 150,
                                                        child: StepProgressIndicator(
                                                          totalSteps: 100,
                                                          currentStep: 80,
                                                          size: 5,
                                                          padding: 0,
                                                          selectedColor: Color(0xff7DC066),
                                                          unselectedColor: Color(0xffEEEEEE),
                                                          roundedEdges: Radius.circular(10),
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 5, top: 18),
                                                  child: Transform.translate(
                                                    offset: const Offset(0, 0),
                                                    child: Stack(
                                                      clipBehavior: Clip.none,
                                                      children: [
                                                        Transform.translate(
                                                          offset: const Offset(-30, 0),
                                                          child: Container(
                                                            width: 32,
                                                            height: 32,
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(15),
                                                            ),
                                                            child:
                                                            Center(child: Image.asset('assets/avatar-6 1.png')),
                                                          ),
                                                        ),
                                                        Positioned(
                                                            left: -10,
                                                            child: Transform.translate(
                                                              offset: const Offset(5, 0),
                                                              child: Container(
                                                                width: 32,
                                                                height: 32,
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(15),
                                                                ),
                                                                child: Center(
                                                                    child: Image.asset('assets/avatar-7 1.png')),
                                                              ),
                                                            )),
                                                        Positioned(
                                                            left: 5,
                                                            child: Transform.translate(
                                                              offset: const Offset(15, 0),
                                                              child: Container(
                                                                width: 32,
                                                                height: 32,
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(15),
                                                                ),
                                                                child: Center(
                                                                    child: Image.asset('assets/avatar-8 1.png')),
                                                              ),
                                                            )),
                                                        Positioned(
                                                            child: Transform.translate(
                                                              offset: const Offset(45, 0),
                                                              child: Container(
                                                                width: 32,
                                                                height: 32,
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(15),
                                                                  color: const Color(0xffEEEEEE),
                                                                ),
                                                                child: const Center(
                                                                    child: Text(
                                                                      '+5',
                                                                      style:
                                                                      TextStyle(color: Color(0xffE5646C), fontSize: 14),
                                                                    )),
                                                              ),
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 25, left: 8),
                                                  child:  Row(
                                                    children: [
                                                      Image.asset('assets/profile-add.png',height: 16,color: const Color(0xff9DA2A7),)
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 25, left: 8),
                                                  child: Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),),
                                                ),

                                              ],
                                            ),
                                            const TableRow(children: [

                                              Padding(
                                                padding: EdgeInsets.only(top: 10),
                                                child: Divider(
                                                  height: 10,
                                                  color: Colors.transparent,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(top: 10),
                                                child: Divider(
                                                  height: 10,
                                                  color: Colors.transparent,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(top: 10),
                                                child: Divider(
                                                  height: 10,
                                                  color: Colors.transparent,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(top: 10),
                                                child: Divider(
                                                  height: 10,
                                                  color: Colors.transparent,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(top: 10),
                                                child: Divider(
                                                  height: 10,
                                                  color: Colors.transparent,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(top: 10),
                                                child: Divider(
                                                  height: 10,
                                                  color: Colors.transparent,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(top: 10),
                                                child: Divider(
                                                  height: 10,
                                                  color: Colors.transparent,
                                                ),
                                              ),
                                            ]),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10,),
                                         Row(
                                children: [
                                  Text(
                                    'Archive',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'InterRegular',
                                        fontSize: 16,color: notifire.getblackcolor
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: notifire.getbgcolor11,
                                      ),
                                      child: const Text(
                                        '8',
                                        style: TextStyle(
                                            fontFamily: 'InterRegular',
                                            fontSize: 12,
                                            color: Color(0xff727880)),
                                      )),
                                ],
                              ),
                              const SizedBox(height: 10,),
                              Container(
                                padding: const EdgeInsets.all(15),
                                width: Get.width,
                                decoration: BoxDecoration(
                                    color:notifire.getbgcolor11,
                                    // color: Colors.red,
                                    borderRadius: BorderRadius.circular(15)),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: constraints < 1400 ? 1500 : Get.width,
                                        child: Table(
                                          border: TableBorder.all(color: Colors.transparent),
                                          columnWidths: const <int, TableColumnWidth>{
                                            0: FixedColumnWidth(130),
                                            1: FixedColumnWidth(300),
                                            2: FixedColumnWidth(250),
                                            3: FixedColumnWidth(300),
                                            4: FixedColumnWidth(150),
                                            5: FixedColumnWidth(150),
                                            6: FixedColumnWidth(50),
                                          },
                                          children: <TableRow>[
                                            TableRow(
                                              children: <Widget>[
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 18, left: 3),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        padding: const EdgeInsets.all(5),
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(12),
                                                          color: const Color(0xffF5F5F5),
                                                        ),
                                                        child: Center(
                                                          child: Row(
                                                            children: [
                                                              Image.asset('assets/timer.png',height: 16,color: const Color(0xff727880)),
                                                              const SizedBox(width: 10,),
                                                              const Text('May 17',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880))),
                                                            ],
                                                          ),
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 22, left: 8),
                                                  child: Text(
                                                    'Various versions have evolved over',
                                                    style: TextStyle(
                                                        fontFamily: 'InterRegular',
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 14,
                                                        color: notifire.getblackcolor),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 18, left: 3),
                                                  child: Row(
                                                    children: [
                                                      Container(

                                                        padding:
                                                        const EdgeInsets.all(6),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                          color:const Color(0xffB0E4C8),
                                                        ),
                                                        child: const Row(
                                                          children: [
                                                            Center(
                                                                child: Text('UI',
                                                                    style: TextStyle(

                                                                      fontFamily:
                                                                      'InterRegular',
                                                                      fontSize: 12,
                                                                    ))),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(width: 10,),
                                                      Container(padding:
                                                      const EdgeInsets.all(6),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                          color:const Color(0xffA9DDF5),
                                                        ),
                                                        child: const Row(
                                                          children: [
                                                            Center(
                                                                child: Text('IOS',
                                                                    style: TextStyle(

                                                                      fontFamily:
                                                                      'InterRegular',
                                                                      fontSize: 12,
                                                                    ))),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(width: 10,),
                                                      Container(padding:
                                                      const EdgeInsets.all(6),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                          color:const Color(0xffF8BEC1),
                                                        ),
                                                        child: const Row(
                                                          children: [
                                                            Center(
                                                                child: Text('Research',
                                                                    style: TextStyle(

                                                                      fontFamily:
                                                                      'InterRegular',
                                                                      fontSize: 12,
                                                                    ))),
                                                          ],
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(top: 25, left: 8),
                                                  child:  Row(
                                                    children: [
                                                      Text('5/34',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880),),),
                                                      SizedBox(width: 10,),
                                                      SizedBox(
                                                        width: 150,
                                                        child: StepProgressIndicator(
                                                          totalSteps: 100,
                                                          currentStep: 60,
                                                          size: 5,
                                                          padding: 0,
                                                          selectedColor: Color(0xff7DC066),
                                                          unselectedColor: Color(0xffEEEEEE),
                                                          roundedEdges: Radius.circular(10),
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 5, top: 18),
                                                  child: Transform.translate(
                                                    offset: const Offset(
                                                        -50, 0),
                                                    child: Stack(
                                                      clipBehavior:
                                                      Clip.none,
                                                      children: [
                                                        Positioned(
                                                            left: 5,
                                                            child: Transform
                                                                .translate(
                                                              offset:
                                                              const Offset(
                                                                  15,
                                                                  0),
                                                              child:
                                                              Container(
                                                                width: 32,
                                                                height:
                                                                32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius.circular(15),
                                                                ),
                                                                child: Center(
                                                                    child:
                                                                    Image.asset('assets/avatar-8 1.png')),
                                                              ),
                                                            )),
                                                        Positioned(
                                                            child: Transform
                                                                .translate(
                                                              offset:
                                                              const Offset(
                                                                  45, 0),
                                                              child:
                                                              Container(
                                                                width: 32,
                                                                height: 32,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius.circular(
                                                                      15),
                                                                  color: const Color(
                                                                      0xffEEEEEE),
                                                                ),
                                                                child:
                                                                const Center(
                                                                    child:
                                                                    Text(
                                                                      '+16',
                                                                      style: TextStyle(
                                                                          color: Color(
                                                                              0xffE5646C),
                                                                          fontSize:
                                                                          14),
                                                                    )),
                                                              ),
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 25, left: 8),
                                                  child:  Row(
                                                    children: [
                                                      Image.asset('assets/profile-add.png',height: 16,color: const Color(0xff9DA2A7),)
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 25, left: 8),
                                                  child: Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),),
                                                ),

                                              ],
                                            ),
                                            TableRow(
                                              children: <Widget>[
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 18, left: 3),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        padding: const EdgeInsets.all(5),
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(12),
                                                          color: const Color(0xffF5F5F5),
                                                        ),
                                                        child: Center(
                                                          child: Row(
                                                            children: [
                                                              Image.asset('assets/timer.png',height: 16,color: const Color(0xff727880)),
                                                              const SizedBox(width: 10,),
                                                              const Text('May 20',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880))),
                                                            ],
                                                          ),
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 22, left: 8),
                                                  child: Text(
                                                    'versions have evolved over Various',
                                                    style: TextStyle(
                                                        fontFamily: 'InterRegular',
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 14,
                                                        color: notifire.getblackcolor),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 18, left: 3),
                                                  child: Row(
                                                    children: [
                                                      Container(

                                                        padding:
                                                        const EdgeInsets.all(6),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                          color:const Color(0xffD9B7FB),
                                                        ),
                                                        child: const Row(
                                                          children: [
                                                            Center(
                                                                child: Text('Web',
                                                                    style: TextStyle(

                                                                      fontFamily:
                                                                      'InterRegular',
                                                                      fontSize: 12,
                                                                    ))),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(width: 10,),
                                                      Container(padding:
                                                      const EdgeInsets.all(6),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                          color:const Color(0xffFFC9AC),
                                                        ),
                                                        child: const Row(
                                                          children: [
                                                            Center(
                                                                child: Text('Android',
                                                                    style: TextStyle(

                                                                      fontFamily:
                                                                      'InterRegular',
                                                                      fontSize: 12,
                                                                    ))),
                                                          ],
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(top: 25, left: 8),
                                                  child:  Row(
                                                    children: [
                                                      Text('2/24',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880),),),
                                                      SizedBox(width: 10,),
                                                      SizedBox(
                                                        width: 150,
                                                        child: StepProgressIndicator(
                                                          totalSteps: 100,
                                                          currentStep: 80,
                                                          size: 5,
                                                          padding: 0,
                                                          selectedColor: Color(0xff7DC066),
                                                          unselectedColor: Color(0xffEEEEEE),
                                                          roundedEdges: Radius.circular(10),
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 5, top: 18),
                                                  child: Transform.translate(
                                                    offset: const Offset(0, 0),
                                                    child: Stack(
                                                      clipBehavior: Clip.none,
                                                      children: [
                                                        Transform.translate(
                                                          offset: const Offset(-30, 0),
                                                          child: Container(
                                                            width: 32,
                                                            height: 32,
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(15),
                                                            ),
                                                            child:
                                                            Center(child: Image.asset('assets/avatar-6 1.png')),
                                                          ),
                                                        ),
                                                        Positioned(
                                                            left: -10,
                                                            child: Transform.translate(
                                                              offset: const Offset(5, 0),
                                                              child: Container(
                                                                width: 32,
                                                                height: 32,
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(15),
                                                                ),
                                                                child: Center(
                                                                    child: Image.asset('assets/avatar-7 1.png')),
                                                              ),
                                                            )),
                                                        Positioned(
                                                            left: 5,
                                                            child: Transform.translate(
                                                              offset: const Offset(15, 0),
                                                              child: Container(
                                                                width: 32,
                                                                height: 32,
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(15),
                                                                ),
                                                                child: Center(
                                                                    child: Image.asset('assets/avatar-8 1.png')),
                                                              ),
                                                            )),
                                                        Positioned(
                                                            child: Transform.translate(
                                                              offset: const Offset(45, 0),
                                                              child: Container(
                                                                width: 32,
                                                                height: 32,
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(15),
                                                                  color: const Color(0xffEEEEEE),
                                                                ),
                                                                child: const Center(
                                                                    child: Text(
                                                                      '+5',
                                                                      style:
                                                                      TextStyle(color: Color(0xffE5646C), fontSize: 14),
                                                                    )),
                                                              ),
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 25, left: 8),
                                                  child:  Row(
                                                    children: [
                                                      Image.asset('assets/profile-add.png',height: 16,color: const Color(0xff9DA2A7),)
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 25, left: 8),
                                                  child: Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),),
                                                ),

                                              ],
                                            ),
                                            TableRow(
                                              children: <Widget>[
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 18, left: 3),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        padding: const EdgeInsets.all(5),
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(12),
                                                          color: const Color(0xffF5F5F5),
                                                        ),
                                                        child: Center(
                                                          child: Row(
                                                            children: [
                                                              Image.asset('assets/timer.png',height: 16,color: const Color(0xff727880)),
                                                              const SizedBox(width: 10,),
                                                              const Text('Nov 10',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880))),
                                                            ],
                                                          ),
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 22, left: 8),
                                                  child: Text(
                                                    'All the Lorem Ipsum generators',
                                                    style: TextStyle(
                                                        fontFamily: 'InterRegular',
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 14,
                                                        color: notifire.getblackcolor),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 18, left: 3),
                                                  child: Row(
                                                    children: [
                                                      Container(

                                                        padding:
                                                        const EdgeInsets.all(6),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                          color:const Color(0xffA9DDF5),
                                                        ),
                                                        child: const Row(
                                                          children: [
                                                            Center(
                                                                child: Text('Web',
                                                                    style: TextStyle(

                                                                      fontFamily:
                                                                      'InterRegular',
                                                                      fontSize: 12,
                                                                    ))),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(width: 10,),
                                                      Container(padding:
                                                      const EdgeInsets.all(6),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                          color:const Color(0xffFFC9AC),
                                                        ),
                                                        child: const Row(
                                                          children: [
                                                            Center(
                                                                child: Text('IOS',
                                                                    style: TextStyle(

                                                                      fontFamily:
                                                                      'InterRegular',
                                                                      fontSize: 12,
                                                                    ))),
                                                          ],
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(top: 25, left: 8),
                                                  child:  Row(
                                                    children: [
                                                      Text('2/24',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880),),),
                                                      SizedBox(width: 10,),
                                                      SizedBox(
                                                        width: 150,
                                                        child: StepProgressIndicator(
                                                          totalSteps: 100,
                                                          currentStep: 30,
                                                          size: 5,
                                                          padding: 0,
                                                          selectedColor: Color(0xff7DC066),
                                                          unselectedColor: Color(0xffEEEEEE),
                                                          roundedEdges: Radius.circular(10),
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 5, top: 18),
                                                  child: Transform.translate(
                                                    offset: const Offset(0, 0),
                                                    child: Stack(
                                                      clipBehavior: Clip.none,
                                                      children: [
                                                        Transform.translate(
                                                          offset: const Offset(-30, 0),
                                                          child: Container(
                                                            width: 32,
                                                            height: 32,
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(15),
                                                            ),
                                                            child:
                                                            Center(child: Image.asset('assets/avatar-7 1.png')),
                                                          ),
                                                        ),
                                                        Positioned(
                                                            left: -10,
                                                            child: Transform.translate(
                                                              offset: const Offset(5, 0),
                                                              child: Container(
                                                                width: 32,
                                                                height: 32,
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(15),
                                                                ),
                                                                child: Center(
                                                                    child: Image.asset('assets/avatar-6 1.png')),
                                                              ),
                                                            )),

                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 25, left: 8),
                                                  child:  Row(
                                                    children: [
                                                      Image.asset('assets/profile-add.png',height: 16,color: const Color(0xff9DA2A7),)
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 25, left: 8),
                                                  child: Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),),
                                                ),

                                              ],
                                            ),
                                            TableRow(
                                              children: <Widget>[
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 18, left: 3),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        padding: const EdgeInsets.all(5),
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(12),
                                                          color: const Color(0xffF5F5F5),
                                                        ),
                                                        child: Center(
                                                          child: Row(
                                                            children: [
                                                              Image.asset('assets/timer.png',height: 16,color: const Color(0xff727880)),
                                                              const SizedBox(width: 10,),
                                                              const Text('May 20',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880))),
                                                            ],
                                                          ),
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 22, left: 8),
                                                  child: Text(
                                                    'versions have evolved over Various',
                                                    style: TextStyle(
                                                        fontFamily: 'InterRegular',
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 14,
                                                        color: notifire.getblackcolor),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 18, left: 3),
                                                  child: Row(
                                                    children: [
                                                      Container(

                                                        padding:
                                                        const EdgeInsets.all(6),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                          color:const Color(0xffD9B7FB),
                                                        ),
                                                        child: const Row(
                                                          children: [
                                                            Center(
                                                                child: Text('Web',
                                                                    style: TextStyle(

                                                                      fontFamily:
                                                                      'InterRegular',
                                                                      fontSize: 12,
                                                                    ))),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(width: 10,),
                                                      Container(padding:
                                                      const EdgeInsets.all(6),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                          color:const Color(0xffFFC9AC),
                                                        ),
                                                        child: const Row(
                                                          children: [
                                                            Center(
                                                                child: Text('Android',
                                                                    style: TextStyle(

                                                                      fontFamily:
                                                                      'InterRegular',
                                                                      fontSize: 12,
                                                                    ))),
                                                          ],
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(top: 25, left: 8),
                                                  child:  Row(
                                                    children: [
                                                      Text('2/24',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880),),),
                                                      SizedBox(width: 10,),
                                                      SizedBox(
                                                        width: 150,
                                                        child: StepProgressIndicator(
                                                          totalSteps: 100,
                                                          currentStep: 80,
                                                          size: 5,
                                                          padding: 0,
                                                          selectedColor: Color(0xff7DC066),
                                                          unselectedColor: Color(0xffEEEEEE),
                                                          roundedEdges: Radius.circular(10),
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 5, top: 18),
                                                  child: Transform.translate(
                                                    offset: const Offset(0, 0),
                                                    child: Stack(
                                                      clipBehavior: Clip.none,
                                                      children: [
                                                        Transform.translate(
                                                          offset: const Offset(-30, 0),
                                                          child: Container(
                                                            width: 32,
                                                            height: 32,
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(15),
                                                            ),
                                                            child:
                                                            Center(child: Image.asset('assets/avatar-6 1.png')),
                                                          ),
                                                        ),
                                                        Positioned(
                                                            left: -10,
                                                            child: Transform.translate(
                                                              offset: const Offset(5, 0),
                                                              child: Container(
                                                                width: 32,
                                                                height: 32,
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(15),
                                                                ),
                                                                child: Center(
                                                                    child: Image.asset('assets/avatar-7 1.png')),
                                                              ),
                                                            )),
                                                        Positioned(
                                                            left: 5,
                                                            child: Transform.translate(
                                                              offset: const Offset(15, 0),
                                                              child: Container(
                                                                width: 32,
                                                                height: 32,
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(15),
                                                                ),
                                                                child: Center(
                                                                    child: Image.asset('assets/avatar-8 1.png')),
                                                              ),
                                                            )),
                                                        Positioned(
                                                            child: Transform.translate(
                                                              offset: const Offset(45, 0),
                                                              child: Container(
                                                                width: 32,
                                                                height: 32,
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(15),
                                                                  color: const Color(0xffEEEEEE),
                                                                ),
                                                                child: const Center(
                                                                    child: Text(
                                                                      '+5',
                                                                      style:
                                                                      TextStyle(color: Color(0xffE5646C), fontSize: 14),
                                                                    )),
                                                              ),
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 25, left: 8),
                                                  child:  Row(
                                                    children: [
                                                      Image.asset('assets/profile-add.png',height: 16,color: const Color(0xff9DA2A7),)
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 25, left: 8),
                                                  child: Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),),
                                                ),

                                              ],
                                            ),
                                            TableRow(
                                              children: <Widget>[
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 18, left: 3),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        padding: const EdgeInsets.all(5),
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(12),
                                                          color: const Color(0xffF5F5F5),
                                                        ),
                                                        child: Center(
                                                          child: Row(
                                                            children: [
                                                              Image.asset('assets/timer.png',height: 16,color: const Color(0xff727880)),
                                                              const SizedBox(width: 10,),
                                                              const Text('Nov 10',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880))),
                                                            ],
                                                          ),
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 22, left: 8),
                                                  child: Text(
                                                    'All the Lorem Ipsum generators',
                                                    style: TextStyle(
                                                        fontFamily: 'InterRegular',
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 14,
                                                        color: notifire.getblackcolor),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 18, left: 3),
                                                  child: Row(
                                                    children: [
                                                      Container(

                                                        padding:
                                                        const EdgeInsets.all(6),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                          color:const Color(0xffA9DDF5),
                                                        ),
                                                        child: const Row(
                                                          children: [
                                                            Center(
                                                                child: Text('Web',
                                                                    style: TextStyle(

                                                                      fontFamily:
                                                                      'InterRegular',
                                                                      fontSize: 12,
                                                                    ))),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(width: 10,),
                                                      Container(padding:
                                                      const EdgeInsets.all(6),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                          color:const Color(0xffFFC9AC),
                                                        ),
                                                        child: const Row(
                                                          children: [
                                                            Center(
                                                                child: Text('IOS',
                                                                    style: TextStyle(

                                                                      fontFamily:
                                                                      'InterRegular',
                                                                      fontSize: 12,
                                                                    ))),
                                                          ],
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(top: 25, left: 8),
                                                  child:  Row(
                                                    children: [
                                                      Text('2/24',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff727880),),),
                                                      SizedBox(width: 10,),
                                                      SizedBox(
                                                        width: 150,
                                                        child: StepProgressIndicator(
                                                          totalSteps: 100,
                                                          currentStep: 30,
                                                          size: 5,
                                                          padding: 0,
                                                          selectedColor: Color(0xff7DC066),
                                                          unselectedColor: Color(0xffEEEEEE),
                                                          roundedEdges: Radius.circular(10),
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 5, top: 18),
                                                  child: Transform.translate(
                                                    offset: const Offset(0, 0),
                                                    child: Stack(
                                                      clipBehavior: Clip.none,
                                                      children: [
                                                        Transform.translate(
                                                          offset: const Offset(-30, 0),
                                                          child: Container(
                                                            width: 32,
                                                            height: 32,
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(15),
                                                            ),
                                                            child:
                                                            Center(child: Image.asset('assets/avatar-7 1.png')),
                                                          ),
                                                        ),
                                                        Positioned(
                                                            left: -10,
                                                            child: Transform.translate(
                                                              offset: const Offset(5, 0),
                                                              child: Container(
                                                                width: 32,
                                                                height: 32,
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(15),
                                                                ),
                                                                child: Center(
                                                                    child: Image.asset('assets/avatar-6 1.png')),
                                                              ),
                                                            )),

                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 25, left: 8),
                                                  child:  Row(
                                                    children: [
                                                      Image.asset('assets/profile-add.png',height: 16,color: const Color(0xff9DA2A7),)
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 25, left: 8),
                                                  child: Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),),
                                                ),

                                              ],
                                            ),
                                            const TableRow(children: [

                                              Padding(
                                                padding: EdgeInsets.only(top: 10),
                                                child: Divider(
                                                  height: 10,
                                                  color: Colors.transparent,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(top: 10),
                                                child: Divider(
                                                  height: 10,
                                                  color: Colors.transparent,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(top: 10),
                                                child: Divider(
                                                  height: 10,
                                                  color: Colors.transparent,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(top: 10),
                                                child: Divider(
                                                  height: 10,
                                                  color: Colors.transparent,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(top: 10),
                                                child: Divider(
                                                  height: 10,
                                                  color: Colors.transparent,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(top: 10),
                                                child: Divider(
                                                  height: 10,
                                                  color: Colors.transparent,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(top: 10),
                                                child: Divider(
                                                  height: 10,
                                                  color: Colors.transparent,
                                                ),
                                              ),
                                            ]),
                                          ],
                                        ),
                                      ),
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
              ],
            ),
          ),
        ],
      );
    }
  }
}
