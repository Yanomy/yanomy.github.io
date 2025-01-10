import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:yanomy_github_io/router.dart';
import 'package:yanomy_github_io/theme.dart';

void main() {
  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Yanomy',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        textTheme: textTheme,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      routerConfig: router,
    );
  }
}
