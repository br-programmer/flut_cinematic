import 'package:flut_cinematic_domain/flut_cinematic_domain.dart';

extension VideoX on Video {
  Uri get trailer => Uri.https('youtu.be', key);

  bool get youtube => site == 'YouTube';
}
