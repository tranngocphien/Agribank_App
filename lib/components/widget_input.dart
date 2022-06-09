import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../app_theme.dart';
class WidgetInput extends StatelessWidget {
  const WidgetInput(
      {Key? key,
        this.onPress,
        this.text,
        this.controller,
        this.enable = true,
        this.suffixIcon,
        this.errorText,
        this.onChanged,
        this.keyboardType = TextInputType.text,
        this.obscureText = false,
        this.inputFormatters,
        this.textCapitalization = TextCapitalization.none
      })
      : super(key: key);
  final Function()? onPress;
  final String? text;
  final String? errorText;
  final TextEditingController? controller;
  final bool enable;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter>? inputFormatters;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: TextField(
        inputFormatters: inputFormatters,
        onTap: onPress,
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        onChanged: onChanged,
        decoration: InputDecoration(
            suffixIcon: suffixIcon,
            errorText: errorText,
            label: text == null? null: Text(text!),
            focusColor: black700,
            hoverColor: black700,
            fillColor: black700,
            labelStyle:
            Styles.baseNotoSansTS.copyWith(fontSize: 15, color: black500),
            border: InputBorder.none,
            enabled: enable),
        style: Styles.baseNotoSansTS.copyWith(fontSize: 15),
      ),
    );
  }
}
