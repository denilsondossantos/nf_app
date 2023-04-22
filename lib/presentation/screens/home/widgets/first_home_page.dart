import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/widgets/loading_button.dart';

import '../../../widgets/empty.dart';

class FirstHomePage extends StatelessWidget {
  const FirstHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 40, 10, 10),
      child: Column(
        children: [
          LoadingButton(
            width: 200.0,
            text: 'Ler QR',
            onPressed: () {},
            icon: const Icon(Icons.qr_code),
          ),
          const SizedBox(height: 80.0),
          const Empty(
            textWorning: 'Nenhuma nota fiscal sendo cadastrada no momento.',
          ),
        ],
      ),
    );
  }
}
