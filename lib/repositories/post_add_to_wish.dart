import 'package:bookia_store/core/api/api_service.dart';
import 'package:bookia_store/model/books_model.dart';

class PostAddToWish {
  Future<BooksModel> addToWishList({
    required String bookId,
  }) async {
    final data = await ApiService()
        .post(url: 'https://api.codingarabic.online/api/wishlist/add', data: {
      bookId: bookId,
    });
    return BooksModel.fromJson(data);
  }
}
