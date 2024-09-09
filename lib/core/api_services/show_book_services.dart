import 'package:bookia_store/models/Product_book_model.dart';
import 'package:dio/dio.dart';

class AllShowBookServices {
  Dio dio = Dio();

  Future<ProductBookModel> getShowBook(int productId) async {
    try {
      final response =
          await dio.get("https://api.codingarabic.online/api/books/$productId");

      if (response.statusCode == 200) {
        return ProductBookModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load product');
      }
    } catch (e) {
      throw Exception('Error fetching product details: $e');
    }
  }
}
