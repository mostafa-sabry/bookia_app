import 'package:bookia_store/core/errors/auth_error_model.dart';
import 'package:dio/dio.dart';

class ServerException implements Exception {
  final AuthErrorModel errModel;

  ServerException({required this.errModel});
}

void handleDioException(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      throw ServerException(
          errModel: AuthErrorModel.fromJson(e.response!.data));
    case DioExceptionType.sendTimeout:
      throw ServerException(
          errModel: AuthErrorModel.fromJson(e.response!.data));
    case DioExceptionType.receiveTimeout:
      throw ServerException(
          errModel: AuthErrorModel.fromJson(e.response!.data));
    case DioExceptionType.badCertificate:
      throw ServerException(
          errModel: AuthErrorModel.fromJson(e.response!.data));
    case DioExceptionType.cancel:
      throw ServerException(
          errModel: AuthErrorModel.fromJson(e.response!.data));
    case DioExceptionType.connectionError:
      throw ServerException(
          errModel: AuthErrorModel.fromJson(e.response!.data));
    case DioExceptionType.unknown:
      throw ServerException(
          errModel: AuthErrorModel.fromJson(e.response!.data));
    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400:
          throw ServerException(
              errModel: AuthErrorModel.fromJson(e.response!.data));

        case 401:
          throw ServerException(
              errModel: AuthErrorModel.fromJson(e.response!.data));
        case 403:
          throw ServerException(
              errModel: AuthErrorModel.fromJson(e.response!.data));
        case 404:
          throw ServerException(
              errModel: AuthErrorModel.fromJson(e.response!.data));
        case 405:
          throw ServerException(
              errModel: AuthErrorModel.fromJson(e.response!.data));
        case 422:
          throw ServerException(
              errModel: AuthErrorModel.fromJson(e.response!.data));
        case 408:
          throw ServerException(
              errModel: AuthErrorModel.fromJson(e.response!.data));
        case 500:
          throw ServerException(
              errModel: AuthErrorModel.fromJson(e.response!.data));
        case 501:
          throw ServerException(
              errModel: AuthErrorModel.fromJson(e.response!.data));
        case 502:
          throw ServerException(
              errModel: AuthErrorModel.fromJson(e.response!.data));
        case 503:
          throw ServerException(
              errModel: AuthErrorModel.fromJson(e.response!.data));
        case 504:
          throw ServerException(
              errModel: AuthErrorModel.fromJson(e.response!.data));
      }
  }
}
