import 'package:exarth/utils/Routes/routes_name.dart';
import 'package:exarth/views/Screens/home_screen.dart';
import 'package:exarth/views/screens_views/login_screen_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // ignore: unused_local_variable
    final argues = settings.arguments;
    switch (settings.name) {
      case RoutesNames.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());

      case RoutesNames.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen());

      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Text("No Routes Defines"),
          );
        });
    }
  }
}
