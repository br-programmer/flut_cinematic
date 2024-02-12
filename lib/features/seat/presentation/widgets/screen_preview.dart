import 'package:flut_cinematic_ui/flut_cinematic_ui.dart';
import 'package:flutter/material.dart';

class ScreenPreview extends StatelessWidget {
  const ScreenPreview({super.key});

  @override
  Widget build(BuildContext context) {
    const image =
        'https://image.tmdb.org/t/p/w780//4MCKNAc6AbWjEsM2h9Xc29owo4z.jpg';
    return ClipPath(
      clipper: _MyClipper(),
      child: const AspectRatio(
        aspectRatio: 6,
        child: FlutCinematicImage(imageUrl: image),
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
