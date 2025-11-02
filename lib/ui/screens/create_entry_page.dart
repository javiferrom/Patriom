import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auto_size_text/flutter_auto_size_text.dart';
import 'package:patriom/core/portfolio_history.dart';
import 'package:patriom/core/portfolio_history_storage.dart';
import 'package:patriom/l10n/generated/l10n.dart';

class CreateEntryPage extends StatefulWidget {
  const CreateEntryPage({super.key});

  @override
  State<CreateEntryPage> createState() => _CreateEntryPageState();
}

class _CreateEntryPageState extends State<CreateEntryPage> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _dateCtrl;
  final TextEditingController _idCtrl = TextEditingController();
  final TextEditingController _entityCtrl = TextEditingController();
  final TextEditingController _amountCtrl = TextEditingController();
  final TextEditingController _currencyCtrl = TextEditingController(text: 'EUR');
  final TextEditingController _descriptionCtrl = TextEditingController();

  bool _isAsset = true;
  bool _active = true;
  bool _current = false;

  @override
  void initState() {
    super.initState();
    _dateCtrl = TextEditingController(text: _todayIso());
  }

  @override
  void dispose() {
    _dateCtrl.dispose();
    _idCtrl.dispose();
    _entityCtrl.dispose();
    _amountCtrl.dispose();
    _currencyCtrl.dispose();
    _descriptionCtrl.dispose();
    super.dispose();
  }

  String _todayIso() {
    final now = DateTime.now();
    final mm = now.month.toString().padLeft(2, '0');
    final dd = now.day.toString().padLeft(2, '0');
    return '${now.year}-$mm-$dd';
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final parts = _dateCtrl.text.split('-');
    DateTime initial = now;
    if (parts.length == 3) {
      final y = int.tryParse(parts[0]);
      final m = int.tryParse(parts[1]);
      final d = int.tryParse(parts[2]);
      if (y != null && m != null && d != null) {
        initial = DateTime(y, m, d);
      }
    }
    final picked = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime(1990),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      final mm = picked.month.toString().padLeft(2, '0');
      final dd = picked.day.toString().padLeft(2, '0');
      setState(() {
        _dateCtrl.text = '${picked.year}-$mm-$dd';
      });
    }
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    final amount = double.tryParse(_amountCtrl.text.replaceAll(',', '.')) ?? 0.0;

    final item = FinancialItem(
      id: _idCtrl.text.trim(),
      active: _active,
      current: _current,
      entity: _entityCtrl.text.trim(),
      amount: amount,
      currency: _currencyCtrl.text.trim().toUpperCase(),
      description: _descriptionCtrl.text.trim(),
    );

    final date = _dateCtrl.text.trim();

    await PortfolioHistoryStorage.addEntryIfMissing(date);
    if (_isAsset) {
      await PortfolioHistoryStorage.addAsset(date, item);
    } else {
      await PortfolioHistoryStorage.addLiability(date, item);
    }

    if (!mounted) return;
    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    final sharedStrings = SharedStrings.of(context);

    return Scaffold(
      appBar: AppBar(title: AutoSizeText(sharedStrings.createEntryTitle)),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _dateCtrl,
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: sharedStrings.dateLabel,
                        border: const OutlineInputBorder(),
                      ),
                      onTap: _pickDate,
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: _pickDate,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SegmentedButton<bool>(
                segments: [
                  ButtonSegment<bool>(value: true, label: Text(sharedStrings.asset)),
                  ButtonSegment<bool>(value: false, label: Text(sharedStrings.liability)),
                ],
                selected: {_isAsset},
                onSelectionChanged: (s) => setState(() => _isAsset = s.first),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: SwitchListTile(
                      title: Text(sharedStrings.activeLabel),
                      value: _active,
                      onChanged: (v) => setState(() => _active = v),
                    ),
                  ),
                  Expanded(
                    child: SwitchListTile(
                      title: Text(sharedStrings.currentLabel),
                      value: _current,
                      onChanged: (v) => setState(() => _current = v),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _idCtrl,
                decoration: InputDecoration(
                  labelText: sharedStrings.idLabel,
                  hintText: sharedStrings.idHint,
                  border: const OutlineInputBorder(),
                ),
                validator: (v) => (v == null || v.trim().isEmpty) ? sharedStrings.requiredField : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _entityCtrl,
                decoration: InputDecoration(
                  labelText: sharedStrings.entityLabel,
                  hintText: sharedStrings.entityHint,
                  border: const OutlineInputBorder(),
                ),
                validator: (v) => (v == null || v.trim().isEmpty) ? sharedStrings.requiredField : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _amountCtrl,
                keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: false),
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]'))],
                decoration: InputDecoration(
                  labelText: sharedStrings.amountLabel,
                  hintText: sharedStrings.amountHint,
                  border: const OutlineInputBorder(),
                ),
                validator: (v) {
                  final text = (v ?? '').trim().replaceAll(',', '.');
                  final num? parsed = num.tryParse(text);
                  if (text.isEmpty) return sharedStrings.requiredField;
                  if (parsed == null) return sharedStrings.invalidNumber;
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _currencyCtrl,
                textCapitalization: TextCapitalization.characters,
                maxLength: 3,
                decoration: InputDecoration(
                  labelText: sharedStrings.currencyLabel,
                  hintText: sharedStrings.currencyHint,
                  border: const OutlineInputBorder(),
                  counterText: '',
                ),
                validator: (v) {
                  final t = (v ?? '').trim().toUpperCase();
                  if (t.length != 3) return sharedStrings.currencyValidator;
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _descriptionCtrl,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: sharedStrings.descriptionLabel,
                  hintText: sharedStrings.descriptionHint,
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              FilledButton.icon(
                onPressed: _save,
                icon: const Icon(Icons.save),
                label: AutoSizeText(sharedStrings.save),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
