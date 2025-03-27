import 'package:flutter/material.dart';
import 'package:hotelbookingapp/Constants/colors.dart';

void showPriceRoomModal({
  required BuildContext context,
  required TextEditingController controller,
  required List<Map<String, String>> priceRoom,
  required Function(String) onSelectPrice,
}) {
  int?
      selectedIndex; // Pindahkan ke luar StatefulBuilder agar tidak di-reset setiap kali UI diperbarui

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
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    "Select Price",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(color: AppColors.buttonColor),
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
                              " ${priceRoom[index]['room']} - ${priceRoom[index]['price']}";
                          onSelectPrice(priceRoom[index]['price']!);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Colors.grey[300]
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 12.0,
                            horizontal: 16.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                priceRoom[index]['room']!,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                  color: isSelected
                                      ? AppColors.doggerBlue
                                      : Colors.black,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                "(${priceRoom[index]['price']!}/night)",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                  color: isSelected
                                      ? AppColors.doggerBlue
                                      : Colors.black,
                                ),
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
                      color: Colors.white,
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
