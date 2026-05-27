import 'package:flutter/material.dart';
import 'package:reels_app/presentation/widget/reels_overlay.dart';
import 'package:reels_app/presentation/widget/reels_video_player.dart';
import '../../../domain/models/response/reel_model.dart';

class ReelItem extends StatelessWidget {

  final ReelModel reel;
  final int index;

  const ReelItem({
    super.key,
    required this.reel,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {

    return Stack(
      fit: StackFit.expand,

      children: [

        ReelVideoPlayer(
          videoUrl: reel.videoUrl,
          index: index,
        ),

        ReelOverlay(
          reel: reel,
        ),
      ],
    );
  }
}