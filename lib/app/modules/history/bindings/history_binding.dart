import 'package:get/get.dart';

import 'package:jendral_muda_app/app/modules/history/controllers/detail_history_controller.dart';

import '../controllers/history_controller.dart';

class HistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailHistoryController>(
      () => DetailHistoryController(),
    );
    Get.lazyPut<HistoryController>(
      () => HistoryController(),
    );
  }
}
