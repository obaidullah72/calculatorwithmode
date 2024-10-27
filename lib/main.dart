import 'package:flutter/material.dart';
import 'theme_provider.dart';
import 'homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ThemeProvider _themeProvider = ThemeProvider();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _themeProvider.lightTheme,
      darkTheme: _themeProvider.darkTheme,
      themeMode: _themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(
        onThemeToggle: () {
          setState(() {
            _themeProvider.toggleTheme();
          });
        },
        isDarkMode: _themeProvider.isDarkMode,
      ),
    );
  }
}
