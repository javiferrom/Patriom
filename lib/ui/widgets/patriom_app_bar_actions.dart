import 'package:flutter/material.dart';

class PatriomAppBarActions extends StatelessWidget {
  const PatriomAppBarActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.file_upload_outlined),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.save_alt),
        ),
      ],
    );
  }
}
