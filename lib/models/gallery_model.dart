class GalleryModel {
  int id = 0;
  String url = '';

  GalleryModel({required this.id, required this.url});

  GalleryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
  }
  Map<String, dynamic> toJson() {
    return {'id': id, 'url': url};
  }
}
