import 'package:flutter/material.dart';

import '../../../app_theme.dart';

class ListAmountMoney extends StatelessWidget {
  const ListAmountMoney(
      {Key? key,
      required this.values,
      required this.indexSelected,
      required this.onPress})
      : super(key: key);
  final List<String> values;
  final int indexSelected;
  final Function(int) onPress;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: width8,
      spacing: width4,
      children: values
          .map((e) => GestureDetector(
              onTap: () {
                onPress(values.indexOf(e));
              },
              child: MoneyItem(
                  amount: e, isClick: values.indexOf(e) == indexSelected)))
          .toList(),
    );
  }
}

class MoneyItem extends StatelessWidget {
  const MoneyItem({
    required this.amount,
    required this.isClick,
    Key? key,
  }) : super(key: key);

  final String amount;
  final bool isClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (width - width60) / 3,
      height: height48,
      decoration: BoxDecoration(
          color: isClick ? const Color(0xFFF67D10) : white,
          borderRadius: BorderRadius.circular(width8),
          border: isClick ? null : Border.all(color: black500)),
      child: Center(
        child: Text(
          amount,
          style: Styles.baseNotoSansTS.copyWith(color:isClick ? white : black900, fontSize: 16),
        ),
      ),
    );
  }
}
