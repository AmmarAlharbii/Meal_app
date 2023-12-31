import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals/screen/tab_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

final theme = ThemeData(
  //theme for app
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 131, 37, 0),
      brightness: Brightness.dark),
  textTheme: GoogleFonts.latoTextTheme(),
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const TabBottomBar(),
    );
  }
}
