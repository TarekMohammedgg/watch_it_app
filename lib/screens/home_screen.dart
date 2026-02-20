import 'package:flutter/material.dart';
import 'package:watch_it_app/core/ids.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Watch It App",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Icon(Icons.search),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Icon(Icons.notifications),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: ids.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                YoutubePlayer(
                  controller: YoutubePlayerController(
                    flags: YoutubePlayerFlags(autoPlay: false, mute: false),
                    initialVideoId: ids[index]['id'],
                  ),
                ),
                Text(
                  ids[index]['title'],
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
