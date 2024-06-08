import 'package:get/get.dart';

import 'package:jendral_muda_app/app/modules/cart/controllers/konfirmasi_controller.dart';

import '../controllers/cart_controller.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KonfirmasiController>(
      () => KonfirmasiController(),
    );
    Get.lazyPut<CartController>(
      () => CartController(),
    );
  }
}
