import 'package:flutter/material.dart';
import 'package:todoapp/pages/homepage.dart';
import 'package:todoapp/pages/setting.dart';
import 'package:todoapp/pages/todo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHome(),
      routes: {
        '/settings': (context) => const SettingsPage(),
        '/todo': (context) => const TodoPage(),
      },
    );
  }
}
