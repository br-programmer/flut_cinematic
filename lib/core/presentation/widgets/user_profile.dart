import 'package:flut_cinematic_ui/flut_cinematic_ui.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 11,
      backgroundColor: Palette.grey,
    );
  }
}
