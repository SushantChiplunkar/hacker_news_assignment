part of 'story_detail_bloc.dart';

@immutable
sealed class StoryDetailEvent {}

final class StoryDetailFetchEvent extends StoryDetailEvent {
  final String id;
  StoryDetailFetchEvent(this.id);
}
