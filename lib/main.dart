import 'package:flutter/material.dart';

import 'home_screen.dart';

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
