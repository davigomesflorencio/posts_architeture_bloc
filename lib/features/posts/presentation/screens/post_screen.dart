import 'package:architecture_bloc/features/posts/presentation/cubit/post_cubit.dart';
import 'package:architecture_bloc/features/posts/presentation/cubit/post_state.dart';
import 'package:architecture_bloc/features/posts/presentation/widgets/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Posts extends StatefulWidget {
  const Posts({super.key});

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  @override
  void initState() {
    context.read<PostCubit>().getPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostCubit, PostState>(
      listener: (context, state) {
        if (state is PostError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Erro ao carregar posts: ${state.message}"), backgroundColor: Colors.red),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text('Posts')),
          body: Builder(
            builder: (_) {
              if (state is PostLoading) {
                return Center(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (state is LoadedPosts) {
                return RefreshIndicator(
                  onRefresh: () async {
                    context.read<PostCubit>().getPosts();
                  },
                  child: ListView.builder(
                    itemCount: state.posts.length,
                    itemBuilder: (_, index) {
                      return Post(
                        key: Key(state.posts[index].id.toString()),
                        title: state.posts[index].title,
                        body: state.posts[index].body,
                      );
                    },
                  ),
                );
              } else {
                return Column(
                  children: [
                    Text("Caso especial"),
                    Center(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: const CircularProgressIndicator(),
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        );
      },
    );
  }
}
