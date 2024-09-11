import 'package:bookia_store/core/errors/error_model.dart';
import 'package:dio/dio.dart';

class serverException implements Exception {
  final ErrorModel errorModel;


  serverException({required  this.errorModel});
}






void handleDioExceptions(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      throw serverException(errorModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.sendTimeout:
      throw serverException(errorModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.receiveTimeout:
      throw serverException(errorModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.badCertificate:
      throw serverException(errorModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400: // Bad response
          throw serverException(
              errorModel: ErrorModel.fromJson(e.response!.data));
        case 401: // Unauthorized
          throw serverException(
              errorModel: ErrorModel.fromJson(e.response!.data));
        case 403: // Forbidden
          throw serverException(
              errorModel: ErrorModel.fromJson(e.response!.data));
        case 404: // Not found
          throw serverException(
              errorModel: ErrorModel.fromJson(e.response!.data));
        case 409: // cofficient
          throw serverException(
              errorModel: ErrorModel.fromJson(e.response!.data));
        case 422: // Unprocessable Entity
          throw serverException(
              errorModel: ErrorModel.fromJson(e.response!.data));
        case 504:
          throw serverException(
              errorModel: ErrorModel.fromJson(
                  e.response!.data)); // Internal Server Error
      }
    case DioExceptionType.cancel:
      throw serverException(errorModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.connectionError:
      throw serverException(errorModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.unknown:
      throw serverException(errorModel: ErrorModel.fromJson(e.response!.data));
  }
}
