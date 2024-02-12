import 'package:flut_cinematic/core/core.dart';
import 'package:flut_cinematic_ui/flut_cinematic_ui.dart';
import 'package:flutter/material.dart';

enum MoviesBottomBarStatus {
  movies(icon: FlutCinematicIcons.movies),
  candyStore(icon: FlutCinematicIcons.popcorn),
  myProfile(child: UserProfile());

  const MoviesBottomBarStatus({this.icon, this.child});

  final IconData? icon;
  final Widget? child;

  bool get profile => this == MoviesBottomBarStatus.myProfile;
}
