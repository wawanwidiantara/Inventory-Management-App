import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jendral_muda_app/app/constans/colors.dart';
import 'package:jendral_muda_app/app/modules/profile/views/add_supplier_view.dart';
import 'package:jendral_muda_app/app/modules/profile/views/edit_supplier_view.dart';
import '../controllers/supplier_controller.dart';

class SupplierView extends StatelessWidget {
  const SupplierView({super.key});

  @override
  Widget build(BuildContext context) {
    final SupplierController controller = Get.put(SupplierController());
    controller.fetchSuppliers();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tambah Supplier',
          style: TextStyle(color: AppColors.mainBackground),
        ),
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColors.mainBackground),
      ),
      body: Obx(() {
        if (controller.suppliers.isEmpty) {
          return const Center(child: Text('No suppliers found.'));
        }
        return RefreshIndicator(
          onRefresh: () async {
            await controller.fetchSuppliers();
          },
          child: ListView.builder(
            padding:
                const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 80),
            itemCount: controller.suppliers.length,
            itemBuilder: (context, index) {
              final supplier = controller.suppliers[index];
              return GestureDetector(
                onTap: () {
                  Get.to(() => EditSupplierView(supplierId: supplier.id!));
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: AppColors.formFill,
                      ),
                      color: AppColors.mainBackground,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(height: 16),
                          Text(
                            'Nama Supplier: ${supplier.name}',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Nama Penanggung Jawab: ${supplier.contactPerson}',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'No WA: ${supplier.whatsapp}',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddSupplierView());
        },
        backgroundColor: AppColors.primaryColor,
        child: const Icon(
          Icons.add,
          color: AppColors.mainBackground,
        ),
      ),
    );
  }
}
