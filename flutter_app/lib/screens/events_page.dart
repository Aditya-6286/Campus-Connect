import 'package:flutter/material.dart';

class CampusEvent {
  const CampusEvent({
    required this.title,
    required this.category,
    required this.dateLabel,
    required this.location,
    required this.description,
    required this.icon,
  });

  final String title;
  final String category;
  final String dateLabel;
  final String location;
  final String description;
  final IconData icon;
}

class CampusEventsPage extends StatefulWidget {
  const CampusEventsPage({super.key});

  @override
  State<CampusEventsPage> createState() => _CampusEventsPageState();
}

class _CampusEventsPageState extends State<CampusEventsPage> {
  final _searchController = TextEditingController();
  String _selectedCategory = 'All';

  static const _events = <CampusEvent>[
    CampusEvent(
      title: 'Coding Challenge',
      category: 'Technical',
      dateLabel: 'Nov 05',
      location: 'Computer Lab',
      description: 'Solve programming problems and learn from other students.',
      icon: Icons.code,
    ),
    CampusEvent(
      title: 'Project Showcase',
      category: 'Technical',
      dateLabel: 'Nov 12',
      location: 'Seminar Hall',
      description: 'Present student projects and exchange practical feedback.',
      icon: Icons.rocket_launch_outlined,
    ),
    CampusEvent(
      title: 'Campus Clean-up',
      category: 'Community',
      dateLabel: 'Nov 16',
      location: 'Main Block',
      description: 'Join a student-led effort to keep shared spaces clean.',
      icon: Icons.eco_outlined,
    ),
    CampusEvent(
      title: 'Cultural Evening',
      category: 'Cultural',
      dateLabel: 'Nov 21',
      location: 'Open Auditorium',
      description: 'An evening of music, performances, and student talent.',
      icon: Icons.music_note,
    ),
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categories = <String>[
      'All',
      ..._events.map((event) => event.category).toSet(),
    ];
    final query = _searchController.text.trim().toLowerCase();
    final filteredEvents = _events.where((event) {
      final matchesCategory =
          _selectedCategory == 'All' || event.category == _selectedCategory;
      final matchesQuery = query.isEmpty ||
          event.title.toLowerCase().contains(query) ||
          event.description.toLowerCase().contains(query) ||
          event.location.toLowerCase().contains(query);
      return matchesCategory && matchesQuery;
    }).toList(growable: false);

    return Scaffold(
      appBar: AppBar(title: const Text('Campus Events')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Find your next campus activity',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          const Text('Sample events for the Campus Connect demonstration.'),
          const SizedBox(height: 16),
          TextField(
            controller: _searchController,
            onChanged: (_) => setState(() {}),
            decoration: InputDecoration(
              hintText: 'Search events or locations',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: _searchController.text.isEmpty
                  ? null
                  : IconButton(
                      tooltip: 'Clear search',
                      onPressed: () {
                        _searchController.clear();
                        setState(() {});
                      },
                      icon: const Icon(Icons.clear),
                    ),
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: categories
                .map(
                  (category) => ChoiceChip(
                    label: Text(category),
                    selected: _selectedCategory == category,
                    onSelected: (_) => setState(() {
                      _selectedCategory = category;
                    }),
                  ),
                )
                .toList(growable: false),
          ),
          const SizedBox(height: 16),
          if (filteredEvents.isEmpty)
            const Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                children: [
                  Icon(Icons.event_busy_outlined, size: 44),
                  SizedBox(height: 8),
                  Text('No events match your search.'),
                ],
              ),
            )
          else
            ...filteredEvents.map(
              (event) => Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(child: Icon(event.icon)),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              event.title,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(height: 4),
                            Text('${event.dateLabel} • ${event.location}'),
                            const SizedBox(height: 8),
                            Text(event.description),
                            const SizedBox(height: 8),
                            Chip(label: Text(event.category)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
