import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/router/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/theme/dark.dart';
import 'core/theme/light.dart';
import 'presentation/screens/home/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(
    ProviderScope(
      child: MyApp(savedThemeMode: savedThemeMode),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;
  const MyApp({
    Key? key,
    this.savedThemeMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      dark: darkTheme(),
      light: lightTheme(),
      initial: savedThemeMode ?? AdaptiveThemeMode.light,
      builder: (light, dark) => MaterialApp(
        routes: Routes.getRoute(),
        title: 'NF-e Reader',
        theme: light,
        darkTheme: dark,
        home: const HomePage(),
      ),
    );
  }
}
