import 'package:flutter/material.dart';
import 'components/textField.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录页面'),
      ),
      body: Center(
        child: LoginInput(),
      ),
    );
  }
}
