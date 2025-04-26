part of 'review_bloc.dart';

sealed class ReviewEvent extends Equatable {
  const ReviewEvent();

  @override
  List<Object> get props => [];
}

class SendReviewBooking extends ReviewEvent {
  final FormReview dataRequest;

  const SendReviewBooking(this.dataRequest);

  @override
  List<Object> get props => [dataRequest];
}
