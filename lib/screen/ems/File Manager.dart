
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
// ignore_for_file: prefer_const_constructors, file_names, camel_case_types
import 'package:provider/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../confing/Rtl.dart';
import '../../confing/colors.dart';

import '../../confing/list.dart';
import '../../confing/notifier.dart';
import '../../controller/page_controller.dart';
import '../Dashboard/Dashboard_main.dart';

import '../login/login.dart';
// ignore_for_file: deprecated_member_use
class EMS extends StatefulWidget {
  const EMS({super.key});

  @override
  State<EMS> createState() => _FileManagerState();
}

class _FileManagerState extends State<EMS> {
  late ColorNotifier notifire;
  TextEditingController dateController1 = TextEditingController();
  int selectIndex = 0;


  DateTime? sdate;
  TimeOfDay? selectTime;
  DateTime selectedDate1 = DateTime.now();
  SampleItem? selectedMenu;

  bool cont = false;
  InboxController inboxController = Get.put(InboxController());

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifier>(context, listen: true);
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return  Container(
            height: Get.height,
            color: notifire.getbgcolor10,
            child:  SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      container(constraints.maxWidth),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
        else if (constraints.maxWidth < 1000) {
          return Container(
            color: notifire.getbgcolor10,
            child:  SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        container(constraints.maxWidth),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        else {
          return Container(
            color: notifire.getbgcolor10,
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

  Widget firstContainer({context, constraints,}) {
    return Padding(
      padding: const EdgeInsets.only(right: 20,left: 20,bottom: 20),
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
              Text('File Manager',style: TextStyle(color: greyy,fontSize: 14,fontFamily: 'InterRegular'),),
              const SizedBox(width: 10,),
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: greyy,),),
              const SizedBox(width: 10,),
              Text('File Manager',style: TextStyle(color: notifire.getblackcolor,fontSize: 14,fontFamily: 'InterRegular'),),
            ],
          ),
          const SizedBox(height: 20,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(flex: 2, child: container(constraints)),
              const SizedBox(width: 10),
              Expanded(
                flex: 5,
                child: cont ?  container2(constraints) : container1(constraints),
              )
            ],
          ),
        ],
      ),
    );
  }


  Widget container(constraints) {
    return
      constraints < 600 ?
      Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
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
                  Text('File Manager',style: TextStyle(color: greyy,fontSize: 14,fontFamily: 'InterRegular'),),
                  const SizedBox(width: 10,),

                ],
              ),
              const SizedBox(height: 20,),
              Container(

                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(color: notifire.getbgcolor11,borderRadius: BorderRadius.circular(12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    PopupMenuButton(
                      tooltip: '',
                      padding: const EdgeInsets.all(10),
                      offset: const Offset(0, 50),
                      shape:
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      initialValue: selectedMenu,
                      elevation: 1,
                      shadowColor: Colors.grey,
                      color: notifire.getbgcolor11,
                      itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
                        PopupMenuItem<SampleItem>(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          height: 35,
                          enabled: false,
                          value: SampleItem.itemOne,
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/document-upload.svg',height: 16,color: notifire.getblackcolor),
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
                                itemBuilder: (context) => <PopupMenuEntry<SampleItem>>[
                                  PopupMenuItem(
                                      padding: EdgeInsets.zero,
                                      child: Container(
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: notifire.getbgcolor11),
                                        padding: const EdgeInsets.all(12),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Upload New File',style: TextStyle(fontSize: 20,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                                            const SizedBox(height: 20,),
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: notifire.getbgcolor10,
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
                                            const SizedBox(height: 20,),
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
                                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: notifire.getbgcolor11,),
                                                    child: const Text('Cancel',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',)),
                                                  ),
                                                ),
                                                const SizedBox(width: 10,),
                                                Container(
                                                  padding: const EdgeInsets.all(12),
                                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: const Color(0xff595FE5)),
                                                  child: const Text('Upload',style: TextStyle(fontFamily: 'InterRegular',fontSize: 12,fontWeight: FontWeight.w600,color: Colors.white)),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                  )
                                ],
                                child:  Text(
                                  'Upload New File',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'InterRegular',
                                      color: notifire.getblackcolor),
                                ),
                              )
                            ],
                          ),
                        ),
                        PopupMenuItem<SampleItem>(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          height: 35,
                          enabled: false,
                          value: SampleItem.itemTwo,
                          child: InkWell(
                            onTap: () {
                              PopupMenuButton(
                                tooltip: '',
                                padding: const EdgeInsets.all(10),
                                offset: const Offset(0, 50),
                                shape:
                                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                initialValue: selectedMenu,
                                elevation: 1,
                                shadowColor: Colors.grey,
                                color: notifire.getbgcolor11,
                                itemBuilder: (context) => <PopupMenuEntry<SampleItem>>[
                                  PopupMenuItem(child: InkWell(
                                    onTap: () {
                                      PopupMenuButton(
                                        tooltip: '',
                                        padding: const EdgeInsets.all(10),
                                        offset: const Offset(0, 50),
                                        shape:
                                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                        initialValue: selectedMenu,
                                        elevation: 1,
                                        shadowColor: Colors.grey,
                                        color: notifire.getbgcolor10,
                                        itemBuilder: (context) => <PopupMenuEntry<SampleItem>>[
                                          PopupMenuItem(child: Column(
                                            children: [
                                              Text('Upload New File',style: TextStyle(fontFamily: 'InterRegular',fontSize: 20,color: notifire.getblackcolor),)
                                            ],
                                          ))
                                        ],);
                                    },
                                    child:  Column(
                                      children: [
                                        Text('Upload New File',style: TextStyle(fontFamily: 'InterRegular',fontSize: 20,fontWeight: FontWeight.w600,color: notifire.getblackcolor),)
                                      ],
                                    ),
                                  ))
                                ],);
                            },
                            child: Row(
                              children: [
                                SvgPicture.asset('assets/folder-add.svg',height: 16,color: notifire.getblackcolor),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Create New Folder',
                                  style: TextStyle(
                                      color: notifire.getblackcolor,
                                      fontSize: 15,
                                      fontFamily: 'InterRegular'),
                                )
                              ],
                            ),
                          ),
                        ),

                      ],
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color(0xff595FE5)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 16,
                              width: 16,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white),
                              child: const Center(
                                  child: Icon(Icons.add,
                                      size: 12, color: Color(0xff595FE5))),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              'Add New',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'InterRegular',
                                  color: Colors.white,
                                  fontSize: 16),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ListView.builder(
                      shrinkWrap: true,physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: model().File1.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectIndex = index;
                              Navigator.push(context, MaterialPageRoute(builder: (context) => container1(constraints)));
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 30),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image.asset(model().File[index],
                                        height: 18,
                                        color: selectIndex == index
                                            ? const Color(0xff595FE5)
                                            : const Color(0xffC6C8CB)),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      model().File2[index],
                                      style: TextStyle(
                                          fontFamily: 'InterRegular',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: selectIndex == index
                                              ? const Color(0xff595FE5)
                                              : const Color(0xff9DA2A7)),
                                    ),
                                    const Spacer(),
                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12),
                                          color: selectIndex == index
                                              ? const Color(0xffEBECFF)
                                              : notifire.getbgcolor10),
                                      child: Text(model().File1[index],
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',
                                              color: selectIndex == index
                                                  ? const Color(0xff595FE5)
                                                  : const Color(0xff727880),
                                              fontSize: 10,
                                              fontWeight: FontWeight.w600)),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color(0xffE6F9EF)),
                      child: const Column(
                        children: [
                          Text(
                            '1.26 GB of 25 GB',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'InterRegular',
                                color: Color(0xff7DC066)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          StepProgressIndicator(
                            totalSteps: 100,
                            currentStep: 32,
                            size: 8,
                            padding: 0,
                            selectedColor: Color(0xff7DC066),
                            unselectedColor: Colors.white,
                            roundedEdges: Radius.circular(10),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ) :
      Container(
        height: Get.height,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
          color: notifire.getbgcolor11, ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              PopupMenuButton(
                tooltip: '',
                padding: const EdgeInsets.all(10),
                offset: const Offset(0, 50),
                shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                initialValue: selectedMenu,
                elevation: 1,
                shadowColor: Colors.grey,
                color: notifire.getbgcolor11,
                itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
                  PopupMenuItem<SampleItem>(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    height: 35,
                    enabled: false,
                    value: SampleItem.itemOne,
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/document-upload.svg',height: 16,color: notifire.getblackcolor),
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
                          itemBuilder: (context) => <PopupMenuEntry<SampleItem>>[
                            PopupMenuItem(
                                padding: EdgeInsets.zero,
                                child: Container(
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: notifire.getbgcolor11,),
                                  padding: const EdgeInsets.all(12),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Upload New File',style: TextStyle(fontSize: 20,fontFamily: 'InterRegular',color: notifire.getblackcolor),),
                                      const SizedBox(height: 20,),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: notifire.getbgcolor10,
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
                                      const SizedBox(height: 20,),
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
                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: notifire.getbgcolor10,),
                                              child: const Text('Cancel',style: TextStyle(color: Color(0xff727880),fontSize: 12,fontFamily: 'InterRegular',)),
                                            ),
                                          ),
                                          const SizedBox(width: 10,),
                                          Container(
                                            padding: const EdgeInsets.all(12),
                                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: const Color(0xff595FE5)),
                                            child: const Text('Upload',style: TextStyle(fontFamily: 'InterRegular',fontSize: 12,fontWeight: FontWeight.w600,color: Colors.white)),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )
                            )
                          ],
                          child:  Text(
                            'Upload New File',
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'InterRegular',
                                color: notifire.getblackcolor),
                          ),
                        )
                      ],
                    ),
                  ),
                  PopupMenuItem<SampleItem>(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    height: 35,
                    enabled: false,
                    value: SampleItem.itemTwo,
                    child: InkWell(
                      onTap: () {
                        PopupMenuButton(
                          tooltip: '',
                          padding: const EdgeInsets.all(10),
                          offset: const Offset(0, 50),
                          shape:
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          initialValue: selectedMenu,
                          elevation: 1,
                          shadowColor: Colors.grey,
                          color: notifire.getbgcolor10,
                          itemBuilder: (context) => <PopupMenuEntry<SampleItem>>[
                            PopupMenuItem(child: InkWell(
                              onTap: () {
                                PopupMenuButton(
                                  tooltip: '',
                                  padding: const EdgeInsets.all(10),
                                  offset: const Offset(0, 50),
                                  shape:
                                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                  initialValue: selectedMenu,
                                  elevation: 1,
                                  shadowColor: Colors.grey,
                                  color: notifire.getbgcolor10,
                                  itemBuilder: (context) => <PopupMenuEntry<SampleItem>>[
                                    PopupMenuItem(child: Column(
                                      children: [
                                        Text('Upload New File',style: TextStyle(fontFamily: 'InterRegular',fontSize: 20,color: notifire.getblackcolor),)
                                      ],
                                    ))
                                  ],);
                              },
                              child:  Column(
                                children: [
                                  Text('Upload New File',style: TextStyle(fontFamily: 'InterRegular',fontSize: 20,fontWeight: FontWeight.w600,color: notifire.getblackcolor),)
                                ],
                              ),
                            ))
                          ],);
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/folder-add.svg',height: 16,color: notifire.getblackcolor),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Create New Folder',
                            style: TextStyle(
                                color: notifire.getblackcolor,
                                fontSize: 15,
                                fontFamily: 'InterRegular'),
                          )
                        ],
                      ),
                    ),
                  ),

                ],
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xff595FE5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 16,
                        width: 16,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white),
                        child: const Center(
                            child: Icon(Icons.add,
                                size: 12, color: Color(0xff595FE5))),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Add New',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: 'InterRegular',
                            color: Colors.white,
                            fontSize: 16),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: model().File1.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectIndex = index;

                      });
                    } ,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.asset(model().File[index],
                                  height: 18,
                                  color: selectIndex == index
                                      ? const Color(0xff595FE5)
                                      : const Color(0xffC6C8CB)),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                model().File2[index],
                                style: TextStyle(
                                    fontFamily: 'InterRegular',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: selectIndex == index
                                        ? const Color(0xff595FE5)
                                        : const Color(0xff9DA2A7)),
                              ),
                              const Spacer(),
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: selectIndex == index
                                        ? const Color(0xffEBECFF)
                                        : notifire.getbgcolor10),
                                child: Text(model().File1[index],
                                    style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        color: selectIndex == index
                                            ? const Color(0xff595FE5)
                                            : const Color(0xff727880),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600)),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xffE6F9EF)),
                child: const Column(
                  children: [
                    Text(
                      '1.26 GB of 25 GB',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'InterRegular',
                          color: Color(0xff7DC066)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    StepProgressIndicator(
                      totalSteps: 100,
                      currentStep: 32,
                      size: 8,
                      padding: 0,
                      selectedColor: Color(0xff7DC066),
                      unselectedColor: Colors.white,
                      roundedEdges: Radius.circular(10),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
  }


  bool isdark = false;
  Widget container1(constraints) {
    return constraints < 600 ?
    Scaffold(
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
      backgroundColor: notifire.getbgcolor10,
      body : SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  Center(
                    child: SizedBox(
                      width: Get.width,
                      child: Container(
                        decoration:  BoxDecoration(
                          color: notifire.getbgcolor11,
                        ),
                        child: Row(
                          children: [
                            TabBar(

                              indicatorColor: const Color(0xff2a70fe),
                              isScrollable: true,
                              tabs: <Widget>[
                                Tab(
                                    child: Row(
                                      children: [
                                        Image.asset('assets/menu.png'
                                          , height: 20,color: notifire.getblackcolor,),

                                      ],
                                    )),
                                Tab(
                                    child: Row(
                                      children: [
                                        Image.asset('assets/Icon Left(11).png',
                                            height: 20, color: notifire.getblackcolor),

                                      ],
                                    )),
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                      SizedBox(
                        height: Get.height  ,
                        child:  TabBarView(
                          children: [
                            SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Quick Access',
                                      style: TextStyle(
                                        fontSize: 18,color: notifire.getblackcolor,
                                        fontFamily: 'InterRegular',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    GridView.builder( physics: const NeverScrollableScrollPhysics(),
                                      gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 1,
                                        mainAxisExtent: Get.height * 0.28,
                                        crossAxisSpacing: 20,
                                        mainAxisSpacing: 20,
                                      ),
                                      shrinkWrap: true,
                                      itemCount: 4,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => container2(constraints),)),

                                          child: Container(
                                            padding: const EdgeInsets.all(14),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(12),
                                              color: notifire.getbgcolor11,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    SvgPicture.asset(
                                                        'assets/star.svg',
                                                        height: 16,
                                                        color: const Color(0xffC6C8CB)),
                                                    const Spacer(),
                                                    Image.asset('assets/more.png',
                                                        height: 16,
                                                        color: const Color(0xffC6C8CB)),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,

                                                  children: [
                                                    Image.asset(
                                                      model().File3[index],
                                                      height: 50,
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    Text(
                                                      model().File4[index],
                                                      style:  TextStyle(
                                                        fontFamily: 'InterRegular',
                                                        fontSize: 14,color: notifire.getblackcolor,
                                                      ),
                                                      textAlign: TextAlign.center,
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      model().File5[index],
                                                      style: const TextStyle(
                                                        fontSize: 14,
                                                        color: Color(0xff9DA2A7),
                                                        fontFamily: 'InterRegular',
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      'Folders',
                                      style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        fontSize: 18,color: notifire.getblackcolor,
                                      ),
                                    ),
                                    const SizedBox(height: 10,),
                                    GridView.builder( physics: const NeverScrollableScrollPhysics(),
                                      gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 1,
                                        mainAxisExtent: Get.height * 0.28,
                                        crossAxisSpacing: 20,
                                        mainAxisSpacing: 20,
                                      ),
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      itemCount: 3,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => container2(constraints),)),

                                          child: Container(
                                            padding: const EdgeInsets.all(14),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(12),
                                              color: notifire.getbgcolor11,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    const Spacer(),
                                                    Image.asset('assets/more.png',
                                                        height: 16,
                                                        color: const Color(0xffC6C8CB)),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  children: [
                                                    Image.asset(
                                                      model().File6[index],
                                                      height: 50,
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    Text(
                                                      model().File7[index],
                                                      style:  TextStyle(
                                                        fontFamily: 'InterRegular',
                                                        fontSize: 14,color: notifire.getblackcolor,
                                                      ),
                                                      textAlign: TextAlign.center,
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      model().File8[index],
                                                      style: const TextStyle(
                                                        fontSize: 14,
                                                        color: Color(0xff9DA2A7),
                                                        fontFamily: 'InterRegular',
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      'Files',
                                      style: TextStyle(
                                        fontSize: 18,color: notifire.getblackcolor,
                                        fontFamily: 'InterRegular',
                                        fontWeight: FontWeight.w500,

                                      ),
                                    ),
                                    const SizedBox(height: 10,),
                                    GridView.builder(
                                      gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 1,
                                        mainAxisExtent: Get.height * 0.28,
                                        
                                        crossAxisSpacing: 20,
                                        mainAxisSpacing: 20,
                                      ),
                                      shrinkWrap: true,
                                      itemCount: 3,physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => container2(constraints),)),

                                          child: Container(
                                            padding: const EdgeInsets.all(14),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(12),
                                              color: notifire.getbgcolor11,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    SvgPicture.asset(
                                                        'assets/star.svg',
                                                        height: 16,
                                                        color: const Color(0xffC6C8CB)),
                                                    const Spacer(),
                                                    Image.asset('assets/more.png',
                                                        height: 16,
                                                        color: const Color(0xffC6C8CB)),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,

                                                  children: [
                                                    Image.asset(
                                                      model().File9[index],
                                                      height: 50,
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    Text(
                                                      model().File4[index],
                                                      style:  TextStyle(
                                                        fontFamily: 'InterRegular',
                                                        fontSize: 14,color: notifire.getblackcolor,
                                                      ),
                                                      textAlign: TextAlign.center,
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      model().File5[index],
                                                      style: const TextStyle(
                                                        fontSize: 14,
                                                        color: Color(0xff9DA2A7),
                                                        fontFamily: 'InterRegular',
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Quick Access',
                                      style: TextStyle(
                                        fontSize: 18,color: notifire.getblackcolor,
                                        fontFamily: 'InterRegular',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    GridView.builder(physics: const NeverScrollableScrollPhysics(),
                                      gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 1,
                                        mainAxisExtent: Get.height * 0.28,
                                        crossAxisSpacing: 20,
                                        mainAxisSpacing: 20,
                                      ),
                                      shrinkWrap: true,
                                      itemCount: 4,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => container2(constraints),)),

                                          child: Container(
                                            padding: const EdgeInsets.all(14),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(12),
                                              color: notifire.getbgcolor11,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    SvgPicture.asset(
                                                        'assets/star.svg',
                                                        height: 16,
                                                        color: const Color(0xffC6C8CB)),
                                                    const Spacer(),
                                                    Image.asset('assets/more.png',
                                                        height: 16,
                                                        color: const Color(0xffC6C8CB)),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,

                                                  children: [
                                                    Image.asset(
                                                      model().File3[index],
                                                      height: 50,
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    Text(
                                                      model().File4[index],
                                                      style:  TextStyle(
                                                          fontFamily: 'InterRegular',
                                                          fontSize: 14, color: notifire.getblackcolor
                                                      ),
                                                      textAlign: TextAlign.center,
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      model().File5[index],
                                                      style: const TextStyle(
                                                        fontSize: 14,
                                                        color: Color(0xff9DA2A7),
                                                        fontFamily: 'InterRegular',
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    const SizedBox(height: 20,),
                                    Text('Folders',style: TextStyle(fontSize: 18,fontFamily: 'InterRegular',fontWeight: FontWeight.w500,color: notifire.getblackcolor),),
                                    Container(
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                          color: notifire.getbgcolor11,
                                          borderRadius: BorderRadius.circular(15)),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: constraints < 1400 ? 1500 : Get.width,
                                              child: InkWell(
                                                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => container2(constraints),)),

                                                child: Table(
                                                  border: TableBorder.all(color: Colors.transparent),
                                                  columnWidths: const <int, TableColumnWidth>{

                                                  },
                                                  children: <TableRow>[
                                                    const TableRow(
                                                      children: <Widget>[
                                                        Padding(
                                                          padding:  EdgeInsets.only(top: 25, right: 100),
                                                          child: Text('',),
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets.only(top: 25, right: 120),
                                                          child: Row(                                                           children: [
                                                            Text('Folder Name',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: Color(0xffC6C8CB)),),
                                                          ],
                                                          ),
                                                        ),
                                                        Padding(
                                                            padding: EdgeInsets.only(top: 25, left: 3),
                                                            child: Text('Date Modified',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: Color(0xffC6C8CB)),)
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets.only(top: 25, left: 8),
                                                          child: Text('Size',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: Color(0xffC6C8CB)),),
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets.only(top: 25, left: 8),
                                                          child:  Row(
                                                            children: [
                                                              Text('Total files',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: Color(0xffC6C8CB)),)
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                            padding: EdgeInsets.only(top: 25, ),
                                                            child:Row(

                                                              children: [
                                                                Text('Members',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: Color(0xffC6C8CB))),
                                                              ],
                                                            )
                                                        ),
                                                        Padding(
                                                            padding: EdgeInsets.only(top: 25,right: 20),
                                                            child:Text('',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: Color(0xffC6C8CB)))
                                                        ),
                                                      ],
                                                    ),
                                                    TableRow(
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 25, right: 100),
                                                          child: Image.asset('assets/star2.png',height: 16,),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 25, right: 120),
                                                          child: Row(
                                                            children: [
                                                              Image.asset('assets/folder-colored.png',height: 20,),
                                                              const SizedBox(width:   10,),
                                                              Text('Screen',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                            padding: const EdgeInsets.only(top: 25, left: 3),
                                                            child: Text('11 Sep 2022',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),)
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 25, left: 8),
                                                          child: Text('344.33 KB',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,  color: notifire.getblackcolor,),),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 25, left: 8),
                                                          child:  Row(
                                                            children: [
                                                              Text('201 files',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',  color: notifire.getblackcolor,),)
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
                                                            padding: const EdgeInsets.only(top: 25, ),
                                                            child:   Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),)
                                                        ),
                                                      ],
                                                    ),
                                                    dividerTable(context),
                                                    TableRow(
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 25, right: 100),
                                                          child: Image.asset('assets/star2.png',height: 16,),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 25, right: 120),
                                                          child: Row(
                                                            children: [
                                                              Image.asset('assets/folder-colored.png',height: 20,),
                                                              const SizedBox(width:   10,),
                                                              Text('Figma',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,  color: notifire.getblackcolor,),),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                            padding: const EdgeInsets.only(top: 25, left: 3),
                                                            child: Text('11 Sep 2022',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',  color: notifire.getblackcolor,),)
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 25, left: 8),
                                                          child: Text('344.33 KB',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,  color: notifire.getblackcolor,),),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 25, left: 8),
                                                          child:  Row(
                                                            children: [
                                                              Text('245 files',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',  color: notifire.getblackcolor,),)
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
                                                            padding: const EdgeInsets.only(top: 25, ),
                                                            child:   Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),)
                                                        ),
                                                      ],
                                                    ),
                                                    dividerTable(context),
                                                    TableRow(
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 25, right: 100),
                                                          child: Image.asset('assets/star2.png',height: 16,),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 25, right: 120),
                                                          child: Row(
                                                            children: [
                                                              Image.asset('assets/folder-colored.png',height: 20,),
                                                              const SizedBox(width:   10,),
                                                              Text('Preview',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                            padding: const EdgeInsets.only(top: 25, left: 3),
                                                            child: Text('11 Sep 2022',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),)
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 25, left: 8),
                                                          child: Text('344.33 KB',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 25, left: 8),
                                                          child:  Row(
                                                            children: [
                                                              Text('22 files',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),)
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
                                                                              '+8',
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
                                                            padding: const EdgeInsets.only(top: 25, ),
                                                            child:   Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),)
                                                        ),
                                                      ],
                                                    ),
                                                    dividerTable(context),
                                                    TableRow(
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 25, right: 100),
                                                          child: Image.asset('assets/star2.png',height: 16,),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 25, right: 8),
                                                          child: Row(
                                                            children: [
                                                              Image.asset('assets/folder-colored.png',height: 20,),
                                                              const SizedBox(width:   10,),
                                                              Text('Fonts Family',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                            padding: const EdgeInsets.only(top: 25, left: 3),
                                                            child: Text('11 Sep 2022',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),)
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 25, left: 8),
                                                          child: Text('344.33 KB',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 25, left: 8),
                                                          child:  Row(
                                                            children: [
                                                              Text('201 files',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),)
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
                                                            padding: const EdgeInsets.only(top: 25, ),
                                                            child:   Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),)
                                                        ),
                                                      ],
                                                    ),
                                                    dividerTable(context),
                                                    TableRow(
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 25, right: 100),
                                                          child: Image.asset('assets/star2.png',height: 16,),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 25, right: 8),
                                                          child: Row(
                                                            children: [
                                                              Image.asset('assets/folder-colored.png',height: 20,),
                                                              const SizedBox(width:   10,),
                                                              Text('Design System',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                            padding: const EdgeInsets.only(top: 25, left: 3),
                                                            child: Text('11 Sep 2022',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),)
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 25, left: 8),
                                                          child: Text('344.33 KB',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 25, left: 8),
                                                          child:  Row(
                                                            children: [
                                                              Text('245 files',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),)
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
                                                            padding: const EdgeInsets.only(top: 25, ),
                                                            child:   Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),)
                                                        ),
                                                      ],
                                                    ),
                                                    dividerTable(context),
                                                    TableRow(
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 25, right: 100),
                                                          child: Image.asset('assets/star2.png',height: 16,),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 25, right: 8),
                                                          child: Row(
                                                            children: [
                                                              Image.asset('assets/folder-colored.png',height: 20,),
                                                              const SizedBox(width:   10,),
                                                              Text('Preview',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                            padding: const EdgeInsets.only(top: 25, left: 3),
                                                            child: Text('11 Sep 2022',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),)
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 25, left: 8),
                                                          child: Text('344.33 KB',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 25, left: 8),
                                                          child:  Row(
                                                            children: [
                                                              Text('22 files',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),)
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
                                                                              '+8',
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
                                                            padding: const EdgeInsets.only(top: 25, ),
                                                            child:   Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),)
                                                        ),
                                                      ],
                                                    ),
                                                    dividerTable(context),
                                                    TableRow(
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 25, right: 100),
                                                          child: Image.asset('assets/star2.png',height: 16,),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 25, right: 8),
                                                          child: Row(
                                                            children: [
                                                              Image.asset('assets/folder-colored.png',height: 20,),
                                                              const SizedBox(width:   10,),
                                                              Text('Avatars & Brands',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                            padding: const EdgeInsets.only(top: 25, left: 3),
                                                            child: Text('11 Sep 2022',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),)
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 25, left: 8),
                                                          child: Text('344.33 KB',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 25, left: 8),
                                                          child:  Row(
                                                            children: [
                                                              Text('245 files',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),)
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
                                                            padding: const EdgeInsets.only(top: 25, ),
                                                            child:   Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),)
                                                        ),
                                                      ],
                                                    ),
                                                    dividerTable(context),
                                                    TableRow(
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 25, right: 100),
                                                          child: Image.asset('assets/star2.png',height: 16,),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 25, right: 8),
                                                          child: Row(
                                                            children: [
                                                              Image.asset('assets/folder-colored.png',height: 20,),
                                                              const SizedBox(width:   10,),
                                                              Text('Fonts Family',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                            padding: const EdgeInsets.only(top: 25, left: 3),
                                                            child: Text('11 Sep 2022',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),)
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 25, left: 8),
                                                          child: Text('344.33 KB',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 25, left: 8),
                                                          child:  Row(
                                                            children: [
                                                              Text('22 files',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),)
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
                                                                              '+8',
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
                                                            padding: const EdgeInsets.only(top: 25, ),
                                                            child:   Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),)
                                                        ),
                                                      ],
                                                    ),
                                                    dividerTable(context),
                                                    TableRow(
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 25, right: 100),
                                                          child: Image.asset('assets/star2.png',height: 16,),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 25, right: 120),
                                                          child: Row(
                                                            children: [
                                                              Image.asset('assets/folder-colored.png',height: 20,),
                                                              const SizedBox(width:   10,),
                                                              Text('Screen',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                            padding: const EdgeInsets.only(top: 25, left: 3),
                                                            child: Text('11 Sep 2022',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),)
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 25, left: 8),
                                                          child: Text('344.33 KB',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,  color: notifire.getblackcolor,),),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 25, left: 8),
                                                          child:  Row(
                                                            children: [
                                                              Text('201 files',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',  color: notifire.getblackcolor,),)
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
                                                            padding: const EdgeInsets.only(top: 25, ),
                                                            child:   Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),)
                                                        ),
                                                      ],
                                                    ),
                                                    dividerTable(context),
                                                    TableRow(
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 25, right: 100),
                                                          child: Image.asset('assets/star2.png',height: 16,),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 25, right: 120),
                                                          child: Row(
                                                            children: [
                                                              Image.asset('assets/folder-colored.png',height: 20,),
                                                              const SizedBox(width:   10,),
                                                              Text('Figma',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,  color: notifire.getblackcolor,),),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                            padding: const EdgeInsets.only(top: 25, left: 3),
                                                            child: Text('11 Sep 2022',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',  color: notifire.getblackcolor,),)
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 25, left: 8),
                                                          child: Text('344.33 KB',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,  color: notifire.getblackcolor,),),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 25, left: 8),
                                                          child:  Row(
                                                            children: [
                                                              Text('245 files',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',  color: notifire.getblackcolor,),)
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
                                                            padding: const EdgeInsets.only(top: 25, ),
                                                            child:   Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),)
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
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),

                                    Text('Files',style: TextStyle(fontSize: 18,fontFamily: 'InterRegular',fontWeight: FontWeight.w500,color: notifire.getblackcolor),),
                                    Container(

                                      width: Get.width,
                                      decoration: BoxDecoration(
                                          color: notifire.getbgcolor11,
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
                                                  // 0: FixedColumnWidth(0),
                                                  // 1: FixedColumnWidth(10),
                                                  // 2: FixedColumnWidth(50),
                                                  // 3: FixedColumnWidth(50),
                                                  // 4: FixedColumnWidth(100),
                                                  // 5: FixedColumnWidth(50),
                                                  // 6: FixedColumnWidth(50),
                                                },
                                                children: <TableRow>[
                                                  const TableRow(
                                                    children: <Widget>[
                                                      Padding(
                                                        padding:  EdgeInsets.only(top: 25, right: 100),
                                                        child: Text('',),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.only(top: 25, right: 120),
                                                        child: Row(                                                           children: [
                                                          Text('Folder Name',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: Color(0xffC6C8CB)),),
                                                        ],
                                                        ),
                                                      ),
                                                      Padding(
                                                          padding: EdgeInsets.only(top: 25, left: 3),
                                                          child: Text('Date Modified',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: Color(0xffC6C8CB)),)
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.only(top: 25, left: 8),
                                                        child: Text('Size',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: Color(0xffC6C8CB)),),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.only(top: 25, left: 8),
                                                        child:  Row(
                                                          children: [
                                                            Text('Total files',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: Color(0xffC6C8CB)),)
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                          padding: EdgeInsets.only(top: 25, ),
                                                          child:Row(

                                                            children: [
                                                              Text('Members',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: Color(0xffC6C8CB))),
                                                            ],
                                                          )
                                                      ),
                                                      Padding(
                                                          padding: EdgeInsets.only(top: 25,right: 20),
                                                          child:Text('',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: Color(0xffC6C8CB)))
                                                      ),
                                                    ],
                                                  ),
                                                  TableRow(
                                                    children: <Widget>[
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 25, right: 100),
                                                        child: Image.asset('assets/star2.png',height: 16,),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 25, right: 120),
                                                        child: Row(
                                                          children: [
                                                            Image.asset('assets/png.png',height: 20,),
                                                            const SizedBox(width:   10,),
                                                            Text('Screen',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                          padding: const EdgeInsets.only(top: 25, left: 3),
                                                          child: Text('11 Sep 2022',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),)
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 25, left: 8),
                                                        child: Text('344.33 KB',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,  color: notifire.getblackcolor,),),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 25, left: 8),
                                                        child:  Row(
                                                          children: [
                                                            Text('201 files',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',  color: notifire.getblackcolor,),)
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
                                                          padding: const EdgeInsets.only(top: 25, ),
                                                          child:   Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),)
                                                      ),
                                                    ],
                                                  ),
                                                  dividerTable(context),
                                                  TableRow(
                                                    children: <Widget>[
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 25, right: 100),
                                                        child: Image.asset('assets/star2.png',height: 16,),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 25, right: 120),
                                                        child: Row(
                                                          children: [
                                                            Image.asset('assets/png.png',height: 20,),
                                                            const SizedBox(width:   10,),
                                                            Text('Figma',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,  color: notifire.getblackcolor,),),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                          padding: const EdgeInsets.only(top: 25, left: 3),
                                                          child: Text('11 Sep 2022',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',  color: notifire.getblackcolor,),)
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 25, left: 8),
                                                        child: Text('344.33 KB',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,  color: notifire.getblackcolor,),),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 25, left: 8),
                                                        child:  Row(
                                                          children: [
                                                            Text('245 files',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',  color: notifire.getblackcolor,),)
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
                                                          padding: const EdgeInsets.only(top: 25, ),
                                                          child:   Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),)
                                                      ),
                                                    ],
                                                  ),
                                                  dividerTable(context),
                                                  TableRow(
                                                    children: <Widget>[
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 25, right: 100),
                                                        child: Image.asset('assets/star2.png',height: 16,),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 25, right: 120),
                                                        child: Row(
                                                          children: [
                                                            Image.asset('assets/png.png',height: 20,),
                                                            const SizedBox(width:   10,),
                                                            Text('Preview',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                          padding: const EdgeInsets.only(top: 25, left: 3),
                                                          child: Text('11 Sep 2022',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),)
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 25, left: 8),
                                                        child: Text('344.33 KB',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 25, left: 8),
                                                        child:  Row(
                                                          children: [
                                                            Text('22 files',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),)
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
                                                                            '+8',
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
                                                          padding: const EdgeInsets.only(top: 25, ),
                                                          child:   Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),)
                                                      ),
                                                    ],
                                                  ),
                                                  dividerTable(context),
                                                  TableRow(
                                                    children: <Widget>[
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 25, right: 100),
                                                        child: Image.asset('assets/star2.png',height: 16,),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 25, right: 8),
                                                        child: Row(
                                                          children: [
                                                            Image.asset('assets/png.png',height: 20,),
                                                            const SizedBox(width:   10,),
                                                            Text('Fonts Family',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                          padding: const EdgeInsets.only(top: 25, left: 3),
                                                          child: Text('11 Sep 2022',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),)
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 25, left: 8),
                                                        child: Text('344.33 KB',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 25, left: 8),
                                                        child:  Row(
                                                          children: [
                                                            Text('201 files',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),)
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
                                                          padding: const EdgeInsets.only(top: 25, ),
                                                          child:   Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),)
                                                      ),
                                                    ],
                                                  ),
                                                  dividerTable(context),
                                                  TableRow(
                                                    children: <Widget>[
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 25, right: 100),
                                                        child: Image.asset('assets/star2.png',height: 16,),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 25, right: 8),
                                                        child: Row(
                                                          children: [
                                                            Image.asset('assets/png.png',height: 20,),
                                                            const SizedBox(width:   10,),
                                                            Text('Design System',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                          padding: const EdgeInsets.only(top: 25, left: 3),
                                                          child: Text('11 Sep 2022',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),)
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 25, left: 8),
                                                        child: Text('344.33 KB',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 25, left: 8),
                                                        child:  Row(
                                                          children: [
                                                            Text('245 files',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),)
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
                                                          padding: const EdgeInsets.only(top: 25, ),
                                                          child:   Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),)
                                                      ),
                                                    ],
                                                  ),
                                                  dividerTable(context),
                                                  TableRow(
                                                    children: <Widget>[
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 25, right: 100),
                                                        child: Image.asset('assets/star2.png',height: 16,),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 25, right: 8),
                                                        child: Row(
                                                          children: [
                                                            Image.asset('assets/png.png',height: 20,),
                                                            const SizedBox(width:   10,),
                                                            Text('Preview',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                          padding: const EdgeInsets.only(top: 25, left: 3),
                                                          child: Text('11 Sep 2022',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),)
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 25, left: 8),
                                                        child: Text('344.33 KB',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 25, left: 8),
                                                        child:  Row(
                                                          children: [
                                                            Text('22 files',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),)
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
                                                                            '+8',
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
                                                          padding: const EdgeInsets.only(top: 25, ),
                                                          child:   Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),)
                                                      ),
                                                    ],
                                                  ),
                                                  dividerTable(context),
                                                  TableRow(
                                                    children: <Widget>[
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 25, right: 100),
                                                        child: Image.asset('assets/star2.png',height: 16,),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 25, right: 8),
                                                        child: Row(
                                                          children: [
                                                            Image.asset('assets/png.png',height: 20,),
                                                            const SizedBox(width:   10,),
                                                            Text('Avatars & Brands',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                          padding: const EdgeInsets.only(top: 25, left: 3),
                                                          child: Text('11 Sep 2022',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),)
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 25, left: 8),
                                                        child: Text('344.33 KB',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 25, left: 8),
                                                        child:  Row(
                                                          children: [
                                                            Text('245 files',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),)
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
                                                          padding: const EdgeInsets.only(top: 25, ),
                                                          child:   Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),)
                                                      ),
                                                    ],
                                                  ),
                                                  dividerTable(context),
                                                  TableRow(
                                                    children: <Widget>[
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 25, right: 100),
                                                        child: Image.asset('assets/star2.png',height: 16,),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 25, right: 8),
                                                        child: Row(
                                                          children: [
                                                            Image.asset('assets/png.png',height: 20,),
                                                            const SizedBox(width:   10,),
                                                            Text('Fonts Family',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                          padding: const EdgeInsets.only(top: 25, left: 3),
                                                          child: Text('11 Sep 2022',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),)
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 25, left: 8),
                                                        child: Text('344.33 KB',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 25, left: 8),
                                                        child:  Row(
                                                          children: [
                                                            Text('22 files',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),)
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
                                                                            '+8',
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
                                                          padding: const EdgeInsets.only(top: 25, ),
                                                          child:   Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),)
                                                      ),
                                                    ],
                                                  ),
                                                  dividerTable(context),
                                                  TableRow(
                                                    children: <Widget>[
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 25, right: 100),
                                                        child: Image.asset('assets/star2.png',height: 16,),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 25, right: 8),
                                                        child: Row(
                                                          children: [
                                                            Image.asset('assets/png.png',height: 20,),
                                                            const SizedBox(width:   10,),
                                                            Text('Fonts Family',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                          padding: const EdgeInsets.only(top: 25, left: 3),
                                                          child: Text('11 Sep 2022',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),)
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 25, left: 8),
                                                        child: Text('344.33 KB',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 25, left: 8),
                                                        child:  Row(
                                                          children: [
                                                            Text('201 files',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),)
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
                                                          padding: const EdgeInsets.only(top: 25, ),
                                                          child:   Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),)
                                                      ),
                                                    ],
                                                  ),
                                                  dividerTable(context),
                                                  TableRow(
                                                    children: <Widget>[
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 25, right: 100),
                                                        child: Image.asset('assets/star2.png',height: 16,),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 25, right: 8),
                                                        child: Row(
                                                          children: [
                                                            Image.asset('assets/png.png',height: 20,),
                                                            const SizedBox(width:   10,),
                                                            Text('Design System',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                          padding: const EdgeInsets.only(top: 25, left: 3),
                                                          child: Text('11 Sep 2022',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),)
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 25, left: 8),
                                                        child: Text('344.33 KB',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 25, left: 8),
                                                        child:  Row(
                                                          children: [
                                                            Text('245 files',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),)
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
                                                          padding: const EdgeInsets.only(top: 25, ),
                                                          child:   Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),)
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
    ):
    SingleChildScrollView(
      child: Column(
        children: [
          DefaultTabController(
            length: 2,
            child: Column(
              children: [
                Center(
                  child: SizedBox(
                    width: Get.width,
                    child: Container(

                      decoration:  BoxDecoration(borderRadius: BorderRadius.circular(12),
                        color: notifire.getbgcolor11,
                      ),
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
                                      Image.asset('assets/menu.png',
                                          color: notifire.getblackcolor ,height: 16),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text('Grids',
                                          style: TextStyle(
                                              color: notifire.getblackcolor,
                                              fontFamily: 'InterRegular',
                                              fontSize: 14)),
                                    ],
                                  )),
                              Tab(
                                  child: Row(
                                    children: [
                                      Image.asset('assets/Icon Left(11).png',
                                          height: 16, color: notifire.getblackcolor),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text('Rows',
                                          style: TextStyle(
                                              color: notifire.getblackcolor,
                                              fontFamily: 'InterRegular',
                                              fontSize: 14)),
                                    ],
                                  )),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height : 10),
                SizedBox(
                  height: Get.height,
                  child: NestedScrollView(
                      headerSliverBuilder: (context, innerBoxIsScrolled) {
                        return [];
                      },
                      body: TabBarView(
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Quick Access',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'InterRegular',color: notifire.getblackcolor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                GridView.builder(
                                  gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: constraints < 1200 ?  3 : 4,
                                    // mainAxisExtent: Get.height * 0.3,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20,
                                  ),
                                  shrinkWrap: true,
                                  itemCount: model().File4.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        setState(() {
                                          if (cont == false) {
                                            cont = true;
                                          } else {
                                            cont = false;
                                          }
                                        });
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(14),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12),
                                          color: notifire.getbgcolor11,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/star.svg',
                                                    height: 16,
                                                    color: const Color(0xffC6C8CB)),
                                                const Spacer(),
                                                Image.asset('assets/more.png',
                                                    height: 16,
                                                    color: const Color(0xffC6C8CB)),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,

                                              children: [
                                                Image.asset(
                                                  model().File3[index],
                                                  height: 50,
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Text(
                                                  model().File4[index],
                                                  style:  TextStyle(
                                                      fontFamily: 'InterRegular',
                                                      fontSize: 14,color: notifire.getblackcolor
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  model().File5[index],
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    color: Color(0xff9DA2A7),
                                                    fontFamily: 'InterRegular',
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Folders',
                                  style: TextStyle(color: notifire.getblackcolor,
                                    fontFamily: 'InterRegular',
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                GridView.builder(
                                  gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: constraints < 1200 ?  3 : 4,
                                    // mainAxisExtent: Get.height * 0.3,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20,
                                  ),
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: model().File6.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        setState(() {
                                          if (cont == false) {
                                            cont = true;
                                          } else {
                                            cont = false;
                                          }
                                        });
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(14),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12),
                                          color: notifire.getbgcolor11,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                const Spacer(),
                                                Image.asset('assets/more.png',
                                                    height: 16,
                                                    color: const Color(0xffC6C8CB)),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  model().File6[index],
                                                  height: 50,
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Text(
                                                  model().File7[index],
                                                  style:  TextStyle(
                                                      fontFamily: 'InterRegular',
                                                      fontSize: 14,color: notifire.getblackcolor
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  model().File8[index],
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    color: Color(0xff9DA2A7),
                                                    fontFamily: 'InterRegular',
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Files',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'InterRegular',
                                      fontWeight: FontWeight.w500,color: notifire.getblackcolor
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                GridView.builder(
                                  gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: constraints < 1200 ?  3 : 4,
                                    // mainAxisExtent: Get.height * 0.3,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20,
                                  ),
                                  shrinkWrap: true,
                                  itemCount: model().File4.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        setState(() {
                                          if (cont == false) {
                                            cont = true;
                                          } else {
                                            cont = false;
                                          }
                                        });
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(14),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12),
                                          color: notifire.getbgcolor11,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/star.svg',
                                                    height: 16,
                                                    color: const Color(0xffC6C8CB)),
                                                const Spacer(),
                                                Image.asset('assets/more.png',
                                                    height: 16,
                                                    color: const Color(0xffC6C8CB)),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,

                                              children: [
                                                Image.asset(
                                                  model().File9[index],
                                                  height: 50,
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Text(
                                                  model().File4[index],
                                                  style:  TextStyle(
                                                      fontFamily: 'InterRegular',
                                                      fontSize: 14,color: notifire.getblackcolor
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  model().File5[index],
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    color: Color(0xff9DA2A7),
                                                    fontFamily: 'InterRegular',
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Quick Access',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'InterRegular',
                                      fontWeight: FontWeight.w500,color: notifire.getblackcolor
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                GridView.builder(
                                  gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: constraints < 1200 ?  3 : 4,
                                    // mainAxisExtent: Get.height * 0.3,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20,
                                  ),
                                  shrinkWrap: true,
                                  itemCount: model().File4.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        setState(() {
                                          if (cont == false) {
                                            cont = true;
                                          } else {
                                            cont = false;
                                          }
                                        });
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(14),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12),
                                          color: notifire.getbgcolor11,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/star.svg',
                                                    height: 16,
                                                    color: const Color(0xffC6C8CB)),
                                                const Spacer(),
                                                Image.asset('assets/more.png',
                                                    height: 16,
                                                    color: const Color(0xffC6C8CB)),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,

                                              children: [
                                                Image.asset(
                                                  model().File3[index],
                                                  height: 50,
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Text(
                                                  model().File4[index],
                                                  style:  TextStyle(
                                                      fontFamily: 'InterRegular',
                                                      fontSize: 14,color: notifire.getblackcolor
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  model().File5[index],
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    color: Color(0xff9DA2A7),
                                                    fontFamily: 'InterRegular',
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                const SizedBox(height: 20,),
                                Text('Folders',style: TextStyle(fontSize: 18,fontFamily: 'InterRegular',fontWeight: FontWeight.w500,color: notifire.getblackcolor),),
                                Container(
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                      color: notifire.getbgcolor11,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
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
                                            child: Table(
                                              border: TableBorder.all(color: Colors.transparent),
                                              columnWidths: const <int, TableColumnWidth>{

                                              },
                                              children: <TableRow>[
                                                const TableRow(
                                                  children: <Widget>[
                                                    Padding(
                                                      padding:  EdgeInsets.only(top: 25, right: 100),
                                                      child: Text('',),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(top: 25, right: 120),
                                                      child: Row(                                                           children: [
                                                        Text('Folder Name',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: Color(0xffC6C8CB)),),
                                                      ],
                                                      ),
                                                    ),
                                                    Padding(
                                                        padding: EdgeInsets.only(top: 25, left: 3),
                                                        child: Text('Date Modified',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: Color(0xffC6C8CB)),)
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(top: 25, left: 8),
                                                      child: Text('Size',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: Color(0xffC6C8CB)),),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(top: 25, left: 8),
                                                      child:  Row(
                                                        children: [
                                                          Text('Total files',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: Color(0xffC6C8CB)),)
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                        padding: EdgeInsets.only(top: 25, ),
                                                        child:Row(

                                                          children: [
                                                            Text('Members',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: Color(0xffC6C8CB))),
                                                          ],
                                                        )
                                                    ),
                                                    Padding(
                                                        padding: EdgeInsets.only(top: 25,right: 20),
                                                        child:Text('',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: Color(0xffC6C8CB)))
                                                    ),
                                                  ],
                                                ),
                                                TableRow(
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 25, right: 100),
                                                      child: Image.asset('assets/star2.png',height: 16,),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 25, right: 120),
                                                      child: Row(
                                                        children: [
                                                          Image.asset('assets/folder-colored.png',height: 20,),
                                                          const SizedBox(width:   10,),
                                                          Text('Screen',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                        padding: const EdgeInsets.only(top: 25, left: 3),
                                                        child: Text('11 Sep 2022',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),)
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 25, left: 8),
                                                      child: Text('344.33 KB',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,  color: notifire.getblackcolor,),),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 25, left: 8),
                                                      child:  Row(
                                                        children: [
                                                          Text('201 files',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',  color: notifire.getblackcolor,),)
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
                                                        padding: const EdgeInsets.only(top: 25, ),
                                                        child:   Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),)
                                                    ),
                                                  ],
                                                ),
                                                dividerTable(context),
                                                TableRow(
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 25, right: 100),
                                                      child: Image.asset('assets/star2.png',height: 16,),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 25, right: 120),
                                                      child: Row(
                                                        children: [
                                                          Image.asset('assets/folder-colored.png',height: 20,),
                                                          const SizedBox(width:   10,),
                                                          Text('Figma',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,  color: notifire.getblackcolor,),),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                        padding: const EdgeInsets.only(top: 25, left: 3),
                                                        child: Text('11 Sep 2022',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',  color: notifire.getblackcolor,),)
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 25, left: 8),
                                                      child: Text('344.33 KB',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,  color: notifire.getblackcolor,),),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 25, left: 8),
                                                      child:  Row(
                                                        children: [
                                                          Text('245 files',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',  color: notifire.getblackcolor,),)
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
                                                        padding: const EdgeInsets.only(top: 25, ),
                                                        child:   Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),)
                                                    ),
                                                  ],
                                                ),
                                                dividerTable(context),
                                                TableRow(
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 25, right: 100),
                                                      child: Image.asset('assets/star2.png',height: 16,),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 25, right: 120),
                                                      child: Row(
                                                        children: [
                                                          Image.asset('assets/folder-colored.png',height: 20,),
                                                          const SizedBox(width:   10,),
                                                          Text('Preview',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                        padding: const EdgeInsets.only(top: 25, left: 3),
                                                        child: Text('11 Sep 2022',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),)
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 25, left: 8),
                                                      child: Text('344.33 KB',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 25, left: 8),
                                                      child:  Row(
                                                        children: [
                                                          Text('22 files',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),)
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
                                                                          '+8',
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
                                                        padding: const EdgeInsets.only(top: 25, ),
                                                        child:   Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),)
                                                    ),
                                                  ],
                                                ),
                                                dividerTable(context),
                                                TableRow(
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 25, right: 100),
                                                      child: Image.asset('assets/star2.png',height: 16,),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 25, right: 8),
                                                      child: Row(
                                                        children: [
                                                          Image.asset('assets/folder-colored.png',height: 20,),
                                                          const SizedBox(width:   10,),
                                                          Text('Fonts Family',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                        padding: const EdgeInsets.only(top: 25, left: 3),
                                                        child: Text('11 Sep 2022',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),)
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 25, left: 8),
                                                      child: Text('344.33 KB',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 25, left: 8),
                                                      child:  Row(
                                                        children: [
                                                          Text('201 files',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),)
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
                                                        padding: const EdgeInsets.only(top: 25, ),
                                                        child:   Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),)
                                                    ),
                                                  ],
                                                ),
                                                dividerTable(context),
                                                TableRow(
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 25, right: 100),
                                                      child: Image.asset('assets/star2.png',height: 16,),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 25, right: 8),
                                                      child: Row(
                                                        children: [
                                                          Image.asset('assets/folder-colored.png',height: 20,),
                                                          const SizedBox(width:   10,),
                                                          Text('Design System',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                        padding: const EdgeInsets.only(top: 25, left: 3),
                                                        child: Text('11 Sep 2022',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),)
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 25, left: 8),
                                                      child: Text('344.33 KB',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 25, left: 8),
                                                      child:  Row(
                                                        children: [
                                                          Text('245 files',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),)
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
                                                        padding: const EdgeInsets.only(top: 25, ),
                                                        child:   Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),)
                                                    ),
                                                  ],
                                                ),
                                                dividerTable(context),
                                                TableRow(
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 25, right: 100),
                                                      child: Image.asset('assets/star2.png',height: 16,),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 25, right: 8),
                                                      child: Row(
                                                        children: [
                                                          Image.asset('assets/folder-colored.png',height: 20,),
                                                          const SizedBox(width:   10,),
                                                          Text('Preview',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                        padding: const EdgeInsets.only(top: 25, left: 3),
                                                        child: Text('11 Sep 2022',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),)
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 25, left: 8),
                                                      child: Text('344.33 KB',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 25, left: 8),
                                                      child:  Row(
                                                        children: [
                                                          Text('22 files',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),)
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
                                                                          '+8',
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
                                                        padding: const EdgeInsets.only(top: 25, ),
                                                        child:   Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),)
                                                    ),
                                                  ],
                                                ),
                                                dividerTable(context),
                                                TableRow(
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 25, right: 100),
                                                      child: Image.asset('assets/star2.png',height: 16,),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 25, right: 8),
                                                      child: Row(
                                                        children: [
                                                          Image.asset('assets/folder-colored.png',height: 20,),
                                                          const SizedBox(width:   10,),
                                                          Text('Avatars & Brands',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                        padding: const EdgeInsets.only(top: 25, left: 3),
                                                        child: Text('11 Sep 2022',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),)
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 25, left: 8),
                                                      child: Text('344.33 KB',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 25, left: 8),
                                                      child:  Row(
                                                        children: [
                                                          Text('245 files',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),)
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
                                                        padding: const EdgeInsets.only(top: 25, ),
                                                        child:   Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),)
                                                    ),
                                                  ],
                                                ),
                                                dividerTable(context),
                                                TableRow(
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 25, right: 100),
                                                      child: Image.asset('assets/star2.png',height: 16,),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 25, right: 8),
                                                      child: Row(
                                                        children: [
                                                          Image.asset('assets/folder-colored.png',height: 20,),
                                                          const SizedBox(width:   10,),
                                                          Text('Fonts Family',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                        padding: const EdgeInsets.only(top: 25, left: 3),
                                                        child: Text('11 Sep 2022',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),)
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 25, left: 8),
                                                      child: Text('344.33 KB',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 25, left: 8),
                                                      child:  Row(
                                                        children: [
                                                          Text('22 files',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),)
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
                                                                          '+8',
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
                                                        padding: const EdgeInsets.only(top: 25, ),
                                                        child:   Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),)
                                                    ),
                                                  ],
                                                ),
                                                dividerTable(context),
                                                TableRow(
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 25, right: 100),
                                                      child: Image.asset('assets/star2.png',height: 16,),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 25, right: 120),
                                                      child: Row(
                                                        children: [
                                                          Image.asset('assets/folder-colored.png',height: 20,),
                                                          const SizedBox(width:   10,),
                                                          Text('Screen',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                        padding: const EdgeInsets.only(top: 25, left: 3),
                                                        child: Text('11 Sep 2022',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),)
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 25, left: 8),
                                                      child: Text('344.33 KB',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,  color: notifire.getblackcolor,),),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 25, left: 8),
                                                      child:  Row(
                                                        children: [
                                                          Text('201 files',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',  color: notifire.getblackcolor,),)
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
                                                        padding: const EdgeInsets.only(top: 25, ),
                                                        child:   Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),)
                                                    ),
                                                  ],
                                                ),
                                                dividerTable(context),
                                                TableRow(
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 25, right: 100),
                                                      child: Image.asset('assets/star2.png',height: 16,),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 25, right: 120),
                                                      child: Row(
                                                        children: [
                                                          Image.asset('assets/folder-colored.png',height: 20,),
                                                          const SizedBox(width:   10,),
                                                          Text('Figma',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,  color: notifire.getblackcolor,),),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                        padding: const EdgeInsets.only(top: 25, left: 3),
                                                        child: Text('11 Sep 2022',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',  color: notifire.getblackcolor,),)
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 25, left: 8),
                                                      child: Text('344.33 KB',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,  color: notifire.getblackcolor,),),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 25, left: 8),
                                                      child:  Row(
                                                        children: [
                                                          Text('245 files',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',  color: notifire.getblackcolor,),)
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
                                                        padding: const EdgeInsets.only(top: 25, ),
                                                        child:   Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),)
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
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20,),
                                Text('Files',style: TextStyle(fontSize: 18,fontFamily: 'InterRegular',fontWeight: FontWeight.w500,color: notifire.getblackcolor),),
                                Container(

                                  width: Get.width,
                                  decoration: BoxDecoration(
                                      color: notifire.getbgcolor11,
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
                                              // 0: FixedColumnWidth(0),
                                              // 1: FixedColumnWidth(10),
                                              // 2: FixedColumnWidth(50),
                                              // 3: FixedColumnWidth(50),
                                              // 4: FixedColumnWidth(100),
                                              // 5: FixedColumnWidth(50),
                                              // 6: FixedColumnWidth(50),
                                            },
                                            children: <TableRow>[
                                              const TableRow(
                                                children: <Widget>[
                                                  Padding(
                                                    padding:  EdgeInsets.only(top: 25, right: 100),
                                                    child: Text('',),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(top: 25, right: 120),
                                                    child: Row(                                                           children: [
                                                      Text('Folder Name',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: Color(0xffC6C8CB)),),
                                                    ],
                                                    ),
                                                  ),
                                                  Padding(
                                                      padding: EdgeInsets.only(top: 25, left: 3),
                                                      child: Text('Date Modified',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: Color(0xffC6C8CB)),)
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(top: 25, left: 8),
                                                    child: Text('Size',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: Color(0xffC6C8CB)),),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(top: 25, left: 8),
                                                    child:  Row(
                                                      children: [
                                                        Text('Total files',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: Color(0xffC6C8CB)),)
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                      padding: EdgeInsets.only(top: 25, ),
                                                      child:Row(

                                                        children: [
                                                          Text('Members',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: Color(0xffC6C8CB))),
                                                        ],
                                                      )
                                                  ),
                                                  Padding(
                                                      padding: EdgeInsets.only(top: 25,right: 20),
                                                      child:Text('',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: Color(0xffC6C8CB)))
                                                  ),
                                                ],
                                              ),
                                              TableRow(
                                                children: <Widget>[
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 25, right: 100),
                                                    child: Image.asset('assets/star2.png',height: 16,),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 25, right: 120),
                                                    child: Row(
                                                      children: [
                                                        Image.asset('assets/png.png',height: 20,),
                                                        const SizedBox(width:   10,),
                                                        Text('Screen',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                      padding: const EdgeInsets.only(top: 25, left: 3),
                                                      child: Text('11 Sep 2022',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', color: notifire.getblackcolor,),)
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 25, left: 8),
                                                    child: Text('344.33 KB',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,  color: notifire.getblackcolor,),),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 25, left: 8),
                                                    child:  Row(
                                                      children: [
                                                        Text('201 files',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',  color: notifire.getblackcolor,),)
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
                                                      padding: const EdgeInsets.only(top: 25, ),
                                                      child:   Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),)
                                                  ),
                                                ],
                                              ),
                                              dividerTable(context),
                                              TableRow(
                                                children: <Widget>[
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 25, right: 100),
                                                    child: Image.asset('assets/star2.png',height: 16,),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 25, right: 120),
                                                    child: Row(
                                                      children: [
                                                        Image.asset('assets/png.png',height: 20,),
                                                        const SizedBox(width:   10,),
                                                        Text('Figma',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,  color: notifire.getblackcolor,),),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                      padding: const EdgeInsets.only(top: 25, left: 3),
                                                      child: Text('11 Sep 2022',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',  color: notifire.getblackcolor,),)
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 25, left: 8),
                                                    child: Text('344.33 KB',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,  color: notifire.getblackcolor,),),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 25, left: 8),
                                                    child:  Row(
                                                      children: [
                                                        Text('245 files',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',  color: notifire.getblackcolor,),)
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
                                                      padding: const EdgeInsets.only(top: 25, ),
                                                      child:   Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),)
                                                  ),
                                                ],
                                              ),
                                              dividerTable(context),
                                              TableRow(
                                                children: <Widget>[
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 25, right: 100),
                                                    child: Image.asset('assets/star2.png',height: 16,),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 25, right: 120),
                                                    child: Row(
                                                      children: [
                                                        Image.asset('assets/png.png',height: 20,),
                                                        const SizedBox(width:   10,),
                                                        Text('Preview',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                      padding: const EdgeInsets.only(top: 25, left: 3),
                                                      child: Text('11 Sep 2022',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),)
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 25, left: 8),
                                                    child: Text('344.33 KB',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 25, left: 8),
                                                    child:  Row(
                                                      children: [
                                                        Text('22 files',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),)
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
                                                                        '+8',
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
                                                      padding: const EdgeInsets.only(top: 25, ),
                                                      child:   Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),)
                                                  ),
                                                ],
                                              ),
                                              dividerTable(context),
                                              TableRow(
                                                children: <Widget>[
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 25, right: 100),
                                                    child: Image.asset('assets/star2.png',height: 16,),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 25, right: 8),
                                                    child: Row(
                                                      children: [
                                                        Image.asset('assets/png.png',height: 20,),
                                                        const SizedBox(width:   10,),
                                                        Text('Fonts Family',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                      padding: const EdgeInsets.only(top: 25, left: 3),
                                                      child: Text('11 Sep 2022',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),)
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 25, left: 8),
                                                    child: Text('344.33 KB',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 25, left: 8),
                                                    child:  Row(
                                                      children: [
                                                        Text('201 files',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),)
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
                                                      padding: const EdgeInsets.only(top: 25, ),
                                                      child:   Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),)
                                                  ),
                                                ],
                                              ),
                                              dividerTable(context),
                                              TableRow(
                                                children: <Widget>[
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 25, right: 100),
                                                    child: Image.asset('assets/star2.png',height: 16,),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 25, right: 8),
                                                    child: Row(
                                                      children: [
                                                        Image.asset('assets/png.png',height: 20,),
                                                        const SizedBox(width:   10,),
                                                        Text('Design System',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                      padding: const EdgeInsets.only(top: 25, left: 3),
                                                      child: Text('11 Sep 2022',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),)
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 25, left: 8),
                                                    child: Text('344.33 KB',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 25, left: 8),
                                                    child:  Row(
                                                      children: [
                                                        Text('245 files',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),)
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
                                                      padding: const EdgeInsets.only(top: 25, ),
                                                      child:   Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),)
                                                  ),
                                                ],
                                              ),
                                              dividerTable(context),
                                              TableRow(
                                                children: <Widget>[
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 25, right: 100),
                                                    child: Image.asset('assets/star2.png',height: 16,),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 25, right: 8),
                                                    child: Row(
                                                      children: [
                                                        Image.asset('assets/png.png',height: 20,),
                                                        const SizedBox(width:   10,),
                                                        Text('Preview',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                      padding: const EdgeInsets.only(top: 25, left: 3),
                                                      child: Text('11 Sep 2022',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),)
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 25, left: 8),
                                                    child: Text('344.33 KB',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 25, left: 8),
                                                    child:  Row(
                                                      children: [
                                                        Text('22 files',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),)
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
                                                                        '+8',
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
                                                      padding: const EdgeInsets.only(top: 25, ),
                                                      child:   Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),)
                                                  ),
                                                ],
                                              ),
                                              dividerTable(context),
                                              TableRow(
                                                children: <Widget>[
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 25, right: 100),
                                                    child: Image.asset('assets/star2.png',height: 16,),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 25, right: 8),
                                                    child: Row(
                                                      children: [
                                                        Image.asset('assets/png.png',height: 20,),
                                                        const SizedBox(width:   10,),
                                                        Text('Avatars & Brands',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                      padding: const EdgeInsets.only(top: 25, left: 3),
                                                      child: Text('11 Sep 2022',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),)
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 25, left: 8),
                                                    child: Text('344.33 KB',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 25, left: 8),
                                                    child:  Row(
                                                      children: [
                                                        Text('245 files',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),)
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
                                                      padding: const EdgeInsets.only(top: 25, ),
                                                      child:   Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),)
                                                  ),
                                                ],
                                              ),
                                              dividerTable(context),
                                              TableRow(
                                                children: <Widget>[
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 25, right: 100),
                                                    child: Image.asset('assets/star2.png',height: 16,),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 25, right: 8),
                                                    child: Row(
                                                      children: [
                                                        Image.asset('assets/png.png',height: 20,),
                                                        const SizedBox(width:   10,),
                                                        Text('Fonts Family',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                      padding: const EdgeInsets.only(top: 25, left: 3),
                                                      child: Text('11 Sep 2022',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),)
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 25, left: 8),
                                                    child: Text('344.33 KB',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 25, left: 8),
                                                    child:  Row(
                                                      children: [
                                                        Text('22 files',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),)
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
                                                                        '+8',
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
                                                      padding: const EdgeInsets.only(top: 25, ),
                                                      child:   Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),)
                                                  ),
                                                ],
                                              ),
                                              dividerTable(context),
                                              TableRow(
                                                children: <Widget>[
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 25, right: 100),
                                                    child: Image.asset('assets/star2.png',height: 16,),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 25, right: 8),
                                                    child: Row(
                                                      children: [
                                                        Image.asset('assets/png.png',height: 20,),
                                                        const SizedBox(width:   10,),
                                                        Text('Fonts Family',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                      padding: const EdgeInsets.only(top: 25, left: 3),
                                                      child: Text('11 Sep 2022',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),)
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 25, left: 8),
                                                    child: Text('344.33 KB',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 25, left: 8),
                                                    child:  Row(
                                                      children: [
                                                        Text('201 files',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),)
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
                                                      padding: const EdgeInsets.only(top: 25, ),
                                                      child:   Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),)
                                                  ),
                                                ],
                                              ),
                                              dividerTable(context),
                                              TableRow(
                                                children: <Widget>[
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 25, right: 100),
                                                    child: Image.asset('assets/star2.png',height: 16,),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 25, right: 8),
                                                    child: Row(
                                                      children: [
                                                        Image.asset('assets/png.png',height: 20,),
                                                        const SizedBox(width:   10,),
                                                        Text('Design System',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                      padding: const EdgeInsets.only(top: 25, left: 3),
                                                      child: Text('11 Sep 2022',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),)
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 25, left: 8),
                                                    child: Text('344.33 KB',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top: 25, left: 8),
                                                    child:  Row(
                                                      children: [
                                                        Text('245 files',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor),)
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
                                                      padding: const EdgeInsets.only(top: 25, ),
                                                      child:   Image.asset('assets/more.png',height: 16,color: const Color(0xff9DA2A7),)
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
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget container2(constraints){
    return
      constraints < 600 ?
      StatefulBuilder(
        builder: (context, setState) {
          return Scaffold(
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
            backgroundColor: notifire.getbgcolor10,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(

                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('evcp Screen',style: TextStyle(fontSize: 18,fontFamily: 'InterRegular',fontWeight: FontWeight.w500,color: notifire.getblackcolor),),
                            const SizedBox(height: 10,),
                            PopupMenuButton(
                              tooltip: '',
                              offset: const Offset(10, 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              elevation: 1,
                              splashRadius: 1,
                              constraints: const BoxConstraints(
                                maxWidth: 420,
                                minWidth: 420,
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
                                            padding: const EdgeInsets.all(20),
                                            child:Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Image.asset('assets/png.png',height: 60,),
                                                    const SizedBox(width: 10,),
                                                    Expanded(child: Text('ccmps-upc0ia-hc11-p7000.psd',style: TextStyle(fontSize: 18,fontFamily: 'InterRegular',fontWeight: FontWeight.w500,color: notifire.getblackcolor),)),

                                                  ],
                                                ),
                                                const SizedBox(height: 10,),
                                                const Text('File Name',style: TextStyle(fontFamily: 'InterRegular',fontSize: 12,fontWeight: FontWeight.w600,color: Color(0xff9DA2A7)),),
                                                const SizedBox(height: 10,),
                                                Text('ccmps-upc0ia-hc11-p7000',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                const SizedBox(height: 10,),
                                                const Text('File Size',style: TextStyle(fontFamily: 'InterRegular',fontSize: 12,fontWeight: FontWeight.w600,color: Color(0xff9DA2A7)),),
                                                const SizedBox(height: 10,),
                                                Text('5 Mb',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                const SizedBox(height: 10,),
                                                const Text('Type',style: TextStyle(fontFamily: 'InterRegular',fontSize: 12,fontWeight: FontWeight.w600,color: Color(0xff9DA2A7)),),
                                                const SizedBox(height: 10,),
                                                Text('PSD',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                const SizedBox(height: 10,),
                                                const Text('Date Added',style: TextStyle(fontFamily: 'InterRegular',fontSize: 12,fontWeight: FontWeight.w600,color: Color(0xff9DA2A7)),),
                                                const SizedBox(height: 10,),
                                                Text('14 Sep 2021',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                const SizedBox(height: 10,),
                                                const Text('Last Modified',style: TextStyle(fontFamily: 'InterRegular',fontSize: 12,fontWeight: FontWeight.w600,color: Color(0xff9DA2A7)),),
                                                const SizedBox(height: 10,),
                                                Text('23 Sep 2022',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                const SizedBox(height: 10,),
                                                const Text('Uploaded by',style: TextStyle(fontFamily: 'InterRegular',fontSize: 12,fontWeight: FontWeight.w600,color: Color(0xff9DA2A7)),),
                                                const SizedBox(height: 10,),
                                                Text('Darrell Steward',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                const SizedBox(height: 10,),
                                                const Text('Location',style: TextStyle(fontFamily: 'InterRegular',fontSize: 12,fontWeight: FontWeight.w600,color: Color(0xff9DA2A7)),),
                                                const SizedBox(height: 10,),
                                                Text('My files / Design System / ccmps-upc0ia-hc11-p7000.psd',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                                const SizedBox(height: 10,),
                                                Row(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: const Color(0xff595FE5),),
                                                      padding: const EdgeInsets.all(12),
                                                      child: Row(
                                                        children: [
                                                          Image.asset('assets/Download.png',height: 20,color: Colors.white),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(width: 10,),
                                                    Container(
                                                      padding: const EdgeInsets.all(14),
                                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: notifire.getbgcolor10,),
                                                      child: Center( child: SvgPicture.asset('assets/Copy.svg',color: const Color(0xff727880),height: 18)),
                                                    ),
                                                    const SizedBox(width: 10,),
                                                    Container(
                                                      padding: const EdgeInsets.all(14),
                                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: notifire.getbgcolor10,),
                                                      child: const Center(child: Icon(Icons.arrow_forward_outlined,color: Color(0xff727880),size: 16,)),
                                                    ),
                                                    const SizedBox(width: 10,),
                                                    Container(
                                                      padding: const EdgeInsets.all(14),
                                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: notifire.getbgcolor10,),
                                                      child: Image.asset('assets/share.png',height: 16,color: const Color(0xff727880)),
                                                    ),
                                                    const SizedBox(width: 10,),
                                                    Container(
                                                      padding: const EdgeInsets.all(14),
                                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: notifire.getbgcolor10,),
                                                      child: Center(child: Image.asset('assets/trash.png',height: 16,color: const Color(0xff727880))),
                                                    ),
                                                  ],
                                                )

                                              ],
                                            ) ,
                                          );
                                        },
                                      ),
                                    )),
                              ],
                              child: GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1,
                                  mainAxisExtent: Get.height * 0.28,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20,
                                ),
                                // scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: model().File10.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    padding: const EdgeInsets.all(14),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: notifire.getbgcolor11,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            const Spacer(),
                                            Image.asset('assets/more.png',
                                                height: 16,
                                                color: const Color(0xffC6C8CB)),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              model().File10[index],
                                              height: 50,
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              model().File11[index],
                                              style:  TextStyle(
                                                  fontFamily: 'InterRegular',
                                                  fontSize: 14,color: notifire.getblackcolor
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              model().File12[index],
                                              style: const TextStyle(
                                                fontSize: 14,
                                                color: Color(0xff9DA2A7),
                                                fontFamily: 'InterRegular',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  )

                ],
              ),
            ),
          );
        },
      ):
      Column(
        children: [
          SizedBox(
            height: Get.height,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('evcp Screen',style: TextStyle(fontSize: 18,fontFamily: 'InterRegular',fontWeight: FontWeight.w500,  color: notifire.getblackcolor,),),
                  const SizedBox(height: 10,),
                  PopupMenuButton(
                    tooltip: '',
                    offset: const Offset(10, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 1,
                    splashRadius: 1,
                    constraints: const BoxConstraints(
                      maxWidth: 420,
                      minWidth: 420,
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
                                  padding: const EdgeInsets.all(13),
                                  child:Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset('assets/png.png',height: 60,),
                                          const SizedBox(width: 10,),
                                          Text('ccmps-upc0ia-hc11-p7000.psd',style: TextStyle(fontSize: 18,fontFamily: 'InterRegular',fontWeight: FontWeight.w500,color: notifire.getblackcolor),),

                                        ],
                                      ),
                                      const SizedBox(height: 10,),
                                      const Text('File Name',style: TextStyle(fontFamily: 'InterRegular',fontSize: 12,fontWeight: FontWeight.w600,color: Color(0xff9DA2A7)),),
                                      const SizedBox(height: 10,),
                                      Text('ccmps-upc0ia-hc11-p7000',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                      const SizedBox(height: 10,),
                                      const Text('File Size',style: TextStyle(fontFamily: 'InterRegular',fontSize: 12,fontWeight: FontWeight.w600,color: Color(0xff9DA2A7)),),
                                      const SizedBox(height: 10,),
                                      Text('5 Mb',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                      const SizedBox(height: 10,),
                                      const Text('Type',style: TextStyle(fontFamily: 'InterRegular',fontSize: 12,fontWeight: FontWeight.w600,color: Color(0xff9DA2A7)),),
                                      const SizedBox(height: 10,),
                                      Text('PSD',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                      const SizedBox(height: 10,),
                                      const Text('Date Added',style: TextStyle(fontFamily: 'InterRegular',fontSize: 12,fontWeight: FontWeight.w600,color: Color(0xff9DA2A7)),),
                                      const SizedBox(height: 10,),
                                      Text('14 Sep 2021',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                      const SizedBox(height: 10,),
                                      const Text('Last Modified',style: TextStyle(fontFamily: 'InterRegular',fontSize: 12,fontWeight: FontWeight.w600,color: Color(0xff9DA2A7)),),
                                      const SizedBox(height: 10,),
                                      Text('23 Sep 2022',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                      const SizedBox(height: 10,),
                                      const Text('Uploaded by',style: TextStyle(fontFamily: 'InterRegular',fontSize: 12,fontWeight: FontWeight.w600,color: Color(0xff9DA2A7)),),
                                      const SizedBox(height: 10,),
                                      Text('Darrell Steward',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                      const SizedBox(height: 10,),
                                      const Text('Location',style: TextStyle(fontFamily: 'InterRegular',fontSize: 12,fontWeight: FontWeight.w600,color: Color(0xff9DA2A7)),),
                                      const SizedBox(height: 10,),
                                      Text('My files / Design System / ccmps-upc0ia-hc11-p7000.psd',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: notifire.getblackcolor),),
                                      const SizedBox(height: 10,),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: InkWell(
                                              onTap: () {

                                              },
                                              child: Container(
                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: const Color(0xff595FE5),),
                                                padding: const EdgeInsets.all(12),
                                                child: Row(
                                                  children: [
                                                    Image.asset('assets/Download.png',height: 20,color: Colors.white),
                                                    const SizedBox(width: 5,),
                                                    const Text('Download File',style: TextStyle(fontSize: 16,fontFamily: 'InterRegular',color: Colors.white,),),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 10,),
                                          InkWell(
                                            onTap: () {

                                            },
                                            child: Container(
                                              padding: const EdgeInsets.all(14),
                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),border: Border.all(color: const Color(0xffEEEEEE),)),
                                              child: Center( child: SvgPicture.asset('assets/Copy.svg',color: const Color(0xff727880),height: 18)),
                                            ),
                                          ),
                                          const SizedBox(width: 10,),
                                          InkWell(
                                            onTap: () {

                                            },
                                            child: Container(
                                              padding: const EdgeInsets.all(14),
                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),border: Border.all(color: const Color(0xffEEEEEE),)),
                                              child: const Center(child: Icon(Icons.arrow_forward_outlined,color: Color(0xff727880),size: 16,)),
                                            ),
                                          ),
                                          const SizedBox(width: 10,),
                                          InkWell(
                                            onTap: () {

                                            },
                                            child: Container(
                                              padding: const EdgeInsets.all(14),
                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),border: Border.all(color: const Color(0xffEEEEEE),)),
                                              child: Image.asset('assets/share.png',height: 16,color: const Color(0xff727880)),
                                            ),
                                          ),
                                          const SizedBox(width: 10,),
                                          InkWell(
                                            onTap: () {

                                            },
                                            child: Container(
                                              padding: const EdgeInsets.all(14),
                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),border: Border.all(color: const Color(0xffEEEEEE),)),
                                              child: Center(child: Image.asset('assets/trash.png',height: 16,color: const Color(0xff727880))),
                                            ),
                                          ),
                                        ],
                                      )

                                    ],
                                  ) ,
                                );
                              },
                            ),
                          )),
                    ],
                    child: GridView.builder(
                      gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: constraints < 1200 ?  3 : 4,
                        // mainAxisExtent: Get.height * 0.3,#727880
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                      ),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: model().File10.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: notifire.getbgcolor11,
                          ),
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.center,
                            mainAxisAlignment:
                            MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  const Spacer(),
                                  Image.asset('assets/more.png',
                                      height: 16,
                                      color: const Color(0xffC6C8CB)),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Column(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    model().File10[index],
                                    height: 50,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    model().File11[index],
                                    style:  TextStyle(
                                      fontFamily: 'InterRegular',
                                      fontSize: 14,  color: notifire.getblackcolor,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    model().File12[index],
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Color(0xff9DA2A7),
                                      fontFamily: 'InterRegular',
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),

                ],
              ),
            ),
          )

        ],
      );
  }

  TableRow dividerTable(BuildContext context) {
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
