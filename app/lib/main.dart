library app;

import 'package:app/src/widget/diff_app.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/di/component/app_component.dart';
import 'src/di/di.dart';

late AppComponent appComponent;

Future<void> launch() async {
  WidgetsFlutterBinding.ensureInitialized();

  appComponent = JuggerAppComponentBuilder()
      .sharedPreferences(
        await SharedPreferences.getInstance(),
      )
      .build();

  runApp(const DiffApp());
}
