library app;

import 'package:app/src/widget/diff_app.dart';
import 'package:flutter/material.dart';

import 'src/di/component/app_component.dart';
import 'src/di/di.dart';

late AppComponent appComponent;

Future<void> launch() async {
  appComponent = JuggerAppComponentBuilder().build();

  runApp(const DiffApp());
}
