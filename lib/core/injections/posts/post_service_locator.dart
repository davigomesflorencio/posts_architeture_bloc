import 'package:architecture_bloc/features/posts/data/datasource/post_remote_data_source.dart';
import 'package:architecture_bloc/features/posts/data/repository/post_repository_imp.dart';
import 'package:architecture_bloc/features/posts/domain/repository/post_repository.dart';
import 'package:architecture_bloc/features/posts/domain/usecase/get_post_usecase.dart';
import 'package:architecture_bloc/features/posts/presentation/cubit/post_cubit.dart';
import 'package:get_it/get_it.dart';

class PostServiceLocator {
  final GetIt sl;
  PostServiceLocator(this.sl);

  void init() {
    sl.registerSingleton<PostRemoteDataSource>(
      PostRemoteDataSource(),
      instanceName: "PostRemoteDataSource",
    );

    sl.registerSingleton<PostRepository>(
      PostRepositoryImp(
        postRemoteDataSource: sl(instanceName: "PostRemoteDataSource"),
      ),
      instanceName: "postRepositoryImplementation",
    );
    sl.registerSingleton<GetPostUsecase>(
      GetPostUsecase(
        repository: sl(instanceName: "postRepositoryImplementation"),
      ),
      instanceName: "getPostUsecase",
    );
    sl.registerSingleton<PostCubit>(
      PostCubit(getPostUsecase: sl(instanceName: "getPostUsecase")),
      instanceName: "postsCubit",
    );
  }
}
