import 'package:flutter/material.dart';
import 'package:watch_it_app/core/ids.dart';
import 'package:watch_it_app/screens/widgets/video_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Watch It App")),
      body: ListView.builder(
        itemCount: ids.length,
        itemBuilder: (context, index) {
          return VideoItem(
            videoId: ids[index]['id']!,
            title: ids[index]['title']!,
          );
        },
      ),
    );
  }
}
