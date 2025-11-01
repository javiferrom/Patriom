import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:patriom/core/patriom_const.dart';
import 'package:patriom/core/patriom_router.dart';
import 'package:patriom/ui/screens/home_page.dart';

import '../l10n/generated/l10n.dart';

class PatriomApp extends StatelessWidget {
  const PatriomApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: PatriomConst.title,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        SharedStrings.delegate,
      ],
      supportedLocales: SharedStrings.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: FlexThemeData.light(scheme: FlexScheme.money),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.money),
      themeMode: ThemeMode.system,
      routerConfig: PatriomRouter.router,
//      home: const HomePage(),
    );
  }
}
