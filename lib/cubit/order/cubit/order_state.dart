part of 'order_cubit.dart';

@immutable
sealed class OrderState {}

final class OrderInitial extends OrderState {}

final class OrderAdded extends OrderState {
  final List<OrderModel> orders;
  OrderAdded({required this.orders});
}

final class OrderLoading extends OrderState {}

final class OrderError extends OrderState {
  final String errorMessage;

  OrderError({required this.errorMessage});
}
