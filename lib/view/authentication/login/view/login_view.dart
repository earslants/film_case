import 'package:case_film_app/core/base/state/base_state.dart';
import 'package:case_film_app/core/constants/navigation/navigation_constants.dart';
import 'package:case_film_app/core/init/navigation/navigation_service.dart';
import 'package:case_film_app/core/init/notifier/global_notifier.dart';
import 'package:case_film_app/product/components/my_text_field.dart';
import 'package:case_film_app/view/authentication/auth_gate/auth_gate.dart';
import 'package:case_film_app/view/authentication/login/model/login_request_model.dart';
import 'package:case_film_app/view/authentication/login/viewmodel/login_view_model.dart';
import 'package:case_film_app/view/authentication/login/viewmodel/mixin/login_mixin.dart';
import 'package:case_film_app/view/authentication/login/viewmodel/state/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../../product/components/social_button.dart';

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
      child: BlocListener<LoginViewModel, LoginState>(
        listener: (context, state) {
          if (state.isSuccess) {
            NavigationService.instance
                .navigateToPageClear(path: NavigationConstants.HOME);
          }
        },
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Padding(
            padding: symmetricPadding(0, dynamicWidth(.1)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Consumer<GlobalNotifier>(
                  builder: (context, globalNotifier, child) {
                    return Expanded(
                      flex: 35,
                      child: SafeArea(
                        child: Align(
                          alignment: Alignment.topRight,
                          child: buildSelectLanguage(context),
                        ),
                      ),
                    );
                  },
                ),
                Expanded(
                  flex: 65,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
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
                        ],
                      ),
                      SizedBox(height: dynamicHeight(.02)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyTextField(
                            controller: emailController,
                            prefixIcon: Icons.email_outlined,
                            hintText: l10n.email,
                          ),
                          SizedBox(height: dynamicHeight(.02)),
                          MyTextField(
                            controller: passwordController,
                            prefixIcon: Icons.lock_outline,
                            hintText: l10n.password,
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
                        ],
                      ),
                      SafeArea(
                        child: Row(
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
                            GestureDetector(
                              onTap: () {
                                NavigationService.instance.navigateToPage(
                                  path: NavigationConstants.REGISTER,
                                );
                              },
                              child: Text(
                                l10n.registerNow,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildSelectLanguage(BuildContext context) {
    return Container(
      padding: symmetricPadding(6, 6),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white.withOpacity(.5),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value:
              context.watch<GlobalNotifier>().locale.languageCode.toUpperCase(),
          icon: const SizedBox.shrink(),
          dropdownColor: Colors.black,
          items: [
            DropdownMenuItem(
              value: "TR",
              child: Text(
                "TR",
                style: TextStyle(
                  color: Colors.white.withOpacity(.5),
                  fontWeight: FontWeight.w500,
                  fontSize: 10,
                ),
              ),
            ),
            DropdownMenuItem(
              value: "EN",
              child: Text(
                "EN",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 10,
                ),
              ),
            ),
          ],
          onChanged: (String? newLocale) {
            if (newLocale != null) {
              final locale = Locale(newLocale.toLowerCase(), newLocale);
              context.read<GlobalNotifier>().setLocale(locale);
            }
          },
        ),
      ),
    );
  }
}
