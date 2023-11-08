import 'package:flavor/flavor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:rentify/app/l10n/app_localizations.dart';
import 'package:rentify/app/routes/app_router.dart';
//import 'package:firebase_core/firebase_core.dart';

class App extends StatefulWidget {
  const App({super.key});

  static void setLocale(BuildContext context, Locale newLocale) {
    final stateLang = context.findAncestorStateOfType<_AppState>();

    stateLang?.changeLanguage(newLocale);
  }

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  Locale _locale = const Locale('us', 'US');
  //Locale _locale = const Locale('us', 'US');
  //ThemeData _themeData = AppThemeDark.getTheme();


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

    return ValueListenableBuilder(
      valueListenable: Hive.box('settings').listenable(),
      builder: (context, box, child) {
        final isDark = box.get('isDark', defaultValue: false);
        final isNewUser = box.get('isNewUser', defaultValue: true);
        final isLand = box.get('isLand', defaultValue: false);
        return FlavorBanner(
          child: MaterialApp.router(
              supportedLocales: L10n.supportedLocales,
              localizationsDelegates: L10n.localizationsDelegates,
              debugShowCheckedModeBanner: false,
              theme: isDark? ThemeData.dark(): ThemeData.light(),
              locale: _locale,
              routerConfig: _appRouter.config()),
        );
      },
    );
  }
}
