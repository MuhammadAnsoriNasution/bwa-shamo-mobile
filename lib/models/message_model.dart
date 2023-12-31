import 'package:shamo_mobile/models/category_model.dart';
import 'package:shamo_mobile/models/product_model.dart';

class MessageModel {
  late String message;
  late int userId;
  late String userImage;
  late String userName;
  late bool isFromUser;
  late ProductModel product;
  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();

  MessageModel({
    required this.message,
    required this.userId,
    required this.userName,
    required this.userImage,
    required this.isFromUser,
    required this.product,
    required this.createdAt,
    required this.updatedAt,
  });

  MessageModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    userId = json['userId'];
    userName = json['userName'];
    userImage = json['userImage'];
    isFromUser = json['isFromUser'];
    product = json['product'].isEmpty
        ? UninitializedProductModel(
            id: 0,
            name: '',
            price: 0,
            description: '',
            tags: '',
            createdAt: DateTime(2022),
            updatedAt: DateTime(2022),
            category: CategoryModel(id: 0, name: ''),
            galleries: [],
          )
        : ProductModel.fromJson(json['product']);
    createdAt = DateTime.parse(json['createdAt']);
    updatedAt = DateTime.parse(json['updatedAt']);
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'userId': userId,
      'userName': userName,
      'userImage': userImage,
      'isFromUser': isFromUser,
      'product': product is UninitializedProductModel ? {} : product.toJson(),
      'createdAt': createdAt.toString(),
      'updatedAt': updatedAt.toString(),
    };
  }
}
