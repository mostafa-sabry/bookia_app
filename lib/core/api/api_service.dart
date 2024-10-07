import 'package:bookia_store/model/order_model.dart';
import 'package:bookia_store/model/user_model.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<UserModel> login(
      {required String email, required String password}) async {
    final response = await _dio.post(
      "https://api.codingarabic.online/api/auth/login",
      data: {'email': email, 'password': password},
    );
    response.data;
    Map<String, dynamic> tokenData = response.data["data"];

    UserModel authModel = UserModel.fromJson(tokenData);
    return authModel;
  }

  Future<OrderModel> order({
    required String customerName,
    required String customerEmail,
    required String customerPhone,
    required String customerAddress,
    required String notes,
  }) async {
    final response = await _dio.post(
      "https://api.codingarabic.online/api/orders",
      data: {
        'customerName': customerName,
        'customerEmail': customerEmail,
        'customerPhone': customerPhone,
        'customerAddress': customerAddress,
        'notes': notes,
      },
    );
    response.data;
    Map<String, dynamic> data = response.data["data"];

    OrderModel orderModel = OrderModel.fromJson(data);
    return orderModel;
  }

  Future get({
    required String apiUrl,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    final response = await _dio.get(
      apiUrl,
      queryParameters: queryParameters,
    );
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception(
          'Failed to fetch data, status code: ${response.statusCode}');
    }
  }

  Future post({
    required String url,
    dynamic data,
    String? token,
  }) async {
    Map<String, String> headers = {};

    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }

    try {
      final response = await _dio.post(
        url,
        data: data,
        options: Options(
          headers: headers,
        ),
      );
      return response.data; // Return the response data
    } catch (e) {
      return 'Error: ${e.toString()}'; // Return error message
    }
  }

  Future<UserModel> register({
    required String name,
    required String email,
    required String password,
    required String confirmation_password,
    Options? options,
  }) async {
    final response = await _dio.post(
      "https://api.codingarabic.online/api/auth/register",
      data: {
        'name': name,
        'email': email,
        'password': password,
        'confirmation_password': confirmation_password,
      },
      options: options, // تمرير الخيارات للهيدرات
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> tokenData = response.data["data"];
      UserModel authModel = UserModel.fromJson(tokenData);
      return authModel;
    } else {
      throw Exception('فشل التسجيل: ${response.statusMessage}');
    }
  }
}
