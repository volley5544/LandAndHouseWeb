// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class PaymentHistoryModelStruct extends FFFirebaseStruct {
  PaymentHistoryModelStruct({
    String? date,
    double? paidAmount,
    String? paymentChannelCode,
    String? paymentChannelName,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _date = date,
        _paidAmount = paidAmount,
        _paymentChannelCode = paymentChannelCode,
        _paymentChannelName = paymentChannelName,
        super(firestoreUtilData);

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  set date(String? val) => _date = val;

  bool hasDate() => _date != null;

  // "paid_amount" field.
  double? _paidAmount;
  double get paidAmount => _paidAmount ?? 0.0;
  set paidAmount(double? val) => _paidAmount = val;

  void incrementPaidAmount(double amount) => paidAmount = paidAmount + amount;

  bool hasPaidAmount() => _paidAmount != null;

  // "payment_channel_code" field.
  String? _paymentChannelCode;
  String get paymentChannelCode => _paymentChannelCode ?? '';
  set paymentChannelCode(String? val) => _paymentChannelCode = val;

  bool hasPaymentChannelCode() => _paymentChannelCode != null;

  // "payment_channel_name" field.
  String? _paymentChannelName;
  String get paymentChannelName => _paymentChannelName ?? '';
  set paymentChannelName(String? val) => _paymentChannelName = val;

  bool hasPaymentChannelName() => _paymentChannelName != null;

  static PaymentHistoryModelStruct fromMap(Map<String, dynamic> data) =>
      PaymentHistoryModelStruct(
        date: data['date'] as String?,
        paidAmount: castToType<double>(data['paid_amount']),
        paymentChannelCode: data['payment_channel_code'] as String?,
        paymentChannelName: data['payment_channel_name'] as String?,
      );

  static PaymentHistoryModelStruct? maybeFromMap(dynamic data) => data is Map
      ? PaymentHistoryModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'date': _date,
        'paid_amount': _paidAmount,
        'payment_channel_code': _paymentChannelCode,
        'payment_channel_name': _paymentChannelName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'date': serializeParam(
          _date,
          ParamType.String,
        ),
        'paid_amount': serializeParam(
          _paidAmount,
          ParamType.double,
        ),
        'payment_channel_code': serializeParam(
          _paymentChannelCode,
          ParamType.String,
        ),
        'payment_channel_name': serializeParam(
          _paymentChannelName,
          ParamType.String,
        ),
      }.withoutNulls;

  static PaymentHistoryModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      PaymentHistoryModelStruct(
        date: deserializeParam(
          data['date'],
          ParamType.String,
          false,
        ),
        paidAmount: deserializeParam(
          data['paid_amount'],
          ParamType.double,
          false,
        ),
        paymentChannelCode: deserializeParam(
          data['payment_channel_code'],
          ParamType.String,
          false,
        ),
        paymentChannelName: deserializeParam(
          data['payment_channel_name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PaymentHistoryModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PaymentHistoryModelStruct &&
        date == other.date &&
        paidAmount == other.paidAmount &&
        paymentChannelCode == other.paymentChannelCode &&
        paymentChannelName == other.paymentChannelName;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([date, paidAmount, paymentChannelCode, paymentChannelName]);
}

PaymentHistoryModelStruct createPaymentHistoryModelStruct({
  String? date,
  double? paidAmount,
  String? paymentChannelCode,
  String? paymentChannelName,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PaymentHistoryModelStruct(
      date: date,
      paidAmount: paidAmount,
      paymentChannelCode: paymentChannelCode,
      paymentChannelName: paymentChannelName,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PaymentHistoryModelStruct? updatePaymentHistoryModelStruct(
  PaymentHistoryModelStruct? paymentHistoryModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    paymentHistoryModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPaymentHistoryModelStructData(
  Map<String, dynamic> firestoreData,
  PaymentHistoryModelStruct? paymentHistoryModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (paymentHistoryModel == null) {
    return;
  }
  if (paymentHistoryModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && paymentHistoryModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final paymentHistoryModelData =
      getPaymentHistoryModelFirestoreData(paymentHistoryModel, forFieldValue);
  final nestedData =
      paymentHistoryModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      paymentHistoryModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPaymentHistoryModelFirestoreData(
  PaymentHistoryModelStruct? paymentHistoryModel, [
  bool forFieldValue = false,
]) {
  if (paymentHistoryModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(paymentHistoryModel.toMap());

  // Add any Firestore field values
  mapToFirestore(paymentHistoryModel.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPaymentHistoryModelListFirestoreData(
  List<PaymentHistoryModelStruct>? paymentHistoryModels,
) =>
    paymentHistoryModels
        ?.map((e) => getPaymentHistoryModelFirestoreData(e, true))
        .toList() ??
    [];
