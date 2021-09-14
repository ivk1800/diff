import 'package:app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DiffApp extends StatelessWidget {
  const DiffApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diff',
      home: appComponent
          .getFeatureProvider()
          .workspaceFeatureApi
          .workspaceScreenFactory
          .create(),
    );
  }
}
