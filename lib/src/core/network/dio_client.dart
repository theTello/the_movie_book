import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:themoviebook/src/core/network/request_method.dart';

import 'dio_exception.dart';
import 'interceptors/authorization_interceptor.dart';
import 'interceptors/logger_interceptor.dart';
import 'network_data.dart';

/// Dio client for network calls
class DioClient {
  /// Dio client constructor
  const DioClient();

  /// instance of dio to be used for network calls
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: NetworkData.baseURL,
      connectTimeout: NetworkData.connectionTimeout,
      receiveTimeout: NetworkData.receiveTimeout,
    ),
  )..interceptors.addAll([
      AuthorizationInterceptor(),
      LoggerInterceptor(),
    ]);

  /// function to make various calls depending request method
  Future<Response<dynamic>> call({
    required String path,
    required RequestMethod method,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? data,
    FormData? formData,
    int Function(int, int)? trackProgress,
  }) async {
    /// Declare response variable to assign request result
    late Response<dynamic> response;
    final params = queryParams ?? {};
    if (params.keys.contains('searchTerm')) {
      params['searchTerm'] = Uri.encodeQueryComponent(params['searchTerm'] as String);
    }
    try {
      switch (method) {
        case RequestMethod.post:
          response = await dio.post(
            path,
            data: data,
            options: Options(headers: headers),
          );
          break;
        case RequestMethod.patch:
          response = await dio.patch(
            path,
            data: data,
          );
          break;

        case RequestMethod.postFormData:
          response = await dio.post(
            path,
            data: getFormData(data!),
            options: Options(headers: {}),
          );
          break;
        case RequestMethod.patchFormData:
          response = await dio.patch(
            path,
            options: Options(
              headers: {
                'Content-Disposition': 'form-data',
                'Content-Type': 'multipart/form-data',
              },
            ),
            data: getFormData(data!),
          );
          break;
        case RequestMethod.get:
          response = await dio.get(path, queryParameters: params);
          break;
        case RequestMethod.put:
          response = await dio.put(
            path,
            queryParameters: {'auth': false, 'host': ''},
            data: data,
          );
          break;
        case RequestMethod.delete:
          response = await dio.delete(
            path,
            queryParameters: params,
            data: data,
            options: Options(
              headers: {
                "Authorization": "Bearer ",
              },
            ),
          );
          break;
        case RequestMethod.upload:
          response = await dio.post(
            path,
            data: formData,
            queryParameters: params,
            options: Options(
              headers: {
                "Authorization": "Bearer ",
                'Content-Disposition': 'form-data',
                'Content-Type': 'multipart/form-data',
              },
            ),
            onSendProgress: (sent, total) {},
          );
          break;
        case RequestMethod.putFormData:
          response = await dio.put(
            path,
            options: Options(
              headers: {
                'Content-Disposition': 'form-data',
                'Content-Type': 'multipart/form-data',
              },
            ),
            data: getFormData(data!),
            // options: Options(headers: {}),
          );
          break;
      }
      return response;
    } on DioError catch (error, stackTrace) {
      if (kDebugMode) {
        print(error.response!.statusMessage);
      }

      final apiError = DioException.fromDioError(error);
      return Future.error(apiError, stackTrace);
    }
  }

  /// function to convert request data from json to form data
  FormData getFormData(Map<String, dynamic> map) {
    final formData = FormData.fromMap(map);
    return formData;
  }
}
