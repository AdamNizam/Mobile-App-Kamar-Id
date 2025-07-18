import 'package:flutter/material.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomBar/customapp_top_bar.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text1.dart';
import 'package:hotelbookingapp/Screens/Profile/HelpCenter/detail_pemesanan_screen.dart';
import 'package:hotelbookingapp/Screens/Profile/HelpCenter/help_detail_screen.dart';
import 'package:hotelbookingapp/Themes/colors.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  int selectedTabIndex = 0;

  final List<Map<String, dynamic>> tabData = [
    {'icon': Icons.payment, 'label': 'Pembayaran'},
    {'icon': Icons.clear_all, 'label': 'Fasilitas'},
    {'icon': Icons.apartment, 'label': 'Hotel'},
    {'icon': Icons.bed, 'label': 'Kamar'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppTopBar(title: 'Help Center', onPop: () {}, onTap: () {}),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Selamat datang di Pusat Bantuan',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Kami ada 24 jam dalam sehari',
                  style: TextStyle(color: Colors.black54),
                ),
                const SizedBox(height: 10),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const DetailPemesanan()));
                  },
                  icon: const Icon(Icons.crop),
                  label: const Text1(
                    text1: 'Cek Pemesanan',
                    size: 14,
                    color: AppColors.white,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.buttonColor,
                    foregroundColor: AppColors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ),
          _buildCategoryTabs(),
          const Divider(),
          ..._buildTabContent(), // Menampilkan isi berdasarkan tab yang dipilih
        ],
      ),
    );
  }

  Widget _buildCategoryTabs() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: List.generate(tabData.length, (index) {
          final tab = tabData[index];
          return _buildTab(tab['icon'], tab['label'], index);
        }),
      ),
    );
  }

  Widget _buildTab(IconData icon, String label, int index) {
    final selected = selectedTabIndex == index;
    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            selectedTabIndex = index;
          });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            children: [
              Icon(
                icon,
                color: selected ? AppColors.buttonColor : AppColors.cadetGray,
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: selected ? AppColors.buttonColor : AppColors.cadetGray,
                  fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildTabContent() {
    switch (selectedTabIndex) {
      case 0:
        return [
          _buildMenuItem('Cara Pembayaran'),
          _buildMenuItem('Refund'),
        ];
      case 1:
        return [
          _buildMenuItem('WiFi'),
          _buildMenuItem('Kolam Renang'),
        ];
      case 2:
        return [
          _buildMenuItem('Kebijakan Hotel'),
          _buildMenuItem('Check-in & Check-out'),
        ];
      case 3:
        return [
          _buildMenuItem('Tipe Kamar'),
          _buildMenuItem('Harga'),
        ];
      default:
        return [];
    }
  }

  Widget _buildMenuItem(String title) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const HelpDetailScreen()),
        );
      },
    );
  }
}
