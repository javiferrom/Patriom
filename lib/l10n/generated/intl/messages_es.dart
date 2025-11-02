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

  static String m3(percentage) => "${percentage}%\nPasivos";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("Acerca de"),
    "addAndSave": m0,
    "appTitle": MessageLookupByLibrary.simpleMessage("Patriom"),
    "assetsAndPercentage": m1,
    "balanceLabel": m2,
    "createNewFile": MessageLookupByLibrary.simpleMessage(
      "Crear nuevo archivo",
    ),
    "defaultCurrency": MessageLookupByLibrary.simpleMessage(
      "Divisa por defecto",
    ),
    "liabilitiesAndPercentage": m3,
    "navHome": MessageLookupByLibrary.simpleMessage("Inicio"),
    "navSettings": MessageLookupByLibrary.simpleMessage("Configuración"),
    "navStats": MessageLookupByLibrary.simpleMessage("Estadísticas"),
    "noData": MessageLookupByLibrary.simpleMessage(
      "No hay archivo de datos aún.",
    ),
    "settings": MessageLookupByLibrary.simpleMessage("Ajustes"),
    "systemDefault": MessageLookupByLibrary.simpleMessage(
      "Por defecto del sistema",
    ),
    "theme": MessageLookupByLibrary.simpleMessage("Tema"),
    "uploadExistingFile": MessageLookupByLibrary.simpleMessage(
      "Subir archivo existente",
    ),
  };
}
