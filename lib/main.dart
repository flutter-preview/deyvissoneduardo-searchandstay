import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:searchandstay/modules/core/di/core_bindings.dart';
import 'package:searchandstay/modules/splash/splash_page.dart';
import 'package:searchandstay/routes/app_routes.dart';
import 'package:searchandstay/theme/theme_default.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'modules/core/helpers/environments.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Environments.loadEnvs();
  
  await dotenv.load(fileName: ".env");
  
  await Supabase.initialize(
      url: dotenv.env['url']!, anonKey: dotenv.env['anonKey']!);

  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
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
