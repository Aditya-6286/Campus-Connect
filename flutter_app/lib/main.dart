import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'state/campus_state.dart';
import 'screens/profile_page.dart';
import 'screens/notices_page.dart';
import 'screens/events_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CampusState(),
      child: const CampusConnectApp(),
    ),
  );
}

class CampusConnectApp extends StatelessWidget {
  const CampusConnectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campus Connect',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2457C5)),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const CampusHomePage(),
        '/events': (context) => const CampusEventsPage(),
        '/notices': (context) => const CampusNoticesPage(),
        '/subjects': (context) => const CampusSectionPage(
              title: 'Subjects',
              icon: Icons.menu_book,
              description: 'Access your subjects and learning information.',
            ),
        '/profile': (context) => const CampusProfilePage(),
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
      appBar: AppBar(
        title: const Text('Campus Connect'),
        actions: [
          IconButton(
            tooltip: 'Open profile',
            onPressed: () => Navigator.pushNamed(context, '/profile'),
            icon: const Icon(Icons.account_circle_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final cardWidth = constraints.maxWidth < 600
                ? (constraints.maxWidth - 12) / 2
                : (constraints.maxWidth - 36) / 4;

            return ListView(
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
                      subtitle: 'Campus activities',
                      icon: Icons.event,
                      width: cardWidth,
                      routeName: '/events',
                    ),
                    _InfoCard(
                      title: 'Notices',
                      subtitle: 'College updates',
                      icon: Icons.notifications,
                      width: cardWidth,
                      routeName: '/notices',
                    ),
                    _InfoCard(
                      title: 'Subjects',
                      subtitle: 'Learning resources',
                      icon: Icons.menu_book,
                      width: cardWidth,
                      routeName: '/subjects',
                    ),
                    _InfoCard(
                      title: 'Profile',
                      subtitle: 'Your account',
                      icon: Icons.person,
                      width: cardWidth,
                      routeName: '/profile',
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Consumer<CampusState>(
                  builder: (context, campusState, child) => Card(
                    child: ListTile(
                      leading: const Icon(Icons.bookmark_added_outlined),
                      title: const Text('Saved sections'),
                      subtitle: Text(
                        '${campusState.favoriteSections.length} section(s) saved',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Quick access',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.campaign_outlined),
                    title: const Text('Latest notices'),
                    subtitle: const Text('Open campus announcements'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => Navigator.pushNamed(context, '/notices'),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.calendar_month_outlined),
                    title: const Text('Upcoming events'),
                    subtitle: const Text('Explore campus activities'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => Navigator.pushNamed(context, '/events'),
                  ),
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
  final String subtitle;
  final IconData icon;
  final double width;
  final String routeName;

  const _InfoCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.width,
    required this.routeName,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () => Navigator.pushNamed(context, routeName),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(icon, size: 32),
                const SizedBox(height: 12),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
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
      appBar: AppBar(
        title: Text(title),
        actions: [
          Consumer<CampusState>(
            builder: (context, campusState, child) {
              final isFavorite = campusState.isFavorite(title);
              return IconButton(
                tooltip: isFavorite ? 'Remove saved section' : 'Save section',
                onPressed: () => campusState.toggleFavorite(title),
                icon: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 220),
                  transitionBuilder: (child, animation) =>
                      ScaleTransition(scale: animation, child: child),
                  child: Icon(
                    isFavorite ? Icons.bookmark : Icons.bookmark_border,
                    key: ValueKey<bool>(isFavorite),
                  ),
                ),
              );
            },
          ),
        ],
      ),
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
              ElevatedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
                label: const Text('Back to Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
