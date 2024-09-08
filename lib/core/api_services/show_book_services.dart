import 'package:dio/dio.dart';

class AllShowBookServices {
  Dio dio = Dio();

  Future<Map<String, dynamic>> getShowBook() async {
    final response =
        await dio.get("https://api.codingarabic.online/api/books/");

    Map<String, dynamic> jsonData = response.data;

    return jsonData;
  }
}
