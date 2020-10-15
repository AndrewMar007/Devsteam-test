import 'package:project_devsteammobi/models/cardModel.dart';

class ImageListResponse {
  List<CardModel> cards;
  String error;

  ImageListResponse({this.cards, this.error});

  factory ImageListResponse.fromJson(List<dynamic> json) {
    List<CardModel> imageList = List<CardModel>();
    imageList = json.map((e) => CardModel.fromJson(e)).toList();

    return ImageListResponse(cards: imageList);
  }

  factory ImageListResponse.withError(String error) {
    return ImageListResponse(error: error);
  }
}
