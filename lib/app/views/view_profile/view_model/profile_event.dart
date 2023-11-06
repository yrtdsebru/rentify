abstract class ProfileEvent{}
class ProfileInitial extends ProfileEvent {}
class DarkModeEvent extends ProfileEvent{
  final bool isSwitch;

  DarkModeEvent(this.isSwitch);
}

