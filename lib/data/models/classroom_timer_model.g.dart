// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'classroom_timer_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetClassroomTimerModelCollection on Isar {
  IsarCollection<ClassroomTimerModel> get classroomTimerModels =>
      this.collection();
}

const ClassroomTimerModelSchema = CollectionSchema(
  name: r'ClassroomTimerModel',
  id: 3303407679813462497,
  properties: {
    r'phases': PropertySchema(
      id: 0,
      name: r'phases',
      type: IsarType.objectList,
      target: r'PhaseModel',
    ),
    r'timerId': PropertySchema(
      id: 1,
      name: r'timerId',
      type: IsarType.string,
    ),
    r'title': PropertySchema(
      id: 2,
      name: r'title',
      type: IsarType.string,
    ),
    r'totalDurationMinutes': PropertySchema(
      id: 3,
      name: r'totalDurationMinutes',
      type: IsarType.long,
    )
  },
  estimateSize: _classroomTimerModelEstimateSize,
  serialize: _classroomTimerModelSerialize,
  deserialize: _classroomTimerModelDeserialize,
  deserializeProp: _classroomTimerModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'timerId': IndexSchema(
      id: 8924554985782586591,
      name: r'timerId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'timerId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {r'PhaseModel': PhaseModelSchema},
  getId: _classroomTimerModelGetId,
  getLinks: _classroomTimerModelGetLinks,
  attach: _classroomTimerModelAttach,
  version: '3.1.0+1',
);

int _classroomTimerModelEstimateSize(
  ClassroomTimerModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.phases.length * 3;
  {
    final offsets = allOffsets[PhaseModel]!;
    for (var i = 0; i < object.phases.length; i++) {
      final value = object.phases[i];
      bytesCount += PhaseModelSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.timerId.length * 3;
  bytesCount += 3 + object.title.length * 3;
  return bytesCount;
}

void _classroomTimerModelSerialize(
  ClassroomTimerModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<PhaseModel>(
    offsets[0],
    allOffsets,
    PhaseModelSchema.serialize,
    object.phases,
  );
  writer.writeString(offsets[1], object.timerId);
  writer.writeString(offsets[2], object.title);
  writer.writeLong(offsets[3], object.totalDurationMinutes);
}

ClassroomTimerModel _classroomTimerModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ClassroomTimerModel();
  object.id = id;
  object.phases = reader.readObjectList<PhaseModel>(
        offsets[0],
        PhaseModelSchema.deserialize,
        allOffsets,
        PhaseModel(),
      ) ??
      [];
  object.timerId = reader.readString(offsets[1]);
  object.title = reader.readString(offsets[2]);
  object.totalDurationMinutes = reader.readLong(offsets[3]);
  return object;
}

P _classroomTimerModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<PhaseModel>(
            offset,
            PhaseModelSchema.deserialize,
            allOffsets,
            PhaseModel(),
          ) ??
          []) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _classroomTimerModelGetId(ClassroomTimerModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _classroomTimerModelGetLinks(
    ClassroomTimerModel object) {
  return [];
}

void _classroomTimerModelAttach(
    IsarCollection<dynamic> col, Id id, ClassroomTimerModel object) {
  object.id = id;
}

extension ClassroomTimerModelByIndex on IsarCollection<ClassroomTimerModel> {
  Future<ClassroomTimerModel?> getByTimerId(String timerId) {
    return getByIndex(r'timerId', [timerId]);
  }

  ClassroomTimerModel? getByTimerIdSync(String timerId) {
    return getByIndexSync(r'timerId', [timerId]);
  }

  Future<bool> deleteByTimerId(String timerId) {
    return deleteByIndex(r'timerId', [timerId]);
  }

  bool deleteByTimerIdSync(String timerId) {
    return deleteByIndexSync(r'timerId', [timerId]);
  }

  Future<List<ClassroomTimerModel?>> getAllByTimerId(
      List<String> timerIdValues) {
    final values = timerIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'timerId', values);
  }

  List<ClassroomTimerModel?> getAllByTimerIdSync(List<String> timerIdValues) {
    final values = timerIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'timerId', values);
  }

  Future<int> deleteAllByTimerId(List<String> timerIdValues) {
    final values = timerIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'timerId', values);
  }

  int deleteAllByTimerIdSync(List<String> timerIdValues) {
    final values = timerIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'timerId', values);
  }

  Future<Id> putByTimerId(ClassroomTimerModel object) {
    return putByIndex(r'timerId', object);
  }

  Id putByTimerIdSync(ClassroomTimerModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'timerId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByTimerId(List<ClassroomTimerModel> objects) {
    return putAllByIndex(r'timerId', objects);
  }

  List<Id> putAllByTimerIdSync(List<ClassroomTimerModel> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'timerId', objects, saveLinks: saveLinks);
  }
}

