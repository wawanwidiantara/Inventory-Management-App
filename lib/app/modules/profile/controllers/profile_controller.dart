import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jendral_muda_app/app/routes/app_pages.dart';

class ProfileController extends GetxController {
  final GetStorage storage = GetStorage();

  final RxString userName = ''.obs;
  final RxString userWhatsApp = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadUserData();
  }

  void loadUserData() {
    userName.value = storage.read('user_name') ?? 'Unknown User';
    userWhatsApp.value = storage.read('user_whatsapp') ?? 'Unknown WhatsApp';
  }

  void logout() {
    storage.erase(); // Clears all stored data
    Get.offAllNamed(Routes.LOGIN); // Navigates to the login screen
  }

  @override
  void onClose() {
    super.onClose();
  }
}
