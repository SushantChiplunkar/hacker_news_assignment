import 'dart:convert';

import 'package:news_assignment/feature/story_detail/data/model/story_detail_model.dart';
import 'package:http/http.dart' as http;

class StoryDetailService {
  Future<StoryDetailModel> fetchStoryDetailData(String storyId) async {
    try {
      final reseponse = await http.get(Uri.parse(
          'https://hacker-news.firebaseio.com/v0/item/$storyId.json?print=pretty'));

      if (reseponse.statusCode == 200) {
        final jsonResponse = json.decode(reseponse.body);
        return StoryDetailModel.fromJson(jsonResponse);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
