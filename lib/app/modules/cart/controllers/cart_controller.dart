import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:jendral_muda_app/app/constans/url.dart';
import 'package:jendral_muda_app/app/data/models/item_model.dart';

class CartController extends GetxController {
  final isLoading = false.obs;
  final cartItems = <CartItem>[].obs;
  final totalPrice = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCartItems();
  }

  Future<void> fetchCartItems() async {
    try {
      isLoading.value = true;
      final token = GetStorage().read('token');
      final response = await http.get(
        Uri.parse('${UrlApi.baseAPI}/api/orders/cart'),
        headers: {'Authorization': token},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body)['data'];
        totalPrice.value = data['totalPrice'];
        cartItems.value = (data['items'] as List)
            .map((item) => CartItem.fromJson(item))
            .toList();
      } else {
        Get.snackbar('Error', 'Failed to fetch cart items');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch cart items: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateCartItemQuantity(CartItem item, int newQuantity) async {
    isLoading.value = true;

    try {
      final token = GetStorage().read('token');
      final response = await http.post(
        Uri.parse('${UrlApi.baseAPI}/api/orderitems'),
        headers: {
          'Authorization': token,
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'productId': item.productId,
          'quantity': newQuantity,
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        fetchCartItems();
      } else {
        print('Failed to update cart item: ${response.statusCode}');
      }
    } catch (e) {
      print('Error updating cart item: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void incrementItemQuantity(CartItem item) {
    if (item.quantity < item.product!.stock!) {
      updateCartItemQuantity(item, item.quantity + 1);
    }
  }

  void decrementItemQuantity(CartItem item) {
    if (item.quantity > 1) {
      updateCartItemQuantity(item, item.quantity - 1);
    }
  }

  void deleteItem(CartItem item) {
    updateCartItemQuantity(item, 0);
  }

  Future<void> deleteCartItem(String itemId) async {
    isLoading.value = true;
    try {
      final token = GetStorage().read('token');
      final response = await http.delete(
        Uri.parse('${UrlApi.baseAPI}/api/orderitems/$itemId'),
        headers: {'Authorization': token},
      );

      if (response.statusCode == 200) {
        cartItems.removeWhere((item) => item.id == itemId);
      } else {
        print('Failed to delete cart item: ${response.statusCode}');
      }
    } catch (e) {
      print('Error deleting cart item: $e');
    } finally {
      isLoading.value = false;
    }
  }
}

class CartItem {
  String? id;
  String? orderId;
  String? productId;
  int quantity;
  int? price;
  Item? product;

  CartItem({
    this.id,
    this.orderId,
    this.productId,
    required this.quantity,
    this.price,
    this.product,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      orderId: json['orderId'],
      productId: json['productId'],
      quantity: json['quantity'],
      price: json['price'],
      product: json['product'] != null ? Item.fromJson(json['product']) : null,
    );
  }
}
