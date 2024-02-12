import 'package:flut_cinematic/features/features.dart';
import 'package:flut_cinematic_ui/flut_cinematic_ui.dart';
import 'package:flutter/material.dart';

enum SeatStatus {
  aviable(),
  notAviable(),
  selected(),
  empty(),
  other();

  String get text {
    switch (this) {
      case SeatStatus.aviable:
        return 'Avaible'.hardCode;
      case SeatStatus.notAviable:
        return 'Not aviable'.hardCode;
      case SeatStatus.selected:
        return 'Selected'.hardCode;
      case SeatStatus.empty:
      case SeatStatus.other:
        return '';
    }
  }

  Color get color {
    switch (this) {
      case SeatStatus.aviable:
        return Palette.white;
      case SeatStatus.notAviable:
        return Palette.white.withOpacity(.2);
      case SeatStatus.selected:
        return Palette.red;
      case SeatStatus.empty:
      case SeatStatus.other:
        return Palette.transparent;
    }
  }

  Widget child({
    required int index,
    required ValueChanged<SeatStatus> onPressed,
  }) {
    switch (this) {
      case SeatStatus.aviable:
      case SeatStatus.notAviable:
      case SeatStatus.selected:
        return SeatWidget(seatStatus: this, onPressed: onPressed);
      case SeatStatus.empty:
        return const SizedBox.square(dimension: 20);
      case SeatStatus.other:
        return LetterRowIndicator(index: index);
    }
  }

  bool get enable => this != SeatStatus.notAviable;

  SeatStatus get status {
    switch (this) {
      case SeatStatus.aviable:
        return SeatStatus.selected;
      case SeatStatus.selected:
        return SeatStatus.aviable;
      case SeatStatus.notAviable:
      case SeatStatus.empty:
      case SeatStatus.other:
        return this;
    }
  }
}
