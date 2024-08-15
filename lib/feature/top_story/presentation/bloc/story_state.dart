import 'package:news_assignment/feature/story_detail/data/model/story_detail_model.dart';

abstract class StoryState {}

final class StoryInitialState extends StoryState {}

final class StoryLoadingState extends StoryState {}

final class StoryLoadedState extends StoryState {
  final List<String> data;
  StoryLoadedState(this.data);
}

final class StoryFailerState extends StoryState {
  final String error;
  StoryFailerState(this.error);
}

// final class StoryDetailLoading extends StoryState {}

final class StoryDetailLoaded extends StoryState {
  final List<StoryDetailModel> data;
  StoryDetailLoaded(this.data);
}

final class StoryDetailError extends StoryState {
  final String error;
  StoryDetailError(this.error);
}
