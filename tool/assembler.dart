import 'dart:convert';
import 'dart:io';

void main(List<String> arguments) async {
  final inputPath = '${Directory.current.path}/build/web/';
  final outputPath = '${Directory.current.path}/firebase/public';

  await Process.start('flutter', [
    'build',
    'web',
    '--release',
  ]).then((p) => utf8.decodeStream(p.stdout)).then((s) {
    stdout.writeln('Build web:\n$s');
  });

  await Process.start('cp', [
    '-R',
    inputPath,
    outputPath,
  ]).then((p) => utf8.decodeStream(p.stdout)).then((s) {
    stdout
      ..writeln('Move build web  resources:')
      ..writeln('From: $inputPath')
      ..writeln('To: $outputPath');
  });
}
