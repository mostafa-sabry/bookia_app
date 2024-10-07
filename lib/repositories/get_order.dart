import 'package:bookia_store/core/api/api_service.dart';
import 'package:bookia_store/model/order_model.dart';

class GetOrderRepo {
  Future<List<OrderModel>> getOrderRepo({required int id}) async {
    try {
      final response = await ApiService()
          .get(apiUrl: 'https://api.codingarabic.online/api/orders/$id');

      List<OrderModel> orders = [];
      for (var orderData in response) {
        orders.add(OrderModel.fromJson(orderData));
      }

      return orders;
    } catch (e) {
      throw Exception('Failed to load orders: ${e.toString()}');
    }
  }
}
