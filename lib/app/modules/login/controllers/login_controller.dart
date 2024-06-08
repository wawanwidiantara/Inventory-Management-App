import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:jendral_muda_app/app/constans/url.dart';
import 'dart:convert';

import 'package:jendral_muda_app/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController waController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final RxBool isLoading = false.obs;

  final GetStorage storage = GetStorage();

  Future<void> login() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    isLoading.value = true;

    const url = '${UrlApi.baseAPI}/api/users/login';

    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode({
        'whatsapp': waController.text,
        'password': passwordController.text,
      }),
    );

    isLoading.value = false;

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body)['data'];
      // Store user data
      storage.write('user_id', responseData['id']);
      storage.write('user_name', responseData['name']);
      storage.write('user_whatsapp', responseData['whatsapp']);
      // Store token separately
      storage.write('token', responseData['token']);

      // Handle successful login
      Get.offAndToNamed(Routes.NAVBAR);
    } else {
      // Handle error
      Get.snackbar('Error', 'Login failed');
    }
  }

  @override
  void onClose() {
    waController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
