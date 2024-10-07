import 'package:bookia_store/model/books_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/get_books_repo.dart';

part 'books_state.dart';

class BooksCubit extends Cubit<BooksState> {
  BooksCubit(this.getBooksRepositories) : super(BooksInitial());
  final GetBooksRepositories getBooksRepositories;
  List<BooksModel> books = [];

  getBooks() async {
    try {
      emit(BooksLoading());
      books = await getBooksRepositories.getBooks();
      emit(BooksSuccess(books: books));
    } on DioException {
      emit(BooksError(error: 'Error while loading'));
    } catch (e) {
      emit(BooksError(error: 'Error while loading'));
    }
  }
}
