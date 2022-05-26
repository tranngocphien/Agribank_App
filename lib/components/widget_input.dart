import 'package:flutter/material.dart';

import '../app_theme.dart';
class WidgetInput extends StatelessWidget {
  const WidgetInput(
      {Key? key,
        required this.onPress,
        required this.text,
        this.controller,
        this.enable = true,
        this.suffixIcon,
        this.keyboardType = TextInputType.text
      })
      : super(key: key);
  final Function onPress;
  final String text;
  final TextEditingController? controller;
  final bool enable;
  final Widget? suffixIcon;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: TextField(
        onTap: onPress(),
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            suffixIcon: suffixIcon,
            label: Text(text),
            focusColor: black700,
            hoverColor: black700,
            fillColor: black700,
            labelStyle:
            Styles.baseNotoSansTS.copyWith(fontSize: 16, color: black500),
            border: InputBorder.none,
            enabled: enable),
        style: Styles.baseNotoSansTS.copyWith(fontSize: 18),
      ),
    );
  }
}
