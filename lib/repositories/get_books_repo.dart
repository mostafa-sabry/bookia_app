import 'package:bookia_store/core/api/api_service.dart';

import 'package:bookia_store/model/books_model.dart';

class GetBooksRepositories {
  Future<List<BooksModel>> getBooks() async {
    final data = await ApiService()
        .get(apiUrl: 'https://api.codingarabic.online/api/books');
    List<BooksModel> books = [];
    BooksModel booksModel;

    for (var item in data['data']) {
      booksModel = BooksModel.fromJson(item);
      books.add(booksModel);
    }
    return books;
  }
}
