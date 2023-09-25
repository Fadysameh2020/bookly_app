import 'package:dio/dio.dart';

abstract class Failure {
  final String errMssg;

  const Failure(this.errMssg);
}

class ServiceFailure extends Failure {
  ServiceFailure(super.errMssg);
  factory ServiceFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServiceFailure('connection timeout');
      case DioExceptionType.sendTimeout:
        return ServiceFailure('send timeout');
      case DioExceptionType.receiveTimeout:
        return ServiceFailure('receive timeout');
      case DioExceptionType.badResponse:
        return ServiceFailure.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data!);
      case DioExceptionType.cancel:
        return ServiceFailure('request cancelled');
      case DioExceptionType.connectionError:
        return ServiceFailure('connection error');
      case DioExceptionType.badCertificate:
        return ServiceFailure('bad Certificate');
      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return ServiceFailure('No Internet connection');
        }
        return ServiceFailure('connection error unknown');
      default:
        return ServiceFailure(
            'Opps there was an error, please try again later');
    }
  }

  factory ServiceFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServiceFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServiceFailure('Your request not found, please try again later');
    } else if (statusCode == 500) {
      return ServiceFailure('Internal server error, please try again later');
    } else {
      return ServiceFailure('Opps there was an error, please try again later');
    }
  }
}
