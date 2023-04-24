import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/widgets/loading_button.dart';
import 'package:flutter_application_1/presentation/widgets/qrcode_widget.dart';

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
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => QRViewExample()));
            },
            icon: const Icon(Icons.qr_code),
          ),
          const SizedBox(height: 80.0),
          const Empty(
            textWorning: 'Nenhuma nota fiscal cadastrada até o momento.',
          ),
        ],
      ),
    );
  }
}
