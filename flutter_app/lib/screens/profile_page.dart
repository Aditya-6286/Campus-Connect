import 'package:flutter/material.dart';
import '../widgets/campus_bottom_navigation.dart';

import '../widgets/favorite_section_action.dart';

class CampusProfilePage extends StatefulWidget {
  const CampusProfilePage({super.key});

  @override
  State<CampusProfilePage> createState() => _CampusProfilePageState();
}

class _CampusProfilePageState extends State<CampusProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _studentIdController = TextEditingController();
  final _courseController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _studentIdController.dispose();
    _courseController.dispose();
    super.dispose();
  }

  String? _requiredField(String? value, String label) {
    if (value == null || value.trim().isEmpty) {
      return 'Enter your $label';
    }
    return null;
  }

  void _saveProfile() {
    if (!_formKey.currentState!.validate()) return;

    FocusScope.of(context).unfocus();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Profile details validated for ${_nameController.text.trim()}.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CampusBottomNavigation(),
      appBar: AppBar(
        title: const Text('Student Profile'),
        actions: const [FavoriteSectionAction(section: 'Profile')],
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                const Icon(Icons.account_circle_outlined, size: 64),
                const SizedBox(height: 12),
                Text(
                  'Your student details',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 8),
                const Text(
                  'Fill in the fields below. Required fields are checked before saving.',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nameController,
                        textCapitalization: TextCapitalization.words,
                        decoration: const InputDecoration(
                          labelText: 'Full name',
                          prefixIcon: Icon(Icons.person_outline),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) => _requiredField(value, 'full name'),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _studentIdController,
                        textCapitalization: TextCapitalization.characters,
                        decoration: const InputDecoration(
                          labelText: 'Student ID / roll number',
                          prefixIcon: Icon(Icons.badge_outlined),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) => _requiredField(value, 'student ID'),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _courseController,
                        textCapitalization: TextCapitalization.words,
                        decoration: const InputDecoration(
                          labelText: 'Course / branch',
                          prefixIcon: Icon(Icons.school_outlined),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) => _requiredField(value, 'course'),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton.icon(
                          onPressed: _saveProfile,
                          icon: const Icon(Icons.check_circle_outline),
                          label: const Text('Validate profile'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}