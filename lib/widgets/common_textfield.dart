import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imsakiyah_mobile/cores/constants/colors_cons.dart';

class CommonTextField extends StatelessWidget {
  final String hintText;
  final Widget? suffix;
  final String? suffixLabel;
  final String? prefixLabel;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? label;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType textInputType;
  final bool? readOnly;
  final bool? filled;
  final FocusNode? focusNode;
  final Function()? onTap;
  final Function(String)? onChange;
  final Function()? onComplete;
  final String? Function(String?)? validator;
  final int? maxLine;
  final int? maxLength;
  final double? borderRadius;
  final Color? labelColor;
  final Color? hintColor;
  final Color? fillColor;
  final Color? borderColor;
  final AutovalidateMode? autoValidate;

  final List<TextInputFormatter>? inputFormatter;

  const CommonTextField({
    super.key,
    required this.hintText,
    this.suffix,
    this.suffixLabel,
    this.controller,
    required this.textInputType,
    this.textInputAction,
    this.prefixIcon,
    this.suffixIcon,
    this.readOnly,
    this.filled,
    this.focusNode,
    this.onTap,
    this.onChange,
    this.onComplete,
    this.validator,
    this.maxLine,
    this.maxLength,
    this.inputFormatter,
    this.prefixLabel,
    this.labelColor,
    this.label,
    this.hintColor,
    this.fillColor,
    this.borderRadius,
    this.borderColor,
    this.autoValidate,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength,
      maxLines: maxLine,
      controller: controller,
      style: const TextStyle(
        color: white,
        letterSpacing: 0.0,
        fontWeight: FontWeight.normal,
      ),
      keyboardType: textInputType,
      autovalidateMode: autoValidate,
      textInputAction: textInputAction,
      readOnly: readOnly != null ? true : false,
      onTap: onTap,
      focusNode: focusNode,
      onChanged: onChange,
      onEditingComplete: onComplete,
      decoration: InputDecoration(
        label: label,
        hintText: hintText,
        prefixText: prefixLabel,
        hintStyle: TextStyle(
          color: hintColor ?? whiteThree,
          fontSize: 13.0,
          letterSpacing: 0.0,
          fontWeight: FontWeight.normal,
        ),
        filled: filled != null ? true : false,
        fillColor: fillColor,
        counterText: '',
        prefixIcon: prefixIcon,
        suffix: suffixLabel != null
            ? Text(
                '$suffixLabel',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: whiteTwo),
              )
            : null,
        suffixIcon: suffixIcon,
        labelStyle: const TextStyle(
          color: whiteThree,
          fontSize: 13.0,
          letterSpacing: 0.0,
          fontWeight: FontWeight.normal,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor ?? grey),
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor ?? grey),
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor ?? grey),
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
        ),
      ),
      inputFormatters: inputFormatter,
      validator: validator,
    );
  }
}
