import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reels_app/utils/constants/app_gaps.dart';

import '../../../domain/models/response/reel_model.dart';
import '../provider/reel_like_provider.dart';
import '../provider/reels_provider.dart';

class ReelOverlay extends StatelessWidget {

  final ReelModel reel;

  const ReelOverlay({
    super.key,
    required this.reel,
  });

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 20,
        ),
        child: Row(
          crossAxisAlignment:
          CrossAxisAlignment.end,
          children: [

            /// LEFT CONTENT
            Expanded(
              child: Column(
                mainAxisAlignment:
                MainAxisAlignment.end,

                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [
                  Row(
                    children: [
                      Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),

                        child: const Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),

                      const SizedBox(width: 8),

                      Text(
                        reel.username
                            .trim()
                            .isEmpty
                            ? '@unknown'
                            : '@${reel.username}',

                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight:
                          FontWeight.w700,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  /// CAPTION
                  reel.caption.trim().isEmpty

                      ? const SizedBox.shrink()

                      : Text(
                    reel.caption,

                    style:
                    const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      height: 1.4,
                    ),

                    maxLines: 3,

                    overflow:
                    TextOverflow
                        .ellipsis,
                  ),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      const Icon(
                        Icons.music_note,
                        color: Colors.white,
                        size: 16,
                      ),
                      AppGaps.w(context, 6),
                      const Expanded(
                        child: Text(
                          'Original Audio',

                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                          ),

                          overflow:
                          TextOverflow
                              .ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            AppGaps.w(context, 14),
            Column(
              mainAxisAlignment:
              MainAxisAlignment.end,
              children: [

                _LikeButton(
                  reel: reel,
                ),

                const SizedBox(height: 18),

                _ActionButton(
                  icon: Icons.chat_outlined,
                  label: '245',

                  onTap: () {

                    showModalBottomSheet(
                      context: context,

                      backgroundColor:
                      Colors.black,

                      builder: (_) {

                        return const SizedBox(
                          height: 400,

                          child: Center(
                            child: Text(
                              'Comments Coming Soon',

                              style: TextStyle(
                                color:
                                Colors.white,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),

                const SizedBox(height: 18),

                _ActionButton(
                  icon: Icons.send_rounded,
                  label: 'Share',
                  onTap: () {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Share Clicked',
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _LikeButton extends ConsumerWidget {

  final ReelModel reel;

  const _LikeButton({
    required this.reel,
  });

  @override
  Widget build(
      BuildContext context,
      WidgetRef ref,
      ) {

    final isLiked =
    ref.watch(
      reelLikeProvider(reel.id),
    );

    return GestureDetector(

      onTap: () async {

        ref
            .read(
          reelLikeProvider(reel.id)
              .notifier,
        )
            .toggleLike();

        final updatedLikes =
        isLiked
            ? reel.likes - 1
            : reel.likes + 1;

        await ref
            .read(
          reelsProvider.notifier,
        )
            .updateLikes(
          reelId: reel.id,
          likes: updatedLikes,
        );
      },

      child: Column(
        children: [

          AnimatedSwitcher(
            duration:
            const Duration(
              milliseconds: 250,
            ),

            child: Icon(
              isLiked
                  ? Icons.favorite
                  :
              Icons.favorite_border,

              key: ValueKey(
                isLiked,
              ),

              color: isLiked
                  ? Colors.red
                  : Colors.white,

              size: 32,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            reel.likes.toString(),

            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight:
              FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {

  final IconData icon;
  final String label;
  final Color iconColor;
  final VoidCallback? onTap;

  const _ActionButton({
    super.key,
    required this.icon,
    required this.label,
    this.iconColor = Colors.white,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(

      onTap: onTap,

      child: Column(
        children: [

          Icon(
            icon,
            color: iconColor,
            size: 32,
          ),

          const SizedBox(height: 6),

          Text(
            label,

            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight:
              FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}