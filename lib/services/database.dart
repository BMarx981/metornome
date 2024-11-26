import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

@DataClassName('AppSetting')
class AppSettings extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get selectedSound => text()();
  RealColumn get tempo => real()();
}

@DriftDatabase(tables: [AppSettings])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  Future<List<dynamic>> getAllSettings() => select(appSettings).get();
  Future<int> insertSetting(AppSettings setting) =>
      into(appSettings).insert(setting as Insertable<AppSetting>);
  Future updateSetting(AppSetting setting) =>
      update(appSettings).replace(setting);

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'app_settings.sqlite'));
    return NativeDatabase(file);
  });
}
