// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class BarcodeDetailsStruct extends FFFirebaseStruct {
  BarcodeDetailsStruct({
    String? prefix,
    String? suffix,
    String? taxId,
    String? ref1,
    String? ref2,
    String? fullBarcode,
    String? comcode,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _prefix = prefix,
        _suffix = suffix,
        _taxId = taxId,
        _ref1 = ref1,
        _ref2 = ref2,
        _fullBarcode = fullBarcode,
        _comcode = comcode,
        super(firestoreUtilData);

  // "prefix" field.
  String? _prefix;
  String get prefix => _prefix ?? '';
  set prefix(String? val) => _prefix = val;

  bool hasPrefix() => _prefix != null;

  // "suffix" field.
  String? _suffix;
  String get suffix => _suffix ?? '';
  set suffix(String? val) => _suffix = val;

  bool hasSuffix() => _suffix != null;

  // "tax_id" field.
  String? _taxId;
  String get taxId => _taxId ?? '';
  set taxId(String? val) => _taxId = val;

  bool hasTaxId() => _taxId != null;

  // "ref1" field.
  String? _ref1;
  String get ref1 => _ref1 ?? '';
  set ref1(String? val) => _ref1 = val;

  bool hasRef1() => _ref1 != null;

  // "ref2" field.
  String? _ref2;
  String get ref2 => _ref2 ?? '';
  set ref2(String? val) => _ref2 = val;

  bool hasRef2() => _ref2 != null;

  // "full_barcode" field.
  String? _fullBarcode;
  String get fullBarcode => _fullBarcode ?? '';
  set fullBarcode(String? val) => _fullBarcode = val;

  bool hasFullBarcode() => _fullBarcode != null;

  // "comcode" field.
  String? _comcode;
  String get comcode => _comcode ?? '';
  set comcode(String? val) => _comcode = val;

  bool hasComcode() => _comcode != null;

  static BarcodeDetailsStruct fromMap(Map<String, dynamic> data) =>
      BarcodeDetailsStruct(
        prefix: data['prefix'] as String?,
        suffix: data['suffix'] as String?,
        taxId: data['tax_id'] as String?,
        ref1: data['ref1'] as String?,
        ref2: data['ref2'] as String?,
        fullBarcode: data['full_barcode'] as String?,
        comcode: data['comcode'] as String?,
      );

  static BarcodeDetailsStruct? maybeFromMap(dynamic data) => data is Map
      ? BarcodeDetailsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'prefix': _prefix,
        'suffix': _suffix,
        'tax_id': _taxId,
        'ref1': _ref1,
        'ref2': _ref2,
        'full_barcode': _fullBarcode,
        'comcode': _comcode,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'prefix': serializeParam(
          _prefix,
          ParamType.String,
        ),
        'suffix': serializeParam(
          _suffix,
          ParamType.String,
        ),
        'tax_id': serializeParam(
          _taxId,
          ParamType.String,
        ),
        'ref1': serializeParam(
          _ref1,
          ParamType.String,
        ),
        'ref2': serializeParam(
          _ref2,
          ParamType.String,
        ),
        'full_barcode': serializeParam(
          _fullBarcode,
          ParamType.String,
        ),
        'comcode': serializeParam(
          _comcode,
          ParamType.String,
        ),
      }.withoutNulls;

  static BarcodeDetailsStruct fromSerializableMap(Map<String, dynamic> data) =>
      BarcodeDetailsStruct(
        prefix: deserializeParam(
          data['prefix'],
          ParamType.String,
          false,
        ),
        suffix: deserializeParam(
          data['suffix'],
          ParamType.String,
          false,
        ),
        taxId: deserializeParam(
          data['tax_id'],
          ParamType.String,
          false,
        ),
        ref1: deserializeParam(
          data['ref1'],
          ParamType.String,
          false,
        ),
        ref2: deserializeParam(
          data['ref2'],
          ParamType.String,
          false,
        ),
        fullBarcode: deserializeParam(
          data['full_barcode'],
          ParamType.String,
          false,
        ),
        comcode: deserializeParam(
          data['comcode'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'BarcodeDetailsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BarcodeDetailsStruct &&
        prefix == other.prefix &&
        suffix == other.suffix &&
        taxId == other.taxId &&
        ref1 == other.ref1 &&
        ref2 == other.ref2 &&
        fullBarcode == other.fullBarcode &&
        comcode == other.comcode;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([prefix, suffix, taxId, ref1, ref2, fullBarcode, comcode]);
}

BarcodeDetailsStruct createBarcodeDetailsStruct({
  String? prefix,
  String? suffix,
  String? taxId,
  String? ref1,
  String? ref2,
  String? fullBarcode,
  String? comcode,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BarcodeDetailsStruct(
      prefix: prefix,
      suffix: suffix,
      taxId: taxId,
      ref1: ref1,
      ref2: ref2,
      fullBarcode: fullBarcode,
      comcode: comcode,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BarcodeDetailsStruct? updateBarcodeDetailsStruct(
  BarcodeDetailsStruct? barcodeDetails, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    barcodeDetails
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBarcodeDetailsStructData(
  Map<String, dynamic> firestoreData,
  BarcodeDetailsStruct? barcodeDetails,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (barcodeDetails == null) {
    return;
  }
  if (barcodeDetails.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && barcodeDetails.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final barcodeDetailsData =
      getBarcodeDetailsFirestoreData(barcodeDetails, forFieldValue);
  final nestedData =
      barcodeDetailsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = barcodeDetails.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBarcodeDetailsFirestoreData(
  BarcodeDetailsStruct? barcodeDetails, [
  bool forFieldValue = false,
]) {
  if (barcodeDetails == null) {
    return {};
  }
  final firestoreData = mapToFirestore(barcodeDetails.toMap());

  // Add any Firestore field values
  barcodeDetails.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBarcodeDetailsListFirestoreData(
  List<BarcodeDetailsStruct>? barcodeDetailss,
) =>
    barcodeDetailss
        ?.map((e) => getBarcodeDetailsFirestoreData(e, true))
        .toList() ??
    [];
