abstract class OnboardingState {
  int page;
  OnboardingState({required this.page});
}

class OnboardingInitialState extends OnboardingState {
  int page;
  OnboardingInitialState(this.page) : super(page: page);
}
