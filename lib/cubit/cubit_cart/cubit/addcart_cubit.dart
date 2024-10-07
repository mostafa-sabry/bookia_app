import 'package:bookia_store/model/books_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'addcart_state.dart';

class AddcartCubit extends Cubit<AddcartState> {
  AddcartCubit() : super(AddcartInitial());

  void addToCart(BooksModel book) {
    if (state is AddcartLoaded) {
      final currentState = state as AddcartLoaded;
      emit(AddcartLoaded(List.from(currentState.addCarts)..add(book)));
    } else {
      emit(AddcartLoaded([book]));
    }
  }

  void removeCart(BooksModel book) {
    if (state is AddcartLoaded) {
      final currentState = state as AddcartLoaded;
      emit(AddcartLoaded(List.from(currentState.addCarts)..remove(book)));
    }
  }

  // void increaseQuantity() {
  //   quantity++;
  //   emit(AddcartLoaded([]));
  // }

  // void decreaseQuantity() {
  //   if (quantity > 1) {
  //     quantity--;
  //     emit(AddcartLoaded([]));
  //   }
  // }

  getAddCart() async {
    try {
      emit(AddcartLoading());
      emit(AddcartLoaded([]));
    } on DioException catch (e) {
      emit(AddcartError(e.message ?? e.toString()));
    } catch (e) {
      emit(AddcartError(e.toString()));
    }
  }
}
