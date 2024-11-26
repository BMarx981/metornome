// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $AppSettingsTable extends AppSettings
    with TableInfo<$AppSettingsTable, AppSetting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppSettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _selectedSoundMeta =
      const VerificationMeta('selectedSound');
  @override
  late final GeneratedColumn<String> selectedSound = GeneratedColumn<String>(
      'selected_sound', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tempoMeta = const VerificationMeta('tempo');
  @override
  late final GeneratedColumn<double> tempo = GeneratedColumn<double>(
      'tempo', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, selectedSound, tempo];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_settings';
  @override
  VerificationContext validateIntegrity(Insertable<AppSetting> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('selected_sound')) {
      context.handle(
          _selectedSoundMeta,
          selectedSound.isAcceptableOrUnknown(
              data['selected_sound']!, _selectedSoundMeta));
    } else if (isInserting) {
      context.missing(_selectedSoundMeta);
    }
    if (data.containsKey('tempo')) {
      context.handle(
          _tempoMeta, tempo.isAcceptableOrUnknown(data['tempo']!, _tempoMeta));
    } else if (isInserting) {
      context.missing(_tempoMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AppSetting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppSetting(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      selectedSound: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}selected_sound'])!,
      tempo: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}tempo'])!,
    );
  }

  @override
  $AppSettingsTable createAlias(String alias) {
    return $AppSettingsTable(attachedDatabase, alias);
  }
}

class AppSetting extends DataClass implements Insertable<AppSetting> {
  final int id;
  final String selectedSound;
  final double tempo;
  const AppSetting(
      {required this.id, required this.selectedSound, required this.tempo});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['selected_sound'] = Variable<String>(selectedSound);
    map['tempo'] = Variable<double>(tempo);
    return map;
  }

  AppSettingsCompanion toCompanion(bool nullToAbsent) {
    return AppSettingsCompanion(
      id: Value(id),
      selectedSound: Value(selectedSound),
      tempo: Value(tempo),
    );
  }

  factory AppSetting.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppSetting(
      id: serializer.fromJson<int>(json['id']),
      selectedSound: serializer.fromJson<String>(json['selectedSound']),
      tempo: serializer.fromJson<double>(json['tempo']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'selectedSound': serializer.toJson<String>(selectedSound),
      'tempo': serializer.toJson<double>(tempo),
    };
  }

  AppSetting copyWith({int? id, String? selectedSound, double? tempo}) =>
      AppSetting(
        id: id ?? this.id,
        selectedSound: selectedSound ?? this.selectedSound,
        tempo: tempo ?? this.tempo,
      );
  AppSetting copyWithCompanion(AppSettingsCompanion data) {
    return AppSetting(
      id: data.id.present ? data.id.value : this.id,
      selectedSound: data.selectedSound.present
          ? data.selectedSound.value
          : this.selectedSound,
      tempo: data.tempo.present ? data.tempo.value : this.tempo,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppSetting(')
          ..write('id: $id, ')
          ..write('selectedSound: $selectedSound, ')
          ..write('tempo: $tempo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, selectedSound, tempo);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppSetting &&
          other.id == this.id &&
          other.selectedSound == this.selectedSound &&
          other.tempo == this.tempo);
}

class AppSettingsCompanion extends UpdateCompanion<AppSetting> {
  final Value<int> id;
  final Value<String> selectedSound;
  final Value<double> tempo;
  const AppSettingsCompanion({
    this.id = const Value.absent(),
    this.selectedSound = const Value.absent(),
    this.tempo = const Value.absent(),
  });
  AppSettingsCompanion.insert({
    this.id = const Value.absent(),
    required String selectedSound,
    required double tempo,
  })  : selectedSound = Value(selectedSound),
        tempo = Value(tempo);
  static Insertable<AppSetting> custom({
    Expression<int>? id,
    Expression<String>? selectedSound,
    Expression<double>? tempo,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (selectedSound != null) 'selected_sound': selectedSound,
      if (tempo != null) 'tempo': tempo,
    });
  }

  AppSettingsCompanion copyWith(
      {Value<int>? id, Value<String>? selectedSound, Value<double>? tempo}) {
    return AppSettingsCompanion(
      id: id ?? this.id,
      selectedSound: selectedSound ?? this.selectedSound,
      tempo: tempo ?? this.tempo,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (selectedSound.present) {
      map['selected_sound'] = Variable<String>(selectedSound.value);
    }
    if (tempo.present) {
      map['tempo'] = Variable<double>(tempo.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingsCompanion(')
          ..write('id: $id, ')
          ..write('selectedSound: $selectedSound, ')
          ..write('tempo: $tempo')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $AppSettingsTable appSettings = $AppSettingsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [appSettings];
}

typedef $$AppSettingsTableCreateCompanionBuilder = AppSettingsCompanion
    Function({
  Value<int> id,
  required String selectedSound,
  required double tempo,
});
typedef $$AppSettingsTableUpdateCompanionBuilder = AppSettingsCompanion
    Function({
  Value<int> id,
  Value<String> selectedSound,
  Value<double> tempo,
});

class $$AppSettingsTableFilterComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get selectedSound => $composableBuilder(
      column: $table.selectedSound, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get tempo => $composableBuilder(
      column: $table.tempo, builder: (column) => ColumnFilters(column));
}

class $$AppSettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get selectedSound => $composableBuilder(
      column: $table.selectedSound,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get tempo => $composableBuilder(
      column: $table.tempo, builder: (column) => ColumnOrderings(column));
}

class $$AppSettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get selectedSound => $composableBuilder(
      column: $table.selectedSound, builder: (column) => column);

  GeneratedColumn<double> get tempo =>
      $composableBuilder(column: $table.tempo, builder: (column) => column);
}

class $$AppSettingsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AppSettingsTable,
    AppSetting,
    $$AppSettingsTableFilterComposer,
    $$AppSettingsTableOrderingComposer,
    $$AppSettingsTableAnnotationComposer,
    $$AppSettingsTableCreateCompanionBuilder,
    $$AppSettingsTableUpdateCompanionBuilder,
    (AppSetting, BaseReferences<_$AppDatabase, $AppSettingsTable, AppSetting>),
    AppSetting,
    PrefetchHooks Function()> {
  $$AppSettingsTableTableManager(_$AppDatabase db, $AppSettingsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppSettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppSettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppSettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> selectedSound = const Value.absent(),
            Value<double> tempo = const Value.absent(),
          }) =>
              AppSettingsCompanion(
            id: id,
            selectedSound: selectedSound,
            tempo: tempo,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String selectedSound,
            required double tempo,
          }) =>
              AppSettingsCompanion.insert(
            id: id,
            selectedSound: selectedSound,
            tempo: tempo,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AppSettingsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AppSettingsTable,
    AppSetting,
    $$AppSettingsTableFilterComposer,
    $$AppSettingsTableOrderingComposer,
    $$AppSettingsTableAnnotationComposer,
    $$AppSettingsTableCreateCompanionBuilder,
    $$AppSettingsTableUpdateCompanionBuilder,
    (AppSetting, BaseReferences<_$AppDatabase, $AppSettingsTable, AppSetting>),
    AppSetting,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$AppSettingsTableTableManager get appSettings =>
      $$AppSettingsTableTableManager(_db, _db.appSettings);
}
