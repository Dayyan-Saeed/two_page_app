import 'package:flutter/material.dart';
import 'pages/threads_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Threads App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
        fontFamily: 'San Francisco',
      ),
      home: const ThreadsPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
