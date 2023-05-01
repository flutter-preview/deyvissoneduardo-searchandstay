import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchandstay/modules/core/di/core_bindings.dart';
import 'package:searchandstay/modules/splash/splash_page.dart';
import 'package:searchandstay/routes/app_routes.dart';
import 'package:searchandstay/theme/theme_default.dart';

void main() {
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
