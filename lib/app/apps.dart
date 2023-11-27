import 'package:daur_app/app/state_holders.dart';
import 'package:daur_app/interface/screen/splash_screen.dart';
import 'package:daur_app/interface/utils/app_style.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DaurApp extends StatefulWidget {
  static GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();

  const DaurApp({super.key});

  @override
  State<DaurApp> createState() => _DaurAppState();
}

class _DaurAppState extends State<DaurApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: DaurApp.globalKey,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      initialBinding: StateHoldersBindings(),
      debugShowCheckedModeBanner: false,
      title: "DaurApp",
      home: const SplashScreen(),
      theme: ThemeData(
        primarySwatch:
            MaterialColor(AppStyle.primaryColor.value, AppStyle().color),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppStyle.primaryColor),
              borderRadius: BorderRadius.circular(8)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppStyle.primaryColor)),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppStyle.primaryColor),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            textStyle: const TextStyle(
                fontSize: 16, letterSpacing: 2, fontWeight: FontWeight.w600),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 24),
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
    );
  }
}
