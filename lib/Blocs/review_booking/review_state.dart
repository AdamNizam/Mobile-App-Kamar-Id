part of 'review_bloc.dart';

sealed class ReviewState extends Equatable {
  const ReviewState();

  @override
  List<Object> get props => [];
}

final class ReviewInitial extends ReviewState {}

final class ReviewLoading extends ReviewState {}

final class ReviewFailed extends ReviewState {
  final String error;

  const ReviewFailed(this.error);

  @override
  List<Object> get props => [error];
}

final class ReviewSuccess extends ReviewState {
  final ResultReview data;

  const ReviewSuccess(this.data);

  @override
  List<Object> get props => [data];
}
