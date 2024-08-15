abstract class StoryEvent {}

class StoryFetchEvent extends StoryEvent {}

final class StoryDetailFetchEvent extends StoryEvent {
  final String id;
  StoryDetailFetchEvent(this.id);
}