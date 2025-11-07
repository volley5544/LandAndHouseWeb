// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MyWalletDataModelStruct extends FFFirebaseStruct {
  MyWalletDataModelStruct({
    String? dataDate,
    String? summary,
    List<PaymentHistoryMonthDataModelStruct>? details,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _dataDate = dataDate,
        _summary = summary,
        _details = details,
        super(firestoreUtilData);

  // "data_date" field.
  String? _dataDate;
  String get dataDate => _dataDate ?? '';
  set dataDate(String? val) => _dataDate = val;

  bool hasDataDate() => _dataDate != null;

  // "summary" field.
  String? _summary;
  String get summary => _summary ?? '';
  set summary(String? val) => _summary = val;

  bool hasSummary() => _summary != null;

  // "details" field.
  List<PaymentHistoryMonthDataModelStruct>? _details;
  List<PaymentHistoryMonthDataModelStruct> get details => _details ?? const [];
  set details(List<PaymentHistoryMonthDataModelStruct>? val) => _details = val;

  void updateDetails(
      Function(List<PaymentHistoryMonthDataModelStruct>) updateFn) {
    updateFn(_details ??= []);
  }

  bool hasDetails() => _details != null;

  static MyWalletDataModelStruct fromMap(Map<String, dynamic> data) =>
      MyWalletDataModelStruct(
        dataDate: data['data_date'] as String?,
        summary: data['summary'] as String?,
        details: getStructList(
          data['details'],
          PaymentHistoryMonthDataModelStruct.fromMap,
        ),
      );

  static MyWalletDataModelStruct? maybeFromMap(dynamic data) => data is Map
      ? MyWalletDataModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'data_date': _dataDate,
        'summary': _summary,
        'details': _details?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'data_date': serializeParam(
          _dataDate,
          ParamType.String,
        ),
        'summary': serializeParam(
          _summary,
          ParamType.String,
        ),
        'details': serializeParam(
          _details,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static MyWalletDataModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      MyWalletDataModelStruct(
        dataDate: deserializeParam(
          data['data_date'],
          ParamType.String,
          false,
        ),
        summary: deserializeParam(
          data['summary'],
          ParamType.String,
          false,
        ),
        details: deserializeStructParam<PaymentHistoryMonthDataModelStruct>(
          data['details'],
          ParamType.DataStruct,
          true,
          structBuilder: PaymentHistoryMonthDataModelStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'MyWalletDataModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is MyWalletDataModelStruct &&
        dataDate == other.dataDate &&
        summary == other.summary &&
        listEquality.equals(details, other.details);
  }

  @override
  int get hashCode => const ListEquality().hash([dataDate, summary, details]);
}

MyWalletDataModelStruct createMyWalletDataModelStruct({
  String? dataDate,
  String? summary,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MyWalletDataModelStruct(
      dataDate: dataDate,
      summary: summary,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MyWalletDataModelStruct? updateMyWalletDataModelStruct(
  MyWalletDataModelStruct? myWalletDataModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    myWalletDataModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMyWalletDataModelStructData(
  Map<String, dynamic> firestoreData,
  MyWalletDataModelStruct? myWalletDataModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (myWalletDataModel == null) {
    return;
  }
  if (myWalletDataModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && myWalletDataModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final myWalletDataModelData =
      getMyWalletDataModelFirestoreData(myWalletDataModel, forFieldValue);
  final nestedData =
      myWalletDataModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = myWalletDataModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMyWalletDataModelFirestoreData(
  MyWalletDataModelStruct? myWalletDataModel, [
  bool forFieldValue = false,
]) {
  if (myWalletDataModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(myWalletDataModel.toMap());

  // Add any Firestore field values
  myWalletDataModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMyWalletDataModelListFirestoreData(
  List<MyWalletDataModelStruct>? myWalletDataModels,
) =>
    myWalletDataModels
        ?.map((e) => getMyWalletDataModelFirestoreData(e, true))
        .toList() ??
    [];
