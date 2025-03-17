import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'login_screen.dart';
import 'theme_provider.dart';

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
  void initState() {
    super.initState();
    // Set system overlay style for status bar
    _updateStatusBarColor();

    // Listen to theme changes to update status bar
    _themeProvider.addListener(_updateStatusBarColor);
  }

  void _updateStatusBarColor() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
            _themeProvider.isDarkMode ? Brightness.light : Brightness.dark,
      ),
    );
  }

  @override
  void dispose() {
    _themeProvider.removeListener(_updateStatusBarColor);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _themeProvider,
      builder: (context, _) {
        return MaterialApp(
          title: 'PlayHaven',
          debugShowCheckedModeBanner: false,
          themeMode: _themeProvider.themeMode,
          theme: _themeProvider.lightTheme,
          darkTheme: _themeProvider.darkTheme,
          home: LoginScreen(themeProvider: _themeProvider),
        );
      },
    );
  }
}
