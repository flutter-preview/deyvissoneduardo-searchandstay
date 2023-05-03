import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:searchandstay/firebase_options.dart';
import 'package:searchandstay/modules/core/di/core_bindings.dart';
import 'package:searchandstay/modules/core/helpers/firebase_messaging.dart';
import 'package:searchandstay/modules/splash/splash_page.dart';
import 'package:searchandstay/routes/app_routes.dart';
import 'package:searchandstay/theme/theme_default.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'modules/core/helpers/environments.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {}
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  Environments.loadEnvs();

  SearchFirebaseMessaging.init();

  await dotenv.load(fileName: ".env");

  await Supabase.initialize(
      url: dotenv.env['url']!, anonKey: dotenv.env['anonKey']!);

  debugPrint('***********************************************');
  debugPrint(await FirebaseMessaging.instance.getToken());
  debugPrint('***********************************************');

  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Search And Stay',
        theme: theme(),
        showPerformanceOverlay: false,
        initialBinding: CoreBindings(),
        getPages: AppRoutes.pages,
        initialRoute: AppRoutes.SPLASHPAGE,
        home: const SplashPage(),
      ),
    ),
  );
}
