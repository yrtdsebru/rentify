import 'dart:async';

import 'package:rentify/app/views/view_profile/view_model/profile_event.dart';
import 'package:rentify/app/views/view_profile/view_model/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileViewModel extends Bloc<ProfileEvent, ProfileState> {
  ProfileViewModel() : super(ProfileState()){
    on<DarkModeEvent>((event, emit) => _isDarkModeEnabled(event, emit));
  }

  FutureOr<void> _isDarkModeEnabled(
    DarkModeEvent event, Emitter<ProfileState> emit) {
    emit(ProfileState(event.isSwitch));
  }
}