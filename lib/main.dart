import 'package:flutter/material.dart';
import 'package:movie_picker/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color(0xFFF7F7F7),
        highlightColor: const Color(0xCC000000),
        unselectedWidgetColor: const Color(0x33000000),
        splashColor: const Color(0xFFE65541),
        canvasColor: const Color(0xFFEBEBEB),
        cardColor: const Color(0xFFFFFFFF),
        fontFamily: 'GothamSSm',
        textTheme: const TextTheme(
          titleMedium: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
          titleLarge: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.normal,
          ),
          bodySmall: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.normal,
              fontFamily: 'GothamSSm-medium',
              color: Color(0x66000000)),
          bodyMedium: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              fontFamily: 'GothamSSm-medium',
              color: Color(0x66000000)),
          bodyLarge: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Color(0x66000000)),
          labelMedium: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              fontFamily: 'GothamSSm-light',
              color: Color(0x33000000)),
          labelSmall: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              fontFamily: 'GothamSSm-medium',
              color: Color(0xCC000000)),
        ),
      ),
      darkTheme: ThemeData(
        primaryColor: const Color(0xFF121212),
        splashColor: const Color(0xFFE65541),
        canvasColor: const Color(0xFF303030),
        cardColor: const Color(0xFF424242),
        highlightColor: const Color(0xffffffff),
        unselectedWidgetColor: const Color(0x33000000),
        fontFamily: 'GothamSSm',
        textTheme: const TextTheme(
          titleMedium: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
            color: Color(0xffffffff),
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            fontFamily: 'GothamSSm-medium',
            color: Color(0xffB0B0B0),
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            fontFamily: 'GothamSSm-medium',
            color: Color(0xffB0B0B0),
          ),
          labelMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            fontFamily: 'GothamSSm-medium',
            color: Color(0xffB0B0B0),
          ),
        ),
      ),
      themeMode: ThemeMode.system,
      home: const HomeScreen(),
    );
  }
}

