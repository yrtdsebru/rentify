import 'dart:async';

import 'package:rentify/app/views/view_adding_card/view_model/adding_card_event.dart';
import 'package:rentify/app/views/view_adding_card/view_model/adding_card_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddingCardViewModel extends Bloc<AddingCardEvent, AddingCardState> {
  AddingCardViewModel() : super(AddingCardState(0, false, '', '', '')) {
    on<CurrentPageIndexEvent>(_currentPageIndex);
    on<IsCodeSelectedEvent>(_isCodeSelected);
    on<CardTypeEvent>((event, emit) => _cardType(event, emit));
    on<IsButtonEnabledEvent>((event, emit) => _isButtonEnabled(event, emit));
    on<IsFilledEvent>(_isFilled);
    on<SuccessMessageEvent>(_successMessage);
    on<EmailEnteredEvent>((event, emit) => _emailEntered(event, emit));
    on<CardEnteredEvent>((event, emit) => _cardEntered(event, emit));
  }

  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());
  final List<TextEditingController> _controllers =
      List.generate(6, (index) => TextEditingController());

  List<FocusNode> get focusNodes => _focusNodes;
  List<TextEditingController> get controllers => _controllers;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController cardController = TextEditingController();


  @override
  Future<void> close() {
    // Odak noktalarını ve metin denetleyicilerini temizliyoruz.
    for (var i = 0; i < 6; i++) {
      _focusNodes[i].dispose();
      _controllers[i].dispose();
    }
    return super.close();
  }

  FutureOr<void> _currentPageIndex(
      CurrentPageIndexEvent event, Emitter<AddingCardState> emit) {
    emit(
        AddingCardState(event.currentIndex, state.isCodeSelected, state.name, state.email, state.card));
  }

  FutureOr<void> _isCodeSelected(
      IsCodeSelectedEvent event, Emitter<AddingCardState> emit) {
    emit(
        AddingCardState(state.currentIndex, event.isCodeSelected, state.name, state.email, state.card));
  }

  FutureOr<void> _cardType(CardTypeEvent event, Emitter<AddingCardState> emit) {
    emit(AddingCardState(state.currentIndex, state.isCodeSelected, state.name, state.email,
        state.card, event.cardType, state.isButtonEnabled, state.isButtonEnabled, state.successMessage));
  }

  FutureOr<void> _isButtonEnabled(
      IsButtonEnabledEvent event, Emitter<AddingCardState> emit) {
    emit(AddingCardState(state.currentIndex, state.isCodeSelected, state.name, state.email,
        state.card, state.cardType, event.isButtonEnabled, state.isButtonEnabled, state.successMessage));
  }

  FutureOr<void> _isFilled(IsFilledEvent event, Emitter<AddingCardState> emit) {
    emit(AddingCardState(state.currentIndex, state.isCodeSelected, state.name, state.email,
        state.card, state.cardType, state.isButtonEnabled, event.isFilled, state.successMessage));
  }

    FutureOr<void> _successMessage(SuccessMessageEvent event, Emitter<AddingCardState> emit) {
    emit(AddingCardState(state.currentIndex, state.isCodeSelected, state.name, state.email,
        state.card, state.cardType, state.isButtonEnabled, state.isFilled, event.successMessage));
  }

  FutureOr<void> _emailEntered(
      EmailEnteredEvent event, Emitter<AddingCardState> emit) {
    emit(AddingCardState(state.currentIndex, state.isCodeSelected, state.name, event.email,
        state.card, state.cardType, state.isButtonEnabled, state.isFilled, state.successMessage));
  }

  FutureOr<void> _cardEntered(
      CardEnteredEvent event, Emitter<AddingCardState> emit) {
    emit(AddingCardState(state.currentIndex, state.isCodeSelected, state.name, state.email,
        event.card, state.cardType, state.isButtonEnabled, state.isFilled, state.successMessage));
  }
}
