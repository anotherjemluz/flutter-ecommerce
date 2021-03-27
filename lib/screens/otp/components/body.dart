import 'package:ecommerce/constants.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';

import 'otp_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Row buildTimer() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Esse código vai expirar em '),
          TweenAnimationBuilder(
            tween: Tween(begin: 30.0, end: 0),
            duration: Duration(seconds: 30),
            builder: (context, value, child) => Text(
              '00:${value.toInt()}',
              style: TextStyle(color: kPrimaryColor),
            ),
            onEnd: () {},
          )
        ],
      );
    }

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: SizeConfig.screenHeight * .05),
              Text(
                'Verificação por Código',
                style: headingStyle,
              ),
              Text('Enviamos um código para +55 11 **** 0589'),
              buildTimer(),
              SizedBox(height: SizeConfig.screenHeight * .15),
              OtpForm(),
              SizedBox(height: SizeConfig.screenHeight * .1),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'Reenviar código',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}