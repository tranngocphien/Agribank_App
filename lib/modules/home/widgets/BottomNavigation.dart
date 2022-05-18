import 'package:flutter/material.dart';
import '../../../app_theme.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height48,
      width: width,
      color: Colors.red,
      child: Row(
        children: [
          BottomNavigationItem(
            icon: const Icon(Icons.home),
            text: Text('Home'),
            onClick: () {},
          )
        ],
      ),
    );
  }
}

class BottomNavigationItem extends StatelessWidget {
  const BottomNavigationItem({
    required this.icon,
    required this.text,
    required this.onClick,
    Key? key,
  }) : super(key: key);

  final Widget icon;
  final Text text;
  final Function() onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Column(
        children: [
          icon,
          SizedBox(
            height: height2,
          ),
          text
        ],
      ),
    );
  }
}
