import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'home_screen.dart';
import 'settings_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter(); // التهيئة
  await Hive.openBox('tasksbox'); // حتى نفتح اللوكل داتابيس
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  bool isDark = false; // so it always starts with light mode

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDark ? ThemeData.dark() : ThemeData.light(), // theme switch
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomeScreen(onThemeChanged: (value) {
          setState(() {
            isDark = value;
          });
        }),
        '/settings': (context) => SettingsScreen(onThemeChanged: (value) {
          setState(() {
            isDark = value;
          });
        }),
      },
    );
  }
}
