// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;
import 'package:rentify/app/views/view_404/404_view.dart' as _i4;
import 'package:rentify/app/views/view_adding_card/adding_card_view.dart'
    as _i1;
import 'package:rentify/app/views/view_decision/decision_view.dart' as _i2;
import 'package:rentify/app/views/view_home/home_view.dart' as _i3;
import 'package:rentify/app/views/view_onboarding/onboarding_view.dart' as _i5;
import 'package:rentify/app/views/view_profile/profile_view.dart' as _i6;
import 'package:rentify/app/views/view_signin/signin_view.dart' as _i7;
import 'package:rentify/app/views/view_signup/signup_view.dart' as _i8;
import 'package:rentify/app/views/view_splash/splash_view.dart' as _i9;

abstract class $AppRouter extends _i10.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    AddingCardViewRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AddingCardView(),
      );
    },
    DecisionViewRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.DecisionView(),
      );
    },
    HomeViewRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.HomeView(),
      );
    },
    NotFoundViewRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.NotFoundView(),
      );
    },
    OnboardingViewRoute.name: (routeData) {
      final args = routeData.argsAs<OnboardingViewRouteArgs>(
          orElse: () => const OnboardingViewRouteArgs());
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.OnboardingView(key: args.key),
      );
    },
    ProfileViewRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.ProfileView(),
      );
    },
    SignInViewRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.SignInView(),
      );
    },
    SignUpViewRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.SignUpView(),
      );
    },
    SplashViewRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.SplashView(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddingCardView]
class AddingCardViewRoute extends _i10.PageRouteInfo<void> {
  const AddingCardViewRoute({List<_i10.PageRouteInfo>? children})
      : super(
          AddingCardViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddingCardViewRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i2.DecisionView]
class DecisionViewRoute extends _i10.PageRouteInfo<void> {
  const DecisionViewRoute({List<_i10.PageRouteInfo>? children})
      : super(
          DecisionViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'DecisionViewRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomeView]
class HomeViewRoute extends _i10.PageRouteInfo<void> {
  const HomeViewRoute({List<_i10.PageRouteInfo>? children})
      : super(
          HomeViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeViewRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i4.NotFoundView]
class NotFoundViewRoute extends _i10.PageRouteInfo<void> {
  const NotFoundViewRoute({List<_i10.PageRouteInfo>? children})
      : super(
          NotFoundViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotFoundViewRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i5.OnboardingView]
class OnboardingViewRoute extends _i10.PageRouteInfo<OnboardingViewRouteArgs> {
  OnboardingViewRoute({
    _i11.Key? key,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          OnboardingViewRoute.name,
          args: OnboardingViewRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'OnboardingViewRoute';

  static const _i10.PageInfo<OnboardingViewRouteArgs> page =
      _i10.PageInfo<OnboardingViewRouteArgs>(name);
}

class OnboardingViewRouteArgs {
  const OnboardingViewRouteArgs({this.key});

  final _i11.Key? key;

  @override
  String toString() {
    return 'OnboardingViewRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.ProfileView]
class ProfileViewRoute extends _i10.PageRouteInfo<void> {
  const ProfileViewRoute({List<_i10.PageRouteInfo>? children})
      : super(
          ProfileViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileViewRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i7.SignInView]
class SignInViewRoute extends _i10.PageRouteInfo<void> {
  const SignInViewRoute({List<_i10.PageRouteInfo>? children})
      : super(
          SignInViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInViewRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i8.SignUpView]
class SignUpViewRoute extends _i10.PageRouteInfo<void> {
  const SignUpViewRoute({List<_i10.PageRouteInfo>? children})
      : super(
          SignUpViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpViewRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i9.SplashView]
class SplashViewRoute extends _i10.PageRouteInfo<void> {
  const SplashViewRoute({List<_i10.PageRouteInfo>? children})
      : super(
          SplashViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashViewRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}
