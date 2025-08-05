// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class QrCodeDataTypeStruct extends FFFirebaseStruct {
  QrCodeDataTypeStruct({
    String? prefix,
    String? suffix,
    String? taxId,
    String? ref1,
    String? ref2,
    int? yield,
    int? collectionFee,
    int? penaltyFee,
    String? carRegistration,
    String? contNo,
    String? topupAmountWithComma,
    String? currentDate,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _prefix = prefix,
        _suffix = suffix,
        _taxId = taxId,
        _ref1 = ref1,
        _ref2 = ref2,
        _yield = yield,
        _collectionFee = collectionFee,
        _penaltyFee = penaltyFee,
        _carRegistration = carRegistration,
        _contNo = contNo,
        _topupAmountWithComma = topupAmountWithComma,
        _currentDate = currentDate,
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

  // "yield" field.
  int? _yield;
  int get yield => _yield ?? 0;
  set yield(int? val) => _yield = val;

  void incrementYield(int amount) => yield = yield + amount;

  bool hasYield() => _yield != null;

  // "collection_fee" field.
  int? _collectionFee;
  int get collectionFee => _collectionFee ?? 0;
  set collectionFee(int? val) => _collectionFee = val;

  void incrementCollectionFee(int amount) =>
      collectionFee = collectionFee + amount;

  bool hasCollectionFee() => _collectionFee != null;

  // "penalty_fee" field.
  int? _penaltyFee;
  int get penaltyFee => _penaltyFee ?? 0;
  set penaltyFee(int? val) => _penaltyFee = val;

  void incrementPenaltyFee(int amount) => penaltyFee = penaltyFee + amount;

  bool hasPenaltyFee() => _penaltyFee != null;

  // "car_registration" field.
  String? _carRegistration;
  String get carRegistration => _carRegistration ?? '';
  set carRegistration(String? val) => _carRegistration = val;

  bool hasCarRegistration() => _carRegistration != null;

  // "cont_no" field.
  String? _contNo;
  String get contNo => _contNo ?? '';
  set contNo(String? val) => _contNo = val;

  bool hasContNo() => _contNo != null;

  // "topupAmountWithComma" field.
  String? _topupAmountWithComma;
  String get topupAmountWithComma => _topupAmountWithComma ?? '';
  set topupAmountWithComma(String? val) => _topupAmountWithComma = val;

  bool hasTopupAmountWithComma() => _topupAmountWithComma != null;

  // "current_date" field.
  String? _currentDate;
  String get currentDate => _currentDate ?? '';
  set currentDate(String? val) => _currentDate = val;

  bool hasCurrentDate() => _currentDate != null;

  static QrCodeDataTypeStruct fromMap(Map<String, dynamic> data) =>
      QrCodeDataTypeStruct(
        prefix: data['prefix'] as String?,
        suffix: data['suffix'] as String?,
        taxId: data['tax_id'] as String?,
        ref1: data['ref1'] as String?,
        ref2: data['ref2'] as String?,
        yield: castToType<int>(data['yield']),
        collectionFee: castToType<int>(data['collection_fee']),
        penaltyFee: castToType<int>(data['penalty_fee']),
        carRegistration: data['car_registration'] as String?,
        contNo: data['cont_no'] as String?,
        topupAmountWithComma: data['topupAmountWithComma'] as String?,
        currentDate: data['current_date'] as String?,
      );

  static QrCodeDataTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? QrCodeDataTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'prefix': _prefix,
        'suffix': _suffix,
        'tax_id': _taxId,
        'ref1': _ref1,
        'ref2': _ref2,
        'yield': _yield,
        'collection_fee': _collectionFee,
        'penalty_fee': _penaltyFee,
        'car_registration': _carRegistration,
        'cont_no': _contNo,
        'topupAmountWithComma': _topupAmountWithComma,
        'current_date': _currentDate,
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
        'yield': serializeParam(
          _yield,
          ParamType.int,
        ),
        'collection_fee': serializeParam(
          _collectionFee,
          ParamType.int,
        ),
        'penalty_fee': serializeParam(
          _penaltyFee,
          ParamType.int,
        ),
        'car_registration': serializeParam(
          _carRegistration,
          ParamType.String,
        ),
        'cont_no': serializeParam(
          _contNo,
          ParamType.String,
        ),
        'topupAmountWithComma': serializeParam(
          _topupAmountWithComma,
          ParamType.String,
        ),
        'current_date': serializeParam(
          _currentDate,
          ParamType.String,
        ),
      }.withoutNulls;

  static QrCodeDataTypeStruct fromSerializableMap(Map<String, dynamic> data) =>
      QrCodeDataTypeStruct(
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
        yield: deserializeParam(
          data['yield'],
          ParamType.int,
          false,
        ),
        collectionFee: deserializeParam(
          data['collection_fee'],
          ParamType.int,
          false,
        ),
        penaltyFee: deserializeParam(
          data['penalty_fee'],
          ParamType.int,
          false,
        ),
        carRegistration: deserializeParam(
          data['car_registration'],
          ParamType.String,
          false,
        ),
        contNo: deserializeParam(
          data['cont_no'],
          ParamType.String,
          false,
        ),
        topupAmountWithComma: deserializeParam(
          data['topupAmountWithComma'],
          ParamType.String,
          false,
        ),
        currentDate: deserializeParam(
          data['current_date'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'QrCodeDataTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is QrCodeDataTypeStruct &&
        prefix == other.prefix &&
        suffix == other.suffix &&
        taxId == other.taxId &&
        ref1 == other.ref1 &&
        ref2 == other.ref2 &&
        yield == other.yield &&
        collectionFee == other.collectionFee &&
        penaltyFee == other.penaltyFee &&
        carRegistration == other.carRegistration &&
        contNo == other.contNo &&
        topupAmountWithComma == other.topupAmountWithComma &&
        currentDate == other.currentDate;
  }

  @override
  int get hashCode => const ListEquality().hash([
        prefix,
        suffix,
        taxId,
        ref1,
        ref2,
        yield,
        collectionFee,
        penaltyFee,
        carRegistration,
        contNo,
        topupAmountWithComma,
        currentDate
      ]);
}

QrCodeDataTypeStruct createQrCodeDataTypeStruct({
  String? prefix,
  String? suffix,
  String? taxId,
  String? ref1,
  String? ref2,
  int? yield,
  int? collectionFee,
  int? penaltyFee,
  String? carRegistration,
  String? contNo,
  String? topupAmountWithComma,
  String? currentDate,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    QrCodeDataTypeStruct(
      prefix: prefix,
      suffix: suffix,
      taxId: taxId,
      ref1: ref1,
      ref2: ref2,
      yield: yield,
      collectionFee: collectionFee,
      penaltyFee: penaltyFee,
      carRegistration: carRegistration,
      contNo: contNo,
      topupAmountWithComma: topupAmountWithComma,
      currentDate: currentDate,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

QrCodeDataTypeStruct? updateQrCodeDataTypeStruct(
  QrCodeDataTypeStruct? qrCodeDataType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    qrCodeDataType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addQrCodeDataTypeStructData(
  Map<String, dynamic> firestoreData,
  QrCodeDataTypeStruct? qrCodeDataType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (qrCodeDataType == null) {
    return;
  }
  if (qrCodeDataType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && qrCodeDataType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final qrCodeDataTypeData =
      getQrCodeDataTypeFirestoreData(qrCodeDataType, forFieldValue);
  final nestedData =
      qrCodeDataTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = qrCodeDataType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getQrCodeDataTypeFirestoreData(
  QrCodeDataTypeStruct? qrCodeDataType, [
  bool forFieldValue = false,
]) {
  if (qrCodeDataType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(qrCodeDataType.toMap());

  // Add any Firestore field values
  qrCodeDataType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getQrCodeDataTypeListFirestoreData(
  List<QrCodeDataTypeStruct>? qrCodeDataTypes,
) =>
    qrCodeDataTypes
        ?.map((e) => getQrCodeDataTypeFirestoreData(e, true))
        .toList() ??
    [];
