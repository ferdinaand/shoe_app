import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'auth_back_button.ui.dart';

class AuthAppbarUi extends StatelessWidget implements PreferredSizeWidget {
  AuthAppbarUi({
    super.key,
    required this.Logo,
    this.actions,
  });

  final List<Widget>? actions;
  final String Logo;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 64,
      leading: const AuthBackButtonUi(),
      actions: actions,
      centerTitle: true,
      title: Image.asset(
        Logo,
        height: 28.h,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class MainAppbarUi extends StatelessWidget implements PreferredSizeWidget {
  const MainAppbarUi({
    super.key,
    this.actions,
    required this.title,
    this.showBackButton = true,
    this.backgroundColor,
    this.iconColor,
    this.iconBackgroundColor,
    this.bottom,
  });

  final List<Widget>? actions;
  final Widget title;
  final bool showBackButton;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? iconBackgroundColor;
  final PreferredSizeWidget? bottom;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      leadingWidth: 64,
      bottom: bottom,
      elevation: 0,
      leading: showBackButton
          ? AuthBackButtonUi(
              size: 24,
              iconColor: iconColor,
              backgroundColor: iconBackgroundColor,
            )
          : const SizedBox.shrink(),
      actions: actions,
      centerTitle: false,
      title: title,
    );
  }

  //get height of bottom widget
  double get heightOfBottomWidget {
    if (bottom == null) return 0;
    return bottom!.preferredSize.height;
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + heightOfBottomWidget);
}
