import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotelbookingapp/Blocs/review_booking/review_bloc.dart';
import 'package:hotelbookingapp/Constants/colors.dart';
import 'package:hotelbookingapp/Models/BookingModel/history_booking.model.dart';
import 'package:hotelbookingapp/Models/ReviewModel/form_review.dart';
import 'package:hotelbookingapp/Shared/shared_notificatios.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../Widgets/custombtn.dart';
import '../../Widgets/detailstext1.dart';
import '../../Widgets/detailstext2.dart';

class SendReviewScreen extends StatefulWidget {
  final DataHistory dataHistory;
  const SendReviewScreen({
    super.key,
    required this.dataHistory,
  });

  @override
  SendReviewScreenState createState() => SendReviewScreenState();
}

class SendReviewScreenState extends State<SendReviewScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  int serviceRating = 0;
  int organizationRating = 0;
  int friendlinessRating = 0;
  int areaExpertRating = 0;
  int safetyRating = 0;

  final TextEditingController _commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..repeat(reverse: true);
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _commentController.dispose();
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
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: List.generate(5, (index) {
            int starIndex = index + 1;
            return GestureDetector(
              onTap: () => onRatingChanged(starIndex),
              child: Icon(
                starIndex <= currentRating
                    ? Icons.star_rounded
                    : Icons.star_border_rounded,
                color: AppColors.amberColor,
                size: 32,
              ),
            );
          }),
        ),
        const SizedBox(height: 16),
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
        foregroundColor: AppColors.cadetGray,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeTransition(
                  opacity: _animation,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: AppColors.beauBlue, width: 2),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            'https://picsum.photos/400/300',
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 16),
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
                const SizedBox(height: 30),
                buildStarRating('Service', serviceRating,
                    (rating) => setState(() => serviceRating = rating)),
                buildStarRating('Organization', organizationRating,
                    (rating) => setState(() => organizationRating = rating)),
                buildStarRating('Friendliness', friendlinessRating,
                    (rating) => setState(() => friendlinessRating = rating)),
                buildStarRating('Area Expertise', areaExpertRating,
                    (rating) => setState(() => areaExpertRating = rating)),
                buildStarRating('Safety', safetyRating,
                    (rating) => setState(() => safetyRating = rating)),
                Text(
                  'Write Your Review',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.beauBlue),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    controller: _commentController,
                    maxLines: 6,
                    style: GoogleFonts.poppins(fontSize: 16),
                    decoration: const InputDecoration(
                      hintText: 'Describe your experience...',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child:
            BlocConsumer<ReviewBloc, ReviewState>(listener: (context, state) {
          WidgetsBinding.instance.addPostFrameCallback(
            (_) {
              if (state is ReviewFailed) {
                showCustomSnackbar(context, state.error);
              }
              if (state is ReviewSuccess) {
                showCustomSnackbar(context, 'Review successfully submitted');
              }
            },
          );
        }, builder: (BuildContext context, ReviewState state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              State is ReviewLoading
                  ? Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: AppColors.amberColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: LoadingAnimationWidget.fourRotatingDots(
                          color: AppColors.white,
                          size: 27,
                        ),
                      ),
                    )
                  : CustomButton(
                      text: 'Send Review',
                      onTap: () {
                        if (serviceRating != 0) {
                          final dataReview = FormReview(
                            reviewTitle: 'Review Hotel',
                            reviewContent: _commentController.toString(),
                            reviewStats: ReviewStats(
                              service: serviceRating.toString(),
                              organization: organizationRating.toString(),
                              friendliness: friendlinessRating.toString(),
                              areaExpert: areaExpertRating.toString(),
                              safety: safetyRating.toString(),
                            ),
                            reviewServiceId:
                                widget.dataHistory.objectId.toString(),
                            reviewServiceType: 'hotel',
                            submit: 'Leave a review',
                          );

                          print('Data Review :${jsonEncode(dataReview)}');

                          context.read<ReviewBloc>().add(
                                SendReviewBooking(dataReview),
                              );
                        } else {
                          showCustomSnackbar(
                            context,
                            'all stars must be filled',
                          );
                        }
                      },
                    ),
            ],
          );
        }),
      ),
    );
  }
}
