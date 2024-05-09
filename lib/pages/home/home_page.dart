import 'package:flutter/material.dart';

import '../history/history_page.dart';
import '../map/map_page.dart';
import '../profile/profile_page.dart';
import '../support/support_page.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                _showMenu(context);
              },
              icon: const Icon(Icons.menu)),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, MapPage.routeName);
              },
              icon: const Icon(Icons.map)),
        ],
      ),
    );
  }

  void _showMenu(BuildContext context) {
    showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(10, 10, 0, 0),
      items: [
        const PopupMenuItem(
          value: 'profile',
          child: Text('Profile'),
        ),
        const PopupMenuItem(
          value: 'support',
          child: Text('Support'),
        ),
        const PopupMenuItem(
          value: 'history',
          child: Text('History'),
        ),
      ],
    ).then<void>((String? value) {
      if (value != null) {
        // Обработка выбора пункта меню
        switch (value) {
          case 'profile':
            Navigator.pushNamed(context, ProfilePage.routeName);
            break;
          case 'support':
            Navigator.pushNamed(context, SupportPage.routeName);
            break;
          case 'history':
            Navigator.pushNamed(context, HistoryPage.routeName);
            break;
        }
      }
    });
  }
}
