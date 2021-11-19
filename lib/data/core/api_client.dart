import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio;
  ApiClient(this.dio);

  dynamic get(String url) async {
    try {
      final response =
          await dio.get(url, options: Options(contentType: 'application/json'));
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }
}
