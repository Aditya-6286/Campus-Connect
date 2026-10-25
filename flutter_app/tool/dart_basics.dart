// ignore_for_file: avoid_print

String formatModule(int index, String module) =>
    '${index + 1}. $module';

void main() {
  const projectName = 'Campus Connect';
  final modules = <String>['Events', 'Notices', 'Subjects', 'Profile'];

  print('Project: $projectName');
  print('Available sections: ${modules.length}');

  for (var index = 0; index < modules.length; index++) {
    print(formatModule(index, modules[index]));
  }

  if (modules.contains('Events') && modules.contains('Notices')) {
    print('Core campus sections are configured.');
  }
}
