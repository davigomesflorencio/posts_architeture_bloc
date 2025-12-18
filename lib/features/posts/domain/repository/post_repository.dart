import 'package:architecture_bloc/core/errors/failure.dart';
import 'package:architecture_bloc/features/posts/domain/entities/post_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class PostRepository {
  Future<Either<Failure, List<PostEntity>>> getAllPosts();
  Future createPost({required String title, required String body});
}
