import 'package:flutter/material.dart';
import 'package:shamo_mobile/models/cart_model.dart';
import 'package:shamo_mobile/theme.dart';

class CheckoutCard extends StatefulWidget {
  final CartModel cart;
  const CheckoutCard({Key? key, required this.cart}) : super(key: key);

  @override
  State<CheckoutCard> createState() => _CheckoutCardState();
}

class _CheckoutCardState extends State<CheckoutCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        color: bgColor4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(widget.cart.product.galleries[0].url),
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.cart.product.name,
                  style: primaryTextStyle.copyWith(fontWeight: semiBold),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  width: 2,
                ),
                Text(
                  "\$${widget.cart.product.price}",
                  style: priceTextStyle,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 2,
          ),
          Text(
            "${widget.cart.quantity} Items",
            style: secondaryTextStyle.copyWith(fontSize: 16),
          )
        ],
      ),
    );
  }
}
