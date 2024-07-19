import 'package:dio/dio.dart';

class DioHelper {
  late Dio dio;

  DioHelper() {
    dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 7),
      ),
    );

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        print('Request: ${options.path}');
        return handler.next(options); // Continue
      },
      onResponse: (response, handler) {
        print('Response: ${response.data}');
        return handler.next(response); // Continue
      },
      onError: (DioException e, handler) {
        print('Error: ${e.message}');
        return handler.next(e); // Continue
      },
    ));
  }

  Future<Response?> getRequest(String url,
      {Map<String, dynamic>? headers}) async {
    try {
      Response response = await dio.get(
        url,
        options: Options(
          headers: headers,
        ),
      );
      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        print('Error response: ${e.response?.data}');
        print('Status code: ${e.response?.statusCode}');
      } else {
        print('Error message: ${e.message}');
      }
      return null;
    }
  }

  Future<Response?> postRequest(String url, Map<String, dynamic> data,
      {Map<String, dynamic>? headers}) async {
    try {
      Response response = await dio.post(
        url,
        data: data,
        options: Options(
          headers: headers,
        ),
      );
      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        print('Error response: ${e.response?.data}');
        print('Status code: ${e.response?.statusCode}');
      } else {
        print('Error message: ${e.message}');
      }
      return null;
    }
  }

  // Add more methods as needed
}
