import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotelbookingapp/Blocs/review_booking/review_bloc.dart';
import 'package:hotelbookingapp/Models/BookingModel/history_booking.model.dart';
import 'package:hotelbookingapp/Models/ReviewModel/form_review.dart';
import 'package:hotelbookingapp/Shared/custom_snackbar.dart';
import 'package:hotelbookingapp/Themes/colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../CustomWidgets/CustomButton/custombtn.dart';
import '../../CustomWidgets/CustomText/detailstext1.dart';
import '../../CustomWidgets/CustomText/detailstext2.dart';

class SendReviewScreen extends StatefulWidget {
  final DataHistory dataHistory;
  const SendReviewScreen({super.key, required this.dataHistory});

  @override
  SendReviewScreenState createState() => SendReviewScreenState();
}

class SendReviewScreenState extends State<SendReviewScreen> {
  int serviceRating = 0;
  int organizationRating = 0;
  int friendlinessRating = 0;
  int areaExpertRating = 0;
  int safetyRating = 0;

  final TextEditingController _commentController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();

  @override
  void dispose() {
    _commentController.dispose();
    _titleController.dispose();
    super.dispose();
  }

  Widget buildStarRating(
      String title, int currentRating, Function(int) onRatingChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: AppColors.cadetGray,
          ),
        ),
        const SizedBox(height: 5),
        Row(
          children: List.generate(5, (index) {
            int starIndex = index + 1;
            return GestureDetector(
              onTap: () => onRatingChanged(starIndex),
              child: AnimatedScale(
                scale: starIndex <= currentRating ? 1.2 : 1.0,
                duration: const Duration(milliseconds: 200),
                child: Icon(
                  starIndex <= currentRating
                      ? Icons.star_rounded
                      : Icons.star_border_rounded,
                  color: AppColors.amberColor,
                  size: 30,
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.bgColor,
        title: Text(
          'Review Your Stay',
          style: GoogleFonts.poppins(
            color: AppColors.cadetGray,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                  side: const BorderSide(
                    color: AppColors.beauBlue,
                  ),
                ),
                color: AppColors.white,
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: Image.network(
                          'https://picsum.photos/400/300',
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text1(text1: 'Hotel Experience'),
                            SizedBox(height: 6),
                            Text2(
                                text2:
                                    'Share your honest feedback about your stay.'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                'Review Title',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: AppColors.cadetGray,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.beauBlue),
                ),
                child: TextFormField(
                  controller: _titleController,
                  maxLines: 1,
                  style: GoogleFonts.poppins(fontSize: 16),
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    hintText: 'Enter a title...',
                    hintStyle: TextStyle(color: AppColors.cadetGray),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Your Review',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: AppColors.cadetGray,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.beauBlue),
                ),
                child: TextFormField(
                  controller: _commentController,
                  maxLines: 6,
                  style: GoogleFonts.poppins(fontSize: 16),
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    hintText: 'Tell us about your experience...',
                    hintStyle: TextStyle(color: AppColors.cadetGray),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              buildStarRating(
                'Service',
                serviceRating,
                (rating) => setState(() => serviceRating = rating),
              ),
              buildStarRating(
                'Organization',
                organizationRating,
                (rating) => setState(() => organizationRating = rating),
              ),
              buildStarRating(
                'Friendliness',
                friendlinessRating,
                (rating) => setState(() => friendlinessRating = rating),
              ),
              buildStarRating(
                'Area Expertise',
                areaExpertRating,
                (rating) => setState(() => areaExpertRating = rating),
              ),
              buildStarRating(
                'Safety',
                safetyRating,
                (rating) => setState(() => safetyRating = rating),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        child: BlocConsumer<ReviewBloc, ReviewState>(
          listener: (context, state) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (state is ReviewFailed) {
                showCustomSnackbar(context, state.error);
              }
              if (state is ReviewSuccess) {
                showCustomSnackbar(context, 'Review successfully submitted');
                setState(() {
                  serviceRating = 0;
                  organizationRating = 0;
                  friendlinessRating = 0;
                  areaExpertRating = 0;
                  safetyRating = 0;
                  _commentController.clear();
                  _titleController.clear();
                });
              }
            });
          },
          builder: (context, state) {
            if (state is ReviewLoading) {
              return Center(
                child: LoadingAnimationWidget.hexagonDots(
                  color: AppColors.tabColor,
                  size: 50,
                ),
              );
            } else {
              return CustomButton(
                text: 'Send Review',
                onTap: () {
                  if (serviceRating == 0 ||
                      organizationRating == 0 ||
                      friendlinessRating == 0 ||
                      areaExpertRating == 0 ||
                      safetyRating == 0) {
                    showCustomSnackbar(context, 'All stars must be filled');
                  } else if (_titleController.text.isEmpty) {
                    showCustomSnackbar(context, 'Title must be filled');
                  } else {
                    final dataReview = FormReview(
                      reviewTitle: _titleController.text,
                      reviewContent: _commentController.text,
                      reviewStats: ReviewStats(
                        service: serviceRating.toString(),
                        organization: organizationRating.toString(),
                        friendliness: friendlinessRating.toString(),
                        areaExpert: areaExpertRating.toString(),
                        safety: safetyRating.toString(),
                      ),
                      reviewServiceId: widget.dataHistory.objectId.toString(),
                      reviewServiceType: 'hotel',
                      submit: 'Leave a review',
                    );

                    print('Data Review :${jsonEncode(dataReview)}');

                    context
                        .read<ReviewBloc>()
                        .add(SendReviewBooking(dataReview));
                  }
                },
              );
            }
          },
        ),
      ),
    );
  }
}
