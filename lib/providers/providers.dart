import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:metornome/services/database.dart';

final databaseProvider = Provider<AppDatabase>((ref) => AppDatabase());

final selectedSoundProvider =
    StateProvider<String>((ref) => 'default_click.mp3');

final tempoProvider = StateProvider<double>((ref) => 80.0);

final settingsProvider = FutureProvider((ref) async {
  final db = ref.watch(databaseProvider);
  final settings = await db.getAllSettings();
  if (settings.isNotEmpty) {
    ref.read(selectedSoundProvider.notifier).state =
        settings.first.selectedSound;
    ref.read(tempoProvider.notifier).state = settings.first.tempo;
  }
});
