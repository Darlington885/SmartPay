
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../classes/colors.dart';
import '../classes/fonts.dart';


InputDecoration getInputDecoration({
  @required String label,
  String hint,
  bool error,
  Widget suffixIcon,
  Widget prefixIcon,
  Color color,
  Color focusedColor,
  bool filled


}) {
  return InputDecoration(
    suffixIcon: suffixIcon,
    prefixIcon: prefixIcon,
    labelText: label,
    filled: true,
    hintText: hint,
    fillColor: AppColor.colorAppGray,
    contentPadding: const EdgeInsets.all(15.0),
    labelStyle: TextStyle(
      fontSize: 15.0,
      fontFamily: AppFonts.sfPro,
     color: error == true ?Colors.red : color
     // color: error == true ? AppColor.colorAppGray : AppColor.colorAppGray,
    ),
    hintStyle: TextStyle(
        fontSize: 16.0.sp,
        color: AppColor.colorAppGray2,
        fontFamily: AppFonts.sfPro,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal
    ),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
        borderSide: BorderSide(
          color: error == true
              ? Colors.red
              : (color ?? AppColor.colorAppGray),

        )),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
        borderSide: BorderSide(
          color: error == true
              ? Colors.red: (focusedColor ?? AppColor.colorAppGray)
        )),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.0),
      borderSide:  const BorderSide(
        color:AppColor.colorAppGray,
        //color: Colors.red,
        width: 1,
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.0),
      borderSide:  const BorderSide(
        color:  AppColor.colorAppGray,
        //color: error == true ? Colors.red : (color ?? Colors.red),
        width: 1,
      ),
    ),
  );
}

class InputField extends StatelessWidget {
  const InputField({
    Key key,
    this.label,
    this.controller,
    FocusNode node,
    this.type,
    this.hint,
    this.color,
    this.focusedColor,
    this.maxLines,
    this.maxLength,
    this.obscureText,
    this.error,
    this.onChanged,
    this.validator,
    this.inputFormatter,
    this.textInputAction,
    this.description,
    this.hintColor,
    this.textColor,
    this.message,
    this.suffixIcon,
    this.prefixIcon,
    this.enabled,
    this.filled,
    this.initialValue,
    this.height

  })  : _node = node,
        super(key: key);

  final TextEditingController controller;
  final FocusNode _node;
  final TextInputType type;
  final List<TextInputFormatter> inputFormatter;
  final String initialValue;
  final String label;
  final String hint;
  final String message;
  final bool obscureText;
  final bool enabled;
  final bool filled;
  final bool error;
  final int maxLines;
  final int maxLength;
  final int height;
  final String description;


   ///The color of the border
  final Color color;

  ///The color of the border and label when the input is focused
  final Color focusedColor;

   ///The color of the hint text
  final Color hintColor;

   ///The color of the input value
  final Color textColor;

  final TextInputAction textInputAction;
  final Function(String) onChanged;
  final Function(String) validator;

  final Widget prefixIcon;
  final Widget suffixIcon;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         TextFormField(
            enabled: enabled?? true,
            initialValue: initialValue,
            maxLines: maxLines ?? 1,
            controller: controller,
            focusNode: _node,
            textCapitalization: TextCapitalization.words,
            inputFormatters: inputFormatter,
            textInputAction: textInputAction ?? TextInputAction.next,
            autocorrect: false,
            keyboardType: type,
            cursorColor: AppColor.colorAppBlack,
            obscureText: obscureText ?? false,
            onChanged: onChanged,
            validator: validator,
            obscuringCharacter: '•',
            style: TextStyle(
              fontSize: 16.0,
              fontFamily: AppFonts.sfPro,
              fontWeight: FontWeight.w600,
              color: textColor ?? Colors.black,
            ),
            maxLength: maxLength,
            decoration: getInputDecoration(
                label: label,
                color: color,
                error: error,
                focusedColor: focusedColor,
                hint: hint,
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
                filled: filled,
            ),
          ),

        Padding(
          padding: const EdgeInsets.only(top: 2, bottom: 0, left: 2),
          child: Text(
            message ?? '',
            style: TextStyle(
              fontSize: 12.0,
              fontFamily: AppFonts.sfPro,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              color: error == true ? Colors.red : Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}






