// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(amount) => "Add {amount, number, currency} and save";

  static String m1(percentage) => "${percentage}%\nAssets";

  static String m2(amount) => "Balance: {amount, number, currency}";

  static String m3(date) => "Copied to ${date}";

  static String m4(date) => "Delete the entire collection for ${date}?";

  static String m5(percentage) => "${percentage}%\nLiabilities";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("About"),
    "activeLabel": MessageLookupByLibrary.simpleMessage("Active"),
    "addAndSave": m0,
    "amountHint": MessageLookupByLibrary.simpleMessage("e.g. 150000.00"),
    "amountLabel": MessageLookupByLibrary.simpleMessage("Amount"),
    "appTitle": MessageLookupByLibrary.simpleMessage("Patriom"),
    "asset": MessageLookupByLibrary.simpleMessage("Asset"),
    "assets": MessageLookupByLibrary.simpleMessage("Assets"),
    "assetsAndPercentage": m1,
    "balanceLabel": m2,
    "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "copiedToDate": m3,
    "copyLatestToTodayTooltip": MessageLookupByLibrary.simpleMessage(
      "Copy latest to today",
    ),
    "createEntryTitle": MessageLookupByLibrary.simpleMessage("Create Entry"),
    "createNewFile": MessageLookupByLibrary.simpleMessage("Create new file"),
    "currencyHint": MessageLookupByLibrary.simpleMessage("EUR / USD / GBP"),
    "currencyLabel": MessageLookupByLibrary.simpleMessage(
      "Currency (ISO 4217)",
    ),
    "currencyValidator": MessageLookupByLibrary.simpleMessage("3-letter code"),
    "currentLabel": MessageLookupByLibrary.simpleMessage("Current"),
    "dateLabel": MessageLookupByLibrary.simpleMessage("Date (YYYY-MM-DD)"),
    "defaultCurrency": MessageLookupByLibrary.simpleMessage("Default currency"),
    "delete": MessageLookupByLibrary.simpleMessage("Delete"),
    "deleteDateContent": m4,
    "deleteDateTitle": MessageLookupByLibrary.simpleMessage("Delete date"),
    "deleteItemContent": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to delete this item?",
    ),
    "deleteItemTitle": MessageLookupByLibrary.simpleMessage("Delete Item"),
    "deleteThisDateTooltip": MessageLookupByLibrary.simpleMessage(
      "Delete this date",
    ),
    "descriptionHint": MessageLookupByLibrary.simpleMessage("Optional notes"),
    "descriptionLabel": MessageLookupByLibrary.simpleMessage("Description"),
    "editItemTitle": MessageLookupByLibrary.simpleMessage("Edit Item"),
    "english": MessageLookupByLibrary.simpleMessage("English"),
    "entityHint": MessageLookupByLibrary.simpleMessage(
      "e.g. Flat on Main Street",
    ),
    "entityLabel": MessageLookupByLibrary.simpleMessage("Entity"),
    "idHint": MessageLookupByLibrary.simpleMessage(
      "e.g. property_downtown_flat",
    ),
    "idLabel": MessageLookupByLibrary.simpleMessage("ID"),
    "invalidNumber": MessageLookupByLibrary.simpleMessage("Invalid number"),
    "language": MessageLookupByLibrary.simpleMessage("Language"),
    "liabilities": MessageLookupByLibrary.simpleMessage("Liabilities"),
    "liabilitiesAndPercentage": m5,
    "liability": MessageLookupByLibrary.simpleMessage("Liability"),
    "navHome": MessageLookupByLibrary.simpleMessage("Home"),
    "navSettings": MessageLookupByLibrary.simpleMessage("Settings"),
    "navStats": MessageLookupByLibrary.simpleMessage("Stats"),
    "noData": MessageLookupByLibrary.simpleMessage("No data file yet."),
    "noDate": MessageLookupByLibrary.simpleMessage("No date"),
    "noEntriesYet": MessageLookupByLibrary.simpleMessage("No entries yet"),
    "noItems": MessageLookupByLibrary.simpleMessage("No items"),
    "nothingToCopy": MessageLookupByLibrary.simpleMessage(
      "Nothing to copy (latest is already today)",
    ),
    "requiredField": MessageLookupByLibrary.simpleMessage("Required"),
    "save": MessageLookupByLibrary.simpleMessage("Save"),
    "settings": MessageLookupByLibrary.simpleMessage("Settings"),
    "spanish": MessageLookupByLibrary.simpleMessage("Spanish"),
    "systemDefault": MessageLookupByLibrary.simpleMessage("System default"),
    "theme": MessageLookupByLibrary.simpleMessage("Theme"),
    "uploadExistingFile": MessageLookupByLibrary.simpleMessage(
      "Upload existing file",
    ),
  };
}
