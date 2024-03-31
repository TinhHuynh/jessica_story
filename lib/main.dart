import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';


import 'di/injections.dart';
import 'features/home/presentation/bloc/home_bloc.dart';
import 'features/home/presentation/ui/home_screen.dart';
import 'features/in_video_content/presentation/ui/detail_you_tube_video_screen.dart';
import 'resource/constant/named_routes.dart';
import 'shared_libraries/common/utils/arguments/detail_you_tube_video_argument.dart';
import 'shared_libraries/dependencies/get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Injections().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YouTube API Example',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: NamedRoutes.homeScreen,
      routes: {
        NamedRoutes.homeScreen: (context) => BlocProvider(
              create: (context) => HomeBloc(
                getVideoUseCase: sl(),
              ),
              child: const HomeScreen(),
            ),
        NamedRoutes.detailYouTubeVideoScreen: (context) =>
            DetailYouTubeVideoScreen(
              argument: ModalRoute.of(context)!.settings.arguments
                  as DetailYouTubeVideoArgument,
            ),
      },
    );
  }
}
