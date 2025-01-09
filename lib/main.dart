import 'package:flutter/material.dart';
import 'package:yanomy_github_io/home.dart';
import 'package:yanomy_github_io/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yanomy',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        textTheme: textTheme,

      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: HomePage(),
    );
  }
}
