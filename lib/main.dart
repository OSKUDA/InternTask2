import 'package:flutter/material.dart';
import 'screens/homepage_screen.dart';
import 'screens/dashboard_screen.dart';
import 'package:provider/provider.dart';
import 'provider/authentication_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthenticationState(),
      child: MaterialApp(
        initialRoute: HomePageScreen.id,
        routes: {
          HomePageScreen.id: (context) => HomePageScreen(),
          DashboardScreen.id: (context) => DashboardScreen(),
        },
      ),
    );
  }
}
