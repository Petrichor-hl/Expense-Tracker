import 'package:flutter/material.dart';

import 'package:expense_tracker/widgets/expenses.dart';

void main() {
  runApp(const MyApp());
}

final kLightColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.light,
  seedColor: Colors.deepPurple,
);

final kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 5, 99, 125),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: kLightColorScheme,
        appBarTheme: AppBarTheme(
          color: kLightColorScheme.primary,
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 22,
          ),
        ),
        cardTheme: CardTheme(color: kLightColorScheme.secondaryContainer),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kLightColorScheme.primaryContainer,
            foregroundColor: kLightColorScheme.onPrimaryContainer,
          ),
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: kDarkColorScheme,
        appBarTheme: AppBarTheme(
          color: kDarkColorScheme.primaryContainer,
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 40, 40, 40),
        cardTheme: CardTheme(color: kDarkColorScheme.secondaryContainer),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer,
            foregroundColor: kDarkColorScheme.onPrimaryContainer,
          ),
        ),
      ),
      home: const Expenses(),
    );
  }
}
