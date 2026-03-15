class VideoModel {
  final int id;
  final String title;
  final String youtubeId;

  const VideoModel({
    required this.id,
    required this.title,
    required this.youtubeId,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      id: json['id'] as int,
      title: json['title'] as String,
      youtubeId: json['youtube_id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'youtube_id': youtubeId,
    };
  }
}
