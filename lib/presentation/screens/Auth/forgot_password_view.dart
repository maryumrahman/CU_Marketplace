
import 'package:connect_ummah/configs/constants/extensions.dart';
import 'package:flutter/material.dart';

import '../../../configs/constants/strings.dart';
import '../../elements/app_textfield.dart';
import '../../elements/textfield.dart';

class ForgotPasswordView extends StatelessWidget {
  ForgotPasswordView({super.key});

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              30.height,
              Container(
                padding: const EdgeInsets.all(16),
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
                      text: AppStrings.kStringForgotPassword,
                      fontSize: 24,
                      color: context.colorScheme.secondary,
                      fontWeight: FontWeight.w900,
                    ),
                    5.height,
                    AppText(
                      text: AppStrings.kStringForgotPasswordDesc,
                      fontSize: 14,
                      color: context.colorScheme.outlineVariant,
                      fontWeight: FontWeight.w400,
                      maxLines: 3,
                    ),
                    24.height,
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
                      onPressed: () {},
                      child: const Text(AppStrings.kStringUpdatePassword),
                    ).space(width: double.infinity, height: 56),
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