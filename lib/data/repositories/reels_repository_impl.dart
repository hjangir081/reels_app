import '../../domain/models/response/reel_model.dart';
import '../../domain/repositories/reels_repository.dart';
import '../datasource/remote/firebase_service.dart';

class ReelsRepositoryImpl implements ReelsRepository {
  final FirestoreService firestoreService;

  const ReelsRepositoryImpl(this.firestoreService);

  @override
  Future<List<ReelModel>> fetchReels() async {

    try {

      final response =
      await firestoreService.fetchReels();

      return response.docs
          .map((doc) {

        try {

          return ReelModel.fromJson(
            doc.data(),
            doc.id,
          );

        } catch (e) {

          print(
            'INVALID REEL: ${doc.id}',
          );

          return null;
        }

      })
          .whereType<ReelModel>()
          .toList();

    } catch (e) {

      throw Exception(
        e.toString(),
      );
    }
  }

  @override
  Future<void> updateLikes({
    required String reelId,
    required int likes,
  }) async {

    await firestoreService.firestore
        .collection('reels')
        .doc(reelId)
        .update({
      'likes': likes,
    });
  }
}