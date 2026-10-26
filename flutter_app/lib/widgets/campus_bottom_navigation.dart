import 'package:flutter/material.dart';

/// Persistent primary navigation shared by the main Campus Connect screens.
class CampusBottomNavigation extends StatelessWidget {
  const CampusBottomNavigation({super.key});

  static const _routes = <String>['/', '/events', '/notices', '/profile'];

  @override
  Widget build(BuildContext context) {
    final routeName = ModalRoute.of(context)?.settings.name ?? '/';
    final selectedIndex = _routes.indexOf(routeName);
    return NavigationBar(
      selectedIndex: selectedIndex < 0 ? 0 : selectedIndex,
      onDestinationSelected: (index) {
        final destination = _routes[index];
        if (destination == routeName) return;
        Navigator.pushNamedAndRemoveUntil(
          context,
          destination,
          (route) => route.isFirst,
        );
      },
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(Icons.event_outlined),
          selectedIcon: Icon(Icons.event),
          label: 'Events',
        ),
        NavigationDestination(
          icon: Icon(Icons.notifications_outlined),
          selectedIcon: Icon(Icons.notifications),
          label: 'Notices',
        ),
        NavigationDestination(
          icon: Icon(Icons.person_outline),
          selectedIcon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}
