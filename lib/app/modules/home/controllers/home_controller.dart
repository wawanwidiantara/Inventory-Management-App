import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:jendral_muda_app/app/constans/url.dart';
import 'package:jendral_muda_app/app/data/models/item_model.dart';

class HomeController extends GetxController {
  final RxList<Item> items = <Item>[].obs;
  final isLoading = false.obs;
  final user = GetStorage().read('user_name');

  @override
  void onInit() {
    super.onInit();
    fetchItems();
  }

  Future<void> fetchItems({String name = ''}) async {
    isLoading.value = true;
    try {
      final token = GetStorage().read('token');
      final response = await http.get(
        Uri.parse('${UrlApi.baseAPI}/api/products?name=$name'),
        headers: {'Authorization': token},
      );

      if (response.statusCode == 200) {
        // print(response.body);
        final List<dynamic> data = json.decode(response.body)['data'];
        print(data);
        items.value = data.map((json) {
          final item = Item.fromJson(json);
          // item.image = '${UrlApi.baseAPI}/${item.image}';
          return item;
        }).toList();
      } else {
        items.clear();
        print('Failed to load items: ${response.statusCode}');
      }
    } catch (e) {
      items.clear();
      print('Error fetching items: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
