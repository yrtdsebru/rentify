import 'package:rentify/app/views/view_adding_card/utils/add_card_utils.dart';

abstract class AddingCardEvent{}

class AddingCardInitial extends AddingCardEvent {}

class CurrentPageIndexEvent extends AddingCardEvent{
  final int currentIndex;

  CurrentPageIndexEvent(this.currentIndex);
}

class IsCodeSelectedEvent extends AddingCardEvent{
  final bool isCodeSelected;

  IsCodeSelectedEvent(this.isCodeSelected);
}

class CardTypeEvent extends AddingCardEvent{
  final CardType cardType;

  CardTypeEvent(this.cardType);
}

class IsButtonEnabledEvent extends AddingCardEvent{
  final bool isButtonEnabled;

  IsButtonEnabledEvent(this.isButtonEnabled);
}

class IsFilledEvent extends AddingCardEvent {
  final bool isFilled;

  IsFilledEvent(this.isFilled);
}

class SuccessMessageEvent extends AddingCardEvent {
  final bool successMessage;

  SuccessMessageEvent(this.successMessage);
}

class EmailEnteredEvent extends AddingCardEvent {
  final String email;

  EmailEnteredEvent(this.email);
}

class CardEnteredEvent extends AddingCardEvent {
  final String card;

  CardEnteredEvent(this.card);
}