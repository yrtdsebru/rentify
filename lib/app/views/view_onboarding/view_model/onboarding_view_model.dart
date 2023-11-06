import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:rentify/app/routes/app_router.gr.dart';
import 'package:rentify/app/views/view_onboarding/view_model/onboarding_event.dart';
import 'package:rentify/app/views/view_onboarding/view_model/onboarding_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class OnboardingViewModel extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingViewModel() : super(OnboardingInitialState(0)) {
    on<IndicatorIncrementEvent>(_onIndicatorIncrement);
  }

  FutureOr<void> _onIndicatorIncrement(
      IndicatorIncrementEvent event, Emitter<OnboardingState> emit) {
    event.page++;
    if (event.page < 3) {
      event.pageController.animateToPage(event.page,
          duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
    } else {
      event.context.router.replace(const DecisionViewRoute());
    }
    emit(OnboardingInitialState(event.page));
  }
}
