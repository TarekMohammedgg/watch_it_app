import 'package:flutter/material.dart';
import 'routes.dart';
import '../../features/video_player/presentation/screens/video_player_screen.dart';
import '../widgets/main_nav_shell.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.main:
        return MaterialPageRoute(builder: (_) => const MainNavShell());
      case Routes.videoPlayer:
        final args = settings.arguments as Map<String, String>;
        return MaterialPageRoute(
          builder: (_) => VideoPlayerScreen(
            videoId: args['id']!,
            title: args['title']!,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text("No Route Found")),
          ),
        );
    }
  }
}
