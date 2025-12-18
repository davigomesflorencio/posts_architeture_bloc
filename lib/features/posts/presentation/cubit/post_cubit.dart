import 'dart:developer';

import 'package:architecture_bloc/features/posts/presentation/cubit/post_state.dart';
import 'package:architecture_bloc/features/posts/domain/usecase/get_post_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostCubit extends Cubit<PostState> {
  GetPostUsecase getPostUsecase;

  PostCubit({required this.getPostUsecase}) : super(PostInitialState());

  Future<void> getPosts() async {
    emit(PostLoading());
    log("Carrregando");
    log(' Fetching posts...');
    final posts = await getPostUsecase();

    posts.fold(
      (err) => emit(PostError(err.message)),
      (posts) => emit(LoadedPosts(posts: posts)),
    );
  }
}
