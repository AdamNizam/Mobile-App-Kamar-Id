import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hotelbookingapp/Blocs/filter/filter_hotel_bloc.dart';
import 'package:hotelbookingapp/Blocs/hotel/hotel_bloc.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomCard/card_all_hotel.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomCard/card_all_recomended.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomCard/card_filter.dart';
import 'package:hotelbookingapp/CustomWidgets/Shimmers/shimmer_card.dart';
import 'package:hotelbookingapp/CustomWidgets/Shimmers/shimmer_list.dart';
import 'package:hotelbookingapp/CustomWidgets/default_value.dart';
import 'package:hotelbookingapp/Shared/shared_snackbar.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../CustomWidgets/CommonWidgets/address_widget.dart';
import '../../CustomWidgets/CommonWidgets/categories_widget.dart';
import '../../CustomWidgets/CommonWidgets/home_widget.dart';
import '../../CustomWidgets/CommonWidgets/search_widget.dart';
import '../../CustomWidgets/CustomText/text1.dart';
import '../../CustomWidgets/CustomText/text11.dart';
import '../../Themes/colors.dart';
import '../Categories/all_categories.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int totalNotification = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.tabColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HomeWidgte(),
                      SizedBox(height: 6),
                      AddressWidget(),
                      SizedBox(height: 10),
                      SearchWidget(),
                      SizedBox(height: 6),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text1(
                          text1: AppLocalizations.of(context)!.textCategories,
                          size: 18),
                      Text11(
                        text2: AppLocalizations.of(context)!.textSeeAll,
                        color: AppColors.tabColor,
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const AllCategoriesScreen()),
                    );
                  },
                ),
                const SizedBox(height: 9),
                const CategoriesWidget(),
                const SizedBox(height: 16),
                _resultSearchHotel()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _resultSearchHotel() {
    return BlocBuilder<FilterHotelBloc, FilterHotelState>(
        builder: (context, filterState) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (filterState is FilterHotelFailed) {
          showCustomSnackbar(context, filterState.error);
        }
      });
      if (filterState is FilterHotelLoading) {
        return Center(
          child: LoadingAnimationWidget.hexagonDots(
            color: AppColors.buttonColor,
            size: 30,
          ),
        );
      }
      if (filterState is FilterHotelSuccess) {
        return Column(
          children: [
            Text1(
              text1: AppLocalizations.of(context)!.textFilterResult,
              size: 14,
            ),
            const SizedBox(height: 10),
            filterState.hotels.isNotEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: filterState.hotels.map((data) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: CardFilter(
                          data: data,
                        ),
                      );
                    }).toList(),
                  )
                : const DefaultValue(
                    imageSvg: 'images/empty_wishlisht.svg',
                    text: 'Hotel is not available',
                  ),
          ],
        );
      }

      return _homeAllHotel();
    });
  }

  Widget _homeAllHotel() {
    return BlocBuilder<HotelBloc, HotelState>(
      builder: (context, hotelState) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (hotelState is HotelFailed) {
            showCustomSnackbar(context, hotelState.error);
          }
        });

        if (hotelState is HotelSuccess) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text1(
                text1: AppLocalizations.of(context)!.textRecomended,
                size: 18,
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: hotelState.data.data!.rows!.data!.map((hotel) {
                    return CardAllRecomended(
                      key: ValueKey(hotel.id),
                      hotel: hotel,
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 16.0),
              Text1(
                text1: AppLocalizations.of(context)!.textAllHotels,
                size: 18,
              ),
              const SizedBox(height: 10.0),
              Column(
                children: hotelState.data.data!.rows!.data!.map((hotel) {
                  return CardAllHotel(
                    key: ValueKey(hotel.id),
                    hotel: hotel,
                  );
                }).toList(),
              ),
            ],
          );
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text1(
              text1: AppLocalizations.of(context)!.textRecomended,
              size: 18,
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  3,
                  (_) => const ShimmerCard(),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text1(
              text1: AppLocalizations.of(context)!.textAllHotels,
              size: 18,
            ),
            const SizedBox(height: 10),
            Column(
              children: List.generate(
                4,
                (_) => const ShimmerList(),
              ),
            ),
          ],
        );
      },
    );
  }
}
