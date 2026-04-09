// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PaymentHistoryMonthDataModelStruct extends FFFirebaseStruct {
  PaymentHistoryMonthDataModelStruct({
    String? month,
    String? monthTh,
    String? total,
    List<PaymentHistoryDataModelStruct>? items,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _month = month,
        _monthTh = monthTh,
        _total = total,
        _items = items,
        super(firestoreUtilData);

  // "month" field.
  String? _month;
  String get month => _month ?? '';
  set month(String? val) => _month = val;

  bool hasMonth() => _month != null;

  // "month_th" field.
  String? _monthTh;
  String get monthTh => _monthTh ?? '';
  set monthTh(String? val) => _monthTh = val;

  bool hasMonthTh() => _monthTh != null;

  // "total" field.
  String? _total;
  String get total => _total ?? '';
  set total(String? val) => _total = val;

  bool hasTotal() => _total != null;

  // "items" field.
  List<PaymentHistoryDataModelStruct>? _items;
  List<PaymentHistoryDataModelStruct> get items => _items ?? const [];
  set items(List<PaymentHistoryDataModelStruct>? val) => _items = val;

  void updateItems(Function(List<PaymentHistoryDataModelStruct>) updateFn) {
    updateFn(_items ??= []);
  }

  bool hasItems() => _items != null;

  static PaymentHistoryMonthDataModelStruct fromMap(
          Map<String, dynamic> data) =>
      PaymentHistoryMonthDataModelStruct(
        month: data['month'] as String?,
        monthTh: data['month_th'] as String?,
        total: data['total'] as String?,
        items: getStructList(
          data['items'],
          PaymentHistoryDataModelStruct.fromMap,
        ),
      );

  static PaymentHistoryMonthDataModelStruct? maybeFromMap(dynamic data) => data
          is Map
      ? PaymentHistoryMonthDataModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'month': _month,
        'month_th': _monthTh,
        'total': _total,
        'items': _items?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'month': serializeParam(
          _month,
          ParamType.String,
        ),
        'month_th': serializeParam(
          _monthTh,
          ParamType.String,
        ),
        'total': serializeParam(
          _total,
          ParamType.String,
        ),
        'items': serializeParam(
          _items,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static PaymentHistoryMonthDataModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      PaymentHistoryMonthDataModelStruct(
        month: deserializeParam(
          data['month'],
          ParamType.String,
          false,
        ),
        monthTh: deserializeParam(
          data['month_th'],
          ParamType.String,
          false,
        ),
        total: deserializeParam(
          data['total'],
          ParamType.String,
          false,
        ),
        items: deserializeStructParam<PaymentHistoryDataModelStruct>(
          data['items'],
          ParamType.DataStruct,
          true,
          structBuilder: PaymentHistoryDataModelStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'PaymentHistoryMonthDataModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PaymentHistoryMonthDataModelStruct &&
        month == other.month &&
        monthTh == other.monthTh &&
        total == other.total &&
        listEquality.equals(items, other.items);
  }

  @override
  int get hashCode => const ListEquality().hash([month, monthTh, total, items]);
}

PaymentHistoryMonthDataModelStruct createPaymentHistoryMonthDataModelStruct({
  String? month,
  String? monthTh,
  String? total,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PaymentHistoryMonthDataModelStruct(
      month: month,
      monthTh: monthTh,
      total: total,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PaymentHistoryMonthDataModelStruct? updatePaymentHistoryMonthDataModelStruct(
  PaymentHistoryMonthDataModelStruct? paymentHistoryMonthDataModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    paymentHistoryMonthDataModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPaymentHistoryMonthDataModelStructData(
  Map<String, dynamic> firestoreData,
  PaymentHistoryMonthDataModelStruct? paymentHistoryMonthDataModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (paymentHistoryMonthDataModel == null) {
    return;
  }
  if (paymentHistoryMonthDataModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      paymentHistoryMonthDataModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final paymentHistoryMonthDataModelData =
      getPaymentHistoryMonthDataModelFirestoreData(
          paymentHistoryMonthDataModel, forFieldValue);
  final nestedData = paymentHistoryMonthDataModelData
      .map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      paymentHistoryMonthDataModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPaymentHistoryMonthDataModelFirestoreData(
  PaymentHistoryMonthDataModelStruct? paymentHistoryMonthDataModel, [
  bool forFieldValue = false,
]) {
  if (paymentHistoryMonthDataModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(paymentHistoryMonthDataModel.toMap());

  // Add any Firestore field values
  mapToFirestore(paymentHistoryMonthDataModel.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPaymentHistoryMonthDataModelListFirestoreData(
  List<PaymentHistoryMonthDataModelStruct>? paymentHistoryMonthDataModels,
) =>
    paymentHistoryMonthDataModels
        ?.map((e) => getPaymentHistoryMonthDataModelFirestoreData(e, true))
        .toList() ??
    [];
