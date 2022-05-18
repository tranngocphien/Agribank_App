import 'package:flutter/material.dart';

import '../app_theme.dart';

class ButtonPrimaryText extends StatelessWidget {
  final String textPrimary;
  final double sizeText;
  final Color? colorBorder;
  final double radius;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final Color colorText;
  final Color colorBackground;
  final FontWeight fontWeightText;
  final Function() onTab;

  const ButtonPrimaryText(
      {Key? key,
      required this.onTab,
      required this.margin,
      required this.padding,
      this.colorBorder,
      this.height,
      this.width,
      required this.radius,
      required this.fontWeightText,
      required this.sizeText,
      required this.colorBackground,
      required this.colorText,
      required this.textPrimary})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      child: Container(
        padding: padding,
        margin: margin,
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: colorBackground,
            border:
                colorBorder == null ? null : Border.all(color: colorBorder!)),
        child: Align(
          child: Text(
            textPrimary,
            style: Styles.baseNotoSansTS.copyWith(
                fontSize: sizeText,
                color: colorText,
                fontWeight: fontWeightText),
          ),
          alignment: Alignment.center,
        ),
      ),
      onTap: onTab,
    );
  }
}

class ButtonPrimaryWidget extends StatelessWidget {
  final Widget widget;
  final double radius;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final Color colorBackground;
  final Color? colorBorder;
  final FontWeight fontWeightText;
  final Function() onTab;

  const ButtonPrimaryWidget({
    Key? key,
    required this.onTab,
    required this.margin,
    required this.padding,
    this.colorBorder,
    required this.radius,
    required this.fontWeightText,
    required this.widget,
    required this.colorBackground,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      child: Container(
        padding: padding,
        margin: margin,
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: colorBackground,
            border:
                colorBorder == null ? null : Border.all(color: colorBorder!)),
        child: Align(
          child: widget,
          alignment: Alignment.center,
        ),
      ),
      onTap: onTab,
    );
  }
}
