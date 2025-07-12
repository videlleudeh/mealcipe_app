import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mealcipe_app/screens/main_screen.dart';

final theme = ThemeData(
  textTheme: GoogleFonts.montserratTextTheme(),
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 230, 159, 6),
  ),
);

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: MainScreen(),
    );
  }
}
