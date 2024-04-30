import 'package:flutter/material.dart';
import 'package:flutter_messenger/src/messenger_app.dart';
import 'dependency_injection_config.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MessengerApp());
}
