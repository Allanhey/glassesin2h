import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'addresslist_record.g.dart';

abstract class AddresslistRecord
    implements Built<AddresslistRecord, AddresslistRecordBuilder> {
  static Serializer<AddresslistRecord> get serializer =>
      _$addresslistRecordSerializer;

  @nullable
  String get listedaddress;

  @nullable
  String get useraddress;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(AddresslistRecordBuilder builder) => builder
    ..listedaddress = ''
    ..useraddress = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('addresslist');

  static Stream<AddresslistRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  AddresslistRecord._();
  factory AddresslistRecord([void Function(AddresslistRecordBuilder) updates]) =
      _$AddresslistRecord;

  static AddresslistRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(
          serializer, {...data, kDocumentReferenceField: reference});
}

Map<String, dynamic> createAddresslistRecordData({
  String listedaddress,
  String useraddress,
}) =>
    serializers.toFirestore(
        AddresslistRecord.serializer,
        AddresslistRecord((a) => a
          ..listedaddress = listedaddress
          ..useraddress = useraddress));
