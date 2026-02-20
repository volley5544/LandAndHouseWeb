// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CommisionCalculateDataModelStruct extends FFFirebaseStruct {
  CommisionCalculateDataModelStruct({
    int? id,
    int? groupChannelCode,
    String? product,
    String? subProduct,
    String? subProductName,
    String? minAmount,
    String? maxAmount,
    String? commissionType,
    String? commissionValue,
    String? commissionCap,
    String? whtPercent,
    String? remark,
    String? createdAt,
    String? updatedAt,
    int? deleted,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _groupChannelCode = groupChannelCode,
        _product = product,
        _subProduct = subProduct,
        _subProductName = subProductName,
        _minAmount = minAmount,
        _maxAmount = maxAmount,
        _commissionType = commissionType,
        _commissionValue = commissionValue,
        _commissionCap = commissionCap,
        _whtPercent = whtPercent,
        _remark = remark,
        _createdAt = createdAt,
        _updatedAt = updatedAt,
        _deleted = deleted,
        super(firestoreUtilData);

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "group_channel_code" field.
  int? _groupChannelCode;
  int get groupChannelCode => _groupChannelCode ?? 0;
  set groupChannelCode(int? val) => _groupChannelCode = val;

  void incrementGroupChannelCode(int amount) =>
      groupChannelCode = groupChannelCode + amount;

  bool hasGroupChannelCode() => _groupChannelCode != null;

  // "product" field.
  String? _product;
  String get product => _product ?? '';
  set product(String? val) => _product = val;

  bool hasProduct() => _product != null;

  // "sub_product" field.
  String? _subProduct;
  String get subProduct => _subProduct ?? '';
  set subProduct(String? val) => _subProduct = val;

  bool hasSubProduct() => _subProduct != null;

  // "sub_product_name" field.
  String? _subProductName;
  String get subProductName => _subProductName ?? '';
  set subProductName(String? val) => _subProductName = val;

  bool hasSubProductName() => _subProductName != null;

  // "min_amount" field.
  String? _minAmount;
  String get minAmount => _minAmount ?? '';
  set minAmount(String? val) => _minAmount = val;

  bool hasMinAmount() => _minAmount != null;

  // "max_amount" field.
  String? _maxAmount;
  String get maxAmount => _maxAmount ?? '';
  set maxAmount(String? val) => _maxAmount = val;

  bool hasMaxAmount() => _maxAmount != null;

  // "commission_type" field.
  String? _commissionType;
  String get commissionType => _commissionType ?? '';
  set commissionType(String? val) => _commissionType = val;

  bool hasCommissionType() => _commissionType != null;

  // "commission_value" field.
  String? _commissionValue;
  String get commissionValue => _commissionValue ?? '';
  set commissionValue(String? val) => _commissionValue = val;

  bool hasCommissionValue() => _commissionValue != null;

  // "commission_cap" field.
  String? _commissionCap;
  String get commissionCap => _commissionCap ?? '';
  set commissionCap(String? val) => _commissionCap = val;

  bool hasCommissionCap() => _commissionCap != null;

  // "wht_percent" field.
  String? _whtPercent;
  String get whtPercent => _whtPercent ?? '';
  set whtPercent(String? val) => _whtPercent = val;

  bool hasWhtPercent() => _whtPercent != null;

  // "remark" field.
  String? _remark;
  String get remark => _remark ?? '';
  set remark(String? val) => _remark = val;

  bool hasRemark() => _remark != null;

  // "created_at" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '';
  set createdAt(String? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "updated_at" field.
  String? _updatedAt;
  String get updatedAt => _updatedAt ?? '';
  set updatedAt(String? val) => _updatedAt = val;

  bool hasUpdatedAt() => _updatedAt != null;

  // "deleted" field.
  int? _deleted;
  int get deleted => _deleted ?? 0;
  set deleted(int? val) => _deleted = val;

  void incrementDeleted(int amount) => deleted = deleted + amount;

  bool hasDeleted() => _deleted != null;

  static CommisionCalculateDataModelStruct fromMap(Map<String, dynamic> data) =>
      CommisionCalculateDataModelStruct(
        id: castToType<int>(data['id']),
        groupChannelCode: castToType<int>(data['group_channel_code']),
        product: data['product'] as String?,
        subProduct: data['sub_product'] as String?,
        subProductName: data['sub_product_name'] as String?,
        minAmount: data['min_amount'] as String?,
        maxAmount: data['max_amount'] as String?,
        commissionType: data['commission_type'] as String?,
        commissionValue: data['commission_value'] as String?,
        commissionCap: data['commission_cap'] as String?,
        whtPercent: data['wht_percent'] as String?,
        remark: data['remark'] as String?,
        createdAt: data['created_at'] as String?,
        updatedAt: data['updated_at'] as String?,
        deleted: castToType<int>(data['deleted']),
      );

  static CommisionCalculateDataModelStruct? maybeFromMap(dynamic data) => data
          is Map
      ? CommisionCalculateDataModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'group_channel_code': _groupChannelCode,
        'product': _product,
        'sub_product': _subProduct,
        'sub_product_name': _subProductName,
        'min_amount': _minAmount,
        'max_amount': _maxAmount,
        'commission_type': _commissionType,
        'commission_value': _commissionValue,
        'commission_cap': _commissionCap,
        'wht_percent': _whtPercent,
        'remark': _remark,
        'created_at': _createdAt,
        'updated_at': _updatedAt,
        'deleted': _deleted,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'group_channel_code': serializeParam(
          _groupChannelCode,
          ParamType.int,
        ),
        'product': serializeParam(
          _product,
          ParamType.String,
        ),
        'sub_product': serializeParam(
          _subProduct,
          ParamType.String,
        ),
        'sub_product_name': serializeParam(
          _subProductName,
          ParamType.String,
        ),
        'min_amount': serializeParam(
          _minAmount,
          ParamType.String,
        ),
        'max_amount': serializeParam(
          _maxAmount,
          ParamType.String,
        ),
        'commission_type': serializeParam(
          _commissionType,
          ParamType.String,
        ),
        'commission_value': serializeParam(
          _commissionValue,
          ParamType.String,
        ),
        'commission_cap': serializeParam(
          _commissionCap,
          ParamType.String,
        ),
        'wht_percent': serializeParam(
          _whtPercent,
          ParamType.String,
        ),
        'remark': serializeParam(
          _remark,
          ParamType.String,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.String,
        ),
        'updated_at': serializeParam(
          _updatedAt,
          ParamType.String,
        ),
        'deleted': serializeParam(
          _deleted,
          ParamType.int,
        ),
      }.withoutNulls;

  static CommisionCalculateDataModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      CommisionCalculateDataModelStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        groupChannelCode: deserializeParam(
          data['group_channel_code'],
          ParamType.int,
          false,
        ),
        product: deserializeParam(
          data['product'],
          ParamType.String,
          false,
        ),
        subProduct: deserializeParam(
          data['sub_product'],
          ParamType.String,
          false,
        ),
        subProductName: deserializeParam(
          data['sub_product_name'],
          ParamType.String,
          false,
        ),
        minAmount: deserializeParam(
          data['min_amount'],
          ParamType.String,
          false,
        ),
        maxAmount: deserializeParam(
          data['max_amount'],
          ParamType.String,
          false,
        ),
        commissionType: deserializeParam(
          data['commission_type'],
          ParamType.String,
          false,
        ),
        commissionValue: deserializeParam(
          data['commission_value'],
          ParamType.String,
          false,
        ),
        commissionCap: deserializeParam(
          data['commission_cap'],
          ParamType.String,
          false,
        ),
        whtPercent: deserializeParam(
          data['wht_percent'],
          ParamType.String,
          false,
        ),
        remark: deserializeParam(
          data['remark'],
          ParamType.String,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.String,
          false,
        ),
        updatedAt: deserializeParam(
          data['updated_at'],
          ParamType.String,
          false,
        ),
        deleted: deserializeParam(
          data['deleted'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'CommisionCalculateDataModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CommisionCalculateDataModelStruct &&
        id == other.id &&
        groupChannelCode == other.groupChannelCode &&
        product == other.product &&
        subProduct == other.subProduct &&
        subProductName == other.subProductName &&
        minAmount == other.minAmount &&
        maxAmount == other.maxAmount &&
        commissionType == other.commissionType &&
        commissionValue == other.commissionValue &&
        commissionCap == other.commissionCap &&
        whtPercent == other.whtPercent &&
        remark == other.remark &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        deleted == other.deleted;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        groupChannelCode,
        product,
        subProduct,
        subProductName,
        minAmount,
        maxAmount,
        commissionType,
        commissionValue,
        commissionCap,
        whtPercent,
        remark,
        createdAt,
        updatedAt,
        deleted
      ]);
}

CommisionCalculateDataModelStruct createCommisionCalculateDataModelStruct({
  int? id,
  int? groupChannelCode,
  String? product,
  String? subProduct,
  String? subProductName,
  String? minAmount,
  String? maxAmount,
  String? commissionType,
  String? commissionValue,
  String? commissionCap,
  String? whtPercent,
  String? remark,
  String? createdAt,
  String? updatedAt,
  int? deleted,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CommisionCalculateDataModelStruct(
      id: id,
      groupChannelCode: groupChannelCode,
      product: product,
      subProduct: subProduct,
      subProductName: subProductName,
      minAmount: minAmount,
      maxAmount: maxAmount,
      commissionType: commissionType,
      commissionValue: commissionValue,
      commissionCap: commissionCap,
      whtPercent: whtPercent,
      remark: remark,
      createdAt: createdAt,
      updatedAt: updatedAt,
      deleted: deleted,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CommisionCalculateDataModelStruct? updateCommisionCalculateDataModelStruct(
  CommisionCalculateDataModelStruct? commisionCalculateDataModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    commisionCalculateDataModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCommisionCalculateDataModelStructData(
  Map<String, dynamic> firestoreData,
  CommisionCalculateDataModelStruct? commisionCalculateDataModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (commisionCalculateDataModel == null) {
    return;
  }
  if (commisionCalculateDataModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      commisionCalculateDataModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final commisionCalculateDataModelData =
      getCommisionCalculateDataModelFirestoreData(
          commisionCalculateDataModel, forFieldValue);
  final nestedData = commisionCalculateDataModelData
      .map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      commisionCalculateDataModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCommisionCalculateDataModelFirestoreData(
  CommisionCalculateDataModelStruct? commisionCalculateDataModel, [
  bool forFieldValue = false,
]) {
  if (commisionCalculateDataModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(commisionCalculateDataModel.toMap());

  // Add any Firestore field values
  commisionCalculateDataModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCommisionCalculateDataModelListFirestoreData(
  List<CommisionCalculateDataModelStruct>? commisionCalculateDataModels,
) =>
    commisionCalculateDataModels
        ?.map((e) => getCommisionCalculateDataModelFirestoreData(e, true))
        .toList() ??
    [];
