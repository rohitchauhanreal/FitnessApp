import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoList extends StatelessWidget {
  final List<String> videoIds = [
    'CjYHKWwHJlk',
    'ZIECTD0ju9k',
    'CfV1G8boJaQ',
    'CjYHKWwHJlk',
  ];

  VideoList({super.key});

  final List<String> videoTitles = [
    'Warm Up',
    'Shoulder Workout',
    'Biceps Workout',
    'Warm Up - 2',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: const Color(0xFFE5BCA3),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(20), // Add padding of 20 around the text
              child: Text(
                "Today's Task",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: videoIds.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.slow_motion_video),
                  title: Text(videoTitles[index]),
                  onTap: () {
                    _openVideoPlayer(context, videoIds[index]);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _openVideoPlayer(BuildContext context, String videoId) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
            ),
            body: Center(
              child: YoutubePlayer(
                controller: YoutubePlayerController(
                  initialVideoId: videoId,
                  flags: const YoutubePlayerFlags(
                    autoPlay: true,
                    mute: false,
                  ),
                ),
                showVideoProgressIndicator: true,
                onReady: () {
                  // Video is ready to play.
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class AnotherVideoList extends StatelessWidget {
  final List<String> videoIds = [
    'CjYHKWwHJlk',
    'G18kehKXlRM',
    'LFRLrjNu_lc',
    'CjYHKWwHJlk',
  ];
  AnotherVideoList({super.key});

  final List<String> videoTitles = [
    'Warm Up',
    'Legs Workout',
    'Triceps Workout',
    'Warm Up - 2',
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: const Color(0xFF72B3D9),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(20), // Add padding of 20 around the text
              child: Text(
                "Upcoming Task",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: videoIds.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.slow_motion_video),
                  title: Text(videoTitles[index]),
                  onTap: () {
                    _openVideoPlayer(context, videoIds[index]);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _openVideoPlayer(BuildContext context, String videoId) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
            ),
            body: Center(
              child: YoutubePlayer(
                controller: YoutubePlayerController(
                  initialVideoId: videoId,
                  flags: const YoutubePlayerFlags(
                    autoPlay: true,
                    mute: false,
                  ),
                ),
                showVideoProgressIndicator: true,
                onReady: () {
                  // Video is ready to play.
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

