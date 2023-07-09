import 'dart:convert';

import 'package:dio/dio.dart';

class BaseRequest {
  Dio? dio;
  BaseRequest() {
    BaseOptions options = BaseOptions(
      baseUrl: "http://localhost:3001",
    );
    dio = new Dio(options);
    dio?.options.headers = {
      "Content-Type": "application/json",
    };
  }
  Future get(path) async {
    Response response = await dio!.get(path);
    return jsonDecode(response.toString());
  }
}
