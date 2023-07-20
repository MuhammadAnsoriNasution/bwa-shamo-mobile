import 'package:flutter/material.dart';
import 'package:shamo_mobile/models/cart_model.dart';
import 'package:shamo_mobile/services/transaction_services.dart';

class TransactionProvider with ChangeNotifier {
  Future<bool> checkout(
    String token,
    List<CartModel> cart,
    double totalPrice,
  ) async {
    try {
      if (await TransactionService().checkout(token, cart, totalPrice)) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      // print(e);
      return false;
    }
  }
}
