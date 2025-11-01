import 'package:flutter/material.dart';
import 'package:patriom/ui/screens/home_page.dart';

class PatriomApp extends StatelessWidget {
  const PatriomApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Patriom',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
