import 'package:dio/dio.dart';
import 'package:rick_and_morty_app/constants/text_strings.dart';

class ServicesAPI {
  Future getCharacters(int page) async {
    final dio = Dio(BaseOptions(baseUrl: server.toString()));

    try {
      final response =
          await dio.get('/character', queryParameters: {'page': page});

      return response.data;
    } on DioException catch (e) {
      return e;
    }
  }

  Future getEpisodes(int page) async {
    final dio = Dio(BaseOptions(baseUrl: server.toString()));

    try {
      final response =
          await dio.get('/episode', queryParameters: {'page': page});

      return response.data;
    } on DioException catch (e) {
      return e;
    }
  }

  Future getLocations(int page) async {
    final dio = Dio(BaseOptions(baseUrl: server.toString()));

    try {
      final response =
          await dio.get('/location', queryParameters: {'page': page});

      return response.data;
    } on DioException catch (e) {
      return e;
    }
  }
}
