import 'package:flutter/material.dart';
import 'package:overnites/counter/counter.dart';
import 'package:overnites/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFF212121)),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF212121),
          onPrimary: Color(0xFFcfb39d),
          secondary: Color(0xFF212121),
          onSecondary: Color(0xFFcfb39d),
          surface: Color(0xFF212121),
          onSurface: Color(0xFFa68f7d),
          tertiary: Color(0xFF212121),
          onTertiary: Color(0xFFcfb39d),
          background: Color(0xFF212121),
          onBackground: Color(0xFFcfb39d),
        ),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const CounterPage(),
    );
  }
}
