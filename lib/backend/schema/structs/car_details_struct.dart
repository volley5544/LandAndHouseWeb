// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CarDetailsStruct extends FFFirebaseStruct {
  CarDetailsStruct({
    String? carRegistrationPrefix,
    String? carRegistration,
    String? carProvince,
    String? carBrand,
    String? carSeries,
    String? carDesc,
    String? carChassisNo,
    String? carCc,
    String? carEngineNo,
    String? carGear,
    String? carManufactureYear,
    String? carColor,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _carRegistrationPrefix = carRegistrationPrefix,
        _carRegistration = carRegistration,
        _carProvince = carProvince,
        _carBrand = carBrand,
        _carSeries = carSeries,
        _carDesc = carDesc,
        _carChassisNo = carChassisNo,
        _carCc = carCc,
        _carEngineNo = carEngineNo,
        _carGear = carGear,
        _carManufactureYear = carManufactureYear,
        _carColor = carColor,
        super(firestoreUtilData);

  // "car_registration_prefix" field.
  String? _carRegistrationPrefix;
  String get carRegistrationPrefix => _carRegistrationPrefix ?? '';
  set carRegistrationPrefix(String? val) => _carRegistrationPrefix = val;

  bool hasCarRegistrationPrefix() => _carRegistrationPrefix != null;

  // "car_registration" field.
  String? _carRegistration;
  String get carRegistration => _carRegistration ?? '';
  set carRegistration(String? val) => _carRegistration = val;

  bool hasCarRegistration() => _carRegistration != null;

  // "car_province" field.
  String? _carProvince;
  String get carProvince => _carProvince ?? '';
  set carProvince(String? val) => _carProvince = val;

  bool hasCarProvince() => _carProvince != null;

  // "car_brand" field.
  String? _carBrand;
  String get carBrand => _carBrand ?? '';
  set carBrand(String? val) => _carBrand = val;

  bool hasCarBrand() => _carBrand != null;

  // "car_series" field.
  String? _carSeries;
  String get carSeries => _carSeries ?? '';
  set carSeries(String? val) => _carSeries = val;

  bool hasCarSeries() => _carSeries != null;

  // "car_desc" field.
  String? _carDesc;
  String get carDesc => _carDesc ?? '';
  set carDesc(String? val) => _carDesc = val;

  bool hasCarDesc() => _carDesc != null;

  // "car_chassisNo" field.
  String? _carChassisNo;
  String get carChassisNo => _carChassisNo ?? '';
  set carChassisNo(String? val) => _carChassisNo = val;

  bool hasCarChassisNo() => _carChassisNo != null;

  // "car_cc" field.
  String? _carCc;
  String get carCc => _carCc ?? '';
  set carCc(String? val) => _carCc = val;

  bool hasCarCc() => _carCc != null;

  // "car_engineNo" field.
  String? _carEngineNo;
  String get carEngineNo => _carEngineNo ?? '';
  set carEngineNo(String? val) => _carEngineNo = val;

  bool hasCarEngineNo() => _carEngineNo != null;

  // "car_gear" field.
  String? _carGear;
  String get carGear => _carGear ?? '';
  set carGear(String? val) => _carGear = val;

  bool hasCarGear() => _carGear != null;

  // "car_manufacture_year" field.
  String? _carManufactureYear;
  String get carManufactureYear => _carManufactureYear ?? '';
  set carManufactureYear(String? val) => _carManufactureYear = val;

  bool hasCarManufactureYear() => _carManufactureYear != null;

  // "car_color" field.
  String? _carColor;
  String get carColor => _carColor ?? '';
  set carColor(String? val) => _carColor = val;

  bool hasCarColor() => _carColor != null;

  static CarDetailsStruct fromMap(Map<String, dynamic> data) =>
      CarDetailsStruct(
        carRegistrationPrefix: data['car_registration_prefix'] as String?,
        carRegistration: data['car_registration'] as String?,
        carProvince: data['car_province'] as String?,
        carBrand: data['car_brand'] as String?,
        carSeries: data['car_series'] as String?,
        carDesc: data['car_desc'] as String?,
        carChassisNo: data['car_chassisNo'] as String?,
        carCc: data['car_cc'] as String?,
        carEngineNo: data['car_engineNo'] as String?,
        carGear: data['car_gear'] as String?,
        carManufactureYear: data['car_manufacture_year'] as String?,
        carColor: data['car_color'] as String?,
      );

  static CarDetailsStruct? maybeFromMap(dynamic data) => data is Map
      ? CarDetailsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'car_registration_prefix': _carRegistrationPrefix,
        'car_registration': _carRegistration,
        'car_province': _carProvince,
        'car_brand': _carBrand,
        'car_series': _carSeries,
        'car_desc': _carDesc,
        'car_chassisNo': _carChassisNo,
        'car_cc': _carCc,
        'car_engineNo': _carEngineNo,
        'car_gear': _carGear,
        'car_manufacture_year': _carManufactureYear,
        'car_color': _carColor,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'car_registration_prefix': serializeParam(
          _carRegistrationPrefix,
          ParamType.String,
        ),
        'car_registration': serializeParam(
          _carRegistration,
          ParamType.String,
        ),
        'car_province': serializeParam(
          _carProvince,
          ParamType.String,
        ),
        'car_brand': serializeParam(
          _carBrand,
          ParamType.String,
        ),
        'car_series': serializeParam(
          _carSeries,
          ParamType.String,
        ),
        'car_desc': serializeParam(
          _carDesc,
          ParamType.String,
        ),
        'car_chassisNo': serializeParam(
          _carChassisNo,
          ParamType.String,
        ),
        'car_cc': serializeParam(
          _carCc,
          ParamType.String,
        ),
        'car_engineNo': serializeParam(
          _carEngineNo,
          ParamType.String,
        ),
        'car_gear': serializeParam(
          _carGear,
          ParamType.String,
        ),
        'car_manufacture_year': serializeParam(
          _carManufactureYear,
          ParamType.String,
        ),
        'car_color': serializeParam(
          _carColor,
          ParamType.String,
        ),
      }.withoutNulls;

  static CarDetailsStruct fromSerializableMap(Map<String, dynamic> data) =>
      CarDetailsStruct(
        carRegistrationPrefix: deserializeParam(
          data['car_registration_prefix'],
          ParamType.String,
          false,
        ),
        carRegistration: deserializeParam(
          data['car_registration'],
          ParamType.String,
          false,
        ),
        carProvince: deserializeParam(
          data['car_province'],
          ParamType.String,
          false,
        ),
        carBrand: deserializeParam(
          data['car_brand'],
          ParamType.String,
          false,
        ),
        carSeries: deserializeParam(
          data['car_series'],
          ParamType.String,
          false,
        ),
        carDesc: deserializeParam(
          data['car_desc'],
          ParamType.String,
          false,
        ),
        carChassisNo: deserializeParam(
          data['car_chassisNo'],
          ParamType.String,
          false,
        ),
        carCc: deserializeParam(
          data['car_cc'],
          ParamType.String,
          false,
        ),
        carEngineNo: deserializeParam(
          data['car_engineNo'],
          ParamType.String,
          false,
        ),
        carGear: deserializeParam(
          data['car_gear'],
          ParamType.String,
          false,
        ),
        carManufactureYear: deserializeParam(
          data['car_manufacture_year'],
          ParamType.String,
          false,
        ),
        carColor: deserializeParam(
          data['car_color'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CarDetailsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CarDetailsStruct &&
        carRegistrationPrefix == other.carRegistrationPrefix &&
        carRegistration == other.carRegistration &&
        carProvince == other.carProvince &&
        carBrand == other.carBrand &&
        carSeries == other.carSeries &&
        carDesc == other.carDesc &&
        carChassisNo == other.carChassisNo &&
        carCc == other.carCc &&
        carEngineNo == other.carEngineNo &&
        carGear == other.carGear &&
        carManufactureYear == other.carManufactureYear &&
        carColor == other.carColor;
  }

  @override
  int get hashCode => const ListEquality().hash([
        carRegistrationPrefix,
        carRegistration,
        carProvince,
        carBrand,
        carSeries,
        carDesc,
        carChassisNo,
        carCc,
        carEngineNo,
        carGear,
        carManufactureYear,
        carColor
      ]);
}

CarDetailsStruct createCarDetailsStruct({
  String? carRegistrationPrefix,
  String? carRegistration,
  String? carProvince,
  String? carBrand,
  String? carSeries,
  String? carDesc,
  String? carChassisNo,
  String? carCc,
  String? carEngineNo,
  String? carGear,
  String? carManufactureYear,
  String? carColor,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CarDetailsStruct(
      carRegistrationPrefix: carRegistrationPrefix,
      carRegistration: carRegistration,
      carProvince: carProvince,
      carBrand: carBrand,
      carSeries: carSeries,
      carDesc: carDesc,
      carChassisNo: carChassisNo,
      carCc: carCc,
      carEngineNo: carEngineNo,
      carGear: carGear,
      carManufactureYear: carManufactureYear,
      carColor: carColor,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CarDetailsStruct? updateCarDetailsStruct(
  CarDetailsStruct? carDetails, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    carDetails
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCarDetailsStructData(
  Map<String, dynamic> firestoreData,
  CarDetailsStruct? carDetails,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (carDetails == null) {
    return;
  }
  if (carDetails.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && carDetails.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final carDetailsData = getCarDetailsFirestoreData(carDetails, forFieldValue);
  final nestedData = carDetailsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = carDetails.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCarDetailsFirestoreData(
  CarDetailsStruct? carDetails, [
  bool forFieldValue = false,
]) {
  if (carDetails == null) {
    return {};
  }
  final firestoreData = mapToFirestore(carDetails.toMap());

  // Add any Firestore field values
  carDetails.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCarDetailsListFirestoreData(
  List<CarDetailsStruct>? carDetailss,
) =>
    carDetailss?.map((e) => getCarDetailsFirestoreData(e, true)).toList() ?? [];
