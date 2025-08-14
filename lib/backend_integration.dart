import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'backend.dart'; // Импорт приватного файла

Future<void> initBackend() async {
  await dotenv.load(fileName: 'assets/config.env');
  await Backend.initialize();
}