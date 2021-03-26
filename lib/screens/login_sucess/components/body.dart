import 'package:ecommerce/components/default_button.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: SizeConfig.screenHeight * .04),
        Image.asset(
          'assets/images/success.png',
          height: SizeConfig.screenHeight * .4,
        ),
        SizedBox(height: SizeConfig.screenHeight * .08),
        Text(
          'Acesso concedido',
          style: TextStyle(
            fontSize: getProportionateScreenWidth(30),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * .6,
          child: DefaultButton(
            text: 'Voltar para o início',
            onPressed: () {},
          ),
        ),
        Spacer(),
      ],
    );
  }
}
