// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projects_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ProjectsRecord> _$projectsRecordSerializer =
    new _$ProjectsRecordSerializer();

class _$ProjectsRecordSerializer
    implements StructuredSerializer<ProjectsRecord> {
  @override
  final Iterable<Type> types = const [ProjectsRecord, _$ProjectsRecord];
  @override
  final String wireName = 'ProjectsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, ProjectsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.projectName;
    if (value != null) {
      result
        ..add('projectName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.projectLocation;
    if (value != null) {
      result
        ..add('projectLocation')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.projectCity;
    if (value != null) {
      result
        ..add('projectCity')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.projectDesc;
    if (value != null) {
      result
        ..add('projectDesc')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lastModified;
    if (value != null) {
      result
        ..add('lastModified')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.active;
    if (value != null) {
      result
        ..add('active')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    return result;
  }

  @override
  ProjectsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProjectsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'projectName':
          result.projectName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'projectLocation':
          result.projectLocation = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng;
          break;
        case 'projectCity':
          result.projectCity = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'projectDesc':
          result.projectDesc = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'lastModified':
          result.lastModified = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'active':
          result.active = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
      }
    }

    return result.build();
  }
}

class _$ProjectsRecord extends ProjectsRecord {
  @override
  final String projectName;
  @override
  final LatLng projectLocation;
  @override
  final String projectCity;
  @override
  final String projectDesc;
  @override
  final DateTime lastModified;
  @override
  final bool active;
  @override
  final DocumentReference<Object> reference;

  factory _$ProjectsRecord([void Function(ProjectsRecordBuilder) updates]) =>
      (new ProjectsRecordBuilder()..update(updates)).build();

  _$ProjectsRecord._(
      {this.projectName,
      this.projectLocation,
      this.projectCity,
      this.projectDesc,
      this.lastModified,
      this.active,
      this.reference})
      : super._();

  @override
  ProjectsRecord rebuild(void Function(ProjectsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProjectsRecordBuilder toBuilder() =>
      new ProjectsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProjectsRecord &&
        projectName == other.projectName &&
        projectLocation == other.projectLocation &&
        projectCity == other.projectCity &&
        projectDesc == other.projectDesc &&
        lastModified == other.lastModified &&
        active == other.active &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc(0, projectName.hashCode),
                            projectLocation.hashCode),
                        projectCity.hashCode),
                    projectDesc.hashCode),
                lastModified.hashCode),
            active.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ProjectsRecord')
          ..add('projectName', projectName)
          ..add('projectLocation', projectLocation)
          ..add('projectCity', projectCity)
          ..add('projectDesc', projectDesc)
          ..add('lastModified', lastModified)
          ..add('active', active)
          ..add('reference', reference))
        .toString();
  }
}

class ProjectsRecordBuilder
    implements Builder<ProjectsRecord, ProjectsRecordBuilder> {
  _$ProjectsRecord _$v;

  String _projectName;
  String get projectName => _$this._projectName;
  set projectName(String projectName) => _$this._projectName = projectName;

  LatLng _projectLocation;
  LatLng get projectLocation => _$this._projectLocation;
  set projectLocation(LatLng projectLocation) =>
      _$this._projectLocation = projectLocation;

  String _projectCity;
  String get projectCity => _$this._projectCity;
  set projectCity(String projectCity) => _$this._projectCity = projectCity;

  String _projectDesc;
  String get projectDesc => _$this._projectDesc;
  set projectDesc(String projectDesc) => _$this._projectDesc = projectDesc;

  DateTime _lastModified;
  DateTime get lastModified => _$this._lastModified;
  set lastModified(DateTime lastModified) =>
      _$this._lastModified = lastModified;

  bool _active;
  bool get active => _$this._active;
  set active(bool active) => _$this._active = active;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  ProjectsRecordBuilder() {
    ProjectsRecord._initializeBuilder(this);
  }

  ProjectsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _projectName = $v.projectName;
      _projectLocation = $v.projectLocation;
      _projectCity = $v.projectCity;
      _projectDesc = $v.projectDesc;
      _lastModified = $v.lastModified;
      _active = $v.active;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProjectsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProjectsRecord;
  }

  @override
  void update(void Function(ProjectsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ProjectsRecord build() {
    final _$result = _$v ??
        new _$ProjectsRecord._(
            projectName: projectName,
            projectLocation: projectLocation,
            projectCity: projectCity,
            projectDesc: projectDesc,
            lastModified: lastModified,
            active: active,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
