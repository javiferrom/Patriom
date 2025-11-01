import 'package:flutter/material.dart';
import '../../core/services/json_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, dynamic>? _data;

  @override
  void initState() {
    super.initState();
    _loadExisting();
  }

  Future<void> _loadExisting() async {
    final data = await JsonService.loadLocalJson();
    setState(() => _data = data);
  }

  Future<void> _createNewJson() async {
    final newData = {
      "nombreUsuario": "Nuevo Usuario",
      "balance": 0,
      "transacciones": []
    };
    await JsonService.saveJson(newData);
    setState(() => _data = newData);
  }

  Future<void> _pickExistingJson() async {
    final data = await JsonService.pickJsonFile();
    if (data != null) {
      await JsonService.saveJson(data);
      setState(() => _data = data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Patriom')),
      body: Center(
        child: _data == null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('No hay archivo de datos aún.'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _createNewJson,
                    child: const Text('Crear nuevo archivo'),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _pickExistingJson,
                    child: const Text('Subir archivo existente'),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.account_balance_wallet, size: 48),
                  const SizedBox(height: 16),
                  Text('Usuario: ${_data!["nombreUsuario"]}'),
                  Text('Balance: \$${_data!["balance"]}'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      _data!["balance"] += 100;
                      await JsonService.saveJson(_data!);
                      setState(() {});
                    },
                    child: const Text('Agregar \$100 y guardar'),
                  ),
                ],
              ),
      ),
    );
  }
}
