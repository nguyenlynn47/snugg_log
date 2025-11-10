import 'package:flutter/material.dart';
import 'package:snugg_log/entries_page.dart';
import 'package:snugg_log/home_page.dart';
import 'package:snugg_log/log_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _selectedIndex = 0;

  final List _pages = [
    HomePage(),
    LogPage(),
    EntriesPage()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: NavigationBar(
          backgroundColor: Color.fromARGB(255, 61, 43, 23),
          indicatorColor: Color.fromARGB(255, 217, 217, 217),
          selectedIndex: _selectedIndex,
          onDestinationSelected: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          destinations: <Widget>[
            NavigationDestination(icon: Icon(Icons.home_outlined, color: Color.fromARGB(255, 0, 120, 0)), label: "Home"),
            NavigationDestination(icon: Icon(Icons.mood, color: Color.fromARGB(255, 0, 120, 0)), label: "Log"),
            NavigationDestination(icon: Icon(Icons.today, color: Color.fromARGB(255, 0, 120, 0)), label: "Entries"),
          ]
        )
      )
    );
  }
}
