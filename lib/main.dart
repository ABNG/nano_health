import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ms_material_color/ms_material_color.dart';
import 'package:nano_health/module/login/screen/login.dart';

import 'core/config/riverpod_logger.dart';
import 'core/theme/color.dart';
import 'core/theme/typography.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    ProviderScope(
      observers: [RiverpodLogger()],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'NanoHealth',
        theme: ThemeData(
          fontFamily: 'Open Sans',
          textTheme: KTypography.textTheme,
          primarySwatch: MsMaterialColor(kPrimaryColor),
          primaryColor: const Color(kPrimaryColor),
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
