import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/models/response/reel_model.dart';
import 'current_reel_index_provider.dart';
import 'video_controller_provider.dart';

final reelsPreloadProvider =
Provider.family<void, List<ReelModel>>((
    ref,
    reels,
    ) {

  ref.listen<int>(
    currentReelIndexProvider,
        (previous, currentIndex) {

      for (
      int i = currentIndex + 1;
      i <= currentIndex + 3;
      i++
      ) {

        if (i < reels.length) {
          final nextVideoUrl =
              reels[i].videoUrl;
          ref.read(
            videoPlayerProvider(
              nextVideoUrl,
            ),
          );
        }
      }
    },
  );
});