import 'package:flutter/material.dart';

abstract class OnboardingEvent{}

class IndicatorIncrementEvent extends OnboardingEvent{
  int page;
  BuildContext context;
  PageController pageController = PageController();
  IndicatorIncrementEvent(this.page, this.context, this.pageController);
}
