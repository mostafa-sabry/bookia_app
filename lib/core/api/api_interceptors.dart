import 'package:dio/dio.dart';

class ApiInterceptors extends Interceptor{
    @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
  }
}