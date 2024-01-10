import 'package:craftybay/presentation/ui/screens/splashscreen.dart';
import 'package:craftybay/presentation/ui/utility/appcolor.dart';
import 'package:flutter/material.dart';

class craftyBay extends StatelessWidget {
  const craftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: MaterialColor(
          AppColors.primaryColor.value,
          AppColors.colorSwatch,
        ),
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
