import 'package:flutter/material.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomBar/customapp_top_bar.dart';

class HelpDetailScreen extends StatelessWidget {
  const HelpDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppTopBar(
        title: 'Detail Pertayaan',
        onPop: () {},
        onTap: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(children: const [
          Text(
            'Bagaimana saya bisa tahu jika\npemesanan saya dibatalkan?',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Setelah Anda membatalkan pemesanan dengan kami, '
            'Anda akan menerima sebuah email yang memastikan pembatalan tersebut. '
            'Periksa kotak masuk dan folder spam/junk Anda. Jika Anda tidak menerima '
            'emailnya dalam waktu 24 jam, harap hubungi akomodasi untuk memastikan mereka '
            'menerima pembatalan Anda.',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 20),
          Divider(),
        ]),
      ),
    );
  }
}
