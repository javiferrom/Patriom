import 'package:flutter/material.dart';
import 'package:flutter_auto_size_text/flutter_auto_size_text.dart';
import 'package:patriom/core/portfolio_history.dart';
import 'package:patriom/core/portfolio_history_storage.dart';
import 'package:patriom/l10n/generated/l10n.dart';
import 'create_entry_page.dart';
import 'edit_item_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PortfolioHistory? _model;
  List<String> _dates = const [];
  int _pageIndex = 0;
  bool _showAssets = true;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, keepPage: true);
    _load();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    final m = await PortfolioHistoryStorage.loadOrCreate();
    final dates = await PortfolioHistoryStorage.getSortedDatesDesc();
    setState(() {
      _model = m;
      _dates = dates;
      _pageIndex = 0;
    });
  }

  Future<void> _refresh() async {
    final m = await PortfolioHistoryStorage.getModel();
    final dates = await PortfolioHistoryStorage.getSortedDatesDesc();
    int newIndex = _pageIndex;
    if (dates.isEmpty) {
      newIndex = 0;
    } else if (newIndex >= dates.length) {
      newIndex = dates.length - 1;
    }
    setState(() {
      _model = m;
      _dates = dates;
      _pageIndex = newIndex;
    });
  }

  String get _currentDate =>
      (_dates.isEmpty || _pageIndex < 0 || _pageIndex >= _dates.length)
          ? ''
          : _dates[_pageIndex];

  bool get _showCopyButton {
    if (_dates.isEmpty) return false;
    final latest = _dates.first;
    final now = DateTime.now();
    final today =
        '${now.year.toString().padLeft(4, '0')}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';
    return latest.compareTo(today) < 0;
  }

  Future<void> _copyLatestToToday() async {
    final sharedStrings = SharedStrings.of(context);
    final newDate = await PortfolioHistoryStorage.copyLatestToToday();
    if (newDate == null) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(sharedStrings.nothingToCopy),
        ),
      );
      return;
    }
    await _refresh();
    if (!mounted) return;
    final idx = _dates.indexOf(newDate);
    if (idx >= 0) {
      setState(() => _pageIndex = idx);
      _pageController.jumpToPage(idx);
    }
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(sharedStrings.copiedToDate(newDate))));
  }

  Future<void> _deleteCurrentDate() async {
    if (_currentDate.isEmpty) return;
    final sharedStrings = SharedStrings.of(context);
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(sharedStrings.deleteDateTitle),
        content: Text(sharedStrings.deleteDateContent(_currentDate)),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text(sharedStrings.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: Text(sharedStrings.delete),
          ),
        ],
      ),
    );
    if (confirm != true) return;

    await PortfolioHistoryStorage.deleteDate(_currentDate);
    await _refresh();

    if (!mounted) return;
    if (_dates.isEmpty) {
      setState(() => _pageIndex = 0);
    } else if (_pageIndex >= _dates.length) {
      final newIndex = _dates.length - 1;
      setState(() => _pageIndex = newIndex);
      _pageController.jumpToPage(newIndex);
    }
  }

  @override
  Widget build(BuildContext context) {
    final sharedStrings = SharedStrings.of(context);

    return Scaffold(
      appBar: AppBar(title: AutoSizeText(sharedStrings.appTitle)),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final saved = await Navigator.of(context).push<bool>(
            MaterialPageRoute(builder: (_) => const CreateEntryPage()),
          );
          if (saved == true) {
            await _refresh();
          }
        },
        child: const Icon(Icons.add),
      ),
      body: _model == null
          ? const Center(child: CircularProgressIndicator())
          : (_dates.isEmpty)
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.inbox_outlined, size: 48),
                      const SizedBox(height: 12),
                      Text(sharedStrings.noEntriesYet),
                    ],
                  ),
                )
              : Column(
                  children: [
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        children: [
                          Expanded(
                            child: Center(
                              child: Text(
                                _currentDate.isEmpty
                                    ? sharedStrings.noDate
                                    : _currentDate,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (_currentDate.isNotEmpty)
                                IconButton(
                                  tooltip: sharedStrings.copyLatestToTodayTooltip,
                                  icon: const Icon(Icons.copy_all),
                                  onPressed: _copyLatestToToday,
                                ),
                                IconButton(
                                  tooltip: sharedStrings.deleteThisDateTooltip,
                                  icon: const Icon(Icons.delete_forever),
                                  onPressed: _deleteCurrentDate,
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: SegmentedButton<bool>(
                        segments: [
                          ButtonSegment<bool>(
                              value: true, label: Text(sharedStrings.assets)),
                          ButtonSegment<bool>(
                            value: false,
                            label: Text(sharedStrings.liabilities),
                          ),
                        ],
                        selected: {_showAssets},
                        onSelectionChanged: (s) =>
                            setState(() => _showAssets = s.first),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: PageView.builder(
                        controller: _pageController,
                        onPageChanged: (i) => setState(() => _pageIndex = i),
                        itemCount: _dates.length,
                        itemBuilder: (context, index) {
                          final date = _dates[index];
                          final entry = _model!.entryByDate(date);
                          final list = _showAssets
                              ? (entry?.assets ?? const <FinancialItem>[])
                              : (entry?.liabilities ??
                                  const <FinancialItem>[]);
                          if (entry == null || list.isEmpty) {
                            return Center(child: Text(sharedStrings.noItems));
                          }
                          return ListView.separated(
                            padding: const EdgeInsets.all(12),
                            itemCount: list.length,
                            separatorBuilder: (_, _) =>
                                const SizedBox(height: 8),
                            itemBuilder: (context, i) {
                              final it = list[i];
                              final isAsset = _showAssets;
                              final color =
                                  isAsset ? Colors.green : Colors.red;
                              final sign = isAsset ? '+' : '-';
                              return Card(
                                child: ListTile(
                                  leading: Icon(
                                    it.current
                                        ? it.currency == "EUR" ? Icons.euro_symbol : Icons.attach_money
                                        : Icons.house,
                                    color: color,
                                  ),
                                  title: Text(
                                    it.entity,
                                    style: TextStyle(
                                      color: color,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  subtitle: Text(
                                    '$sign ${it.currency} ${it.amount.toStringAsFixed(2)} • ${it.description}',
                                  ),
                                  trailing: const Icon(Icons.edit),
                                  onTap: () async {
                                    final changed = await Navigator.of(context)
                                        .push<bool>(
                                      MaterialPageRoute(
                                        builder: (_) => EditItemPage(
                                          date: date,
                                          originalId: it.id,
                                          originalIsAsset: isAsset,
                                          item: it,
                                        ),
                                      ),
                                    );
                                    if (changed == true) {
                                      await _refresh();
                                    }
                                  },
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
    );
  }
}
