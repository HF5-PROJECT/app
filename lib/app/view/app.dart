import 'package:flutter/material.dart';
import 'package:overnites/hotel/view/hotel.dart';
import 'package:overnites/l10n/l10n.dart';
import 'package:overnites/user/view/user.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Overnites',
      theme: ThemeData(
        fontFamily: 'Roboto',
        appBarTheme: const AppBarTheme(color: Color(0xFF212121)),
        scaffoldBackgroundColor: const Color(0xFF1E1E1E),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF212121),
          onPrimary: Color(0xFFcfb39d),
          secondary: Color(0xFF56483e),
          onSecondary: Color(0xFFa68f7d),
          secondaryContainer: Color(0xFF212121),
          onSecondaryContainer: Color(0xFFcfb39d),
          surface: Color(0xFF313030),
          onSurface: Color(0xFFcfb39d),
          tertiary: Color(0xFF212121),
          onTertiary: Color(0xFFcfb39d),
          background: Color(0xFF212121),
          onBackground: Color(0xFFcfb39d),
        ),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: '/hotels',
      routes: {
        '/hotels': (context) => const HotelPage(),
        '/user': (context) => const UserPage(),
      },
    );
  }
}
