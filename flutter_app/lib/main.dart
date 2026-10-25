import 'package:flutter/material.dart';

void main() {
  runApp(const CampusConnectApp());
}

class CampusConnectApp extends StatelessWidget {
  const CampusConnectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campus Connect',
      initialRoute: '/',
      routes: {
        '/': (context) => const CampusHomePage(),
        '/events': (context) => const CampusSectionPage(
              title: 'Events',
              icon: Icons.event,
              description: 'Discover upcoming campus activities and programs.',
            ),
        '/notices': (context) => const CampusSectionPage(
              title: 'Notices',
              icon: Icons.notifications,
              description: 'Keep up with important college announcements.',
            ),
        '/subjects': (context) => const CampusSectionPage(
              title: 'Subjects',
              icon: Icons.menu_book,
              description: 'Access your subjects and learning information.',
            ),
        '/profile': (context) => const CampusSectionPage(
              title: 'Profile',
              icon: Icons.person,
              description: 'View your Campus Connect profile.',
            ),
      },
    );
  }
}

class CampusHomePage extends StatelessWidget {
  const CampusHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: const Text('Campus Connect')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final cardWidth = constraints.maxWidth < 600
                ? (constraints.maxWidth - 12) / 2
                : (constraints.maxWidth - 36) / 4;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome to Campus Connect',
                  style: TextStyle(
                    fontSize: screenWidth < 400 ? 20 : 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Your starting point for useful campus information.',
                ),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    _InfoCard(
                      title: 'Events',
                      icon: Icons.event,
                      width: cardWidth,
                      routeName: '/events',
                    ),
                    _InfoCard(
                      title: 'Notices',
                      icon: Icons.notifications,
                      width: cardWidth,
                      routeName: '/notices',
                    ),
                    _InfoCard(
                      title: 'Subjects',
                      icon: Icons.menu_book,
                      width: cardWidth,
                      routeName: '/subjects',
                    ),
                    _InfoCard(
                      title: 'Profile',
                      icon: Icons.person,
                      width: cardWidth,
                      routeName: '/profile',
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final double width;
  final String routeName;

  const _InfoCard({
    required this.title,
    required this.icon,
    required this.width,
    required this.routeName,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Card(
        child: InkWell(
          onTap: () => Navigator.pushNamed(context, routeName),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Icon(icon, size: 32),
                const SizedBox(height: 8),
                Text(title),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CampusSectionPage extends StatelessWidget {
  final String title;
  final IconData icon;
  final String description;

  const CampusSectionPage({
    super.key,
    required this.title,
    required this.icon,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 56),
              const SizedBox(height: 16),
              Text(
                title,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(description, textAlign: TextAlign.center),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Back to Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
