// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo_mobile/models/category_model.dart';
import 'package:shamo_mobile/models/message_model.dart';
import 'package:shamo_mobile/models/product_model.dart';
import 'package:shamo_mobile/provider/auth_provider.dart';
import 'package:shamo_mobile/services/messages_services.dart';
import 'package:shamo_mobile/theme.dart';
import 'package:shamo_mobile/widgets/chat_buble.dart';

class DetailChatScreen extends StatefulWidget {
  ProductModel product;
  DetailChatScreen({Key? key, required this.product}) : super(key: key);

  @override
  State<DetailChatScreen> createState() => _DetailChatScreenState();
}

class _DetailChatScreenState extends State<DetailChatScreen> {
  TextEditingController messageController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleMessage() async {
      await MessagesService().addMessage(
        authProvider.user,
        true,
        messageController.text,
        widget.product,
      );

      setState(() {
        widget.product = UninitializedProductModel(
          id: 0,
          name: '',
          price: 0,
          description: '',
          tags: '',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          category: CategoryModel(id: 0, name: ''),
          galleries: [],
        );
        messageController.text = '';
      });
    }

    PreferredSizeWidget header() {
      return PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: bgColor1,
          title: Container(
            padding: const EdgeInsets.only(
              top: 5,
            ),
            child: Row(
              children: [
                Image.asset(
                  "assets/image_shop_logo_online.png",
                  width: 40,
                ),
                const SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Shoe Store",
                      style: primaryTextStyle.copyWith(
                          fontWeight: medium, fontSize: 14),
                    ),
                    Text(
                      "Online",
                      style: secondaryTextStyle.copyWith(
                          fontWeight: light, fontSize: 14),
                    )
                  ],
                )
              ],
            ),
          ),
          centerTitle: false,
        ),
      );
    }

    Widget productReview() {
      return Container(
        width: 225,
        height: 74,
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: bgColor5,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: primaryColor),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                widget.product.galleries[0].url,
                width: 54,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.product.name,
                    style: primaryTextStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "\$${widget.product.price}",
                    style: priceTextStyle.copyWith(fontWeight: medium),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.product = UninitializedProductModel(
                    id: 0,
                    name: '',
                    price: 0,
                    description: '',
                    tags: '',
                    createdAt: DateTime(2022),
                    updatedAt: DateTime(2022),
                    category: CategoryModel(id: 0, name: ''),
                    galleries: [],
                  );
                });
              },
              child: Image.asset(
                "assets/button_close.png",
                width: 22,
              ),
            )
          ],
        ),
      );
    }

    Widget chatInput() {
      return Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.product is UninitializedProductModel
                ? const SizedBox()
                : productReview(),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: bgColor4,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    height: 45,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      // vertical: 12,
                    ),
                    child: Center(
                      child: TextFormField(
                        controller: messageController,
                        style: primaryTextStyle,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'type message',
                          hintStyle: subtitleTextStyle,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: handleMessage,
                  child: Image.asset(
                    "assets/button_send.png",
                    width: 45,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget content() {
      return StreamBuilder<List<MessageModel>>(
          stream: MessagesService()
              .getMessagesByUserId(userId: authProvider.user.id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultMargin,
                ),
                children: snapshot.data!
                    .map((MessageModel message) => ChatBuble(
                          text: message.message,
                          isSender: message.isFromUser,
                          product: message.product,
                        ))
                    .toList(),
              );
            }
            return const Center(child: CircularProgressIndicator());
          });
    }

    return Scaffold(
      backgroundColor: bgColor1,
      appBar: header(),
      bottomNavigationBar: chatInput(),
      body: content(),
    );
  }
}
