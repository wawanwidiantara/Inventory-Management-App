import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:jendral_muda_app/app/constans/url.dart';
import 'package:jendral_muda_app/app/data/models/transaction_model.dart';

class DetailHistoryController extends GetxController {
  final isLoading = false.obs;
  final transaction = Transaction().obs;

  final String orderId = Get.arguments as String;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    fetchOrderDetails(orderId);
  }

  @override
  void onReady() {
    super.onReady();
    fetchOrderDetails(orderId);
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> fetchOrderDetails(String orderId) async {
    try {
      isLoading.value = true;
      final token = GetStorage().read('token');
      final response = await http.get(
        Uri.parse('${UrlApi.baseAPI}/api/orders/$orderId'),
        headers: {'Authorization': token},
      );
      // print('response: ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body)['data'];
        transaction.value = Transaction.fromJson(data);
      } else {
        print('Failed to load order details: ${response.statusCode}');
        Get.snackbar('Error', 'Failed to fetch order details');
      }
    } catch (e) {
      print('Error fetching order details: $e');
      Get.snackbar('Error', 'Failed to fetch order details: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void increment() => count.value++;
}
