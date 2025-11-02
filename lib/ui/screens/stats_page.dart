import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auto_size_text/flutter_auto_size_text.dart';
import 'package:patriom/core/portfolio_history.dart';
import 'package:patriom/core/portfolio_history_storage.dart';
import 'package:patriom/l10n/generated/l10n.dart';
import 'package:patriom/ui/widgets/patriom_app_bar_actions.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({super.key});

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  double _assetsPercentage = 0;
  double _liabilitiesPercentage = 0;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadStats();
  }

  Future<void> _loadStats() async {
    final model = await PortfolioHistoryStorage.getModel();
    final dates = await PortfolioHistoryStorage.getSortedDatesDesc();

    if (dates.isEmpty) {
      setState(() {
        _isLoading = false;
      });
      return;
    }

    final latestDate = dates.first;
    final entry = model.entryByDate(latestDate);

    if (entry == null) {
      setState(() {
        _isLoading = false;
      });
      return;
    }

    final totalAssets = entry.assets.fold<double>(0.0, (sum, item) => sum + item.amount);
    final totalLiabilities = entry.liabilities.fold<double>(0.0, (sum, item) => sum + item.amount);
    final total = totalAssets + totalLiabilities;

    if (total == 0) {
      setState(() {
        _assetsPercentage = 0;
        _liabilitiesPercentage = 0;
        _isLoading = false;
      });
    } else {
      setState(() {
        _assetsPercentage = (totalAssets / total) * 100;
        _liabilitiesPercentage = (totalLiabilities / total) * 100;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final sharedStrings = SharedStrings.of(context);

    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(sharedStrings.appTitle),
        actions: const [PatriomAppBarActions()],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : (_assetsPercentage == 0 && _liabilitiesPercentage == 0)
              ? Center(child: Text(sharedStrings.noData))
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Expanded(
                        child: PieChart(
                          PieChartData(
                            sections: [
                              PieChartSectionData(
                                color: Colors.green,
                                value: _assetsPercentage,
                                title: sharedStrings.assetsAndPercentage(double.parse(_assetsPercentage.toStringAsFixed(1))),
                                radius: 100,
                                titleStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              PieChartSectionData(
                                color: Colors.red,
                                value: _liabilitiesPercentage,
                                title: sharedStrings.liabilitiesAndPercentage(double.parse(_liabilitiesPercentage.toStringAsFixed(1))),
                                radius: 100,
                                titleStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                            sectionsSpace: 2,
                            centerSpaceRadius: 40,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }
}
