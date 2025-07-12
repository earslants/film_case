import 'package:case_film_app/view/authentication/auth_gate/auth_gate.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const AuthGate()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // LOGO veya animasyon
            Image.asset("images/google_icon.png", height: 100),
            const SizedBox(height: 20),
            const CircularProgressIndicator.adaptive(
              backgroundColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
