// import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:flutter_template/utils/config.dart';
// import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_template/utils/loading.dart';

import 'api.dart';

class DioHttp {
  // static var cookieJar = CookieJar();
  Dio _dio;
  static DioHttp _instance;
  BaseOptions _baseOptions;

  static DioHttp getInstance() {
    if (null == _instance) {
      _instance = new DioHttp();
    }
    return _instance;
  }

  DioHttp() {
    _baseOptions = new BaseOptions(
      baseUrl: Config.BaseUrl,
      connectTimeout: 5000,
      receiveTimeout: 5000,
      headers: {
        'Authorization':
            'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiI0NGMyMzE2MDNhZTEzODM1MTM4ZmUwNTM5ZThiYjE5MSIsImlhdCI6MTYyNTcxMTAxNCwiZXhwIjoxNjI2MzE1ODE0fQ.z1K8xQFUnHdo7CwOlLRefQyeLcyvWYsbEaAdr7plPh0p_gMnts4ds40zOU2fKJ82GTlCVosF9pLh039Egj27hA'
      },
    );
    _dio = new Dio(_baseOptions);
    // ..interceptors.add(CookieManager(cookieJar)); //添加cookieJar  拦截器也可以在这里添加
  }

// get请求
  get(url, {data, options, withLoading = true}) async {
    if (withLoading) {
      LoadingUtils.show(showMsg: "加载中...");
    }
    // print('getRequest:==>path:${url}   params:${data}');
    Response response;
    try {
      response = await _dio.get(url, queryParameters: data, options: options);
      // print('getResponse==>:${response.data}');
      if (withLoading) {
        LoadingUtils.dismiss();
      }
    } on DioError catch (e) {
      // print('getError:==>errorType:${e.type}   errorMsg:${e.message}');
      if (withLoading) {
        LoadingUtils.dismiss();
      }
    }

    ///response.data  请求成功是一个map最终需要将map进行转换 , 请求失败直接返回null
    ///map:转换 ,将List中的每一个条目执行 map方法参数接收的这个方法,这个方法返回T类型，
    ///map方法最终会返回一个  Iterable<T>
    return response.data.toString();
  }

// post请求
  post(url,
      {Map<String, dynamic> parameters,
      dynamic data,
      Options options,
      withLoading = true}) async {
    if (withLoading) {
      LoadingUtils.show(showMsg: "加载中...");
    }
    // print('postRequest:==>path:${url}   params:${data}');
    Response response;
    try {
      response = await _dio.post(url,
          queryParameters: parameters, data: data, options: options);
      // print('postResponse==>:${response.data}');
      if (withLoading) {
        LoadingUtils.dismiss();
      }
    } on DioError catch (e) {
      // print('postError:==>errorType:${e.type}   errorMsg:${e.message}');
      if (withLoading) {
        LoadingUtils.dismiss();
      }
    }

    ///response.data  请求成功是一个map最终需要将map进行转换 , 请求失败直接返回null
    ///map:转换 ,将List中的每一个条目执行 map方法参数接收的这个方法,这个方法返回T类型，
    ///map方法最终会返回一个  Iterable<T>
    return response.data.toString();
  }
}
