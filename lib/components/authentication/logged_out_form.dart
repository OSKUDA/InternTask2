import 'package:flutter/material.dart';
import 'package:housy_inter_task_2/components/authentication/custom_text_button.dart';
import 'package:housy_inter_task_2/provider/authentication_state.dart';

class LoggedOutForm extends StatelessWidget {
  final AuthenticationState authenticationState;
  LoggedOutForm({required this.authenticationState});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 150.0,
          height: 80.0,
          child: CustomTextButton(
            buttonTitle: 'SignUp',
            callback: () {
              authenticationState
                  .updateLoginState(ApplicationLoginState.signUp);
            },
          ),
        ),
        SizedBox(
          height: 25.0,
        ),
        SizedBox(
          width: 150.0,
          height: 80.0,
          child: CustomTextButton(
            buttonTitle: 'Login',
            callback: () {
              authenticationState.updateLoginState(ApplicationLoginState.login);
            },
          ),
        ),
      ],
    );
  }
}
