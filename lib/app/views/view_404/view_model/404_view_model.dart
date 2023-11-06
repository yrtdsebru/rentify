
import 'dart:async';
import 'package:rentify/app/routes/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:rentify/app/views/view_404/view_model/404_event.dart';
import 'package:rentify/app/views/view_404/view_model/404_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotFoundViewModel extends Bloc<RetuntoHomeEvent, NotFoundState>{
  NotFoundViewModel() : super(NotFoundState()){
  on<RetuntoHomeEvent>(_onNotFoundEvent);
  }

  FutureOr<void> _onNotFoundEvent(RetuntoHomeEvent event, Emitter<NotFoundState> emit) {
     // event.context.router.replace(const BottomNavigationWidgetRoute());
  }
}