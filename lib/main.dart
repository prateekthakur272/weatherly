import 'package:flutter/material.dart';
import 'package:weatherly/app.dart';
import 'package:weatherly/env.dart';

Future<void> main(List<String> args) async {
  await EnvConfig.loadEnv();
  runApp(const App());
}