import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:rentify/app/app.dart';
// import 'package:flavor/flavor.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

Future<void> launchApp() async {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light,
  );

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseMessaging.instance.setAutoInitEnabled(true);
  //await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);

  await Hive.initFlutter('database');
  await Hive.openBox(
      'settings'); //settings olusturduk icine theme, localization vs ekleyebiliriz. Ben authantication'ı da buna ekleyeceğim. sanırım isNewUser'ı da buna ekleyebilirim?

  runApp(const App());
}
