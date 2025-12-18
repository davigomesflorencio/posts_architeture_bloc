import 'package:architecture_bloc/core/injections/service_locator.dart';
import 'package:architecture_bloc/features/posts/presentation/cubit/post_cubit.dart';
import 'package:architecture_bloc/features/posts/presentation/screens/post_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  ServiceLocator serviceLocator = ServiceLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await serviceLocator.init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => slInstance<PostCubit>(instanceName: "postsCubit"),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BloC pattern architecture',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Posts(),
    );
  }
}
