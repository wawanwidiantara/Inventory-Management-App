import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jendral_muda_app/app/constans/colors.dart';
import 'package:jendral_muda_app/app/modules/history/views/detail_history_view.dart';
import 'package:mat_month_picker_dialog/mat_month_picker_dialog.dart';
import '../controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HistoryController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Riwayat',
          style: TextStyle(color: AppColors.mainBackground),
        ),
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
      ),
      backgroundColor: AppColors.mainBackground,
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.orders.isEmpty) {
          return const Center(child: Text('No orders found.'));
        }

        return RefreshIndicator(
          onRefresh: controller.fetchOrders,
          child: ListView.builder(
            padding:
                const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 80),
            itemCount: controller.orders.length,
            itemBuilder: (context, index) {
              final order = controller.orders[index];
              return GestureDetector(
                onTap: () {
                  Get.to(() => const DetailHistoryView(), arguments: order.id);
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
                            'ID: ${order.id?.substring(0, 10) ?? 'N/A'}',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Created at: ${order.createdAt?.toLocal().toString().split(' ')[0]}',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'Pembeli: ${order.customerName ?? 'N/A'}',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'Phone: ${order.customerPhone ?? 'N/A'}',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'Address: ${order.customerAddress ?? 'N/A'}',
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
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: () async {
                final picked = await showMonthPicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (picked != null) {
                  controller.generateReport(picked.month, picked.year);
                }
                FocusScope.of(context).unfocus();
              },
              child: const Text("Cetak Laporan",
                  style: TextStyle(
                      color: AppColors.mainBackground,
                      fontSize: 14,
                      fontWeight: FontWeight.bold))),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
