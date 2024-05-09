import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_demo_task_map/pages/history/history_page.dart';
import 'package:project_demo_task_map/pages/home/home_page.dart';
import 'package:project_demo_task_map/pages/map/map_page.dart';
import 'package:project_demo_task_map/pages/profile/profile_page.dart';
import 'package:project_demo_task_map/pages/support/support_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
      ),
      initialRoute: HomePage.routeName,
      routes: {
        ProfilePage.routeName: (context) => const ProfilePage(),
        SupportPage.routeName: (context) => const SupportPage(),
        HistoryPage.routeName: (context) => const HistoryPage(),
        MapPage.routeName: (context) => const MapPage(),
      },
    );
  }
}
