import 'package:flut_cinematic/features/features.dart';
import 'package:flut_cinematic_ui/flut_cinematic_ui.dart';
import 'package:flutter/material.dart';

class SeatWidget extends StatelessWidget {
  const SeatWidget({
    super.key,
    required this.seatStatus,
    required this.onPressed,
  });
  final SeatStatus seatStatus;
  final ValueChanged<SeatStatus> onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: edgeInsetsL14.add(edgeInsetsB4),
      child: FlutCinematicIconButton(
        iconData: FlutCinematicIcons.seat,
        color: seatStatus.color,
        onPressed:
            seatStatus.enable ? () => onPressed(seatStatus.status) : () {},
      ),
    );
  }
}
