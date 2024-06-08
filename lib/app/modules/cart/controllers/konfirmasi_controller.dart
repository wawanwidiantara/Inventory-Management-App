import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:jendral_muda_app/app/constans/url.dart';
import 'package:jendral_muda_app/app/routes/app_pages.dart';

class KonfirmasiController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController whatsappController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    nameController.dispose();
    whatsappController.dispose();
    addressController.dispose();
    super.onClose();
  }

  Future<void> confirmOrder() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    isLoading.value = true;

    final token = GetStorage().read('token');
    final response = await http.post(
      Uri.parse('${UrlApi.baseAPI}/api/orders/checkout'),
      headers: {
        'Authorization': token,
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'customerName': nameController.text,
        'customerPhone': whatsappController.text,
        'customerAddress': addressController.text,
      }),
    );

    isLoading.value = false;

    if (response.statusCode == 200 || response.statusCode == 201) {
      Get.snackbar('Success', 'Order confirmed successfully');
      Get.offAllNamed(Routes.NAVBAR,
          arguments: 1); // Navigate to home or appropriate page
    } else {
      Get.snackbar('Error', 'Failed to confirm order');
      print('Failed to confirm order: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  }
}
