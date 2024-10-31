import 'package:jendral_muda_app/app/constans/url.dart';

class Item {
  String? id;
  String? name;
  int? price;
  String? image;
  int? stock;
  int? minStock;
  String? supplierId;

  Item(
      {this.id,
      this.name,
      this.price,
      this.image,
      this.stock,
      this.minStock,
      this.supplierId});

  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = (json['price'] is double)
        ? (json['price'] as double).toInt()
        : json['price'];
    image = json['image'] != null ? '${UrlApi.baseAPI}/${json['image']}' : null;
    stock = (json['stock'] is double)
        ? (json['stock'] as double).toInt()
        : json['stock'];
    minStock = (json['minStock'] is double)
        ? (json['minStock'] as double).toInt()
        : json['minStock'];
    supplierId = json['supplierId'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['image'] = image;
    data['stock'] = stock;
    data['minStock'] = minStock;
    data['supplierId'] = supplierId;
    return data;
  }
}
