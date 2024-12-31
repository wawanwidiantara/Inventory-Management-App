import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'dart:io';
import 'package:jendral_muda_app/app/constans/url.dart';
import 'package:jendral_muda_app/app/data/models/supplier_model.dart';
import 'package:jendral_muda_app/app/routes/app_pages.dart';

class AddItemController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController stockController = TextEditingController();
  final TextEditingController minStockController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  final RxBool isLoading = false.obs;
  final Rx<File?> selectedImage = Rx<File?>(null);
  final RxList<Supplier> suppliers = <Supplier>[].obs;
  final Rx<Supplier?> selectedSupplier = Rx<Supplier?>(null);

  final GetStorage storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    fetchSuppliers();
  }

  Future<void> fetchSuppliers() async {
    try {
      final token = storage.read('token');
      final response = await http.get(
        Uri.parse('${UrlApi.baseAPI}/api/suppliers'),
        headers: {'Authorization': token},
      );
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['data'];
        suppliers.value = data.map((json) => Supplier.fromJson(json)).toList();
      } else {
        Get.snackbar('Error', 'Failed to fetch suppliers');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch suppliers: $e');
    }
  }

  Future<void> pickImage() async {
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        selectedImage.value = File(pickedFile.path);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to pick image: $e');
    }
  }

  Future<void> addItem() async {
    if (!formKey.currentState!.validate() ||
        selectedImage.value == null ||
        selectedSupplier.value == null) {
      Get.snackbar('Error', 'All fields, image, and supplier must be filled');
      return;
    }
    isLoading.value = true;

    final String baseUrl = UrlApi.baseAPI;
    final String endpoint = '/api/products';
    final String url = '$baseUrl$endpoint';

    final token = storage.read('token');

    final request = http.MultipartRequest('POST', Uri.parse(url))
      ..headers['Authorization'] = token
      ..fields['name'] = nameController.text
      ..fields['stock'] = stockController.text
      ..fields['minStock'] = minStockController.text
      ..fields['price'] = priceController.text
      ..fields['supplierId'] = selectedSupplier.value!.id!
      ..files.add(await http.MultipartFile.fromPath(
          'image', selectedImage.value!.path));

    final response = await request.send();

    isLoading.value = false;

    if (response.statusCode == 200 || response.statusCode == 201) {
      Get.snackbar('Success', 'Item added successfully');
      Get.offAllNamed(Routes.NAVBAR, arguments: 3); // Ensure this is called
    } else {
      print(response.statusCode);
      Get.snackbar('Error', 'Failed to add item');
    }
  }
}
