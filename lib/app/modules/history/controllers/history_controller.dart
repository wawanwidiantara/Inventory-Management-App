import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:jendral_muda_app/app/constans/url.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class HistoryController extends GetxController {
  final orders = <Order>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchOrders();
  }

  Future<void> fetchOrders() async {
    try {
      isLoading.value = true;
      final token = GetStorage().read('token');
      final response = await http.get(
        Uri.parse('${UrlApi.baseAPI}/api/orders'),
        headers: {'Authorization': token},
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['data'];
        orders.value = data.map((json) => Order.fromJson(json)).toList();
      } else {
        print('Failed to load orders: ${response.statusCode}');
        Get.snackbar('Error', 'Failed to fetch orders');
      }
    } catch (e) {
      print('Error fetching orders: $e');
      Get.snackbar('Error', 'Failed to fetch orders: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> generateReport(int month, int year) async {
    isLoading.value = true;
    String formattedMonth = month.toString().padLeft(2, '0');
    print(month);
    print(formattedMonth);
    final token = GetStorage().read('token');
    final response = await http.get(
      Uri.parse(
          '${UrlApi.baseAPI}/api/orders/report?month=$formattedMonth&year=$year'),
      headers: {'Authorization': token},
    );

    if (response.statusCode == 200) {
      final bytes = response.bodyBytes;
      final dir = await getExternalStorageDirectory();
      final file = File('${dir?.path}/report_${formattedMonth}_$year.pdf');

      await file.writeAsBytes(bytes);

      Get.snackbar('Success', 'Report generated successfully');
      isLoading.value = false;
      OpenFile.open(file.path); // Open the PDF file
    } else {
      Get.snackbar('Error', 'Failed to generate report');
      print('Failed to generate report: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  }
}

class Order {
  String? id;
  String? userId;
  DateTime? createdAt;
  DateTime? isCheckedOut;
  String? customerName;
  String? customerPhone;
  String? customerAddress;
  int? totalPrice;

  Order({
    this.id,
    this.userId,
    this.createdAt,
    this.isCheckedOut,
    this.customerName,
    this.customerPhone,
    this.customerAddress,
    this.totalPrice,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      userId: json['userId'],
      createdAt: DateTime.parse(json['createdAt']),
      isCheckedOut: json['isCheckedOut'] != null
          ? DateTime.parse(json['isCheckedOut'])
          : null,
      customerName: json['customerName'],
      customerPhone: json['customerPhone'],
      customerAddress: json['customerAddress'],
      totalPrice: json['totalPrice'],
    );
  }
}
