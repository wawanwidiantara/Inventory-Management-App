import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jendral_muda_app/app/constans/colors.dart';
import 'package:jendral_muda_app/app/routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 72, left: 16, right: 16, bottom: 32),
              child: Container(
                height: 75,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.formFill),
                  color: AppColors.mainBackground,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Tunggal Listyanto",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("18.06/2045"),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              if (controller.items.isEmpty) {
                return const Center(child: Text('No items found.'));
              }

              return RefreshIndicator(
                onRefresh: controller.fetchItems,
                child: GridView.builder(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  itemCount: controller.items.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) {
                    final item = controller.items[index];
                    final bool isOutOfStock = item.stock == 0;
                    return InkWell(
                      onTap: () {
                        Get.toNamed(Routes.ITEM, arguments: item);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: isOutOfStock
                              ? Colors.grey.withOpacity(0.5)
                              : AppColors.mainBackground,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 100,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8),
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(item.image ?? ''),
                                  fit: BoxFit.cover,
                                  colorFilter: isOutOfStock
                                      ? ColorFilter.mode(
                                          Colors.black.withOpacity(0.5),
                                          BlendMode.darken)
                                      : null,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Stok: ${item.stock}",
                                    style: const TextStyle(fontSize: 10),
                                  ),
                                  Text(
                                    item.name ?? '',
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Rp. ${item.price}",
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
