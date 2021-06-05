import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'products_record.g.dart';

abstract class ProductsRecord
    implements Built<ProductsRecord, ProductsRecordBuilder> {
  static Serializer<ProductsRecord> get serializer =>
      _$productsRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'photo_url')
  String get photoUrl;

  @nullable
  String get uid;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  Timestamp get createdTime;

  @nullable
  int get price;

  @nullable
  @BuiltValueField(wireName: 'display_name')
  String get displayName;

  @nullable
  @BuiltValueField(wireName: 'qr_id')
  String get qrId;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ProductsRecordBuilder builder) => builder
    ..photoUrl = ''
    ..uid = ''
    ..price = 0
    ..displayName = ''
    ..qrId = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('products');

  static Stream<ProductsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ProductsRecord._();
  factory ProductsRecord([void Function(ProductsRecordBuilder) updates]) =
      _$ProductsRecord;
}

Map<String, dynamic> createProductsRecordData({
  String photoUrl,
  String uid,
  Timestamp createdTime,
  int price,
  String displayName,
  String qrId,
}) =>
    serializers.serializeWith(
        ProductsRecord.serializer,
        ProductsRecord((p) => p
          ..photoUrl = photoUrl
          ..uid = uid
          ..createdTime = createdTime
          ..price = price
          ..displayName = displayName
          ..qrId = qrId));

ProductsRecord get dummyProductsRecord {
  final builder = ProductsRecordBuilder()
    ..photoUrl = dummyImagePath
    ..uid = dummyString
    ..createdTime = dummyTimestamp
    ..price = dummyInteger
    ..displayName = dummyString
    ..qrId = dummyString;
  return builder.build();
}

List<ProductsRecord> createDummyProductsRecord({int count}) =>
    List.generate(count, (_) => dummyProductsRecord);
