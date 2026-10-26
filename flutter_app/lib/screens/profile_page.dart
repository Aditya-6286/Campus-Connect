import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/campus_bottom_navigation.dart';
import '../widgets/favorite_section_action.dart';

class CampusProfilePage extends StatefulWidget {
  const CampusProfilePage({super.key});

  @override
  State<CampusProfilePage> createState() => _CampusProfilePageState();
}

class _CampusProfilePageState extends State<CampusProfilePage> {
  static const _nameKey = 'campus_connect.profile.name';
  static const _studentIdKey = 'campus_connect.profile.student_id';
  static const _courseKey = 'campus_connect.profile.course';

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _studentIdController = TextEditingController();
  final _courseController = TextEditingController();
  bool _loadingProfile = true;
  bool _savingProfile = false;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      _nameController.text = prefs.getString(_nameKey) ?? '';
      _studentIdController.text = prefs.getString(_studentIdKey) ?? '';
      _courseController.text = prefs.getString(_courseKey) ?? '';
    } catch (_) {
      // The form remains usable if local storage is unavailable.
    }
    if (mounted) setState(() => _loadingProfile = false);
  }

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

  Future<void> _saveProfile() async {
    if (!_formKey.currentState!.validate()) return;

    FocusScope.of(context).unfocus();
    setState(() => _savingProfile = true);
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_nameKey, _nameController.text.trim());
      await prefs.setString(_studentIdKey, _studentIdController.text.trim());
      await prefs.setString(_courseKey, _courseController.text.trim());
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Profile details validated for ${_nameController.text.trim()}.',
          ),
        ),
      );
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not save profile on this device.')),
      );
    } finally {
      if (mounted) setState(() => _savingProfile = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CampusBottomNavigation(),
      appBar: AppBar(
        title: const Text('Student Profile'),
        actions: const [FavoriteSectionAction(section: 'Profile')],
      ),
      body: _loadingProfile
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 520),
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 100),
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
                        'Your profile is saved on this device. Fill in the fields below.',
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
                              validator: (value) =>
                                  _requiredField(value, 'full name'),
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
                              validator: (value) =>
                                  _requiredField(value, 'student ID'),
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
                              validator: (value) =>
                                  _requiredField(value, 'course'),
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: double.infinity,
                              child: FilledButton.icon(
                                onPressed: _savingProfile ? null : _saveProfile,
                                icon: _savingProfile
                                    ? const SizedBox(
                                        width: 18,
                                        height: 18,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                        ),
                                      )
                                    : const Icon(Icons.save_outlined),
                                label: Text(
                                  _savingProfile ? 'Saving...' : 'Save profile',
                                ),
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
