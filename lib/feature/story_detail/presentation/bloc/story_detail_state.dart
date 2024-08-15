part of 'story_detail_bloc.dart';

@immutable
sealed class StoryDetailState {}

final class StoryDetailInitial extends StoryDetailState {}

final class StoryDetailLoading extends StoryDetailState {}

final class StoryDetailLoaded extends StoryDetailState {
  final StoryDetailModel data;
  StoryDetailLoaded(this.data);
}

final class StoryDetailError extends StoryDetailState {
  final String error;
  StoryDetailError(this.error);
}
