import 'package:assignment_otto_international/src/api_service.dart';
import 'package:assignment_otto_international/src/dependencies.dart';
import 'package:assignment_otto_international/src/models/photo_model.dart';
import 'package:dio/dio.dart';

class PhotoRepository {
  PhotoRepository({required this.dio});
  final Dio dio;

  // fetch photos and parse them to model
  Future<List<PhotoModel>> fetchPhotos({int page = 1, int perPage = 10}) async {
    final Response<List<dynamic>> response = await dio
        .get('photos', queryParameters: {'per_page': perPage, 'page': page});
    if (response.statusCode == 200) {
      final data =
          (response.data ?? []).map((e) => PhotoModel.fromJson(e)).toList();
      return data;
    }
    throw Exception('Error fetching photos');
  }
}
