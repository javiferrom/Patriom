// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a es locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'es';

  static String m0(amount) => "Agregar {amount, number, currency} y guardar";

  static String m1(percentage) => "${percentage}%\nActivos";

  static String m2(amount) => "Balance: {amount, number, currency}";

  static String m3(date) => "Copiado a ${date}";

  static String m4(date) => "¿Eliminar toda la colección para ${date}?";

  static String m5(percentage) => "${percentage}%\nPasivos";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("Acerca de"),
    "activeLabel": MessageLookupByLibrary.simpleMessage("Activo"),
    "addAndSave": m0,
    "amountHint": MessageLookupByLibrary.simpleMessage("ej. 100.00"),
    "amountLabel": MessageLookupByLibrary.simpleMessage("Cantidad"),
    "appTitle": MessageLookupByLibrary.simpleMessage("Patriom"),
    "asset": MessageLookupByLibrary.simpleMessage("Activo"),
    "assets": MessageLookupByLibrary.simpleMessage("Activos"),
    "assetsAndPercentage": m1,
    "balanceLabel": m2,
    "cancel": MessageLookupByLibrary.simpleMessage("Cancelar"),
    "copiedToDate": m3,
    "copyLatestToDateTooltip": MessageLookupByLibrary.simpleMessage(
      "Copiar la última a una fecha",
    ),
    "createEntryTitle": MessageLookupByLibrary.simpleMessage("Crear Entrada"),
    "createNewFile": MessageLookupByLibrary.simpleMessage(
      "Crear nuevo archivo",
    ),
    "currencyHint": MessageLookupByLibrary.simpleMessage("EUR / USD / GBP"),
    "currencyLabel": MessageLookupByLibrary.simpleMessage("Divisa (ISO 4217)"),
    "currencyValidator": MessageLookupByLibrary.simpleMessage(
      "Código de 3 letras",
    ),
    "currentLabel": MessageLookupByLibrary.simpleMessage("Corriente"),
    "dateLabel": MessageLookupByLibrary.simpleMessage("Fecha (AAAA-MM-DD)"),
    "defaultCurrency": MessageLookupByLibrary.simpleMessage(
      "Divisa por defecto",
    ),
    "delete": MessageLookupByLibrary.simpleMessage("Eliminar"),
    "deleteDateContent": m4,
    "deleteDateTitle": MessageLookupByLibrary.simpleMessage("Eliminar fecha"),
    "deleteItemContent": MessageLookupByLibrary.simpleMessage(
      "¿Estás seguro de que quieres eliminar este elemento?",
    ),
    "deleteItemTitle": MessageLookupByLibrary.simpleMessage(
      "Eliminar Elemento",
    ),
    "deleteThisDateTooltip": MessageLookupByLibrary.simpleMessage(
      "Eliminar esta fecha",
    ),
    "descriptionHint": MessageLookupByLibrary.simpleMessage("Notas opcionales"),
    "descriptionLabel": MessageLookupByLibrary.simpleMessage("Descripción"),
    "editItemTitle": MessageLookupByLibrary.simpleMessage("Editar Elemento"),
    "english": MessageLookupByLibrary.simpleMessage("Inglés"),
    "entityHint": MessageLookupByLibrary.simpleMessage("ej. BBVA"),
    "entityLabel": MessageLookupByLibrary.simpleMessage("Entidad"),
    "idHint": MessageLookupByLibrary.simpleMessage("ej. Cuenta de ahorros"),
    "idLabel": MessageLookupByLibrary.simpleMessage("Nombre del activo/pasivo"),
    "invalidNumber": MessageLookupByLibrary.simpleMessage("Número inválido"),
    "language": MessageLookupByLibrary.simpleMessage("Idioma"),
    "liabilities": MessageLookupByLibrary.simpleMessage("Pasivos"),
    "liabilitiesAndPercentage": m5,
    "liability": MessageLookupByLibrary.simpleMessage("Pasivo"),
    "navHome": MessageLookupByLibrary.simpleMessage("Inicio"),
    "navSettings": MessageLookupByLibrary.simpleMessage("Configuración"),
    "navStats": MessageLookupByLibrary.simpleMessage("Estadísticas"),
    "noData": MessageLookupByLibrary.simpleMessage(
      "No hay archivo de datos aún.",
    ),
    "noDate": MessageLookupByLibrary.simpleMessage("Sin fecha"),
    "noEntriesYet": MessageLookupByLibrary.simpleMessage("Aún no hay entradas"),
    "noItems": MessageLookupByLibrary.simpleMessage("No hay elementos"),
    "nothingToCopy": MessageLookupByLibrary.simpleMessage(
      "Nada que copiar (la última fecha ya es hoy)",
    ),
    "requiredField": MessageLookupByLibrary.simpleMessage("Requerido"),
    "save": MessageLookupByLibrary.simpleMessage("Guardar"),
    "settings": MessageLookupByLibrary.simpleMessage("Ajustes"),
    "spanish": MessageLookupByLibrary.simpleMessage("Español"),
    "systemDefault": MessageLookupByLibrary.simpleMessage(
      "Por defecto del sistema",
    ),
    "theme": MessageLookupByLibrary.simpleMessage("Tema"),
    "uploadExistingFile": MessageLookupByLibrary.simpleMessage(
      "Subir archivo existente",
    ),
  };
}
