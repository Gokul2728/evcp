import 'package:evcp/screen/Dashboard/Dashboard_main.dart';
import 'package:evcp/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:evcp/scrolling.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'confing/notifier.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyDi4YW6i80yOYmN6K8FXwnUARFTDQB5dwI",
        authDomain: "chargepartners-952c3.firebaseapp.com",
        projectId: "chargepartners-952c3",
        storageBucket: "chargepartners-952c3.appspot.com",
        messagingSenderId: "401169714985",
        appId: "1:401169714985:web:96caf3bbdee74e3660b138",
        measurementId: "G-7068MQE2HV"),
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ColorNotifier(),
        ),
      ],
      child: GetMaterialApp(
        title: "EVCP CRM",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: false,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          dividerColor: Colors.transparent,
        ),
        scrollBehavior: MyCustomScrollerBehavior(),
        // home: const Splash(),
        home: const HomeScreen(),
        // home:   Contact_Details_Screen(),
      ),
    );
  }
}
