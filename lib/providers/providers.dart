import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:metornome/services/database.dart';

final databaseProvider = Provider<AppDatabase>((ref) => AppDatabase());

final tempoProvider = StateProvider<double>((ref) => 80.0);

final playProvider = StateProvider<bool>((ref) => false);
