import 'package:get/get.dart';

import 'package:jendral_muda_app/app/modules/profile/controllers/add_item_controller.dart';
import 'package:jendral_muda_app/app/modules/profile/controllers/supplier_controller.dart';

import '../controllers/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SupplierController>(
      () => SupplierController(),
    );
    Get.lazyPut<AddItemController>(
      () => AddItemController(),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
  }
}
