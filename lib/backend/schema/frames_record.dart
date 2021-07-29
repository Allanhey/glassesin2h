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
  String get price;

  @nullable
  String get glasseimg;

  @nullable
  String get color;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(FramesRecordBuilder builder) => builder
    ..modelname = ''
    ..price = ''
    ..glasseimg = ''
    ..color = '';

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
  String price,
  String glasseimg,
  String color,
}) =>
    serializers.toFirestore(
        FramesRecord.serializer,
        FramesRecord((f) => f
          ..modelname = modelname
          ..price = price
          ..glasseimg = glasseimg
          ..color = color));