extension ClassroomTimerModelQueryWhereSort
    on QueryBuilder<ClassroomTimerModel, ClassroomTimerModel, QWhere> {
  QueryBuilder<ClassroomTimerModel, ClassroomTimerModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ClassroomTimerModelQueryWhere
    on QueryBuilder<ClassroomTimerModel, ClassroomTimerModel, QWhereClause> {
  QueryBuilder<ClassroomTimerModel, ClassroomTimerModel, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ClassroomTimerModel, ClassroomTimerModel, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<ClassroomTimerModel, ClassroomTimerModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ClassroomTimerModel, ClassroomTimerModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ClassroomTimerModel, ClassroomTimerModel, QAfterWhereClause>
      idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ClassroomTimerModel, ClassroomTimerModel, QAfterWhereClause>
      timerIdEqualTo(String timerId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'timerId',
        value: [timerId],
      ));
    });
  }

  QueryBuilder<ClassroomTimerModel, ClassroomTimerModel, QAfterWhereClause>
      timerIdNotEqualTo(String timerId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'timerId',
              lower: [],
              upper: [timerId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'timerId',
              lower: [timerId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'timerId',
              lower: [timerId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'timerId',
              lower: [],
              upper: [timerId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension ClassroomTimerModelQueryFilter on QueryBuilder<ClassroomTimerModel,
    ClassroomTimerModel, QFilterCondition> {
  QueryBuilder<ClassroomTimerModel, ClassroomTimerModel, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ClassroomTimerModel, ClassroomTimerModel, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ClassroomTimerModel, ClassroomTimerModel, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ClassroomTimerModel, ClassroomTimerModel, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ClassroomTimerModel, ClassroomTimerModel, QAfterFilterCondition>
      phasesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'phases',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ClassroomTimerModel, ClassroomTimerModel, QAfterFilterCondition>
      phasesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'phases',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ClassroomTimerModel, ClassroomTimerModel, QAfterFilterCondition>
      phasesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'phases',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ClassroomTimerModel, ClassroomTimerModel, QAfterFilterCondition>
      phasesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'phases',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ClassroomTimerModel, ClassroomTimerModel, QAfterFilterCondition>
      phasesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'phases',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ClassroomTimerModel, ClassroomTimerModel, QAfterFilterCondition>
      phasesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'phases',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ClassroomTimerModel, ClassroomTimerModel, QAfterFilterCondition>
      timerIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClassroomTimerModel, ClassroomTimerModel, QAfterFilterCondition>
      timerIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClassroomTimerModel, ClassroomTimerModel, QAfterFilterCondition>
      timerIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClassroomTimerModel, ClassroomTimerModel, QAfterFilterCondition>
      timerIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timerId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClassroomTimerModel, ClassroomTimerModel, QAfterFilterCondition>
      timerIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'timerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClassroomTimerModel, ClassroomTimerModel, QAfterFilterCondition>
      timerIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'timerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClassroomTimerModel, ClassroomTimerModel, QAfterFilterCondition>
      timerIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'timerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClassroomTimerModel, ClassroomTimerModel, QAfterFilterCondition>
      timerIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'timerId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClassroomTimerModel, ClassroomTimerModel, QAfterFilterCondition>
      timerIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timerId',
        value: '',
      ));
    });
  }

  QueryBuilder<ClassroomTimerModel, ClassroomTimerModel, QAfterFilterCondition>
      timerIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'timerId',
        value: '',
      ));
    });
  }

  QueryBuilder<ClassroomTimerModel, ClassroomTimerModel, QAfterFilterCondition>
      titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClassroomTimerModel, ClassroomTimerModel, QAfterFilterCondition>
      titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClassroomTimerModel, ClassroomTimerModel, QAfterFilterCondition>
      titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClassroomTimerModel, ClassroomTimerModel, QAfterFilterCondition>
      titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClassroomTimerModel, ClassroomTimerModel, QAfterFilterCondition>
      titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClassroomTimerModel, ClassroomTimerModel, QAfterFilterCondition>
      titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClassroomTimerModel, ClassroomTimerModel, QAfterFilterCondition>
      titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClassroomTimerModel, ClassroomTimerModel, QAfterFilterCondition>
      titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ClassroomTimerModel, ClassroomTimerModel, QAfterFilterCondition>
      titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<ClassroomTimerModel, ClassroomTimerModel, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<ClassroomTimerModel, ClassroomTimerModel, QAfterFilterCondition>
      totalDurationMinutesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalDurationMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<ClassroomTimerModel, ClassroomTimerModel, QAfterFilterCondition>
      totalDurationMinutesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalDurationMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<ClassroomTimerModel, ClassroomTimerModel, QAfterFilterCondition>
      totalDurationMinutesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalDurationMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<ClassroomTimerModel, ClassroomTimerModel, QAfterFilterCondition>
      totalDurationMinutesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalDurationMinutes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ClassroomTimerModelQueryObject on QueryBuilder<ClassroomTimerModel,
    ClassroomTimerModel, QFilterCondition> {
  QueryBuilder<ClassroomTimerModel, ClassroomTimerModel, QAfterFilterCondition>
      phasesElement(FilterQuery<PhaseModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'phases');
    });
  }
}

