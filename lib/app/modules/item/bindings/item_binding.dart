import 'package:get/get.dart';

import '../controllers/item_controller.dart';

class ItemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ItemController>(
      () => ItemController(),
    );
  }
}
