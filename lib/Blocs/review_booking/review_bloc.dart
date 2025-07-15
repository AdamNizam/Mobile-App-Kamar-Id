import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:hotelbookingapp/Data/Models/ReviewModel/form_review.dart';
import 'package:hotelbookingapp/Data/Models/ReviewModel/result_review.dart';
import 'package:hotelbookingapp/Data/Api/Services/review_service.dart';

part 'review_event.dart';
part 'review_state.dart';

class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  ReviewBloc() : super(ReviewInitial()) {
    on<ReviewEvent>((event, emit) async {
      if (event is SendReviewBooking) {
        try {
          emit(ReviewLoading());

          final data = await ReviewService().sendReview(event.dataRequest);

          emit(ReviewSuccess(data));
        } catch (error) {
          debugPrint('Failed review hotel: $error');
          emit(ReviewFailed(error.toString()));
        }
      }
    });
  }
}
