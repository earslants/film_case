import 'package:case_film_app/core/constants/enums/locale_keys_enum.dart';
import 'package:case_film_app/core/init/cache/locale_manager.dart';
import 'package:case_film_app/view/authentication/auth_gate/auth_gate.dart';
import 'package:case_film_app/view/authentication/splash/splash_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            LocaleManager.instance.removeValue(PreferencesKeys.TOKEN);
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => const AuthGate()),
                (route) => false);
          },
          icon: Icon(
            Icons.logout,
          ),
        ),
      ),
    );
  }
}
