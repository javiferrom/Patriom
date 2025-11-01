import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:patriom/ui/screens/home_page.dart';

class PatriomApp extends StatelessWidget {
  const PatriomApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Patriom',
      debugShowCheckedModeBanner: false,
      theme: FlexThemeData.light(),
      darkTheme: FlexThemeData.dark(),
      themeMode: ThemeMode.system,
      home: const HomePage(),
    );
  }
}
