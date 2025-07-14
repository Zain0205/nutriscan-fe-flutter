import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutriscan_fe_flutter/core/bloc_injector.dart';

import 'package:nutriscan_fe_flutter/routes/app_router.dart';
import 'package:nutriscan_fe_flutter/utils/app_colors.dart';

void main() {
  final BlocInjector blocInjector = BlocInjector();
  runApp(
    MultiBlocProvider(
      providers: blocInjector.providers,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      title: 'NutriScan',
      theme: ThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.white,
        textTheme: GoogleFonts.signikaTextTheme(),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        colorScheme: const ColorScheme.light(
          surface: Colors.white,
        ),
        useMaterial3: true,
      ),
    );
  }
}
