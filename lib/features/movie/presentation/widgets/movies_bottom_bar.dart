import 'package:flut_cinematic/core/core.dart';
import 'package:flut_cinematic/features/features.dart';
import 'package:flut_cinematic/i18n/translations.g.dart';
import 'package:flut_cinematic_common/flut_cinematic_common.dart';
import 'package:flut_cinematic_ui/flut_cinematic_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MoviesBottomBar extends StatelessWidget {
  const MoviesBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomBarTexts = {
      MoviesBottomBarStatus.movies: texts.movie.movies,
      MoviesBottomBarStatus.candyStore: texts.movie.candyStore,
      MoviesBottomBarStatus.myProfile: texts.movie.myProfile,
    };
    final botton = android ? edgeInsetsB10 : edgeInsetsZero;
    return SafeArea(
      child: Padding(
        padding: edgeInsetsT16.add(botton),
        child: Row(
          children: MoviesBottomBarStatus.values.mapList(
            (element) => _MoviesBottomBarItem(
              status: element,
              text: bottomBarTexts[element]!,
            ),
          ),
        ),
      ),
    );
  }
}

class _MoviesBottomBarItem extends HookConsumerWidget {
  const _MoviesBottomBarItem({
    required this.status,
    required this.text,
  });
  final MoviesBottomBarStatus status;
  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final icon = status.icon;
    final child = status.child;
    final enable = ref.watch(StateNotifiers.bottonBar) == status;
    final authState = ref.watch(authProvider);
    final color = enable ? Palette.red : Palette.white.withOpacity(.6);
    return Expanded(
      child: InkWell(
        onTap: switch (authState) {
          Unauthenticated() when status.profile => () => context.pushNamed(
                Routes.auth.name,
              ),
          _ => () {
              ref.watch(StateNotifiers.bottonBar.notifier).change(status);
            }
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              FlutCinematicIcon(icon: icon, color: color)
            else
              CircleAvatar(
                backgroundColor: color,
                radius: 12,
                child: child,
              ),
            gap6,
            Text(
              text,
              style: context.textTheme.titleSmall?.copyWith(
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
