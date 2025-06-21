/***
update_dart_headers.dart: Update Dart Headers module
created by @lanri.jait@gmail.com
last committed by @
***/

import 'dart:io';

void main() async {
  final result = await Process.run(
    'git',
    ['diff', '--cached', '--name-only', '--diff-filter=ACM'],
  );

  final files = (result.stdout as String)
      .split('\n')
      .where((f) => f.endsWith('.dart'))
      .toList();

  for (var file in files) {
    final path = File(file);
    if (!await path.exists()) continue;

    final creator = await _git(['config', 'user.email']);
    final committer = await _git(['log', '-1', '--pretty=format:%ae', file]);
    final filename = file.split('/').last;

    final description = await _getDescription(file, filename);

    final original = await path.readAsString();

    // Remove old header (between )
    final cleaned = original.replaceFirst(RegExp(r'/\*\*\*.*?\*\*\*/\n?', dotAll: true), '');

    final header = '''/***
$filename: $description
created by @$creator
last committed by @$committer
***/

''';

    await path.writeAsString(header + cleaned);
    await Process.run('git', ['add', file]);
  }
}

Future<String> _git(List<String> args) async {
  final result = await Process.run('git', args);
  return (result.stdout as String).trim();
}

Future<String> _getDescription(String filepath, String filename) async {
  final commitMessage = await _git(['log', '-1', '--pretty=%s', filepath]);

  if (commitMessage.isNotEmpty) {
    return commitMessage;
  }

  // fallback: filename to readable text
  final nameWithoutExt = filename.replaceAll('.dart', '');
  final readable = nameWithoutExt
      .replaceAll(RegExp(r'[_\-]+'), ' ')
      .replaceAllMapped(RegExp(r'^.|\s+.'), (m) => m.group(0)!.toUpperCase())
      .trim();

  return '$readable module';
}
