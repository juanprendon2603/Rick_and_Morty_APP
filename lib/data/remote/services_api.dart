import 'package:dio/dio.dart';
import 'package:rick_and_morty_app/constants/text_strings.dart';

class ServicesAPI {
  Future getCharacters() async {
    final dio = Dio(BaseOptions(baseUrl: server.toString()));

    try {
      final response = await dio.get(
        '/character',
      );

      return response.data['results'];
    } on DioException catch (e) {
      return e;
    }
  }
}
