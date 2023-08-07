import 'package:dio/dio.dart';
import 'package:rick_and_morty_app/constants/text_strings.dart';

class ServicesAPI {
  Future getCharacters(int page, String name) async {
    final dio = Dio(BaseOptions(baseUrl: server.toString()));

    try {
      final response = await dio.get('/character', queryParameters: {
        'page': page,
        'name': name,
      });

      return {
        'data': response.data,
        'status': 200,
      };
    } on DioException catch (e) {
      return {
        'message': e.error,
        'status': 400,
      };
    }
  }

  Future getEpisodes(int page, String name) async {
    final dio = Dio(BaseOptions(baseUrl: server.toString()));

    try {
      final response = await dio.get('/episode', queryParameters: {
        'page': page,
        'name': name,
      });
      return {
        'data': response.data,
        'status': 200,
      };
    } on DioException catch (e) {
      return {
        'message': e.error,
        'status': 400,
      };
    }
  }

  Future getLocations(int page, String name) async {
    final dio = Dio(BaseOptions(baseUrl: server.toString()));

    try {
      final response = await dio.get('/location', queryParameters: {
        'page': page,
        'name': name,
      });

      return {
        'data': response.data,
        'status': 200,
      };
    } on DioException catch (e) {
      return {
        'message': e.error,
        'status': 400,
      };
    }
  }
}
