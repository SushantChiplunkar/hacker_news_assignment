import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_assignment/feature/story_detail/data/model/story_detail_model.dart';
import 'package:news_assignment/feature/story_detail/data/repository/story_detail_repository.dart';

part 'story_detail_event.dart';
part 'story_detail_state.dart';

class StoryDetailBloc extends Bloc<StoryDetailEvent, StoryDetailState> {
  final StoryDetailRepositiry _storyDetailRepositiry;

  StoryDetailBloc({required StoryDetailRepositiry storyDetailRepositiry})
      : _storyDetailRepositiry = storyDetailRepositiry,
        super(StoryDetailInitial()) {
    // on<StoryDetailFetchEvent>(_onStoryDetailFetchEvent);
  }

  // _onStoryDetailFetchEvent(
  //     StoryDetailFetchEvent event, Emitter<StoryDetailState> emit) async {
  //   try {
  //     emit(StoryDetailLoading());
  //     final data = await _storyDetailRepositiry.getStoryDetail(event.id);
  //     print('data printed in bloc : ${data}');
  //     emit(StoryDetailLoaded(data));
  //     // emit(StoryDetailLoading());
  //   } catch (e) {
  //     emit(StoryDetailError(e.toString()));
  //   }
  // }
}


//  for(int item in data.){
//         StoryModel story = await _newsRepository.fetchNews(item);
//         if(story!=null){
//           finalStories.add(story);
//         }
//       }