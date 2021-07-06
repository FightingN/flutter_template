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
      // 如果你想完成请求并返回一些自定义数据，你可以resolve一个Response对象 `handler.resolve(response)`。
      // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义response.
      //
      // 如果你想终止请求并触发一个错误,你可以返回一个`DioError`对象,如`handler.reject(error)`，
      // 这样请求将被中止并触发异常，上层catchError会被调用。
    }, onResponse: (response, handler) {
      // print('2' + response.toString());
      return handler.resolve(response); // continue
      // 如果你想终止请求并触发一个错误,你可以 reject 一个`DioError`对象,如`handler.reject(error)`，
      // 这样请求将被中止并触发异常，上层catchError会被调用。
    }, onError: (DioError e, handler) {
      print('3');
      // Do something with response error
      return handler.next(e); //continue
      // 如果你想完成请求并返回一些自定义数据，可以resolve 一个`Response`,如`handler.resolve(response)`。
      // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义response.
    }));
  }
}
