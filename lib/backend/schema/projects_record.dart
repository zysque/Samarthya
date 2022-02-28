import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'projects_record.g.dart';

abstract class ProjectsRecord
    implements Built<ProjectsRecord, ProjectsRecordBuilder> {
  static Serializer<ProjectsRecord> get serializer =>
      _$projectsRecordSerializer;

  @nullable
  String get projectName;

  @nullable
  LatLng get projectLocation;

  @nullable
  String get projectCity;

  @nullable
  String get projectDesc;

  @nullable
  DateTime get lastModified;

  @nullable
  bool get active;

  @nullable
  BuiltList<String> get photos;

  @nullable
  BuiltList<String> get videos;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ProjectsRecordBuilder builder) => builder
    ..projectName = ''
    ..projectCity = ''
    ..projectDesc = ''
    ..active = false
    ..photos = ListBuilder()
    ..videos = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('projects');

  static Stream<ProjectsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ProjectsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ProjectsRecord._();
  factory ProjectsRecord([void Function(ProjectsRecordBuilder) updates]) =
      _$ProjectsRecord;

  static ProjectsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createProjectsRecordData({
  String projectName,
  LatLng projectLocation,
  String projectCity,
  String projectDesc,
  DateTime lastModified,
  bool active,
}) =>
    serializers.toFirestore(
        ProjectsRecord.serializer,
        ProjectsRecord((p) => p
          ..projectName = projectName
          ..projectLocation = projectLocation
          ..projectCity = projectCity
          ..projectDesc = projectDesc
          ..lastModified = lastModified
          ..active = active
          ..photos = null
          ..videos = null));
