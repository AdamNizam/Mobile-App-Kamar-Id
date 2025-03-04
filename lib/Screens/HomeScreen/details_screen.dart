import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelbookingapp/Blocs/hotel/hotel_bloc.dart';
import 'package:hotelbookingapp/Shared/shared_notificatios.dart';
import 'package:hotelbookingapp/Widgets/custombtn.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../Constants/colors.dart';
import '../Booking/book_hotel.dart';

class HotelDetailsScreen extends StatefulWidget {
  final String? slug;
  const HotelDetailsScreen({
    super.key,
    this.slug = '',
  });

  @override
  State<HotelDetailsScreen> createState() => _HotelDetailsScreenState();
}

class _HotelDetailsScreenState extends State<HotelDetailsScreen> {
  String selectedImage = 'images/LuxuryHotels.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            HotelBloc()..add(GetDetailHotel(widget.slug.toString())),
        child: Stack(
          children: [
            Column(
              children: [
                // Gambar utama
                Stack(
                  children: [
                    Image.asset(
                      selectedImage,
                      width: double.infinity,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 40,
                      left: 16,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back,
                            color: Colors.white, size: 28),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: BlocBuilder<HotelBloc, HotelState>(
                    builder: (context, state) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        if (state is HotelFailed) {
                          showCustomSnackbar(context, state.error);
                        }
                        if (state is HotelDetailSuccess) {
                          showCustomSnackbar(context, 'Success Berhasil');
                        }
                      });

                      if (state is HotelLoading) {
                        return Center(
                          child: LoadingAnimationWidget.staggeredDotsWave(
                            color: AppColors.tabColor,
                            size: 50,
                          ),
                        );
                      }

                      if (state is HotelDetailSuccess) {
                        return Center(
                          child: Text(
                              "Nama Hotel: ${state.hotelDetail.id} dan ${widget.slug}"), // ✅ Tampilkan data
                        );
                      }

                      return const Center(
                          child: Text(
                              "Data tidak ditemukan")); // 🔥 Ditampilkan hanya jika tidak ada data sama sekali
                    },
                  ),
                ),
              ],
            ),
            // Tombol booking di bagian bawah
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: CustomButton(
                text: 'Booking Now',
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const BookHotelScreen(),
                  ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
