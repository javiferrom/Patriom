import 'package:flutter/material.dart';
import 'package:patriom/l10n/generated/l10n.dart';
import 'package:patriom/ui/widgets/patriom_app_bar_actions.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final sharedStrings = SharedStrings.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(sharedStrings.appTitle),
        actions: const [PatriomAppBarActions()],
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.brightness_6),
            title: Text(sharedStrings.theme),
            subtitle: Text(sharedStrings.systemDefault),
            onTap: () {
              // Handle theme change
            },
          ),
          ListTile(
            leading: const Icon(Icons.attach_money),
            title: Text(sharedStrings.defaultCurrency),
            subtitle: const Text('USD'),
            onTap: () {
              // Handle currency change
            },
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: Text(sharedStrings.about),
            onTap: () {
              // Show about dialog
            },
          ),
        ],
      ),
    );
  }
}
