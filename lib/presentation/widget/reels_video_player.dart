import 'package:cached_video_player_plus/cached_video_player_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

import '../provider/current_reel_index_provider.dart';
import '../provider/video_controller_provider.dart';

class ReelVideoPlayer
    extends ConsumerWidget {

  final String videoUrl;
  final int index;

  const ReelVideoPlayer({
    super.key,
    required this.videoUrl,
    required this.index,
  });

  @override
  Widget build(
      BuildContext context,
      WidgetRef ref,
      ) {

    if (
    videoUrl.isEmpty ||
        !videoUrl.startsWith('http')
    ) {

      return const Center(
        child: Text(
          'Invalid Video URL',

          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }

    final playerAsync =
    ref.watch(
      videoPlayerProvider(videoUrl),
    );

    return playerAsync.when(

      data: (player) {
        final currentIndex =
        ref.watch(
          currentReelIndexProvider,
        );
        if (currentIndex == index) {
          if (
          !player.controller.value.isPlaying
          ) {

            player.controller.play();
          }
        } else {
          if (
          player.controller.value.isPlaying
          ) {

            player.controller.pause();
          }
        }
        ref.listen<int>(
          currentReelIndexProvider,
              (previous, current) {

            if (current == index) {

              if (
              !player.controller.value.isPlaying
              ) {

                player.controller.play();
              }

            } else {
              if (
              player.controller.value.isPlaying
              ) {

                player.controller.pause();
              }
            }
          },
        );
        if (
        !player.controller.value.isInitialized
        ) {

          return const Center(
            child:
            CircularProgressIndicator(),
          );
        }
        return SizedBox.expand(
          child: FittedBox(
            fit: BoxFit.cover,

            child: SizedBox(
              width:
              player.controller
                  .value
                  .size
                  .width,

              height:
              player.controller
                  .value
                  .size
                  .height,

              child: VideoPlayer(
                player.controller,
              ),
            ),
          ),
        );
      },

      loading: () => const Center(
        child:
        CircularProgressIndicator(color: Colors.white),
      ),

      error: (e, _) {

        print(e);

        return const Center(
          child: Column(
            mainAxisAlignment:
            MainAxisAlignment.center,

            children: [

              Icon(
                Icons.error_outline,
                color: Colors.white,
                size: 40,
              ),

              SizedBox(height: 12),

              Text(
                'Video Failed To Load',

                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}