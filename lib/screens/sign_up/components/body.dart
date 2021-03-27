import 'package:ecommerce/components/social_card.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';

import 'sign_up_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: SizeConfig.screenHeight * 0.07),
              Text(
                'Nova Conta',
                style: headingStyle,
              ),
              Text(
                'Preencha os campos ou entre \ncom uma rede social',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.07),
              SignUpForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.07),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SocialCard(
                    icon: 'assets/icons/google-icon.svg',
                    onPressed: () {},
                  ),
                  SocialCard(
                    icon: 'assets/icons/facebook-2.svg',
                    onPressed: () {},
                  ),
                  SocialCard(
                    icon: 'assets/icons/twitter.svg',
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
              Text(
                'Continuando você confirma que aceita os \nnossos Termos e Condições',
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
