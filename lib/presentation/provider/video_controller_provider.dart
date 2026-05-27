import 'package:cached_video_player_plus/cached_video_player_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final videoPlayerProvider = FutureProvider.family
    .autoDispose<CachedVideoPlayerPlus, String>((ref, videoUrl) async {
      final player = CachedVideoPlayerPlus.networkUrl(Uri.parse(videoUrl));

      await player.initialize();

      await player.controller.setLooping(true);

      ref.onDispose(() async {
        try {
          await player.controller.pause();

          await player.controller.dispose();

          print('DISPOSED: $videoUrl');
        } catch (e) {
          print(e);
        }
      });
      return player;
    });
