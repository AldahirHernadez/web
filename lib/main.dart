import 'package:flutter/material.dart';
import 'package:web/login_page.dart';
// ignore: unused_import
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sistema de IT',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      routes: {'/login': (context) => const LoginPage()},
      initialRoute: '/login',
    );
  }
}
