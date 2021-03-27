import 'package:ecommerce/components/custom_suffix_icon.dart';
import 'package:ecommerce/components/default_button.dart';
import 'package:ecommerce/components/form_error.dart';
import 'package:ecommerce/screens/otp/otp_screen.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class CompleteProfileForm extends StatefulWidget {
  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];

  String firstName, lastName, phoneNumber, adress;

  void addError({String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  // first name
  String firstNameValidator(String value) {
    if (value.isEmpty) {
      addError(error: kNamelNullError);
      return '';
    }

    return null;
  }

  String firstNameOnChanged(String value) {
    if (value.isNotEmpty) {
      removeError(error: kNamelNullError);
    }
    return null;
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      onSaved: (newValue) => firstName = newValue,
      onChanged: (value) => firstNameOnChanged(value),
      validator: (value) => firstNameValidator(value),
      decoration: InputDecoration(
        labelText: "Nome",
        hintText: "Digite seu nome",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/User.svg'),
      ),
    );
  }

  // last name
  TextFormField buildLastNameFormField() {
    return TextFormField(
      onSaved: (newValue) => lastName = newValue,
      decoration: InputDecoration(
        labelText: "Sobrenome",
        hintText: "Digite seu sobrenome",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/User.svg'),
      ),
    );
  }

  // phone number
  String phoneNumberValidator(String value) {
    if (value.isEmpty) {
      addError(error: kPhoneNumberNullError);
      return '';
    }

    return null;
  }

  String phoneNumberOnChanged(String value) {
    if (value.isNotEmpty) {
      removeError(error: kPhoneNumberNullError);
    }
    return null;
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      onSaved: (newValue) => phoneNumber = newValue,
      validator: (value) => phoneNumberValidator(value),
      onChanged: (value) => phoneNumberOnChanged(value),
      decoration: InputDecoration(
        labelText: "Telefone",
        hintText: "+00 (00) 0 0000-0000",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/Phone.svg'),
      ),
    );
  }

  // adress
  String adressValidator(String value) {
    if (value.isEmpty) {
      addError(error: kAddressNullError);
      return '';
    }

    return null;
  }

  String adressOnChanged(String value) {
    if (value.isNotEmpty) {
      removeError(error: kAddressNullError);
    }
    return null;
  }

  TextFormField buildAdressFormField() {
    return TextFormField(
      onSaved: (newValue) => adress = newValue,
      validator: (value) => adressValidator(value),
      onChanged: (value) => adressOnChanged(value),
      decoration: InputDecoration(
        labelText: "Endereço",
        hintText: "Digite seu endereço",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
            CustomSuffixIcon(svgIcon: 'assets/icons/Location point.svg'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Column(
          children: <Widget>[
            buildFirstNameFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildLastNameFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildPhoneNumberFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildAdressFormField(),
            FormError(errors: errors),
            SizedBox(height: getProportionateScreenHeight(40)),
            DefaultButton(
              text: 'Continuar',
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  Navigator.pushNamed(context, OtpScreen.routeName);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
