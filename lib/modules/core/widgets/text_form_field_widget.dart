import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:searchandstay/theme/colors.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final bool? autofocus;
  final String? Function(String?)? validator;
  final String? hint;
  final String? label;
  final Widget? suffixIcon;
  final Color? fillColor;
  final TextStyle? hintStyle;
  final bool isDense;
  final double? vertical;
  const TextFormFieldWidget({
    Key? key,
    this.hint,
    this.label,
    this.controller,
    this.inputFormatters,
    this.keyboardType,
    this.obscureText,
    this.autofocus,
    this.validator,
    this.suffixIcon,
    this.fillColor,
    this.hintStyle,
    this.isDense = false,
    this.vertical,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: vertical == null ? 8.0 : vertical!),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label ?? '',
            style:
                context.textTheme.bodySmall?.copyWith(color: kSecondaryColor),
          ),
          const SizedBox(height: 5),
          TextFormField(
            controller: controller,
            cursorColor: kSecondaryColor,
            inputFormatters: inputFormatters,
            keyboardType: keyboardType,
            obscureText: obscureText ?? false,
            textAlign: TextAlign.left,
            validator: validator,
            autofocus: autofocus ?? false,
            decoration: InputDecoration(
                isDense: isDense,
                filled: true,
                fillColor: fillColor ?? Colors.white,
                contentPadding:
                    const EdgeInsets.only(left: 25.0, bottom: 5.0, top: 5.0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  gapPadding: 0,
                  borderSide: const BorderSide(
                    color: kSecondaryLightColor,
                  ),
                ),
                hintText: hint,
                hintStyle: hintStyle ??
                    const TextStyle(
                      fontSize: 20,
                      color: kSecondaryColor,
                    ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  gapPadding: 0,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  gapPadding: 0,
                  borderSide: const BorderSide(
                    color: kSecondaryColor,
                  ),
                ),
                suffixIcon: suffixIcon,
                suffixIconColor: kSecondaryColor),
          ),
        ],
      ),
    );
  }
}
