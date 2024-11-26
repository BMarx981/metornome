import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'database.g.dart';

@DataClassName('AppSetting')
class AppSettings extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get selectedSound => text()();
  RealColumn get tempo => real()();
}

@DriftDatabase(tables: [AppSettings])
class AppDatabase extends _$AppDatabase {
  
  int get schemeVersion => 1;
  
  Future<List<AppSettings>> getAllSettings() => select(appSetting).get();
  Future<int> insertSetting(AppSettings setting) => into(appSetting).insert(setting);
}