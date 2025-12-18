import 'package:architecture_bloc/features/posts/domain/entities/post_entity.dart';

sealed class PostState {
  PostState();
}

class PostInitialState extends PostState {
  PostInitialState();
}

class PostLoading extends PostState {
  PostLoading();
}

class LoadedPosts extends PostState {
  final List<PostEntity> posts;

  LoadedPosts({required this.posts});
}

class PostError extends PostState {
  final String message;
  PostError(this.message);
}
