// ignore_for_file: file_names
import 'package:cinemapedia/src/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter  = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
  ]
);