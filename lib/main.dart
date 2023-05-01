import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
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

  await Supabase.initialize(
    url: 'https://specyzczfoxicwhxxcdu.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNwZWN5emN6Zm94aWN3aHh4Y2R1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODI5MTU4OTUsImV4cCI6MTk5ODQ5MTg5NX0.I8nySdRab6EvEGeFeI9eHEPsAsC8JYWruTP7G22hcWw',
  );

  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => GetMaterialApp(
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
