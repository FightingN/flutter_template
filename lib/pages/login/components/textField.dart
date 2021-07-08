import 'package:flutter/material.dart';
import 'package:flutter_template/pages/home/index.dart';
import 'package:flutter_template/utils/api.dart';

class LoginInput extends StatelessWidget {
  const LoginInput({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: ClipOval(
              //不管是什么样的图片ClipOval都会根据图片大小处理成圆形或者椭圆形图片
              child: Image.asset(
                'lib/assets/images/logo.png',
                width: 100,
                height: 100,
              ),
            ),
          ),
          CardInput()
        ],
      ),
      padding: EdgeInsets.only(top: 70),
      alignment: Alignment.center,
    );
  }
}

// 登录卡片
class CardInput extends StatefulWidget {
  CardInput({Key key}) : super(key: key);

  @override
  _CardInputState createState() => _CardInputState();
}

class _CardInputState extends State<CardInput> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() {
    Api.getBanner().then((res) {
      print('banner' + res);
    }).catchError((e) {
      //失败
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      margin: EdgeInsets.all(20),
      alignment: Alignment.center, //该属性可以让container宽度自适应撑开
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 50, left: 20, right: 20),
              child: TextField(
                cursorColor: Color(0xE5000000),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  //左边图标设置
                  fillColor: Color(0xFFF8F8F8),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0x00FF0000)),
                      borderRadius: BorderRadius.all(Radius.circular(100))),
                  hintText: '请输入用户名',
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0x00000000)),
                      borderRadius: BorderRadius.all(Radius.circular(100))),
                ),
                onChanged: (value) {
                  print('onChanged:$value');
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: TextField(
                obscureText: true,
                cursorColor: Color(0xE5000000),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  fillColor: Color(0xFFF8F8F8),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0x00FF0000)),
                      borderRadius: BorderRadius.all(Radius.circular(100))),
                  hintText: '请输入密码',
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0x00000000)),
                      borderRadius: BorderRadius.all(Radius.circular(100))),
                ),
                onChanged: (value) {
                  print('onChanged:$value');
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Row(
                //row默认占满父盒子的宽度
                children: <Widget>[
                  Expanded(
                    child: new RaisedButton(
                      onPressed: () {
                        print("  我点击了  Padding  下的  RaisedButton");
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return HomePage();
                        }));
                        // Navigator.of(context).popAndPushNamed('/home');
                      },
                      elevation: 5.0,
                      shape: StadiumBorder(
                        side: BorderSide(color: Colors.red),
                      ),
                      //通过控制 Text 的边距来控制控件的高度
                      child: Container(
                        height: 50,
                        alignment: Alignment.center,
                        child: new Text(
                          "登录",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
