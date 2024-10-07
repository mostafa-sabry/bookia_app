part of 'addcart_cubit.dart';

sealed class AddcartState {}

final class AddcartInitial extends AddcartState {}

final class AddcartLoading extends AddcartState {}

final class AddcartLoaded extends AddcartState {
  final List<BooksModel> addCarts;

  AddcartLoaded(this.addCarts);
}

final class AddcartError extends AddcartState {
  final String errorMessage;

  AddcartError(this.errorMessage);
}
