import 'package:flutter/material.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomBar/customapp_top_bar.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text1.dart';

import '../../../Themes/colors.dart';
import 'help_detail_screen.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<HelpTopic> filteredTopics = [];

  final List<HelpTopic> topics = [
    HelpTopic(
      icon: Icons.cancel,
      title: 'Pembatalan & Pengembalian Dana',
      description: 'Cara membatalkan pesanan dan klaim dana.',
      solution: '''
1. Buka menu 'Pemesanan Saya'.
2. Pilih pesanan > klik 'Batalkan'.
3. Ikuti langkah-langkahnya.
4. Dana dikembalikan 7–14 hari kerja.
''',
    ),
    HelpTopic(
      icon: Icons.payment,
      title: 'Masalah Pembayaran',
      description: 'Transaksi gagal, pembayaran ganda, dsb.',
      solution: '''
- Pastikan kartu aktif dan saldo cukup.
- Coba metode lain.
- Hubungi CS jika terjadi dobel pembayaran.
''',
    ),
    HelpTopic(
      icon: Icons.lock,
      title: 'Akun & Login',
      description: 'Lupa password atau masalah masuk akun.',
      solution: '''
1. Klik 'Lupa Password' saat login.
2. Cek email (termasuk spam).
3. Jika email tidak aktif, hubungi CS.
''',
    ),
    HelpTopic(
      icon: Icons.edit_calendar,
      title: 'Ubah Pemesanan',
      description: 'Mengubah tanggal, tamu, atau preferensi.',
      solution: '''
1. Masuk ke 'Pemesanan Saya'.
2. Klik detail > 'Ubah Pemesanan'.
3. Perubahan tergantung kebijakan hotel.
''',
    ),
    HelpTopic(
      icon: Icons.help_outline,
      title: 'Lainnya',
      description: 'Topik bantuan umum lainnya.',
      solution: '''
- Hubungi kami melalui Live Chat 24/7.
- Kunjungi pusat bantuan lengkap via website.
''',
    ),
  ];

  @override
  void initState() {
    super.initState();
    filteredTopics = topics;
    _searchController.addListener(_filterTopics);
  }

  void _filterTopics() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredTopics = topics
          .where((t) =>
              t.title.toLowerCase().contains(query) ||
              t.description.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          CustomAppTopBar(title: 'Pusat Bantuan', onPop: () {}, onTap: () {}),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: const Icon(Icons.search, size: 20),
                isDense: true,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                filled: true,
                fillColor: AppColors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide:
                      const BorderSide(color: AppColors.beauBlue, width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide:
                      const BorderSide(color: AppColors.beauBlue, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide:
                      const BorderSide(color: AppColors.amberColor, width: 1),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // RATA KIRI
              children: [
                Text1(
                  text1: 'Selamat datang di Pusat Bantuan',
                  size: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
                SizedBox(height: 8),
                Text1(
                  text1: 'Kami ada 24 jam dalam sehari',
                  size: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.cadetGray,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredTopics.length,
              itemBuilder: (context, index) {
                final topic = filteredTopics[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => HelpDetailScreen(topic: topic),
                        ),
                      );
                    },
                    child: Card(
                      color: AppColors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              topic.icon,
                              color: AppColors.buttonColor,
                              size: 28,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text1(
                                    text1: topic.title,
                                    size: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  const SizedBox(height: 6),
                                  Text1(
                                    text1: topic.description,
                                    size: 12,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.cadetGray,
                                  ),
                                ],
                              ),
                            ),
                            const Icon(Icons.chevron_right, color: Colors.grey),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class HelpTopic {
  final IconData icon;
  final String title;
  final String description;
  final String solution;

  HelpTopic({
    required this.icon,
    required this.title,
    required this.description,
    required this.solution,
  });
}
