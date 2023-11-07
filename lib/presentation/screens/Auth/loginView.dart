import 'package:connect_ummah/configs/constants/extensions.dart';

import 'package:connect_ummah/presentation/screens/Auth/signupView.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../configs/constants/assets.dart';
import '../../../configs/constants/strings.dart';

import '../../../navigation/navigation_helper.dart';
import '../../elements/app_textfield.dart';
import '../../elements/textfield.dart';
import '../../providers/remember_me_provider.dart';
import '../views/bottom_navigation_bar_view.dart';
import 'forgot_password_view.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                40.height,
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(Assets.imagesAppLogo)
                      .space(width: 80, height: 80),
                ),
                10.height,
                AppText(
                  text: AppStrings.kStringAppName,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: context.theme.primaryColor,
                ),
                40.height,
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: context.colorScheme.outline,
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 16.0, right: 16, left: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            16.height,
                            AppText(
                              text: AppStrings.kStringLogin,
                              fontSize: 24,
                              color: context.colorScheme.secondary,
                              fontWeight: FontWeight.w900,
                            ),
                            5.height,
                            AppText(
                              text: AppStrings.kStringLoginDesc,
                              fontSize: 14,
                              color: context.colorScheme.outlineVariant,
                              fontWeight: FontWeight.w500,
                              maxLines: 3,
                            ),
                            24.height,
                            AppTextField(
                              controller: _usernameController,
                              hintText: AppStrings.kStringUsernameHint,
                              labelText: AppStrings.kStringUsernameLabel,
                              prefix: const Icon(CupertinoIcons.person),
                              isPasswordField: false,
                              validator: (String? v) {
                                if (v!.isEmpty) {
                                  return AppStrings.kStringUsernameValidator;
                                }
                                return null;
                              },
                            ),
                            16.height,
                            AppTextField(
                              controller: _passwordController,
                              hintText: AppStrings.kStringPasswordHint,
                              labelText: AppStrings.kStringPasswordLabel,
                              isPasswordField: true,
                              validator: (String? v) {
                                if (v!.isEmpty) {
                                  return AppStrings.kStringPasswordValidator;
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 2.0),
                        child: Row(
                          children: [
                            Checkbox(
                              value: false,
                              onChanged: (val) {
                                context.read<RememberMe>().toggle();
                              },
                            ),
                            const AppText(
                              text: AppStrings.kStringRememberMe,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            20.height,
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                      return BottomNavigationBarView();
                                    }));
                              },
                              child: const Text(AppStrings.kStringLogin),
                            ).space(width: double.infinity, height: 56),
                            10.height,
                            TextButton(
                                onPressed: () {
                                  NavigationHelper.push(
                                      context, ForgotPasswordView());
                                },
                                child: const AppText(
                                  text: AppStrings.kStringForgotPassword,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 16,
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                20.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const AppText(
                      text: AppStrings.kStringDontHaveAnAccount,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    TextButton(
                        onPressed: () {
                          NavigationHelper.push(context, SignUpView());
                        },
                        child: const AppText(
                          text: AppStrings.kStringSignUp,
                          fontWeight: FontWeight.w900,
                          fontSize: 16,
                        )),
                  ],
                ),
                30.height,
              ],
            ),
          ),
        ),
      ),
    );
  }
}