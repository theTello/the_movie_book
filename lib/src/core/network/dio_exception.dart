import 'package:dio/dio.dart';

/// Handling dio exception
class DioException implements Exception {
  /// get error message from dio error
  DioException.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        errorMessage = dioError.message;
        break;
      case DioErrorType.connectionTimeout:
        errorMessage = dioError.message;
        break;
      case DioErrorType.receiveTimeout:
        errorMessage = dioError.message;
        break;
      case DioErrorType.sendTimeout:
        errorMessage = dioError.message;
        break;
      case DioErrorType.badResponse:
        errorMessage = extractDescriptionFromResponse(
          dioError.response! as Response<Map<String, dynamic>>,
        );
        break;

      case DioErrorType.badCertificate:
        errorMessage = dioError.message;
        break;
      case DioErrorType.connectionError:
        errorMessage = dioError.message;
        break;
      case DioErrorType.unknown:
        if (dioError.message!.contains('SocketException')) {
          errorMessage = 'Please check your internet connection';
        }
        break;
    }
  }

  /// error message
  late String? errorMessage;

  /// function to extract error message from response
  String extractDescriptionFromResponse(Response<Map<String, dynamic>> response) {
    var message = "";
    try {
      if (response.data != null && response.data!['message'] != null) {
        message = response.data!["message"] as String;
      } else {
        message = response.statusMessage!;
      }
    } catch (error) {
      message = response.statusMessage ?? error.toString();
    }
    return message;
  }

  @override
  String toString() => errorMessage ?? "No error message";
}
