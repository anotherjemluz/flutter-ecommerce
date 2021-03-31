import 'package:flutter/material.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 20),
        ProfilePic(),
        SizedBox(height: 40),
        ProfileMenu(
          icon: 'assets/icons/User Icon.svg',
          text: 'Minha conta',
          onPressed: () {},
        ),
        ProfileMenu(
          icon: 'assets/icons/Bell.svg',
          text: 'Notificações',
          onPressed: () {},
        ),
        ProfileMenu(
          icon: 'assets/icons/Settings.svg',
          text: 'Configurações',
          onPressed: () {},
        ),
        ProfileMenu(
          icon: 'assets/icons/Question mark.svg',
          text: 'Central de Ajuda',
          onPressed: () {},
        ),
         ProfileMenu(
          icon: 'assets/icons/Log out.svg',
          text: 'Sair',
          onPressed: () {},
        ),
        Spacer(),

      ],
    );
  }
}


