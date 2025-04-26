import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hotelbookingapp/Models/ReviewModel/form_review.dart';
import 'package:hotelbookingapp/Models/ReviewModel/result_review.dart';
import 'package:hotelbookingapp/Services/review_service.dart';

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
          print('Error Review : $error');
          emit(const ReviewFailed('Review Failed!'));
        }
      }
    });
  }
}
