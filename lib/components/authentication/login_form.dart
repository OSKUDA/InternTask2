import 'package:flutter/material.dart';
import 'package:housy_inter_task_2/components/authentication/custom_text_field.dart';
import 'package:housy_inter_task_2/components/authentication/custom_text_button.dart';
import 'package:housy_inter_task_2/screens/dashboard_screen.dart';
import 'package:housy_inter_task_2/services/storage.dart';
import 'package:housy_inter_task_2/provider/authentication_state.dart';
import 'package:housy_inter_task_2/utils/constants.dart';

class LoginForm extends StatefulWidget {
  final AuthenticationState authenticationState;
  LoginForm({required this.authenticationState});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    String? name;
    String? password;
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
        SizedBox(height: 25.0),
        CustomTextField(
          labelText: 'Password',
          hintText: 'Enter your password',
          customTextFieldInputType: CustomTextFieldInputType.password,
          callback: (value) {
            password = value;
          },
        ),
        SizedBox(height: 10.0),
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
              buttonTitle: 'LogIn',
              callback: () async {
                bool status = await Storage().readAndVerifyUserCredential(
                    name: name!, password: password!);
                if (status) {
                  widget.authenticationState
                      .updateLoginState(ApplicationLoginState.loggedIn);
                  Navigator.of(context).pushNamed(DashboardScreen.id);
                } else {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      backgroundColor: kCardBackgroundColor,
                      title: Text('Authentication Error!!'),
                      content: Text(
                          'Login credential doesn\'t match.\nCheck again.'),
                      actions: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: kPrimaryColor),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Cancle',
                              style: TextStyle(color: Colors.black54),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ],
        )
      ],
    );
  }
}
