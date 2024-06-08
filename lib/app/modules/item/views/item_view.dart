import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jendral_muda_app/app/constans/colors.dart';
import 'package:jendral_muda_app/app/modules/item/views/edit_item_view.dart';
import '../controllers/item_controller.dart';

class ItemView extends GetView<ItemController> {
  const ItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ItemController controller = Get.find<ItemController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Barang',
          style: TextStyle(color: AppColors.mainBackground),
        ),
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColors.mainBackground),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: Get.width,
              height: 200,
              decoration: BoxDecoration(
                color: AppColors.formFill,
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: NetworkImage(controller.item.image ?? ''),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              controller.item.name ?? '',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            Text(
              "Rp. ${controller.item.price}",
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Stok: ${controller.item.stock}",
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                SizedBox(
                  width: 35,
                  height: 35,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.decrement();
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                      backgroundColor:
                          const MaterialStatePropertyAll(AppColors.formFill),
                    ),
                    child: const Icon(Icons.remove),
                  ),
                ),
                Obx(
                  () => SizedBox(
                    width: 35,
                    child: Center(child: Text("${controller.count.value}")),
                  ),
                ),
                SizedBox(
                  width: 35,
                  height: 35,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.increment();
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                      backgroundColor: const MaterialStatePropertyAll(
                          AppColors.primaryColor),
                    ),
                    child: const Icon(Icons.add, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: Get.width * 0.68,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: controller.item.stock == 0
                      ? AppColors.formFill
                      : AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: controller.item.stock == 0
                    ? null
                    : () {
                        controller.addToCart();
                        FocusScope.of(context).unfocus();
                      },
                child: const Text(
                  "Tambah Keranjang",
                  style: TextStyle(
                    color: AppColors.mainBackground,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.formFill,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  // Navigate to EditItemView with the current item
                  Get.to(() => const EditItemView(),
                      arguments: controller.item);
                  FocusScope.of(context).unfocus();
                },
                child: const Icon(
                  Icons.edit,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
