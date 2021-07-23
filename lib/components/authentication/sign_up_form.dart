import 'package:flutter/material.dart';
import 'package:housy_inter_task_2/components/authentication/custom_text_button.dart';
import 'package:housy_inter_task_2/components/authentication/custom_text_field.dart';
import 'package:housy_inter_task_2/provider/authentication_state.dart';
import 'package:housy_inter_task_2/screens/dashboard_screen.dart';
import 'package:housy_inter_task_2/services/storage.dart';
import 'package:housy_inter_task_2/utils/constants.dart';

class SignUpForm extends StatefulWidget {
  final AuthenticationState authenticationState;
  SignUpForm({required this.authenticationState});

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  String? name;
  String? password;
  String? email;
  String? phone;
  String? profession;
  List<String> professionList = [
    'Android Developer',
    'Flutter Developer',
    'Backend Engineer',
    'Cloud Engineer',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomTextField(
          labelText: 'Name',
          hintText: 'Enter your name',
          customTextFieldInputType: CustomTextFieldInputType.text,
          callback: (value) {
            name = value;
          },
        ),
        SizedBox(height: 5.0),
        CustomTextField(
          labelText: 'Password',
          hintText: 'Enter your password',
          customTextFieldInputType: CustomTextFieldInputType.password,
          callback: (value) {
            password = value;
          },
        ),
        SizedBox(height: 5.0),
        CustomTextField(
          labelText: 'Email',
          hintText: 'Enter your email',
          customTextFieldInputType: CustomTextFieldInputType.email,
          callback: (value) {
            email = value;
          },
        ),
        SizedBox(height: 5.0),
        CustomTextField(
          labelText: 'Phone Number',
          hintText: 'Enter your phone',
          customTextFieldInputType: CustomTextFieldInputType.phone,
          callback: (value) {
            phone = value;
          },
        ),
        SizedBox(height: 5.0),
        SizedBox(
          child: DropdownButton<String>(
            value: profession,
            dropdownColor: kCardBackgroundColor,
            hint: Text(
              'Choose your profession',
              style: TextStyle(color: kTextFieldHintColor),
            ),
            items: professionList.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(color: Colors.white70),
                ),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                profession = value;
              });
            },
          ),
        ),
        SizedBox(height: 5.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextButton(
              buttonTitle: 'Back',
              callback: () {
                widget.authenticationState
                    .updateLoginState(ApplicationLoginState.loggedOut);
              },
            ),
            SizedBox(width: 15.0),
            CustomTextButton(
              buttonTitle: 'SignUp',
              callback: () async {
                // assuming details are not null
                await Storage().storeUserCredential(
                  name: name!,
                  password: password!,
                  email: email!,
                  phone: phone!,
                  profession: profession!,
                );
                widget.authenticationState
                    .updateLoginState(ApplicationLoginState.loggedIn);
                Navigator.of(context).pushNamed(DashboardScreen.id);
              },
            ),
          ],
        ),
      ],
    );
  }
}
