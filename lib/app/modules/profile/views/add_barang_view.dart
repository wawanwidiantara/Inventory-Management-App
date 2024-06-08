import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jendral_muda_app/app/constans/colors.dart';
import 'package:jendral_muda_app/app/data/models/supplier_model.dart';
import '../controllers/add_item_controller.dart';

class AddBarangView extends GetView<AddItemController> {
  const AddBarangView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddItemController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tambah Barang',
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
                const SizedBox(height: 16),
                const Text('Nama Barang',
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
                        return 'Nama Barang tidak boleh kosong';
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
                      hintText: 'Masukkan nama barang',
                      hintStyle: const TextStyle(
                          color: AppColors.greyText,
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                      filled: true,
                      fillColor: AppColors.formFill,
                      focusColor: AppColors.mainBackground,
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
                const Text('Jumlah Stok',
                    style: TextStyle(
                        fontSize: 14,
                        color: AppColors.primaryBlack,
                        fontWeight: FontWeight.w500)),
                const SizedBox(height: 16),
                SizedBox(
                  child: TextFormField(
                    controller: controller.stockController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Jumlah Stok tidak boleh kosong';
                      }
                      return null;
                    },
                    style: const TextStyle(
                        color: AppColors.primaryBlack,
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                    textAlignVertical: TextAlignVertical.center,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 24),
                      hintText: 'Masukkan jumlah stok barang',
                      hintStyle: const TextStyle(
                          color: AppColors.greyText,
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                      filled: true,
                      fillColor: AppColors.formFill,
                      focusColor: AppColors.mainBackground,
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
                const Text('Minimal Stok',
                    style: TextStyle(
                        fontSize: 14,
                        color: AppColors.primaryBlack,
                        fontWeight: FontWeight.w500)),
                const SizedBox(height: 16),
                SizedBox(
                  child: TextFormField(
                    controller: controller.minStockController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Minimal Stok tidak boleh kosong';
                      }
                      return null;
                    },
                    style: const TextStyle(
                        color: AppColors.primaryBlack,
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                    textAlignVertical: TextAlignVertical.center,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 24),
                      hintText: 'Masukkan jumlah minimal stok barang',
                      hintStyle: const TextStyle(
                          color: AppColors.greyText,
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                      filled: true,
                      fillColor: AppColors.formFill,
                      focusColor: AppColors.mainBackground,
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
                const Text('Supplier',
                    style: TextStyle(
                        fontSize: 14,
                        color: AppColors.primaryBlack,
                        fontWeight: FontWeight.normal)),
                const SizedBox(height: 8),
                Obx(
                  () => DropdownButtonFormField<Supplier>(
                    value: controller.selectedSupplier.value,
                    items: controller.suppliers.map((Supplier supplier) {
                      return DropdownMenuItem<Supplier>(
                        value: supplier,
                        child: Text(supplier.name!),
                      );
                    }).toList(),
                    onChanged: (Supplier? newValue) {
                      controller.selectedSupplier.value = newValue;
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 24),
                      hintText: 'Pilih supplier barang',
                      hintStyle: const TextStyle(
                          color: AppColors.greyText,
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                      filled: true,
                      fillColor: AppColors.formFill,
                      focusColor: AppColors.mainBackground,
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
                    validator: (value) {
                      if (value == null) {
                        return 'Supplier tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 16),
                const Text('Harga',
                    style: TextStyle(
                        fontSize: 14,
                        color: AppColors.primaryBlack,
                        fontWeight: FontWeight.w500)),
                const SizedBox(height: 16),
                SizedBox(
                  child: TextFormField(
                    controller: controller.priceController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Harga tidak boleh kosong';
                      }
                      return null;
                    },
                    style: const TextStyle(
                        color: AppColors.primaryBlack,
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                    textAlignVertical: TextAlignVertical.center,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 24),
                      hintText: 'Masukkan harga barang',
                      hintStyle: const TextStyle(
                          color: AppColors.greyText,
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                      filled: true,
                      fillColor: AppColors.formFill,
                      focusColor: AppColors.mainBackground,
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
                const Text('Pilih Foto Barang',
                    style: TextStyle(
                        fontSize: 14,
                        color: AppColors.primaryBlack,
                        fontWeight: FontWeight.normal)),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () {
                    controller.pickImage();
                  },
                  child: Obx(
                    () => Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 24),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.formFill),
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.formFill,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            controller.selectedImage.value == null
                                ? 'Pilih foto'
                                : 'Foto terpilih',
                            style: const TextStyle(
                              color: AppColors.primaryBlack,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          const Icon(
                            Icons.camera_alt,
                            color: AppColors.primaryColor,
                          ),
                        ],
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
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: () {
                controller.addItem();
                FocusScope.of(context).unfocus();
              },
              child: Obx(() => controller.isLoading.value
                  ? const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                          AppColors.mainBackground),
                    )
                  : const Text("Tambah Barang",
                      style: TextStyle(
                          color: AppColors.mainBackground,
                          fontSize: 14,
                          fontWeight: FontWeight.bold)))),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
