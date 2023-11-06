import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rentify/app/views/view_home/model/post_request_model.dart';
import 'package:rentify/app/views/view_home/service/home_service.dart';
import 'package:rentify/app/views/view_home/view_model/home_event.dart';
import 'package:rentify/app/views/view_home/view_model/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewModel extends Bloc<HomeEvent, HomeState> {
  HomeViewModel() : super(HomeState(0)) {
    on<PageIndexEvent>(_pageIndex);
  }

    FutureOr<void> _pageIndex(
      PageIndexEvent event, Emitter<HomeState> emit) {
    emit(
        HomeState(event.pageIndex));
  }
}