import 'package:flut_cinematic/lib.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<Override> overrides(Environment env) => [
      Providers.enviroment.overrideWithValue(env),
    ];
