import 'package:flutter/material.dart';

import '../app_theme.dart';

class FunctionServiceItem extends StatelessWidget {
  const FunctionServiceItem({
    Key? key,
    required this.icon,
    required this.text,
    required this.onPress,
  }) : super(key: key);
  final Widget icon;
  final String text;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: height120,
        width: width100,
        padding: EdgeInsets.all(width16),
        decoration: BoxDecoration(
            color: white, borderRadius: BorderRadius.circular(width8)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: height36, width: width36, child: icon),
            SizedBox(
              height: height4,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style:
                  Styles.baseNotoSansTS.copyWith(fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}
