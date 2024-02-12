import 'package:flut_cinematic/i18n/translations.g.dart';
import 'package:flut_cinematic/lib.dart';
import 'package:flut_cinematic_ui/flut_cinematic_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PurchaseOk extends StatelessWidget {
  const PurchaseOk({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: context.theme.scaffoldBackgroundColor),
      child: Padding(
        padding: edgeInsets20,
        child: SafeArea(
          child: FlutCinematicPrimaryButton(
            text: texts.purchase.okGoIt,
            onPressed: () => context.goNamed(Routes.movies.name),
          ),
        ),
      ),
    );
  }
}
