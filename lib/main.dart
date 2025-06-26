import 'package:flutter/material.dart';
import 'view/imc_home_page.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const ImcApp());
}

class ImcApp extends StatefulWidget {
  const ImcApp({super.key});

  @override
  State<ImcApp> createState() => _ImcAppState();
}

class _ImcAppState extends State<ImcApp> {
  ThemeMode _themeMode = ThemeMode.system;

  void _toggleTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de IMC',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: _themeMode,
      home: ImcHomePage(toggleTheme: _toggleTheme),
      debugShowCheckedModeBanner: false,
    );
  }
}
