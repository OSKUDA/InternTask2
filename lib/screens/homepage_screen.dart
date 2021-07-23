import 'package:flutter/material.dart';
import 'package:housy_inter_task_2/provider/authentication_state.dart';
import 'package:housy_inter_task_2/components/authentication/logged_out_form.dart';
import 'package:housy_inter_task_2/components/authentication/login_form.dart';
import 'package:housy_inter_task_2/components/authentication/sign_up_form.dart';
import 'package:housy_inter_task_2/utils/constants.dart';
import 'package:provider/provider.dart';

class HomePageScreen extends StatelessWidget {
  static const String id = 'home_page_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Consumer<AuthenticationState>(
          builder: (context, authState, _) {
            switch (authState.getCurrentLoginState) {
              case ApplicationLoginState.loggedOut:
                return Center(
                  child: LoggedOutForm(authenticationState: authState),
                );
              case ApplicationLoginState.signUp:
                return SignUpForm(authenticationState: authState);
              case ApplicationLoginState.login:
                return LoginForm(authenticationState: authState);
              case ApplicationLoginState.loggedIn:
                return Center(
                  child: LoggedOutForm(authenticationState: authState),
                );
            }
          },
        ),
      ),
    );
  }
}
