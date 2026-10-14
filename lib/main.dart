import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() => runApp(const ConociendoFranciaApp());

class ConociendoFranciaApp extends StatelessWidget {
  const ConociendoFranciaApp({super.key});

  static const azulFrancia = Color(0xFF1F3A93);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conociendo Francia',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: azulFrancia,
          secondary: const Color(0xFFC62828),
        ),
        scaffoldBackgroundColor: const Color(0xFFF7F8FC),
        appBarTheme: const AppBarTheme(
          backgroundColor: azulFrancia,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
