// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class BankMasterModelStruct extends FFFirebaseStruct {
  BankMasterModelStruct({
    int? bankId,
    String? bankCode,
    String? bankNameTh,
    String? bankNameEn,
    String? deleted,
    String? createdAt,
    String? createdUserid,
    String? updatedAt,
    String? updatedUserid,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _bankId = bankId,
        _bankCode = bankCode,
        _bankNameTh = bankNameTh,
        _bankNameEn = bankNameEn,
        _deleted = deleted,
        _createdAt = createdAt,
        _createdUserid = createdUserid,
        _updatedAt = updatedAt,
        _updatedUserid = updatedUserid,
        super(firestoreUtilData);

  // "bank_id" field.
  int? _bankId;
  int get bankId => _bankId ?? 0;
  set bankId(int? val) => _bankId = val;

  void incrementBankId(int amount) => bankId = bankId + amount;

  bool hasBankId() => _bankId != null;

  // "bank_code" field.
  String? _bankCode;
  String get bankCode => _bankCode ?? '';
  set bankCode(String? val) => _bankCode = val;

  bool hasBankCode() => _bankCode != null;

  // "bank_name_th" field.
  String? _bankNameTh;
  String get bankNameTh => _bankNameTh ?? '';
  set bankNameTh(String? val) => _bankNameTh = val;

  bool hasBankNameTh() => _bankNameTh != null;

  // "bank_name_en" field.
  String? _bankNameEn;
  String get bankNameEn => _bankNameEn ?? '';
  set bankNameEn(String? val) => _bankNameEn = val;

  bool hasBankNameEn() => _bankNameEn != null;

  // "deleted" field.
  String? _deleted;
  String get deleted => _deleted ?? '';
  set deleted(String? val) => _deleted = val;

  bool hasDeleted() => _deleted != null;

  // "created_at" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '';
  set createdAt(String? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "created_userid" field.
  String? _createdUserid;
  String get createdUserid => _createdUserid ?? '';
  set createdUserid(String? val) => _createdUserid = val;

  bool hasCreatedUserid() => _createdUserid != null;

  // "updated_at" field.
  String? _updatedAt;
  String get updatedAt => _updatedAt ?? '';
  set updatedAt(String? val) => _updatedAt = val;

  bool hasUpdatedAt() => _updatedAt != null;

  // "updated_userid" field.
  String? _updatedUserid;
  String get updatedUserid => _updatedUserid ?? '';
  set updatedUserid(String? val) => _updatedUserid = val;

  bool hasUpdatedUserid() => _updatedUserid != null;

  static BankMasterModelStruct fromMap(Map<String, dynamic> data) =>
      BankMasterModelStruct(
        bankId: castToType<int>(data['bank_id']),
        bankCode: data['bank_code'] as String?,
        bankNameTh: data['bank_name_th'] as String?,
        bankNameEn: data['bank_name_en'] as String?,
        deleted: data['deleted'] as String?,
        createdAt: data['created_at'] as String?,
        createdUserid: data['created_userid'] as String?,
        updatedAt: data['updated_at'] as String?,
        updatedUserid: data['updated_userid'] as String?,
      );

  static BankMasterModelStruct? maybeFromMap(dynamic data) => data is Map
      ? BankMasterModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'bank_id': _bankId,
        'bank_code': _bankCode,
        'bank_name_th': _bankNameTh,
        'bank_name_en': _bankNameEn,
        'deleted': _deleted,
        'created_at': _createdAt,
        'created_userid': _createdUserid,
        'updated_at': _updatedAt,
        'updated_userid': _updatedUserid,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'bank_id': serializeParam(
          _bankId,
          ParamType.int,
        ),
        'bank_code': serializeParam(
          _bankCode,
          ParamType.String,
        ),
        'bank_name_th': serializeParam(
          _bankNameTh,
          ParamType.String,
        ),
        'bank_name_en': serializeParam(
          _bankNameEn,
          ParamType.String,
        ),
        'deleted': serializeParam(
          _deleted,
          ParamType.String,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.String,
        ),
        'created_userid': serializeParam(
          _createdUserid,
          ParamType.String,
        ),
        'updated_at': serializeParam(
          _updatedAt,
          ParamType.String,
        ),
        'updated_userid': serializeParam(
          _updatedUserid,
          ParamType.String,
        ),
      }.withoutNulls;

  static BankMasterModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      BankMasterModelStruct(
        bankId: deserializeParam(
          data['bank_id'],
          ParamType.int,
          false,
        ),
        bankCode: deserializeParam(
          data['bank_code'],
          ParamType.String,
          false,
        ),
        bankNameTh: deserializeParam(
          data['bank_name_th'],
          ParamType.String,
          false,
        ),
        bankNameEn: deserializeParam(
          data['bank_name_en'],
          ParamType.String,
          false,
        ),
        deleted: deserializeParam(
          data['deleted'],
          ParamType.String,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.String,
          false,
        ),
        createdUserid: deserializeParam(
          data['created_userid'],
          ParamType.String,
          false,
        ),
        updatedAt: deserializeParam(
          data['updated_at'],
          ParamType.String,
          false,
        ),
        updatedUserid: deserializeParam(
          data['updated_userid'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'BankMasterModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BankMasterModelStruct &&
        bankId == other.bankId &&
        bankCode == other.bankCode &&
        bankNameTh == other.bankNameTh &&
        bankNameEn == other.bankNameEn &&
        deleted == other.deleted &&
        createdAt == other.createdAt &&
        createdUserid == other.createdUserid &&
        updatedAt == other.updatedAt &&
        updatedUserid == other.updatedUserid;
  }

  @override
  int get hashCode => const ListEquality().hash([
        bankId,
        bankCode,
        bankNameTh,
        bankNameEn,
        deleted,
        createdAt,
        createdUserid,
        updatedAt,
        updatedUserid
      ]);
}

BankMasterModelStruct createBankMasterModelStruct({
  int? bankId,
  String? bankCode,
  String? bankNameTh,
  String? bankNameEn,
  String? deleted,
  String? createdAt,
  String? createdUserid,
  String? updatedAt,
  String? updatedUserid,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BankMasterModelStruct(
      bankId: bankId,
      bankCode: bankCode,
      bankNameTh: bankNameTh,
      bankNameEn: bankNameEn,
      deleted: deleted,
      createdAt: createdAt,
      createdUserid: createdUserid,
      updatedAt: updatedAt,
      updatedUserid: updatedUserid,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BankMasterModelStruct? updateBankMasterModelStruct(
  BankMasterModelStruct? bankMasterModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    bankMasterModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBankMasterModelStructData(
  Map<String, dynamic> firestoreData,
  BankMasterModelStruct? bankMasterModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (bankMasterModel == null) {
    return;
  }
  if (bankMasterModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && bankMasterModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final bankMasterModelData =
      getBankMasterModelFirestoreData(bankMasterModel, forFieldValue);
  final nestedData =
      bankMasterModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = bankMasterModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBankMasterModelFirestoreData(
  BankMasterModelStruct? bankMasterModel, [
  bool forFieldValue = false,
]) {
  if (bankMasterModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(bankMasterModel.toMap());

  // Add any Firestore field values
  bankMasterModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBankMasterModelListFirestoreData(
  List<BankMasterModelStruct>? bankMasterModels,
) =>
    bankMasterModels
        ?.map((e) => getBankMasterModelFirestoreData(e, true))
        .toList() ??
    [];
