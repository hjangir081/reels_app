import '../models/response/reel_model.dart';

abstract class ReelsRepository {
  Future<List<ReelModel>> fetchReels();
  Future<void> updateLikes({
    required String reelId,
    required int likes,
  });
}
