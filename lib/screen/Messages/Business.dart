// ignore_for_file: prefer_const_constructors, file_names, camel_case_types
// ignore_for_file: deprecated_member_use
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
// import 'package:html_editor_enhanced/html_editor.dart';
import 'package:provider/provider.dart';


import '../../confing/colors.dart';

import '../../confing/list.dart';
import '../../confing/notifier.dart';
import '../../controller/page_controller.dart';


import 'Social.dart';

class Business extends StatefulWidget {
  const Business({super.key});

  @override
  State<Business> createState() => _BusinessState();
}

class _BusinessState extends State<Business> {
  bool profilePage = false;
  List checkBox = [];
  int selectIndex = 0;
  int selectIndex1 = 0;

  List messages1 = [
    '8:20 AM',
    '4:39 PM',
    '02 July',
    '07 July',
    '09 July',
    '23 July',
    '08 July',
    '5:40 PM',
    '12 July',
    '4:33 PM',
  ];
  List mesage = [
    'I can come tomorrow.',
    'omg, this is amazing',
    'Bell: woohoooo',
    'How are you?',
    'Hiten Shah: It’s good.',
    'Wow, this is really epic',
    'perfect!',
    'Haha oh man',
    'just ideas for next time',
    'omg, this is amazing',
  ];
  List abstract = [
    'I come tomorrow.',
    'omg, this is amazing',
    'Bell: woohoooo',
    'How are you?',
    'Hiten Shah: It’s good.',
    'Wow, this is really epic',
    'perfect!',
    'Haha oh man',
    'just ideas for next time',
    'omg, this is amazing',
    'omg, this is amazing',
    'Bell: woohoooo',
    'How are you?',
    'Call ended',
    'Wow, this is really epic',
    'perfect!',
    'Haha oh man',
  ];
  InboxController inboxController = Get.put(InboxController());
  ColorNotifier notifier = ColorNotifier();
  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    return GetBuilder<InboxController>(builder: (inboxController) {
      return LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return  SingleChildScrollView(
                child: Column(
                  children: [
                    container1(context,constraints.maxWidth ),
                  ],
                ),
            );
          } else if (constraints.maxWidth < 1000) {
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
                        decoration:  BoxDecoration(
                          color: notifier.getbgcolor10,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              firstContainer(
                                  size: constraints.maxWidth, context: context),
                            ],
                          ),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          firstContainer(
                              size: constraints.maxWidth, context: context)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      );
    },
    );
  }
  bool container = false;
  Widget firstContainer({required double size, context}) {
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
              Text('Messages',style: TextStyle(color: greyy,fontSize: 14,fontFamily: 'InterRegular'),),
              const SizedBox(width: 10,),
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: greyy,),),
              const SizedBox(width: 10,),
              Text('Business',style: TextStyle(color: notifier.getblackcolor,fontSize: 14,fontFamily: 'InterRegular'),),
            ],
          ),
          const SizedBox(height: 20,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              container3(
                context,size
              ),
              const SizedBox(width: 10,),
              Expanded(
                flex: 2,
                child: container ? container2(size) : container1(context, size),
              ),
              const SizedBox(width: 10,),
              size < 600
                  ? const SizedBox()
                  : Expanded(
                      flex: 6,
                      child: container2(size),
                    ),
              const SizedBox(width: 10,),
              container4(context),
              // profilePage ? Expanded(flex: 1, child: container1()) : const SizedBox(),
            ],
          ),
        ],
      ),
    );
  }

  Widget container1(context, double size) {
    return
      size < 700 ?
      Container(
        decoration:  BoxDecoration(

          color: notifier.getbgcolor11,

        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
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
                    Text('Messages',style: TextStyle(color: greyy,fontSize: 14,fontFamily: 'InterRegular'),),
                    const SizedBox(width: 10,),
                    Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: greyy,),),
                    const SizedBox(width: 10,),
                    Text('Business',style: TextStyle(color: notifier.getblackcolor,fontSize: 14,fontFamily: 'InterRegular'),),
                  ],
                ),
                const SizedBox(height: 20,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'All Messages (37)',
                      style: TextStyle(
                          color: Color(0xff9DA2A7), fontFamily: 'InterRegular'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),

                  itemCount: model().limessage.length,
                  itemBuilder: (context, index) {
                    ChatList data = chatList[index];
                    return InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => container2(size)),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            color: selectIndex == index
                                ? notifier.Getblack
                                : notifier.getbgcolor11,

                            border: Border(
                                right: BorderSide(
                                    color: selectIndex == index
                                        ? notifier.getblackcolor
                                        : notifier.getbgcolor11,
                                    width: 2))),
                        child: ListTile(
                          leading: Transform.translate(
                            offset: const Offset(0, -10),
                            child: Image.asset(model().assmessge[index],
                                height: 40, width: 40),
                          ),
                          title: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    model().Working[index],
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'InterRegular',
                                      color: index == 0
                                          ? const Color(0xffF3935D)
                                          : index == 1
                                          ? const Color(0xff9E57E5)
                                          : index == 2
                                          ? const Color(0xffE5646C)
                                          : index == 3
                                          ? const Color(0xffF3935D)
                                          : index == 4
                                          ? const Color(0xff59B4D1)
                                          : index == 5
                                          ? const Color(0xff9E57E5)
                                          : index == 6
                                          ? const Color(
                                          0xffF3935D)
                                          : index == 7
                                          ? const Color(
                                          0xff9E57E5)
                                          : index == 8
                                          ? const Color(
                                          0xffE5646C)
                                          : index ==
                                          9
                                          ? const Color(0xffF3935D)
                                          : notifier.getblackcolor,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    model().Progress[index],
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: index == 0
                                          ? const Color(0xff59B4D1)
                                          : index == 1
                                          ? const Color(0xffE5646C)
                                          : index == 2
                                          ? const Color(0xffE5646C)
                                          : index == 3
                                          ? const Color(0xff59B4D1)
                                          : index == 4
                                          ? const Color(0xffE5646C)
                                          : index == 5
                                          ? const Color(0xff59B4D1)
                                          : index == 6
                                          ? const Color(
                                          0xffE5646C)
                                          : index == 7
                                          ? const Color(
                                          0xff59B4D1)
                                          : index == 8
                                          ? const Color(
                                          0xffE5646C)
                                          : index ==
                                          9
                                          ? const Color(0xff59B4D1)
                                          : notifier.getblackcolor,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(data.title,
                                      style: TextStyle(
                                          fontFamily: 'InterRegular',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: index == 1
                                              ? const Color(0xff1B1D1F)
                                              : index == 5
                                              ? const Color(0xff1B1D1F)
                                              : const Color(0xff727880))),
                                  const Spacer(),
                                  Text(
                                    messages1[index],
                                    style: const TextStyle(
                                        color: Color(0xff9DA2A7),
                                        fontSize: 10,
                                        fontFamily: 'InterRegular'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          subtitle: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    abstract[index],
                                    style:  TextStyle(
                                      fontFamily: 'InterRegular',
                                      fontSize: 12,color: notifier.getblackcolor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const Spacer(),
                                  Image.asset('assets/read1.png', height: 16),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Image.asset('assets/Vector14.png', height: 12),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Text('3',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff9DA2A7),
                                          fontFamily: 'InterRegular')),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Image.asset(
                                    'assets/tag.png',
                                    height: 14,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Text('8',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff9DA2A7),
                                          fontFamily: 'InterRegular')),
                                  const Spacer(),
                                  Image.asset(
                                    'assets/more.png',
                                    height: 16,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ):
      Container(
      height: MediaQuery.of(context).size.height,
      decoration:  BoxDecoration(
        color: notifier.getbgcolor11,
        borderRadius: BorderRadius.circular(12),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                      height: 32,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                          child: Image.asset(
                        'assets/Brand Logo21.png',
                      ))),
                  const SizedBox(
                    width: 5,
                  ),
                   Text(
                    'GithubTeam',
                    style: TextStyle(
                        fontFamily: 'InterRegular',
                        fontSize: 18,color: notifier.getblackcolor,
                        fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                  Image.asset('assets/more.png', height: 16),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: Get.width * 0.3,
                height: 45,
                decoration:  BoxDecoration(
                    color: notifier.Getblg2,
                    borderRadius: const BorderRadius.only(bottomRight: Radius.zero, topRight: Radius.zero,bottomLeft: Radius.circular(20),topLeft: Radius.circular(20))
                ),
                child: TextField(
                  style:  TextStyle(color: notifier.getblackcolor),
                  decoration: InputDecoration(
                    hintText: 'Find the message',
                    prefixIcon: Image.asset('assets/search-normal.png',
                        scale: 4, color: const Color(0xff9DA2A7)),
                    hintStyle: TextStyle(color: notifier.getblackcolor),
                    contentPadding: const EdgeInsets.only(left: 20, right: 20),
                    border: OutlineInputBorder(
                        borderRadius: const BorderRadius.only(bottomRight: Radius.zero, topRight: Radius.zero,bottomLeft: Radius.circular(20),topLeft: Radius.circular(20)),
                        borderSide: BorderSide(color: grey2)),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.only(bottomRight: Radius.zero, topRight: Radius.zero,bottomLeft: Radius.circular(20),topLeft: Radius.circular(20))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: blue),
                        borderRadius: const BorderRadius.only(bottomRight: Radius.zero, topRight: Radius.zero,topLeft: Radius.circular(20),bottomLeft: Radius.circular(20))),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'All Messages (37)',
                    style: TextStyle(
                        color: Color(0xff9DA2A7), fontFamily: 'InterRegular'),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {

                },
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: model().limessage.length,
                  itemBuilder: (context, index) {
                    ChatList data = chatList[index];
                    return InkWell(
                      onTap: () {
                        setState(() {
                          selectIndex = index;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: selectIndex == index
                                ? notifier.Getblack
                                : notifier.getbgcolor11,
                            border: Border(
                                right: BorderSide(
                                    color: selectIndex == index
                                        ? notifier.getblackcolor
                                        : notifier.getbgcolor11,
                                    width: 2))),
                        child: ListTile(
                          leading: Transform.translate(
                            offset: const Offset(0, -10),
                            child: Image.asset(model().assmessge[index],
                                height: 40, width: 40),
                          ),
                          title: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    model().Working[index],
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'InterRegular',
                                      color: index == 0
                                          ? const Color(0xffF3935D)
                                          : index == 1
                                              ? const Color(0xff9E57E5)
                                              : index == 2
                                                  ? const Color(0xffE5646C)
                                                  : index == 3
                                                      ? const Color(0xffF3935D)
                                                      : index == 4
                                                          ? const Color(0xff59B4D1)
                                                          : index == 5
                                                              ? const Color(0xff9E57E5)
                                                              : index == 6
                                                                  ? const Color(
                                                                      0xffF3935D)
                                                                  : index == 7
                                                                      ? const Color(
                                                                          0xff9E57E5)
                                                                      : index == 8
                                                                          ? const Color(
                                                                              0xffE5646C)
                                                                          : index ==
                                                                                  9
                                                                              ? const Color(0xffF3935D)
                                                                              : notifier.getblackcolor,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    model().Progress[index],
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: index == 0
                                          ? const Color(0xff59B4D1)
                                          : index == 1
                                              ? const Color(0xffE5646C)
                                              : index == 2
                                                  ? const Color(0xffE5646C)
                                                  : index == 3
                                                      ? const Color(0xff59B4D1)
                                                      : index == 4
                                                          ? const Color(0xffE5646C)
                                                          : index == 5
                                                              ? const Color(0xff59B4D1)
                                                              : index == 6
                                                                  ? const Color(
                                                                      0xffE5646C)
                                                                  : index == 7
                                                                      ? const Color(
                                                                          0xff59B4D1)
                                                                      : index == 8
                                                                          ? const Color(
                                                                              0xffE5646C)
                                                                          : index ==
                                                                                  9
                                                                              ? const Color(0xff59B4D1)
                                                                              : notifier.getblackcolor,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(data.title,
                                      style: TextStyle(
                                          fontFamily: 'InterRegular',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: index == 1
                                              ? const Color(0xff1B1D1F)
                                              : index == 5
                                                  ? const Color(0xff1B1D1F)
                                                  : const Color(0xff727880))),
                                  const Spacer(),
                                  Text(
                                    messages1[index],
                                    style: const TextStyle(
                                        color: Color(0xff9DA2A7),
                                        fontSize: 10,
                                        fontFamily: 'InterRegular'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          subtitle: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    abstract[index],
                                    style:  TextStyle(
                                      fontFamily: 'InterRegular',
                                      fontSize: 12,color: notifier.getblackcolor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const Spacer(),
                                  Image.asset('assets/read1.png', height: 16),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Image.asset('assets/Vector14.png', height: 12),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Text('3',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff9DA2A7),
                                          fontFamily: 'InterRegular')),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Image.asset(
                                    'assets/tag.png',
                                    height: 14,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Text('8',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff9DA2A7),
                                          fontFamily: 'InterRegular')),
                                  const Spacer(),
                                  Image.asset(
                                    'assets/more.png',
                                    height: 16,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  // HtmlEditorController controller = HtmlEditorController();
  Widget container2(size) {
    return 
      size < 700 ?
      SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Scaffold(
          appBar: AppBar(automaticallyImplyLeading: false,
            backgroundColor: notifier.getbgcolor11,
            elevation: 0,

            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/Avatar1.png', height: 40),
                const SizedBox(width: 10,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Robert Darlene',
                            style: TextStyle(
                                fontFamily: 'InterRegular',
                                fontSize: 14,color: notifier.getblackcolor,
                                fontWeight: FontWeight.w600)),

                      ],
                    ),
                    const Text('@Robert_18',
                        style: TextStyle(
                            color: Color(0xff727880),
                            fontSize: 12,
                            fontFamily: 'InterRegular')),
                  ],
                ),
              ],
            ),
            actions: [
              Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Image.asset('assets/video.png',
                        height: 18, color: const Color(0xffC6C8CB))),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                      onTap: () {},
                      child: Image.asset('assets/call.png',
                          height: 18, color: const Color(0xffC6C8CB))),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                      onTap: () {},
                      child: Image.asset('assets/whatsapp.png',
                          height: 18, color: const Color(0xffC6C8CB))),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                      onTap: () {},
                      child: Image.asset('assets/more-circle.png',
                          height: 18, color: const Color(0xffC6C8CB))),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ],
          ),
          backgroundColor: notifier.getbgcolor10,
          body: SingleChildScrollView(
            child: Theme(
              data: Theme.of(context).copyWith(
                  scrollbarTheme: const ScrollbarThemeData(
                      thumbVisibility: MaterialStatePropertyAll(false),
                      thickness: MaterialStatePropertyAll(0),
                      trackVisibility: MaterialStatePropertyAll(false))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Theme(
                    data: Theme.of(context).copyWith(
                        scrollbarTheme: const ScrollbarThemeData(
                            thumbVisibility:
                            MaterialStatePropertyAll(false),
                            thickness: MaterialStatePropertyAll(0),
                            trackVisibility:
                            MaterialStatePropertyAll(false))),
                    child:  Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          const Column(
                            children: [
                              Text(
                                'Friday, 1 July',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'InterRegular',
                                    color: Color(0xff9DA2A7)),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 32,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Center(
                                        child:
                                        Image.asset('assets/Avatar61.png')),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    height: 40,
                                    decoration:  BoxDecoration(
                                        color: notifier.getbgcolor11,
                                        borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(12),
                                            bottomRight: Radius.circular(12),
                                            topRight: Radius.circular(12))),
                                    child:  Row(
                                      children: [
                                        Text('I hope it goes well.',
                                            style: TextStyle(color: notifier.getblackcolor,
                                              fontFamily: 'InterRegular',
                                            )),
                                      ],
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 32,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Image.asset('assets/Avatar61.png'),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration:  BoxDecoration(
                                        color: notifier.getbgcolor11,
                                        borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(12),
                                            bottomRight: Radius.circular(12),
                                            topRight: Radius.circular(12))),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Image.asset('assets/Media11.png',
                                            scale: 4),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                            'What the progress on that task?',
                                            style: TextStyle(color: notifier.getblackcolor,
                                              fontFamily: 'InterRegular',
                                            )),
                                      ],
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 32,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Center(
                                        child:
                                        Image.asset('assets/Avatar61.png')),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 20),
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        height: 40,
                                        decoration:  BoxDecoration(
                                            color: notifier.getbgcolor11,
                                            borderRadius: const BorderRadius.only(
                                                bottomLeft: Radius.circular(10),
                                                bottomRight: Radius.circular(10),
                                                topRight: Radius.circular(10))),
                                        child:  Row(
                                          children: [
                                            Text('Hey bro!',
                                                style: TextStyle(color: notifier.getblackcolor,
                                                  fontFamily: 'InterRegular',
                                                )),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          const Text('1:45 PM',
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontFamily: 'InterRegular',
                                                  color: Color(0xff9DA2A7))),
                                          const SizedBox(
                                            width: 30,
                                          ),
                                          Image.asset('assets/Avatar61.png',
                                              height: 13),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Column(
                            children: [
                              Text(
                                'Monday, 1 July',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'InterRegular',
                                    color: Color(0xff9DA2A7)),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                        color: Color(0xff595FE5),
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(12),
                                            bottomRight: Radius.circular(12),
                                            topLeft: Radius.circular(12))),
                                    child: const Text('Yeah! Your right.',
                                        style: TextStyle(
                                            fontFamily: 'InterRegular',
                                            color: Colors.white)),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                        color: Color(0xff595FE5),
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(12),
                                            bottomRight: Radius.circular(12),
                                            topLeft: Radius.circular(12))),
                                    child: const Text('I be there in 2 mins',
                                        style: TextStyle(
                                            fontFamily: 'InterRegular',
                                            color: Colors.white)),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: const BoxDecoration(
                                          color: Color(0xff595FE5),
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(12),
                                              bottomRight: Radius.circular(12),
                                              topLeft: Radius.circular(12))),
                                      child: Row(
                                        children: [
                                          Image.asset('assets/Voice.png',
                                              height: 20),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          InkWell(
                                            onTap: () {

                                            },
                                            child: Image.asset('assets/play-circle.png',
                                                height: 24),
                                          ),
                                        ],
                                      )),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    '4:07 PM',
                                    style: TextStyle(
                                        color: Color(0xff9DA2A7),
                                        fontSize: 10,
                                        fontFamily: 'InterRegular'),
                                  )
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 32,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Center(
                                        child:
                                        Image.asset('assets/Avatar61.png')),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    height: 40,
                                    decoration:  BoxDecoration(
                                        color: notifier.getbgcolor11,
                                        borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10),
                                            topRight: Radius.circular(10))),
                                    child:  Row(
                                      children: [
                                        Text('I hope it goes well.',
                                            style: TextStyle(
                                                fontFamily: 'InterRegular',color: notifier.getblackcolor
                                            )),
                                      ],
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
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 32,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Center(
                                        child:
                                        Image.asset('assets/Avatar61.png')),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration:  BoxDecoration(
                                        color: notifier.getbgcolor11,
                                        borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(12),
                                            bottomRight: Radius.circular(12),
                                            topRight: Radius.circular(12))),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text('Haha oh man',

                                            style: TextStyle(color: notifier.getblackcolor,
                                              fontFamily: 'InterRegular',
                                            )),
                                        InkWell(
                                          onTap: () {
                                          },
                                          child: DottedBorder(
                                            color: const Color(0xffEEEEEE),
                                            borderType: BorderType.RRect,
                                            radius: const Radius.circular(12),
                                            padding: const EdgeInsets.all(12),
                                            child: ClipRRect(
                                              borderRadius: const BorderRadius.all(
                                                  Radius.circular(12)),
                                              child: SizedBox(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                    0.4,
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      height: 32,
                                                      width: 32,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                      child: Image.asset(
                                                        'assets/pdf.png',
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'pdf',
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            color: notifier.getblackcolor,
                                                            fontFamily:
                                                            'InterRegular',
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        const Text(
                                                          '231.72 KB',
                                                          style: TextStyle(
                                                              color:
                                                              Color(0xff727880),
                                                              fontSize: 10),
                                                        )
                                                      ],
                                                    ),
                                                    const Spacer(),
                                                    Image.asset(
                                                        'assets/Download.png',
                                                        height: 24),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
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
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 32,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Center(
                                        child:
                                        Image.asset('assets/Avatar61.png')),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    height: 40,
                                    decoration:  BoxDecoration(
                                        color: notifier.getbgcolor11,
                                        borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(12),
                                            bottomRight: Radius.circular(12),
                                            topRight: Radius.circular(12))),
                                    child:  Row(
                                      children: [
                                        Text('I hope it goes well.',
                                            style: TextStyle(color: notifier.getblackcolor,
                                              fontFamily: 'InterRegular',
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Column(
                            children: [
                              Text(
                                'Monday, 1 July',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'InterRegular',
                                    color: Color(0xff9DA2A7)),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                        color: Color(0xff595FE5),
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(12),
                                            bottomRight: Radius.circular(12),
                                            topLeft: Radius.circular(12))),
                                    child:  const Text('I went there yesterday',
                                        style: TextStyle(
                                            fontFamily: 'InterRegular',
                                            color: Colors.white)),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                        color: Color(0xff595FE5),
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(12),
                                            bottomRight: Radius.circular(12),
                                            topLeft: Radius.circular(12))),
                                    child: const Text('thanks for the help',
                                        style: TextStyle(
                                            fontFamily: 'InterRegular',
                                            color: Colors.white)),
                                  ),
                                  const SizedBox(height: 15),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomSheet: Container(
            padding: const EdgeInsets.all(12),
            height: 148,
            decoration:  BoxDecoration(
              color: notifier.getbgcolor11,

              ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Container(
                    width: Get.width ,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12), color: notifier.getbgcolor10,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/text-italic.png',height: 16,),
                            const SizedBox(width: 10,),
                            Image.asset('assets/text-bold.png',height: 16,), const SizedBox(width: 10,),
                            Image.asset('assets/text-underline.png',height: 16,), const SizedBox(width: 10,),

                            Image.asset('assets/Ellipse 88.png',height: 5,), const SizedBox(width: 10,),

                            Image.asset('assets/textalign-left.png',height: 16,), const SizedBox(width: 10,),
                            Image.asset('assets/textalign-center.png',height: 16,), const SizedBox(width: 10,),
                            Image.asset('assets/textalign-right.png',height: 16,), const SizedBox(width: 10,),
                            Image.asset('assets/textalign-justifycenter.png',height: 16,), const SizedBox(width: 10,),

                            Image.asset('assets/Ellipse 88.png',height: 5,), const SizedBox(width: 10,),

                            Image.asset('assets/quote-up.png',height: 16,), const SizedBox(width: 10,),
                            Image.asset('assets/code.png',height: 16,color: const Color(0xff9DA2A7)),
                          ],
                        ),
                        const SizedBox(height: 6,),
                        Transform.translate(
                          offset: const Offset(-20, 0),
                          child: Container(
                            width: Get.width * 0.3,
                            height: Get.height * 0.06,
                            decoration: BoxDecoration(

                                borderRadius: BorderRadius.circular(20)),
                            child: TextField(
                              style: const TextStyle(),
                              decoration: InputDecoration(
                                hintText: 'Write messages ...',
                                hintStyle: TextStyle(color: notifier.getblackcolor),
                                contentPadding: const EdgeInsets.only(left: 20, right: 20),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(color: grey2)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(20)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            ),
                          ),
                        ),

                        Row(
                          children: [

                            Image.asset('assets/add-square.png',height: 16),
                            const SizedBox(width: 15,),
                            Image.asset('assets/microphone.png',height: 16), const SizedBox(width: 15,),
                            Image.asset('assets/emoji-happy.png',height: 16), const SizedBox(width: 15,),
                            const Icon(Icons.link,size: 20,color: Color(0xff727880)), const SizedBox(width: 15,),
                            Image.asset('assets/hashtag1.png',height: 16,),
                            const Spacer(),
                            InkWell(onTap: () {

                            },child: Image.asset('assets/send.png',height: 18,)),
                          ],
                        ),


                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )):
      SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Scaffold(
        appBar: AppBar(
            shape: const ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
          ),
          backgroundColor: notifier.getbgcolor11,
          elevation: 0,

          flexibleSpace: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 80,
            decoration:  BoxDecoration(
              color: notifier.getbgcolor11,
borderRadius: BorderRadius.circular(20)
            ),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              title: Row(
                children: [
                  Transform.translate(offset: const Offset(0, -2),
                  child: Image.asset('assets/Avatar1.png', height: 40)),
                  const SizedBox(
                    width: 5,
                  ),
                  Transform.translate(
                    offset: const Offset(0, 4),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Robert Darlene',
                                style: TextStyle(
                                    fontFamily: 'InterRegular',
                                    fontSize: 16,color: notifier.getblackcolor,
                                    fontWeight: FontWeight.w600)),
                            const SizedBox(
                              width: 8,
                            ),
                            Container(
                                height: 25,
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: const Color(0xffEAF6FC)),
                                child: const Center(
                                    child: Text(
                                  'Marketing Leader',
                                  style: TextStyle(
                                      color: Color(0xff59B4D1), fontSize: 10),
                                ))),
                          ],
                        ),
                        Transform.translate(
                          offset: const Offset(0, -3),
                          child: const Text('@Robert_18',
                              style: TextStyle(
                                  color: Color(0xff727880),
                                  fontSize: 14,
                                  fontFamily: 'InterRegular')),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                      onTap: () {},
                      child: Image.asset('assets/video.png',
                          height: 18, color: const Color(0xffC6C8CB))),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                      onTap: () {},
                      child: Image.asset('assets/call.png',
                          height: 18, color: const Color(0xffC6C8CB))),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                      onTap: () {},
                      child: Image.asset('assets/whatsapp.png',
                          height: 18, color: const Color(0xffC6C8CB))),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                      onTap: () {},
                      child: Image.asset('assets/more-circle.png',
                          height: 18, color: const Color(0xffC6C8CB))),
                ],
              ),
            ),
          ),
        ),
        backgroundColor: notifier.getbgcolor10,
        body:SingleChildScrollView(
          child: Theme(
            data: Theme.of(context).copyWith(
                scrollbarTheme: const ScrollbarThemeData(
                    thumbVisibility: MaterialStatePropertyAll(false),
                    thickness: MaterialStatePropertyAll(0),
                    trackVisibility: MaterialStatePropertyAll(false))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Theme(
                  data: Theme.of(context).copyWith(
                      scrollbarTheme: const ScrollbarThemeData(
                          thumbVisibility:
                          MaterialStatePropertyAll(false),
                          thickness: MaterialStatePropertyAll(0),
                          trackVisibility:
                          MaterialStatePropertyAll(false))),
                  child:  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        const Column(
                          children: [
                            Text(
                              'Friday, 1 July',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'InterRegular',
                                  color: Color(0xff9DA2A7)),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 32,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                      child:
                                      Image.asset('assets/Avatar61.png')),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  height: 40,
                                  decoration:  BoxDecoration(
                                      color: notifier.getbgcolor11,
                                      borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(12),
                                          bottomRight: Radius.circular(12),
                                          topRight: Radius.circular(12))),
                                  child:  Row(
                                    children: [
                                      Text('I hope it goes well.',
                                          style: TextStyle(color: notifier.getblackcolor,
                                            fontFamily: 'InterRegular',
                                          )),
                                    ],
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 32,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Image.asset('assets/Avatar61.png'),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration:  BoxDecoration(
                                      color: notifier.getbgcolor11,
                                      borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(12),
                                          bottomRight: Radius.circular(12),
                                          topRight: Radius.circular(12))),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Image.asset('assets/Media11.png',
                                          scale: 4),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                          'What the progress on that task?',
                                          style: TextStyle(color: notifier.getblackcolor,
                                            fontFamily: 'InterRegular',
                                          )),
                                    ],
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 32,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                      child:
                                      Image.asset('assets/Avatar61.png')),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 20),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      height: 40,
                                      decoration:  BoxDecoration(
                                          color: notifier.getbgcolor11,
                                          borderRadius: const BorderRadius.only(
                                              bottomLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(10),
                                              topRight: Radius.circular(10))),
                                      child:  Row(
                                        children: [
                                          Text('Hey bro!',
                                              style: TextStyle(color: notifier.getblackcolor,
                                                fontFamily: 'InterRegular',
                                              )),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        const Text('1:45 PM',
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontFamily: 'InterRegular',
                                                color: Color(0xff9DA2A7))),
                                        const SizedBox(
                                          width: 30,
                                        ),
                                        Image.asset('assets/Avatar61.png',
                                            height: 13),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Column(
                          children: [
                            Text(
                              'Monday, 1 July',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'InterRegular',
                                  color: Color(0xff9DA2A7)),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                      color: Color(0xff595FE5),
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(12),
                                          bottomRight: Radius.circular(12),
                                          topLeft: Radius.circular(12))),
                                  child: const Text('Yeah! Your right.',
                                      style: TextStyle(
                                          fontFamily: 'InterRegular',
                                          color: Colors.white)),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                      color: Color(0xff595FE5),
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(12),
                                          bottomRight: Radius.circular(12),
                                          topLeft: Radius.circular(12))),
                                  child: const Text('I be there in 2 mins',
                                      style: TextStyle(
                                          fontFamily: 'InterRegular',
                                          color: Colors.white)),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                        color: Color(0xff595FE5),
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(12),
                                            bottomRight: Radius.circular(12),
                                            topLeft: Radius.circular(12))),
                                    child: Row(
                                      children: [
                                        Image.asset('assets/Voice.png',
                                            height: 20),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        InkWell(
                                          onTap: () {

                                          },
                                          child: Image.asset('assets/play-circle.png',
                                              height: 24),
                                        ),
                                      ],
                                    )),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  '4:07 PM',
                                  style: TextStyle(
                                      color: Color(0xff9DA2A7),
                                      fontSize: 10,
                                      fontFamily: 'InterRegular'),
                                )
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 32,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                      child:
                                      Image.asset('assets/Avatar61.png')),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  height: 40,
                                  decoration:  BoxDecoration(
                                      color: notifier.getbgcolor11,
                                      borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                          topRight: Radius.circular(10))),
                                  child:  Row(
                                    children: [
                                      Text('I hope it goes well.',
                                          style: TextStyle(
                                              fontFamily: 'InterRegular',color: notifier.getblackcolor
                                          )),
                                    ],
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
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 32,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                      child:
                                      Image.asset('assets/Avatar61.png')),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration:  BoxDecoration(
                                      color: notifier.getbgcolor11,
                                      borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(12),
                                          bottomRight: Radius.circular(12),
                                          topRight: Radius.circular(12))),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text('Haha oh man',

                                          style: TextStyle(color: notifier.getblackcolor,
                                            fontFamily: 'InterRegular',
                                          )),
                                      InkWell(
                                        onTap: () {
                                        },
                                        child: DottedBorder(
                                          color: const Color(0xffEEEEEE),
                                          borderType: BorderType.RRect,
                                          radius: const Radius.circular(12),
                                          padding: const EdgeInsets.all(12),
                                          child: ClipRRect(
                                            borderRadius: const BorderRadius.all(
                                                Radius.circular(12)),
                                            child: SizedBox(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                                  0.12,
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: 32,
                                                    width: 32,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                    child: Image.asset(
                                                      'assets/pdf.png',
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        'pdf',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: notifier.getblackcolor,
                                                          fontFamily:
                                                          'InterRegular',
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      const Text(
                                                        '231.72 KB',
                                                        style: TextStyle(
                                                            color:
                                                            Color(0xff727880),
                                                            fontSize: 10),
                                                      )
                                                    ],
                                                  ),
                                                  const Spacer(),
                                                  Image.asset(
                                                      'assets/Download.png',
                                                      height: 24),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 32,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                      child:
                                      Image.asset('assets/Avatar61.png')),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration:  BoxDecoration(
                                          color: notifier.getbgcolor11,
                                          borderRadius: const BorderRadius.only(
                                              bottomLeft: Radius.circular(12),
                                              bottomRight: Radius.circular(12),
                                              topRight: Radius.circular(12))),
                                      child: Row(
                                        children: [
                                          InkWell(
                                            onTap: () {

                                            },
                                            child: Image.asset('assets/play-circle.png',
                                                height: 24,
                                                color: const Color(0xffE5646C)),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Image.asset('assets/Voice1.png',
                                              height: 20,
                                              color: const Color(0xffE5646C)),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Row(
                                      children: [
                                        Text(
                                          '3:55 AM',
                                          style: TextStyle(
                                              color: Color(0xff9DA2A7),
                                              fontFamily: 'InterRegular',
                                              fontSize: 10),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Column(
                          children: [
                            Text(
                              'Monday, 1 July',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'InterRegular',
                                  color: Color(0xff9DA2A7)),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                      color: Color(0xff595FE5),
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(12),
                                          bottomRight: Radius.circular(12),
                                          topLeft: Radius.circular(12))),
                                  child:  const Text('I went there yesterday',
                                      style: TextStyle(
                                          fontFamily: 'InterRegular',
                                          color: Colors.white)),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                      color: Color(0xff595FE5),
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(12),
                                          bottomRight: Radius.circular(12),
                                          topLeft: Radius.circular(12))),
                                  child: const Text('thanks for the help',
                                      style: TextStyle(
                                          fontFamily: 'InterRegular',
                                          color: Colors.white)),
                                ),
                                const SizedBox(height: 15),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomSheet:   Container(
          padding: const EdgeInsets.all(12),
          height: 148,
          decoration:  BoxDecoration(
            color: notifier.getbgcolor11,
            ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Container(
                  width: Get.width ,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),color: notifier.getbgcolor10
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/text-italic.png',height: 16,),
                          const SizedBox(width: 20,),
                          Image.asset('assets/text-bold.png',height: 16,), const SizedBox(width: 20,),
                          Image.asset('assets/text-underline.png',height: 16,), const SizedBox(width: 20,),

                          Image.asset('assets/Ellipse 88.png',height: 5,), const SizedBox(width: 20,),

                          Image.asset('assets/textalign-left.png',height: 16,), const SizedBox(width: 20,),
                          Image.asset('assets/textalign-center.png',height: 16,), const SizedBox(width: 20,),
                          Image.asset('assets/textalign-right.png',height: 16,), const SizedBox(width: 20,),
                          Image.asset('assets/textalign-justifycenter.png',height: 16,), const SizedBox(width: 20,),

                          Image.asset('assets/Ellipse 88.png',height: 5,), const SizedBox(width: 20,),

                          Image.asset('assets/quote-up.png',height: 16,), const SizedBox(width: 20,),
                          Image.asset('assets/code.png',height: 16,color: const Color(0xff9DA2A7)),
                        ],
                      ),
                      const SizedBox(height: 6,),
                      Transform.translate(
                        offset: const Offset(-20, 0),
                        child: Container(
                          width: Get.width * 0.3,
                          height: Get.height * 0.06,
                          decoration: BoxDecoration(

                              borderRadius: BorderRadius.circular(20)),
                          child: TextField(
                            style:  TextStyle(color: notifier.getblackcolor),
                            decoration: InputDecoration(
                              hintText: 'Write messages ...',
                              hintStyle: TextStyle(color: notifier.getblackcolor),
                              contentPadding: const EdgeInsets.only(left: 20, right: 20),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(color: grey2)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(20)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          ),
                        ),
                      ),

                      Row(
                        children: [

                          Image.asset('assets/add-square.png',height: 16),
                          const SizedBox(width: 15,),
                          Image.asset('assets/microphone.png',height: 16), const SizedBox(width: 15,),
                          Image.asset('assets/emoji-happy.png',height: 16), const SizedBox(width: 15,),
                          const Icon(Icons.link,size: 20,color: Color(0xff727880)), const SizedBox(width: 15,),
                          Image.asset('assets/hashtag1.png',height: 16,),
                          const Spacer(),
                          InkWell(onTap: () {

                          },child: Image.asset('assets/send.png',height: 18,)),
                        ],
                      ),


                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ));

  }

  Widget container3(context,size) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width / 20,
      decoration:  BoxDecoration(
          color: notifier.getbgcolor11, borderRadius: BorderRadius.circular(12),
          ),
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  
                },
                child: SizedBox(
                    height: 40,
                    child: Center(
                        child: Image.asset(
                      'assets/Team 1.png',
                      height: 40,
                    ))),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                },
                child: SizedBox(
                    height: 40,
                    child: Center(
                        child: Image.asset(
                                         'assets/Team 2.png',
                                                 ))),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  
                },
                child: SizedBox(
                    height: 40,
                    child: Center(
                        child: Image.asset(
                      'assets/Brand Logo11.png',
                      height: 40,
                    ))),
              ),
              const SizedBox(
                height: 10,
              ),
              Stack(
                children: [
                  InkWell(
                    onTap: () {

                    },
                    child: SizedBox(
                        height: 40,
                        child: Center(
                            child: Image.asset(
                          'assets/Brand Logo22.png',
                        ))),
                  ),

                ],
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {

                },
                child: Container(
                 padding: const EdgeInsets.all(12),
                  decoration:
                      BoxDecoration(
                    color: notifier.getbgcolor10,
                          borderRadius: BorderRadius.circular(12)),
                  child: Image.asset('assets/add.png',height: 16,color: const Color(0xff727880)),
                ),
              )
            ],
          ),
          const Spacer(),
          Column(
            children: [
              const Text('Apps',
                  style: TextStyle(
                      color: Color(0xff9DA2A7),
                      fontFamily: 'InterRegular',
                      fontSize: 10)),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {

                },
                child: SizedBox(
                    height: 24,
                    child: Center(
                        child: Image.asset(
                      'assets/GG Calendar.png',
                    ))),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {

                },
                child: SizedBox(
                    height: 24,
                    child: Center(
                        child: Image.asset(
                      'assets/Zoom.png',
                    ))),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {

                },
                child: SizedBox(
                    height: 24,
                    child: Center(
                        child: Image.asset(
                      'assets/Simple Poll.png',
                    ))),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {

                },
                child: SizedBox(
                    height: 24,
                    child: Center(
                        child: Image.asset(
                      'assets/GG Drive.png',
                    ))),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {

                },
                child: SizedBox(
                    height: 24,
                    child: Center(
                        child: Image.asset(
                      'assets/More Apps.png',
                    ))),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget container4(context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width / 20,
      decoration:  BoxDecoration(
          color: notifier.getbgcolor11, borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {},
                child: SizedBox(
                    height: 18,
                    child: Center(
                        child: Image.asset(
                      'assets/code.png',
                    ))),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {},
                child: SizedBox(
                    height: 18,
                    child: Center(
                        child: Image.asset(
                      'assets/More Apps(2).png',
                    ))),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {},
                child: SizedBox(
                    height: 18,
                    child: Center(
                        child: SvgPicture.asset(
                      'assets/kanban.svg',
                      height: 40,
                      color: const Color(0xff727880),
                    ))),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {},
                child: SizedBox(
                    height: 18,
                    child: Center(
                        child: Image.asset(
                      'assets/More Apps(1).png',
                    ))),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {},
                child: SizedBox(
                    height: 18,
                    child: Center(
                        child: Image.asset(
                      'assets/More Apps22.png',
                    ))),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
