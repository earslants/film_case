import 'package:case_film_app/core/init/navigation/navigation_route.dart';
import 'package:case_film_app/core/init/navigation/navigation_service.dart';
import 'package:case_film_app/core/init/notifier/global_notifier.dart';
import 'package:case_film_app/core/init/notifier/provider_list.dart';
import 'package:case_film_app/view/authentication/login/view/login_view.dart';
import 'package:case_film_app/view/authentication/splash/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [...ApplicationProvider.instance.dependItems],
      child: Consumer<GlobalNotifier>(
        builder: (context, globalNotifier, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Film App',
            navigatorKey: NavigationService.instance.navigatorKey,
            onGenerateRoute: NavigationRoute.instance.generateRoute,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('tr', 'TR'), // Turkish
              Locale('en', 'US'), // English
            ],
            locale: globalNotifier.locale,
            home: const SplashView(),
          );
        },
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 217,
          width: 111,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: RadialGradient(
              colors: [
                Color(0xFF5949E6),
                Color(0xFFE50914),
              ],
              center: Alignment(-0.4, -0.6),
              radius: 1.8,
            ),
          ),
        ),
      ),
    );
  }
}
