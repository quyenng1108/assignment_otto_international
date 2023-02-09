import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

const String baseUrl = 'https://api.unsplash.com/';
const String clientId = 'qbWt-2hdDyjhsWWZxviLJ1d1NgfquB40IWblGTIajoY';

class ApiService {
  ApiService() {
    addInterceptors();
  }
  var dio = Dio();

  void addInterceptors() {
    dio.options.connectTimeout = 15000; //15s
    dio.options.receiveTimeout = 15000;
    dio.options.baseUrl = baseUrl;
    dio.options.headers = {'Authorization': 'Client-ID $clientId'};
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      // Do something before request is sent
      return handler.next(options);
    }, onResponse: (response, handler) {
      debugPrint(response.statusCode?.toString());
      // Do something with response data
      return handler.next(response); // continue
    }, onError: (DioError e, handler) {
      // Do something with response error
      debugPrint('error: $e');
      return handler.next(e); //continue
    }));
  }
}
