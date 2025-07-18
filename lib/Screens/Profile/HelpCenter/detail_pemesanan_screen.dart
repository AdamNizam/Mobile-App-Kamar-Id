import 'package:flutter/material.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomBar/customapp_top_bar.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text1.dart';
import 'package:hotelbookingapp/Themes/colors.dart';

class DetailPemesanan extends StatelessWidget {
  const DetailPemesanan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppTopBar(
        title: 'Masukan Detail Pesananan',
        onPop: () {},
        onTap: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text1(
              text1:
                  "Untuk mendapatkan bantuan dengan pemesanan akomodasi atau untuk menghubungi kami, harap masukkan nomor konfirmasi atau kode PIN Anda yang bisa ditemukan di e-mail konfirmasi.",
              size: 14,
              color: AppColors.cadetGray,
              fontWeight: FontWeight.w400,
            ),
            const SizedBox(height: 20),
            const Text("Nomor konfirmasi *"),
            const SizedBox(height: 8),
            const TextField(
              decoration: InputDecoration(
                hintText: "Example. 1234",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            const Text("Code Booking *"),
            const SizedBox(height: 8),
            const TextField(
              decoration: InputDecoration(
                hintText: "Example. KMD12390",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              obscureText: true,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.buttonColor,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
                onPressed: () {
                  // TODO: Tambahkan logika lanjutkan
                },
                child: const Text1(
                  text1: "Lanjutkan",
                  color: AppColors.white,
                  size: 16,
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Divider(),
            const SizedBox(height: 12),
            const Text(
              "Temukan detail pemesanan Anda",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ListTile(
              leading: const Icon(
                Icons.email_outlined,
                color: AppColors.buttonColor,
              ),
              title: const Text("Kirim ulang email konfirmasi"),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // TODO: Tambahkan aksi kirim ulang email
              },
            ),
            const SizedBox(height: 30),
            const Divider(),
            const SizedBox(height: 12),
            const Text(
              "Perlu berbicara dengan seseorang?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            const Text1(
              text1:
                  "Jika Anda tidak dapat menemukan detail pemesanan atau memiliki pertanyaan untuk Customer Service, Anda bisa menelepon maupun mengirim pesan kepada kami.",
              size: 14,
              color: AppColors.cadetGray,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
      ),
    );
  }
}
