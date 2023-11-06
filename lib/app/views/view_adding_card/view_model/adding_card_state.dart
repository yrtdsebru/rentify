import 'package:rentify/app/views/view_adding_card/utils/add_card_utils.dart';

class AddingCardState {
  int currentIndex;
  bool isCodeSelected;
  CardType cardType;
  bool isButtonEnabled;
  bool isFilled;
  bool successMessage;
  String name;
  String email;
  String card;

  AddingCardState(
    this.currentIndex,
    this.isCodeSelected,
    this.name,
    this.email,
    this.card, [
    this.cardType = CardType.Others,
    this.isButtonEnabled = false,
    this.isFilled = false,
    this.successMessage = false,
  ]);
}
