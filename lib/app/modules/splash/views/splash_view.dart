import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jendral_muda_app/app/constans/colors.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackground,
      body: Center(child: Image.asset('assets/images/logo.png')),
    );
  }
}
