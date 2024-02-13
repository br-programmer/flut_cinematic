# Flut Cinematic

> Flut Cinematic is your perfect companion for exploring the fascinating world of cinema. With an intuitive interface and innovative features, Flut Cinematic offers you an unparalleled cinematic experience in the palm of your hand.

---

## Key Features:

- **Explore Movies:** Dive into a vast collection of movies spanning all genres. From timeless classics to the latest blockbuster releases, FlutCinematic has something for every cinephile.

- **Discover Details:** Get detailed information about each movie, including synopsis, cast, user and critic ratings, trailers, and more. Never miss any important details.

- **Advanced Internationalization System:** FlutCinematic utilizes an advanced internationalization (i18n) system that allows you to enjoy the app in multiple languages. Easily switch between English and Spanish for a fully tailored experience.

- **Authentication:** Utilize a secure authentication system that triggers authentication prompts specifically when a user initiates a purchase transaction. This ensures that authentication seamlessly integrates into the purchase process while remaining unobtrusive during other interactions with the application.

- **Trailer:** Users can access movie trailers.

- **Date and Time Selection:** Users can choose the date and time of their movie screening according to their convenience.

- **Seat Selection:** Users can select specific seats they wish to reserve for the movie screening.

- **Constant Updates:** Stay up-to-date with the latest news from the world of cinema, content updates, and new features added regularly to the app.

---
## Getting Started 🚀

> First, create the file `launch.json` in the `.vscode` folder following the example `launch.json.example`, and add the values of the `dart-define (Environment variables)` in the `toolArgs` parameter.

Now you must execute the following commands to obtain the packages and generate the necessary code:

```sh
flutter pub get
dart run build_runner build --delete-conflicting-outputs
dart run slang
cd packages
cd flut_cinematic_api_client
flutter pub get
dart run build_runner build --delete-conflicting-outputs
cd ..
cd flut_cinematic_common
flutter pub get
dart run build_runner build --delete-conflicting-outputs
cd ..
cd flut_cinematic_data
flutter pub get
cd .. 
cd flut_cinematic_domain
flutter pub get
dart run build_runner build --delete-conflicting-outputs
cd flut_cinematic_firebase
flutter pub get
cd ..
cd flut_cinematic_ui
flutter pub get
```

This project contains 3 flavors:

- development
- staging
- production

Can you add `Environment variables` for all flavors,

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
```

_\*Flut Cinematic works on iOS, Android._

---

## Working with Translations 🌐

This project relies on [slang](https://pub.dev/packages/slang) type-safe i18n solution using JSON files.

### Adding Strings

1. To add a new localizable strings, open the `myFeatureName.json` file at `lib/i18n/en/myFeatureName.json`.

```json
{
    "appName": "Flut Cinematic"
}
```

2. Then add a new key/value and description

```json
{
    "appName": "Flut Cinematic"
}
```

3. Use the new string

```dart
import 'package:flut_cinematic/i18n/translations.g.dart';

@override
Widget build(BuildContext context) {
  return Text(texts.misc.appName);
}
```

### Adding Supported Locales

Update the `CFBundleLocalizations` array in the `Info.plist` at `ios/Runner/Info.plist` to include the new locale.

```xml
    ...

    <key>CFBundleLocalizations</key>
	<array>
		<string>en</string>
		<string>es</string>
	</array>

    ...
```

### Adding Translations

1. For each supported locale, add a new Json file in `lib/i18n`.

```
├── i18n
│   ├── en
│   │   ├── misc.json
│   │   ├── myFeature.json
│   ├── es
│   │   ├── misc.json
│   │   ├── myFeature.json
```

2. Add the translated strings to each `.json` file:

> IMPORTANT: slang does not support \_ or - for file names. You must use camelcase. Example `myFeatureName.json`

`i18n/en/myFeatureName.json`

```json
{
    "appName": "Flut Cinematic",
    "movie": "Movie"
}
```

`i18n/es/myFeatureName.json`

```json
{
    "appName": "Flut Cinematic",
    "movie": "Película"
}
```

### Generating Translations

To use the latest translations changes, you will need to generate them:

```sh
dart run slang
```

