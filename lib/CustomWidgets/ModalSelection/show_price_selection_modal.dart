import 'package:flutter/material.dart';
import 'package:hotelbookingapp/Shared/custom_methods.dart';
import 'package:hotelbookingapp/Themes/colors.dart';

void showPriceRoomModal({
  required BuildContext context,
  required TextEditingController controller,
  required List<Map<String, String>> priceRoom,
  required Function(String, String) onSelectPrice,
}) {
  int? selectedIndex;

  showModalBottomSheet(
    context: context,
    backgroundColor: AppColors.white,
    elevation: 0,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 10),
                Container(
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(height: 12),
                const Center(
                  child: Text(
                    "Select Price",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 5),
                Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: priceRoom.length,
                    separatorBuilder: (context, index) => const Divider(),
                    itemBuilder: (context, index) {
                      bool isSelected = selectedIndex == index;

                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                          controller.text =
                              "${priceRoom[index]['room']} - Rp${formatToRp(extractNumber(priceRoom[index]['price'].toString()))}";
                          onSelectPrice(
                            priceRoom[index]['price']!,
                            priceRoom[index]['number']!,
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColors.buttonColor.withOpacity(0.1)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 18.0,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                isSelected
                                    ? Icons.check_circle
                                    : Icons.circle_outlined,
                                color: isSelected
                                    ? AppColors.buttonColor
                                    : Colors.grey,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        priceRoom[index]['room']!,
                                        style: TextStyle(
                                          fontSize: isSelected ? 16 : 15,
                                          fontWeight: isSelected
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                          color: isSelected
                                              ? AppColors.buttonColor
                                              : Colors.black,
                                        ),
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        " - (Rp ${formatToRp(extractNumber(priceRoom[index]['price'].toString()))})",
                                        style: TextStyle(
                                          fontSize: isSelected ? 16 : 15,
                                          color: isSelected
                                              ? AppColors.buttonColor
                                              : AppColors.cadetGray,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              if (isSelected)
                                const Icon(
                                  Icons.check,
                                  color: AppColors.buttonColor,
                                  size: 20,
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const Divider(color: AppColors.buttonColor),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 40),
                    backgroundColor: AppColors.buttonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    "Save",
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
