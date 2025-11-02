// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class SharedStrings {
  SharedStrings();

  static SharedStrings? _current;

  static SharedStrings get current {
    assert(
      _current != null,
      'No instance of SharedStrings was loaded. Try to initialize the SharedStrings delegate before accessing SharedStrings.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<SharedStrings> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = SharedStrings();
      SharedStrings._current = instance;

      return instance;
    });
  }

  static SharedStrings of(BuildContext context) {
    final instance = SharedStrings.maybeOf(context);
    assert(
      instance != null,
      'No instance of SharedStrings present in the widget tree. Did you add SharedStrings.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static SharedStrings? maybeOf(BuildContext context) {
    return Localizations.of<SharedStrings>(context, SharedStrings);
  }

  /// `Patriom`
  String get appTitle {
    return Intl.message(
      'Patriom',
      name: 'appTitle',
      desc: 'Título de la aplicación mostrado en el AppBar.',
      args: [],
    );
  }

  /// `No hay archivo de datos aún.`
  String get noData {
    return Intl.message(
      'No hay archivo de datos aún.',
      name: 'noData',
      desc: 'Se muestra cuando no existe un archivo JSON local.',
      args: [],
    );
  }

  /// `Crear nuevo archivo`
  String get createNewFile {
    return Intl.message(
      'Crear nuevo archivo',
      name: 'createNewFile',
      desc: 'Botón para crear un nuevo archivo de datos JSON.',
      args: [],
    );
  }

  /// `Subir archivo existente`
  String get uploadExistingFile {
    return Intl.message(
      'Subir archivo existente',
      name: 'uploadExistingFile',
      desc: 'Botón para seleccionar un archivo de datos JSON existente.',
      args: [],
    );
  }

  /// `Balance: {amount, number, currency}`
  String balanceLabel(num amount) {
    return Intl.message(
      'Balance: {amount, number, currency}',
      name: 'balanceLabel',
      desc: 'Muestra el balance del usuario formateado como moneda.',
      args: [amount],
    );
  }

  /// `Agregar {amount, number, currency} y guardar`
  String addAndSave(num amount) {
    return Intl.message(
      'Agregar {amount, number, currency} y guardar',
      name: 'addAndSave',
      desc: 'Botón para sumar un monto fijo al balance y guardarlo.',
      args: [amount],
    );
  }

  /// `Inicio`
  String get navHome {
    return Intl.message(
      'Inicio',
      name: 'navHome',
      desc:
          'Etiqueta para la pestaña de Inicio en la barra de navegación inferior.',
      args: [],
    );
  }

  /// `Estadísticas`
  String get navStats {
    return Intl.message(
      'Estadísticas',
      name: 'navStats',
      desc:
          'Etiqueta para la pestaña de Estadísticas en la barra de navegación inferior.',
      args: [],
    );
  }

  /// `Configuración`
  String get navSettings {
    return Intl.message(
      'Configuración',
      name: 'navSettings',
      desc:
          'Etiqueta para la pestaña de Configuración en la barra de navegación inferior.',
      args: [],
    );
  }

  /// `Ajustes`
  String get settings {
    return Intl.message(
      'Ajustes',
      name: 'settings',
      desc: 'Título para la página de ajustes.',
      args: [],
    );
  }

  /// `Tema`
  String get theme {
    return Intl.message(
      'Tema',
      name: 'theme',
      desc: 'Opción para cambiar el tema de la aplicación.',
      args: [],
    );
  }

  /// `Por defecto del sistema`
  String get systemDefault {
    return Intl.message(
      'Por defecto del sistema',
      name: 'systemDefault',
      desc: 'Opción para usar el tema por defecto del sistema.',
      args: [],
    );
  }

  /// `Divisa por defecto`
  String get defaultCurrency {
    return Intl.message(
      'Divisa por defecto',
      name: 'defaultCurrency',
      desc: 'Opción para cambiar la divisa por defecto.',
      args: [],
    );
  }

  /// `Acerca de`
  String get about {
    return Intl.message(
      'Acerca de',
      name: 'about',
      desc: 'Opción para mostrar información sobre la aplicación.',
      args: [],
    );
  }

  /// `{percentage}%\nActivos`
  String assetsAndPercentage(double percentage) {
    return Intl.message(
      '$percentage%\nActivos',
      name: 'assetsAndPercentage',
      desc: 'Muestra el porcentaje de activos en el gráfico de tarta.',
      args: [percentage],
    );
  }

  /// `{percentage}%\nPasivos`
  String liabilitiesAndPercentage(double percentage) {
    return Intl.message(
      '$percentage%\nPasivos',
      name: 'liabilitiesAndPercentage',
      desc: 'Muestra el porcentaje de pasivos en el gráfico de tarta.',
      args: [percentage],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<SharedStrings> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<SharedStrings> load(Locale locale) => SharedStrings.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
