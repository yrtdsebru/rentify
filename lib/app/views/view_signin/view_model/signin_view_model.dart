import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:rentify/app/routes/app_router.gr.dart';
import 'package:rentify/core/repository/model/auth/signin/signin_request_model.dart';
import 'package:rentify/core/repository/service/auth_service.dart';
import 'package:rentify/app/views/view_signin/view_model/signin_event.dart';
import 'package:rentify/app/views/view_signin/view_model/signin_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInViewModel extends Bloc<SignInEvent, SignInState> {
  SignInViewModel() : super(SignInInitialState()) {
    on<SignInInitialEvent>(_initial);
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  AuthService authService = AuthService();

  Future<FutureOr<void>> _initial(
      SignInInitialEvent event, Emitter<SignInState> emit) async {
    try {
      // await authService.signIn(SignInRequestModel(
      //     email: emailController.text.trim(),
      //     password: passwordController.text.trim()));
      // ScaffoldMessenger.of(event.context).showSnackBar(const SnackBar(
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      //   content: Text('Giriş başarılı.'),
      //   // content: SnackBarWidget.success(
      //   //   subTitle: 'Giriş başarılı, ana sayfaya yönlendiriliyorsunuz...',
      //   // )
      // ));
      Future.delayed(const Duration(seconds: 2), () {
        //if de ve state ile kayıt durumuna bak. ona göre land veya ten'e gitsin. like
                //     state.isLand?
                // event.context.router.replace(HomeLandViewRoute())
                // : event.context.router.replace(const HomeTenViewRoute());
        event.context.router.push(HomeTenViewRoute());
      });
    } catch (e, stack) {
      FirebaseCrashlytics.instance.recordError(e, stack, fatal: true);
      FirebaseAuthException exception = e as FirebaseAuthException;
      exception.code == 'invalid-email'
          ? Future.delayed(const Duration(seconds: 2), () {
              ScaffoldMessenger.of(event.context).showSnackBar(const SnackBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                content: Text('Email formatınız hatalı.'),
                // SnackBarWidget.error(
                //   subTitle: 'Email formatınız hatalı',
                // )
              ));
            })
          : Future.delayed(const Duration(seconds: 2), () {
              ScaffoldMessenger.of(event.context).showSnackBar(const SnackBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                content: Text('Email veya şifre hatalı.'),
                // SnackBarWidget.error(
                //   subTitle: 'Email veya şifre hatalı',
                // )
              ));
            });
    }
  }
}
