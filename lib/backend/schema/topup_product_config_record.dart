import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TopupProductConfigRecord extends FirestoreRecord {
  TopupProductConfigRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "produce_code" field.
  List<String>? _produceCode;
  List<String> get produceCode => _produceCode ?? const [];
  bool hasProduceCode() => _produceCode != null;

  // "product_img" field.
  List<String>? _productImg;
  List<String> get productImg => _productImg ?? const [];
  bool hasProductImg() => _productImg != null;

  // "product_img_hash" field.
  List<String>? _productImgHash;
  List<String> get productImgHash => _productImgHash ?? const [];
  bool hasProductImgHash() => _productImgHash != null;

  void _initializeFields() {
    _produceCode = getDataList(snapshotData['produce_code']);
    _productImg = getDataList(snapshotData['product_img']);
    _productImgHash = getDataList(snapshotData['product_img_hash']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('topup_product_config');

  static Stream<TopupProductConfigRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TopupProductConfigRecord.fromSnapshot(s));

  static Future<TopupProductConfigRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => TopupProductConfigRecord.fromSnapshot(s));

  static TopupProductConfigRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TopupProductConfigRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TopupProductConfigRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TopupProductConfigRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TopupProductConfigRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TopupProductConfigRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTopupProductConfigRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class TopupProductConfigRecordDocumentEquality
    implements Equality<TopupProductConfigRecord> {
  const TopupProductConfigRecordDocumentEquality();

  @override
  bool equals(TopupProductConfigRecord? e1, TopupProductConfigRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.produceCode, e2?.produceCode) &&
        listEquality.equals(e1?.productImg, e2?.productImg) &&
        listEquality.equals(e1?.productImgHash, e2?.productImgHash);
  }

  @override
  int hash(TopupProductConfigRecord? e) => const ListEquality()
      .hash([e?.produceCode, e?.productImg, e?.productImgHash]);

  @override
  bool isValidKey(Object? o) => o is TopupProductConfigRecord;
}
