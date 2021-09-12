import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DiffApp extends StatelessWidget {
  const DiffApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diff',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SizedBox.shrink(),
    );
  }
}
