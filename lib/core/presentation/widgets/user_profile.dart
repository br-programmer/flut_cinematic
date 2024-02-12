import 'package:flut_cinematic/lib.dart';
import 'package:flut_cinematic_ui/flut_cinematic_ui.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserProfile extends HookConsumerWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final url = switch (ref.watch(authProvider)) {
      Authenticated(user: final user) => user.photoURL,
      _ => null,
    };
    return CircleAvatar(
      radius: 11,
      backgroundColor: Palette.grey,
      child: FlutCinematicImage(
        borderRadius: borderRadius12,
        imageUrl: url,
      ),
    );
  }
}
