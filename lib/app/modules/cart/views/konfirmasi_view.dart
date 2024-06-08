import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jendral_muda_app/app/constans/colors.dart';
import 'package:jendral_muda_app/app/modules/cart/controllers/konfirmasi_controller.dart';

class KonfirmasiView extends GetView {
  const KonfirmasiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(KonfirmasiController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Konfirmasi Pesanan',
          style: TextStyle(color: AppColors.mainBackground),
        ),
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColors.mainBackground),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text('Nama Pembeli',
                    style: TextStyle(
                        fontSize: 14,
                        color: AppColors.primaryBlack,
                        fontWeight: FontWeight.w500)),
                const SizedBox(height: 16),
                SizedBox(
                  child: TextFormField(
                    controller: controller.nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama Pembeli tidak boleh kosong';
                      }
                      return null;
                    },
                    style: const TextStyle(
                        color: AppColors.primaryBlack,
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 24),
                      hintText: 'Masukkan nama pembeli',
                      hintStyle: const TextStyle(
                          color: AppColors.greyText,
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                      filled: true,
                      fillColor: AppColors.formFill,
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: AppColors.primaryBlack, width: 2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: AppColors.formFill),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text('No WA',
                    style: TextStyle(
                        fontSize: 14,
                        color: AppColors.primaryBlack,
                        fontWeight: FontWeight.w500)),
                const SizedBox(height: 16),
                SizedBox(
                  child: TextFormField(
                    controller: controller.whatsappController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'No WA tidak boleh kosong';
                      }
                      return null;
                    },
                    style: const TextStyle(
                        color: AppColors.primaryBlack,
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                    textAlignVertical: TextAlignVertical.center,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 24),
                      hintText: 'Masukkan no WA',
                      hintStyle: const TextStyle(
                          color: AppColors.greyText,
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                      filled: true,
                      fillColor: AppColors.formFill,
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: AppColors.primaryBlack, width: 2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: AppColors.formFill),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text('Alamat',
                    style: TextStyle(
                        fontSize: 14,
                        color: AppColors.primaryBlack,
                        fontWeight: FontWeight.normal)),
                const SizedBox(height: 8),
                SizedBox(
                  child: TextFormField(
                    controller: controller.addressController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Alamat tidak boleh kosong';
                      }
                      return null;
                    },
                    style: const TextStyle(
                      color: AppColors.primaryBlack,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 24),
                      hintText: 'Masukkan alamat',
                      hintStyle: const TextStyle(
                          color: AppColors.greyText,
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                      filled: true,
                      fillColor: AppColors.formFill,
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: AppColors.primaryBlack, width: 2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: AppColors.formFill),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 128),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: SizedBox(
          width: double.infinity,
          child: Obx(() {
            if (controller.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
                ),
              );
            } else {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  controller.confirmOrder();
                  FocusScope.of(context).unfocus();
                },
                child: const Text("Konfirmasi",
                    style: TextStyle(
                        color: AppColors.mainBackground,
                        fontSize: 14,
                        fontWeight: FontWeight.bold)),
              );
            }
          }),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
