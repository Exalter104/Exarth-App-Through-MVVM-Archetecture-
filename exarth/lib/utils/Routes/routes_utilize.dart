// import 'package:exarth/utils/Routes/routes_name.dart';
// import 'package:exarth/views/Screens/home_screen.dart';
// import 'package:exarth/views/screens_views/login_screen_view.dart';
// import 'package:flutter/material.dart';
// ignore_for_file: unused_local_variable, no_duplicate_case_values

import 'package:exarth/utils/Routes/routes_name.dart';
// import 'package:exarth/views/Screens/deliverylist.dart';
import 'package:exarth/views/Screens/home_screen.dart';
import 'package:exarth/views/screens_views/login_screen_view.dart';
// import 'package:exarth/views/screens_views/splash_view.dart';
import 'package:flutter/material.dart';

class RoutesUtilizes {
  static Route<dynamic> ongeneratedRoutes(RouteSettings settings) {
    final argu = settings.arguments;
    switch (settings.name) {
      // case RoutesNames.splashView:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => SplashView());
      case RoutesNames.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => LoginScreenView());
      case RoutesNames.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen());
      // case RoutesNames.deliveryList:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => DeliveryList());

      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Text("No Routes Are Defined"),
          );
        });
    }
  }
}
