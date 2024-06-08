import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jendral_muda_app/app/constans/url.dart';
import 'package:http/http.dart' as http;
import 'package:jendral_muda_app/app/routes/app_pages.dart';

class RegisterController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController waController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final RxBool isLoading = false.obs;

  Future<void> register() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    isLoading.value = true;

    const url = '${UrlApi.baseAPI}/api/users';

    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode({
        'name': nameController.text,
        'whatsapp': waController.text,
        'password': passwordController.text,
      }),
    );

    isLoading.value = false;

    if (response.statusCode == 200 || response.statusCode == 201) {
      // Handle successful registration
      Get.offAndToNamed(Routes.LOGIN);
    } else {
      // Handle error
      Get.snackbar('Error', 'Registration failed');
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    waController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
