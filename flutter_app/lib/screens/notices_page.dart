import 'package:flutter/material.dart';

import '../widgets/favorite_section_action.dart';

import '../services/campus_api.dart';

class CampusNoticesPage extends StatefulWidget {
  const CampusNoticesPage({super.key});

  @override
  State<CampusNoticesPage> createState() => _CampusNoticesPageState();
}

class _CampusNoticesPageState extends State<CampusNoticesPage> {
  late final CampusApi _api;
  late Future<List<CampusNotice>> _noticesFuture;

  @override
  void initState() {
    super.initState();
    _api = CampusApi();
    _noticesFuture = _api.fetchNotices();
  }

  @override
  void dispose() {
    _api.dispose();
    super.dispose();
  }

  void _retry() {
    setState(() {
      _noticesFuture = _api.fetchNotices();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Campus Notices'),
        actions: const [
          FavoriteSectionAction(section: 'Notices'),
        ],
      ),
      body: FutureBuilder<List<CampusNotice>>(
        future: _noticesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.cloud_off_outlined, size: 48),
                    const SizedBox(height: 12),
                    Text(
                      'Notices could not be loaded.',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Check your internet connection and try again. '
                      'This screen uses a sample REST API for the lab demo.',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    FilledButton.icon(
                      onPressed: _retry,
                      icon: const Icon(Icons.refresh),
                      label: const Text('Try again'),
                    ),
                  ],
                ),
              ),
            );
          }

          final notices = snapshot.data ?? const <CampusNotice>[];
          if (notices.isEmpty) {
            return const Center(child: Text('No notices are available.'));
          }

          return RefreshIndicator(
            onRefresh: () async => _retry(),
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: notices.length,
              separatorBuilder: (context, index) =>
                  const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final notice = notices[index];
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(child: Text('${notice.id}')),
                    title: Text(
                      notice.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(notice.body),
                    ),
                    isThreeLine: true,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

            onPressed: _retry,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: FutureBuilder<List<CampusNotice>>(
        future: _noticesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.cloud_off_outlined, size: 48),
                    const SizedBox(height: 12),
                    Text(
                      'Notices could not be loaded.',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Check your internet connection and try again. '
                      'This screen uses a sample REST API for the lab demo.',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    FilledButton.icon(
                      onPressed: _retry,
                      icon: const Icon(Icons.refresh),
                      label: const Text('Try again'),
                    ),
                  ],
                ),
              ),
            );
          }

          final notices = snapshot.data ?? const <CampusNotice>[];
          if (notices.isEmpty) {
            return const Center(child: Text('No notices are available.'));
          }

          return RefreshIndicator(
            onRefresh: () async => _retry(),
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: notices.length,
              separatorBuilder: (context, index) =>
                  const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final notice = notices[index];
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(child: Text('${notice.id}')),
                    title: Text(
                      notice.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(notice.body),
                    ),
                    isThreeLine: true,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
