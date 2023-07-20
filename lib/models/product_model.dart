import 'package:shamo_mobile/models/category_model.dart';
import 'package:shamo_mobile/models/gallery_model.dart';

class ProductModel {
  int id = 0;
  String name = '';
  double price = 0;
  String description = '';
  String? tags;
  CategoryModel category = CategoryModel(id: 0, name: '');
  DateTime createdAt = DateTime(2022);
  DateTime updatedAt = DateTime(2022);
  List<GalleryModel> galleries = [];

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.tags,
    required this.category,
    required this.createdAt,
    required this.updatedAt,
    required this.galleries,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = double.parse(json['price'].toString());
    description = json['description'];
    tags = json['tags'];
    category = CategoryModel.fromJson(json['category']);
    createdAt = DateTime.parse(json['created_at']);
    updatedAt = DateTime.parse(json['updated_at']);
    galleries = json['galleries']
        .map<GalleryModel>((gallery) => GalleryModel.fromJson(gallery))
        .toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'tags': tags,
      'category': category.toJson(),
      'created_at': createdAt.toString(),
      'updated_at': updatedAt.toString(),
      'galleries': galleries.map((gallery) => gallery.toJson()).toList(),
    };
  }
}

class UninitializedProductModel extends ProductModel {
  UninitializedProductModel({
    required int id,
    required String name,
    required double price,
    required String description,
    required String? tags,
    required CategoryModel category,
    required DateTime createdAt,
    required DateTime updatedAt,
    required List<GalleryModel> galleries,
  }) : super(
          id: id,
          name: name,
          price: price,
          description: description,
          tags: tags,
          category: category,
          createdAt: createdAt,
          updatedAt: updatedAt,
          galleries: galleries,
        );
}
