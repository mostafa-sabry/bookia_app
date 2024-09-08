import 'package:dio/dio.dart';

import '../../models/book_model.dart';

class GetAllBook {
  Dio dio = Dio();

  Future<List<BookModel>> getAllBook() async {
    final response = await dio.get("https://api.codingarabic.online/api/books");

    Map<String, dynamic> jsonData = response.data;
    List<dynamic> bookData = jsonData['data'];
    List<BookModel> bookList = [];

    for (var books in bookData) {
      BookModel bookModel = BookModel.fromJson(books);
      bookList.add(bookModel);
    }
    return bookList;
  }
}
