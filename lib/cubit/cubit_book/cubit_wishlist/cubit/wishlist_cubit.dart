import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../model/books_model.dart';

part 'wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit() : super(WishlistInitial());

  // List<dynamic> wishlist = [];

  void addToWishlist(BooksModel book) {
    if (state is WishlistLoaded) {
      final currentState = state as WishlistLoaded;
      emit(WishlistLoaded(List.from(currentState.books)..add(book)));
    } else {
      emit(WishlistLoaded([book]));
    }
  }

  void removeFromWishlist(BooksModel book) {
    if (state is WishlistLoaded) {
      final currentState = state as WishlistLoaded;
      emit(WishlistLoaded(List.from(currentState.books)..remove(book)));
    }
  }

  Future<void> getWish() async {
    try {
      emit(WishlistLoading());
      emit(WishlistLoaded([]));
    } on DioException catch (e) {
      emit(WishlistError(message: 'Error fetching wishlist: ${e.message}'));
    } catch (e) {
      emit(WishlistError(
          message: 'An unexpected error occurred: ${e.toString()}'));
    }
  }
}
