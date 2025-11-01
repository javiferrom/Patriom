import 'package:flutter/material.dart';
import 'package:flutter_auto_size_text/flutter_auto_size_text.dart';

class UnknownRouteScreen extends StatelessWidget {
  const UnknownRouteScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const AutoSizeText('Not found'),
      bottomNavigationBar: const SizedBox.shrink(), // keep layout consistent
    );
  }
}