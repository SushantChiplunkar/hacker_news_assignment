import 'dart:convert';

import 'package:news_assignment/core/utils/app_client.dart';
import 'package:news_assignment/feature/top_story/data/models/story_model.dart';
import 'package:http/http.dart' as http;

class StoryService {
  final List<String> topStories = [];
  Future<List<String>> storyService() async {
    try {
      final response = await http.get(Uri.parse(
          "https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty"));
      if (response.statusCode == 200) {
        final List<dynamic> responseData = jsonDecode(response.body);
        topStories.addAll(responseData.map((id) => id.toString()).toList());
        print(topStories);
        return topStories;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
