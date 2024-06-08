import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:jendral_muda_app/app/constans/url.dart';
import 'package:jendral_muda_app/app/data/models/supplier_model.dart';
import 'package:jendral_muda_app/app/modules/profile/views/supplier_view.dart';
import 'package:jendral_muda_app/app/routes/app_pages.dart';

class SupplierController extends GetxController {
  final RxList<Supplier> suppliers = <Supplier>[].obs;
  final Rx<Supplier?> currentSupplier = Rx<Supplier?>(null);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController contactPersonController = TextEditingController();
  final TextEditingController whatsappController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController nameController2 = TextEditingController();
  final TextEditingController contactPersonController2 =
      TextEditingController();
  final TextEditingController whatsappController2 = TextEditingController();
  final TextEditingController addressController2 = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final editStatus = false.obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchSuppliers();
  }

  Future<void> fetchSuppliers() async {
    try {
      final token = GetStorage().read('token');
      final response = await http.get(
        Uri.parse('${UrlApi.baseAPI}/api/suppliers'),
        headers: {'Authorization': token},
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['data'];
        suppliers.value = data.map((json) => Supplier.fromJson(json)).toList();
      } else {
        suppliers.clear();
        print('Failed to load suppliers: ${response.statusCode}');
      }
    } catch (e) {
      suppliers.clear();
      print('Error fetching suppliers: $e');
    }
  }

  Future<void> fetchSupplierDetails(String id) async {
    try {
      final token = GetStorage().read('token');
      final response = await http.get(
        Uri.parse('${UrlApi.baseAPI}/api/suppliers/$id'),
        headers: {'Authorization': token},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        currentSupplier.value = Supplier.fromJson(data['data']);
        nameController.text = currentSupplier.value?.name ?? '';
        contactPersonController.text =
            currentSupplier.value?.contactPerson ?? '';
        whatsappController.text = currentSupplier.value?.whatsapp ?? '';
        addressController.text = currentSupplier.value?.address ?? '';
      } else {
        currentSupplier.value = null;
        print('Failed to load supplier: ${response.statusCode}');
      }
    } catch (e) {
      currentSupplier.value = null;
      print('Error fetching supplier: $e');
    }
  }

  Future<void> updateSupplier(String id) async {
    try {
      final token = GetStorage().read('token');
      final updatedFields = {
        'name': nameController.text,
        'contactPerson': contactPersonController.text,
        'whatsapp': whatsappController.text,
        'address': addressController.text,
      };

      final response = await http.patch(
        Uri.parse('${UrlApi.baseAPI}/api/suppliers/$id'),
        headers: {
          'Authorization': token,
          'Content-Type': 'application/json',
        },
        body: json.encode(updatedFields),
      );

      Get.back();
      if (response.statusCode == 200) {
        Get.snackbar('Success', 'Supplier updated successfully');
        Get.off(() => SupplierView());
        editStatus.value = true;
      } else {
        print('Failed to update supplier: ${response.statusCode}');
        Get.snackbar('Error', 'Failed to update supplier');
      }
    } catch (e) {
      print('Error updating supplier: $e');
      Get.snackbar('Error', 'Failed to update supplier: $e');
    }
  }

  Future<void> addSupplier() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    isLoading.value = true;

    try {
      final token = GetStorage().read('token');
      final newSupplier = {
        'name': nameController2.text,
        'contactPerson': contactPersonController2.text,
        'whatsapp': whatsappController2.text,
        'address': addressController2.text,
      };

      final response = await http.post(
        Uri.parse('${UrlApi.baseAPI}/api/suppliers'),
        headers: {
          'Authorization': token,
          'Content-Type': 'application/json',
        },
        body: json.encode(newSupplier),
      );

      if (response.statusCode == 200) {
        Get.snackbar('Success', 'Supplier added successfully');
        Get.offAllNamed(Routes.NAVBAR, arguments: 3);
        nameController2.text = '';
        contactPersonController2.text = '';
        whatsappController2.text = '';
        addressController2.text = '';
      } else {
        print('Failed to add supplier: ${response.statusCode}');
        Get.snackbar('Error', 'Failed to add supplier');
      }
    } catch (e) {
      print('Error adding supplier: $e');
      Get.snackbar('Error', 'Failed to add supplier: $e');
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    contactPersonController.dispose();
    whatsappController.dispose();
    addressController.dispose();
    nameController2.dispose();
    contactPersonController2.dispose();
    whatsappController2.dispose();
    addressController2.dispose();
    super.onClose();
  }
}
