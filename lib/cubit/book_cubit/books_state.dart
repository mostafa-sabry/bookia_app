part of 'books_cubit.dart';

sealed class BooksState {}

final class BooksInitial extends BooksState {}

final class BooksSuccess extends BooksState {
  final List<BooksModel> books;
  BooksSuccess({required this.books});
}

final class BooksError extends BooksState {
  final String error;
  BooksError({required this.error});
}

final class BooksLoading extends BooksState {}
