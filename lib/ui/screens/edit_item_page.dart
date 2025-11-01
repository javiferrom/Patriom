import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auto_size_text/flutter_auto_size_text.dart';
import 'package:patriom/core/portfolio_history.dart';
import 'package:patriom/core/portfolio_history_storage.dart';

class EditItemPage extends StatefulWidget {
  final String date;
  final String originalId;
  final bool originalIsAsset;
  final FinancialItem item;

  const EditItemPage({
    super.key,
    required this.date,
    required this.originalId,
    required this.originalIsAsset,
    required this.item,
  });

  @override
  State<EditItemPage> createState() => _EditItemPageState();
}

class _EditItemPageState extends State<EditItemPage> {
  final _formKey = GlobalKey<FormState>();

  late bool _isAsset;
  late bool _active;
  late bool _current;

  late final TextEditingController _idCtrl;
  late final TextEditingController _entityCtrl;
  late final TextEditingController _amountCtrl;
  late final TextEditingController _currencyCtrl;
  late final TextEditingController _descriptionCtrl;

  @override
  void initState() {
    super.initState();
    _isAsset = widget.originalIsAsset;
    _active = widget.item.active;
    _current = widget.item.current;

    _idCtrl = TextEditingController(text: widget.item.id);
    _entityCtrl = TextEditingController(text: widget.item.entity);
    _amountCtrl = TextEditingController(text: widget.item.amount.toStringAsFixed(2));
    _currencyCtrl = TextEditingController(text: widget.item.currency);
    _descriptionCtrl = TextEditingController(text: widget.item.description);
  }

  @override
  void dispose() {
    _idCtrl.dispose();
    _entityCtrl.dispose();
    _amountCtrl.dispose();
    _currencyCtrl.dispose();
    _descriptionCtrl.dispose();
    super.dispose();
  }

  Future<void> _delete() async {
    await PortfolioHistoryStorage.removeItem(widget.date, widget.originalId);
    if (!mounted) return;
    Navigator.of(context).pop(true);
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    final newItem = FinancialItem(
      id: _idCtrl.text.trim(),
      active: _active,
      current: _current,
      entity: _entityCtrl.text.trim(),
      amount: double.tryParse(_amountCtrl.text.replaceAll(',', '.')) ?? 0.0,
      currency: _currencyCtrl.text.trim().toUpperCase(),
      description: _descriptionCtrl.text.trim(),
    );

    final idChanged = newItem.id != widget.originalId;

    if (_isAsset == widget.originalIsAsset && !idChanged) {
      await PortfolioHistoryStorage.replaceItem(widget.date, widget.originalId, newItem);
    } else {
      await PortfolioHistoryStorage.removeItem(widget.date, widget.originalId);
      if (_isAsset) {
        await PortfolioHistoryStorage.addAsset(widget.date, newItem);
      } else {
        await PortfolioHistoryStorage.addLiability(widget.date, newItem);
      }
    }

    if (!mounted) return;
    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const AutoSizeText('Edit Item')),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              SegmentedButton<bool>(
                segments: const [
                  ButtonSegment<bool>(value: true, label: Text('Asset')),
                  ButtonSegment<bool>(value: false, label: Text('Liability')),
                ],
                selected: {_isAsset},
                onSelectionChanged: (s) => setState(() => _isAsset = s.first),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: SwitchListTile(
                      title: const Text('Active'),
                      value: _active,
                      onChanged: (v) => setState(() => _active = v),
                    ),
                  ),
                  Expanded(
                    child: SwitchListTile(
                      title: const Text('Current'),
                      value: _current,
                      onChanged: (v) => setState(() => _current = v),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _idCtrl,
                decoration: const InputDecoration(
                  labelText: 'ID',
                  border: OutlineInputBorder(),
                ),
                validator: (v) => (v == null || v.trim().isEmpty) ? 'Required' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _entityCtrl,
                decoration: const InputDecoration(
                  labelText: 'Entity',
                  border: OutlineInputBorder(),
                ),
                validator: (v) => (v == null || v.trim().isEmpty) ? 'Required' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _amountCtrl,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]'))],
                decoration: const InputDecoration(
                  labelText: 'Amount',
                  border: OutlineInputBorder(),
                ),
                validator: (v) {
                  final text = (v ?? '').trim().replaceAll(',', '.');
                  if (text.isEmpty) return 'Required';
                  if (num.tryParse(text) == null) return 'Invalid number';
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _currencyCtrl,
                textCapitalization: TextCapitalization.characters,
                maxLength: 3,
                decoration: const InputDecoration(
                  labelText: 'Currency',
                  counterText: '',
                  border: OutlineInputBorder(),
                ),
                validator: (v) {
                  final t = (v ?? '').trim().toUpperCase();
                  if (t.length != 3) return '3 letters';
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _descriptionCtrl,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              FilledButton.icon(
                onPressed: _save,
                icon: const Icon(Icons.save),
                label: const AutoSizeText('Save'),
              ),
              const SizedBox(height: 12),
              OutlinedButton.icon(
                onPressed: _delete,
                icon: const Icon(Icons.delete_outline),
                label: const AutoSizeText('Delete'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
