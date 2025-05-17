import 'package:ecommerce_app/SplashScreen.dart';
import 'package:ecommerce_app/features/Address/address_Screen.dart';
import 'package:ecommerce_app/features/AuthScreen/LoginScreen.dart';

import 'package:ecommerce_app/features/AuthScreen/Sign_up_Screen.dart';
import 'package:ecommerce_app/features/CartScreen/CartScreen.dart';
import 'package:ecommerce_app/features/DetailsScreen/DetailsScreen.dart';
import 'package:ecommerce_app/features/HomeScreen/HomeScreen.dart';
import 'package:ecommerce_app/features/MainScreen/MainScreen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/Register':
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case '/Main':
        return MaterialPageRoute(builder: (_) => MainScreen());
      case '/Home':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/Details':
        return MaterialPageRoute(builder: (_) => Detailsscreen());
      case '/Address':
        return MaterialPageRoute(builder: (_) => AddressScreen());
      case '/Cart':
        return MaterialPageRoute(builder: (_) => Cartscreen());
      case '/Login':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}
