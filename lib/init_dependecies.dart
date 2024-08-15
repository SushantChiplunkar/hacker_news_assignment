import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:news_assignment/feature/story_detail/data/repository/story_detail_repository.dart';
import 'package:news_assignment/feature/story_detail/data/service/story_detail_service.dart';
import 'package:news_assignment/feature/story_detail/presentation/bloc/story_detail_bloc.dart';
import 'package:news_assignment/feature/top_story/data/repositories/story_repository.dart';
import 'package:news_assignment/feature/top_story/data/services/story_service.dart';
import 'package:news_assignment/feature/top_story/presentation/bloc/story_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
// Register http.Client
  // serviceLocator.registerLazySingleton<http.Client>(() => http.Client());
  _initStory();
  _initStoryDetail();
}

void _initStory() {
  serviceLocator

    //services
    ..registerLazySingleton<StoryService>(() => StoryService())

    //repository
    ..registerFactory<StoryRepository>(() => StoryRepository(serviceLocator()))

    //bloc
    ..registerLazySingleton<StoryBloc>(() => StoryBloc(
    
          storyRepository: serviceLocator(),
          storyDetailRepositiry: serviceLocator(),
        ));
}

void _initStoryDetail() {
  serviceLocator

    //services
    ..registerLazySingleton<StoryDetailService>(() => StoryDetailService())

    //repository
    ..registerFactory<StoryDetailRepositiry>(
        () => StoryDetailRepositiry(serviceLocator()))

    //bloc
    ..registerLazySingleton<StoryDetailBloc>(
        () => StoryDetailBloc(storyDetailRepositiry: serviceLocator()));
}
