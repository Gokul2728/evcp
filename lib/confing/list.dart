// ignore_for_file: camel_case_types, non_constant_identifier_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DynamicListExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic List Example'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('tasks').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Something went wrong'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          // Assuming each document has a 'value' field that you want to display
          List<String> dynamicList = snapshot.data!.docs
              .map((doc) => doc['value'].toString())
              .toList();

          return ListView.builder(
            itemCount: dynamicList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(dynamicList[index]),
              );
            },
          );
        },
      ),
    );
  }
}

class model {
  List appbar = [
    'Solutions',
    'Product',
    'Resources',
    'Download',
    'Pricing',
  ];
  List info = [
    '1-1',
    '2-10',
    '10-50',
    '50+',
  ];
  List info1 = [
    'Company Account',
    'Developer Account',
    'Testing Account',
  ];
  List infor2 = [
    'Use images to enhance your post flow.',
    'Use images to your post time.',
    'Use images to enhance time travel rivers.',
  ];
  List inforimage = [
    'assets/UserCircle-d.png',
    'assets/SuitcaseSimple-d.png',
    'assets/SuitcaseSimple-d.png',
  ];
  List choose = [
    'assets/UserCircle-d.png',
    'assets/SuitcaseSimple-d.png',
  ];
  List choose1 = [
    'Personal Account',
    'Corporat Account',
  ];
  List choose2 = [
    'If you need more info, please check it out.',
    'Lorem ipsum dolor sit amet adipiscing elit',
  ];

  List sales = [
    'assets/France.png',
    'assets/us.png',
    'assets/Brazil.png',
    'assets/global.png',
  ];

  List Sales1 = [
    'United States',
    'France',
    'Brazil',
    'Others',
  ];
  List sales2 = [
    '20%',
    '40%',
    '60%',
    '80%',
  ];
  List cryptoo = [
    '\$990.000k'
        '\$330.000k'
        '\$99.00k'
        '\$9.030k'
  ];

  List crypto1 = [
    'Total Buy',
    'Total Sell',
    'Total Invested',
    'Day Change',
  ];
  List crypto2 = [
    '+12.09%',
    '+1.09%',
    '+22.09%',
    '+2.09%',
  ];

  List crypto3 = [
    'assets/money-add.png',
    'assets/money-add.png',
    'assets/money-add.png',
    'assets/money-add.png',
  ];

  List list = [
    'assets/Bitcoin.png',
    'assets/Ethereum ETH.png',
    'assets/Tether.png',
    'assets/USD Coin.png',
    'assets/BNB.png',
    'assets/XRP.png',
    'assets/Dash.png',
    'assets/Cronos.png',
    'assets/Litecoin LTC.png',
    'assets/Dogecoin.png',
  ];

  List list1 = [
    'Bitcoin (BTC)',
    'Ethereum (ETH)',
    'Tether (USDT)',
    'USD Coin (USDC)',
    'BNB (BNB)',
    'XRP XRP',
    'Dash (DASH)',
    'Cronos',
    'Litecoin LTC',
    'Dogecoin',
  ];

  List list2 = [
    '\$2,760.78',
    '\$3,00.0',
    '\$550',
    '\$50',
    '\$0.55597',
    '\$1.333',
    '\$407.45',
    '\$495.33',
    '\$200.3',
    '\$5',
  ];

  List list3 = [
    '+2.44',
    '-1.29',
    '-0.44',
    '+7.0',
    '-3.77',
    '+2.33',
    '+4.55',
    '-1.24',
    '+8.8',
    '+2.5',
  ];

  List<Color> colors = [
    const Color(0xff7DC066),
    const Color(0xffE5646C),
    const Color(0xffE5646C),
    const Color(0xff7DC066),
    const Color(0xffE5646C),
    const Color(0xff7DC066),
    const Color(0xff7DC066),
    const Color(0xffE5646C),
    const Color(0xff7DC066),
    const Color(0xff7DC066),
  ];

  List list4 = [
    'assets/Line.png',
    'assets/Line.png',
    'assets/Line.png',
    'assets/Line.png',
    'assets/Line.png',
    'assets/Line.png',
    'assets/Line.png',
    'assets/Line.png',
    'assets/Line.png',
    'assets/Line.png',
  ];

  List list5 = [
    'assets/trend-up.png',
    'assets/trend-up.png',
    'assets/trend-up.png',
    'assets/trend-up.png',
    'assets/trend-up.png',
    'assets/trend-up.png',
    'assets/trend-up.png',
    'assets/trend-up.png',
    'assets/trend-up.png',
    'assets/trend-up.png',
  ];

  List Analytics = [
    'google.com/-admin-dashboard',
    'google.com/evcp-design-uikit',
    'ui8.com/evcp-design-uikit',
    'ui8.com/evcp-admin-design',
    'google.com/evcp-design-uikit',
    'ui8.com/evcp-design-uikit',
    'ui8.com/evcp-admin-design',
  ];
  List Analytics1 = [
    '7.5%',
    '0.6%',
    '3.5%',
    '4.6%',
    '2.3%',
    '6.2%',
    '2.6%',
  ];
  List message = [
    'assets/Add++.png',
    'assets/Avatar.png',
    'assets/Avatar61.png',
    'assets/Avatar62.png',
    'assets/Avatar64.png',
    'assets/Avatar1.png',
    'assets/Avatar65.png',
    'assets/Avatar66.png',
  ];

