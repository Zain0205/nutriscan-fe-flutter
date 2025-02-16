import 'package:go_router/go_router.dart';
import 'package:nutriscan_fe_flutter/screens/auth/register/register_screen.dart';
import 'package:nutriscan_fe_flutter/screens/onboarding/onboarding_screen.dart';
import 'package:nutriscan_fe_flutter/screens/splash/splash_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: "/", builder: (context, state) => const SplashPage()),
    GoRoute(path: "/onboarding", builder: (context, state) => const OnboardingScreen()),
    GoRoute(path: "/register", builder: (context, state) => const RegisterScreen()),
  ],
);
