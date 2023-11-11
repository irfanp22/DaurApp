import 'package:daur_app/interface/screen/auth/login_screen.dart';
import 'package:daur_app/interface/screen/main_bot_nav_screen.dart';
import 'package:daur_app/interface/utils/app_style.dart';
import 'package:daur_app/interface/utils/image_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String appVersion = '';

  @override
  void initState() {
    super.initState();
    _getAppVersion();
    _goToNextScreen();
  }

  Future<void> _goToNextScreen() async {
    Future.delayed(const Duration(seconds: 3)).then(
      (value) => true
          ? Get.offAll(() => const BottomNavBarScreen())
          : Get.to(() => LoginScreen()),
    );
  }

  Future<void> _getAppVersion() async {
    try {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      setState(() {
        appVersion = packageInfo.version;
      });
    } catch (e) {
      print("Error fetching app version: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Center(
            child: Column(
              children: [
                SvgPicture.asset(ImagesUtils.daurAppLogoSVG, width: 250),
                const SizedBox(height: 30),
                const Text(
                  "DaurApp",
                  style: TextStyle(
                    color: AppStyle.headTextColor,
                    fontWeight: FontWeight.w800,
                    fontSize: 40,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          const CircularProgressIndicator(),
          const SizedBox(height: AppStyle.defaultPadding),
          const Text(
            "DaurApp: Recycle, Earn, Renew",
            style: TextStyle(
                color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 13),
          ),
          const SizedBox(height: AppStyle.defaultPadding),
          Text("Version $appVersion"),
          const SizedBox(height: AppStyle.defaultPadding * 5),
        ],
      ),
    );
  }
}
