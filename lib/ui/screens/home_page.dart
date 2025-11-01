import 'package:flutter/material.dart';
import 'package:flutter_auto_size_text/flutter_auto_size_text.dart';
import 'package:patriom/core/portfolio_history_storage.dart';
import 'package:patriom/l10n/generated/l10n.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Map<String, dynamic> _data;

  @override
  void initState() {
    super.initState();
    _initializeJson();
  }

  void _initializeJson() async {
    _data = await PortfolioHistoryStorage.loadOrCreate();
  }

  @override
  Widget build(BuildContext context) {
    final sharedStrings = SharedStrings.of(context);

    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          sharedStrings.appTitle
        )
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.account_balance_wallet, size: 48),
            const SizedBox(height: 16),
            AutoSizeText(sharedStrings.balanceLabel(0)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                _data["balance"] += 100;
                PortfolioHistoryStorage.overwrite(_data);
                setState(() {});
              },
              child: AutoSizeText(sharedStrings.addAndSave(100)),
            ),
          ],
        ),
      ),
    );
  }
}
