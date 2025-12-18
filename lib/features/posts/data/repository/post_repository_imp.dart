import 'dart:developer';

import 'package:architecture_bloc/core/errors/failure.dart';
import 'package:architecture_bloc/features/posts/data/datasource/post_remote_data_source.dart';
import 'package:architecture_bloc/features/posts/data/models/post_model.dart';
import 'package:architecture_bloc/features/posts/domain/entities/post_entity.dart';
import 'package:architecture_bloc/features/posts/domain/repository/post_repository.dart';
import 'package:fpdart/fpdart.dart';

class PostRepositoryImp implements PostRepository {
  final PostRemoteDataSource postRemoteDataSource;
  PostRepositoryImp({required this.postRemoteDataSource});

  @override
  Future<Either<Failure, List<PostEntity>>> getAllPosts() async {
    try {
      final posts = await postRemoteDataSource.getPosts();
      log(posts.toString());
      final data = posts.map((post) => PostModel.fromMap(post)).toList();

      return Right(data);
    } on Failure catch (e) {
      log(e.message);
      return Left(Failure(message: e.message));
    } catch (e) {
      log(e.toString());
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future createPost({required String title, required String body}) {
    throw UnimplementedError();
  }
}
