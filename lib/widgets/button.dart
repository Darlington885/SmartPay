import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../classes/fonts.dart';

enum ButtonMode { text, outlined, contained }

class Button extends StatelessWidget {
  const Button({
    @required this.text,
    this.onPressed,
    this.color,
    this.textColor,
    this.loaderColor,
    this.mode,
    this.loading,
    this.disabled,
    this.border,
  });

  final String text;
  final Function onPressed;
  final ButtonMode mode;
  final Color color;
  final Color textColor;
  final Color loaderColor;
  final bool loading;
  final bool disabled;
  final BorderSide border;

  @override
  Widget build(BuildContext context) {
    Widget loader = SizedBox(
      width: 18,
      height: 18,
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(loaderColor ?? Colors.white),
      ),
    );

    if (mode == ButtonMode.outlined) {
      return OutlinedButton(
        onPressed: (disabled == true || loading == true) ? null : onPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0))),
          elevation: MaterialStateProperty.all(0),
          side: MaterialStateProperty.all(BorderSide(color: color ?? Colors.white)),
          padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 20)),
        ),
        child: loading == true
            ? loader
            : Text(
          text,
          style: TextStyle(
              fontSize: 16.0.sp, fontFamily: AppFonts.sfPro,
              color: textColor ?? color ?? Colors.white,
              fontWeight: FontWeight.w500
          ),
        ),
      );
    } else if (mode == ButtonMode.text) {
      return TextButton(
        onPressed: (disabled == true || loading == true) ? null : onPressed,
        child: Text(
          text,
          style: TextStyle(
              fontSize: 16.0.sp, fontFamily: AppFonts.sfPro,
              color: textColor ?? color ?? Colors.white,
              fontWeight: FontWeight.w500),
        ),
      );
    } else {
      return ElevatedButton(
        onPressed: (disabled == true || loading == true) ? null : onPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0))),
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(color ?? Colors.yellow),/// AppColors.yellow
          padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 20,)),
        ),
        child: loading == true
            ? loader
            : Text(
          text,
          style: TextStyle(
              fontSize: 16.0.sp, fontFamily: AppFonts.sfPro,
              color: textColor ?? color ?? Colors.white,
              fontWeight: FontWeight.w500),
        ),
      );
    }
  }
}