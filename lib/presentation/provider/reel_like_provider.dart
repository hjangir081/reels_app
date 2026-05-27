import 'package:flutter_riverpod/legacy.dart';

final reelLikeProvider =
StateNotifierProvider.family<
    ReelLikeNotifier,
    bool,
    String>(
      (ref, reelId) {
    return ReelLikeNotifier();
  },
);

class ReelLikeNotifier
    extends StateNotifier<bool> {

  ReelLikeNotifier() : super(false);

  void toggleLike() {
    state = !state;
  }
}