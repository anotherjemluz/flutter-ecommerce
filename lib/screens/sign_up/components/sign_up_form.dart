import 'package:ecommerce/components/custom_suffix_icon.dart';
import 'package:ecommerce/components/default_button.dart';
import 'package:ecommerce/components/form_error.dart';
import 'package:ecommerce/screens/complete_profile/complete_profile_screen.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];

  String email, password, confirm_password;

  // email
  String emailValidator(String value) {
    if (value.isEmpty && !errors.contains(kEmailNullError)) {
      setState(() {
        errors.add(kEmailNullError);
      });
      return '';
    } else if (!emailValidatorRegExp.hasMatch(value) &&
        !errors.contains(kInvalidEmailError)) {
      setState(() {
        errors.add(kInvalidEmailError);
      });
      return '';
    }

    return null;
  }

  String emailOnChanged(String value) {
    if (value.isNotEmpty && errors.contains(kEmailNullError)) {
      setState(() {
        errors.remove(kEmailNullError);
      });
    } else if (emailValidatorRegExp.hasMatch(value) &&
        errors.contains(kInvalidEmailError)) {
      setState(() {
        errors.remove(kInvalidEmailError);
      });
    }

    return null;
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) => emailOnChanged(value),
      validator: (value) => emailValidator(value),
      decoration: InputDecoration(
        labelText: "E-mail",
        hintText: "Digite seu E-mail",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/Mail.svg'),
      ),
    );
  }
  
  // pass
  String passValidator(String value) {
    if (value.isEmpty && !errors.contains(kPassNullError)) {
      setState(() {
        errors.add(kPassNullError);
      });
      return '';
    } else if (value.length < 8 && !errors.contains(kShortPassError)) {
      setState(() {
        errors.add(kShortPassError);
      });
      return '';
    }

    return null;
  }

  String passOnChanged(String value) {
    if (value.isNotEmpty && errors.contains(kPassNullError)) {
      setState(() {
        errors.remove(kPassNullError);
      });
    } else if (value.length > 8 && errors.contains(kShortPassError)) {
      setState(() {
        errors.remove(kShortPassError);
      });
    }
    password = value;
    return null;
  }

  TextFormField buildPassFormField() {
    return TextFormField(
      obscureText: true,
      validator: (value) => passValidator(value),
      onChanged: (value) => passOnChanged(value),
      onSaved: (newValue) => password = newValue,
      decoration: InputDecoration(
        labelText: "Senha",
        hintText: "Digite sua senha",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/Lock.svg'),
      ),
    );
  }

  // confirm pass
  String passConfirmValidator(String value) {
    if (value.isEmpty) {
      return '';
    } else if (password != value && !errors.contains(kMatchPassError)) {
      setState(() {
        errors.add(kMatchPassError);
      });
      return '';
    }

    return null;
  }

  String passConfirmOnChanged(String value) {
    if (password == value) {
      setState(() {
        errors.remove(kMatchPassError);
      });
    } 
    return null;
  }

  TextFormField buildPassConfirmFormField() {
    return TextFormField(
      obscureText: true,
      validator: (value) => passConfirmValidator(value),
      onChanged: (value) => passOnChanged(value),
      onSaved: (newValue) => confirm_password = newValue,
      decoration: InputDecoration(
        labelText: "Confirmar senha",
        hintText: "Digite a senha novamente",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/Lock.svg'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPassFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPassConfirmFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: 'Continuar',
            onPressed: () {
              if (_formKey.currentState.validate()) {
                Navigator.pushNamed(context, CompleteProfileScreen.routeName);
              }
            },
          )
        ],
      ),
    );
  }
}