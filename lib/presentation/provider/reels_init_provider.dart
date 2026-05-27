import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'reels_provider.dart';

final reelsInitProvider = Provider<void>((ref) {
  Future.microtask(() {
    ref.read(reelsProvider.notifier)
        .fetchReels();
  });
});