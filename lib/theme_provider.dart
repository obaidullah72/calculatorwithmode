import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  ThemeData get themeData {
    return _isDarkMode ? darkTheme : lightTheme;
  }

  ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.tealAccent[400], // Accent color for buttons or active elements
      scaffoldBackgroundColor: Colors.grey[900], // Dark background
      appBarTheme: AppBarTheme(
        color: Colors.grey[850], // Dark app bar
        iconTheme: IconThemeData(color: Colors.tealAccent[400]), // Icon colors for the app bar
        titleTextStyle: TextStyle(color: Colors.tealAccent[400], fontSize: 20, fontWeight: FontWeight.bold),
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: Colors.white), // Light text for the dark theme
        bodyMedium: TextStyle(color: Colors.white70), // Slightly faded text
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.tealAccent[400], // Button color for dark mode
        textTheme: ButtonTextTheme.primary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black, backgroundColor: Colors.tealAccent[400], // Text color on buttons
        ),
      ),
      iconTheme: IconThemeData(color: Colors.tealAccent[400]),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.tealAccent[400],
        unselectedItemColor: Colors.grey,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.grey[800],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.tealAccent[400] ?? Colors.tealAccent, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.tealAccent[400] ?? Colors.tealAccent, width: 2),
        ),
        labelStyle: TextStyle(color: Colors.tealAccent[400]),
      ),
      // Customize more as needed
    );
  }

  ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blue, // Accent color for light mode
      scaffoldBackgroundColor: Colors.white, // Light background
      appBarTheme: AppBarTheme(
        color: Colors.blue[600], // Light App bar
        iconTheme: IconThemeData(color: Colors.white), // Icon color for light mode
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: Colors.black), // Dark text for light theme
        bodyMedium: TextStyle(color: Colors.black87),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.blue[600], // Button color for light mode
        textTheme: ButtonTextTheme.primary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.blue[600],
          backgroundColor: Colors.white, // Text color on buttons
        ),
      ),
      iconTheme: IconThemeData(color: Colors.blue[600]),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.grey[300],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.blue),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.blue, width: 2),
        ),
        labelStyle: TextStyle(color: Colors.blue),
      ),
      // Customize more as needed
    );
  }
}
