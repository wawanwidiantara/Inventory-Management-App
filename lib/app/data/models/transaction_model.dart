class Transaction {
  String? id;
  String? userId;
  String? createdAt;
  String? isCheckedOut;
  String? customerName;
  String? customerPhone;
  String? customerAddress;
  int? totalPrice;
  List<Items>? items;

  Transaction(
      {this.id,
      this.userId,
      this.createdAt,
      this.isCheckedOut,
      this.customerName,
      this.customerPhone,
      this.customerAddress,
      this.totalPrice,
      this.items});

  Transaction.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    createdAt = json['createdAt'];
    isCheckedOut = json['isCheckedOut'];
    customerName = json['customerName'];
    customerPhone = json['customerPhone'];
    customerAddress = json['customerAddress'];
    totalPrice = json['totalPrice'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items?.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['createdAt'] = createdAt;
    data['isCheckedOut'] = isCheckedOut;
    data['customerName'] = customerName;
    data['customerPhone'] = customerPhone;
    data['customerAddress'] = customerAddress;
    data['totalPrice'] = totalPrice;
    if (items != null) {
      data['items'] = items?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? id;
  String? orderId;
  String? productId;
  int? quantity;
  int? price;
  Product? product;

  Items(
      {this.id,
      this.orderId,
      this.productId,
      this.quantity,
      this.price,
      this.product});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['orderId'];
    productId = json['productId'];
    quantity = json['quantity'];
    price = json['price'];
    product =
        json['product'] != null ? Product?.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['orderId'] = orderId;
    data['productId'] = productId;
    data['quantity'] = quantity;
    data['price'] = price;
    if (product != null) {
      data['product'] = product?.toJson();
    }
    return data;
  }
}

class Product {
  String? id;
  String? name;
  int? price;
  String? image;
  int? stock;
  int? minStock;
  String? supplierId;

  Product(
      {this.id,
      this.name,
      this.price,
      this.image,
      this.stock,
      this.minStock,
      this.supplierId});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    image = json['image'];
    stock = json['stock'];
    minStock = json['minStock'];
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
