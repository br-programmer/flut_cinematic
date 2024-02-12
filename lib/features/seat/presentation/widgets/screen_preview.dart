import 'package:flut_cinematic/lib.dart';
import 'package:flut_cinematic_domain/flut_cinematic_domain.dart';
import 'package:flut_cinematic_ui/flut_cinematic_ui.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ScreenPreview extends HookConsumerWidget {
  const ScreenPreview({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movie = ref.watch(movieProvider(this.movie));
    return ClipPath(
      clipper: _MyClipper(),
      child: AspectRatio(
        aspectRatio: 6,
        child: FlutCinematicImage(imageUrl: movie.backdrop),
      ),
    );
  }
}

class _MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.width)
      ..lineTo(size.width, size.height * .2)
      ..quadraticBezierTo(
        size.width / 2,
        -size.height * .2,
        0,
        size.height * .2,
      )
      ..close();
  }

  @override
  bool shouldReclip(_MyClipper _) => true;
}
