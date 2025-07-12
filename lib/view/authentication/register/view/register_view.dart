import 'dart:math';

import 'package:case_film_app/core/base/state/base_state.dart';
import 'package:case_film_app/core/constants/navigation/navigation_constants.dart';
import 'package:case_film_app/core/init/navigation/navigation_service.dart';
import 'package:case_film_app/product/components/my_text_field.dart';
import 'package:case_film_app/view/authentication/register/model/register_request_model.dart';
import 'package:case_film_app/view/authentication/register/viewmodel/mixin/register_mixin.dart';
import 'package:case_film_app/view/authentication/register/viewmodel/register_view_model.dart';
import 'package:case_film_app/view/authentication/register/viewmodel/state/register_state.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../product/components/social_button.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends BaseState<RegisterView>
    with RegisterViewMixin {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BlocProvider(
      create: (context) => registerViewModel,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: symmetricPadding(0, dynamicWidth(.1)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 15,
                child: SizedBox(),
              ),
              Expanded(
                flex: 85,
                child: Column(
                  children: [
                    Text(
                      l10n.registerWelcome,
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
                          controller: nameController,
                          prefixIcon: Icons.person_2_outlined,
                          hintText: l10n.fullName,
                        ),
                        SizedBox(height: dynamicHeight(.02)),
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
                        SizedBox(height: dynamicHeight(.02)),
                        MyTextField(
                          controller: confirmPasswordController,
                          prefixIcon: Icons.lock_outline,
                          hintText: l10n.passwordAgain,
                        ),
                        SizedBox(height: dynamicHeight(.03)),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color: Colors.white.withOpacity(.5),
                              fontSize: 12,
                            ),
                            children: [
                              TextSpan(
                                text: l10n.agreeTerms,
                              ),
                              TextSpan(
                                text: l10n.agreeAndAccept,
                                style: const TextStyle(
                                  color: Colors.white,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w500,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // Tıklandığında yapılacak işlem
                                    print("Sözleşme metnine tıklandı.");
                                    // örn: Navigator.push(context, MaterialPageRoute(...));
                                  },
                              ),
                              TextSpan(
                                text: l10n.continueAgreement,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: dynamicHeight(.03)),
                        GestureDetector(
                          onTap: () {
                            if (passwordController.text ==
                                confirmPasswordController.text) {
                              registerViewModel.register(
                                RegisterRequestModel(
                                  email: emailController.text,
                                  name: nameController.text,
                                  password: passwordController.text,
                                ),
                              );
                            }
                          },
                          child: Container(
                            height: dynamicHeight(.07),
                            width: dynamicWidth(.8),
                            decoration: BoxDecoration(
                              color: Color(0xFFE50914),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Center(
                              child:
                                  BlocBuilder<RegisterViewModel, RegisterState>(
                                builder: (context, state) {
                                  if (state.isLoading) {
                                    return CircularProgressIndicator.adaptive(
                                      backgroundColor: Colors.white,
                                    );
                                  }
                                  return Text(
                                    l10n.registerButton,
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
                              l10n.alreadyHaveAccount,
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
                                  path: NavigationConstants.LOGIN,
                                );
                              },
                              child: Text(
                                l10n.goToLogin,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
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
