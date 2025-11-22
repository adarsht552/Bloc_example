import 'package:bloctest/bloc/EventsandStates/Bloc.dart';
import 'package:bloctest/bloc/EventsandStates/Event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApiDataPage extends StatefulWidget {
  const ApiDataPage({super.key});

  @override
  State<ApiDataPage> createState() => _ApiDataPageState();
}

class _ApiDataPageState extends State<ApiDataPage> {
  @override
  void initState() {
    super.initState();
    context.read<Postbloc>().add(LoadPosts());
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<Postbloc>();
    return Scaffold(
      appBar: AppBar(title: Text("Data")),
      body: BlocBuilder<Postbloc, PostSate>(
        builder: (context, state) {
          if (state is Postinitial || state is PostLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PostLoaded) {
            final post = state.posts;
            if (post.isEmpty) {
              return const Center(child: Text("No data fetched"));
            }
            return RefreshIndicator(
              child: ListView.separated(
                physics: AlwaysScrollableScrollPhysics(),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: post.length,
                itemBuilder: (context, index) {
                  final posts = post[index];
                  return ListTile(
                    title: Text(
                      posts.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(
                      posts.body,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    leading: CircleAvatar(child: Text(posts.id.toString())),
                  );
                },
              ),
              onRefresh: () async => bloc.add(Refreshpost()),
            );
          } else if (state is ErrorState) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text('Unknown state'));
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          bloc.add(LoadPosts());
        },
        icon: const Icon(Icons.download),
        label: const Text('Load Again'),
      ),
    );
  }
}
