import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotelbookingapp/Constants/colors.dart';
import 'package:hotelbookingapp/Shared/shared_notificatios.dart';
import 'package:hotelbookingapp/Widgets/custombtn.dart';

void showFilterSelectionModal(BuildContext context) {
  int ratingHotel = 1;
  bool ht = false;
  bool hr = false;
  bool hf = false;
  final TextEditingController minPriceController = TextEditingController();
  final TextEditingController maxPriceController = TextEditingController();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColors.bgColor,
    elevation: 0,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.fromLTRB(
          20,
          24,
          20,
          MediaQuery.of(context).viewInsets.bottom,
        ),
        child: StatefulBuilder(
          builder: (context, setState) {
            Widget buildTextField(String hint,
                {TextEditingController? controller, bool isEditable = false}) {
              return Container(
                height: 48,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  border: Border.all(
                    color: AppColors.beauBlue,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: isEditable
                          ? TextField(
                              controller: controller,
                              keyboardType: TextInputType.number,
                              style: GoogleFonts.poppins(fontSize: 14),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Rp0",
                              ),
                            )
                          : Text(
                              hint,
                              style: GoogleFonts.poppins(fontSize: 14),
                            ),
                    ),
                  ],
                ),
              );
            }

            Widget buildLabeledField(String label, Widget child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 6),
                  child,
                ],
              );
            }

            Widget buildRoomCounter() {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: AppColors.beauBlue,
                    width: 2,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        if (ratingHotel > 5) {
                          setState(() => ratingHotel--);
                        }
                      },
                      icon: const Icon(
                        Icons.remove,
                        size: 24,
                        color: AppColors.redDark,
                      ),
                    ),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      transitionBuilder: (child, animation) {
                        return ScaleTransition(scale: animation, child: child);
                      },
                      child: Text(
                        '$ratingHotel',
                        key: ValueKey<int>(ratingHotel),
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.star_rounded,
                      size: 22,
                      color: AppColors.amberColor,
                    ),
                    IconButton(
                      onPressed: () => setState(() => ratingHotel++),
                      icon: const Icon(
                        Icons.add,
                        size: 24,
                      ),
                    ),
                  ],
                ),
              );
            }

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.cadetGray,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Tampilkan hotel terdekat",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Transform.scale(
                      scale: 0.90,
                      child: Switch(
                        value: ht,
                        activeColor: AppColors.buttonColor,
                        inactiveTrackColor: AppColors.white,
                        inactiveThumbColor: AppColors.beauBlue,
                        onChanged: (value) {
                          setState(() {
                            ht = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Hotel termurah",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Transform.scale(
                      scale: 0.90,
                      child: Switch(
                        value: hr,
                        activeColor: AppColors.buttonColor,
                        inactiveTrackColor: AppColors.white,
                        inactiveThumbColor: AppColors.beauBlue,
                        onChanged: (value) {
                          setState(() {
                            hr = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Hotel featured",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Transform.scale(
                      scale: 0.90,
                      child: Switch(
                        value: hf,
                        activeColor: AppColors.buttonColor,
                        inactiveTrackColor: AppColors.white,
                        inactiveThumbColor: AppColors.beauBlue,
                        onChanged: (value) {
                          setState(() {
                            hf = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: buildLabeledField(
                        "Min Price",
                        buildTextField(
                          "Rp0",
                          controller: minPriceController,
                          isEditable: true,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: buildLabeledField(
                        "Max Price",
                        buildTextField(
                          'Rp0',
                          controller: maxPriceController,
                          isEditable: true,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: buildLabeledField(
                        "Rating Hotel",
                        buildRoomCounter(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                CustomButton(
                  text: 'Save',
                  onTap: () {
                    showCustomSnackbar(context, 'feature is not available');
                  },
                ),
                const SizedBox(height: 16),
              ],
            );
          },
        ),
      );
    },
  );
}
