import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'frames_record.g.dart';

abstract class FramesRecord
    implements Built<FramesRecord, FramesRecordBuilder> {
  static Serializer<FramesRecord> get serializer => _$framesRecordSerializer;

  @nullable
  String get modelname;

  @nullable
  String get glasseimg;

  @nullable
  String get price;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(FramesRecordBuilder builder) => builder
    ..modelname = ''
    ..glasseimg = ''
    ..price = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('frames');

  static Stream<FramesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  FramesRecord._();
  factory FramesRecord([void Function(FramesRecordBuilder) updates]) =
      _$FramesRecord;

  static FramesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createFramesRecordData({
  String modelname,
  String glasseimg,
  String price,
}) =>
    serializers.toFirestore(
        FramesRecord.serializer,
        FramesRecord((f) => f
          ..modelname = modelname
          ..glasseimg = glasseimg
          ..price = price));
