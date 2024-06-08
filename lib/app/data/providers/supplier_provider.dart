import 'package:get/get.dart';

import '../models/supplier_model.dart';

class SupplierProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Supplier.fromJson(map);
      if (map is List)
        return map.map((item) => Supplier.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Supplier?> getSupplier(int id) async {
    final response = await get('supplier/$id');
    return response.body;
  }

  Future<Response<Supplier>> postSupplier(Supplier supplier) async =>
      await post('supplier', supplier);
  Future<Response> deleteSupplier(int id) async => await delete('supplier/$id');
}
