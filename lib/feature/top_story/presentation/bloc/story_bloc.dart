import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_assignment/feature/story_detail/data/model/story_detail_model.dart';
import 'package:news_assignment/feature/story_detail/data/repository/story_detail_repository.dart';
import 'package:news_assignment/feature/top_story/data/repositories/story_repository.dart';
import 'package:news_assignment/feature/top_story/presentation/bloc/story_events.dart';
import 'package:news_assignment/feature/top_story/presentation/bloc/story_state.dart';

class StoryBloc extends Bloc<StoryEvent, StoryState> {
  final StoryRepository _storyRepository;
  final StoryDetailRepositiry _storyDetailRepositiry;
  final List<StoryDetailModel> storyDetailModel;
  StoryBloc(
     {
    required StoryRepository storyRepository,
    required StoryDetailRepositiry storyDetailRepositiry,
  })  : _storyRepository = storyRepository,
        _storyDetailRepositiry = storyDetailRepositiry,
         storyDetailModel = [], 
        super(StoryInitialState()) {
    on<StoryFetchEvent>(_onStoryFetchEvent);
  }

  _onStoryFetchEvent(StoryFetchEvent event, Emitter<StoryState> emit) async {
    try {
      emit(StoryLoadingState());
      final data = await _storyRepository.fetchStory();

      for (int i = 0; i < data.length; i++) {
        // await add(StoryDetailFetchEvent(data[i]));
        await _handleStoryDetailFetch(data[i], emit);
      }
      // emit(StoryLoadedState(data));
      emit(StoryDetailLoaded(storyDetailModel));
    } catch (e) {
      emit(StoryFailerState(e.toString()));
    }
  }

  Future<void> _handleStoryDetailFetch(
      String id, Emitter<StoryState> emit) async {
    try {
      final data = await _storyDetailRepositiry.getStoryDetail(id);
      print('data printed in bloc : $data');
      storyDetailModel.add(data);
      // emit(StoryDetailLoaded(data));  // Emit state for each detail fetch if needed
    } catch (e) {
      emit(StoryDetailError(e.toString()));
    }

    // _onStoryDetailFetchEvent(
    //     StoryDetailFetchEvent event, Emitter<StoryState> emit) async {
    //   try {
    //     // emit(StoryDetailLoading());
    //     final data = await _storyDetailRepositiry.getStoryDetail(event.id);
    //     print('data printed in bloc : ${data}');
    //     // emit(StoryDetailLoaded(data));
    //     // emit(StoryDetailLoading());
    //   } catch (e) {
    //     emit(StoryDetailError(e.toString()));
    //   }
  }
}
