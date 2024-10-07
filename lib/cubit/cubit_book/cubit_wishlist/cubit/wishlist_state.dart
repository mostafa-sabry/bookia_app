part of 'wishlist_cubit.dart';

sealed class WishlistState {}

final class WishlistInitial extends WishlistState {}

final class WishlistLoading extends WishlistState {}

class WishlistLoaded extends WishlistState {
  final List<BooksModel> books;

  WishlistLoaded(this.books);
}

class WishlistError extends WishlistState {
  final String message;

  WishlistError({required this.message});
}
