import 'package:flutter/material.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text1.dart';
import 'package:hotelbookingapp/Data/Models/HotelModel/hotel_all_model.dart';
import 'package:hotelbookingapp/Shared/shared_snackbar.dart';
import 'package:hotelbookingapp/Themes/colors.dart';

class TagTermWidget extends StatefulWidget {
  final List<Attribute> category;

  const TagTermWidget({
    super.key,
    required this.category,
  });

  @override
  State<TagTermWidget> createState() => _TagTermWidgetState();
}

class _TagTermWidgetState extends State<TagTermWidget> {
  late Map<int, bool> _isExpandedMap;
  late List<int> idterm;
  final bool termChek = false;

  @override
  void initState() {
    super.initState();
    _isExpandedMap = {
      for (int i = 0; i < widget.category.length; i++) i: false,
    };
  }

  void toggleExpand(int index) {
    setState(() {
      _isExpandedMap[index] = !(_isExpandedMap[index] ?? false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 18,
      runSpacing: 8,
      children: widget.category.asMap().entries.map((entry) {
        final index = entry.key;
        final category = entry.value;
        final isExpanded = _isExpandedMap[index] ?? false;

        return GestureDetector(
          onTap: () => toggleExpand(index),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isExpanded ? AppColors.beauBlue : AppColors.white,
                width: 1.5,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text1(
                      text1: '${category.name}',
                      fontWeight: FontWeight.w500,
                      size: 13,
                    ),
                    const SizedBox(width: 8),
                    Icon(
                      isExpanded ? Icons.expand_less : Icons.expand_more,
                      size: 2,
                      color: AppColors.black,
                    ),
                  ],
                ),
                if (isExpanded)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: category.terms!.map((term) {
                        return GestureDetector(
                          onTap: () {
                            showCustomSnackbar(
                                context, 'anda memilih id :${term.id}');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4),
                              child: Text1(
                                text1: '${term.name}',
                                size: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
