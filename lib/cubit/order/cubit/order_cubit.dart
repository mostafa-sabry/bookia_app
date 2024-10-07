import 'package:bloc/bloc.dart';
import 'package:bookia_store/core/api/api_service.dart';
import 'package:bookia_store/model/order_model.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../repositories/get_order.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit(this.getOrderRepo) : super(OrderInitial());

  final GetOrderRepo getOrderRepo;
  late OrderModel orderModel;
  order({
    required String fullName,
    required String email,
    required String address,
    required String notes,
    required String phone,
  }) async {
    try {
      emit(OrderAdded(orders: []));
      orderModel = await ApiService().order(
        customerName: fullName,
        customerEmail: email,
        customerPhone: phone,
        customerAddress: address,
        notes: notes,
      );
      emit(OrderAdded(orders: []));
    } catch (e) {
      emit(OrderError(errorMessage: e.toString()));
    }
  }

  getOrder({required int id}) async {
    emit(OrderLoading());
    try {
      final orders = await getOrderRepo.getOrderRepo(id: id);
      emit(OrderAdded(orders: orders));
    } on DioException catch (e) {
      emit(OrderError(errorMessage: 'Error fetching order: ${e.message}'));
    } catch (e) {
      emit(OrderError(
          errorMessage: 'An unexpected error occurred: ${e.toString()}'));
    }
  }
}
