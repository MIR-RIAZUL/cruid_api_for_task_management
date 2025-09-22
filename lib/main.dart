import 'package:cruid_api_for_task_management/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CrudApp());
}

class CrudApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CRUD App',
      theme: ThemeData(colorSchemeSeed: Colors.blueAccent),
      home: HomeSCreen(),
    );
  }
}
