import 'package:flutter/material.dart';

import 'components/body.dart';

class LoginSucessScreen extends StatelessWidget {
  static String routeName = '/login_sucess';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: Text('Acesso concedido'),
      ),
      body: Body(),
    );
  }
}