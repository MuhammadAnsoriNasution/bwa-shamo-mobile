// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shamo_mobile/models/message_model.dart';
import 'package:shamo_mobile/models/product_model.dart';
import 'package:shamo_mobile/models/user_model.dart';

class MessagesService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<List<MessageModel>> getMessagesByUserId({required int userId}) {
    try {
      return firestore
          .collection('messages')
          .where('userId', isEqualTo: userId)
          .snapshots()
          .map((QuerySnapshot list) {
        if (list.docs.isEmpty) {
          throw Exception('data kosong');
        }
        var result = list.docs.map<MessageModel>((DocumentSnapshot message) {
          Map<String, dynamic> map = message.data() as Map<String, dynamic>;
          print(map);
          return MessageModel.fromJson(map);
        }).toList();
        result.sort((MessageModel a, MessageModel b) =>
            a.createdAt.compareTo(b.createdAt));
        return result;
      });
    } catch (e) {
      print("halo ini gagal");
      throw Exception('Gagal mengambil data $e');
    }
  }

  Future<void> addMessage(
    UserModel user,
    bool isFromUser,
    String message,
    ProductModel product,
  ) async {
    try {
      firestore.collection('messages').add({
        'userId': user.id,
        'userName': user.username,
        'userImage': user.profilePhotoUrl,
        'isFromUser': isFromUser,
        'message': message,
        'product': product is UninitializedProductModel ? {} : product.toJson(),
        'createdAt': DateTime.now().toString(),
        'updatedAt': DateTime.now().toString(),
      }).then(
        (value) => print("pesan berhasil di kirim"),
      );
    } catch (e) {
      throw Exception("Pesan gagal dikirim");
    }
  }
}
