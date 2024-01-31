import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:get/get.dart';
import 'package:shoe_app/global_widgets/textfield.ui.dart';

import '../resources/icons.res.dart';
import '../resources/strings.res.dart';

class PasswordFieldUi extends StatelessWidget {
  const PasswordFieldUi({
    super.key,
    required this.hintText,
    required this.controller,
    this.onChanged,
    this.validator = const [],
    this.focusNode,
    this.onTap,
    this.autofocus = false,
  });

  final String hintText;
  final TextEditingController controller;
  final ValueChanged<String?>? onChanged;
  final List<FormFieldValidator<String?>> validator;
  final FocusNode? focusNode;
  final VoidCallback? onTap;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    final obscureText = true.obs;
    return Obx(
      () => TextFieldUi(
        obscureText: obscureText.value,
        autofocus: autofocus,
        onChanged: onChanged,
        controller: controller,
        hintText: hintText,
        focusNode: focusNode,
        onTap: onTap,
        helperText:
            r'Password should be made up of alphabets and numbers of 8 characters (Acceptable characters are A-Z, a-z, 1-9, ! @ # $ *).',
        validator: FormBuilderValidators.compose(
          [
            FormBuilderValidators.match(
              passwordRegEx,
            ),
            FormBuilderValidators.required<String>(
              errorText: 'A valid email address is required to proceed',
            ),
            ...validator,
          ],
        ),
        suffixIcon: GestureDetector(
          onTap: obscureText.toggle,
          child: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: SvgPicture.asset(
              obscureText.value ? eyeIcon : slashedEyeIcon,
            ),
          ),
        ),
      ),
    );
  }
}
