import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class ConvertDateTime {
  static String convertDate(DateTime dateTime) {
    dateTime = dateTime.add(const Duration(hours: 7));
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  static String convertDateTime(DateTime dateTime) {
    dateTime = dateTime.add(const Duration(hours: 7));
    return '${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute}';
  }

  static String convertTime(DateTime dateTime) {
    dateTime = dateTime.add(const Duration(hours: 7));
    return '${dateTime.hour}:${dateTime.minute}';
  }


}

class MoneyFormat {
  static String formatMoneyString(String money){
    var formatter = NumberFormat('###,###,###');
    return formatter.format(money);

  }

  static String formatMoneyInteger(int money){
    var formatter = NumberFormat('###,###,###');
    return formatter.format(money);

  }
}

class ThousandsSeparatorInputFormatter extends TextInputFormatter {
  static const separator = ','; // Change this to '.' for other locales

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Short-circuit if the new value is empty
    if (newValue.text.length == 0) {
      return newValue.copyWith(text: '');
    }

    // Handle "deletion" of separator character
    String oldValueText = oldValue.text.replaceAll(separator, '');
    String newValueText = newValue.text.replaceAll(separator, '');

    if (oldValue.text.endsWith(separator) &&
        oldValue.text.length == newValue.text.length + 1) {
      newValueText = newValueText.substring(0, newValueText.length - 1);
    }

    // Only process if the old value and new value are different
    if (oldValueText != newValueText) {
      int selectionIndex =
          newValue.text.length - newValue.selection.extentOffset;
      final chars = newValueText.split('');

      String newString = '';
      for (int i = chars.length - 1; i >= 0; i--) {
        if ((chars.length - 1 - i) % 3 == 0 && i != chars.length - 1)
          newString = separator + newString;
        newString = chars[i] + newString;
      }

      return TextEditingValue(
        text: newString.toString(),
        selection: TextSelection.collapsed(
          offset: newString.length - selectionIndex,
        ),
      );
    }

    // If the new value and old value are the same, just return as-is
    return newValue;
  }
}

