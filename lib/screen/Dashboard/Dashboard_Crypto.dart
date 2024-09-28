import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:evcp/confing/colors.dart';
import 'package:evcp/confing/list.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

import '../../confing/image.dart';
import '../../confing/notifier.dart';
import '../../controller/page_controller.dart';

class Crypto extends StatefulWidget {
  const Crypto({super.key});

  @override
  State<Crypto> createState() => _CryptoState();
}

class _CryptoState extends State<Crypto> {
  List<String> list1 = <String>[
    'BTC (Bitcoin)',
    'ETH',
    'Gold',
    'BNB',
    'ADA',
  ];
  List<String> list2 = <String>[
    'My Wallet',
    '1000',
    '5000',
    '15000',
    '10000',
  ];
  ScrollController pg = ScrollController();

  int a = 15;

  String dropdownvalue = 'BTC (Bitcoin)';
  String dropdownvalue1 = 'My Wallet';
  final List<ChartData1> chartData1 = [
    ChartData1(2010, 35),
    ChartData1(2011, 28),
    ChartData1(2012, 34),
    ChartData1(2013, 32),
    ChartData1(2014, 40)
  ];
  int value = 0;
  late ColorNotifier notifire;
  bool tap = false;

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifier>(context, listen: true);

    return GetBuilder<InboxController>(builder: (inboxController) {
      return LayoutBuilder(
        builder: (context, raints) {
          if (raints.maxWidth < 600) {
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
                          crypto(context, raints.maxWidth),
                          const SizedBox(
                            height: 10,
                          ),
                          Activity(context, raints.maxWidth),
                          const SizedBox(
                            height: 10,
                          ),
                          Buysell(context, raints.maxWidth),
                          const SizedBox(
                            height: 10,
                          ),
                          Market(context, raints.maxWidth),
                          const SizedBox(
                            height: 10,
                          ),
                          list(context, raints.maxWidth),
                          const SizedBox(
                            height: 10,
                          ),
                          table(context, raints.maxWidth, raints),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (raints.maxWidth < 1000) {
            return SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(color: notifire.getbgcolor10),
                child: Padding(
                  padding:
                      const EdgeInsets.only(bottom: 20, right: 20, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      crypto(context, raints.maxWidth),
                      const SizedBox(
                        height: 20,
                      ),
                      Activity(context, raints.maxWidth),
                      const SizedBox(
                        height: 20,
                      ),
                      Buysell(context, raints.maxWidth),
                      const SizedBox(
                        height: 20,
                      ),
                      Market(context, raints.maxWidth),
                      const SizedBox(
                        height: 20,
                      ),
                      list(context, raints.maxWidth),
                      const SizedBox(
                        height: 20,
                      ),
                      table(context, raints.maxWidth, raints),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Container(
              decoration: BoxDecoration(color: notifire.getbgcolor10),
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.only(right: 20, left: 20, bottom: 20),
                  child: Column(
                    children: [
                      ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: 1,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: crypto(context, raints.maxWidth)),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                      child:
                                          Activity(context, raints.maxWidth)),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                      child: Buysell(context, raints.maxWidth)),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Market(context, raints.maxWidth),
                              const SizedBox(
                                height: 20,
                              ),
                              list(context, raints.maxWidth),
                              const SizedBox(
                                height: 20,
                              ),
                              table(context, raints.maxWidth, raints)
                            ],
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            );
          }
        },
      );
    });
  }

