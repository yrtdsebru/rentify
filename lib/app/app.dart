import 'package:flavor/flavor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rentify/app/l10n/app_localizations.dart';
import 'package:rentify/app/routes/app_router.dart';
import 'package:rentify/app/theme/light_theme_data.dart';
//import 'package:firebase_core/firebase_core.dart';

class App extends StatefulWidget {
  const App({super.key});

  static void setLocale(BuildContext context, Locale newLocale) {
    final stateLang = context.findAncestorStateOfType<_AppState>();

    stateLang?.changeLanguage(newLocale);
  }

  static void setTheme(BuildContext context, ThemeData newThemeData) {
    final stateTheme = context.findAncestorStateOfType<_AppState>();

    stateTheme?.changeTheme(newThemeData);
  }

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  Locale _locale = const Locale('us', 'US');
  //Locale _locale = const Locale('us', 'US');
  ThemeData _themeData = AppThemeLight.getTheme();
  //ThemeData _themeData = AppThemeDark.getTheme();

  changeTheme(ThemeData themeData) {
    setState(() {
      try {
        _themeData = themeData;
      } catch (e) {
        if (kDebugMode) {
          debugPrint(e.toString());
        }
        rethrow;
      }
    });
  }

  changeLanguage(Locale locale) {
    setState(() {
      try {
        _locale = locale;
      } catch (e) {
        if (kDebugMode) {
          debugPrint(e.toString());
        }
        rethrow;
      }
    });
  }

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    // AuthController authController = Get.put(AuthController());
    // authController.decideRoute();

    return FlavorBanner(
      child: //ScreenUtilInit(
        MaterialApp.router(
            supportedLocales: L10n.supportedLocales,
            localizationsDelegates: L10n.localizationsDelegates,
            debugShowCheckedModeBanner: false,
            theme: _themeData,
            locale: _locale,
            routerConfig: _appRouter.config()),
    );
  }
}