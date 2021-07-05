import 'package:flutter/material.dart';
import 'package:flutter_template/pages/login/login.dart';

class Application extends StatelessWidget {
  const Application({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      theme: ThemeData(primaryColor: Colors.red),
      debugShowCheckedModeBanner: false,
      // debugShowMaterialGrid: true, //打开网格
      // showPerformanceOverlay: true,//打开性能检测
    );
  }
}
