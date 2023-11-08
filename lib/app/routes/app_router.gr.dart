// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i13;
import 'package:flutter/cupertino.dart' as _i15;
import 'package:flutter/material.dart' as _i14;
import 'package:rentify/app/views/view_404/404_view.dart' as _i7;
import 'package:rentify/app/views/view_adding_card/adding_card_view.dart'
    as _i1;
import 'package:rentify/app/views/view_adding_product/adding_product_view.dart'
    as _i2;
import 'package:rentify/app/views/view_decision/decision_view.dart' as _i3;
import 'package:rentify/app/views/view_home/home_land_view.dart' as _i4;
import 'package:rentify/app/views/view_home/home_ten_view.dart' as _i5;
import 'package:rentify/app/views/view_home/home_view.dart' as _i6;
import 'package:rentify/app/views/view_onboarding/onboarding_view.dart' as _i8;
import 'package:rentify/app/views/view_profile/profile_view.dart' as _i9;
import 'package:rentify/app/views/view_signin/signin_view.dart' as _i10;
import 'package:rentify/app/views/view_signup/signup_view.dart' as _i11;
import 'package:rentify/app/views/view_splash/splash_view.dart' as _i12;

abstract class $AppRouter extends _i13.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i13.PageFactory> pagesMap = {
    AddingCardViewRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AddingCardView(),
      );
    },
    AddingProductViewRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AddingProductView(),
      );
    },
    DecisionViewRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.DecisionView(),
      );
    },
    HomeLandViewRoute.name: (routeData) {
      final args = routeData.argsAs<HomeLandViewRouteArgs>(
          orElse: () => const HomeLandViewRouteArgs());
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.HomeLandView(key: args.key),
      );
    },
    HomeTenViewRoute.name: (routeData) {
      final args = routeData.argsAs<HomeTenViewRouteArgs>(
          orElse: () => const HomeTenViewRouteArgs());
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.HomeTenView(key: args.key),
      );
    },
    HomeViewRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.HomeView(),
      );
    },
    NotFoundViewRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.NotFoundView(),
      );
    },
    OnboardingViewRoute.name: (routeData) {
      final args = routeData.argsAs<OnboardingViewRouteArgs>(
          orElse: () => const OnboardingViewRouteArgs());
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.OnboardingView(key: args.key),
      );
    },
    ProfileViewRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.ProfileView(),
      );
    },
    SignInViewRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.SignInView(),
      );
    },
    SignUpViewRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.SignUpView(),
      );
    },
    SplashViewRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.SplashView(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddingCardView]
class AddingCardViewRoute extends _i13.PageRouteInfo<void> {
  const AddingCardViewRoute({List<_i13.PageRouteInfo>? children})
      : super(
          AddingCardViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddingCardViewRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AddingProductView]
class AddingProductViewRoute extends _i13.PageRouteInfo<void> {
  const AddingProductViewRoute({List<_i13.PageRouteInfo>? children})
      : super(
          AddingProductViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddingProductViewRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i3.DecisionView]
class DecisionViewRoute extends _i13.PageRouteInfo<void> {
  const DecisionViewRoute({List<_i13.PageRouteInfo>? children})
      : super(
          DecisionViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'DecisionViewRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i4.HomeLandView]
class HomeLandViewRoute extends _i13.PageRouteInfo<HomeLandViewRouteArgs> {
  HomeLandViewRoute({
    _i14.Key? key,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          HomeLandViewRoute.name,
          args: HomeLandViewRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomeLandViewRoute';

  static const _i13.PageInfo<HomeLandViewRouteArgs> page =
      _i13.PageInfo<HomeLandViewRouteArgs>(name);
}

class HomeLandViewRouteArgs {
  const HomeLandViewRouteArgs({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return 'HomeLandViewRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.HomeTenView]
class HomeTenViewRoute extends _i13.PageRouteInfo<HomeTenViewRouteArgs> {
  HomeTenViewRoute({
    _i15.Key? key,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          HomeTenViewRoute.name,
          args: HomeTenViewRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomeTenViewRoute';

  static const _i13.PageInfo<HomeTenViewRouteArgs> page =
      _i13.PageInfo<HomeTenViewRouteArgs>(name);
}

class HomeTenViewRouteArgs {
  const HomeTenViewRouteArgs({this.key});

  final _i15.Key? key;

  @override
  String toString() {
    return 'HomeTenViewRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.HomeView]
class HomeViewRoute extends _i13.PageRouteInfo<void> {
  const HomeViewRoute({List<_i13.PageRouteInfo>? children})
      : super(
          HomeViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeViewRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i7.NotFoundView]
class NotFoundViewRoute extends _i13.PageRouteInfo<void> {
  const NotFoundViewRoute({List<_i13.PageRouteInfo>? children})
      : super(
          NotFoundViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotFoundViewRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i8.OnboardingView]
class OnboardingViewRoute extends _i13.PageRouteInfo<OnboardingViewRouteArgs> {
  OnboardingViewRoute({
    _i14.Key? key,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          OnboardingViewRoute.name,
          args: OnboardingViewRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'OnboardingViewRoute';

  static const _i13.PageInfo<OnboardingViewRouteArgs> page =
      _i13.PageInfo<OnboardingViewRouteArgs>(name);
}

class OnboardingViewRouteArgs {
  const OnboardingViewRouteArgs({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return 'OnboardingViewRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i9.ProfileView]
class ProfileViewRoute extends _i13.PageRouteInfo<void> {
  const ProfileViewRoute({List<_i13.PageRouteInfo>? children})
      : super(
          ProfileViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileViewRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i10.SignInView]
class SignInViewRoute extends _i13.PageRouteInfo<void> {
  const SignInViewRoute({List<_i13.PageRouteInfo>? children})
      : super(
          SignInViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInViewRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i11.SignUpView]
class SignUpViewRoute extends _i13.PageRouteInfo<void> {
  const SignUpViewRoute({List<_i13.PageRouteInfo>? children})
      : super(
          SignUpViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpViewRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i12.SplashView]
class SplashViewRoute extends _i13.PageRouteInfo<void> {
  const SplashViewRoute({List<_i13.PageRouteInfo>? children})
      : super(
          SplashViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashViewRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}
