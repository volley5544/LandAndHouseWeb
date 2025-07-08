// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class PdfLoanDocDataModelStruct extends FFFirebaseStruct {
  PdfLoanDocDataModelStruct({
    String? request,
    String? receipt,
    String? agreement,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _request = request,
        _receipt = receipt,
        _agreement = agreement,
        super(firestoreUtilData);

  // "request" field.
  String? _request;
  String get request => _request ?? '';
  set request(String? val) => _request = val;

  bool hasRequest() => _request != null;

  // "receipt" field.
  String? _receipt;
  String get receipt => _receipt ?? '';
  set receipt(String? val) => _receipt = val;

  bool hasReceipt() => _receipt != null;

  // "agreement" field.
  String? _agreement;
  String get agreement => _agreement ?? '';
  set agreement(String? val) => _agreement = val;

  bool hasAgreement() => _agreement != null;

  static PdfLoanDocDataModelStruct fromMap(Map<String, dynamic> data) =>
      PdfLoanDocDataModelStruct(
        request: data['request'] as String?,
        receipt: data['receipt'] as String?,
        agreement: data['agreement'] as String?,
      );

  static PdfLoanDocDataModelStruct? maybeFromMap(dynamic data) => data is Map
      ? PdfLoanDocDataModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'request': _request,
        'receipt': _receipt,
        'agreement': _agreement,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'request': serializeParam(
          _request,
          ParamType.String,
        ),
        'receipt': serializeParam(
          _receipt,
          ParamType.String,
        ),
        'agreement': serializeParam(
          _agreement,
          ParamType.String,
        ),
      }.withoutNulls;

  static PdfLoanDocDataModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      PdfLoanDocDataModelStruct(
        request: deserializeParam(
          data['request'],
          ParamType.String,
          false,
        ),
        receipt: deserializeParam(
          data['receipt'],
          ParamType.String,
          false,
        ),
        agreement: deserializeParam(
          data['agreement'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PdfLoanDocDataModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PdfLoanDocDataModelStruct &&
        request == other.request &&
        receipt == other.receipt &&
        agreement == other.agreement;
  }

  @override
  int get hashCode => const ListEquality().hash([request, receipt, agreement]);
}

PdfLoanDocDataModelStruct createPdfLoanDocDataModelStruct({
  String? request,
  String? receipt,
  String? agreement,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PdfLoanDocDataModelStruct(
      request: request,
      receipt: receipt,
      agreement: agreement,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PdfLoanDocDataModelStruct? updatePdfLoanDocDataModelStruct(
  PdfLoanDocDataModelStruct? pdfLoanDocDataModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    pdfLoanDocDataModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPdfLoanDocDataModelStructData(
  Map<String, dynamic> firestoreData,
  PdfLoanDocDataModelStruct? pdfLoanDocDataModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (pdfLoanDocDataModel == null) {
    return;
  }
  if (pdfLoanDocDataModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && pdfLoanDocDataModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final pdfLoanDocDataModelData =
      getPdfLoanDocDataModelFirestoreData(pdfLoanDocDataModel, forFieldValue);
  final nestedData =
      pdfLoanDocDataModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      pdfLoanDocDataModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPdfLoanDocDataModelFirestoreData(
  PdfLoanDocDataModelStruct? pdfLoanDocDataModel, [
  bool forFieldValue = false,
]) {
  if (pdfLoanDocDataModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(pdfLoanDocDataModel.toMap());

  // Add any Firestore field values
  pdfLoanDocDataModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPdfLoanDocDataModelListFirestoreData(
  List<PdfLoanDocDataModelStruct>? pdfLoanDocDataModels,
) =>
    pdfLoanDocDataModels
        ?.map((e) => getPdfLoanDocDataModelFirestoreData(e, true))
        .toList() ??
    [];
