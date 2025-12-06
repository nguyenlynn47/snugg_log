import 'package:flutter/material.dart';
import 'package:snugg_log/entries_page.dart';
import 'package:snugg_log/home_page.dart';
import 'package:snugg_log/log_page.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PersistentTabView(
        tabs: [
          PersistentTabConfig(
            screen: HomePage(),
            item: ItemConfig(
              icon: Icon(Icons.home_outlined, size: 30, color: Color.fromARGB(255, 0, 120, 0)),
              title: "Home",
              textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              inactiveForegroundColor: Colors.grey,
              activeForegroundColor: Colors.white70
            )
          ),
          PersistentTabConfig(
            screen: LogPage(),
            item: ItemConfig(
              icon: Icon(Icons.mood, size: 30, color: Color.fromARGB(255, 0, 120, 0)),
              title: "Log",
              textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              inactiveForegroundColor: Colors.grey,
              activeForegroundColor: Colors.white70
            )
          ),
          PersistentTabConfig(
            screen: EntriesPage(),
            item: ItemConfig(
              icon: Icon(Icons.today, size: 30, color: Color.fromARGB(255, 0, 120, 0)),
              title: "Entries",
              textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              inactiveForegroundColor: Colors.grey,
              inactiveBackgroundColor: Colors.black,
              activeForegroundColor: Colors.white70
            )
          )
        ],
        navBarBuilder: (navBarConfig) => Style4BottomNavBar(
          navBarConfig: navBarConfig,
          navBarDecoration: NavBarDecoration(
            color: Color.fromARGB(255, 61, 43, 23),
          ),
        ),
      ),
      routes: {
        "main": (context) => const MainApp(),
      },
    );
  }
}
