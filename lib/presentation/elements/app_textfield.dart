import 'package:connect_ummah/configs/constants/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_textfield_provider.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.labelText,
    this.validator,
    this.onChanged,
    this.textInputType,
    this.isPasswordField = false,
    this.readOnly,
    this.textCapitalization,
    this.prefixIcon,
    this.maxLines,
    this.prefix,
  });

  final TextEditingController controller;
  final String hintText;
  final String? labelText;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final TextInputType? textInputType;
  final bool isPasswordField;
  final bool? readOnly;
  final TextCapitalization? textCapitalization;
  final Widget? prefixIcon;
  final int? maxLines;
  final Widget? prefix;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => AppTextFieldProvider()..initObscureText(isPasswordField),
        builder: (context, child) {
          final appTextFieldProvider = context.watch<AppTextFieldProvider>();
          return TextFormField(
            maxLines: maxLines ?? 1,
            validator: validator,
            textCapitalization: textCapitalization ?? TextCapitalization.none,
            readOnly: readOnly ?? false,
            obscureText: appTextFieldProvider.obscureText,
            controller: controller,
            onTapOutside: (event) =>
                FocusManager.instance.primaryFocus?.unfocus(),
            keyboardType: textInputType ?? TextInputType.text,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: context.colorScheme.primary,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: context.colorScheme.outline),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: context.colorScheme.outline),
              ),
              hintText: hintText,
              labelText: labelText,
              prefixIcon: prefixIcon,
              suffixIcon: isPasswordField
                  ? IconButton(
                  onPressed: () {
                    appTextFieldProvider.toggle();
                  },
                  icon: appTextFieldProvider.obscureText
                      ? const Icon(CupertinoIcons.lock)
                      : const Icon(CupertinoIcons.person))
                  : prefix ,
            ),
          );
        });
  }
}