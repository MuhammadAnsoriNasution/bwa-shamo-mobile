import 'package:shamo_mobile/models/product_model.dart';

class CartModel {
  late int id;
  late ProductModel product;
  late int quantity;

  CartModel({required this.id, required this.product, required this.quantity});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product = ProductModel.fromJson(json['name']);
    quantity = json['quantiry'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': product.toJson(),
      'quantiry': quantity,
    };
  }

  double getTotalPrice() {
    return product.price * quantity;
  }
}
