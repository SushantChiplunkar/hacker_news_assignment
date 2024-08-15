import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_assignment/feature/story_detail/presentation/bloc/story_detail_bloc.dart';
import 'package:news_assignment/feature/story_detail/presentation/page/story_detail_page.dart';
import 'package:news_assignment/feature/top_story/presentation/bloc/story_bloc.dart';
import 'package:news_assignment/feature/top_story/presentation/bloc/story_state.dart';

class TopStoriesListPage extends StatelessWidget {
  TopStoriesListPage({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        // BlocListener<StoryDetailBloc, StoryDetailState>(
        //   listener: (context, state) {
        //     if (state is StoryDetailLoaded) {
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //             builder: (context) => const StoryDetailPage()),
        //       );
        //     } else if (state is StoryDetailError) {
        //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //         content: Text(state.error.toString()),
        //       ));
        //     }
        //   },
        // ),
      ],
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Top Stories',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.deepPurple,
        ),
        body: BlocBuilder<StoryBloc, StoryState>(
          builder: (context, state) {
            if (state is StoryLoadingState) {
              print('this is in loaded state');
              return const Center(child: CircularProgressIndicator());
            } else if (state is StoryLoadedState) {
              return ListView.builder(
                itemCount: state.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      context.read<StoryDetailBloc>().add(
                          StoryDetailFetchEvent(state.data[index].toString()));
                    },
                    title: Text(state.data[index]),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  );
                },
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
