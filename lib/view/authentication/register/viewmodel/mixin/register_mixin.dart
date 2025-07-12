import 'package:case_film_app/view/authentication/register/service/IRegisterService.dart';
import 'package:case_film_app/view/authentication/register/service/register_service.dart';
import 'package:case_film_app/view/authentication/register/viewmodel/register_view_model.dart';
import 'package:flutter/material.dart';

mixin RegisterViewMixin<T extends StatefulWidget> on State<T> {
  late final IRegisterService registerService;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController nameController;
  late final RegisterViewModel _registerViewModel;

  RegisterViewModel get registerViewModel => _registerViewModel;

  @override
  void initState() {
    super.initState();
    registerService = RegisterService(context: context);
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    nameController = TextEditingController();

    _registerViewModel = RegisterViewModel(registerService: registerService);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nameController.dispose();
    super.dispose();
  }
}
