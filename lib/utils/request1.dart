import 'package:dio/dio.dart';

// dio 配置项
class HttpConfig {
  static HttpConfig _instance;
  Dio dio;
  static HttpConfig getInstance() {
    if (_instance == null) _instance = new HttpConfig();
    return _instance;
  }

  HttpConfig() {
    dio = new Dio();
    dio.options = BaseOptions(
        baseUrl: 'https://epdc-changjiang.elinkservice.cn/epdc-api/api/',
        connectTimeout: 5000,
        sendTimeout: 5000,
        receiveTimeout: 5000,
        headers: {
          'Authorization':
              'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiI0NGMyMzE2MDNhZTEzODM1MTM4ZmUwNTM5ZThiYjE5MSIsImlhdCI6MTYyNTU1OTU4MywiZXhwIjoxNjI2MTY0MzgzfQ.oEgHCUXp0yDnsSfeGgd6BvH9Tph_ixJnbGIFq00XwS8hr57wHcvZHPKOXGkb4u0VDU8Qqt6P3XBETJLGqhG_eQ'
        },
        contentType: Headers.formUrlEncodedContentType,
        responseType: ResponseType.json);
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      print('1' + options.headers.toString());
      return handler.next(options); //continue
    }, onResponse: (response, handler) {
      // print('2' + response.toString());
      return handler.resolve(response); // continue
    }, onError: (DioError e, handler) {
      print('3');
      // Do something with response error
      return handler.next(e); //continue
    }));
  }
  get(url, {data, options, cancelToken}) async {
    Response response;
    try {
      response = await dio.get(url,
          queryParameters: data, options: options, cancelToken: cancelToken);
      print('getHttp response: $response');
    } on DioError catch (e) {
      print('getHttp exception: $e');
      // formatError(e);
    }
    return response;
  }

  // void formatError(DioError e) {
  //   if (e.type == DioErrorType.CONNECT_TIMEOUT) {
  //     print("连接超时");
  //   } else if (e.type == DioErrorType.SEND_TIMEOUT) {
  //     print("请求超时");
  //   } else if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
  //     print("响应超时");
  //   } else if (e.type == DioErrorType.RESPONSE) {
  //     print("出现异常");
  //   } else if (e.type == DioErrorType.CANCEL) {
  //     print("请求取消");
  //   } else {
  //     print("未知错误");
  //   }
  // }
}
