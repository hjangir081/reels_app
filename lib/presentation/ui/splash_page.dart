import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reels_app/utils/constants/app_gaps.dart';
import '../../../config/router/app_router.gr.dart';
import '../provider/reels_provider.dart';
import '../provider/splash_preload_provider.dart';

@RoutePage()
class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref,) {
    ref.listen(
      reelsProvider,
          (_, state) async {
        if (
        !state.isLoading && state.reels.isNotEmpty
        ) {
          /// PRELOAD VIDEOS
          await ref.read(
            splashPreloadProvider.future,
          );

          /// NAVIGATE
          Future.delayed(
            const Duration(seconds: 2),
                () {

              context.router.replace(
                const ReelsRoute(),
              );
            },
          );
        }
      },
    );

    Future.microtask(() {
      ref.read(reelsProvider.notifier).fetchReels();
    });
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment:
          MainAxisAlignment.center,
          children: [
            const Text(
              'Reels App',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight:
                FontWeight.bold,
              ),
            ),
           AppGaps.h(context, 12),
            const CircularProgressIndicator(
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}