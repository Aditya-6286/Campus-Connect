import 'package:flutter/material.dart';

class CampusSubject {
  const CampusSubject({
    required this.code,
    required this.name,
    required this.term,
    required this.description,
  });

  final String code;
  final String name;
  final String term;
  final String description;
}

class CampusSubjectsPage extends StatelessWidget {
  const CampusSubjectsPage({super.key});

  static const _subjects = <CampusSubject>[
    CampusSubject(
      code: 'CS-01',
      name: 'Programming Fundamentals',
      term: 'Core subject',
      description:
          'Review language basics, control flow, functions, and problem solving.',
    ),
    CampusSubject(
      code: 'CS-02',
      name: 'Data Structures',
      term: 'Core subject',
      description:
          'Explore arrays, linked lists, stacks, queues, trees, and graphs.',
    ),
    CampusSubject(
      code: 'CS-03',
      name: 'Database Systems',
      term: 'Core subject',
      description:
          'Learn relational data, SQL queries, normalization, and transactions.',
    ),
    CampusSubject(
      code: 'CS-04',
      name: 'Operating Systems',
      term: 'Core subject',
      description:
          'Study processes, scheduling, memory management, and synchronization.',
    ),
    CampusSubject(
      code: 'CS-05',
      name: 'Software Engineering',
      term: 'Core subject',
      description:
          'Understand requirements, design, testing, and software delivery.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Subjects')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Learning hub',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          const Text(
            'Illustrative subject cards for the project demo. Replace these '
            'samples with the college-approved subject list before release.',
          ),
          const SizedBox(height: 16),
          ..._subjects.map(
            (subject) => Card(
              child: ExpansionTile(
                leading: const Icon(Icons.menu_book_outlined),
                title: Text(subject.name),
                subtitle: Text('${subject.code} • ${subject.term}'),
                childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(subject.description),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
