import 'package:flut_cinematic/features/features.dart';
import 'package:flut_cinematic/i18n/translations.g.dart';
import 'package:flut_cinematic_ui/flut_cinematic_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PurchaseScreen extends HookConsumerWidget {
  const PurchaseScreen._();

  static Widget builder(BuildContext _, GoRouterState __) {
    return const PurchaseScreen._();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FlutCinematicBaseScreen(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          gap32,
          Text(
            texts.misc.dubbedStandar,
            style: context.textTheme.bodyLarge?.copyWith(
              color: Palette.white.withOpacity(.8),
            ),
            textAlign: TextAlign.center,
          ),
          gap2,
          Padding(
            padding: edgeInsetsH30,
            child: Text(
              ref.read(ticketProvider).movieName!,
              style: context.textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
          ),
          gap32,
          const QrView(),
          gap12,
          Text(
            texts.purchase.presentQr,
            style: context.textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          gap32,
          const TicketDetail(),
        ],
      ),
      bottomNavigationBar: const PurchaseOk(),
    );
  }
}
