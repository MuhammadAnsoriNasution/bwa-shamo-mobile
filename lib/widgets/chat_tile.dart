import 'package:flutter/material.dart';
import 'package:shamo_mobile/models/category_model.dart';
import 'package:shamo_mobile/models/message_model.dart';
import 'package:shamo_mobile/screens/detail_chat_screen.dart';
import 'package:shamo_mobile/theme.dart';
import 'package:shamo_mobile/models/product_model.dart';

class ChatTile extends StatefulWidget {
  final MessageModel message;
  const ChatTile({Key? key, required this.message}) : super(key: key);

  @override
  State<ChatTile> createState() => _ChatTileState();
}

class _ChatTileState extends State<ChatTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailChatScreen(
              product: UninitializedProductModel(
                id: 0,
                name: '',
                price: 0,
                description: '',
                tags: '',
                createdAt: DateTime(2022),
                updatedAt: DateTime(2022),
                category: CategoryModel(id: 0, name: ''),
                galleries: [],
              ),
            ),
          ),
        );
        // Navigator.pushNamed(context, "/detail-chat");
      },
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                "assets/image_shop_logo.png",
                width: 54,
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Shoe Store",
                      style: primaryTextStyle.copyWith(
                        fontSize: 15,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      widget.message.message,
                      style: secondaryTextStyle.copyWith(
                        fontWeight: light,
                      ),
                    )
                  ],
                ),
              ),
              Text(
                "Now",
                style: secondaryTextStyle.copyWith(
                  fontSize: 10,
                ),
              )
            ],
          ),
          const SizedBox(
            width: 12,
          ),
          const Divider(
            thickness: 1,
            color: Color(0xff2b2939),
          )
        ],
      ),
    );
  }
}
