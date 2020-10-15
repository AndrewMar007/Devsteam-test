import 'package:project_devsteammobi/api/api.dart';
import 'package:project_devsteammobi/api/token.dart';
import 'package:project_devsteammobi/models/listResponseModel.dart';
import 'package:rxdart/rxdart.dart';

class ImageListBloc {
  ImageListApi api = ImageListApi();

  BehaviorSubject<ImageListResponse> _images =
      BehaviorSubject<ImageListResponse>();
  Stream<ImageListResponse> get images => _images.stream;

  fetchImages() async {
    ImageListResponse response = await api.fetchImages(Token.token);
    _images.sink.add(response);
  }

  dispose() {
    _images.close();
  }
}
