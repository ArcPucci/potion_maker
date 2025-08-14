import 'dart:io';

void main() async {
  // Список зависимостей для добавления (без версий)
  final dependenciesToAdd = [
    'flutter_dotenv',
    'firebase_core',
    'dio',
    'uuid',
    'get_storage',
    'ua_client_hints',
  ];

  // Путь к файлу pubspec.yaml
  final pubspecFile = File('pubspec.yaml');

  // Проверяем, существует ли файл
  if (!pubspecFile.existsSync()) {
    print('Ошибка: pubspec.yaml не найден!');
    return;
  }

  // Читаем содержимое файла
  String content = await pubspecFile.readAsString();
  List<String> lines = content.split('\n');

  // Ищем секцию dependencies
  int dependenciesIndex = lines.indexWhere((line) => line.trim() == 'dependencies:');
  if (dependenciesIndex == -1) {
    print('Ошибка: секция "dependencies" не найдена! Добавляю новую.');
    lines.add('dependencies:');
    dependenciesIndex = lines.length - 1;
  }

  // Проверяем существующие зависимости и собираем новые строки
  final existingDependencies = <String>{};
  final newLines = <String>[];
  bool inDependenciesSection = false;

  for (var line in lines) {
    if (line.trim() == 'dependencies:') {
      inDependenciesSection = true;
      newLines.add(line);
      continue;
    }

    if (inDependenciesSection && line.trim().isEmpty) {
      // Конец секции dependencies
      inDependenciesSection = false;
    }

    if (inDependenciesSection && line.trim().isNotEmpty && !line.contains('flutter:')) {
      final parts = line.trim().split(':');
      if (parts.length >= 1) {
        final depName = parts[0].trim();
        existingDependencies.add(depName);
      }
    }
    newLines.add(line);
  }

  // Добавляем новые зависимости, если их нет
  final dependenciesStart = dependenciesIndex + 1;
  for (final dep in dependenciesToAdd) {
    if (!existingDependencies.contains(dep)) {
      newLines.insert(dependenciesStart, '  $dep:');
      print('Добавлена зависимость: $dep');
    } else {
      print('Зависимость $dep уже существует, пропускаю.');
    }
  }

  // Записываем обновлённое содержимое обратно в файл
  await pubspecFile.writeAsString(newLines.join('\n'));
  print('Файл pubspec.yaml успешно обновлён!');

  // Автоматически выполняем flutter pub get (опционально)
  try {
    final result = await Process.run('flutter', ['pub', 'get']);
    if (result.exitCode == 0) {
      print('Зависимости успешно установлены.');
    } else {
      print('Ошибка при выполнении flutter pub get: ${result.stderr}');
    }
  } catch (e) {
    print('Не удалось выполнить flutter pub get: $e');
  }
}