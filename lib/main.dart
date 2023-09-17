import 'package:flutter/material.dart';
import 'package:predition_admin/home_page.dart';
import 'package:predition_admin/provider/home_page_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomePageProvider()..initSupabase(),
        )
      ],
      child: MaterialApp(
        title: 'Predition',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme: const ColorScheme(
              brightness: Brightness.light,
              primary: Color(0xff606C38),
              onPrimary: Color(0xFFFFFFFF),
              primaryContainer: Color(0xff606C38),
              onPrimaryContainer: Color(0xFF0E2000),
              secondary: Color(0xff606C38),
              onSecondary: Color(0xFFFFFFFF),
              secondaryContainer: Color(0xFFDBE7C9),
              onSecondaryContainer: Color(0xFF151E0C),
              tertiary: Color(0xFFDDA15E),
              onTertiary: Color(0xFFFFFFFF),
              tertiaryContainer: Color(0xFF606C38),
              onTertiaryContainer: Color(0xFF00201F),
              error: Color(0xFFBA1A1A),
              errorContainer: Color(0xFFFFDAD6),
              onError: Color(0xFFBA1A1A),
              onErrorContainer: Color(0xFFFEFAE0),
              background: Color(0xffFEFAE0),
              onBackground: Color(0xFFBC6C25),
              surface: Color(0xffFEFAE0),
              onSurface: Color(0xFF1B1C18),
              surfaceVariant: Color(0xFFE0E4D6),
              onInverseSurface: Color(0xFFF2F1EA),
              inverseSurface: Color(0xFF2F312C),
              inversePrimary: Color(0xff606C38),
              shadow: Color(0xFF000000),
              surfaceTint: Color(0xff606C38),
              outlineVariant: Color(0xFFC4C8BA),
              scrim: Color(0xFFDDA15E),
            ),
            useMaterial3: true),
        home: const HomePage(),
      ),
    );
  }
}
