import 'package:ecommerce/components/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

import '../../enums.dart';
import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = '/profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meu Perfil'),
      ),
      body: Body(),
      bottomNavigationBar: CustomBottomBar(
        selectedMenu: MenuState.profile,
      ),
    );
  }
}