import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:rentify/app/views/view_signin/signin_view.dart';
import 'package:rentify/app/views/view_signup/view_model/signup_event.dart';
import 'package:rentify/app/views/view_signup/view_model/signup_state.dart';
import 'package:rentify/core/repository/model/auth/signup/signup_request_model.dart';
import 'package:rentify/core/repository/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpViewModel extends Bloc<SignUpEvent, SignUpState> {
  SignUpViewModel() : super(SignUpState(false,false)) {
    on<IsDateSelectedEvent>(_isDateSelected);
    on<IsLandlordSelectedEvent>(_isLandlordSelected);
    on<IsButtonEnabledEvent>(_isButtonEnabled);
    on<SignUpInitialEvent>((event, emit) => _onSignUpInitialEvent(event, emit));
  }
  bool get isDateSelected => state.isDateSelected;

  TextEditingController userNameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController surNameController = TextEditingController();
  TextEditingController passwordOneController = TextEditingController();
  TextEditingController passwordTwoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController adressController = TextEditingController();

  AuthService authService = AuthService();


  FutureOr<void> _isDateSelected(
      IsDateSelectedEvent event, Emitter<SignUpState> emit) {
    emit(SignUpState(event.isDateSelected, state.isLandlordSelected, state.isButtonEnabled));
  }

  FutureOr<void> _isLandlordSelected(
      IsLandlordSelectedEvent event, Emitter<SignUpState> emit) {
    emit(SignUpState(state.isDateSelected, event.isLandlordSelected, state.isButtonEnabled));
  }

  FutureOr<void> _isButtonEnabled(
      IsButtonEnabledEvent event, Emitter<SignUpState> emit) {
    emit(SignUpState(state.isDateSelected, state.isLandlordSelected, event.isButtonEnabled));
  }

  Future<FutureOr<void>> _onSignUpInitialEvent(
      SignUpInitialEvent event, Emitter<SignUpState> emit) async {
    try {
      await authService.signUp(SignUpRequestModel(
          userType: state.isLandlordSelected,
          userName: userNameController.text,
          photoUrl: "",
          name: nameController.text,
          surname: surNameController.text.trim(),
          address: adressController.text,
          phoneNumber: phoneController.text.trim(),
          email: emailController.text.trim(),
          password: passwordOneController.text.trim(),
          birth: DateTime.now().toString()));

      Future.delayed(const Duration(seconds: 2), () {
        Navigator.of(event.context).push(MaterialPageRoute(builder: (context) {
          return const SignInView();
        }));
      });
    } catch (e, stack) {
     //FirebaseCrashlytics.instance.recordError(e, stack, fatal: true);
    }
  }
}
