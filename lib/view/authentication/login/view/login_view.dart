import 'package:case_film_app/core/base/state/base_state.dart';
import 'package:case_film_app/view/authentication/login/model/login_request_model.dart';
import 'package:case_film_app/view/authentication/login/viewmodel/login_view_model.dart';
import 'package:case_film_app/view/authentication/login/viewmodel/mixin/login_mixin.dart';
import 'package:case_film_app/view/authentication/login/viewmodel/state/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends BaseState<LoginView> with LoginViewMixin {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (context) => loginViewModel,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: symmetricPadding(0, dynamicWidth(.1)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 35,
                child: SizedBox(),
              ),
              Expanded(
                flex: 65,
                child: Column(
                  children: [
                    Text(
                      l10n.welcomeTitle,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: dynamicHeight(.01)),
                    Text(
                      l10n.welcomeDescription,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(height: dynamicHeight(.04)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyTextField(
                            controller: emailController,
                            prefixIcon: Icons.email_outlined,
                            hintText: "E-Posta"),
                        SizedBox(height: dynamicHeight(.02)),
                        MyTextField(
                          controller: passwordController,
                          prefixIcon: Icons.lock_outline,
                          hintText: "Şifre",
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.visibility_off_outlined),
                          ),
                        ),
                        SizedBox(height: dynamicHeight(.03)),
                        Text(
                          l10n.forgotPassword,
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: dynamicHeight(.03)),
                        GestureDetector(
                          onTap: () {
                            // loginViewModel.changeLoading();
                            loginViewModel.fetchLogin(
                              LoginRequestModel(
                                email: emailController.text,
                                password: passwordController.text,
                              ),
                            );
                          },
                          child: Container(
                            height: dynamicHeight(.07),
                            width: dynamicWidth(.8),
                            decoration: BoxDecoration(
                              color: Color(0xFFE50914),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Center(
                              child: BlocBuilder<LoginViewModel, LoginState>(
                                builder: (context, state) {
                                  if (state.isLoading) {
                                    return CircularProgressIndicator.adaptive(
                                      backgroundColor: Colors.white,
                                    );
                                  }
                                  return Text(
                                    l10n.login,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: dynamicHeight(.04)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SocialButton(
                              imagePath: "images/google_icon.png",
                            ),
                            SizedBox(width: dynamicWidth(.015)),
                            SocialButton(
                              imagePath: "images/apple_icon.png",
                            ),
                            SizedBox(width: dynamicWidth(.015)),
                            SocialButton(
                              imagePath: "images/facebook_icon.png",
                            ),
                          ],
                        ),
                        SizedBox(height: dynamicHeight(.04)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              l10n.noAccount,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: Colors.white.withOpacity(.5),
                              ),
                            ),
                            SizedBox(width: dynamicWidth(.01)),
                            Text(
                              l10n.registerNow,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
    required this.imagePath,
  });

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withOpacity(.2),
        ),
      ),
      child: Center(
        child: SizedBox(
          height: 35,
          width: 35,
          child: Image(
            fit: BoxFit.contain,
            image: AssetImage(
              imagePath,
            ),
          ),
        ),
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    required this.controller,
    required this.prefixIcon,
    required this.hintText,
    this.suffixIcon,
  });

  final TextEditingController controller;
  final IconData prefixIcon;
  final String hintText;
  final IconButton? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: Colors.white.withOpacity(.5),
      style: TextStyle(color: Colors.white, fontSize: 12),
      decoration: InputDecoration(
        prefixIcon: Icon(
          prefixIcon,
          color: Colors.white.withOpacity(.5),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.white.withOpacity(.5),
          fontSize: 12,
        ),
        fillColor: Colors.white.withOpacity(.1),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Colors.white.withOpacity(.2),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        suffixIcon: suffixIcon ?? SizedBox(),
      ),
    );
  }
}