extension ClassroomTimerModelQueryLinks on QueryBuilder<ClassroomTimerModel,
    ClassroomTimerModel, QFilterCondition> {}

extension ClassroomTimerModelQuerySortBy
    on QueryBuilder<ClassroomTimerModel, ClassroomTimerModel, QSortBy> {
  QueryBuilder<ClassroomTimerModel, ClassroomTimerModel, QAfterSortBy>
      sortByTimerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timerId', Sort.asc);
    });
  }

  QueryBuilder<ClassroomTimerModel, ClassroomTimerModel, QAfterSortBy>
      sortByTimerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timerId', Sort.desc);
    });
  }

  QueryBuilder<ClassroomTimerModel, ClassroomTimerModel, QAfterSortBy>
      sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<ClassroomTimerModel, ClassroomTimerModel, QAfterSortBy>
      sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<ClassroomTimerModel, ClassroomTimerModel, QAfterSortBy>
      sortByTotalDurationMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDurationMinutes', Sort.asc);
    });
  }

  QueryBuilder<ClassroomTimerModel, ClassroomTimerModel, QAfterSortBy>
      sortByTotalDurationMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDurationMinutes', Sort.desc);
    });
  }
}

extension ClassroomTimerModelQuerySortThenBy
    on QueryBuilder<ClassroomTimerModel, ClassroomTimerModel, QSortThenBy> {
  QueryBuilder<ClassroomTimerModel, ClassroomTimerModel, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ClassroomTimerModel, ClassroomTimerModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ClassroomTimerModel, ClassroomTimerModel, QAfterSortBy>
      thenByTimerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timerId', Sort.asc);
    });
  }

  QueryBuilder<ClassroomTimerModel, ClassroomTimerModel, QAfterSortBy>
      thenByTimerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timerId', Sort.desc);
    });
  }

  QueryBuilder<ClassroomTimerModel, ClassroomTimerModel, QAfterSortBy>
      thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<ClassroomTimerModel, ClassroomTimerModel, QAfterSortBy>
      thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<ClassroomTimerModel, ClassroomTimerModel, QAfterSortBy>
      thenByTotalDurationMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDurationMinutes', Sort.asc);
    });
  }

  QueryBuilder<ClassroomTimerModel, ClassroomTimerModel, QAfterSortBy>
      thenByTotalDurationMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalDurationMinutes', Sort.desc);
    });
  }
}

extension ClassroomTimerModelQueryWhereDistinct
    on QueryBuilder<ClassroomTimerModel, ClassroomTimerModel, QDistinct> {
  QueryBuilder<ClassroomTimerModel, ClassroomTimerModel, QDistinct>
      distinctByTimerId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timerId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClassroomTimerModel, ClassroomTimerModel, QDistinct>
      distinctByTitle({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ClassroomTimerModel, ClassroomTimerModel, QDistinct>
      distinctByTotalDurationMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalDurationMinutes');
    });
  }
}

extension ClassroomTimerModelQueryProperty
    on QueryBuilder<ClassroomTimerModel, ClassroomTimerModel, QQueryProperty> {
  QueryBuilder<ClassroomTimerModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ClassroomTimerModel, List<PhaseModel>, QQueryOperations>
      phasesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phases');
    });
  }

  QueryBuilder<ClassroomTimerModel, String, QQueryOperations>
      timerIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timerId');
    });
  }

  QueryBuilder<ClassroomTimerModel, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<ClassroomTimerModel, int, QQueryOperations>
      totalDurationMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalDurationMinutes');
    });
  }
}
