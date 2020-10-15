import 'imageModel.dart';
import 'userModel.dart';

class CardModel {
  String id;
  String description;
  ImageModel image;
  UserModel user;

  CardModel({this.id, this.description, this.image, this.user});

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
        id: json['id'],
        description: json['description'] ?? json['alt_description'],
        image: ImageModel.fromJson(json['urls']),
        user: UserModel.fromJson(json['user']));
  }
}
