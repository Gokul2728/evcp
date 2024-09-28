// ignore_for_file: deprecated_member_use
// ignore_for_file: prefer_const_constructors, file_names, camel_case_types
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'package:evcp/confing/list.dart';
import 'package:textfield_tags/textfield_tags.dart';

import '../../confing/Rtl.dart';
import '../../confing/colors.dart';

import '../../confing/notifier.dart';
import '../../controller/page_controller.dart';
import '../Dashboard/Dashboard_main.dart';
import '../login/login.dart';


class Social1 extends StatefulWidget {
  const Social1({super.key});

  @override
  State<Social1> createState() => _Social1State();
}

class _Social1State extends State<Social1> {
  SampleItem? selectedMenu;
  InboxController inboxController = Get.put(InboxController());
  bool isdark = false;
  final _stringTagController = StringTagController();
  late ColorNotifier notifire;
  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifier>(context, listen: true);
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return  Container(
              color: notifire.getbgcolor10,
              child:  SingleChildScrollView(
                child: Column(
                  children: [
                    container(constraints.maxWidth),
                  ],
                ),
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
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                      container(constraints.maxWidth)
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SingleChildScrollView(
                    child: Container(

                      color: notifire.getbgcolor10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          firstContainer(
                              context: context,constraints: constraints.maxWidth),
                        ],
                      ),
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

  Widget firstContainer({ context ,constraints}) {
    return Padding(
      padding: const EdgeInsets.only(right: 20,left: 20,bottom: 20),
      child: Column(
        children: [
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
                  Text('Profile',style: TextStyle(color: greyy,fontSize: 14,fontFamily: 'InterRegular'),),
                  const SizedBox(width: 10,),
                  Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: greyy,),),
                  const SizedBox(width: 10,),
                  Text('Social',style: TextStyle(color: notifire.getblackcolor,fontSize: 14,fontFamily: 'InterRegular'),),
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                      child: container(constraints)) ,
                  const SizedBox(width: 10,),
                  Expanded(
                      flex: 4,
                      child: container1(constraints)),
                  const SizedBox(width:10),
                  Expanded(
                      flex: 2,
                      child: container2(constraints)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget container(constraints){
    return
      constraints < 600 ?
      Padding(
          padding: const EdgeInsets.all(16),
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
                  Text('Profile',style: TextStyle(color: greyy,fontSize: 14,fontFamily: 'InterRegular'),),
                  const SizedBox(width: 10,),
                  Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: greyy,),),
                  const SizedBox(width: 10,),
                  Text('Social',style: TextStyle(color: notifire.getblackcolor,fontSize: 14,fontFamily: 'InterRegular'),),
                ],
              ),
              const SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(color: notifire.getbgcolor11,borderRadius: BorderRadius.circular(12)),
                      child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Image.asset('assets/avatar-6 1.png',height: 80,),
                    const SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                         Text('Theresa Webb',style: TextStyle(fontFamily: 'InterRegular',fontSize: 20,fontWeight: FontWeight.w600,color: notifire.getblackcolor,),),
                        const SizedBox(width: 10,),
                        SvgPicture.asset('assets/verify.svg',height: 16,color: const Color(0xff59B4D1)),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    const Text('🤣 Always keep smile on your mouth 🤣',style: TextStyle(color: Color(0xff727880),fontSize: 13,fontFamily: 'InterRegular',),),
                    const SizedBox(height: 30,),
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                      children: [
                        Column(children: [
                          Text('Followers',style: TextStyle(color: Color(0xff9DA2A7),fontSize: 12,fontFamily: 'InterRegular',fontWeight: FontWeight.w600),),
                          SizedBox(height: 10,),
                          Text('43,12 M',style: TextStyle(fontFamily: 'InterRegular',fontSize: 16,fontWeight: FontWeight.w600,color: Color(0xff727880))),
                        ],),
                        Column(children: [
                          Text('Following',style: TextStyle(color: Color(0xff9DA2A7),fontSize: 12,fontFamily: 'InterRegular',fontWeight: FontWeight.w600),),
                          SizedBox(height: 10,),
                          Text('21,433',style: TextStyle(fontFamily: 'InterRegular',fontSize: 16,fontWeight: FontWeight.w600,color: Color(0xff727880))),
                        ],),
                        Column(children: [
                          Text('Live Stream',style: TextStyle(color: Color(0xff9DA2A7),fontSize: 12,fontFamily: 'InterRegular',fontWeight: FontWeight.w600),),
                          SizedBox(height: 10,),
                          Text('23,22 M',style: TextStyle(fontFamily: 'InterRegular',fontSize: 16,fontWeight: FontWeight.w600,color: Color(0xff727880))),
                        ],),
                      ],
                    ),
                    const SizedBox(height: 30,),
                    Row(
                      children: [
                        Image.asset('assets/sms1.png',height: 16,),
                        const SizedBox(width: 10,),
                        const Text('AnanyaIshana@abc.com',style: TextStyle(color: Color(0xff727880),fontSize: 14,fontFamily: 'InterRegular'))
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        Image.asset('assets/mobile2.png',height: 16,),
                        const SizedBox(width: 10,),
                        const Text('(+1) 682 7892 9182',style: TextStyle(color: Color(0xff727880),fontSize: 14,fontFamily: 'InterRegular'),)
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        Image.asset('assets/share.png',height: 18,color: const Color(0xff727880)),
                        const SizedBox(width: 10,),
                        const Text('Abc.com/theresa_webb_121',style: TextStyle(color: Color(0xff595FE5),fontSize: 14,fontFamily: 'InterRegular'),)
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Row(children: [
                      Expanded(
                        child: InkWell(
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => container1(constraints),)),
                          child: Container(padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(color: const Color(0xff595FE5),borderRadius: BorderRadius.circular(12),),
                            child: const Center(child: Text('Send Message',style: TextStyle(fontFamily: 'InterRegular',color: Colors.white,fontWeight: FontWeight.w500, fontSize: 14  ))),),
                        ),
                      ),
                      const SizedBox( width: 10,),
                      InkWell(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => container2(constraints),)),
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: notifire.getbgcolor10,),
                          child: Center(child: Image.asset('assets/more.png',height: 16)),
                        ),
                      )
                    ],),
                    const SizedBox(height: 30,),
                     Row(
                      children: [
                        Text('Media',style: TextStyle(fontSize: 14, fontFamily: 'InterRegular',fontWeight: FontWeight.w600,color: notifire.getblackcolor,),),
                        const Spacer(),
                        const Text('See all',style: TextStyle(fontFamily: 'InterRegular',fontSize: 12,color: Color(0xff595FE5),fontWeight: FontWeight.w600),),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Column(
                      children: [
                        GridView.count(
                          primary: false,
                          shrinkWrap: true,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 5,
                          crossAxisCount: 3,
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.teal[100],
                                  image: const DecorationImage(
                                      image: AssetImage('assets/Media.png'),
                                      fit: BoxFit.cover)),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.teal[100],
                                  image: const DecorationImage(
                                      image: AssetImage('assets/Media2.png'),
                                      fit: BoxFit.cover)),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.teal[100],
                                  image: const DecorationImage(
                                      image: AssetImage('assets/Media(1).png'),
                                      fit: BoxFit.cover)),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.teal[100],
                                  image: const DecorationImage(
                                      image: AssetImage('assets/Media(2).png'),
                                      fit: BoxFit.cover)),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.teal[100],
                                  image: const DecorationImage(
                                      image: AssetImage('assets/Media(3).png'),
                                      fit: BoxFit.cover)),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.teal[100],
                                  image: const DecorationImage(
                                      image: AssetImage('assets/Media(4).png'),
                                      fit: BoxFit.cover)),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 30,),
                     Row(
                      children: [
                        Text('Files & Links',style: TextStyle(fontSize: 14, fontFamily: 'InterRegular',fontWeight: FontWeight.w600,color: notifire.getblackcolor,),),
                        const Spacer(),
                        const Text('See all',style: TextStyle(fontFamily: 'InterRegular',fontSize: 12,color: Color(0xff595FE5),fontWeight: FontWeight.w600),),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color:notifire.getbgcolor10),
                        child: DottedBorder(
                          color: const Color(0xffEEEEEE),
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(12),
                          padding: const EdgeInsets.all(12),
                          child: ClipRRect(
                            borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
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
                                    width: 5,
                                  ),
                                   Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'pdf',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular',
                                        ),
                                      ),
                                      const Text(
                                        '231.72 KB   ',
                                        style: TextStyle(
                                            color: Color(0xff727880), fontSize: 10),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: notifire.getbgcolor10),
                        child: DottedBorder(
                          color: const Color(0xffEEEEEE),
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(12),
                          padding: const EdgeInsets.all(12),
                          child: ClipRRect(
                            borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
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
                                    width: 5,
                                  ),
                                   Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '2022_2-12_Form.psd',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular',
                                        ),
                                      ),
                                      const Text(
                                        '233.45 KB',
                                        style: TextStyle(
                                            color: Color(0xff727880), fontSize: 10),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color:  notifire.getbgcolor10),
                        child: DottedBorder(
                          color: const Color(0xffEEEEEE),
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(12),
                          padding: const EdgeInsets.all(12),
                          child: ClipRRect(
                            borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
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
                                    width: 5,
                                  ),
                                   Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'file.pdf',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular',
                                        ),
                                      ),
                                      const Text(
                                        '222.22 KB',
                                        style: TextStyle(
                                            color: Color(0xff727880), fontSize: 10),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: notifire.getbgcolor10),
                        child: DottedBorder(
                          color: const Color(0xffEEEEEE),
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(12),
                          padding: const EdgeInsets.all(12),
                          child: ClipRRect(
                            borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
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
                                    width: 5,
                                  ),
                                   Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'pdf-abc.psd',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular',
                                        ),
                                      ),
                                      const Text(
                                        '765.22 KB',
                                        style: TextStyle(
                                            color: Color(0xff727880), fontSize: 10),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
                      ),
                    ),
            ],
          )):
      Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: notifire.getbgcolor11,),
      padding: const EdgeInsets.all(12),

      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
        Image.asset('assets/avatar-6 1.png',height: 80,),
            const SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 Text('Theresa Webb',style: TextStyle(fontFamily: 'InterRegular',fontSize: 20,fontWeight: FontWeight.w600,color: notifire.getblackcolor),),
                const SizedBox(width: 10,),
                SvgPicture.asset('assets/verify.svg',height: 16,color: const Color(0xff59B4D1)),
              ],
            ),
            const SizedBox(height: 10,),
            const Text('🤣 Always keep smile on your mouth 🤣',style: TextStyle(color: Color(0xff727880),fontSize: 13,fontFamily: 'InterRegular',),),
         const SizedBox(height: 30,),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween ,
              children: [
                Column(children: [
                  Text('Followers',style: TextStyle(color: Color(0xff9DA2A7),fontSize: 12,fontFamily: 'InterRegular',fontWeight: FontWeight.w600),),
                  SizedBox(height: 10,),
                  Text('43,12 M',style: TextStyle(fontFamily: 'InterRegular',fontSize: 16,fontWeight: FontWeight.w600,color: Color(0xff727880))),
                ],),
                Column(children: [
                  Text('Following',style: TextStyle(color: Color(0xff9DA2A7),fontSize: 12,fontFamily: 'InterRegular',fontWeight: FontWeight.w600),),
                  SizedBox(height: 10,),
                  Text('21,433',style: TextStyle(fontFamily: 'InterRegular',fontSize: 16,fontWeight: FontWeight.w600,color: Color(0xff727880))),
                ],),
                Column(children: [
                  Text('Live Stream',style: TextStyle(color: Color(0xff9DA2A7),fontSize: 12,fontFamily: 'InterRegular',fontWeight: FontWeight.w600),),
                  SizedBox(height: 10,),
                  Text('23,22 M',style: TextStyle(fontFamily: 'InterRegular',fontSize: 16,fontWeight: FontWeight.w600,color: Color(0xff727880))),
                ],),
              ],
            ),
            const SizedBox(height: 30,),
            Row(
              children: [
                Image.asset('assets/sms1.png',height: 16,),
                const SizedBox(width: 10,),
                const Text('AnanyaIshana@abc.com',style: TextStyle(color: Color(0xff727880),fontSize: 14,fontFamily: 'InterRegular'))
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              children: [
                Image.asset('assets/mobile2.png',height: 16,),
                const SizedBox(width: 10,),
                const Text('(+1) 682 7892 9182',style: TextStyle(color: Color(0xff727880),fontSize: 14,fontFamily: 'InterRegular'),)
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              children: [
                Image.asset('assets/share.png',height: 18,color: const Color(0xff727880)),
                const SizedBox(width: 10,),
                const Text('Abc.com/theresa_webb_121',style: TextStyle(color: Color(0xff595FE5),fontSize: 14,fontFamily: 'InterRegular'),)
              ],
            ),
            const SizedBox(height: 20,),
            Row(children: [
              Expanded(
                child:   InkWell(
            onTap: () {

      },
                  child: Container(padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(color: const Color(0xff595FE5),borderRadius: BorderRadius.circular(12),),
                  child: const Center(child: Text('Send Message',style: TextStyle(fontFamily: 'InterRegular',color: Colors.white,fontWeight: FontWeight.w500, fontSize: 14  ))),),
                ),
              ),
              const SizedBox( width: 10,),
              InkWell(
              onTap: () {

              },
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: notifire.getbgcolor10,),
                child: Center(child: Image.asset('assets/more.png',height: 16)),
                ),
              )
            ],),
            const SizedBox(height: 30,),
             Row(
              children: [
                Text('Media',style: TextStyle(fontSize: 14, fontFamily: 'InterRegular',fontWeight: FontWeight.w600,color: notifire.getblackcolor),),
                const Spacer(),
                InkWell(
                  onTap: () {
                    
                  },
                    child: const Text('See all',style: TextStyle(fontFamily: 'InterRegular',fontSize: 12,color: Color(0xff595FE5),fontWeight: FontWeight.w600),)),
              ],
            ),
            const SizedBox(height: 10,),
            Column(
              children: [
                GridView.count(
                  primary: false,
                  shrinkWrap: true,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 5,
                  crossAxisCount: 3,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.teal[100],
                          image: const DecorationImage(
                              image: AssetImage('assets/Media.png'),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.teal[100],
                          image: const DecorationImage(
                              image: AssetImage('assets/Media2.png'),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.teal[100],
                          image: const DecorationImage(
                              image: AssetImage('assets/Media(1).png'),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.teal[100],
                          image: const DecorationImage(
                              image: AssetImage('assets/Media(2).png'),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.teal[100],
                          image: const DecorationImage(
                              image: AssetImage('assets/Media(3).png'),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.teal[100],
                          image: const DecorationImage(
                              image: AssetImage('assets/Media(4).png'),
                              fit: BoxFit.cover)),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 30,),
             Row(
              children: [
                Text('Files & Links',style: TextStyle(fontSize: 14, fontFamily: 'InterRegular',fontWeight: FontWeight.w600,color: notifire.getblackcolor),),
                const Spacer(),
                InkWell(
                  onTap: () {

                  },child: const Text('See all',style: TextStyle(fontFamily: 'InterRegular',fontSize: 12,color: Color(0xff595FE5),fontWeight: FontWeight.w600),)),
              ],
            ),
            const SizedBox(height: 10,),
            InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: notifire.getbgcolor10),
                child: DottedBorder(
                  color: const Color(0xffEEEEEE),
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(12),
                  padding: const EdgeInsets.all(12),
                  child: ClipRRect(
                    borderRadius:
                    const BorderRadius.all(Radius.circular(12)),
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
                            width: 5,
                          ),
                           Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'pdf',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: notifire.getblackcolor,
                                  fontFamily: 'InterRegular',
                                ),
                              ),
                              const Text(
                                '231.72 KB   ',
                                style: TextStyle(
                                    color: Color(0xff727880), fontSize: 10),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10,),
            InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: notifire.getbgcolor10),
                child: DottedBorder(
                  color: const Color(0xffEEEEEE),
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(12),
                  padding: const EdgeInsets.all(12),
                  child: ClipRRect(
                    borderRadius:
                    const BorderRadius.all(Radius.circular(12)),
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
                            width: 5,
                          ),
                           Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '2022_2-12_Form.psd',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: notifire.getblackcolor,
                                  fontFamily: 'InterRegular',
                                ),
                              ),
                              const Text(
                                '233.45 KB',
                                style: TextStyle(
                                    color: Color(0xff727880), fontSize: 10),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10,),
            InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: notifire.getbgcolor10),
                child: DottedBorder(
                  color: const Color(0xffEEEEEE),
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(12),
                  padding: const EdgeInsets.all(12),
                  child: ClipRRect(
                    borderRadius:
                    const BorderRadius.all(Radius.circular(12)),
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
                            width: 5,
                          ),
                           Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'file.pdf',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: notifire.getblackcolor,
                                  fontFamily: 'InterRegular',
                                ),
                              ),
                              const Text(
                                '222.22 KB',
                                style: TextStyle(
                                    color: Color(0xff727880), fontSize: 10),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10,),
            InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: notifire.getbgcolor10),
                child: DottedBorder(
                  color: const Color(0xffEEEEEE),
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(12),
                  padding: const EdgeInsets.all(12),
                  child: ClipRRect(
                    borderRadius:
                    const BorderRadius.all(Radius.circular(12)),
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
                            width: 5,
                          ),
                           Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'pdf-abc.psd',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: notifire.getblackcolor,
                                  fontFamily: 'InterRegular',
                                ),
                              ),
                              const Text(
                                '765.22 KB',
                                style: TextStyle(
                                    color: Color(0xff727880), fontSize: 10),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget container1(constraints){
    return
      constraints < 600 ?
      StatefulBuilder(
        builder: (context, setState) {
          return Scaffold(
              backgroundColor: notifire.getbgcolor10,
              appBar:   AppBar(
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
              body: Padding(
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
                          Text('Profile',style: TextStyle(color: greyy,fontSize: 14,fontFamily: 'InterRegular'),),
                          const SizedBox(width: 10,),
                          Container(
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: greyy,),),
                          const SizedBox(width: 10,),
                          Text('Social',style: TextStyle(color: notifire.getblackcolor,fontSize: 14,fontFamily: 'InterRegular'),),
                        ],
                      ),
                      const SizedBox(height: 20,),
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: notifire.getbgcolor11,),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.asset('assets/avatar-7 1.png',height: 40,),
                                const SizedBox(width: 12,),
                                Expanded(
                                  child: Container(
                                    height: 45,
                                    decoration: BoxDecoration(
                                        color: notifire.Getblg2,
                                        borderRadius: BorderRadius.circular(20)),
                                    child: TextField(
                                      style:  TextStyle(color: notifire.getblackcolor,),
                                      decoration: InputDecoration(
                                        hintText: 'Tell something to Theresa ?',

                                        hintStyle: TextStyle(color: Color(0xffC6C8CB),fontSize: 15),
                                        contentPadding: const EdgeInsets.only(left: 20, right: 20),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(20),
                                            borderSide: BorderSide(color: grey2)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.circular(20)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: blue),
                                            borderRadius: BorderRadius.circular(20)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20,),
                            Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset('assets/gallery.png',height: 16,color: const Color(0xff59B4D1)),
                                    const SizedBox(width: 10,),
                                    const Text('Image & Video',style: TextStyle(fontWeight: FontWeight.w600,fontFamily: 'InterRegular',fontSize: 14,color: Color(0xff727880)),),
                                    const SizedBox(width: 20,),
                                    Image.asset('assets/hashtag1.png',height: 16,color: const Color(0xffE5646C),),
                                    const SizedBox(width: 10,),
                                    const Text('Hashtag',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', fontWeight: FontWeight.w600,color: Color(0xff727880)),),
                                    const SizedBox(width: 20,),

                                  ],
                                ),
                                const SizedBox(height: 10,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset('assets/big-grin.png',height: 16,),
                                    const SizedBox(width: 10,),
                                    const Text('Mood',style: TextStyle(fontWeight: FontWeight.w600, fontFamily: 'InterRegular',fontSize: 14,color: Color(0xff727880),),),
                                    const SizedBox(width: 20,),
                                    SvgPicture.asset('assets/attach-circle.svg',height: 16,color: const Color(0xff9E57E5)),
                                    const SizedBox(width: 10,),
                                    const Text('Attachment',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',fontWeight: FontWeight.w600,color: Color(0xff727880)),),

                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: notifire.getbgcolor11,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset('assets/avatar-6 1.png',height: 45,),
                                const SizedBox(width: 10,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text('Theresa Webb',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,fontWeight: FontWeight.w600,color: notifire.getblackcolor,),),


                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        const Text('Los Angeles',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff9DA2A7),),),
                                        const SizedBox(width: 10,),
                                        Image.asset('assets/Ellipse 88.png',height: 5),
                                        const SizedBox(width: 10,),
                                        const Text('23 March',style: TextStyle(fontFamily: 'InterRegular',color: Color(0xff9DA2A7),fontSize: 12,),),
                                      ],
                                    )
                                  ],
                                ),
                                const Spacer(),
                                Image.asset('assets/more.png',height: 20,),
                              ],
                            ),
                            const SizedBox(height: 20,),
                            Text('Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur',style: TextStyle(fontSize: 16,fontFamily: 'InterRegular',fontWeight: FontWeight.w500,color: notifire.getblackcolor,),),
                            const SizedBox(height: 20,),
                            Row(
                              children: [
                                Image.asset('assets/hashtag1.png',height: 16,color: const Color(0xff595FE5)),
                                const Text('evcp',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: Color(0xff595FE5),fontWeight: FontWeight.w600),),
                                const SizedBox(width: 10,),
                                Image.asset('assets/hashtag1.png',height: 16,color: const Color(0xff595FE5)),
                                const Text('uikits',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: Color(0xff595FE5),fontWeight: FontWeight.w600),),
                                const SizedBox(width: 10,),
                                Image.asset('assets/hashtag1.png',height: 16,color: const Color(0xff595FE5)),
                                const Text('dashboardui',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: Color(0xff595FE5),fontWeight: FontWeight.w600),),
                              ],
                            ),
                            const SizedBox(height: 10,),
                            Row(
                              children: [
                                Image.asset('assets/hashtag1.png',height: 16,color: const Color(0xff595FE5)),
                                const Text('uidesign',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: Color(0xff595FE5),fontWeight: FontWeight.w600),),
                              ],
                            ),
                            const SizedBox(height: 20,),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {

                                  },
                                  child: Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: notifire.getbgcolor10),
                                      child: Center(
                                        child: Image.asset('assets/emoji-happy.png',height: 16,color: const Color(0xff727880),),
                                      )),
                                ),
                                const SizedBox(width: 10,),
                                InkWell(
                                  onTap: () {

                                  },
                                  child: Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: notifire.getbgcolor10),
                                      child: Center(
                                        child: Image.asset('assets/sms1.png',height: 16,color: const Color(0xff727880),),
                                      )),
                                ),
                                const SizedBox(width: 10,),
                                InkWell(
                                  onTap: () {

                                  },
                                  child: Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: notifire.getbgcolor10),
                                      child: Center(
                                        child: Image.asset('assets/share.png',height: 16,color: const Color(0xff727880),),
                                      )),
                                ),

                              ],

                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: notifire.getbgcolor11,),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset('assets/avatar-8 1.png',height: 45,),
                                const SizedBox(width: 10,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text('Theresa Webb',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,fontWeight: FontWeight.w600,color: notifire.getblackcolor,),),

                                      ],
                                    ),
                                    const SizedBox(height: 5,),
                                    Row(
                                      children: [
                                        const Text('Los Angeles',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff9DA2A7),),),
                                        const SizedBox(width: 10,),
                                        Image.asset('assets/Ellipse 88.png',height: 5),
                                        const SizedBox(width: 10,),
                                        const Text('23 March',style: TextStyle(fontFamily: 'InterRegular',color: Color(0xff9DA2A7),fontSize: 12,),),
                                      ],
                                    )
                                  ],
                                ),
                                const Spacer(),
                                Image.asset('assets/more.png',height: 20,),
                              ],
                            ),
                            const SizedBox(height: 10,),
                            Image.asset('assets/Post Images.png',),
                            const SizedBox(height: 10,),
                            Text('The amazing day',style: TextStyle(fontSize: 16,fontFamily: 'InterRegular',color: notifire.getblackcolor,),),
                            const SizedBox(height: 10,),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {

                                  },
                                  child: Container(
                                      padding: const EdgeInsets.all(13),
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: notifire.getbgcolor10,),
                                      child: Center(
                                        child: Image.asset('assets/angry-face.png',height: 18),
                                      )),
                                ),
                                const SizedBox(width: 10,),
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),color: notifire.getbgcolor10),

                                  child: Center(
                                    child: Row(
                                      children: [
                                        Image.asset('assets/sms1.png',height: 20,color:  const Color(0xff727880),),
                                        const SizedBox(width: 10,),
                                        const Text('1.2 K',style: TextStyle(fontFamily: 'InterRegular',fontSize: 12,color: Color(0xff727880),fontWeight: FontWeight.w600),)
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),color: notifire.getbgcolor10),

                                  child: Center(
                                    child: Row(
                                      children: [
                                        Image.asset('assets/share.png',height: 20,color:  const Color(0xff727880),),
                                        const SizedBox(width: 10,),
                                        const Text('4.2 K',style: TextStyle(fontFamily: 'InterRegular',fontSize: 12,color: Color(0xff727880),fontWeight: FontWeight.w600),)
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20,),
                            Row(
                              children: [
                                Image.asset('assets/avatar-7 1.png',height: 40,),
                                const SizedBox(width: 12,),
                                Expanded(
                                  child: Container(
                                    height: 45,
                                    decoration: BoxDecoration(
                                        color: notifire.Getblg2,
                                        borderRadius: BorderRadius.circular(20)),
                                    child: TextField(
                                      style:  TextStyle(color: notifire.getblackcolor,),
                                      decoration: InputDecoration(
                                        hintText: 'Tell something to Theresa ?',

                                        hintStyle: TextStyle(color: Color(0xffC6C8CB),fontSize: 15),
                                        contentPadding: const EdgeInsets.only(left: 20, right: 20),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(20),
                                            borderSide: BorderSide(color: grey2)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.circular(20)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: blue),
                                            borderRadius: BorderRadius.circular(20)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20,),
                            ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: model().so.length,
                              itemBuilder: (context, index) {
                                return
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Image.asset(model().so[index],height: 35,),
                                            const SizedBox(width: 10,),
                                            Flexible(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(model().so1[index],style: const TextStyle(fontSize: 12,fontFamily: 'InterRegular',fontWeight: FontWeight.w600,color: Color(0xff727880)),),
                                                      const SizedBox(width: 10,),
                                                      const Text('13 March',style: TextStyle(fontFamily: 'InterRegular',color: Color(0xff9DA2A7),fontSize: 12,),)
                                                    ],
                                                  ),
                                                  const SizedBox(height: 5,),
                                                  Text(model().so2[index],style:  TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor,),maxLines: 2),
                                                  const SizedBox(height: 5,),
                                                  Row(
                                                    children: [
                                                      index == 0 ?  Image.asset('assets/emoji-normal.png',height: 16,color: const Color(0xff727880),): const SizedBox(),
                                                      index == 2 ?  Image.asset('assets/emoji-normal.png',height: 16,color: const Color(0xff727880),): const SizedBox(),
                                                      index == 1 ? Image.asset('assets/big-grin.png',height: 16,): const SizedBox(),
                                                      const SizedBox(width: 10,),
                                                      Image.asset('assets/message.png',height: 16,color: const Color(0xff727880)),
                                                      const SizedBox(width: 10,),
                                                      index == 0 ? const Text('2',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',fontWeight: FontWeight.w600,color: Color(0xff727880)),):const SizedBox()
                                                    ],
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                              },),
                            const SizedBox(height: 10,),
                            Center(
                              child: Container(

                                decoration: BoxDecoration(color: notifire.getbgcolor10,borderRadius: BorderRadius.circular(12),),
                                width: 110,
                                padding: const EdgeInsets.all(12),
                                child: const Center(child: Text('View More',style: TextStyle(fontWeight: FontWeight.w600,fontFamily: 'InterRegular',color: Color(0xff727880),fontSize: 12))),
                              ),
                            )
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ));
        },

      ):
      Container(
      color: notifire.getbgcolor10,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: notifire.getbgcolor11,),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset('assets/avatar-7 1.png',height: 40,),
                  const SizedBox(width: 12,),
                  Expanded(
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                          color: notifire.Getblg2,
                          borderRadius: BorderRadius.circular(20)),
                      child: TextField(
                        style:  TextStyle(color: notifire.getblackcolor,),
                        decoration: InputDecoration(
                          hintText: 'Tell something to Theresa ?',

                          hintStyle: TextStyle(color: Color(0xffC6C8CB),fontSize: 15),
                          contentPadding: const EdgeInsets.only(left: 20, right: 20),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: grey2)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(20)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: blue),
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/gallery.png',height: 16,color: const Color(0xff59B4D1)),
                  const SizedBox(width: 10,),
                  const Text('Image & Video',style: TextStyle(fontWeight: FontWeight.w600,fontFamily: 'InterRegular',fontSize: 14,color: Color(0xff727880)),),
                  const SizedBox(width: 20,),
                  Image.asset('assets/hashtag1.png',height: 16,color: const Color(0xffE5646C),),
                  const SizedBox(width: 10,),
                  const Text('Hashtag',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular', fontWeight: FontWeight.w600,color: Color(0xff727880)),),
                  const SizedBox(width: 20,),
                  Image.asset('assets/big-grin.png',height: 16,),
                  const SizedBox(width: 10,),
                  const Text('Mood',style: TextStyle(fontWeight: FontWeight.w600, fontFamily: 'InterRegular',fontSize: 14,color: Color(0xff727880),),),
                  const SizedBox(width: 20,),
                  SvgPicture.asset('assets/attach-circle.svg',height: 16,color: const Color(0xff9E57E5)),
                  const SizedBox(width: 10,),
                  const Text('Attachment',style: TextStyle(fontSize: 14,fontFamily: 'InterRegular',fontWeight: FontWeight.w600,color: Color(0xff727880)),),

                ],
              )
            ],
          ),
          ),
          const SizedBox(height: 10,),
          Container(

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: notifire.getbgcolor11,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/avatar-6 1.png',height: 45,),
                      const SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                           Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Theresa Webb',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,fontWeight: FontWeight.w600,color: notifire.getblackcolor,),),


                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              const Text('Los Angeles',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff9DA2A7),),),
                              const SizedBox(width: 10,),
                              Image.asset('assets/Ellipse 88.png',height: 5),
                              const SizedBox(width: 10,),
                              const Text('23 March',style: TextStyle(fontFamily: 'InterRegular',color: Color(0xff9DA2A7),fontSize: 12,),),
                            ],
                          )
                        ],
                      ),
                      const Spacer(),
                      Image.asset('assets/more.png',height: 20,),
                    ],
                  ),
                  const SizedBox(height: 20,),
                   Text('Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur',style: TextStyle(fontSize: 16,fontFamily: 'InterRegular',fontWeight: FontWeight.w500,color: notifire.getblackcolor,),),
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      Image.asset('assets/hashtag1.png',height: 16,color: const Color(0xff595FE5)),
                    const Text('evcp',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: Color(0xff595FE5),fontWeight: FontWeight.w600),),
                      const SizedBox(width: 10,),
                      Image.asset('assets/hashtag1.png',height: 16,color: const Color(0xff595FE5)),
                      const Text('uikits',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: Color(0xff595FE5),fontWeight: FontWeight.w600),),
                      const SizedBox(width: 10,),
                      Image.asset('assets/hashtag1.png',height: 16,color: const Color(0xff595FE5)),
                      const Text('dashboardui',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: Color(0xff595FE5),fontWeight: FontWeight.w600),),
                      const SizedBox(width: 10,),
                      Image.asset('assets/hashtag1.png',height: 16,color: const Color(0xff595FE5)),
                      const Text('uidesign',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,color: Color(0xff595FE5),fontWeight: FontWeight.w600),),

                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {

                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: notifire.getbgcolor11,),
                          child: Center(
                            child: Image.asset('assets/emoji-happy.png',height: 16,color: const Color(0xff727880),),
                          )),
                      ),
                      const SizedBox(width: 10,),
                      InkWell(
                        onTap: () {

                        },
                        child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: notifire.getbgcolor11,),
                            child: Center(
                              child: Image.asset('assets/sms1.png',height: 16,color: const Color(0xff727880),),
                            )),
                      ),
                      const SizedBox(width: 10,),
                      InkWell(
                        onTap: () {

                        },
                        child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: notifire.getbgcolor11,),
                            child: Center(
                              child: Image.asset('assets/share.png',height: 16,color: const Color(0xff727880),),
                            )),
                      ),

                    ],

                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 10,),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: notifire.getbgcolor11,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset('assets/avatar-8 1.png',height: 45,),
                  const SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Theresa Webb',style: TextStyle(fontFamily: 'InterRegular',fontSize: 14,fontWeight: FontWeight.w600,color: notifire.getblackcolor,),),

                        ],
                      ),
                      const SizedBox(height: 5,),
                      Row(
                        children: [
                          const Text('Los Angeles',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',color: Color(0xff9DA2A7),),),
                          const SizedBox(width: 10,),
                          Image.asset('assets/Ellipse 88.png',height: 5),
                          const SizedBox(width: 10,),
                          const Text('23 March',style: TextStyle(fontFamily: 'InterRegular',color: Color(0xff9DA2A7),fontSize: 12,),),
                        ],
                      )
                    ],
                  ),
                  const Spacer(),
                  Image.asset('assets/more.png',height: 20,),
                ],
              ),
              const SizedBox(height: 10,),
              Image.asset('assets/Post Images.png',),
              const SizedBox(height: 10,),
               Text('The amazing day',style: TextStyle(fontSize: 16,fontFamily: 'InterRegular',color: notifire.getblackcolor,),),
              const SizedBox(height: 10,),
              Row(
                children: [
                  InkWell(
                    onTap: () {

                    },
                    child: Container(
                        padding: const EdgeInsets.all(13),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: notifire.getbgcolor10),
                        child: Center(
                          child: Image.asset('assets/angry-face.png',height: 18),
                        )),
                  ),
                  const SizedBox(width: 10,),
                  InkWell(
                    onTap: () {

                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),color: notifire.getbgcolor10,
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            Image.asset('assets/sms1.png',height: 20,color:  const Color(0xff727880),),
                            const SizedBox(width: 10,),
                            const Text('1.2 K',style: TextStyle(fontFamily: 'InterRegular',fontSize: 12,color: Color(0xff727880),fontWeight: FontWeight.w600),)
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: () {

                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),color: notifire.getbgcolor10,
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            Image.asset('assets/share.png',height: 20,color:  const Color(0xff727880),),
                            const SizedBox(width: 10,),
                            const Text('4.2 K',style: TextStyle(fontFamily: 'InterRegular',fontSize: 12,color: Color(0xff727880),fontWeight: FontWeight.w600),)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                children: [
                  Image.asset('assets/avatar-7 1.png',height: 40,),
                  const SizedBox(width: 12,),
                  Expanded(
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                          color: notifire.Getblg2,
                          borderRadius: BorderRadius.circular(20)),
                      child: TextField(
                        style:  TextStyle(color: notifire.getblackcolor,),
                        decoration: InputDecoration(
                          hintText: 'Tell something to Theresa ?',

                          hintStyle: TextStyle(color: Color(0xffC6C8CB),fontSize: 15),
                          contentPadding: const EdgeInsets.only(left: 20, right: 20),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: grey2)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(20)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: blue),
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: model().so.length,
                itemBuilder: (context, index) {
                return
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(model().so[index],height: 35,),
                              const SizedBox(width: 10,),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(model().so1[index],style: const TextStyle(fontSize: 12,fontFamily: 'InterRegular',fontWeight: FontWeight.w600,color: Color(0xff727880)),),
                                      const SizedBox(width: 10,),
                                      const Text('13 March',style: TextStyle(fontFamily: 'InterRegular',color: Color(0xff9DA2A7),fontSize: 12,),)
                                      ],
                                    ),
                                    const SizedBox(height: 5,),
                                    Text(model().so2[index],style:  TextStyle(fontSize: 14,fontFamily: 'InterRegular',color: notifire.getblackcolor,),maxLines: 2),
                                    const SizedBox(height: 5,),
                                    Row(
                                      children: [
                                   index == 0 ?  Image.asset('assets/emoji-normal.png',height: 16,color: const Color(0xff727880),): const SizedBox(),
                                   index == 2 ?  Image.asset('assets/emoji-normal.png',height: 16,color: const Color(0xff727880),): const SizedBox(),
                                      index == 1 ? Image.asset('assets/big-grin.png',height: 16,): const SizedBox(),
                                        const SizedBox(width: 10,),
                                        Image.asset('assets/message.png',height: 16,color: const Color(0xff727880)),
                                        const SizedBox(width: 10,),
                                index == 0 ? const Text('2',style: TextStyle(fontSize: 12,fontFamily: 'InterRegular',fontWeight: FontWeight.w600,color: Color(0xff727880)),):const SizedBox()
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    );
              },),
              const SizedBox(height: 10,),
              Center(
                child: InkWell(
                  onTap: () {

                  },
                  child: Container(

                    decoration: BoxDecoration(color: notifire.getbgcolor10,borderRadius: BorderRadius.circular(12),),
                    width: 110,
                    padding: const EdgeInsets.all(12),
                    child: const Center(child: Text('View More',style: TextStyle(fontWeight: FontWeight.w600,fontFamily: 'InterRegular',color: Color(0xff727880),fontSize: 12))),
                  ),
                ),
              )
            ],
          ),
          ),

        ],
      ),
    );
  }

  Widget container2(constraints){
    return constraints < 600 ?
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
                padding: const EdgeInsets.all(16),
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
                        Text('Profile',style: TextStyle(color: greyy,fontSize: 14,fontFamily: 'InterRegular'),),
                        const SizedBox(width: 10,),
                        Container(
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: greyy,),),
                        const SizedBox(width: 10,),
                        Text('Social',style: TextStyle(color: notifire.getblackcolor,fontSize: 14,fontFamily: 'InterRegular'),),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: notifire.getbgcolor11,),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Connecters ',style: TextStyle(fontSize: 16,fontFamily: 'InterRegular',fontWeight: FontWeight.w600,color: notifire.getblackcolor,),),
                          const SizedBox(height: 10,),
                          ListView.builder(
                            shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),
                            itemCount: model().so4.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                                    color: notifire.getbgcolor10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Image.asset(model().so3[index],height: 40,),
                                        const SizedBox(width: 10,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(model().so4[index],style:  TextStyle(fontFamily: 'InterRegular',fontSize:  14,fontWeight:  FontWeight.w400,color: notifire.getblackcolor,),),
                                            const SizedBox(height: 5,),
                                            Text(model().so5[index],style: const TextStyle(fontFamily: 'InterRegular',fontSize: 12,color: Color(0xff727880),),),

                                          ],
                                        ),
                                        const Spacer(),
                                        SvgPicture.asset('assets/messages-3.svg',height: 18,color: const Color(0xff9DA2A7),)
                                      ],
                                    )
                                  ],
                                ),
                              );
                            },),
                          Text('Interest',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,fontFamily: 'InterRegular',color: notifire.getblackcolor,),),
                          const SizedBox(height: 20,),
                          GridView.count(
                            primary: false,
                            shrinkWrap: true,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 5,
                            crossAxisCount: 3,
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: const BoxDecoration(
                                  // borderRadius: BorderRadius.circular(12),

                                    image: DecorationImage(
                                        image: AssetImage('assets/Brand Logo11.png'),
                                        fit: BoxFit.cover)),
                              ),
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: const BoxDecoration(
                                  // borderRadius: BorderRadius.circular(15),

                                    image: DecorationImage(
                                        image: AssetImage('assets/Brand Logo21.png'),
                                        fit: BoxFit.cover)),
                              ),
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: const BoxDecoration(
                                  // borderRadius: BorderRadius.circular(12),
                                    image: DecorationImage(
                                        image: AssetImage('assets/Brand Logo22.png'),
                                        fit: BoxFit.cover)),
                              ),
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    image: const DecorationImage(
                                        image: AssetImage('assets/Brand23.png'),
                                        fit: BoxFit.cover)),
                              ),
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    image: const DecorationImage(
                                        image: AssetImage('assets/Media14.png'),
                                        fit: BoxFit.cover)),
                              ),

                            ],
                          ),
                          const SizedBox(height: 20,),
                          Text('Follow Hashtag',style: TextStyle(fontSize: 16,fontFamily: 'InterRegular',fontWeight: FontWeight.w600,color: notifire.getblackcolor,),),
                          SizedBox(

                            width: Get.width * 1 ,
                            child: Container(
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: notifire.getbgcolor10),
                              child: TextFieldTags<String>(
                                  textfieldTagsController: _stringTagController,
                                  initialTags:const ['python','java'],
                                  textSeparators: const [' ', ','],
                                  inputFieldBuilder: (context, inputFieldValues){
                                    return TextField(
                                      onTap: () {
                                        _stringTagController.getFocusNode?.requestFocus();
                                      },
                                      // maxLines: 6,
                                      decoration:

                                      InputDecoration(

                                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide:BorderSide.none),
                                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color: notifire.getgrey1)),
                                        disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide.none),

                                        hintText: inputFieldValues.tags.isNotEmpty ? '' : "Enter tag...".tr,
                                        prefixIcon: inputFieldValues.tags.isNotEmpty ? SingleChildScrollView(
                                          controller: inputFieldValues.tagScrollController,
                                          scrollDirection: Axis.vertical,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Wrap(
                                                runSpacing: 4.0,
                                                spacing: 4.0,
                                                children: inputFieldValues.tags.map((String tag) {
                                                  return Container(
                                                    decoration:  BoxDecoration(
                                                      borderRadius:  const BorderRadius.all(Radius.circular(15)),
                                                      color: notifire.getbgcolor11,
                                                    ),
                                                    margin: const EdgeInsets.only(right: 10),
                                                    padding: const EdgeInsets.all(8),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      mainAxisSize: MainAxisSize.min,
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        Center(child: Text('#$tag', style:  TextStyle(color: notifire.getblackcolor,fontFamily: 'InterRegular'))),
                                                        const SizedBox(width: 5),
                                                        InkWell(
                                                          child: const Icon(Icons.cancel_outlined, size: 18, color: Color(0xff595FE5)),
                                                          onTap: () {
                                                            inputFieldValues.onTagRemoved(tag);
                                                          },
                                                        )
                                                      ],
                                                    ),
                                                  );
                                                }).toList()),
                                          ),
                                        ) : null,
                                        suffixIcon: inputFieldValues.tags.isNotEmpty ? InkWell(
                                            onTap: () {
                                              _stringTagController.clearTags();
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(top: 10, right: 10),
                                              child: Text('All Clear'.tr,style: TextStyle(color: notifire.getblackcolor,fontFamily: 'InterRegular')),
                                            )) : Padding(
                                          padding: const EdgeInsets.only(top: 10, right: 10),
                                          child: Text('All Clear'.tr,style: TextStyle(color: notifire.getblackcolor, fontFamily:'InterRegular')),
                                        ),
                                      ),
                                      controller: inputFieldValues.textEditingController,
                                      focusNode: inputFieldValues.focusNode,
                                      onChanged: inputFieldValues.onTagChanged,
                                      onSubmitted: inputFieldValues.onTagSubmitted,
                                    );
                                  }
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
          );
        },

      ):
      Container(

        decoration: BoxDecoration(color: notifire.getbgcolor11,borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
           Text('Connecters ',style: TextStyle(fontSize: 16,fontFamily: 'InterRegular',fontWeight: FontWeight.w600,color: notifire.getblackcolor,),),
          const SizedBox(height: 10,),
          ListView.builder(
            shrinkWrap: true,
            itemCount: model().so4.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
            color: notifire.getbgcolor10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(model().so3[index],height: 40,),
                      const SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(model().so4[index],style:  TextStyle(fontFamily: 'InterRegular',fontSize:  14,fontWeight:  FontWeight.w400,color: notifire.getblackcolor,),),
                      const SizedBox(height: 5,),
                      Text(model().so5[index],style: const TextStyle(fontFamily: 'InterRegular',fontSize: 12,color: Color(0xff727880),),),

                        ],
                      ),
                      const Spacer(),
                      SvgPicture.asset('assets/messages-3.svg',height: 18,color: const Color(0xff9DA2A7),)
                    ],
                  )
                ],
              ),
            );
          },),
           Text('Interest',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,fontFamily: 'InterRegular',color: notifire.getblackcolor,),),
          const SizedBox(height: 20,),
          GridView.count(
            primary: false,
            shrinkWrap: true,
            crossAxisSpacing: 10,
            mainAxisSpacing: 5,
            crossAxisCount: 3,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                    // borderRadius: BorderRadius.circular(12),

                    image: DecorationImage(
                        image: AssetImage('assets/Brand Logo11.png'),
                        fit: BoxFit.cover)),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                    // borderRadius: BorderRadius.circular(15),

                    image: DecorationImage(
                        image: AssetImage('assets/Brand Logo21.png'),
                        fit: BoxFit.cover)),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                    // borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        image: AssetImage('assets/Brand Logo22.png'),
                        fit: BoxFit.cover)),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    image: const DecorationImage(
                        image: AssetImage('assets/Brand23.png'),
                        fit: BoxFit.cover)),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    image: const DecorationImage(
                        image: AssetImage('assets/Media14.png'),
                        fit: BoxFit.cover)),
              ),

            ],
          ),
          const SizedBox(height: 20,),
           Text('Follow Hashtag',style: TextStyle(fontSize: 16,fontFamily: 'InterRegular',fontWeight: FontWeight.w600,color: notifire.getblackcolor,),),
          const SizedBox(height: 10,),
          SizedBox(

            width: Get.width * 0.2 ,
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: notifire.getbgcolor10),
              child: TextFieldTags<String>(
                  textfieldTagsController: _stringTagController,
                  initialTags:const ['python','java'],
                  textSeparators: const [' ', ','],
                  inputFieldBuilder: (context, inputFieldValues){
                    return TextField(
                      onTap: () {
                        _stringTagController.getFocusNode?.requestFocus();
                      },
                      // maxLines: 6,
                      decoration:

                      InputDecoration(

                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide:BorderSide.none),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color: notifire.getgrey1)),
                        disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide.none),

                        hintText: inputFieldValues.tags.isNotEmpty ? '' : "Enter tag...".tr,
                        hintStyle:  TextStyle(color: notifire.getblackcolor),
                        prefixIcon: inputFieldValues.tags.isNotEmpty ? SingleChildScrollView(
                          controller: inputFieldValues.tagScrollController,
                          scrollDirection: Axis.vertical,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Wrap(
                                runSpacing: 4.0,
                                spacing: 4.0,
                                children: inputFieldValues.tags.map((String tag) {
                                  return Container(
                                    decoration:  BoxDecoration(
                                      borderRadius:  const BorderRadius.all(Radius.circular(15)),
                                      color: notifire.getbgcolor11,
                                    ),
                                    margin: const EdgeInsets.only(right: 10),
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Center(child: Text('#$tag', style:  TextStyle(color: notifire.getblackcolor,fontFamily: 'InterRegular'))),
                                        const SizedBox(width: 5),
                                        InkWell(
                                          child: const Icon(Icons.cancel_outlined, size: 18, color: Color(0xff595FE5)),
                                          onTap: () {
                                            inputFieldValues.onTagRemoved(tag);
                                          },
                                        )
                                      ],
                                    ),
                                  );
                                }).toList()),
                          ),
                        ) : null,
                        suffixIcon: inputFieldValues.tags.isNotEmpty ? InkWell(
                            onTap: () {
                              _stringTagController.clearTags();
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10, right: 10),
                              child: Text('All Clear'.tr,style: TextStyle(color: notifire.getblackcolor,fontFamily: 'InterRegular')),
                            )) : Padding(
                          padding: const EdgeInsets.only(top: 10, right: 10),
                          child: Text('All Clear'.tr,style: TextStyle(color: notifire.getblackcolor, fontFamily:'InterRegular')),
                        ),
                      ),
                      controller: inputFieldValues.textEditingController,
                      focusNode: inputFieldValues.focusNode,
                      onChanged: inputFieldValues.onTagChanged,
                      onSubmitted: inputFieldValues.onTagSubmitted,
                    );
                  }
              ),
            ),
          ),

        ],
      ),
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
