import 'package:flutter/material.dart';
import 'package:hotelbookingapp/Constants/colors.dart';
import 'package:hotelbookingapp/Models/hotel/result_check_avaibility_model.dart';
import 'package:hotelbookingapp/Widgets/custom_icon1_avaibility.dart';
import 'package:hotelbookingapp/Widgets/custom_icon2_avaibility.dart';

class CardAvailbility extends StatefulWidget {
  final Room data;

  const CardAvailbility({
    super.key,
    required this.data,
  });

  @override
  CardAvailbilityState createState() => CardAvailbilityState();
}

class CardAvailbilityState extends State<CardAvailbility> {
  bool isSelected = false;

  void toggleSelection() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleSelection,
      child: Card(
        color: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: isSelected ? Colors.blue : AppColors.strokColor,
            width: 2,
          ),
        ),
        child: Container(
          width: 330,
          padding: const EdgeInsets.all(4.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child:
                    (widget.data.image != false && widget.data.image.isNotEmpty)
                        ? Image.network(
                            widget.data.image,
                            width: 105,
                            height: 135,
                            fit: BoxFit.cover,
                          )
                        : const SizedBox(
                            width: 105,
                            height: 135,
                            child: Icon(
                              Icons.image_rounded,
                              size: 105,
                              color: AppColors.strokColor,
                            ),
                          ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0),
                      child: Column(
                        children: [
                          Text(
                            widget.data.title ?? "No-Data",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 2),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0),
                      child: Row(
                        children: [
                          Text(
                            'Rp${widget.data.price}',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.lightBlue,
                            ),
                          ),
                          const Text(
                            "/mlm",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: widget.data.terms!.the8.child.map((data) {
                          return CustomIcon1Avaibility(data: data);
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 8),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: widget.data.termFeatures!.map(
                          (data) {
                            return CustomIcon2Avaibility(data: data);
                          },
                        ).toList(),
                      ),
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
