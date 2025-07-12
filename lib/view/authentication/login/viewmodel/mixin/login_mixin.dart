import 'package:case_film_app/view/authentication/login/service/ILoginService.dart';
import 'package:case_film_app/view/authentication/login/service/login_service.dart';
import 'package:flutter/material.dart';
import '../login_view_model.dart';

mixin LoginViewMixin<T extends StatefulWidget> on State<T> {
  late final ILoginService loginService;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late final LoginViewModel _loginViewModel;

  LoginViewModel get loginViewModel => _loginViewModel;

  @override
  void initState() {
    super.initState();
    loginService = LoginService(context: context);
    emailController = TextEditingController();
    passwordController = TextEditingController();

    _loginViewModel = LoginViewModel(loginService: loginService);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
