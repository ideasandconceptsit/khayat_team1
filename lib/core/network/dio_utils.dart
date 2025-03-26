import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DioUtils
{
  static Dio? _instance;
  //method for getting dio instance
  static Dio getInstance()

  {
    _instance ??= _createDioInstance();
    return _instance!;
  }

  static Dio _createDioInstance()
  {
    var dio = Dio(BaseOptions(
      baseUrl: "https://khayat-backend.onrender.com",
    ));
    dio.interceptors.clear();
    if (kDebugMode) // in debug mode will appear the print statment
    {
      dio.interceptors.add(
        AwesomeDioInterceptor(
          logRequestTimeout: false,
          logger: debugPrint,
        ),
      );
    }
    return dio;
  }
}
