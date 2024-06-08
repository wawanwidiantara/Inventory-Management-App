import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:jendral_muda_app/app/constans/url.dart';
import 'dart:convert';
import 'package:jendral_muda_app/app/data/models/item_model.dart';
import 'package:jendral_muda_app/app/data/models/supplier_model.dart';
import 'package:jendral_muda_app/app/routes/app_pages.dart';

class ItemController extends GetxController {
  late Item item;
  final count = 1.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController stockController = TextEditingController();
  final TextEditingController minStockController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController supplierController = TextEditingController();

  final RxList<Supplier> suppliers = <Supplier>[].obs;
  final Rx<Supplier?> selectedSupplier = Rx<Supplier?>(null);

  @override
  void onInit() {
    super.onInit();
    item = Get.arguments;
    nameController.text = item.name ?? '';
    stockController.text = item.stock?.toString() ?? '';
    minStockController.text = item.minStock?.toString() ?? '';
    priceController.text = item.price?.toString() ?? '';
    supplierController.text = item.supplierId ?? '';
    fetchSuppliers();
  }

  void increment() {
    if (count.value < item.stock!) {
      count.value++;
    }
  }

  void decrement() {
    if (count.value > 1) {
      count.value--;
    }
  }

  Future<void> fetchSuppliers() async {
    final String baseUrl = UrlApi.baseAPI;
    final String endpoint = '/api/suppliers';
    final String url = '$baseUrl$endpoint';

    final token = GetStorage().read('token');
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': token,
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['data'];
        suppliers.value = data.map((json) => Supplier.fromJson(json)).toList();
        // Set the selected supplier based on the current item's supplierId
        selectedSupplier.value = suppliers.firstWhere(
          (s) => s.id == item.supplierId,
          orElse: () => Supplier(
              id: '',
              name: 'Unknown',
              contactPerson: '',
              whatsapp: '',
              address: ''),
        );
      } else {
        Get.snackbar('Error', 'Failed to fetch suppliers');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch suppliers: $e');
    }
  }

  void setSelectedSupplier(String? supplierId) {
    selectedSupplier.value = suppliers.firstWhere(
      (s) => s.id == supplierId,
      orElse: () => Supplier(
          id: '',
          name: 'Unknown',
          contactPerson: '',
          whatsapp: '',
          address: ''),
    );
  }

  Future<void> addToCart() async {
    final String baseUrl = UrlApi.baseAPI; // Ensure this is set correctly
    final String endpoint = '/api/orderitems';
    final String url = '$baseUrl$endpoint';

    final token = GetStorage().read('token');

    final body = json.encode({
      'productId': item.id,
      'quantity': count.value,
    });

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Authorization': token,
          'Content-Type': 'application/json',
        },
        body: body,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar('Success', 'Item added to cart successfully');
        Get.offAllNamed(Routes.NAVBAR, arguments: 1);
      } else {
        Get.snackbar('Error', 'Failed to add item to cart');
        print('Failed to add item to cart: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to add item to cart: $e');
      print('Error adding item to cart: $e');
    }
  }

  Future<void> updateItem() async {
    final String baseUrl = UrlApi.baseAPI;
    final String endpoint = '/api/products/${item.id}';
    final String url = '$baseUrl$endpoint';

    final token = GetStorage().read('token');

    final body = json.encode({
      'name': nameController.text,
      'stock': int.parse(stockController.text),
      'minStock': int.parse(minStockController.text),
      'price': int.parse(priceController.text),
      'supplierId': selectedSupplier.value?.id,
    });

    try {
      final response = await http.patch(
        Uri.parse(url),
        headers: {
          'Authorization': token,
          'Content-Type': 'application/json',
        },
        body: body,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar('Success', 'Item updated successfully');
        Get.offAllNamed(Routes.NAVBAR);
      } else {
        Get.snackbar('Error', 'Failed to update item');
        print('Failed to update item: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to update item: $e');
      print('Error updating item: $e');
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    stockController.dispose();
    minStockController.dispose();
    priceController.dispose();
    supplierController.dispose();
    super.onClose();
  }
}
