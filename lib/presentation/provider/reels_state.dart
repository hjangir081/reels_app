import '../../../domain/models/response/reel_model.dart';

class ReelsState {
  final bool isLoading;
  final List<ReelModel> reels;
  final String? error;

  const ReelsState({
    required this.isLoading,
    required this.reels,
    required this.error,
  });

  factory ReelsState.initial() {
    return const ReelsState(
      isLoading: false,
      reels: [],
      error: null,
    );
  }

  ReelsState copyWith({
    bool? isLoading,
    List<ReelModel>? reels,
    String? error,
  }) {
    return ReelsState(
      isLoading: isLoading ?? this.isLoading,
      reels: reels ?? this.reels,
      error: error,
    );
  }
}