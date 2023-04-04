import 'package:flutter/material.dart';
import 'package:my_app/features/main/view/main_view.dart';

import 'package:my_app/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFFF20530)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFFF20530),
        ),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const MainView(),
    );
  }
}
