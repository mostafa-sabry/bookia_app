import 'package:bookia_store/cache/cache_helper.dart';
import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['token'] = CacheHelper().getData(key: 'token') != null
        ? 'Bearer ${CacheHelper().getData(key: 'token')}'
        : null;
    super.onRequest(options, handler);
  }
}
