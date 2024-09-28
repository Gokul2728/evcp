// ignore_for_file: prefer_const_constructors, file_names, camel_case_types
// ignore_for_file: deprecated_member_use
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:evcp/screen/E-commerce/Customers.dart';
import 'package:evcp/screen/E-commerce/Dashboard.dart';
import 'package:evcp/screen/E-commerce/Grid.dart';
import 'package:evcp/screen/E-commerce/Sellers.dart';
import 'package:evcp/screen/Finance/Finance.dart';
import 'package:evcp/screen/Logistic/Version2.dart';
import 'package:evcp/screen/Profile/Company.dart';
import 'package:evcp/screen/Profile/Member.dart';

import 'package:evcp/screen/Tables/Bordered_Tables.dart';
import 'package:evcp/screen/Tables/Splitted_Tables.dart';
import 'package:evcp/screen/Tables/CRM.dart';

import '../screen/Dashboard/Dashboard.dart';
import '../screen/Dashboard/Dashboard_Analytics.dart';
import '../screen/Dashboard/Dashboard_Crypto.dart';
import '../screen/Dashboard/Dashboard_Project Manager.dart';
import '../screen/E-commerce/Customer_Grid.dart';
import '../screen/E-commerce/Order_Detail.dart';
import '../screen/E-commerce/Orders.dart';
import '../screen/E-commerce/Product_Details.dart';
import '../screen/E-commerce/Products.dart';
import '../screen/E-commerce/Seller_Grid.dart';
import '../screen/File Manager/File Manager.dart';
import '../screen/HelpCenter/Discussion.dart';
import '../screen/HelpCenter/Simple.dart';
import '../screen/HelpCenter/User1.dart';
import '../screen/HelpCenter/User2.dart';
import '../screen/Logistic/Version1.dart';
import '../screen/Management/Version2.dart';
import '../screen/Management/Workspace.dart';
import '../screen/Messages/Business.dart';
import '../screen/Messages/Social.dart';
import '../screen/Messages/Supporter.dart';
import '../screen/Messages/Teamwork.dart';
import '../screen/Profile/Customer.dart';
import '../screen/Profile/Social.dart';
import '../screen/Tables/Striped_Tables.dart';
import '../screen/Tables/Tables_Basic.dart';
import '../screen/login/Account Info.dart';
import '../screen/login/Billing Details.dart';
import '../screen/login/Billing_Details_2.dart';
import '../screen/login/Choose Account.dart';
import '../screen/login/Forgot_Password.dart';
import '../screen/login/Verification.dart';
import '../screen/login/login.dart';
import '../screen/login/new_password.dart';
import '../screen/login/sign_up.dart';
import '../screen/mail/mail.dart';

class InboxController extends GetxController implements GetxService {
  int selectPage = 0;

  List page12 = [
    const Dashboard(), // 0
    const Dashboard(), // 1
    const Analytics(), // 2
    const Crypto(), // 3
    const ProjectManager(), // 4
    const BasicTables(), // 5
    const StripedTables(), // 6
    const BorderedTables(), // 7
    const CRMCustomer(),
    const SplittedTables(), // 8
    const Social(), // 9
    const Teamwork(), // 10
    const Business(), // 11
    const Supporter(), // 12
    const mail(), // 13
    const Dashboardpro(), // 14
    const products(), // 15
    const Details(), // 16
    const Grid(), // 17
    const Orders(), // 18
    const OrderDetail(), // 19
    const Customers(), // 20
    const CustomerGrid(), // 21
    const Sellers(), // 22
    const SellerGrid(), // 23
    const Finance(), // 24
    const Version1(), // 25
    const Version2(), // 26
    const Workspace(), // 27
    const Version21(), // 28
    const Simple(), // 29
    const Discussion(), // 30
    const User1(), // 31
    const User2(), // 32
    const FileManager(), // 33
    const Social1(), // 34
    const Company(), // 35
    const Member(), // 36
    const Customer(), // 37
    const login(), // 38
    const signup(), // 39
    const Verification(), // 40
    const ChooseAccount(), // 41
    const AccountInfo(), // 42
    const BillingDetails(), // 43
    const BillingDetails2(), // 44
    const ForgotPassword(), // 45
    const newpassword(), // 46
  ];
  int pageselecter = 0;
  setTextIsTrue(int value) {
    selectPage = value;
    update();
  }
}
