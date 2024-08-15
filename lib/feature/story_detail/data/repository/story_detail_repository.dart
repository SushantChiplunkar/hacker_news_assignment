import 'package:news_assignment/feature/story_detail/data/model/story_detail_model.dart';
import 'package:news_assignment/feature/story_detail/data/service/story_detail_service.dart';

class StoryDetailRepositiry {
  final StoryDetailService storyDetailService;
  StoryDetailRepositiry(this.storyDetailService);

  Future<StoryDetailModel> getStoryDetail(String storyId) async {
    try {
      return await storyDetailService.fetchStoryDetailData(storyId);
    } on Exception catch (e) {
      throw Exception(e);      
    }
  }
}
