import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_assignment/feature/home/home_page.dart';
import 'package:news_assignment/feature/story_detail/presentation/bloc/story_detail_bloc.dart';
import 'package:news_assignment/feature/top_story/presentation/bloc/story_bloc.dart';
import 'package:news_assignment/init_dependecies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<StoryBloc>(
          create: (_) => serviceLocator<StoryBloc>(),
        ),
        BlocProvider<StoryDetailBloc>(
          create: (_) => serviceLocator<StoryDetailBloc>(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true),
      home: const HomePage(),
    );
  }
}
