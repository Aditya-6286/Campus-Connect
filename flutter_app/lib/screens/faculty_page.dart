import 'package:flutter/material.dart';

import '../widgets/favorite_section_action.dart';

class CampusFacultyMember {
  const CampusFacultyMember({
    required this.name,
    required this.department,
    required this.designation,
    required this.email,
    required this.initials,
  });

  final String name;
  final String department;
  final String designation;
  final String email;
  final String initials;
}

class CampusFacultyPage extends StatefulWidget {
  const CampusFacultyPage({super.key});

  @override
  State<CampusFacultyPage> createState() => _CampusFacultyPageState();
}

class _CampusFacultyPageState extends State<CampusFacultyPage> {
  final _searchController = TextEditingController();

  // Demonstration entries only. Replace them with verified college directory data.
  static const _faculty = <CampusFacultyMember>[
    CampusFacultyMember(
      name: 'Computer Science Faculty',
      department: 'Computer Science & Engineering',
      designation: 'Department directory',
      email: 'Contact details to be added by the college',
      initials: 'CS',
    ),
    CampusFacultyMember(
      name: 'Electronics Faculty',
      department: 'Electronics & Communication Engineering',
      designation: 'Department directory',
      email: 'Contact details to be added by the college',
      initials: 'EC',
    ),
    CampusFacultyMember(
      name: 'Electrical Faculty',
      department: 'Electrical & Electronics Engineering',
      designation: 'Department directory',
      email: 'Contact details to be added by the college',
      initials: 'EE',
    ),
    CampusFacultyMember(
      name: 'Mechanical Faculty',
      department: 'Mechanical Engineering',
      designation: 'Department directory',
      email: 'Contact details to be added by the college',
      initials: 'ME',
    ),
    CampusFacultyMember(
      name: 'Civil Faculty',
      department: 'Civil Engineering',
      designation: 'Department directory',
      email: 'Contact details to be added by the college',
      initials: 'CE',
    ),
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final query = _searchController.text.trim().toLowerCase();
    final filtered = _faculty.where((member) =>
        member.name.toLowerCase().contains(query) ||
        member.department.toLowerCase().contains(query)).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Faculty Directory'),
        actions: const [FavoriteSectionAction(section: 'Faculty')],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Find a department',
              style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 8),
          const Text(
            'Search the directory by department. Names and contact details are '
            'demonstration placeholders until verified college data is added.',
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _searchController,
            onChanged: (_) => setState(() {}),
            decoration: InputDecoration(
              hintText: 'Search departments',
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
          if (filtered.isEmpty)
            const Padding(
              padding: EdgeInsets.all(24),
              child: Center(child: Text('No departments match your search.')),
            )
          else
            ...filtered.map((member) => Card(
                  child: ListTile(
                    leading: CircleAvatar(child: Text(member.initials)),
                    title: Text(member.name),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        '${member.department}\n${member.email}',
                      ),
                    ),
                    isThreeLine: true,
                    trailing: const Icon(Icons.school_outlined),
                  ),
                )),
        ],
      ),
    );
  }
}
