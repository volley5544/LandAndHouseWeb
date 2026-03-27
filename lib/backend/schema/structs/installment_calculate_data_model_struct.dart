// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InstallmentCalculateDataModelStruct extends FFFirebaseStruct {
  InstallmentCalculateDataModelStruct({
    String? estimatePrice,
    String? requestAmount,
    String? subProduct,
    String? ltvPercent,
    String? flatRatePercent,
    List<InstallmentsStruct>? installments,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _estimatePrice = estimatePrice,
        _requestAmount = requestAmount,
        _subProduct = subProduct,
        _ltvPercent = ltvPercent,
        _flatRatePercent = flatRatePercent,
        _installments = installments,
        super(firestoreUtilData);

  // "estimate_price" field.
  String? _estimatePrice;
  String get estimatePrice => _estimatePrice ?? '';
  set estimatePrice(String? val) => _estimatePrice = val;

  bool hasEstimatePrice() => _estimatePrice != null;

  // "request_amount" field.
  String? _requestAmount;
  String get requestAmount => _requestAmount ?? '';
  set requestAmount(String? val) => _requestAmount = val;

  bool hasRequestAmount() => _requestAmount != null;

  // "sub_product" field.
  String? _subProduct;
  String get subProduct => _subProduct ?? '';
  set subProduct(String? val) => _subProduct = val;

  bool hasSubProduct() => _subProduct != null;

  // "ltv_percent" field.
  String? _ltvPercent;
  String get ltvPercent => _ltvPercent ?? '';
  set ltvPercent(String? val) => _ltvPercent = val;

  bool hasLtvPercent() => _ltvPercent != null;

  // "flat_rate_percent" field.
  String? _flatRatePercent;
  String get flatRatePercent => _flatRatePercent ?? '';
  set flatRatePercent(String? val) => _flatRatePercent = val;

  bool hasFlatRatePercent() => _flatRatePercent != null;

  // "installments" field.
  List<InstallmentsStruct>? _installments;
  List<InstallmentsStruct> get installments => _installments ?? const [];
  set installments(List<InstallmentsStruct>? val) => _installments = val;

  void updateInstallments(Function(List<InstallmentsStruct>) updateFn) {
    updateFn(_installments ??= []);
  }

  bool hasInstallments() => _installments != null;

  static InstallmentCalculateDataModelStruct fromMap(
          Map<String, dynamic> data) =>
      InstallmentCalculateDataModelStruct(
        estimatePrice: data['estimate_price'] as String?,
        requestAmount: data['request_amount'] as String?,
        subProduct: data['sub_product'] as String?,
        ltvPercent: data['ltv_percent'] as String?,
        flatRatePercent: data['flat_rate_percent'] as String?,
        installments: getStructList(
          data['installments'],
          InstallmentsStruct.fromMap,
        ),
      );

  static InstallmentCalculateDataModelStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? InstallmentCalculateDataModelStruct.fromMap(
              data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'estimate_price': _estimatePrice,
        'request_amount': _requestAmount,
        'sub_product': _subProduct,
        'ltv_percent': _ltvPercent,
        'flat_rate_percent': _flatRatePercent,
        'installments': _installments?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'estimate_price': serializeParam(
          _estimatePrice,
          ParamType.String,
        ),
        'request_amount': serializeParam(
          _requestAmount,
          ParamType.String,
        ),
        'sub_product': serializeParam(
          _subProduct,
          ParamType.String,
        ),
        'ltv_percent': serializeParam(
          _ltvPercent,
          ParamType.String,
        ),
        'flat_rate_percent': serializeParam(
          _flatRatePercent,
          ParamType.String,
        ),
        'installments': serializeParam(
          _installments,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static InstallmentCalculateDataModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      InstallmentCalculateDataModelStruct(
        estimatePrice: deserializeParam(
          data['estimate_price'],
          ParamType.String,
          false,
        ),
        requestAmount: deserializeParam(
          data['request_amount'],
          ParamType.String,
          false,
        ),
        subProduct: deserializeParam(
          data['sub_product'],
          ParamType.String,
          false,
        ),
        ltvPercent: deserializeParam(
          data['ltv_percent'],
          ParamType.String,
          false,
        ),
        flatRatePercent: deserializeParam(
          data['flat_rate_percent'],
          ParamType.String,
          false,
        ),
        installments: deserializeStructParam<InstallmentsStruct>(
          data['installments'],
          ParamType.DataStruct,
          true,
          structBuilder: InstallmentsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'InstallmentCalculateDataModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is InstallmentCalculateDataModelStruct &&
        estimatePrice == other.estimatePrice &&
        requestAmount == other.requestAmount &&
        subProduct == other.subProduct &&
        ltvPercent == other.ltvPercent &&
        flatRatePercent == other.flatRatePercent &&
        listEquality.equals(installments, other.installments);
  }

  @override
  int get hashCode => const ListEquality().hash([
        estimatePrice,
        requestAmount,
        subProduct,
        ltvPercent,
        flatRatePercent,
        installments
      ]);
}

InstallmentCalculateDataModelStruct createInstallmentCalculateDataModelStruct({
  String? estimatePrice,
  String? requestAmount,
  String? subProduct,
  String? ltvPercent,
  String? flatRatePercent,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    InstallmentCalculateDataModelStruct(
      estimatePrice: estimatePrice,
      requestAmount: requestAmount,
      subProduct: subProduct,
      ltvPercent: ltvPercent,
      flatRatePercent: flatRatePercent,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

InstallmentCalculateDataModelStruct? updateInstallmentCalculateDataModelStruct(
  InstallmentCalculateDataModelStruct? installmentCalculateDataModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    installmentCalculateDataModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addInstallmentCalculateDataModelStructData(
  Map<String, dynamic> firestoreData,
  InstallmentCalculateDataModelStruct? installmentCalculateDataModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (installmentCalculateDataModel == null) {
    return;
  }
  if (installmentCalculateDataModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      installmentCalculateDataModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final installmentCalculateDataModelData =
      getInstallmentCalculateDataModelFirestoreData(
          installmentCalculateDataModel, forFieldValue);
  final nestedData = installmentCalculateDataModelData
      .map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      installmentCalculateDataModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getInstallmentCalculateDataModelFirestoreData(
  InstallmentCalculateDataModelStruct? installmentCalculateDataModel, [
  bool forFieldValue = false,
]) {
  if (installmentCalculateDataModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(installmentCalculateDataModel.toMap());

  // Add any Firestore field values
  installmentCalculateDataModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getInstallmentCalculateDataModelListFirestoreData(
  List<InstallmentCalculateDataModelStruct>? installmentCalculateDataModels,
) =>
    installmentCalculateDataModels
        ?.map((e) => getInstallmentCalculateDataModelFirestoreData(e, true))
        .toList() ??
    [];
