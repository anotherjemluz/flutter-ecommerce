import 'package:ecommerce/components/custom_suffix_icon.dart';
import 'package:ecommerce/components/default_button.dart';
import 'package:ecommerce/components/form_error.dart';
import 'package:ecommerce/screens/forgot_password/forgot_password_screen.dart';
import 'package:ecommerce/screens/login_sucess/login_sucess_screen.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  bool remember = false;

  final List<String> errors = [];

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

  TextFormField buildPassFormField() {
    return TextFormField(
      obscureText: true,
      validator: (value) => passValidator(value),
      onChanged: (value) => passOnChanged(value),
      decoration: InputDecoration(
        labelText: "Senha",
        hintText: "Digite sua senha",
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
          Row(
            children: <Widget>[
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value;                   
                  });
                },
              ),
              Text('Lembrar de mim'),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.popAndPushNamed(context, ForgotPasswordScreen.routeName),
                child: Text(
                  'Esqueceu a senha?',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
              SizedBox(width: 10)
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: 'Continuar',
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                Navigator.pushNamed(context, LoginSucessScreen.routeName);
              }
            },
          )
        ],
      ),
    );
  }
}
