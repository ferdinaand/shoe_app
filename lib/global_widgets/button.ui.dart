// ignore_for_file: annotate_overrides, overridden_fields

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoe_app/resources/radius.res.dart';

import '../resources/colors.res.dart';
import '../resources/typograhy.res.dart';
import 'text.ui.dart';

class ButtonUi extends TextButton {
  const ButtonUi({
    super.key,
    required this.style,
    required this.child,
    this.onPressed,
  }) : super(
          style: style,
          onPressed: onPressed,
          child: child,
        );

  final ButtonStyle style;
  final Widget child;
  final VoidCallback? onPressed;
}

class PrimaryButtonUi extends ButtonUi {
  PrimaryButtonUi({
    super.key,
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.padding,
    this.loading = false,
  }) : super(
          style: ButtonStyle(
            alignment: Alignment.center,
            elevation: MaterialStateProperty.all(0),
            minimumSize: MaterialStateProperty.all(
              Size.fromHeight(56.h),
            ),
            shape: MaterialStateProperty.all(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  bigRadius,
                ),
              ),
            ),
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return backgroundColor ?? blue300;
                } else if (states.contains(MaterialState.disabled)) {
                  return backgroundColor?.withOpacity(.8) ?? grayScale50;
                }
                return backgroundColor ??
                    blue500; // Use the component's default.
              },
            ),
          ),
          onPressed: onPressed,
          child: loading
              ? const CupertinoActivityIndicator(
                  color: Colors.white,
                )
              : TextUi(
                  text,
                  color: textColor ?? grayScale300,
                  style: bodyNormBold,
                ),
        );

  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final EdgeInsetsGeometry? padding;
  final bool loading;
}
