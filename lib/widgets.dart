import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

InputDecoration textFieldInputDecoration(String hint, BuildContext context) {
  return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: Colors.black),
      focusedBorder: UnderlineInputBorder(
          borderSide:
              BorderSide(color: Theme.of(context).accentColor, width: 3.0)),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).accentColor,
          width: 1.0,
        ),
      ),
      focusColor: Theme.of(context).accentColor);
}

TextField textInputWidget(String hint, BuildContext context) {
  return TextField(
    decoration: textFieldInputDecoration(hint, context),
  );
}
TextField numberInputWidget(String hint, BuildContext context) {
  return TextField(
    decoration: textFieldInputDecoration(hint, context),
    keyboardType: TextInputType.number,

  );
}

TextStyle headTextStyle() {
  return TextStyle(
    color: Colors.black,
    fontSize: 18,
  );
}
