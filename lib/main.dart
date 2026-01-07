import 'package:flutter/material.dart';
import 'package:notia/themes/theme_dark.dart';
import 'package:notia/themes/theme_light.dart';
import 'package:notia/themes/theme_provider.dart';
import 'package:notia/ui/homepage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const NotiaApp());
}

class NotiaApp extends StatelessWidget {
  const NotiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'Notia',
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: themeProvider.themeMode,
            home: Homepage(),
          );
        },
      ),
    );
  }
}
