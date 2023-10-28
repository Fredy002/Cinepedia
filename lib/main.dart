import 'package:cinemapedia/config/router/appRouter.dart';
import 'package:cinemapedia/config/theme/appTheme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
    );
  }
}
