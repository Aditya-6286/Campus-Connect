import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/campus_bottom_navigation.dart';

import '../state/campus_state.dart';

class CampusSettingsPage extends StatelessWidget {
  const CampusSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final campusState = context.watch<CampusState>();

    return Scaffold(
      bottomNavigationBar: const CampusBottomNavigation(),
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Preferences',
              style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 12),
          Card(
            child: SwitchListTile(
              secondary: const Icon(Icons.dark_mode_outlined),
              title: const Text('Dark appearance'),
              subtitle: const Text('Switch the app between light and dark themes.'),
              value: campusState.isDarkMode,
              onChanged: campusState.setDarkMode,
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.bookmark_remove_outlined),
              title: const Text('Clear saved sections'),
              subtitle: Text(
                campusState.favoriteSections.isEmpty
                    ? 'You have no saved sections.'
                    : '${campusState.favoriteSections.length} section(s) saved',
              ),
              onTap: campusState.favoriteSections.isEmpty
                  ? null
                  : () async {
                      final confirmed = await showDialog<bool>(
                        context: context,
                        builder: (dialogContext) => AlertDialog(
                          title: const Text('Clear saved sections?'),
                          content: const Text(
                            'This removes all saved section bookmarks for this session.',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(dialogContext, false),
                              child: const Text('Cancel'),
                            ),
                            FilledButton(
                              onPressed: () => Navigator.pop(dialogContext, true),
                              child: const Text('Clear'),
                            ),
                          ],
                        ),
                      );
                      if (confirmed == true && context.mounted) {
                        campusState.clearFavorites();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Saved sections cleared.')),
                        );
                      }
                    },
            ),
          ),
          const SizedBox(height: 24),
          Text('About', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 12),
          const Card(
            child: ListTile(
              leading: Icon(Icons.school_outlined),
              title: Text('Campus Connect'),
              subtitle: Text(
                'A student companion app prototype for campus events, notices, '
                'subjects, faculty directory, and student profile.',
              ),
            ),
          ),
          const Card(
            child: ListTile(
              leading: Icon(Icons.info_outline),
              title: Text('Demo data notice'),
              subtitle: Text(
                'Events, subjects, and faculty directory entries are sample data. '
                'Notices use a sample REST API; official college data is not connected.',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
