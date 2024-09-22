import 'package:flutter/material.dart';
import 'package:oostende_explorer_app/pages/navigation_page.dart';
import 'package:oostende_explorer_app/utilities/app_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      child: const MyApp(),
      create: (context) => AppProvider(),
    ),
  );
}

late Size deviceSize;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavigationPage(),
    );
  }
}
