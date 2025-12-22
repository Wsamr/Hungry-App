import 'package:dio/dio.dart';
import 'package:restaurant_app_sonic/core/errors/error_model.dart';

class ServerException implements Exception {
  final ErrorModel errorModel;

  ServerException({required this.errorModel});
}

void handleDioExceptions(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.sendTimeout:
      throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.receiveTimeout:
      throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.badCertificate:
      throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.cancel:
      throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.connectionError:
      throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.unknown:
      throw ServerException(errorModel: ErrorModel.fromJson(e.response!.data));

    case DioExceptionType.badResponse:
      switch (e.response!.statusCode) {
        case 400: // Bad request
          throw ServerException(
            errorModel: ErrorModel.fromJson(e.response!.data),
          );
        case 401: //unauthorized
          throw ServerException(
            errorModel: ErrorModel.fromJson(e.response!.data),
          );
        case 403: //forbidden (Access Blocked)
          throw ServerException(
            errorModel: ErrorModel.fromJson(e.response!.data),
          );
        case 404: //not found
          throw ServerException(
            errorModel: ErrorModel(errorMassage: "not found"),
          );
        case 408: //Request Timeout
          throw ServerException(
            errorModel: ErrorModel.fromJson(e.response!.data),
          );
        case 409: //Conflict
          throw ServerException(
            errorModel: ErrorModel.fromJson(e.response!.data),
          );
        case 422: //  Unprocessable Entity(Validation Errors such small password)
          throw ServerException(
            errorModel: ErrorModel.fromJson(e.response!.data),
          );
        case 500: //Internal Server Errors
          throw ServerException(
            errorModel: ErrorModel.fromJson(e.response!.data),
          );
        case 504: // Gateway Timeout
          throw ServerException(
            errorModel: ErrorModel.fromJson(e.response!.data),
          );
      }
  }
}

class NoInternetException implements Exception {}
