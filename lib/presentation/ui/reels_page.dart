import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/current_reel_index_provider.dart';
import '../provider/reels_init_provider.dart';
import '../provider/reels_preload_provider.dart';
import '../provider/reels_provider.dart';
import '../widget/reels_item.dart';

@RoutePage()
class ReelsPage extends ConsumerWidget {
  const ReelsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(reelsInitProvider);
    final reelsState = ref.watch(reelsProvider);
    ref.watch(reelsPreloadProvider(reelsState.reels),);
    return Scaffold(
      backgroundColor: Colors.black,
      body: reelsState.isLoading
          ? const Center(
        child:
        CircularProgressIndicator(color: Colors.white),
      )
          : reelsState.error != null
          ? Center(
        child: Text(
          reelsState.error!,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      )
          : reelsState.reels.isEmpty
          ? const Center(
        child: Text(
          'No Reels Available',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      )
          : PageView.builder(
        allowImplicitScrolling: false,
        scrollDirection: Axis.vertical,
        itemCount: reelsState.reels.length,
        onPageChanged: (index) {
          ref.read(currentReelIndexProvider.notifier).state = index;
        },
        itemBuilder: (context, index) {
          final reel = reelsState.reels[index];
          return ReelItem(
            reel: reel,
            index: index,
          );
        },
      ),
    );
  }
}