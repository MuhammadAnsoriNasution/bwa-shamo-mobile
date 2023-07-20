import 'dart:convert';

import 'package:shamo_mobile/models/cart_model.dart';
import 'package:http/http.dart' as http;

class TransactionService {
  String baseUrl = 'https://shamo-backend.buildwithangga.id/api';

  Future<bool> checkout(
    String token,
    List<CartModel> cart,
    double totalPrice,
  ) async {
    var url = Uri.parse('$baseUrl/checkout');
    // print(token);
    var headers = {
      "content-Type": "application/json",
      'Authorization': token,
    };
    var body = jsonEncode({
      'address': 'Marsemoon',
      'items': cart
          .map((e) => {'id': e.product.id, 'quantity': e.quantity})
          .toList(),
      'status': 'PENDING',
      'total_price': totalPrice,
      'shipping_price': 0
    });

    var response = await http.post(url, headers: headers, body: body);
    if (response.statusCode == 200) {
      return true;
    } else {
      // print(response.body);
      throw Exception('Gagal melakukan checkout');
    }
  }
}
