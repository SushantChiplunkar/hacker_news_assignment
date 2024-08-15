import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_assignment/feature/story_detail/presentation/page/story_detail_page.dart';
import 'package:news_assignment/feature/top_story/presentation/bloc/story_bloc.dart';
import 'package:news_assignment/feature/top_story/presentation/bloc/story_events.dart';
import 'package:news_assignment/feature/top_story/presentation/page/top_story_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Stories',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.deepPurple,
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    context.read<StoryBloc>().add(StoryFetchEvent());

                    // nevigate
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const  StoryDetailPage()),
                    );
                  },
                  child: const Text('Top Stories')),
              const SizedBox(height: 40),
              ElevatedButton(
                  onPressed: () {}, child: const Text('Best Stories')),
              const SizedBox(height: 40),
              ElevatedButton(
                  onPressed: () {}, child: const Text('News Stories')),
            ],
          ),
        )
        // BlocBuilder<StoryBloc, StoryState>(
        //   builder: (context, state) {
        //     if (state is StoryLoadingState) {
        //       return Center(child: CircularProgressIndicator());
        //     } else if (state is StoryLoadedState) {
        //       return ListView.builder(
        //         itemCount: state.data.length,
        //         itemBuilder: (context, index) {
        //           return ListTile(
        //             title: Text(state.data[index]),
        //           );
        //         },
        //       );
        //     }

        //     return SizedBox();
        //   },
        // ),
        );
  }
}
