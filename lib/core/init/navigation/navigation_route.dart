import 'package:case_film_app/core/constants/navigation/navigation_constants.dart';
import 'package:case_film_app/view/authentication/auth_gate/auth_gate.dart';
import 'package:case_film_app/view/authentication/login/view/login_view.dart';
import 'package:case_film_app/view/authentication/register/view/register_view.dart';
import 'package:case_film_app/view/authentication/splash/splash_view.dart';
import 'package:case_film_app/view/home.dart';
import 'package:flutter/material.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NavigationConstants.DEFAULT:
        return normalNavigate(const SplashView(), NavigationConstants.DEFAULT);
      case NavigationConstants.LOGIN:
        return normalNavigate(const LoginView(), NavigationConstants.LOGIN);
      case NavigationConstants.REGISTER:
        return normalNavigate(
            const RegisterView(), NavigationConstants.REGISTER);
      case NavigationConstants.AUTHGATE:
        return normalNavigate(const AuthGate(), NavigationConstants.AUTHGATE);
      case NavigationConstants.HOME:
        return normalNavigate(const HomeView(), NavigationConstants.HOME);

      default:
        return notFoundNavigate();
    }
  }

  MaterialPageRoute notFoundNavigate() => MaterialPageRoute(
        builder: (context) => const SizedBox(), // TODO: Not found view oluştur.
      );

  MaterialPageRoute normalNavigate(Widget widget, String pageName) {
    return MaterialPageRoute(
      builder: (context) => widget,
      settings: RouteSettings(name: pageName),
    );
  }
}
