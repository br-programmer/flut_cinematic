import 'package:url_launcher/url_launcher.dart';

class UrlLauncherService {
  const UrlLauncherService();

  Future<void> launch(Uri uri) async {
    if (await canLaunchUrl(uri)) {
      launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    }
  }
}
