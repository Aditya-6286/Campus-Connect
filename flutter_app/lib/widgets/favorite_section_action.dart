import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/campus_state.dart';

class FavoriteSectionAction extends StatelessWidget {
  const FavoriteSectionAction({super.key, required this.section});

  final String section;

  @override
  Widget build(BuildContext context) {
    return Consumer<CampusState>(
      builder: (context, campusState, child) {
        final isFavorite = campusState.isFavorite(section);
        return IconButton(
          tooltip: isFavorite ? 'Remove saved section' : 'Save section',
          onPressed: () => campusState.toggleFavorite(section),
          icon: AnimatedSwitcher(
            duration: const Duration(milliseconds: 220),
            transitionBuilder: (child, animation) => FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.08, 0),
                  end: Offset.zero,
                ).animate(animation),
                child: ScaleTransition(scale: animation, child: child),
              ),
            ),
            child: Icon(
              isFavorite ? Icons.bookmark : Icons.bookmark_border,
              key: ValueKey<bool>(isFavorite),
            ),
          ),
        );
      },
    );
  }
}
