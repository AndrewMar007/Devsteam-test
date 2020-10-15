import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:project_devsteammobi/models/listResponseModel.dart';

class ImageListApi {
  String apiHost = 'https://api.unsplash.com/photos';

  Future<ImageListResponse> fetchImages(String clientId) async {
    var response = await http.get(apiHost + '/?client_id=$clientId');
    return ImageListResponse.fromJson(json.decode(response.body));
  }
}
