// import 'package:dio/dio.dart';
import 'package:flutter_template/utils/request.dart';

class Api {
  ///获取首页banner列表
  static getBanner() async {
    return await DioHttp().get('/cjnews/getDjBanner');
  }

  // ///登录
  // static toLogin({username, password}) async {
  //   FormData formData =
  //       FormData.fromMap({'username': username, 'password': password});
  //   return await DioHttp().post('user/login', data: formData);
  // }
}
