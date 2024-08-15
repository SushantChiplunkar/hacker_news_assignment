import 'package:news_assignment/feature/top_story/data/models/story_model.dart';
import 'package:news_assignment/feature/top_story/data/services/story_service.dart';

class StoryRepository {
  final StoryService _storyService;
  StoryRepository(this._storyService);

  Future<List<String>> fetchStory() async {
    try {
      final storyData = await _storyService.storyService();
      return storyData;
    } catch (e) {
      throw (e);
    }
  }
}
