import 'package:case_film_app/core/constants/enums/locale_keys_enum.dart';
import 'package:case_film_app/core/init/cache/locale_manager.dart';
import 'package:case_film_app/view/authentication/login/view/login_view.dart';
import 'package:case_film_app/view/home/view/home_view.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    final token = LocaleManager.instance.getStringValue(PreferencesKeys.TOKEN);

    if (token.isNotEmpty) {
      return const HomeView();
    } else {
      return const LoginView();
    }
  }
}
