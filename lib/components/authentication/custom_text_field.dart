import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:housy_inter_task_2/utils/constants.dart';

enum CustomTextFieldInputType {
  password,
  email,
  phone,
  text,
}

class CustomTextField extends StatelessWidget {
  final CustomTextFieldInputType customTextFieldInputType;
  final String labelText;
  final String hintText;
  final TextEditingController? textController;
  final Function(String?) callback;
  CustomTextField(
      {required this.labelText,
      required this.hintText,
      this.textController,
      required this.customTextFieldInputType,
      required this.callback});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 0.0,
        horizontal: 30.0,
      ),
      child: TextField(
        keyboardType: customTextFieldInputType == CustomTextFieldInputType.phone
            ? TextInputType.phone
            : (customTextFieldInputType == CustomTextFieldInputType.email
                ? TextInputType.emailAddress
                : TextInputType.text),
        controller: textController == null ? null : textController,
        obscureText:
            customTextFieldInputType == CustomTextFieldInputType.password
                ? true
                : false,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            color: Colors.grey,
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: kTextFieldHintColor),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15.0),
              ),
              borderSide: BorderSide(
                color: kTextFieldBorderColor,
                width: 1.0,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
              borderSide: BorderSide(
                color: Colors.grey,
                width: 1.25,
              )),
        ),
        style: TextStyle(
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
        onChanged: callback,
      ),
    );
  }
}
