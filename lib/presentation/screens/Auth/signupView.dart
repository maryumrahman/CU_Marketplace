import 'package:connect_ummah/configs/constants/extensions.dart';
import 'package:connect_ummah/navigation/navigation_helper.dart';

import 'package:flutter/material.dart';

import '../../../configs/constants/assets.dart';
import '../../../configs/constants/strings.dart';
import '../../elements/app_textfield.dart';
import '../../elements/textfield.dart';
import '../views/bottom_navigation_bar_view.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _invitationCodeController =
  TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
  TextEditingController();

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
                      .space(width: 80, height: 80)
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
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: context.colorScheme.outline,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        16.height,
                        AppText(
                          text: AppStrings.kStringSignUp,
                          fontSize: 24,
                          color: context.colorScheme.secondary,
                          fontWeight: FontWeight.w900,
                        ),
                        5.height,
                        AppText(
                          text: AppStrings.kStringSignUpDesc,
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
                          controller: _emailController,
                          hintText: AppStrings.kStringEmailHint,
                          labelText: AppStrings.kStringEmailLabel,
                          isPasswordField: false,
                          validator: (String? v) {
                            if (v!.isEmpty) {
                              return AppStrings.kStringEmailValidator;
                            }
                            return null;
                          },
                        ),
                        16.height,
                        AppTextField(
                          controller: _invitationCodeController,
                          hintText: AppStrings.kStringUserInvitationCodeHint,
                          labelText: AppStrings.kStringUserInvitationCodeLabel,
                          isPasswordField: false,
                          validator: (String? v) {
                            if (v!.isEmpty) {
                              return AppStrings.kStringUserInvitationCodeValidator;
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
                        16.height,
                        AppTextField(
                          controller: _confirmPasswordController,
                          hintText: AppStrings.kStringConfirmPasswordHint,
                          labelText: AppStrings.kStringConfirmPasswordLabel,
                          isPasswordField: true,
                          validator: (String? v) {
                            if (v!.isEmpty) {
                              return AppStrings.kStringConfirmPasswordValidator;
                            } else if (v != _passwordController.text) {
                              return AppStrings.kStringPasswordNotMatchValidator;
                            }
                            return null;
                          },
                        ),
                        30.height,
                        ElevatedButton(
                          onPressed: () {
                            NavigationHelper.pushReplacement(
                                context, BottomNavigationBarView());
                          },
                          child: const Text(AppStrings.kStringSignUp),
                        ).space(width: double.infinity, height: 56),
                      ],
                    )),
                20.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const AppText(
                      text: AppStrings.kStringAlreadyHaveAnAccount,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    TextButton(
                        onPressed: () {
                          NavigationHelper.pop(context);
                        },
                        child: const AppText(
                          text: AppStrings.kStringLogin,
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