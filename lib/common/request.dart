import 'package:dio/dio.dart';
import 'package:juejin/common/config.dart';

var dio = new Dio(BaseOptions(
    baseUrl: Config.baseUrl,
    connectTimeout: 3000
));


class Request {

  static Future get(String url) async {
    var response;
    print(Config.baseUrl + url);
    try{
      response = await dio.get(url);
      return response.data;
    } catch(e) {
      return Future.error(e);
    }
  }
}