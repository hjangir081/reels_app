class ReelModel {
  final String id;
  final String videoUrl;
  final String username;
  final String caption;
  final int likes;

  const ReelModel({
    required this.id,
    required this.videoUrl,
    required this.username,
    required this.caption,
    required this.likes,
  });

  factory ReelModel.fromJson(
      Map<String, dynamic>? json,
      String id,
      ) {

    if (json == null) {
      throw Exception(
        'Invalid reel data',
      );
    }

    return ReelModel(
      id: id,

      videoUrl:
      (json['videoUrl'] ?? '')
          .toString(),

      username:
      (json['username'] ?? 'Unknown')
          .toString(),

      caption:
      (json['caption'] ?? '')
          .toString(),

      likes:
      json['likes'] is int
          ? json['likes']
          : 0,
    );
  }
  ReelModel copyWith({
    int? likes,
  }) {

    return ReelModel(
      id: id,
      videoUrl: videoUrl,
      username: username,
      caption: caption,
      likes: likes ?? this.likes,
    );
  }
}
