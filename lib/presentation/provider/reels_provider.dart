import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/datasource/remote/firebase_service.dart';
import '../../../data/repositories/reels_repository_impl.dart';
import '../../../domain/repositories/reels_repository.dart';
import 'reels_state.dart';

final firestoreServiceProvider = Provider<FirestoreService>(
      (ref) => FirestoreService(
    FirebaseFirestore.instance,
  ),
);

final reelsRepositoryProvider = Provider<ReelsRepository>(
      (ref) => ReelsRepositoryImpl(
    ref.read(firestoreServiceProvider),
  ),
);

final reelsProvider =
NotifierProvider<ReelsNotifier, ReelsState>(
  ReelsNotifier.new,
);

class ReelsNotifier extends Notifier<ReelsState> {

  late final ReelsRepository repository;

  @override
  ReelsState build() {
    repository = ref.read(reelsRepositoryProvider);

    return ReelsState.initial();
  }

  Future<void> fetchReels() async {
    try {
      state = state.copyWith(
        isLoading: true,
        error: null,
      );

      final reels = await repository.fetchReels();

      state = state.copyWith(
        isLoading: false,
        reels: reels,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }
  Future<void> updateLikes({
    required String reelId,
    required int likes,
  }) async {

    try {

      await repository.updateLikes(
        reelId: reelId,
        likes: likes,
      );

      final updatedReels =
      state.reels.map((reel) {

        if (reel.id == reelId) {

          return reel.copyWith(
            likes: likes,
          );
        }

        return reel;
      }).toList();

      state = state.copyWith(
        reels: updatedReels,
      );

    } catch (e) {

      print(e);
    }
  }
}