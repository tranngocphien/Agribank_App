import 'package:flutter/material.dart';

import '../app_theme.dart';

class InformationTile extends StatelessWidget {
  const InformationTile({
    Key? key, required this.label, required this.content, this.isFinal = false, this.isHighLight = false,
  }) : super(key: key);

  final String label;
  final String content;
  final bool? isFinal;
  final bool? isHighLight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: Styles.baseNotoSansTS.copyWith(
            fontSize: 14,
            color: Colors.grey,
          ),),
          SizedBox(height: height4,),
          Text(content, style: Styles.baseNotoSansTS.copyWith(
              fontSize: 17,
              color: isHighLight! ? const Color(0xFFF67D10) : black,
              fontWeight: isHighLight! ? FontWeight.w600:  FontWeight.w400
          ),),
          SizedBox(height: height4,),
          isFinal! ? Container() : const Divider(thickness: 1,)

        ],
      ),
    );
  }
}
