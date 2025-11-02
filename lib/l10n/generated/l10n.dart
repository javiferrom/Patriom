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

  /// `Idioma`
  String get language {
    return Intl.message(
      'Idioma',
      name: 'language',
      desc: 'Opción para cambiar el idioma de la aplicación.',
      args: [],
    );
  }

  /// `Español`
  String get spanish {
    return Intl.message(
      'Español',
      name: 'spanish',
      desc: 'El idioma español.',
      args: [],
    );
  }

  /// `Inglés`
  String get english {
    return Intl.message(
      'Inglés',
      name: 'english',
      desc: 'El idioma inglés.',
      args: [],
    );
  }

  /// `Nada que copiar (la última fecha ya es hoy)`
  String get nothingToCopy {
    return Intl.message(
      'Nada que copiar (la última fecha ya es hoy)',
      name: 'nothingToCopy',
      desc: '',
      args: [],
    );
  }

  /// `Copiado a {date}`
  String copiedToDate(String date) {
    return Intl.message(
      'Copiado a $date',
      name: 'copiedToDate',
      desc: '',
      args: [date],
    );
  }

  /// `Eliminar fecha`
  String get deleteDateTitle {
    return Intl.message(
      'Eliminar fecha',
      name: 'deleteDateTitle',
      desc: '',
      args: [],
    );
  }

  /// `¿Eliminar toda la colección para {date}?`
  String deleteDateContent(String date) {
    return Intl.message(
      '¿Eliminar toda la colección para $date?',
      name: 'deleteDateContent',
      desc: '',
      args: [date],
    );
  }

  /// `Cancelar`
  String get cancel {
    return Intl.message('Cancelar', name: 'cancel', desc: '', args: []);
  }

  /// `Eliminar`
  String get delete {
    return Intl.message('Eliminar', name: 'delete', desc: '', args: []);
  }

  /// `Aún no hay entradas`
  String get noEntriesYet {
    return Intl.message(
      'Aún no hay entradas',
      name: 'noEntriesYet',
      desc: '',
      args: [],
    );
  }

  /// `Sin fecha`
  String get noDate {
    return Intl.message('Sin fecha', name: 'noDate', desc: '', args: []);
  }

  /// `Copiar la última a una fecha`
  String get copyLatestToDateTooltip {
    return Intl.message(
      'Copiar la última a una fecha',
      name: 'copyLatestToDateTooltip',
      desc: '',
      args: [],
    );
  }

  /// `Eliminar esta fecha`
  String get deleteThisDateTooltip {
    return Intl.message(
      'Eliminar esta fecha',
      name: 'deleteThisDateTooltip',
      desc: '',
      args: [],
    );
  }

  /// `Activos`
  String get assets {
    return Intl.message('Activos', name: 'assets', desc: '', args: []);
  }

  /// `Pasivos`
  String get liabilities {
    return Intl.message('Pasivos', name: 'liabilities', desc: '', args: []);
  }

  /// `No hay elementos`
  String get noItems {
    return Intl.message(
      'No hay elementos',
      name: 'noItems',
      desc: '',
      args: [],
    );
  }

  /// `Crear Entrada`
  String get createEntryTitle {
    return Intl.message(
      'Crear Entrada',
      name: 'createEntryTitle',
      desc: '',
      args: [],
    );
  }

  /// `Fecha (AAAA-MM-DD)`
  String get dateLabel {
    return Intl.message(
      'Fecha (AAAA-MM-DD)',
      name: 'dateLabel',
      desc: '',
      args: [],
    );
  }

  /// `Activo`
  String get asset {
    return Intl.message('Activo', name: 'asset', desc: '', args: []);
  }

  /// `Pasivo`
  String get liability {
    return Intl.message('Pasivo', name: 'liability', desc: '', args: []);
  }

  /// `Activo`
  String get activeLabel {
    return Intl.message('Activo', name: 'activeLabel', desc: '', args: []);
  }

  /// `Corriente`
  String get currentLabel {
    return Intl.message('Corriente', name: 'currentLabel', desc: '', args: []);
  }

  /// `Nombre del activo/pasivo`
  String get idLabel {
    return Intl.message(
      'Nombre del activo/pasivo',
      name: 'idLabel',
      desc: '',
      args: [],
    );
  }

  /// `ej. Cuenta de ahorros`
  String get idHint {
    return Intl.message(
      'ej. Cuenta de ahorros',
      name: 'idHint',
      desc: '',
      args: [],
    );
  }

  /// `Requerido`
  String get requiredField {
    return Intl.message('Requerido', name: 'requiredField', desc: '', args: []);
  }

  /// `Entidad`
  String get entityLabel {
    return Intl.message('Entidad', name: 'entityLabel', desc: '', args: []);
  }

  /// `ej. BBVA`
  String get entityHint {
    return Intl.message('ej. BBVA', name: 'entityHint', desc: '', args: []);
  }

  /// `Cantidad`
  String get amountLabel {
    return Intl.message('Cantidad', name: 'amountLabel', desc: '', args: []);
  }

  /// `ej. 100.00`
  String get amountHint {
    return Intl.message('ej. 100.00', name: 'amountHint', desc: '', args: []);
  }

  /// `Número inválido`
  String get invalidNumber {
    return Intl.message(
      'Número inválido',
      name: 'invalidNumber',
      desc: '',
      args: [],
    );
  }

  /// `Divisa (ISO 4217)`
  String get currencyLabel {
    return Intl.message(
      'Divisa (ISO 4217)',
      name: 'currencyLabel',
      desc: '',
      args: [],
    );
  }

  /// `EUR / USD / GBP`
  String get currencyHint {
    return Intl.message(
      'EUR / USD / GBP',
      name: 'currencyHint',
      desc: '',
      args: [],
    );
  }

  /// `Código de 3 letras`
  String get currencyValidator {
    return Intl.message(
      'Código de 3 letras',
      name: 'currencyValidator',
      desc: '',
      args: [],
    );
  }

  /// `Descripción`
  String get descriptionLabel {
    return Intl.message(
      'Descripción',
      name: 'descriptionLabel',
      desc: '',
      args: [],
    );
  }

  /// `Notas opcionales`
  String get descriptionHint {
    return Intl.message(
      'Notas opcionales',
      name: 'descriptionHint',
      desc: '',
      args: [],
    );
  }

  /// `Guardar`
  String get save {
    return Intl.message('Guardar', name: 'save', desc: '', args: []);
  }

  /// `Editar Elemento`
  String get editItemTitle {
    return Intl.message(
      'Editar Elemento',
      name: 'editItemTitle',
      desc: '',
      args: [],
    );
  }

  /// `Eliminar Elemento`
  String get deleteItemTitle {
    return Intl.message(
      'Eliminar Elemento',
      name: 'deleteItemTitle',
      desc: '',
      args: [],
    );
  }

  /// `¿Estás seguro de que quieres eliminar este elemento?`
  String get deleteItemContent {
    return Intl.message(
      '¿Estás seguro de que quieres eliminar este elemento?',
      name: 'deleteItemContent',
      desc: '',
      args: [],
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
