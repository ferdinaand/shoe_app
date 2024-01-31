import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../resources/icons.res.dart';
import '../resources/radius.res.dart';

class AuthBackButtonUi extends StatelessWidget {
  const AuthBackButtonUi({
    super.key,
    this.size,
    this.iconColor,
    this.backgroundColor,
  });

  final double? size;
  final Color? backgroundColor;
  final Color? iconColor;
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: 'Back',
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 8, 0, 8).w,
        child: InkWell(
          onTap: Get.back<void>,
          borderRadius: const BorderRadius.all(
            smallRadius,
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
                // color: backgroundColor,
                // borderRadius: const BorderRadius.all(
                //   smallRadius,
                // ),
                // border: Border.all(
                //   color: iconColor ?? grayScale100,
                // ),
                ),
            child: SvgPicture.asset(
              backIcon,
              fit: BoxFit.none,
              color: iconColor,
              width: size,
              height: size,
            ),
          ),
        ),
      ),
    );
  }
}
