import 'package:flutter/material.dart';
import 'package:hotelbookingapp/CustomWidgets/ModalSelection/show_filter_selection_modal.dart';

import '../../../../Constants/colors.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 1, horizontal: 10),
              hintText: 'Search',
              prefixIcon: const Icon(
                Icons.search,
                color: AppColors.buttonColor,
                size: 30,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: AppColors.beauBlue,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: AppColors.amberColor,
                  width: 2,
                ),
              ),
              hintStyle: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
              filled: true,
              fillColor: AppColors.white,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () {
            showFilterSelectionModal(context);
          },
          child: Container(
            height: 46,
            width: 46,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.tune,
              color: AppColors.buttonColor,
              size: 24,
            ),
          ),
        ),
      ],
    );
  }
}
