import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'reels_provider.dart';
import 'video_controller_provider.dart';

final splashPreloadProvider = FutureProvider<void>((ref) async {
  final reelsState = ref.read(reelsProvider);

  final reels = reelsState.reels;

  if (reels.isEmpty) {
    return;
  }
  for (int i = 0; i < reels.length && i < 2; i++) {
    final videoUrl = reels[i].videoUrl;

    try {
      await ref.read(videoPlayerProvider(videoUrl).future);

      print('SPLASH PRELOADED: $videoUrl');
    } catch (e) {
      print(e);
    }
  }
});