  Widget crypto(BuildContext context, size) {
    return GetBuilder<InboxController>(
      builder: (controller) {
        return size < 600
            ? Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: notifire.getbgcolor11,
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '\$797.033K',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: notifire.getblackcolor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Total Buy',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: notifire.getblackcolor,
                                ),
                              ),
                              const Spacer(),
                              Text('+18.79%',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: notifire.getblackcolor,
                                      fontWeight: FontWeight.w600)),
                              const SizedBox(width: 5),
                              Image.asset(
                                'assets/trend-up.png',
                                scale: 3,
                                color: notifire.getblackcolor,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: notifire.getbgcolor11,
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '\$25.879k',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: notifire.getblackcolor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Total Sell',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: notifire.getblackcolor,
                                ),
                              ),
                              const Spacer(),
                              Text('+10.22%',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: notifire.getblackcolor,
                                      fontWeight: FontWeight.w600)),
                              const SizedBox(width: 5),
                              Image.asset(
                                'assets/trend-up.png',
                                scale: 3,
                                color: notifire.getblackcolor,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: notifire.getbgcolor11,
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '22,445',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: notifire.getblackcolor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Total Invested',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: notifire.getblackcolor,
                                ),
                              ),
                              const Spacer(),
                              Text('+15.56%',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: notifire.getblackcolor,
                                      fontWeight: FontWeight.w600)),
                              const SizedBox(width: 5),
                              Image.asset(
                                'assets/trend-up.png',
                                scale: 3,
                                color: notifire.getblackcolor,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: notifire.getbgcolor11,
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '9,567',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: notifire.getblackcolor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Day Change',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: notifire.getblackcolor,
                                ),
                              ),
                              const Spacer(),
                              Text('+1.22%',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: notifire.getblackcolor,
                                      fontWeight: FontWeight.w600)),
                              const SizedBox(width: 5),
                              Image.asset(
                                'assets/trend-up.png',
                                scale: 3,
                                color: notifire.getblackcolor,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
            : Column(
                children: [
                  Container(
                    height: size > 1500 ? 122 : null,
                    decoration: BoxDecoration(
                        color: notifire.getbgcolor11,
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '\$797.033K',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: notifire.getblackcolor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Total Buy',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: notifire.getblackcolor,
                                ),
                              ),
                              const Spacer(),
                              Text('+18.79%',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: notifire.getblackcolor,
                                      fontWeight: FontWeight.w600)),
                              const SizedBox(width: 5),
                              Image.asset(
                                'assets/trend-up.png',
                                scale: 3,
                                color: notifire.getblackcolor,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: size > 1500 ? 122 : null,
                    decoration: BoxDecoration(
                        color: notifire.getbgcolor11,
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '\$25.879k',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: notifire.getblackcolor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Total Sell',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: notifire.getblackcolor,
                                ),
                              ),
                              const Spacer(),
                              Text('+10.22%',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: notifire.getblackcolor,
                                      fontWeight: FontWeight.w600)),
                              const SizedBox(width: 5),
                              Image.asset(
                                'assets/trend-up.png',
                                scale: 3,
                                color: notifire.getblackcolor,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: size > 1500 ? 122 : null,
                    decoration: BoxDecoration(
                        color: notifire.getbgcolor11,
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '22,445',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: notifire.getblackcolor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Total Invested',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: notifire.getblackcolor,
                                ),
                              ),
                              const Spacer(),
                              Text('+15.56%',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: notifire.getblackcolor,
                                      fontWeight: FontWeight.w600)),
                              const SizedBox(width: 5),
                              Image.asset(
                                'assets/trend-up.png',
                                scale: 3,
                                color: notifire.getblackcolor,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: size > 1500 ? 122 : null,
                    decoration: BoxDecoration(
                        color: notifire.getbgcolor11,
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '9,567',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: notifire.getblackcolor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Day Change',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: notifire.getblackcolor,
                                ),
                              ),
                              const Spacer(),
                              Text('+1.22%',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: notifire.getblackcolor,
                                      fontWeight: FontWeight.w600)),
                              const SizedBox(width: 5),
                              Image.asset(
                                'assets/trend-up.png',
                                scale: 3,
                                color: notifire.getblackcolor,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              );
      },
    );
  }

  Widget Activity(BuildContext context, size) => GetBuilder<InboxController>(
        builder: (controller) {
          return size < 600
              ? Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: notifire.getbgcolor11,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text('Recent Activity',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: notifire.getblackcolor,
                                      fontFamily: 'InterRegular',
                                      fontWeight: FontWeight.w600)),
                              const Spacer(),
                              InkWell(
                                onTap: () {},
                                child: const Text(
                                  'See all',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'InterBold',
                                      color: Color(0xff595FE5)),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Row(
                            children: [
                              Text(
                                'Yesterday, 21 Sep 2022',
                                style: TextStyle(
                                    color: Color(0xff9DA2A7),
                                    fontSize: 12,
                                    fontFamily: 'InterRegular'),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: const Color(0xffE6F9EF),
                                    borderRadius:
                                        BorderRadiusDirectional.circular(10)),
                                child: Center(
                                    child: Image.asset('assets/money-add.png',
                                        scale: 3.5)),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Buy Bitcoin',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular,',
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text('coinmarket.com',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff9DA2A7),
                                          fontFamily: 'InterRegular',
                                          fontWeight: FontWeight.normal)),
                                ],
                              ),
                              const Spacer(),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('+0.028029182 BTC',
                                      style: TextStyle(
                                          color: Color(0xff7DC066),
                                          fontSize: 14)),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('+\$219.78',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff9DA2A7),
                                          fontFamily: 'InterRegular')),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: const Color(0xffFAEBEC),
                                    borderRadius:
                                        BorderRadiusDirectional.circular(10)),
                                child: Center(
                                    child: Image.asset(
                                  'assets/money-add.png',
                                  scale: 3.5,
                                  color: const Color(0xffE5646C),
                                )),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Sell Ethereum',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular,',
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text('binace.com',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff9DA2A7),
                                          fontFamily: 'InterRegular',
                                          fontWeight: FontWeight.normal)),
                                ],
                              ),
                              const Spacer(),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('-0.0291802 ETH',
                                      style: TextStyle(
                                          color: Color(0xffE5646C),
                                          fontSize: 14)),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('-\$679.78',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff9DA2A7),
                                          fontFamily: 'InterRegular')),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: const Color(0xffE6F9EF),
                                    borderRadius:
                                        BorderRadiusDirectional.circular(10)),
                                child: Center(
                                    child: Image.asset('assets/money-add.png',
                                        scale: 3.5)),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Buy Bitcoin',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular,',
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text('My Wallet',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff9DA2A7),
                                          fontFamily: 'InterRegular',
                                          fontWeight: FontWeight.normal)),
                                ],
                              ),
                              const Spacer(),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('+0.028029182 BTC',
                                      style: TextStyle(
                                          color: Color(0xff7DC066),
                                          fontSize: 14)),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('+\$219.78',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff9DA2A7),
                                          fontFamily: 'InterRegular')),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Row(
                            children: [
                              Text(
                                '12 Sep 2022',
                                style: TextStyle(
                                    color: Color(0xff9DA2A7),
                                    fontSize: 12,
                                    fontFamily: 'InterRegular'),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: const Color(0xffFAEBEC),
                                    borderRadius:
                                        BorderRadiusDirectional.circular(10)),
                                child: Center(
                                    child: Image.asset(
                                  'assets/money-add.png',
                                  scale: 3.5,
                                  color: const Color(0xffE5646C),
                                )),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Sell Bitcoin',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular,',
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text('coinmarket.com',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff9DA2A7),
                                          fontFamily: 'InterRegular',
                                          fontWeight: FontWeight.normal)),
                                ],
                              ),
                              const Spacer(),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('-0.028029182 BTC',
                                      style: TextStyle(
                                          color: Color(0xffE5646C),
                                          fontSize: 14)),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('-\$119.78',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff9DA2A7),
                                          fontFamily: 'InterRegular')),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: const Color(0xffFAEBEC),
                                    borderRadius:
                                        BorderRadiusDirectional.circular(10)),
                                child: Center(
                                    child: Image.asset(
                                  'assets/money-add.png',
                                  scale: 3.5,
                                  color: const Color(0xffE5646C),
                                )),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Sell Bitcoin',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular,',
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text('binace.com',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff9DA2A7),
                                          fontFamily: 'InterRegular',
                                          fontWeight: FontWeight.normal)),
                                ],
                              ),
                              const Spacer(),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('-0.028029182 BTC',
                                      style: TextStyle(
                                          color: Color(0xffE5646C),
                                          fontSize: 14)),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('-\$719.78',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff9DA2A7),
                                          fontFamily: 'InterRegular')),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: const Color(0xffFAEBEC),
                                    borderRadius:
                                        BorderRadiusDirectional.circular(10)),
                                child: Center(
                                    child: Image.asset(
                                  'assets/money-add.png',
                                  scale: 3.5,
                                  color: const Color(0xffE5646C),
                                )),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Sell Bitcoin',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular,',
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text('My Wallet',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff9DA2A7),
                                          fontFamily: 'InterRegular',
                                          fontWeight: FontWeight.normal)),
                                ],
                              ),
                              const Spacer(),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('-0.028029182 BTC',
                                      style: TextStyle(
                                          color: Color(0xffE5646C),
                                          fontSize: 14)),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('-\$669.78',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff9DA2A7),
                                          fontFamily: 'InterRegular')),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: const Color(0xffE6F9EF),
                                    borderRadius:
                                        BorderRadiusDirectional.circular(10)),
                                child: Center(
                                    child: Image.asset('assets/money-add.png',
                                        scale: 3.5)),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Buy Bitcoin',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular,',
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text('coinmarket.com',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff9DA2A7),
                                          fontFamily: 'InterRegular',
                                          fontWeight: FontWeight.normal)),
                                ],
                              ),
                              const Spacer(),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('+0.028029182 BTC',
                                      style: TextStyle(
                                          color: Color(0xff7DC066),
                                          fontSize: 14)),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('+\$219.78',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff9DA2A7),
                                          fontFamily: 'InterRegular')),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : Container(
                  height: size < 1500
                      ? Get.height * 0.595
                      : size > 1500
                          ? Get.height * 0.61
                          : null,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: notifire.getbgcolor11,
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text('Recent Activity',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: notifire.getblackcolor,
                                      fontFamily: 'InterRegular',
                                      fontWeight: FontWeight.w600)),
                              const Spacer(),
                              InkWell(
                                onTap: () {},
                                child: const Text(
                                  'See all',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'InterBold',
                                      color: Color(0xff595FE5)),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Row(
                            children: [
                              Text(
                                'Yesterday, 21 Sep 2022',
                                style: TextStyle(
                                    color: Color(0xff9DA2A7),
                                    fontSize: 12,
                                    fontFamily: 'InterRegular'),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: const Color(0xffE6F9EF),
                                    borderRadius:
                                        BorderRadiusDirectional.circular(10)),
                                child: Center(
                                    child: Image.asset('assets/money-add.png',
                                        scale: 3.5)),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Buy Bitcoin',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular,',
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text('coinmarket.com',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff9DA2A7),
                                          fontFamily: 'InterRegular',
                                          fontWeight: FontWeight.normal)),
                                ],
                              ),
                              const Spacer(),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('+0.028029182 BTC',
                                      style: TextStyle(
                                          color: Color(0xff7DC066),
                                          fontSize: 14)),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('+\$219.78',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff9DA2A7),
                                          fontFamily: 'InterRegular')),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: const Color(0xffFAEBEC),
                                    borderRadius:
                                        BorderRadiusDirectional.circular(10)),
                                child: Center(
                                    child: Image.asset(
                                  'assets/money-add.png',
                                  scale: 3.5,
                                  color: const Color(0xffE5646C),
                                )),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Sell Ethereum',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular,',
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text('binace.com',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff9DA2A7),
                                          fontFamily: 'InterRegular',
                                          fontWeight: FontWeight.normal)),
                                ],
                              ),
                              const Spacer(),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('-0.0291802 ETH',
                                      style: TextStyle(
                                          color: Color(0xffE5646C),
                                          fontSize: 14)),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('-\$679.78',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff9DA2A7),
                                          fontFamily: 'InterRegular')),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: const Color(0xffE6F9EF),
                                    borderRadius:
                                        BorderRadiusDirectional.circular(10)),
                                child: Center(
                                    child: Image.asset('assets/money-add.png',
                                        scale: 3.5)),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Buy Bitcoin',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular,',
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text('My Wallet',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff9DA2A7),
                                          fontFamily: 'InterRegular',
                                          fontWeight: FontWeight.normal)),
                                ],
                              ),
                              const Spacer(),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('+0.028029182 BTC',
                                      style: TextStyle(
                                          color: Color(0xff7DC066),
                                          fontSize: 14)),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('+\$219.78',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff9DA2A7),
                                          fontFamily: 'InterRegular')),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Row(
                            children: [
                              Text(
                                '12 Sep 2022',
                                style: TextStyle(
                                    color: Color(0xff9DA2A7),
                                    fontSize: 12,
                                    fontFamily: 'InterRegular'),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: const Color(0xffFAEBEC),
                                    borderRadius:
                                        BorderRadiusDirectional.circular(10)),
                                child: Center(
                                    child: Image.asset(
                                  'assets/money-add.png',
                                  scale: 3.5,
                                  color: const Color(0xffE5646C),
                                )),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Sell Bitcoin',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular,',
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text('coinmarket.com',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff9DA2A7),
                                          fontFamily: 'InterRegular',
                                          fontWeight: FontWeight.normal)),
                                ],
                              ),
                              const Spacer(),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('+0.028029182 BTC',
                                      style: TextStyle(
                                          color: Color(0xffE5646C),
                                          fontSize: 14)),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('-\$119.78',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff9DA2A7),
                                          fontFamily: 'InterRegular')),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: const Color(0xffFAEBEC),
                                    borderRadius:
                                        BorderRadiusDirectional.circular(10)),
                                child: Center(
                                    child: Image.asset(
                                  'assets/money-add.png',
                                  scale: 3.5,
                                  color: const Color(0xffE5646C),
                                )),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Sell Bitcoin',
                                      style: TextStyle(
                                          color: notifire.getblackcolor,
                                          fontSize: 14,
                                          fontFamily: 'InterRegular,',
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text('binace.com',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff9DA2A7),
                                          fontFamily: 'InterRegular',
                                          fontWeight: FontWeight.normal)),
                                ],
                              ),
                              const Spacer(),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('+0.028029182 BTC',
                                      style: TextStyle(
                                          color: Color(0xffE5646C),
                                          fontSize: 14)),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('-\$719.78',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff9DA2A7),
                                          fontFamily: 'InterRegular')),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: const Color(0xffFAEBEC),
                                    borderRadius:
                                        BorderRadiusDirectional.circular(10)),
                                child: Center(
                                    child: Image.asset(
                                  'assets/money-add.png',
                                  scale: 3.5,
                                  color: const Color(0xffE5646C),
                                )),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Sell Bitcoin',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular,',
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text('My Wallet',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff9DA2A7),
                                          fontFamily: 'InterRegular',
                                          fontWeight: FontWeight.normal)),
                                ],
                              ),
                              const Spacer(),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('+0.028029182 BTC',
                                      style: TextStyle(
                                          color: Color(0xffE5646C),
                                          fontSize: 14)),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('-\$669.78',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff9DA2A7),
                                          fontFamily: 'InterRegular')),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: const Color(0xffE6F9EF),
                                    borderRadius:
                                        BorderRadiusDirectional.circular(10)),
                                child: Center(
                                    child: Image.asset('assets/money-add.png',
                                        scale: 3.5)),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Buy Bitcoin',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular,',
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text('coinmarket.com',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff9DA2A7),
                                          fontFamily: 'InterRegular',
                                          fontWeight: FontWeight.normal)),
                                ],
                              ),
                              const Spacer(),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('+0.028029182 BTC',
                                      style: TextStyle(
                                          color: Color(0xff7DC066),
                                          fontSize: 14)),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('+\$219.78',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff9DA2A7),
                                          fontFamily: 'InterRegular')),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: const Color(0xffE6F9EF),
                                    borderRadius:
                                        BorderRadiusDirectional.circular(10)),
                                child: Center(
                                    child: Image.asset('assets/money-add.png',
                                        scale: 3.5)),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Buy Bitcoin',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular,',
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text('coinmarket.com',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff9DA2A7),
                                          fontFamily: 'InterRegular',
                                          fontWeight: FontWeight.normal)),
                                ],
                              ),
                              const Spacer(),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('+0.028029182 BTC',
                                      style: TextStyle(
                                          color: Color(0xff7DC066),
                                          fontSize: 14)),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('+\$219.78',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff9DA2A7),
                                          fontFamily: 'InterRegular')),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: const Color(0xffE6F9EF),
                                    borderRadius:
                                        BorderRadiusDirectional.circular(10)),
                                child: Center(
                                    child: Image.asset('assets/money-add.png',
                                        scale: 3.5)),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Buy Bitcoin',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular,',
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text('coinmarket.com',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff9DA2A7),
                                          fontFamily: 'InterRegular',
                                          fontWeight: FontWeight.normal)),
                                ],
                              ),
                              const Spacer(),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('+0.028029182 BTC',
                                      style: TextStyle(
                                          color: Color(0xff7DC066),
                                          fontSize: 14)),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('+\$219.78',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff9DA2A7),
                                          fontFamily: 'InterRegular')),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: const Color(0xffE6F9EF),
                                    borderRadius:
                                        BorderRadiusDirectional.circular(10)),
                                child: Center(
                                    child: Image.asset('assets/money-add.png',
                                        scale: 3.5)),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Buy Bitcoin',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: notifire.getblackcolor,
                                          fontFamily: 'InterRegular,',
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text('coinmarket.com',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff9DA2A7),
                                          fontFamily: 'InterRegular',
                                          fontWeight: FontWeight.normal)),
                                ],
                              ),
                              const Spacer(),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('+0.028029182 BTC',
                                      style: TextStyle(
                                          color: Color(0xff7DC066),
                                          fontSize: 14)),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('+\$219.78',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff9DA2A7),
                                          fontFamily: 'InterRegular')),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
        },
      );

  Widget Buysell(BuildContext context, size) => size < 600
      ? DefaultTabController(
          length: 2,
          initialIndex: 0,
          child: GetBuilder<InboxController>(
            builder: (controller) {
              return Container(
                height: Get.height * 0.65,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: notifire.getbgcolor11),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: Get.width,
                      height: 48,
                      decoration: BoxDecoration(
                        color: notifire.getbgcolor11,
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(10)),
                      ),
                      child: TabBar(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        indicatorColor: notifire.getblackcolor,
                        isScrollable: true,
                        tabs: <Widget>[
                          Tab(
                              child: Row(
                            children: [
                              Image.asset('assets/money-add.png',
                                  color: notifire.getblackcolor, scale: 3.5),
                              const SizedBox(
                                width: 5,
                              ),
                              Text('Buy',
                                  style: TextStyle(
                                      color: notifire.getblackcolor,
                                      fontFamily: 'InterRegular',
                                      fontSize: 14)),
                            ],
                          )),
                          Tab(
                              child: Row(
                            children: [
                              Image.asset('assets/money-add.png',
                                  color: notifire.getblackcolor, scale: 3.5),
                              const SizedBox(
                                width: 5,
                              ),
                              Text('Sell',
                                  style: TextStyle(
                                      color: notifire.getblackcolor,
                                      fontFamily: 'InterRegular',
                                      fontSize: 14)),
                            ],
                          )),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: TabBarView(
                          children: [
                            Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const Text('Coin',
                                              style: TextStyle(
                                                  color: Color(0xff898F96),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'InterRegular')),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                            height: 45,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                border: Border.all(
                                                    color: notifire.Getblg2)),
                                            child: Center(
                                              child: DropdownButton(
                                                isDense: true,
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(20)),
                                                dropdownColor:
                                                    const Color(0xff26282A),
                                                elevation: 0,
                                                value: dropdownvalue,
                                                icon: Transform.translate(
                                                  offset: const Offset(5, 0),
                                                  child: Icon(
                                                      Icons.keyboard_arrow_down,
                                                      color: grey2),
                                                ),
                                                underline: const SizedBox(),
                                                items:
                                                    list1.map((String items) {
                                                  return DropdownMenuItem(
                                                    value: items,
                                                    child: Center(
                                                      child: Container(
                                                        decoration:
                                                            const BoxDecoration(),
                                                        child: Center(
                                                          child: Text(items.tr,
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'InterRegular',
                                                                color: notifire
                                                                    .getblackcolor,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }).toList(),
                                                onChanged: (String? newValue) {
                                                  setState(() {
                                                    dropdownvalue = newValue!;
                                                  });
                                                },
                                              ),
                                            ),
                                          )
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
                                          const Text('Payment Method',
                                              style: TextStyle(
                                                  color: Color(0xff898F96),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'InterRegular')),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                            height: 45,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                border: Border.all(
                                                    color: notifire.Getblg2)),
                                            child: Center(
                                              child: DropdownButton(
                                                isDense: true,
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(20)),
                                                dropdownColor:
                                                    notifire.getbgcolor11,
                                                elevation: 0,
                                                value: dropdownvalue1,
                                                icon: Transform.translate(
                                                  offset: const Offset(5, 0),
                                                  child: Icon(
                                                      Icons.keyboard_arrow_down,
                                                      color: grey2),
                                                ),
                                                underline: const SizedBox(),
                                                items:
                                                    list2.map((String items) {
                                                  return DropdownMenuItem(
                                                    value: items,
                                                    child: Container(
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(items.tr,
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'InterRegular',
                                                                color: notifire
                                                                    .getblackcolor,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                }).toList(),
                                                onChanged: (String? newValue) {
                                                  setState(() {
                                                    dropdownvalue1 = newValue!;
                                                  });
                                                },
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Amount Coin',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff898F96),
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextField(
                                  style: TextStyle(
                                    color: notifire.getblackcolor,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: '0',
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 12, right: 12),
                                      child: Text('BTC',
                                          style: TextStyle(
                                              color: notifire.getblackcolor)),
                                    ),
                                    hintStyle: TextStyle(
                                        color: notifire.getblackcolor),
                                    contentPadding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                            color: notifire.Getblg2)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                            color: notifire.Getblg2)),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: blue),
                                      borderRadius: BorderRadius.circular(15),
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
                                      'Total',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff898F96),
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextField(
                                  style: TextStyle(
                                    color: notifire.getblackcolor,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: '0',
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 12, right: 12),
                                      child: Text('USD',
                                          style: TextStyle(
                                              color: notifire.getblackcolor)),
                                    ),
                                    hintStyle: TextStyle(
                                        color: notifire.getblackcolor),
                                    contentPadding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                            color: notifire.Getblg2)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                            color: notifire.Getblg2)),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: blue),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Text('Transaction Fees(0.05%)',
                                        style: TextStyle(
                                            color: notifire.getblackcolor,
                                            fontSize: 14,
                                            fontFamily: 'InterRegular')),
                                    const Spacer(),
                                    Text(
                                      '\$0',
                                      style: TextStyle(
                                        color: notifire.getblackcolor,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text('Minimum Received(2%)',
                                        style: TextStyle(
                                            color: notifire.getblackcolor,
                                            fontSize: 14,
                                            fontFamily: 'InterRegular')),
                                    const Spacer(),
                                    Text(
                                      '\$0',
                                      style: TextStyle(
                                        color: notifire.getblackcolor,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    height: 45,
                                    decoration: BoxDecoration(
                                        color: const Color(0xff595FE5),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: const Center(
                                        child: Text('Buy',
                                            style: TextStyle(
                                                color: Colors.white))),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const Text('Coin',
                                              style: TextStyle(
                                                  color: Color(0xff898F96),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'InterRegular')),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                            height: 45,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                border: Border.all(
                                                    color: notifire.Getblg2)),
                                            child: Center(
                                              child: DropdownButton(
                                                isDense: true,
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(20)),
                                                dropdownColor:
                                                    notifire.getbgcolor11,
                                                elevation: 0,
                                                value: dropdownvalue,
                                                icon: Transform.translate(
                                                  offset: const Offset(5, 0),
                                                  child: Icon(
                                                      Icons.keyboard_arrow_down,
                                                      color: grey2),
                                                ),
                                                underline: const SizedBox(),
                                                items:
                                                    list1.map((String items) {
                                                  return DropdownMenuItem(
                                                    value: items,
                                                    child: Center(
                                                      child: Container(
                                                        decoration:
                                                            const BoxDecoration(),
                                                        child: Center(
                                                          child: Text(items.tr,
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'InterRegular',
                                                                color: notifire
                                                                    .getblackcolor,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }).toList(),
                                                onChanged: (String? newValue) {
                                                  setState(() {
                                                    dropdownvalue = newValue!;
                                                  });
                                                },
                                              ),
                                            ),
                                          )
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
                                          const Text('Payment Method',
                                              style: TextStyle(
                                                  color: Color(0xff898F96),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'InterRegular')),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                            height: 45,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                border: Border.all(
                                                    color: notifire.Getblg2)),
                                            child: Center(
                                              child: DropdownButton(
                                                isDense: true,
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(20)),
                                                dropdownColor:
                                                    notifire.getbgcolor11,
                                                elevation: 0,
                                                value: dropdownvalue1,
                                                icon: Transform.translate(
                                                  offset: const Offset(5, 0),
                                                  child: Icon(
                                                      Icons.keyboard_arrow_down,
                                                      color: grey2),
                                                ),
                                                underline: const SizedBox(),
                                                items:
                                                    list2.map((String items) {
                                                  return DropdownMenuItem(
                                                    value: items,
                                                    child: Container(
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(items.tr,
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'InterRegular',
                                                                color: notifire
                                                                    .getblackcolor,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                }).toList(),
                                                onChanged: (String? newValue) {
                                                  setState(() {
                                                    dropdownvalue1 = newValue!;
                                                  });
                                                },
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Amount Coin',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff898F96),
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextField(
                                  style: TextStyle(
                                    color: notifire.getblackcolor,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: '0',
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 12, right: 12),
                                      child: Text('BTC',
                                          style: TextStyle(
                                              color: notifire.getblackcolor)),
                                    ),
                                    hintStyle: TextStyle(
                                        color: notifire.getblackcolor),
                                    contentPadding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                            color: notifire.Getblg2)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                            color: notifire.Getblg2)),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: blue),
                                      borderRadius: BorderRadius.circular(15),
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
                                      'Total',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff898F96),
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextField(
                                  style: TextStyle(
                                    color: notifire.getblackcolor,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: '0',
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 12, right: 12),
                                      child: Text('USD',
                                          style: TextStyle(
                                              color: notifire.getblackcolor)),
                                    ),
                                    hintStyle: TextStyle(
                                        color: notifire.getblackcolor),
                                    contentPadding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                            color: notifire.Getblg2)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                            color: notifire.Getblg2)),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: blue),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Text('Transaction Fees(0.05%)',
                                        style: TextStyle(
                                            color: notifire.getblackcolor,
                                            fontSize: 14,
                                            fontFamily: 'InterRegular')),
                                    const Spacer(),
                                    Text(
                                      '\$0',
                                      style: TextStyle(
                                        color: notifire.getblackcolor,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text('Minimum Received(2%)',
                                        style: TextStyle(
                                            color: notifire.getblackcolor,
                                            fontSize: 14,
                                            fontFamily: 'InterRegular')),
                                    const Spacer(),
                                    Text(
                                      '\$0',
                                      style: TextStyle(
                                        color: notifire.getblackcolor,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    height: 45,
                                    decoration: BoxDecoration(
                                        color: const Color(0xff595FE5),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: const Center(
                                        child: Text('Buy',
                                            style: TextStyle(
                                                color: Colors.white))),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        )
      : DefaultTabController(
          length: 2,
          initialIndex: 0,
          child: GetBuilder<InboxController>(
            builder: (controller) {
              return Container(
                height: size < 1500
                    ? Get.height * 0.595
                    : size > 1500
                        ? Get.height * 0.61
                        : null,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: notifire.getbgcolor11,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: Get.width,
                      height: 48,
                      decoration: BoxDecoration(
                        color: notifire.getbgcolor11,
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(15)),
                      ),
                      child: TabBar(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        indicatorColor: notifire.getblackcolor,
                        isScrollable: true,
                        tabs: <Widget>[
                          Tab(
                              child: Row(
                            children: [
                              Image.asset('assets/money-add.png',
                                  color: notifire.getblackcolor, scale: 3.5),
                              const SizedBox(
                                width: 5,
                              ),
                              Text('Buy',
                                  style: TextStyle(
                                      fontFamily: 'InterRegular',
                                      color: notifire.getblackcolor,
                                      fontSize: 14)),
                            ],
                          )),
                          Tab(
                              child: Row(
                            children: [
                              Image.asset('assets/money-add.png',
                                  color: notifire.getblackcolor, scale: 3.5),
                              const SizedBox(
                                width: 5,
                              ),
                              Text('Sell',
                                  style: TextStyle(
                                      color: notifire.getblackcolor,
                                      fontFamily: 'InterRegular',
                                      fontSize: 14)),
                            ],
                          )),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TabBarView(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Text('Coin',
                                            style: TextStyle(
                                                color: Color(0xff898F96),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'InterRegular')),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          width: 160,
                                          height: 45,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: notifire.getbgcolor10,
                                          ),
                                          child: Center(
                                            child: DropdownButton(
                                              isDense: true,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(20)),
                                              dropdownColor:
                                                  notifire.getbgcolor11,
                                              elevation: 0,
                                              value: dropdownvalue,
                                              icon: Transform.translate(
                                                offset: const Offset(5, 0),
                                                child: Icon(
                                                  Icons.keyboard_arrow_down,
                                                  color: notifire.getblackcolor,
                                                ),
                                              ),
                                              underline: const SizedBox(),
                                              items: list1.map((String items) {
                                                return DropdownMenuItem(
                                                  value: items,
                                                  child: Center(
                                                    child: Container(
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: Center(
                                                        child: Text(items.tr,
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'InterRegular',
                                                              color: notifire
                                                                  .getblackcolor,
                                                            ),
                                                            textAlign: TextAlign
                                                                .start),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }).toList(),
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  dropdownvalue = newValue!;
                                                });
                                              },
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Text('Payment Method',
                                            style: TextStyle(
                                                color: Color(0xff898F96),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'InterRegular')),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          width: 160,
                                          height: 45,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: notifire.getbgcolor10,
                                          ),
                                          child: Center(
                                            child: DropdownButton(
                                              isDense: true,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(20)),
                                              dropdownColor:
                                                  notifire.getbgcolor11,
                                              elevation: 0,
                                              value: dropdownvalue1,
                                              icon: Transform.translate(
                                                offset: const Offset(5, 0),
                                                child: Icon(
                                                  Icons.keyboard_arrow_down,
                                                  color: notifire.getblackcolor,
                                                ),
                                              ),
                                              underline: const SizedBox(),
                                              items: list2.map((String items) {
                                                return DropdownMenuItem(
                                                  value: items,
                                                  child: Container(
                                                    decoration:
                                                        const BoxDecoration(),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(items.tr,
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'InterRegular',
                                                              color: notifire
                                                                  .getblackcolor,
                                                            ),
                                                            textAlign: TextAlign
                                                                .start),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              }).toList(),
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  dropdownvalue1 = newValue!;
                                                });
                                              },
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Amount Coin',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff898F96),
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: notifire.getbgcolor10,
                                  ),
                                  child: TextField(
                                    style: TextStyle(
                                      color: notifire.getblackcolor,
                                    ),
                                    decoration: InputDecoration(
                                      hintText: '0',
                                      suffixIcon: const Padding(
                                        padding:
                                            EdgeInsets.only(top: 12, right: 12),
                                        child: Text('BTC',
                                            style: TextStyle(
                                                color: Color(0xff2E3133))),
                                      ),
                                      hintStyle: const TextStyle(
                                          color: Color(0xff2E3133)),
                                      contentPadding: const EdgeInsets.only(
                                          left: 20, right: 20),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide: BorderSide(color: grey2)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: blue),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Total',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff898F96),
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: notifire.getbgcolor10,
                                  ),
                                  child: TextField(
                                    style: TextStyle(
                                      color: notifire.getblackcolor,
                                    ),
                                    decoration: InputDecoration(
                                      hintText: '0',
                                      suffixIcon: const Padding(
                                        padding:
                                            EdgeInsets.only(top: 12, right: 12),
                                        child: Text('USD',
                                            style: TextStyle(
                                                color: Color(0xff2E3133))),
                                      ),
                                      hintStyle: const TextStyle(
                                          color: Color(0xff2E3133)),
                                      contentPadding: const EdgeInsets.only(
                                          left: 20, right: 20),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide: BorderSide(color: grey2)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: blue),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Text('Transaction Fees(0.05%)',
                                        style: TextStyle(
                                            color: notifire.getblackcolor,
                                            fontSize: 14,
                                            fontFamily: 'InterRegular')),
                                    const Spacer(),
                                    Text(
                                      '\$0',
                                      style: TextStyle(
                                        color: notifire.getblackcolor,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text('Minimum Received(2%)',
                                        style: TextStyle(
                                            color: notifire.getblackcolor,
                                            fontSize: 14,
                                            fontFamily: 'InterRegular')),
                                    const Spacer(),
                                    Text(
                                      '\$0',
                                      style: TextStyle(
                                        color: notifire.getblackcolor,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    height: 45,
                                    decoration: BoxDecoration(
                                        color: const Color(0xff595FE5),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: const Center(
                                        child: Text('Buy',
                                            style: TextStyle(
                                                color: Colors.white))),
                                  ),
                                ),
                                const Text('')
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Text('Coin',
                                            style: TextStyle(
                                                color: Color(0xff898F96),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'InterRegular')),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          width: 160,
                                          height: 45,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: notifire.getbgcolor10,
                                          ),
                                          child: Center(
                                            child: DropdownButton(
                                              isDense: true,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(20)),
                                              dropdownColor:
                                                  notifire.getbgcolor11,
                                              elevation: 0,
                                              value: dropdownvalue,
                                              icon: Transform.translate(
                                                offset: const Offset(5, 0),
                                                child: Icon(
                                                  Icons.keyboard_arrow_down,
                                                  color: notifire.getblackcolor,
                                                ),
                                              ),
                                              underline: const SizedBox(),
                                              items: list1.map((String items) {
                                                return DropdownMenuItem(
                                                  value: items,
                                                  child: Center(
                                                    child: Container(
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: Center(
                                                        child: Text(items.tr,
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'InterRegular',
                                                              color: notifire
                                                                  .getblackcolor,
                                                            ),
                                                            textAlign: TextAlign
                                                                .start),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }).toList(),
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  dropdownvalue = newValue!;
                                                });
                                              },
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Text('Payment Method',
                                            style: TextStyle(
                                                color: Color(0xff898F96),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'InterRegular')),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          width: 160,
                                          height: 45,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: notifire.getbgcolor10,
                                          ),
                                          child: Center(
                                            child: DropdownButton(
                                              isDense: true,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(20)),
                                              dropdownColor:
                                                  notifire.getbgcolor11,
                                              elevation: 0,
                                              value: dropdownvalue1,
                                              icon: Transform.translate(
                                                offset: const Offset(5, 0),
                                                child: Icon(
                                                  Icons.keyboard_arrow_down,
                                                  color: notifire.getblackcolor,
                                                ),
                                              ),
                                              underline: const SizedBox(),
                                              items: list2.map((String items) {
                                                return DropdownMenuItem(
                                                  value: items,
                                                  child: Container(
                                                    decoration:
                                                        const BoxDecoration(),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(items.tr,
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'InterRegular',
                                                              color: notifire
                                                                  .getblackcolor,
                                                            ),
                                                            textAlign: TextAlign
                                                                .start),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              }).toList(),
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  dropdownvalue1 = newValue!;
                                                });
                                              },
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Amount Coin',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff898F96),
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: notifire.getbgcolor10,
                                  ),
                                  child: TextField(
                                    style: TextStyle(
                                      color: notifire.getblackcolor,
                                    ),
                                    decoration: InputDecoration(
                                      hintText: '0',
                                      suffixIcon: const Padding(
                                        padding:
                                            EdgeInsets.only(top: 12, right: 12),
                                        child: Text('BTC',
                                            style: TextStyle(
                                                color: Color(0xff2E3133))),
                                      ),
                                      hintStyle: const TextStyle(
                                          color: Color(0xff2E3133)),
                                      contentPadding: const EdgeInsets.only(
                                          left: 20, right: 20),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide: BorderSide(color: grey2)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: blue),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Total',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff898F96),
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'InterRegular'),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: notifire.getbgcolor10,
                                  ),
                                  child: TextField(
                                    style: TextStyle(
                                      color: notifire.getblackcolor,
                                    ),
                                    decoration: InputDecoration(
                                      hintText: '0',
                                      suffixIcon: const Padding(
                                        padding:
                                            EdgeInsets.only(top: 12, right: 12),
                                        child: Text('USD',
                                            style: TextStyle(
                                                color: Color(0xff2E3133))),
                                      ),
                                      hintStyle: const TextStyle(
                                          color: Color(0xff2E3133)),
                                      contentPadding: const EdgeInsets.only(
                                          left: 20, right: 20),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          borderSide: BorderSide(color: grey2)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: blue),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Row(
                                  children: [
                                    Text('Transaction Fees(0.05%)',
                                        style: TextStyle(
                                            color: Color(0xff55585A),
                                            fontSize: 14,
                                            fontFamily: 'InterRegular')),
                                    Spacer(),
                                    Text(
                                      '\$0',
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Row(
                                  children: [
                                    Text('Minimum Received(2%)',
                                        style: TextStyle(
                                            color: Color(0xff55585A),
                                            fontSize: 14,
                                            fontFamily: 'InterRegular')),
                                    Spacer(),
                                    Text(
                                      '\$0',
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    height: 45,
                                    decoration: BoxDecoration(
                                        color: const Color(0xff595FE5),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: const Center(
                                        child: Text('Buy',
                                            style: TextStyle(
                                                color: Colors.white))),
                                  ),
                                ),
                                const Text('')
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );

  Widget Market(BuildContext context, size) {
    return GetBuilder<InboxController>(
      builder: (controller) {
        return size < 600
            ? Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: notifire.getbgcolor11,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Market Graph',
                          style: TextStyle(
                            fontSize: 16,
                            color: notifire.getblackcolor,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'InterRegular',
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadiusDirectional.circular(15),
                              color: notifire.getbgcolor10),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(
                                    width: 1,
                                  ),
                                  TextButton(
                                    style: const ButtonStyle(
                                        shape: MaterialStatePropertyAll(
                                            RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(15),
                                                    topLeft:
                                                        Radius.circular(15))))),
                                    child: Text(
                                      '24 hours',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: notifire.getblackcolor,
                                      ),
                                    ),
                                    onPressed: () {},
                                  ),
                                  Container(
                                    height: 48,
                                    width: 1,
                                    decoration: BoxDecoration(
                                      color: notifire.getgrey1,
                                    ),
                                  ),
                                  TextButton(
                                    style: const ButtonStyle(),
                                    child: Text(
                                      '7 days',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: notifire.getblackcolor,
                                      ),
                                    ),
                                    onPressed: () {},
                                  ),
                                  Container(
                                    height: 48,
                                    width: 1,
                                    decoration: BoxDecoration(
                                      color: notifire.getgrey1,
                                    ),
                                  ),
                                  TextButton(
                                    style: const ButtonStyle(),
                                    child: Text(
                                      '1 month',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: notifire.getblackcolor,
                                      ),
                                    ),
                                    onPressed: () {},
                                  ),
                                  Container(
                                    height: 48,
                                    width: 1,
                                    decoration: BoxDecoration(
                                      color: notifire.getgrey1,
                                    ),
                                  ),
                                  TextButton(
                                    style: const ButtonStyle(
                                        shape: MaterialStatePropertyAll(
                                            RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(15),
                                                    bottomRight:
                                                        Radius.circular(15))))),
                                    child: Text(
                                      '1 year',
                                      style: TextStyle(
                                        color: notifire.getblackcolor,
                                        fontSize: 12,
                                      ),
                                    ),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // Center(
                    //   child: SizedBox(
                    //     height: Get.height * 0.42,
                    //     child: SfCartesianChart(
                    //       primaryXAxis: DateTimeAxis(
                    //         majorGridLines: MajorGridLines(width: 2),
                    //         majorTickLines: MajorTickLines(width: 2),
                    //         isVisible: true,
                    //       ),
                    //       series: [
                    //         CandleSeries(
                    //           dataSource: chartData,
                    //           xValueMapper: (datum, index) => datum.x,
                    //           lowValueMapper: (datum, index) => datum.low,
                    //           highValueMapper: (datum, index) => datum.high,
                    //           openValueMapper: (datum, index) => datum.open,
                    //           closeValueMapper: (datum, index) => datum.close,
                    //           name: 'Sales',
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              )
            : Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: notifire.getbgcolor11,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Market Graph',
                            style: TextStyle(
                              fontSize: 16,
                              color: notifire.getblackcolor,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'InterRegular',
                            ),
                          ),
                          const Spacer(),
                          Container(
                            height: 32,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadiusDirectional.circular(15),
                              color: notifire.getbgcolor10,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 1,
                                    ),
                                    TextButton(
                                      style: const ButtonStyle(
                                          shape: MaterialStatePropertyAll(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  15),
                                                          topLeft:
                                                              Radius.circular(
                                                                  15))))),
                                      child: Text(
                                        '24 hours',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: notifire.getblackcolor,
                                        ),
                                      ),
                                      onPressed: () {},
                                    ),
                                    Container(
                                      height: 30,
                                      width: 1,
                                      decoration: BoxDecoration(
                                        color: notifire.getgrey1,
                                      ),
                                    ),
                                    TextButton(
                                      style: const ButtonStyle(),
                                      child: Text(
                                        '7 days',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: notifire.getblackcolor,
                                        ),
                                      ),
                                      onPressed: () {},
                                    ),
                                    Container(
                                      height: 30,
                                      width: 1,
                                      decoration: BoxDecoration(
                                        color: notifire.getgrey1,
                                      ),
                                    ),
                                    TextButton(
                                      style: const ButtonStyle(),
                                      child: Text(
                                        '1 month',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: notifire.getblackcolor,
                                        ),
                                      ),
                                      onPressed: () {},
                                    ),
                                    Container(
                                      height: 30,
                                      width: 1,
                                      decoration: BoxDecoration(
                                        color: notifire.getgrey1,
                                      ),
                                    ),
                                    TextButton(
                                      style: const ButtonStyle(
                                          shape: MaterialStatePropertyAll(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topRight:
                                                              Radius.circular(
                                                                  15),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  15))))),
                                      child: Text(
                                        '1 year',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: notifire.getblackcolor,
                                        ),
                                      ),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // Center(
                      //   child: SfCartesianChart(
                      //     primaryXAxis:  DateTimeAxis(
                      //       majorGridLines: MajorGridLines(width: 2),
                      //       majorTickLines: MajorTickLines(width: 2),
                      //       isVisible: true,
                      //     ),
                      //     series: [
                      //       CandleSeries(
                      //         dataSource: chartData,
                      //         xValueMapper: (datum, index) => datum.x,
                      //         lowValueMapper: (datum, index) => datum.low,
                      //         highValueMapper: (datum, index) => datum.high,
                      //         openValueMapper: (datum, index) => datum.open,
                      //         closeValueMapper: (datum, index) => datum.close,
                      //         name: 'Sales',
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
              );
      },
    );
  }

  Widget list(BuildContext context, size) {
    return size < 600
        ? SizedBox(
            height: Get.height * 0.3,
            width: Get.width,
            child: Stack(
              children: [
                ListView.builder(
                  controller: pg,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: model().list1.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                          color: notifire.getbgcolor11,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            model().list[index],
                            height: 40,
                            width: 40,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(model().list1[index],
                              style: TextStyle(
                                  fontSize: 14,
                                  color: notifire.getblackcolor,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'InterRegular')),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            model().list2[index],
                            style: TextStyle(
                                fontSize: 18,
                                color: notifire.getblackcolor,
                                fontFamily: 'InterRegular',
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                model().list3[index],
                                style: TextStyle(color: model().colors[index]),
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              Image.asset(
                                model().list5[index],
                                height: 15,
                                width: 15,
                                color: model().colors[index],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Image.asset(
                            model().list4[index],
                            color: notifire.getblackcolor,
                            scale: 4,
                          )
                        ],
                      ),
                    );
                  },
                ),
                Positioned(
                  right: 15,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        pg.animateTo(double.parse("${a}00"),
                            curve: const FlippedCurve(Easing.legacy),
                            duration: const Duration(seconds: 2));
                        setState(() {
                          a = a - 15;
                        });
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: notifire.getbgcolor10,
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: Center(
                            child: Image.asset(
                          'assets/arrow-right-small.png',
                          scale: 4,
                          color: const Color(0xff727880),
                        )),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 15,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        pg.animateTo(double.parse("${a}00"),
                            curve: const FlippedCurve(Easing.legacy),
                            duration: const Duration(seconds: 2));
                        setState(() {
                          a = a + 15;
                        });
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: notifire.getbgcolor10,
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: Center(
                            child: Image.asset(
                          'assets/arrow-left-small.png',
                          scale: 4,
                          color: const Color(0xff727880),
                        )),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        : SizedBox(
            height: Get.height * 0.335,
            width: Get.width,
            child: Stack(
              children: [
                ListView.builder(
                  controller: pg,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: model().list1.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                          color: notifire.getbgcolor11,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            model().list[index],
                            height: 40,
                            width: 40,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(model().list1[index],
                              style: TextStyle(
                                  fontSize: 14,
                                  color: notifire.getblackcolor,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'InterRegular')),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            model().list2[index],
                            style: TextStyle(
                                fontSize: 18,
                                color: notifire.getblackcolor,
                                fontFamily: 'InterRegular',
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                model().list3[index],
                                style: TextStyle(color: model().colors[index]),
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              Image.asset(
                                model().list5[index],
                                height: 15,
                                width: 15,
                                color: model().colors[index],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Image.asset(
                            model().list4[index],
                            scale: 4,
                            color: notifire.getblackcolor,
                          )
                        ],
                      ),
                    );
                  },
                ),
                Positioned(
                  right: 15,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        pg.animateTo(double.parse("${a}00"),
                            curve: const FlippedCurve(Easing.legacy),
                            duration: const Duration(seconds: 2));
                        setState(() {
                          a = a - 15;
                        });
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: Center(
                            child: Image.asset(
                          'assets/arrow-right-small.png',
                          scale: 4,
                          color: const Color(0xff727880),
                        )),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 15,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        pg.animateTo(double.parse("${a}00"),
                            curve: const FlippedCurve(Easing.legacy),
                            duration: const Duration(seconds: 2));
                        setState(() {
                          a = a + 15;
                        });
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: Center(
                            child: Image.asset(
                          'assets/arrow-left-small.png',
                          scale: 4,
                          color: const Color(0xff727880),
                        )),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }

  Widget table(BuildContext context, size, constraints) {
    return GetBuilder<InboxController>(
      builder: (controller) {
        return Container(
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Transform.translate(
                  offset: const Offset(8, 0),
                  child: Row(
                    children: [
                      Text(
                        'My Portfolio',
                        style: TextStyle(
                            fontSize: 16,
                            color: notifire.getblackcolor,
                            fontFamily: 'InterRegular',
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: constraints.maxWidth < 1400 ? 1500 : Get.width,
                  child: Table(
                    border: TableBorder.all(color: Colors.transparent),
                    columnWidths: const <int, TableColumnWidth>{
                      0: FixedColumnWidth(200),
                      1: FixedColumnWidth(200),
                      2: FixedColumnWidth(200),
                      3: FixedColumnWidth(200),
                      4: FixedColumnWidth(200),
                      5: FixedColumnWidth(160),
                    },
                    children: <TableRow>[
                      TableRow(
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text('Coin',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'InterRegular',
                                    color: Color(0xff9DA2A7))),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Text('Price',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'InterRegular',
                                    color: Color(0xff9DA2A7))),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Text('Market Cap',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'InterRegular',
                                    color: Color(0xff9DA2A7))),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Text('Total Coin',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'InterRegular',
                                    color: Color(0xff9DA2A7))),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Row(
                              children: [
                                const Text('1h',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'InterRegular',
                                        color: Color(0xff9DA2A7))),
                                Image.asset(
                                  'assets/arrow-up.png',
                                  scale: 3.5,
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Row(
                              children: [
                                const Text('24h',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'InterRegular',
                                        color: Color(0xff9DA2A7))),
                                Image.asset(
                                  'assets/arrow-up.png',
                                  scale: 3.5,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 15, left: 3),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 5,
                                ),
                                Image.asset(
                                  AppContent.Bitcoin,
                                  height: 30,
                                  width: 30,
                                  // scale: 4.5,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Bitcoin (BTC)',
                                  style: TextStyle(
                                    fontFamily: 'InterRegular',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: notifire.getblackcolor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 20, left: 3),
                              child: Text(
                                '\$372.83',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: notifire.getblackcolor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'InterRegular'),
                              )),
                          Padding(
                              padding: const EdgeInsets.only(top: 20, left: 8),
                              child: Text(
                                '\$12,500M',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: notifire.getblackcolor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'InterRegular'),
                              )),
                          Padding(
                              padding: const EdgeInsets.only(top: 20, left: 8),
                              child: Text(
                                '\$11,345,672',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: notifire.getblackcolor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'InterRegular'),
                              )),
                          Padding(
                            padding: const EdgeInsets.only(left: 5, top: 20),
                            child: Row(
                              children: [
                                const Text(
                                  '\$-2.44%',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xffE5646C),
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'InterRegular'),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Image.asset(
                                  'assets/trend-up.png',
                                  scale: 3.5,
                                  color: const Color(0xffE5646C),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20, left: 8),
                            child: Row(
                              children: [
                                const Text(
                                  '\$-2.80%',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xffE5646C),
                                      fontFamily: 'InterRegular'),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Image.asset(
                                  'assets/trend-up.png',
                                  scale: 3.5,
                                  color: const Color(0xffE5646C),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      dividerTable(context, size),
                      TableRow(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 15, left: 3),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 5,
                                ),
                                Image.asset(
                                  AppContent.Ethereum,
                                  height: 30,
                                  width: 30,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Ethereum (ETH)',
                                  style: TextStyle(
                                    fontFamily: 'InterRegular',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: notifire.getblackcolor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 20, left: 3),
                              child: Text(
                                '\$982.83',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: notifire.getblackcolor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'InterRegular'),
                              )),
                          Padding(
                              padding: const EdgeInsets.only(top: 20, left: 8),
                              child: Text(
                                '\$23,555B',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: notifire.getblackcolor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'InterRegular'),
                              )),
                          Padding(
                              padding: const EdgeInsets.only(top: 20, left: 8),
                              child: Text(
                                '\$44,559,77',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: notifire.getblackcolor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'InterRegular'),
                              )),
                          Padding(
                              padding: const EdgeInsets.only(top: 20, left: 8),
                              child: Row(
                                children: [
                                  const Text(
                                    '\$+3.66%',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff7DC066),
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'InterRegular'),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Image.asset(
                                    'assets/trend-up.png',
                                    scale: 3.5,
                                    color: const Color(0xff7DC066),
                                  )
                                ],
                              )),
                          Padding(
                            padding: const EdgeInsets.only(top: 20, left: 8),
                            child: Row(
                              children: [
                                const Text(
                                  '\$-3.55%',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'InterRegular',
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff7DC066)),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Image.asset(
                                  'assets/trend-up.png',
                                  scale: 3.5,
                                  color: const Color(0xff7DC066),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      dividerTable(context, size),
                      TableRow(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 15, left: 3),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 5,
                                ),
                                Image.asset(
                                  AppContent.Dash,
                                  height: 30,
                                  width: 30,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Dash (DASH)',
                                  style: TextStyle(
                                    fontFamily: 'InterRegular',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: notifire.getblackcolor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 20, left: 3),
                              child: Text(
                                '\$472.83',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: notifire.getblackcolor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'InterRegular'),
                              )),
                          Padding(
                              padding: const EdgeInsets.only(top: 20, left: 8),
                              child: Text(
                                '\$12.333M',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: notifire.getblackcolor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'InterRegular'),
                              )),
                          Padding(
                              padding: const EdgeInsets.only(top: 20, left: 8),
                              child: Text(
                                '\$22,334,444',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: notifire.getblackcolor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'InterRegular'),
                              )),
                          Padding(
                            padding: const EdgeInsets.only(top: 20, left: 8),
                            child: Row(
                              children: [
                                const Text(
                                  '\$-4.55%',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xffE5646C),
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'InterRegular'),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Image.asset(
                                  'assets/trend-up.png',
                                  scale: 3.5,
                                  color: const Color(0xffE5646C),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20, left: 8),
                            child: Row(
                              children: [
                                const Text(
                                  '\$+2.44%',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'InterRegular',
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff7DC066)),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Image.asset(
                                  'assets/trend-up.png',
                                  scale: 3.5,
                                  color: const Color(0xff7DC066),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      dividerTable(context, size),
                      TableRow(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 15, left: 3),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 5,
                                ),
                                Image.asset(
                                  AppContent.Cronos,
                                  height: 30,
                                  width: 30,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Cronos',
                                  style: TextStyle(
                                    fontFamily: 'InterRegular',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: notifire.getblackcolor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 20, left: 3),
                              child: Text(
                                '\$392.83',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: notifire.getblackcolor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'InterRegular'),
                              )),
                          Padding(
                              padding: const EdgeInsets.only(top: 20, left: 8),
                              child: Text(
                                '\$34,283',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: notifire.getblackcolor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'InterRegular'),
                              )),
                          Padding(
                              padding: const EdgeInsets.only(top: 20, left: 8),
                              child: Text(
                                '\$12,334,678',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: notifire.getblackcolor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'InterRegular'),
                              )),
                          Padding(
                              padding: const EdgeInsets.only(top: 20, left: 8),
                              child: Row(
                                children: [
                                  const Text(
                                    '\$+3.83%',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff7DC066),
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'InterRegular'),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Image.asset(
                                    'assets/trend-up.png',
                                    scale: 3.5,
                                    color: const Color(0xff7DC066),
                                  )
                                ],
                              )),
                          Padding(
                            padding: const EdgeInsets.only(top: 20, left: 8),
                            child: Row(
                              children: [
                                const Text(
                                  '\$+2.01%',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'InterRegular',
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff7DC066)),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Image.asset(
                                  'assets/trend-up.png',
                                  scale: 3.5,
                                  color: const Color(0xff7DC066),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      dividerTable(context, size),
                      TableRow(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 15, left: 3),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 5,
                                ),
                                Image.asset(
                                  AppContent.Litecoin,
                                  height: 30,
                                  width: 30,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Litecoin (LTC)',
                                  style: TextStyle(
                                    fontFamily: 'InterRegular',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: notifire.getblackcolor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 20, left: 3),
                              child: Text(
                                '\$882.83',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: notifire.getblackcolor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'InterRegular'),
                              )),
                          Padding(
                              padding: const EdgeInsets.only(top: 20, left: 8),
                              child: Text(
                                '\$32,873',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: notifire.getblackcolor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'InterRegular'),
                              )),
                          Padding(
                              padding: const EdgeInsets.only(top: 20, left: 8),
                              child: Text(
                                '\$33,777',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: notifire.getblackcolor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'InterRegular'),
                              )),
                          Padding(
                              padding: const EdgeInsets.only(top: 20, left: 8),
                              child: Row(
                                children: [
                                  const Text(
                                    '\$-6.83%',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xffE5646C),
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'InterRegular'),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Image.asset(
                                    'assets/trend-up.png',
                                    scale: 3.5,
                                    color: const Color(0xffE5646C),
                                  )
                                ],
                              )),
                          Padding(
                            padding: const EdgeInsets.only(top: 20, left: 8),
                            child: Row(
                              children: [
                                const Text(
                                  '\$-3.01%',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xffE5646C),
                                      fontFamily: 'InterRegular'),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Image.asset(
                                  'assets/trend-up.png',
                                  scale: 3.5,
                                  color: const Color(0xffE5646C),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      dividerTable(context, size),
                      TableRow(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 15, left: 3),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 5,
                                ),
                                Image.asset(
                                  AppContent.Dogecoin,
                                  height: 30,
                                  width: 30,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Dogcoin',
                                  style: TextStyle(
                                    fontFamily: 'InterRegular',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: notifire.getblackcolor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 20, left: 3),
                              child: Text(
                                '\$172.83',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: notifire.getblackcolor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'InterRegular'),
                              )),
                          Padding(
                            padding: const EdgeInsets.only(top: 20, left: 8),
                            child: Text(
                              '\$22,455M',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'InterRegular',
                                  color: notifire.getblackcolor,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 20, left: 8),
                              child: Text(
                                '\$23,44,556',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: notifire.getblackcolor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'InterRegular'),
                              )),
                          Padding(
                              padding: const EdgeInsets.only(top: 20, left: 8),
                              child: Row(
                                children: [
                                  const Text(
                                    '\$2.83%',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff7DC066),
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'InterRegular'),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Image.asset(
                                    'assets/trend-up.png',
                                    scale: 3.5,
                                    color: const Color(0xff7DC066),
                                  )
                                ],
                              )),
                          Padding(
                            padding: const EdgeInsets.only(top: 20, left: 8),
                            child: Row(
                              children: [
                                const Text(
                                  '\$+2.55%',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'InterRegular',
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff7DC066)),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Image.asset(
                                  'assets/trend-up.png',
                                  scale: 3.5,
                                  color: const Color(0xff7DC066),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      dividerTable(context, size),
                      TableRow(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 15, left: 3),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 5,
                                ),
                                Image.asset(
                                  AppContent.Shiba,
                                  height: 30,
                                  width: 30,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Shiba Inu (SHIB)',
                                  style: TextStyle(
                                    fontFamily: 'InterRegular',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: notifire.getblackcolor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 20, left: 3),
                              child: Text(
                                '\$762.83',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: notifire.getblackcolor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'InterRegular'),
                              )),
                          Padding(
                              padding: const EdgeInsets.only(top: 20, left: 8),
                              child: Text(
                                '\$32,783B',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: notifire.getblackcolor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'InterRegular'),
                              )),
                          Padding(
                              padding: const EdgeInsets.only(top: 20, left: 8),
                              child: Text(
                                '\$66,777',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: notifire.getblackcolor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'InterRegular'),
                              )),
                          Padding(
                              padding: const EdgeInsets.only(top: 20, left: 8),
                              child: Row(
                                children: [
                                  const Text(
                                    '\$-2.83%',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xffE5646C),
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'InterRegular'),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Image.asset(
                                    'assets/trend-up.png',
                                    scale: 3.5,
                                    color: const Color(0xffE5646C),
                                  )
                                ],
                              )),
                          Padding(
                            padding: const EdgeInsets.only(top: 20, left: 8),
                            child: Row(
                              children: [
                                const Text(
                                  '\$-2.01%',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'InterRegular',
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xffE5646C)),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Image.asset(
                                  'assets/trend-up.png',
                                  scale: 3.5,
                                  color: const Color(0xffE5646C),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      dividerTable(context, size),
                      TableRow(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 15, left: 3),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 5,
                                ),
                                Image.asset(
                                  AppContent.BNB,
                                  height: 30,
                                  width: 30,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'BNB',
                                  style: TextStyle(
                                    fontFamily: 'InterRegular',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: notifire.getblackcolor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 20, left: 3),
                              child: Text(
                                '\$572.83',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: notifire.getblackcolor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'InterRegular'),
                              )),
                          Padding(
                              padding: const EdgeInsets.only(top: 20, left: 8),
                              child: Text(
                                '\$2,983',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: notifire.getblackcolor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'InterRegular'),
                              )),
                          Padding(
                              padding: const EdgeInsets.only(top: 20, left: 8),
                              child: Text(
                                '\$1,33,445',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: notifire.getblackcolor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'InterRegular'),
                              )),
                          Padding(
                              padding: const EdgeInsets.only(top: 20, left: 8),
                              child: Row(
                                children: [
                                  const Text(
                                    '\$+1.33%',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff7DC066),
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'InterRegular'),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Image.asset(
                                    'assets/trend-up.png',
                                    scale: 3.5,
                                    color: const Color(0xff7DC066),
                                  )
                                ],
                              )),
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, left: 8),
                                child: Row(
                                  children: [
                                    const Text(
                                      '\$+2.01%',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'InterRegular',
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff7DC066)),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Image.asset(
                                      'assets/trend-up.png',
                                      scale: 3.5,
                                      color: const Color(0xff7DC066),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      dividerTable(context, size),
                      TableRow(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 15, left: 3),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 5,
                                ),
                                Image.asset(
                                  AppContent.Cronos,
                                  height: 30,
                                  width: 30,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Cronos',
                                  style: TextStyle(
                                    fontFamily: 'InterRegular',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: notifire.getblackcolor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 20, left: 3),
                              child: Text(
                                '\$392.83',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: notifire.getblackcolor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'InterRegular'),
                              )),
                          Padding(
                              padding: const EdgeInsets.only(top: 20, left: 8),
                              child: Text(
                                '\$34,283',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: notifire.getblackcolor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'InterRegular'),
                              )),
                          Padding(
                              padding: const EdgeInsets.only(top: 20, left: 8),
                              child: Text(
                                '\$12,334,678',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: notifire.getblackcolor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'InterRegular'),
                              )),
                          Padding(
                              padding: const EdgeInsets.only(top: 20, left: 8),
                              child: Row(
                                children: [
                                  const Text(
                                    '\$+3.83%',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff7DC066),
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'InterRegular'),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Image.asset(
                                    'assets/trend-up.png',
                                    scale: 3.5,
                                    color: const Color(0xff7DC066),
                                  )
                                ],
                              )),
                          Padding(
                            padding: const EdgeInsets.only(top: 20, left: 8),
                            child: Row(
                              children: [
                                const Text(
                                  '\$+2.01%',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'InterRegular',
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff7DC066)),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Image.asset(
                                  'assets/trend-up.png',
                                  scale: 3.5,
                                  color: const Color(0xff7DC066),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      dividerTable(context, size),
                      TableRow(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 15, left: 3),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 5,
                                ),
                                Image.asset(
                                  AppContent.Litecoin,
                                  height: 30,
                                  width: 30,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Litecoin (LTC)',
                                  style: TextStyle(
                                    fontFamily: 'InterRegular',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: notifire.getblackcolor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 20, left: 3),
                              child: Text(
                                '\$882.83',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: notifire.getblackcolor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'InterRegular'),
                              )),
                          Padding(
                              padding: const EdgeInsets.only(top: 20, left: 8),
                              child: Text(
                                '\$32,873',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: notifire.getblackcolor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'InterRegular'),
                              )),
                          Padding(
                              padding: const EdgeInsets.only(top: 20, left: 8),
                              child: Text(
                                '\$33,777',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: notifire.getblackcolor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'InterRegular'),
                              )),
                          Padding(
                              padding: const EdgeInsets.only(top: 20, left: 8),
                              child: Row(
                                children: [
                                  const Text(
                                    '\$-6.83%',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xffE5646C),
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'InterRegular'),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Image.asset(
                                    'assets/trend-up.png',
                                    scale: 3.5,
                                    color: const Color(0xffE5646C),
                                  )
                                ],
                              )),
                          Padding(
                            padding: const EdgeInsets.only(top: 20, left: 8),
                            child: Row(
                              children: [
                                const Text(
                                  '\$-3.01%',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xffE5646C),
                                      fontFamily: 'InterRegular'),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Image.asset(
                                  'assets/trend-up.png',
                                  scale: 3.5,
                                  color: const Color(0xffE5646C),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      dividerTable(context, size),
                      TableRow(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 15, left: 3),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 5,
                                ),
                                Image.asset(
                                  AppContent.Dogecoin,
                                  height: 30,
                                  width: 30,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Dogcoin',
                                  style: TextStyle(
                                    fontFamily: 'InterRegular',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: notifire.getblackcolor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 20, left: 3),
                              child: Text(
                                '\$172.83',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: notifire.getblackcolor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'InterRegular'),
                              )),
                          Padding(
                            padding: const EdgeInsets.only(top: 20, left: 8),
                            child: Text(
                              '\$22,455M',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'InterRegular',
                                  color: notifire.getblackcolor,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 20, left: 8),
                              child: Text(
                                '\$23,44,556',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: notifire.getblackcolor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'InterRegular'),
                              )),
                          Padding(
                              padding: const EdgeInsets.only(top: 20, left: 8),
                              child: Row(
                                children: [
                                  const Text(
                                    '\$2.83%',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff7DC066),
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'InterRegular'),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Image.asset(
                                    'assets/trend-up.png',
                                    scale: 3.5,
                                    color: const Color(0xff7DC066),
                                  )
                                ],
                              )),
                          Padding(
                            padding: const EdgeInsets.only(top: 20, left: 8),
                            child: Row(
                              children: [
                                const Text(
                                  '\$+2.55%',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'InterRegular',
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff7DC066)),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Image.asset(
                                  'assets/trend-up.png',
                                  scale: 3.5,
                                  color: const Color(0xff7DC066),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      dividerTable(context, size),
                      TableRow(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 15, left: 3),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 5,
                                ),
                                Image.asset(
                                  AppContent.Shiba,
                                  height: 30,
                                  width: 30,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Shiba Inu (SHIB)',
                                  style: TextStyle(
                                    fontFamily: 'InterRegular',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: notifire.getblackcolor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 20, left: 3),
                              child: Text(
                                '\$762.83',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: notifire.getblackcolor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'InterRegular'),
                              )),
                          Padding(
                              padding: const EdgeInsets.only(top: 20, left: 8),
                              child: Text(
                                '\$32,783B',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: notifire.getblackcolor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'InterRegular'),
                              )),
                          Padding(
                              padding: const EdgeInsets.only(top: 20, left: 8),
                              child: Text(
                                '\$66,777',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: notifire.getblackcolor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'InterRegular'),
                              )),
                          Padding(
                              padding: const EdgeInsets.only(top: 20, left: 8),
                              child: Row(
                                children: [
                                  const Text(
                                    '\$-2.83%',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xffE5646C),
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'InterRegular'),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Image.asset(
                                    'assets/trend-up.png',
                                    scale: 3.5,
                                    color: const Color(0xffE5646C),
                                  )
                                ],
                              )),
                          Padding(
                            padding: const EdgeInsets.only(top: 20, left: 8),
                            child: Row(
                              children: [
                                const Text(
                                  '\$-2.01%',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'InterRegular',
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xffE5646C)),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Image.asset(
                                  'assets/trend-up.png',
                                  scale: 3.5,
                                  color: const Color(0xffE5646C),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      dividerTable(context, size),
                      TableRow(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 15, left: 3),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 5,
                                ),
                                Image.asset(
                                  AppContent.BNB,
                                  height: 30,
                                  width: 30,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'BNB',
                                  style: TextStyle(
                                    fontFamily: 'InterRegular',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: notifire.getblackcolor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 20, left: 3),
                              child: Text(
                                '\$572.83',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: notifire.getblackcolor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'InterRegular'),
                              )),
                          Padding(
                              padding: const EdgeInsets.only(top: 20, left: 8),
                              child: Text(
                                '\$2,983',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: notifire.getblackcolor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'InterRegular'),
                              )),
                          Padding(
                              padding: const EdgeInsets.only(top: 20, left: 8),
                              child: Text(
                                '\$1,33,445',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: notifire.getblackcolor,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'InterRegular'),
                              )),
                          Padding(
                              padding: const EdgeInsets.only(top: 20, left: 8),
                              child: Row(
                                children: [
                                  const Text(
                                    '\$+1.33%',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff7DC066),
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'InterRegular'),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Image.asset(
                                    'assets/trend-up.png',
                                    scale: 3.5,
                                    color: const Color(0xff7DC066),
                                  )
                                ],
                              )),
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, left: 8),
                                child: Row(
                                  children: [
                                    const Text(
                                      '\$+2.01%',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'InterRegular',
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff7DC066)),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Image.asset(
                                      'assets/trend-up.png',
                                      scale: 3.5,
                                      color: const Color(0xff7DC066),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      const TableRow(children: [
                        Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Divider(
                            height: 10,
                            color: Colors.transparent,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Divider(
                            height: 10,
                            color: Colors.transparent,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Divider(
                            height: 10,
                            color: Colors.transparent,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Divider(
                            height: 10,
                            color: Colors.transparent,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Divider(
                            height: 10,
                            color: Colors.transparent,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5),
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
        );
      },
    );
  }

  TableRow dividerTable(BuildContext context, size) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Divider(
            height: 10,
            color: notifire.getgrey1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Divider(
            height: 10,
            color: notifire.getgrey1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Divider(
            height: 10,
            color: notifire.getgrey1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Divider(
            height: 10,
            color: notifire.getgrey1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Divider(
            height: 10,
            color: notifire.getgrey1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Divider(
            height: 10,
            color: notifire.getgrey1,
          ),
        ),
      ],
    );
  }

  List<ChartSampleData> chartData = [
    ChartSampleData(
        x: DateTime(2016, 01, 14),
        open: 98.97,
        high: 101.19,
        low: 95.36,
        close: 97.13),
    ChartSampleData(
        x: DateTime(2016, 01, 18),
        open: 98.41,
        high: 101.46,
        low: 93.42,
        close: 99.42),
    ChartSampleData(
        x: DateTime(2016, 01, 22),
        open: 101.52,
        high: 101.53,
        low: 92.39,
        close: 97.34),
    ChartSampleData(
        x: DateTime(2016, 01, 26),
        open: 96.47,
        high: 97.33,
        low: 93.69,
        close: 94.02),
    ChartSampleData(
        x: DateTime(2016, 01, 30),
        open: 93.13,
        high: 96.35,
        low: 92.59,
        close: 93.99),
    ChartSampleData(
        x: DateTime(2016, 01, 34),
        open: 95.02,
        high: 98.89,
        low: 94.61,
        close: 96.04),
    ChartSampleData(
        x: DateTime(2016, 01, 38),
        open: 96.31,
        high: 98.0237,
        low: 93.32,
        close: 96.91),
    ChartSampleData(
        x: DateTime(2016, 01, 42),
        open: 96.86,
        high: 103.75,
        low: 96.65,
        close: 103.01),
    ChartSampleData(
        x: DateTime(2016, 01, 46),
        open: 98.41,
        high: 101.46,
        low: 93.42,
        close: 99.42),
    ChartSampleData(
        x: DateTime(2016, 01, 50),
        open: 98.97,
        high: 101.19,
        low: 95.36,
        close: 97.13),
    ChartSampleData(
        x: DateTime(2016, 01, 54),
        open: 98.41,
        high: 101.46,
        low: 93.42,
        close: 99.42),
  ];
}

class ChartSampleData {
  ChartSampleData({this.x, this.open, this.high, this.low, this.close});

  final DateTime? x;
  final double? open;
  final double? high;
  final double? low;
  final double? close;
}

class ChartData1 {
  ChartData1(this.x, this.y);

  final int x;
  final double y;
}
