import 'package:flut_cinematic/features/features.dart';
import 'package:flut_cinematic_ui/flut_cinematic_ui.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TicketDetail extends HookConsumerWidget {
  const TicketDetail({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ticketState = ref.watch(ticketProvider);
    final seats = ticketState.seats;
    final total = (seats.length * 5.6).money;
    return Padding(
      padding: edgeInsetsH20,
      child: CustomPaint(
        painter: const _DashDotPainter(),
        child: Padding(
          padding: edgeInsetsH20.add(edgeInsetsV16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Ticket details'.hardCode,
                    style: context.textTheme.headlineSmall,
                  ),
                  Text(
                    total,
                    style: context.textTheme.headlineSmall,
                  ),
                ],
              ),
              gap12,
              const FlutCinematicDivider(useHero: false),
              gap16,
              _TicketItems(
                titleA: 'Date'.hardCode,
                subTitleA: ticketState.date!.formatWithYear('en'),
                titleB: 'Time'.hardCode,
                subTitleB: ticketState.time!.myHour('en').toLowerCase(),
              ),
              gap16,
              _TicketItems(
                titleA: 'Room'.hardCode,
                subTitleA: '2'.hardCode,
                titleB: 'Seats'.hardCode,
                subTitleB: seats.join(', '),
              ),
              gap16,
              _TicketItems(
                titleA: 'Location'.hardCode,
                subTitleA: 'Starview Cinema'.hardCode,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TicketItems extends StatelessWidget {
  const _TicketItems({
    required this.titleA,
    required this.subTitleA,
    this.titleB,
    this.subTitleB,
  });
  final String titleA;
  final String subTitleA;
  final String? titleB;
  final String? subTitleB;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _TicketItem(
          title: titleA,
          subTitle: subTitleA,
        ),
        if (titleB != null)
          _TicketItem(
            title: titleB!,
            subTitle: subTitleB!,
          ),
      ],
    );
  }
}

class _TicketItem extends StatelessWidget {
  const _TicketItem({
    required this.title,
    required this.subTitle,
  });
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: context.textTheme.labelSmall?.copyWith(
              color: Palette.white.withOpacity(.6),
            ),
          ),
          Text(
            subTitle,
            style: context.textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}

class _DashDotPainter extends CustomPainter {
  const _DashDotPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 1
      ..color = Palette.white.withOpacity(.24)
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke;
    final path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, size.width, size.height),
          const Radius.circular(16),
        ),
      )
      ..close();
    canvas.drawPath(path, Paint()..color = Palette.dark);
    final draw = Path();
    for (final metric in path.computeMetrics()) {
      var start = 0.0;
      while (start < metric.length) {
        final end = start + 10;
        draw.addPath(metric.extractPath(start, end), Offset.zero);
        start = end + 4;
      }
    }
    draw.close();
    canvas.drawPath(draw, paint);
  }

  @override
  bool shouldRepaint(_DashDotPainter _) => false;
}
