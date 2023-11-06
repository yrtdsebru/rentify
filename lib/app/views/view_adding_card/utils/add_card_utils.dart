import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rentify/gen/assets.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum CardType { Master, Visa, Others, Invalid }

class CardUtils {
  static CardType getCardTypeFrmNumber(String input) {
    CardType cardType;
    if (input.startsWith(RegExp(
        r'((5[1-5])|(222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720))'))) {
      cardType = CardType.Master;
    } else if (input.startsWith(RegExp(r'[4]'))) {
      cardType = CardType.Visa;
    } else if (input.length <= 8) {
      cardType = CardType.Others;
    } else {
      cardType = CardType.Invalid;
    }
    return cardType;
  }

  static Widget? getCardIcon(CardType? cardType) {
    String img = "";
    Icon? icon;
    switch (cardType) {
      case CardType.Master:
        img = 'mastercard.svg';
        break;
      case CardType.Visa:
        img = 'visa.svg';
        break;
      case CardType.Others:
        icon = const Icon(
          Icons.credit_card,
          size: 24.0,
          color: Color(0xFFB8B5C3),
        );
        break;
      default:
        icon = const Icon(
          Icons.warning,
          size: 24.0,
          color: Color(0xFFB8B5C3),
        );
        break;
    }

    Widget? widget;
    if (img.isNotEmpty) {
      widget = SvgPicture.asset(
        'assets/icons/svg/$img',
        width: 30.0,
        height: 25.0,
      );
    } else {
      widget = icon;
    }
    return widget;
  }
}


class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;
    // Eğer imleç en baştaysa, metni değiştirmeden döndürür
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      // Her dört karakterden sonra boşluk ekler
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
        // Kredi kartı numarası bittikten sonra tek boşluk ekler
        if (nonZeroIndex == 16) {
          buffer.write(' ');
        } else {
          buffer.write('  ');
        }
      } else if (nonZeroIndex == 18) {
        // Ay ve yıl arasına '/' karakteri ekler
        buffer.write('/');
      }
    }
    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}