  List assmessge = [
    'assets/Avatar1.png',
    'assets/Avatar2.png',
    'assets/Avata63.png',
    'assets/Avatar62.png',
    'assets/Avatar.png',
    'assets/Avatar64.png',
    'assets/Avatar65.png',
    'assets/Avatar66.png',
    'assets/Avatar.png',
    'assets/Avatar62.png',
  ];
  List limessage = [
    'Robert Darlene',
    'Bessie Cooper',
    'Russell Team',
    'Robert Team',
    'Ronald Richards',
    'Arlene McCoy',
    'Jenny Wilson',
    'Dianne Russell',
    'Arlene McCoy',
    'The Perfect Man',
  ];
  List limessage1 = [
    'Robert Darlene',
    'Bessie Cooper',
    'Russell Team',
    'Robert Team',
    'Ronald Richards',
  ];
  List messages = [
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
  List messages1 = [
    '8:20 AM',
    '4:39 PM',
    '02 July',
    '07 July',
    '09 July',
  ];
  List mesage = [
    'Missed call',
    'omg, this is amazing',
    'Bell: woohoooo',
    'How are you?',
    'Call ended',
    'Wow, this is really epic',
    'perfect!',
    'Haha oh man',
    'just ideas for next time',
    'omg, this is amazing',
  ];
  List Stories = [
    'assets/Story.png',
    'assets/Story1.png',
    'assets/Story.png',
    'assets/Story1.png',
    'assets/Story.png',
  ];
  List messagee = [
    'assets/Avata63.png',
    'assets/Avatar62.png',
    'assets/Avatar.png',
    'assets/Avatar64.png',
    'assets/Avatar65.png',
    'assets/Avatar66.png',
    'assets/Avatar.png',
    'assets/Avatar62.png',
    'assets/Avatar1.png',
    'assets/Avatar2.png',
  ];
  List Working = [
    'Working',
    'Free Time',
    'Progress',
    'Free Time',
    'Working',
    'Free Time',
    'Progress',
    'Free Time',
    'Free Time',
    'Progress',
  ];
  List Progress = [
    'Progress',
    'Exprired',
    'Exprired',
    'Progress',
    'Exprired',
    'Progress',
    'Exprired',
    'Progress',
    'Exprired',
    'Progress',
  ];
  List abcd = [
    'JG',
    'RR',
    'RC',
    'AO',
    'PD',
    'GG',
    'FE',
    'DR',
    'YJ',
    'SF',
  ];
  List abcd1 = [
    'JG',
    'RR',
    'RC',
    'AO',
    'PD',
  ];
  List ind = [
    'assets/address.png',
    'assets/inbox.png',
    'assets/Job.png',
  ];

  List ind1 = [
    'Los Angeles, California',
    'jennywilso@gmail.com',
    'Designer, Google',
  ];
  List mail1 = [
    '12,557',
    '3,948',
    '1,234',
    '2,234',
    '1,789',
    '1,555',
  ];
  List mail = [
    'assets/inbox.png',
    'assets/send-2.png',
    'assets/heart.png',
    'assets/sms-tracking.png',
    'assets/archive1.png',
    'assets/trash1.png',
  ];
  List mail2 = [
    'Inbox',
    'Sent',
    'Favorites',
    'Spam',
    'Archive',
    'Trash',
  ];

  List proimage = [
    'assets/Media21.png',
    'assets/Media22.png',
    'assets/Media23.png',
    'assets/Media24.png',
    'assets/Media25.png',
    'assets/Media22.png',
    'assets/Media23.png',
    'assets/Media24.png',
  ];
  List prolist = [
    'DJI Mavic Pro 2',
    'Coach Tabby for sale',
    'Dell Computer Monitor',
    'iPad Pro Model',
    'Gopro hero 8',
    'Coach Tabby for sale',
    'Dell Computer Monitor',
    'iPad Pro Model',
  ];
  List prolist1 = [
    '23%',
    '30%',
    '44%',
    '23%',
    '35%',
    '30%',
    '44%',
    '23%',
  ];
  List prolist2 = [
    '23%',
    '20%',
    '24%',
    '23%',
    '45%',
    '20%',
    '24%',
    '23%',
  ];
  List prodlist = [
    '12,000',
    '15,000',
    '10,000',
    '11,000',
    '14,000',
    '15,000',
    '10,000',
    '11,000',
  ];
  List prodlist1 = [
    '132',
    '343',
    '23',
    '455',
    '123',
    '343',
    '23',
    '455',
  ];
  List prolist3 = [
    '5',
    '4.5',
    '3',
    '2',
    '1',
    '4.5',
    '3',
    '2',
  ];
  List prodlist2 = [
    '\$550',
    '\$455',
    '\$356',
    '\$678',
    '\$434',
    '\$455',
    '\$356',
    '\$678',
  ];
  List prod = [
    'assets/box.svg',
    'assets/house.svg',
    'assets/shopping-cart.svg',
    'assets/dollar-circle.svg',
    'assets/wallet-2.svg',
  ];
  List produ = [
    '5,600',
    '2,002',
    '344',
    '\$356.27',
    '\$34.6734',
  ];
  List proob = [
    'Total Products',
    'Available Stocks',
    'Orders',
    'Price',
    'Total Revenue',
  ];
  List yes = [
    'assets/avatar-6 1.png',
    'assets/avatar-7 1.png',
    'assets/avatar-8 1.png',
    'assets/artist.png',
    'assets/Avatar62.png',
    'assets/avatar-6 1.png',
    'assets/avatar-7 1.png',
    'assets/avatar-8 1.png',
    'assets/artist.png',
    'assets/Avatar62.png',
  ];
  List yes1 = [
    'Eleanor Pena',
    'Annette Black',
    'Cody Fisher',
    'Guy Hawkins',
    'Kristin Watson',
    'Eleanor Pena',
    'Annette Black',
    'Cody Fisher',
    'Guy Hawkins',
    'Kristin Watson',
  ];
  List yes2 = [
    'michael.mitc@example.com',
    'Annette.Black@example.com',
    'Cody.Fisher@example.com',
    'Guy.Hawkins@example.com',
    'Kristin.Watson@example.com',
    'michael.mitc@example.com',
    'Annette.Black@example.com',
    'Cody.Fisher@example.com',
    'Guy.Hawkins@example.com',
    'Kristin.Watson@example.com',
  ];
  List yes3 = [
    'assets/Media(3).png',
    'assets/Media21.png',
    'assets/Media22.png',
    'assets/Media23.png',
    'assets/Media24.png',
  ];

  List status = [
    'Order Placed',
    'Packed',
    'Shipping',
    'Delivered',
  ];

  List ti = [
    '27 Aug 2022',
    '22 Sep 2023',
    '08 Nov 2022',
    '12 Oct 2024',
  ];

  List custom = [
    'assets/avatar-6 1.png',
    'assets/avatar-7 1.png',
    'assets/avatar-8 1.png',
    'assets/avatar-1-51c6502a 1.png',
    'assets/artist.png',
    'assets/download 1.png',
    'assets/artist.png',
    'assets/download 1.png',
    'assets/avatar-7 1.png',
    'assets/avatar-8 1.png',
    'assets/avatar-1-51c6502a 1.png',
    'assets/avatar-6 1.png',
  ];
  List custome = [
    'Ananya Ishana',
    'Rahul Kohli',
    'Akshay Kumar',
    'Harsha Agrawal',
    'Mahavir Agrawal',
    'Kavya Sharma',
    'Rahul Kohli',
    'Akshay Kumar',
    'Harsha Agrawal',
    'Mahavir Agrawal',
    'Kavya Sharma',
    'Ananya Ishana',
  ];

  List custo = [
    '(456) 557-6979',
    '(346) 547-5678',
    '(342) 527-4678',
    '(900) 557-3456',
    '(124) 537-4567',
    '(567) 567-9876',
    '(456) 557-6979',
    '(346) 547-5678',
    '(342) 527-4678',
    '(900) 557-3456',
    '(124) 537-4567',
    '(567) 567-9876',
  ];
  List customs = [
    'Ananya23@gmail.com',
    'RahulKohli87@gmail.com',
    'MahavirAgrawal34@gmail.com',
    'HarshaAgrawal34@gmail.com',
    'Kavya343@gmail.com',
    'IshanaSharma3@gmail.com',
    'Ananya23@gmail.com',
    'RahulKohli87@gmail.com',
    'MahavirAgrawal34@gmail.com',
    'HarshaAgrawal34@gmail.com',
    'Kavya343@gmail.com',
    'IshanaSharma3@gmail.com',
  ];
  List Active = [
    'Active',
    'Blocked',
    'Active',
    'Active',
    'Inactive',
    'Blocked',
    'Active',
    'Blocked',
    'Active',
    'Active',
    'Inactive',
    'Blocked',
  ];
  List InterRegular = [
    const Color(0xff7DC066),
    const Color(0xffE5646C),
    const Color(0xff7DC066),
    const Color(0xff7DC066),
    const Color(0xffE5646C),
    const Color(0xff9DA2A7),
    const Color(0xff7DC066),
    const Color(0xffE5646C),
    const Color(0xff7DC066),
    const Color(0xff7DC066),
    const Color(0xffE5646C),
    const Color(0xff9DA2A7),
  ];

  List Custo = [
    const Color(0xffE6F9EF),
    const Color(0xffFAEBEC),
    const Color(0xffE6F9EF),
    const Color(0xffE6F9EF),
    const Color(0xffFAEBEC),
    const Color(0xffEEEEEE),
    const Color(0xffE6F9EF),
    const Color(0xffFAEBEC),
    const Color(0xffE6F9EF),
    const Color(0xffE6F9EF),
    const Color(0xffFAEBEC),
    const Color(0xffEEEEEE),
  ];
  List seller = [
    'assets/Brand Logo11.png',
    'assets/Brand Logo21.png',
    'assets/Brand Logo22.png',
    'assets/Team 1.png',
    'assets/Store Avatar.png',
    'assets/Store Avatar(1).png',
    'assets/Brand Logo21.png',
    'assets/Brand Logo22.png',
  ];
  List sell = [
    'Whiteheads Store',
    'Dark circles Store',
    'circles Store',
    'Sharma Strore',
    'Ishana Strore',
    'Oiliness Strore',
    'Dark circles Store',
    'circles Store',
  ];

  List chart = [
    'assets/Area(1).png',
    'assets/Area(1).png',
    'assets/Area.png',
    'assets/Area(1).png',
    'assets/Area.png',
    'assets/Area(1).png',
    'assets/Area(1).png',
    'assets/Area.png',
  ];
  List selll = [
    '123',
    '56',
    '355',
    '34',
    '432',
    '56',
    '355',
    '34',
  ];
  List selll1 = [
    '\$354.66',
    '\$466.44',
    '\$344.55',
    '\$645.56',
    '\$45.55',
    '\$577.55',
    '\$466.44',
    '\$344.55',
  ];
  List sellerss = [
    '1.04%',
    '2.3%',
    '-2.00%',
    '3.45%',
    '-4.55%',
    '0.45%',
    '2.3%',
    '-2.00%',
  ];
  List selcol = [
    const Color(0xff7DC066),
    const Color(0xff7DC066),
    const Color(0xffE5646C),
    const Color(0xff7DC066),
    const Color(0xffE5646C),
    const Color(0xff7DC066),
    const Color(0xff7DC066),
    const Color(0xffE5646C),
  ];

  List finan = [
    'assets/Icon Left.svg',
    'assets/Icon Left(1).svg',
    'assets/Icon Left(2).svg',
    'assets/cards100.svg',
  ];
  List fin = [
    'Overview',
    'Transactions',
    'Invoices',
    'Cards',
  ];
  List fin1 = [
    'assets/Brand Logo11.png',
    'assets/Brand Logo21.png',
    'assets/Brand Logo22.png',
    'assets/Store Avatar(1).png',
    'assets/Store Avatar.png',
    'assets/Team 1.png',
  ];

  List filanc = [
    'Figma',
    'Netflix',
    'Microsoft Inc.',
    'FedExpress',
    'YouTube',
    'Google',
  ];
  List filanc1 = [
    '12 Sep 2022',
    '25 Sep 2022',
    '10 Nov 2022',
    '29 Sep 2022',
    '17 Aug 2022',
    '19 Sep 2022',
  ];
  List fila = [
    '\$8.99',
    '\$4.99',
    '\$12.45',
    '\$99.99',
    '\$233.45',
    '\$37.56',
  ];

  List car = [
    const Color(0xffB0E4C8),
    const Color(0xffB0E4C8),
    const Color(0xffF8BEC1),
    const Color(0xffF8BEC1),
    const Color(0xffB0E4C8),
    const Color(0xffB0E4C8),
  ];

  List caar = [
    'Active',
    'Active',
    'Blocked',
    'Blocked',
    'Active',
    'Active',
  ];
  List caarr = [
    'assets/cd.svg',
    'assets/cd.svg',
    'assets/minus-cirlce.svg',
    'assets/minus-cirlce.svg',
    'assets/cd.svg',
    'assets/cd.svg',
  ];

  List carrr = [
    '\$968.66',
    '\$243.63',
    '\$222.99',
    '\$199.99',
    '\$968.66',
    '\$243.63',
  ];
  List carrr1 = [
    '\$249.99',
    '\$99.99',
    '\$229.99',
    '\$29.99',
    '\$249.99',
    '\$99.99',
    '\$229.99',
  ];
  List cards = [
    'assets/Mocard 8.png',
    'assets/Mocard 30.png',
    'assets/Mocard 17.png',
    'assets/Mocard 30.png',
    'assets/Mocard 8.png',
    'assets/Mocard 30.png',
  ];

  List x = [
    '3445 **** **** 0958',
    '2566 **** **** 4567',
    '5677 **** **** 2456',
  ];

  List fin2 = [
    'assets/visa.png',
    'assets/mastercard.png',
    'assets/citi.png',
  ];
  List ver = [
    'All',
    'On Route',
    'Prepared',
    'Ready Shipping',
    'Completed',
  ];
  List varr = [
    '24',
    '8',
    '4',
    '16',
    '2',
  ];

  List vars = [
    'SP-34fg3321',
    'SP-34fg3322',
    'SP-34fg3323',
    'SP-34fg3324',
  ];

  List vaes1 = [
    'On Route',
    'Prepared',
    'Ready Shipping',
    'Completed',
  ];
  List vaes2 = [
    const Color(0xff7DC066),
    const Color(0xffF3935D),
    const Color(0xff727880),
    const Color(0xff59B4D1),
  ];
  List versi = [
    const Color(0xffE6F9EF),
    const Color(0xffFDF0E9),
    const Color(0xffF5EDFD),
    const Color(0xffEAF6FC),
  ];

  List version = [
    '22 May 11:02 PM',
    '24 Dec 14:03 AM',
    '12 Nov 01:33 AM',
    '23 Dec 18:44 AM',
  ];
  List version1 = [
    '23 Dec 18:44 AM',
    '22 May 11:02 PM',
    '24 Dec 14:03 AM',
    '12 Nov 01:33 AM',
  ];

  List version2 = [
    '12 Km',
    '44 Km',
    '32 Km',
    '22 Km',
  ];
  List version3 = [
    'assets/avatar-6 1.png',
    'assets/avatar-7 1.png',
    'assets/avatar-8 1.png',
    'assets/Avatar62.png',
  ];
  List verion = [
    'Rahul Kohli',
    'Akshay Kumar',
    'Harsha Agrawal',
    'Mahavir Agrawal',
  ];
  List Verion1 = [
    'International',
    'Peterbilt',
    'Kenworth',
    'International',
  ];
  List veri = [
    'assets/Media21.png',
    'assets/Media22.png',
    'assets/Media23.png',
    'assets/Media24.png',
    'assets/Media25.png',
    'assets/Media22.png',
    'assets/Media23.png',
    'assets/Media24.png',
    'assets/Media25.png',
  ];
  List map = [
    '44 Udhana Street',
    'BHAGYALAXMI Street',
    '22 Vrundavan Street',
    'Murlidhar Heights',
    '23 Barby Hill',
    'BHAGYALAXMI Street',
    '22 Vrundavan Street',
    'Murlidhar Heights',
    '23 Barby Hill',
  ];
  List map1 = [
    '11 May 01:23 PM',
    '22 May 23:55 PM',
    '21 Nov 08:33 PM',
    '08 Dec 07:53 PM',
    '17 Aug 04:21 PM',
    '11 May 01:23 PM',
    '22 May 23:55 PM',
    '21 Nov 08:33 PM',
    '08 Dec 07:53 PM',
    '17 Aug 04:21 PM',
  ];

  List detcol = [
    const Color(0xff59B4D1),
    const Color(0xffA9DDF5),
    const Color(0xffD9B7FB),
    const Color(0xffFFC9AC),
    const Color(0xff000000),
    Colors.greenAccent,
  ];

  List Ver = [
    'assets/avatar-6 1.png',
    'assets/avatar-7 1.png',
    'assets/avatar-8 1.png',
    'assets/artist.png',
    'assets/avatar-1-51c6502a 1.png',
    'assets/avatar-6 1.png',
    'assets/avatar-7 1.png',
    'assets/avatar-8 1.png',
    'assets/artist.png',
    'assets/avatar-1-51c6502a 1.png',
  ];
  List Ver1 = [
    'Ananya Ishana',
    'Rahul Kohli',
    'Akshay Kumar',
    'Harsha Agrawal',
    'Mahavir Agrawal',
    'Kavya Sharma',
    'Rahul Kohli',
    'Akshay Kumar',
    'Harsha Agrawal',
    'Mahavir Agrawal',
  ];
  List Ver2 = [
    '2h 10m',
    '8h 16m',
    '12h 18m',
    '22h 23m',
    '12h 34m',
    '12h 10m',
    '18h 20m',
    '14h 34m',
    '19h 22m',
    '18h 12m',
  ];
  List Ver3 = [
    '23',
    '24',
    '67',
    '90',
    '193',
    '56',
    '67',
    '76',
    '45',
    '34',
  ];
  List Ver4 = [
    '56Km',
    '12Km',
    '66Km',
    '34Km',
    '64Km',
    '123Km',
    '45Km',
    '234Km',
    '233Km',
    '23m',
  ];

  List Ver5 = [
    const Color(0xffE6F9EF),
    const Color(0xffF5EDFD),
    const Color(0xffE6F9EF),
    const Color(0xffF5EDFD),
    const Color(0xffFAEBEC),
    const Color(0xffE6F9EF),
    const Color(0xffF5EDFD),
    const Color(0xffE6F9EF),
    const Color(0xffF5EDFD),
    const Color(0xffFAEBEC),
  ];

  List Ver6 = [
    'On Route',
    'Parked',
    'On Route',
    'Parked',
    'Mantaince',
    'On Route',
    'Parked',
    'On Route',
    'Parked',
    'Mantaince',
  ];

  List Ver7 = [
    const Color(0xff7DC066),
    const Color(0xff9E57E5),
    const Color(0xff7DC066),
    const Color(0xff9E57E5),
    const Color(0xffE5646C),
    const Color(0xff7DC066),
    const Color(0xff9E57E5),
    const Color(0xff7DC066),
    const Color(0xff9E57E5),
    const Color(0xffE5646C),
  ];

  List Wor = [
    'Research potential tradeshows',
    'Develop tradeshow promotions',
    'Develop PR strategy',
  ];
  List Wor1 = [
    const Color(0xffEAF6FC),
    const Color(0xffE6F9EF),
    const Color(0xffFAEBEC),
  ];
  List Worcol = [
    const Color(
      0xff727880,
    ),
    const Color(0xff7DC066),
    const Color(0xffE5646C),
  ];
  List Wor3 = [
    'New Feature',
    'Research',
    'Fix Bugs',
  ];
  List Wor4 = [
    '11 days left',
    '26 days left',
    '12 days left',
  ];
  List Wor5 = [
    const Color(0xff7DC066),
    const Color(0xffF3935D),
    const Color(0xff7DC066),
  ];
  List War6 = [
    '4',
    '2',
    '8',
  ];
  List War7 = [
    '6',
    '4',
    '8',
  ];
  List War8 = [
    'Review booth resource\nnumber limitations',
    'Product Design\nAssinment',
    'Wipe down and \ndisinfect countertops',
  ];
  List war = [
    'Fix Bugs',
    'Research',
    'New Feature',
  ];
  List Wor11 = [
    const Color(0xffFAEBEC),
    const Color(0xffE6F9EF),
    const Color(0xffEAF6FC),
  ];
  List Worcol1 = [
    const Color(0xffE5646C),
    const Color(
      0xff727880,
    ),
    const Color(0xff7DC066),
  ];
  List War12 = [
    'Expired 3 days',
    '11 days left',
    '17 days left',
  ];
  List War13 = [
    'assets/ticket-expired.png',
    'assets/tag-right.png',
    'assets/tag-right.png',
  ];
  List war2 = [
    'Various versions have evolved over ',
    'repeat predefined chunks as necessary',
    'avoids a produces no resultant pleasure',
  ];
  List ver1 = [
    '3/21',
    '4/22',
    '6/28',
  ];
  List ver2 = [
    'June 21',
    'Nov 11',
    'Aug 18',
  ];
  List ver3 = [
    '6',
    '3',
    '9',
  ];
  List dis = [
    'In particular, the garbled words of lorem ipsum bear an unmistakable',
    'mystery, with competing theories and timelines.',
    'the industry standard dummy text ever since some printer',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
    ' Duis nunc eros, mattis at dui ac, convallis semper risus',
    ' Twho may be, let him love fellows of a polecat. Now amour',
  ];
  List dis1 = [
    'Dec 22, 2020 02:34',
    'Nov 25, 2024 03:43',
    'Dec 27, 2020 02:34',
    'Dec 25, 2021 06:11',
    'Aug 28, 2020 02:34',
    'Dec 12, 2028 07:22',
  ];
  List dis2 = [
    'I’ve heard the argument that “lorem ipsum” is effective in wireframing or design because ',
    'Lorem ipsum is so ubiquitous because it is so versatile. Select how many paragraphs you ',
    'You want them wondering why you filled their website with a foreign language',
    ' Served all day. “Bacon ipsum dolor amet chicken turducken spare ribs.',
    'So there you have it. Lorem ipsum: the nonsense words unable to fully escape meaning.',
    'On the other hand, we denounce with righteous indignation and dislike men',
  ];
  List dis3 = [
    '#45678645',
    '#56895868',
    '#56789077',
    '#69363343',
    '#67890794',
    '#74474744',
  ];
  List dis4 = [
    const Color(0xffE5646C),
    const Color(
      0xff727880,
    ),
    const Color(0xff7DC066),
    const Color(0xffE5646C),
    const Color(
      0xff727880,
    ),
    const Color(0xff7DC066),
  ];
  List dis5 = [
    const Color(0xffFAEBEC),
    const Color(0xffE6F9EF),
    const Color(0xffEAF6FC),
    const Color(0xffFAEBEC),
    const Color(0xffE6F9EF),
    const Color(0xffEAF6FC),
  ];
  List dis6 = [
    'New',
    'Opened',
    'Resolved ',
    'In Progress',
    'New',
    'Opened',
  ];
  List dis7 = [
    '4',
    '5',
    '4',
    '8',
    '3',
    '2',
  ];
  List dis8 = [
    'assets/avatar-6 1.png',
    'assets/avatar-7 1.png',
    'assets/avatar-8 1.png',
    'assets/avatar-8 1.png',
    'assets/avatar-7 1.png',
    'assets/avatar-6 1.png',
  ];
  List dis9 = [
    'Ananya Ishana',
    'Rahul Kohli',
    'Akshay Kumar',
    'Harsha Agrawal',
    'Mahavir Agrawal',
    'Kavya Sharma',
  ];
  List dis10 = [
    '1 day ago',
    '10 January 2022',
    '20 January 2026',
    '11 April 2022',
    '3 day ago',
    '10 day ago',
  ];
  List user = [
    const Color(0xffE5646C),
    const Color(0xffE5646C),
    const Color(0xff9E57E5),
    const Color(0xff9E57E5),
    const Color(0xff7DC066),
    const Color(0xff7DC066),
  ];
  List user1 = [
    'Opening',
    'Opening',
    'In Progress',
    'In Progress',
    'Resolved',
    'Resolved',
  ];
  List user2 = [
    'Today 8:30 am',
    'Yesterday 9:00 am',
    'Yesterday 6:30 am',
    'Yesterday 2:40 am',
    'Yesterday 4:44 am',
    '08 March 2:33 am',
  ];
  List user3 = [
    '#SP-3456764',
    '#SP-5744847',
    '#SP-9594747',
    '#SP-9756444',
    '#SP-2345645',
    '#SP-4535555',
  ];
  List user4 = [
    'In particular, the garbled words of lorem  unmistakable',
    'mystery, with competing theories and timelines.',
    'the industry standard dummy text ever since some printer',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
    'Duis nunc eros, mattis at dui ac, convallis semper risus',
    'who may be, let him love fellows of a polecat. Now amour',
  ];
  List User = [
    'Getting Started',
    'Start with evcp',
    'Management Components',
    'Auto Resize Layouts',
    'How can copy artboards?',
    'How much price plans?',
    'Where I can dowload it?',
    'evcp Support 24/7',
  ];
  List User1 = [
    const Color(0xffD9B7FB),
    const Color(0xffB0E4C8),
    const Color(0xffB0E4C8),
    const Color(0xffD9B7FB),
  ];
  List User2 = [
    'In Progress',
    'Resolved',
    'Resolved',
    'In Progress',
  ];
  List User3 = [
    'They will be inexorably drawn to it',
    'Fully unlicensed legalese for those times you ',
    'Leveraging agile frameworks to provide a robust synopsis',
    'Bacon ipsum dolor amet chicken turducken spare ribs.',
  ];
  List User4 = [
    'Its like the props in a furniture store—filler text makes it look like someone is home.',
    'Second, use lorem ipsum if you think the placeholder text will be too distracting.',
    'One word of caution: make sure your client knows that lorem ipsum is filler text.',
    'language, and you certainly dont want anyone prematurely publishing it.',
    'It is a long established fact that a reader will be distracted by the readable content',
    ' which dont look even slightly believable. If you are going to use a passage',
  ];
  List User5 = [
    'Opened',
    'On Hold',
    'Opened',
    'On Hold',
  ];
  List File = [
    'assets/direct.png',
    'assets/timer.png',
    'assets/heart.png',
    'assets/share.png',
    'assets/google1.png',
    'assets/dropbox.png',
    'assets/microsoft-colored.png',
    'assets/security-safe.png',
    'assets/trash1.png',
  ];

  List File1 = [
    '45',
    '256',
    '464',
    '654',
    '22',
    '556',
    '235',
    '78',
    '955',
  ];
  List File2 = [
    'My Files',
    'Recent',
    'Favorites',
    'Share with me',
    'Google Drive',
    'Dropbox',
    'One Drive',
    'Private',
    'Trash',
  ];
  List File3 = [
    'assets/pdf1.png',
    'assets/pdf1.png',
    'assets/folder-colored.png',
    'assets/pdf1.png',
    'assets/pdf1.png',
    'assets/folder-colored.png',
  ];

  List File4 = [
    'Advance Components',
    'Advance Components',
    'nahps-3817.html',
    'Preview Screen',
    'Screen-Capture',
    'DCS_1543.png',
  ];

  List File5 = [
    '315 Kb',
    '34,4 Mb',
    '2,24 Gb',
    '12 files',
    '1,23 Gb',
    '13 files',
  ];
  List File6 = [
    'assets/folder-colored.png',
    'assets/folder-colored.png',
    'assets/folder-colored.png',
    'assets/folder-colored.png',
    'assets/folder-colored.png',
    'assets/folder-colored.png',
    'assets/folder-colored.png',
    'assets/folder-colored.png',
    'assets/folder-colored.png',
  ];
  List File7 = [
    '344 files',
    '333 files',
    '32 files',
    '65 files',
    '76 files',
    '678 files',
    '22 files',
    '78 files',
    '22 files',
  ];
  List File8 = [
    'evcp Screen',
    'evcp Figma',
    'Images Random',
    'Avatars & Brands',
    'Preview',
    'Avatars & Brands',
    'Images Random',
    'Avatars & Brands',
    'Preview',
  ];
  List File9 = [
    'assets/pdf1.png',
    'assets/pdf1.png',
    'assets/pdf1.png',
    'assets/pdf1.png',
    'assets/pdf1.png',
    'assets/pdf1.png',
  ];

  List File10 = [
    'assets/folder-colored.png',
    'assets/folder-colored.png',
    'assets/psd12.png',
    'assets/pdf1.png',
    'assets/pdf1.png',
    'assets/png.png',
    'assets/pdf1.png',
    'assets/psd12.png',
    'assets/png.png',
    'assets/pdf1.png',
    'assets/psd12.png',
    'assets/pdf1.png',
    'assets/pdf1.png',
    'assets/png.png',
    'assets/pdf1.png',
    'assets/psd12.png',
  ];
  List File11 = [
    '344 files',
    '333 files',
    '32 files',
    '65 files',
    '76 files',
    '678 files',
    '22 files',
    '78 files',
    '22 files',
    '333 files',
    '32 files',
    '65 files',
    '76 files',
    '678 files',
    '22 files',
    '42 files',
  ];
  List File12 = [
    'evcp Screen',
    'evcp Figma',
    'Images Random',
    'Avatars & Brands',
    'Preview',
    'Avatars & Brands',
    'Images Random',
    'Avatars & Brands',
    'Preview',
    'evcp Figma',
    'Images Random',
    'Avatars & Brands',
    'Preview',
    'Avatars & Brands',
    'evcp Screen',
    'evcp Figma',
  ];
  List so = [
    'assets/avatar-6 1.png',
    'assets/avatar-7 1.png',
    'assets/avatar-8 1.png',
  ];
  List so1 = [
    'Ananya Ishana',
    'Rahul Kohli',
    'Akshay Kumar',
  ];
  List so2 = [
    'Its like the props in a furniture store text makes it look like someone is home.',
    'Second, use lorem ipsum if you think the placeholder text will be too distracting.',
    'One word of caution: make sure your client knows that lorem ipsum is filler text.',
  ];
  List so3 = [
    'assets/avatar-6 1.png',
    'assets/avatar-7 1.png',
    'assets/avatar-8 1.png',
    'assets/avatar-7 1.png',
    'assets/avatar-8 1.png',
  ];
  List so4 = [
    'Ananya Ishana',
    'Rahul Kohli',
    'Akshay Kumar',
    'Harsha Agrawal',
    'Mahavir Agrawal',
  ];
  List so5 = [
    '12 mutuals',
    '22 mutuals',
    '42 mutuals',
    '05 mutuals',
    '39 mutuals',
  ];

  List so6 = [
    'assets/avatar-6 1.png',
    'assets/avatar-7 1.png',
    'assets/Avatar62.png',
    'assets/avatar-8 1.png',
    'assets/artist.png',
    'assets/avatar-1-51c6502a 1.png',
    'assets/Avatar62.png',
    'assets/download 1.png',
  ];
  List so7 = [
    'Ananya Ishana',
    'Rahul Kohli',
    'Akshay Kumar',
    'Harsha Agrawal',
    'Mahavir Agrawal',
    'Kavya Sharma',
    'Rahul Kohli',
    'Akshay Kumar',
  ];
  List so8 = [
    'Entry Level Computer Engineer',
    'Salesforce Administrator',
    'process of planning',
    'Fully unlicensed ',
    'Not to mention,',
    'Coming full circle',
    'Lord of All Things Technical',
    'Techno-Bull',
  ];
  List com = [
    'Field Sales Professional (AE/SE)',
    'Med Surg Registered Nurse - Salary up to \$130k',
    'Hematology Registered Nurse - Salary up to \$187k',
    'Cardiovascular Intensive Care Unit (ICU) Registered Nurse (RN)',
    'Intensive Care Unit Registered Nurse / ICU RN (Permanent Roles)',
  ];
  List com1 = [
    'assets/Brand Logo11.png',
    'assets/Brand Logo25.png',
    'assets/Brand Logo21.png',
  ];
  List com2 = [
    'FedEx Express',
    'FedEx Ground',
    'Truck Transportation',
  ];
  List com3 = [
    'network have been connecting',
    'shipping, transportation',
    'expertise and reliability',
  ];
  List Mem = [
    'assets/Media(2).png',
    'assets/Media(4).png',
    'assets/Media.png',
    'assets/Media2.png',
    'assets/Media(4).png',
  ];
  List Cus = [
    'My Account',
    'Orders History',
    'Your Address',
    'Payment Methods',
    'Favorite Products',
  ];
  List mail4 = [
    'assets/avatar-6 1.png',
    'assets/Avatar62.png',
    'assets/avatar-7 1.png',
    'assets/avatar-8 1.png',
  ];
  List mail5 = [
    '12 minutes ago',
    '22 minutes ago',
    '42 minutes ago',
    '05 minutes ago',
  ];
  List mail6 = [
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ',
    'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim laborum',
    'Various versions have evolved over the years, sometimes by accident, sometimes on purpose',
    'If you are going to use a passage of Lorem Ipsum, you need to be sure there is anything embarrassing hidden in the middle of text.',
  ];
  List mail7 = [
    'assets/document.svg',
    'assets/gallery.svg',
    'assets/document.svg',
    'assets/gallery.svg',
  ];
  List mail8 = [
    'Document.docx',
    'Error Dashboard.png',
    'Document.docx',
    'Error Dashboard.png',
  ];
  List mail9 = [
    '2.09 MB',
    '4.09 MB',
    '0.09 MB',
    '2.29 MB',
  ];
  List pro = [
    'Total Tasks',
    'Completed Task',
    'Overdue Task',
    'Comming Task',
    'Members',
    'Leaders',
    'Total Hours',
    'Overtime Hours',
  ];
  List pro1 = [
    '2,444',
    '12',
    '4,655',
    '356',
    '6,653',
    '9,456',
    '23',
    '5,345',
  ];

  List pro2 = [
    const Color(0xffFAEBEC),
    const Color(0xffE6F9EF),
    const Color(0xffE6F9EF),
    const Color(0xffFAEBEC),
    const Color(0xffFAEBEC),
    const Color(0xffE6F9EF),
    const Color(0xffE6F9EF),
    const Color(0xffFAEBEC),
  ];
  List pro3 = [
    '-3.34%',
    '2.45%',
    '4.54%',
    '-1.44%',
    '-5.65%',
    '3.76%',
    '2.54%',
    '-4.44%',
  ];
  List pro4 = [
    const Color(0xffE5646C),
    const Color(0xff7DC066),
    const Color(0xff7DC066),
    const Color(0xffE5646C),
    const Color(0xffE5646C),
    const Color(0xff7DC066),
    const Color(0xff7DC066),
    const Color(0xffE5646C),
  ];
  List popo = [
    'assets/messenger2.png',
    'assets/user.png',
    'assets/sms1.png',
  ];
  List popo1 = [
    'Admin Dashboard Template',
    'admin dashboard UI Kit',
    'the premium admin ',
  ];
  List popo2 = [
    '3 hrs ago',
    '1 hrs ago',
    '1 day ago',
  ];
  List Popo = [
    'assets/avatar-6 1.png',
    'assets/avatar-7 1.png',
    'assets/avatar-8 1.png',
  ];
  List Popo1 = [
    'Rahul Kohli',
    'Akshay Kumar',
    'Harsha Agrawal',
  ];
  List Popo2 = [
    'English ',
    'Australian',
    'Spanish',
    'French',
    'German',
  ];

  List grid = [
    'assets/row-vertical.svg',
    'assets/element-3.svg',
  ];

  List Vers1 = [
    'Tracking Routes',
    'Vehicles',
    'Analytics',
    'Warehouse',
  ];
  List Vers2 = [
    'assets/routing-2.svg',
    'assets/truck.svg',
    'assets/chart.svg',
    'assets/house.svg',
  ];
}
