import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_assignment/feature/top_story/presentation/bloc/story_bloc.dart';
import 'package:news_assignment/feature/top_story/presentation/bloc/story_state.dart';

class StoryDetailPage extends StatelessWidget {
  const StoryDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App data'),
      ),
      body: BlocBuilder<StoryBloc, StoryState>(
        builder: (context, state) {
          if (state is StoryLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is StoryDetailLoaded) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.data.length,
              itemBuilder: (ctx, index) {
                  return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("by: ${state.data[index].by}"),
                  Text("descendants: ${state.data[index].descendants}"),
                ],
              ),
            );
              });
          
          }
          return const SizedBox();
        },
      ),
    );
  }
}
