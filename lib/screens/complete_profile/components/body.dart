import 'package:ecommerce/components/social_card.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';

import 'complete_profile_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: SizeConfig.screenHeight * 0.02),
            Text(
              'Complete seu perfil',
              style: headingStyle,
            ),
            Text(
              'Complete os campos ou prossiga \ncom alguma rede social',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.05),
            CompleteProfileForm(),
            SizedBox(height: getProportionateScreenHeight(30)),
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
    );
  }
}
