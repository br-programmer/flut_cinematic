import 'package:flut_cinematic/lib.dart';
import 'package:flut_cinematic_ui/flut_cinematic_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FlutCinematic extends HookConsumerWidget {
  const FlutCinematic({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return FlutCinematicCloseKeyboard(
      app: MaterialApp.router(
        routeInformationParser: router.routeInformationParser,
        routerDelegate: router.routerDelegate,
        debugShowCheckedModeBanner: false,
        routeInformationProvider: router.routeInformationProvider,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        title: 'Flut Cinematic',
        themeMode: ThemeMode.dark,
        theme: FlutCinematicTheme.light,
        darkTheme: FlutCinematicTheme.dark,
        builder: (context, child) {
          SystemChrome.setSystemUIOverlayStyle(
            SystemUiOverlayStyle(
              statusBarBrightness: context.theme.brightness,
            ),
          );
          return child!;
        },
      ),
    );
  }
}
