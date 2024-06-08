import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jendral_muda_app/app/routes/app_pages.dart';

class SplashController extends GetxController {
  // final loginController = Get.put(AuthController());

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(Routes.LOGIN);
    });
    // var loginStatus = checkLogin();
    // loginStatus.then((value) {
    //   if (value) {
    //     Future.delayed(const Duration(seconds: 3), () {
    //       Get.offAllNamed(Routes.NAVBAR);
    //     });
    //   } else {
    //     Future.delayed(const Duration(seconds: 3), () {
    //       Get.offAllNamed(Routes.ON_BOARDING);
    //     });
    //   }
    // });
  }

  @override
  void onClose() {
    super.onClose();
  }

  // checkLogin() async {
  //   try {
  //     var url = Uri.parse("${UrlApi.baseAPI}/user/");
  //     var token = 'Bearer ${loginController.getStorage.read("access_token")}';

  //     final response = await http.get(
  //       url,
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //         'Authorization': token,
  //       },
  //     );
  //     if (response.statusCode == 200) {
  //       return true;
  //     } else {
  //       print(response.body);
  //       return false;
  //     }
  //   } catch (e) {
  //     print(e);
  //     return false;
  //   }
  // }
}
