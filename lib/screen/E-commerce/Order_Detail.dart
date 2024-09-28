// ignore_for_file: deprecated_member_use
// ignore_for_file: prefer_const_constructors, file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../confing/colors.dart';

import '../../confing/notifier.dart';
import '../../controller/page_controller.dart';


class OrderDetail extends StatefulWidget {
  const OrderDetail({super.key});

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  late ColorNotifier notifire;
  DateTime selectedDate = DateTime.now();
  InboxController inboxController = Get.put(InboxController());
  TextEditingController dateController = TextEditingController();
  DateRangePickerController dateSelecter = DateRangePickerController();
  TextEditingController dateController1 = TextEditingController();

  DateTime selectedDate1 = DateTime.now();

  bool isdark = false;

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifier>(context, listen: true);
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return Container(
            color: notifire.getbgcolor10,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Details(constraints.maxWidth),
                  ],
                ),
              ),
            ),
          );
        } else if (constraints.maxWidth < 1000) {
          return Container(
            decoration: BoxDecoration(color: notifire.getbgcolor10),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Details(constraints.maxWidth),
                  ],
                ),
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
            child: Container(
              decoration: BoxDecoration(color: notifire.getbgcolor10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        firstContainer(
                            context: context,
                            constraints: constraints.maxWidth),
                      ],
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

  Widget firstContainer({context, constraints}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      child: Column(
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
                'E-commerce',
                style: TextStyle(
                    color: greyy, fontSize: 14, fontFamily: 'InterRegular'),
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
                'Order Details',
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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              constraints < 600
                  ? const SizedBox()
                  : Expanded(flex: 5, child: Details(constraints)),
              const SizedBox(
                width: 10,
              ),
              Expanded(flex: 2, child: container2(constraints))
            ],
          ),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget Details(constraints) {
    return constraints < 600
        ? SingleChildScrollView(
            child: Column(
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
                      'E-commerce',
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
                      'Details',
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
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: notifire.getbgcolor11,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/Brand Logo1.png',
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
                                'Playstation 4',
                                style: TextStyle(
                                  color: notifire.getblackcolor,
                                  fontFamily: 'InterRegular',
                                  fontSize: 14,
                                ),
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Color: Black',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'InterRegular',
                                          color: Color(0xff727880))),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '\$50.34',
                            style: TextStyle(
                              fontSize: 14,
                              color: notifire.getblackcolor,
                              fontFamily: 'InterRegular',
                            ),
                          ),
                          const Text(
                            'Price',
                            style: TextStyle(
                              fontSize: 10,
                              fontFamily: 'InterRegular',
                              color: Color(0xff9DA2A7),
                            ),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '25',
                            style: TextStyle(
                              fontSize: 14,
                              color: notifire.getblackcolor,
                              fontFamily: 'InterRegular',
                            ),
                          ),
                          const Text(
                            'Quantity',
                            style: TextStyle(
                              fontSize: 10,
                              fontFamily: 'InterRegular',
                              color: Color(0xff9DA2A7),
                            ),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '\$450.22',
                            style: TextStyle(
                              fontSize: 14,
                              color: notifire.getblackcolor,
                              fontFamily: 'InterRegular',
                            ),
                          ),
                          const Text(
                            'Total',
                            style: TextStyle(
                              fontSize: 10,
                              fontFamily: 'InterRegular',
                              color: Color(0xff9DA2A7),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: notifire.getbgcolor11,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/Brand Logo4.png',
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
                                'Playstation 5',
                                style: TextStyle(
                                  fontFamily: 'InterRegular',
                                  fontSize: 14,
                                  color: notifire.getblackcolor,
                                ),
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Color: Black',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'InterRegular',
                                          color: Color(0xff727880))),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '\$40.24',
                            style: TextStyle(
                              fontSize: 14,
                              color: notifire.getblackcolor,
                              fontFamily: 'InterRegular',
                            ),
                          ),
                          const Text(
                            'Price',
                            style: TextStyle(
                              fontSize: 10,
                              fontFamily: 'InterRegular',
                              color: Color(0xff9DA2A7),
                            ),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '15',
                            style: TextStyle(
                              fontSize: 14,
                              color: notifire.getblackcolor,
                              fontFamily: 'InterRegular',
                            ),
                          ),
                          const Text(
                            'Quantity',
                            style: TextStyle(
                              fontSize: 10,
                              fontFamily: 'InterRegular',
                              color: Color(0xff9DA2A7),
                            ),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '\$390.22',
                            style: TextStyle(
                              fontSize: 14,
                              color: notifire.getblackcolor,
                              fontFamily: 'InterRegular',
                            ),
                          ),
                          const Text(
                            'Total',
                            style: TextStyle(
                              fontSize: 10,
                              fontFamily: 'InterRegular',
                              color: Color(0xff9DA2A7),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text('Sub Total:',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'InterRegular',
                                        color: Color(0xff727880))),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('Shipping Charge:',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'InterRegular',
                                        color: Color(0xff727880))),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('Estimate Tax:',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'InterRegular',
                                        color: Color(0xff727880))),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('Total:',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'InterRegular',
                                        color: Color(0xff727880))),
                              ],
                            ),
                            const SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '\$467.45',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: notifire.getblackcolor,
                                      fontFamily: 'InterRegular'),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text('\$45',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: notifire.getblackcolor,
                                        fontFamily: 'InterRegular')),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text('\$20',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: notifire.getblackcolor,
                                        fontFamily: 'InterRegular')),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text('\$450.45',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: notifire.getblackcolor,
                                        fontFamily: 'InterRegular',
                                        fontWeight: FontWeight.w600))
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: Get.width,
                      decoration: BoxDecoration(
                          color: notifire.getbgcolor11,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Billing Address',
                              style: TextStyle(
                                fontSize: 16,
                                color: notifire.getblackcolor,
                                fontFamily: 'InterRegular',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                                'Fanny Hands Lane,\nLincolnshire,\nUK,\n2467333\n(+1) 1234 456-7890',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: notifire.getblackcolor,
                                    fontFamily: 'InterRegular')),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: 100,
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: notifire.getbgcolor10,
                              ),
                              child: Center(
                                child: Row(children: [
                                  Image.asset('assets/printer.png',
                                      height: 16,
                                      color: const Color(0xff727880)),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  const Text(
                                    'Print',
                                    style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        fontSize: 14,
                                        color: Color(0xff727880),
                                        fontWeight: FontWeight.w600),
                                  )
                                ]),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: Get.width,
                      decoration: BoxDecoration(
                          color: notifire.getbgcolor11,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Shipping Address',
                              style: TextStyle(
                                fontSize: 16,
                                color: notifire.getblackcolor,
                                fontFamily: 'InterRegular',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                                'Fanny Hands Lane,\nLincolnshire,\nUK,\n2467333\n(+1) 1234 456-7890',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: notifire.getblackcolor,
                                    fontFamily: 'InterRegular')),
                            const SizedBox(
                              height: 20,
                            ),
                            InkWell(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          container2(constraints),
                                    )),
                                child: Container(
                                  width: 100,
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: notifire.getbgcolor10),
                                  child: Center(
                                    child: Row(children: [
                                      Image.asset('assets/printer.png',
                                          height: 16,
                                          color: const Color(0xff727880)),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      const Text(
                                        'Print',
                                        style: TextStyle(
                                            fontFamily: 'InterRegular',
                                            fontSize: 14,
                                            color: Color(0xff727880),
                                            fontWeight: FontWeight.w600),
                                      )
                                    ]),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: Get.width,
                      decoration: BoxDecoration(
                          color: notifire.getbgcolor11,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Payment Details',
                              style: TextStyle(
                                fontSize: 16,
                                color: notifire.getblackcolor,
                                fontFamily: 'InterRegular',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                                'Visa Card\nJane Cooper\n**** **** **** 93100\n8/2023\n',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: notifire.getblackcolor,
                                    fontFamily: 'InterRegular')),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: notifire.getbgcolor11),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Order ID',
                          style: TextStyle(
                              fontSize: 16,
                              color: notifire.getblackcolor,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'InterRegular'),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              'ODSP29475',
                              style: TextStyle(
                                fontSize: 13,
                                fontFamily: 'InterRegular',
                                color: notifire.getblackcolor,
                              ),
                            ),
                            const Spacer(),
                            SvgPicture.asset(
                              'assets/Copy.svg',
                              height: 20,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Tracking ID',
                          style: TextStyle(
                              fontSize: 16,
                              color: notifire.getblackcolor,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'InterRegular'),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              '9978578567',
                              style: TextStyle(
                                fontSize: 13,
                                fontFamily: 'InterRegular',
                                color: notifire.getblackcolor,
                              ),
                            ),
                            const Spacer(),
                            SvgPicture.asset(
                              'assets/Copy.svg',
                              height: 20,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Order Status',
                          style: TextStyle(
                              fontSize: 16,
                              color: notifire.getblackcolor,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'InterRegular'),
                        ),
                        Transform.translate(
                          offset: const Offset(0, -80),
                          child: TimelineTile(
                            isFirst: true,
                            hasIndicator: true,
                            endChild: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 20, top: 110),
                                    child: Transform.translate(
                                      offset: const Offset(10, 0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(width: 10, height: 10),
                                          Row(
                                            children: [
                                              Text(
                                                "Order Placed",
                                                style: TextStyle(
                                                  fontFamily: "InterRegular",
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: notifire.getblackcolor,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Image.asset(
                                                'assets/Ellipse 88.png',
                                                height: 6,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              const Text(
                                                '27 Aug 2022',
                                                style: TextStyle(
                                                    fontFamily: 'InterRegular',
                                                    fontSize: 12,
                                                    color: Color(0xff727880)),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            'An order has been placed.',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: notifire.getblackcolor,
                                              fontFamily: 'InterRegular',
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          const Text('2:30 PM',
                                              style: TextStyle(
                                                  fontFamily: 'InterRegular',
                                                  fontSize: 10,
                                                  color: Color(0xff727880))),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            'Seller has proccessed your order.',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: notifire.getblackcolor,
                                              fontFamily: 'InterRegular',
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          const Text('2:30 PM',
                                              style: TextStyle(
                                                  fontFamily: 'InterRegular',
                                                  fontSize: 10,
                                                  color: Color(0xff727880))),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          const Text(''),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            // isFirst: true,
                            beforeLineStyle: const LineStyle(
                                color: Color(0xff595FE5), thickness: 2),
                            indicatorStyle: IndicatorStyle(
                              indicator: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: const Color(0xff595FE5)),
                                  child: Center(
                                      child: SvgPicture.asset(
                                    'assets/bag-tick.svg',
                                    height: 12,
                                  ))),
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: const Offset(0, -170),
                          child: TimelineTile(
                            isFirst: true,
                            hasIndicator: true,
                            endChild: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 20, top: 85),
                                    child: Transform.translate(
                                      offset: const Offset(10, 0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Packed",
                                                style: TextStyle(
                                                  fontFamily: "InterRegular",
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: notifire.getblackcolor,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Image.asset(
                                                'assets/Ellipse 88.png',
                                                height: 6,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              const Text(
                                                '12 Aug 2022',
                                                style: TextStyle(
                                                    fontFamily: 'InterRegular',
                                                    fontSize: 12,
                                                    color: Color(0xff727880)),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            'Your Item has been picked up by courier patner',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: notifire.getblackcolor,
                                              fontFamily: 'InterRegular',
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          const Text('4:30 PM',
                                              style: TextStyle(
                                                  fontFamily: 'InterRegular',
                                                  fontSize: 10,
                                                  color: Color(0xff727880))),
                                          const SizedBox(height: 30),
                                          const Text(''),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            // isFirst: true,
                            beforeLineStyle: const LineStyle(
                                color: Color(0xff595FE5), thickness: 2),
                            indicatorStyle: IndicatorStyle(
                              indicator: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: const Color(0xff595FE5)),
                                  child: Center(
                                      child: SvgPicture.asset(
                                    'assets/box-tick.svg',
                                    height: 12,
                                  ))),
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: const Offset(0, -258),
                          child: TimelineTile(
                            isFirst: true,
                            hasIndicator: true,
                            endChild: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 20, top: 80),
                                    child: Transform.translate(
                                      offset: const Offset(10, 0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Shipping",
                                                style: TextStyle(
                                                  fontFamily: "InterRegular",
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: notifire.getblackcolor,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Image.asset(
                                                'assets/Ellipse 88.png',
                                                height: 6,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              const Text(
                                                '27 Nov 2022',
                                                style: TextStyle(
                                                    fontFamily: 'InterRegular',
                                                    fontSize: 12,
                                                    color: Color(0xff727880)),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            'Shipping by DHL Express',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: notifire.getblackcolor,
                                              fontFamily: 'InterRegular',
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          const Text('2:30 PM',
                                              style: TextStyle(
                                                  fontFamily: 'InterRegular',
                                                  fontSize: 10,
                                                  color: Color(0xff727880))),
                                          const SizedBox(height: 30),
                                          const Text(''),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            // isFirst: true,
                            beforeLineStyle: LineStyle(
                                color: notifire.Getblg2, thickness: 2),
                            indicatorStyle: IndicatorStyle(
                              indicator: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                          color: const Color(0xff595FE5))),
                                  child: Center(
                                      child: SvgPicture.asset(
                                    'assets/truck-fast.svg',
                                    height: 12,
                                    color: const Color(0xff595FE5),
                                  ))),
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: const Offset(0, -320),
                          child: TimelineTile(
                            isFirst: true,
                            hasIndicator: true,
                            endChild: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 20, top: 40),
                                    child: Transform.translate(
                                      offset: const Offset(10, 0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Row(
                                            children: [
                                              const Text(
                                                "Delivered",
                                                style: TextStyle(
                                                    fontFamily: "InterRegular",
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xff727880)),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Image.asset(
                                                'assets/Ellipse 88.png',
                                                height: 6,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              const Text(
                                                '16 Aug 2022',
                                                style: TextStyle(
                                                    fontFamily: 'InterRegular',
                                                    fontSize: 12,
                                                    color: Color(0xff727880)),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          const Text(
                                            'Your items recieved by the customer',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: 'InterRegular',
                                                color: Color(0xff727880)),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          const Text('1:20 PM',
                                              style: TextStyle(
                                                  fontFamily: 'InterRegular',
                                                  fontSize: 10,
                                                  color: Color(0xff727880))),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            // isFirst: true,
                            beforeLineStyle: LineStyle(
                                color: notifire.Getblg2, thickness: 2),
                            indicatorStyle: IndicatorStyle(
                              indicator: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: notifire.Getblg2),
                                  child: Center(
                                      child: SvgPicture.asset(
                                    'assets/verify.svg',
                                    height: 12,
                                  ))),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        : Column(
            children: [
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: notifire.getbgcolor11,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/Brand Logo1.png',
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
                              'Playstation 4 Limited Edition',
                              style: TextStyle(
                                fontFamily: 'InterRegular',
                                fontSize: 14,
                                color: notifire.getblackcolor,
                              ),
                            ),
                            Row(
                              children: [
                                const Text('Color: Green',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'InterRegular',
                                        color: Color(0xff727880))),
                                const SizedBox(
                                  width: 5,
                                ),
                                Image.asset('assets/Ellipse 88.png',
                                    height: 4, color: const Color(0xffC6C8CB)),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text('Size: M',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'InterRegular',
                                        color: Color(0xff727880))),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '\$34.34',
                          style: TextStyle(
                            fontSize: 14,
                            color: notifire.getblackcolor,
                            fontFamily: 'InterRegular',
                          ),
                        ),
                        const Text(
                          'Price',
                          style: TextStyle(
                            fontSize: 10,
                            fontFamily: 'InterRegular',
                            color: Color(0xff9DA2A7),
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '5',
                          style: TextStyle(
                            fontSize: 14,
                            color: notifire.getblackcolor,
                            fontFamily: 'InterRegular',
                          ),
                        ),
                        const Text(
                          'Quantity',
                          style: TextStyle(
                            fontSize: 10,
                            fontFamily: 'InterRegular',
                            color: Color(0xff9DA2A7),
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '\$139.83',
                          style: TextStyle(
                            fontSize: 14,
                            color: notifire.getblackcolor,
                            fontFamily: 'InterRegular',
                          ),
                        ),
                        const Text(
                          'Total',
                          style: TextStyle(
                            fontSize: 10,
                            fontFamily: 'InterRegular',
                            color: Color(0xff9DA2A7),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: notifire.getbgcolor11,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/Brand Logo4.png',
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
                              'Playstation 5 Limited Edition',
                              style: TextStyle(
                                color: notifire.getblackcolor,
                                fontFamily: 'InterRegular',
                                fontSize: 14,
                              ),
                            ),
                            Row(
                              children: [
                                const Text('Color: Black',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'InterRegular',
                                        color: Color(0xff727880))),
                                const SizedBox(
                                  width: 5,
                                ),
                                Image.asset('assets/Ellipse 88.png',
                                    height: 4, color: const Color(0xffC6C8CB)),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text('Size: XL',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'InterRegular',
                                        color: Color(0xff727880))),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '\$40.24',
                          style: TextStyle(
                            fontSize: 14,
                            color: notifire.getblackcolor,
                            fontFamily: 'InterRegular',
                          ),
                        ),
                        const Text(
                          'Price',
                          style: TextStyle(
                            fontSize: 10,
                            fontFamily: 'InterRegular',
                            color: Color(0xff9DA2A7),
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '15',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'InterRegular',
                            color: notifire.getblackcolor,
                          ),
                        ),
                        const Text(
                          'Quantity',
                          style: TextStyle(
                            fontSize: 10,
                            fontFamily: 'InterRegular',
                            color: Color(0xff9DA2A7),
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '\$  390.22',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'InterRegular',
                            color: notifire.getblackcolor,
                          ),
                        ),
                        const Text(
                          'Total',
                          style: TextStyle(
                            fontSize: 10,
                            fontFamily: 'InterRegular',
                            color: Color(0xff9DA2A7),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Spacer(
                    flex: 6,
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text('Sub Total:',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'InterRegular',
                                        color: Color(0xff727880))),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('Shipping Charge:',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'InterRegular',
                                        color: Color(0xff727880))),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('Estimate Tax:',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'InterRegular',
                                        color: Color(0xff727880))),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('Total:',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'InterRegular',
                                        color: Color(0xff727880))),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '\$467.45',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'InterRegular',
                                      color: notifire.getblackcolor),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text('\$45',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: notifire.getblackcolor,
                                        fontFamily: 'InterRegular')),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text('\$20',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: notifire.getblackcolor,
                                        fontFamily: 'InterRegular')),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text('\$450.45',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'InterRegular',
                                        color: notifire.getblackcolor,
                                        fontWeight: FontWeight.w600))
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: notifire.getbgcolor11,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Billing Address',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'InterRegular',
                                fontWeight: FontWeight.w600,
                                color: notifire.getblackcolor,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                                'Fanny Hands Lane,\nLincolnshire,\nUK,\n2467333\n(+1) 1234 456-7890',
                                style: TextStyle(
                                    color: notifire.getblackcolor,
                                    fontSize: 14,
                                    fontFamily: 'InterRegular')),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: 100,
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: notifire.getbgcolor10),
                              child: Center(
                                child: Row(children: [
                                  Image.asset('assets/printer.png',
                                      height: 16,
                                      color: const Color(0xff727880)),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  const Text(
                                    'Print',
                                    style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        fontSize: 14,
                                        color: Color(0xff727880),
                                        fontWeight: FontWeight.w600),
                                  )
                                ]),
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
                    child: Container(
                      decoration: BoxDecoration(
                          color: notifire.getbgcolor11,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Shipping Address',
                              style: TextStyle(
                                fontSize: 16,
                                color: notifire.getblackcolor,
                                fontFamily: 'InterRegular',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                                'Fanny Hands Lane,\nLincolnshire,\nUK,\n2467333\n(+1) 1234 456-7890',
                                style: TextStyle(
                                    color: notifire.getblackcolor,
                                    fontSize: 14,
                                    fontFamily: 'InterRegular')),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: 100,
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: notifire.getbgcolor10),
                              child: Center(
                                child: Row(children: [
                                  Image.asset('assets/printer.png',
                                      height: 16,
                                      color: const Color(0xff727880)),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  const Text(
                                    'Print',
                                    style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        fontSize: 14,
                                        color: Color(0xff727880),
                                        fontWeight: FontWeight.w600),
                                  )
                                ]),
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
                    child: Container(
                      // height: constraints < 1500
                      //     ? Get.height * 0.322
                      //     : constraints > 1500
                      //     ? Get.height * 0.27
                      //     : null,
                      decoration: BoxDecoration(
                          color: notifire.getbgcolor11,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Payment Details',
                              style: TextStyle(
                                fontSize: 16,
                                color: notifire.getblackcolor,
                                fontFamily: 'InterRegular',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                                'Visa Card\nJane Cooper\n**** **** **** 93100\n8/2023\n',
                                style: TextStyle(
                                    color: notifire.getblackcolor,
                                    fontSize: 14,
                                    fontFamily: 'InterRegular')),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: 100,
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border:
                                      Border.all(color: Colors.transparent)),
                              child: const Center(
                                child: Row(children: [
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    'Print',
                                    style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        fontSize: 14,
                                        color: Colors.transparent,
                                        fontWeight: FontWeight.w600),
                                  )
                                ]),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          );
  }

  Widget container2(constraints) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: notifire.getbgcolor11,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Order ID',
              style: TextStyle(
                  fontSize: 16,
                  color: notifire.getblackcolor,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'InterRegular'),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  'ODSP29475',
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: 'InterRegular',
                    color: notifire.getblackcolor,
                  ),
                ),
                const Spacer(),
                SvgPicture.asset(
                  'assets/Copy.svg',
                  height: 20,
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Tracking ID',
              style: TextStyle(
                  fontSize: 16,
                  color: notifire.getblackcolor,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'InterRegular'),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  '9978578567',
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: 'InterRegular',
                    color: notifire.getblackcolor,
                  ),
                ),
                const Spacer(),
                SvgPicture.asset(
                  'assets/Copy.svg',
                  height: 20,
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Order Status',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: notifire.getblackcolor,
                  fontFamily: 'InterRegular'),
            ),
            Transform.translate(
              offset: const Offset(0, -80),
              child: TimelineTile(
                isFirst: true,
                hasIndicator: true,
                endChild: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20, top: 110),
                        child: Transform.translate(
                          offset: const Offset(10, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(width: 10, height: 10),
                              Row(
                                children: [
                                  Text(
                                    "Order Placed",
                                    style: TextStyle(
                                      fontFamily: "InterRegular",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: notifire.getblackcolor,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Image.asset(
                                    'assets/Ellipse 88.png',
                                    height: 6,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    '27 Aug 2022',
                                    style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        fontSize: 12,
                                        color: Color(0xff727880)),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'An order has been placed.',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: notifire.getblackcolor,
                                  fontFamily: 'InterRegular',
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text('2:30 PM',
                                  style: TextStyle(
                                      fontFamily: 'InterRegular',
                                      fontSize: 10,
                                      color: Color(0xff727880))),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Seller has proccessed your order.',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: notifire.getblackcolor,
                                  fontFamily: 'InterRegular',
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text('2:30 PM',
                                  style: TextStyle(
                                      fontFamily: 'InterRegular',
                                      fontSize: 10,
                                      color: Color(0xff727880))),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(''),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // isFirst: true,
                beforeLineStyle:
                    const LineStyle(color: Color(0xff595FE5), thickness: 2),
                indicatorStyle: IndicatorStyle(
                  indicator: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color(0xff595FE5)),
                      child: Center(
                          child: SvgPicture.asset(
                        'assets/bag-tick.svg',
                        height: 12,
                      ))),
                ),
              ),
            ),
            Transform.translate(
              offset: const Offset(0, -170),
              child: TimelineTile(
                isFirst: true,
                hasIndicator: true,
                endChild: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20, top: 85),
                        child: Transform.translate(
                          offset: const Offset(10, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Packed",
                                    style: TextStyle(
                                      fontFamily: "InterRegular",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: notifire.getblackcolor,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Image.asset(
                                    'assets/Ellipse 88.png',
                                    height: 6,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    '12 Aug 2022',
                                    style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        fontSize: 12,
                                        color: Color(0xff727880)),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Your Item has been picked up by courier patner',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: notifire.getblackcolor,
                                  fontFamily: 'InterRegular',
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text('4:30 PM',
                                  style: TextStyle(
                                      fontFamily: 'InterRegular',
                                      fontSize: 10,
                                      color: Color(0xff727880))),
                              const SizedBox(height: 30),
                              const Text(''),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // isFirst: true,
                beforeLineStyle:
                    const LineStyle(color: Color(0xff595FE5), thickness: 2),
                indicatorStyle: IndicatorStyle(
                  indicator: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color(0xff595FE5)),
                      child: Center(
                          child: SvgPicture.asset(
                        'assets/box-tick.svg',
                        height: 12,
                      ))),
                ),
              ),
            ),
            Transform.translate(
              offset: const Offset(0, -258),
              child: TimelineTile(
                isFirst: true,
                hasIndicator: true,
                endChild: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20, top: 80),
                        child: Transform.translate(
                          offset: const Offset(10, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Shipping",
                                    style: TextStyle(
                                      fontFamily: "InterRegular",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: notifire.getblackcolor,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Image.asset(
                                    'assets/Ellipse 88.png',
                                    height: 6,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    '27 Nov 2022',
                                    style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        fontSize: 12,
                                        color: Color(0xff727880)),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Shipping by DHL Express',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: notifire.getblackcolor,
                                  fontFamily: 'InterRegular',
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text('2:30 PM',
                                  style: TextStyle(
                                      fontFamily: 'InterRegular',
                                      fontSize: 10,
                                      color: Color(0xff727880))),
                              const SizedBox(height: 30),
                              const Text(''),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // isFirst: true,
                beforeLineStyle:
                    LineStyle(color: notifire.Getblg2, thickness: 2),
                indicatorStyle: IndicatorStyle(
                  indicator: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0xff595FE5))),
                      child: Center(
                          child: SvgPicture.asset(
                        'assets/truck-fast.svg',
                        height: 12,
                        color: const Color(0xff595FE5),
                      ))),
                ),
              ),
            ),
            Transform.translate(
              offset: const Offset(0, -320),
              child: TimelineTile(
                isFirst: true,
                hasIndicator: true,
                endChild: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20, top: 40),
                        child: Transform.translate(
                          offset: const Offset(10, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "Delivered",
                                    style: TextStyle(
                                        fontFamily: "InterRegular",
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff727880)),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Image.asset(
                                    'assets/Ellipse 88.png',
                                    height: 6,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    '16 Aug 2022',
                                    style: TextStyle(
                                        fontFamily: 'InterRegular',
                                        fontSize: 12,
                                        color: Color(0xff727880)),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                'Your items recieved by the customer',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'InterRegular',
                                    color: Color(0xff727880)),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text('1:20 PM',
                                  style: TextStyle(
                                      fontFamily: 'InterRegular',
                                      fontSize: 10,
                                      color: Color(0xff727880))),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // isFirst: true,
                beforeLineStyle:
                    LineStyle(color: notifire.Getblg2, thickness: 2),
                indicatorStyle: IndicatorStyle(
                  indicator: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: notifire.Getblg2),
                      child: Center(
                          child: SvgPicture.asset(
                        'assets/verify.svg',
                        height: 12,
                      ))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
