import 'package:flutter/material.dart';

abstract class SignUpEvent {}

class SignUpInitialEvent extends SignUpEvent {
  BuildContext context;
  SignUpInitialEvent(this.context);
}

class IsDateSelectedEvent extends SignUpEvent {
  final bool isDateSelected;

  IsDateSelectedEvent(this.isDateSelected);
}

class IsLandlordSelectedEvent extends SignUpEvent {
  final bool isLandlordSelected;

  IsLandlordSelectedEvent(this.isLandlordSelected);
}

class IsButtonEnabledEvent extends SignUpEvent {
  final bool isButtonEnabled;

  IsButtonEnabledEvent(this.isButtonEnabled);
}