import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:evcp/screen/login/login.dart';
import '../confing/notifier.dart';
import 'confing/image.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  late ColorNotifier notifire;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      // Navigator
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const login()));
    });
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifier>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.getbgcolor10,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AppContent.evcp,
                  height: 50,
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  "EVCP CRM ",
                  style: TextStyle(
                    color: notifire.getblackcolor,
                    fontWeight: FontWeight.w700,
                    fontSize: 35,
                    fontFamily: "InterMedium",
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Center(
                child: Transform.scale(
                    scale: 0.7,
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.transparent,
                      color: notifire.getblackcolor,
                      strokeWidth: 5,
                    ))),
          ],
        ),
      ),
    );
  }
}
