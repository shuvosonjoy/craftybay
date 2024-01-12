import 'package:craftybay/presentation/ui/screens/splashscreen.dart';
import 'package:craftybay/presentation/ui/utility/app_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class craftyBay extends StatelessWidget {
  const craftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppThemedata.lightThemeData,
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
