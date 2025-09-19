// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ModelCarMasterModelStruct extends FFFirebaseStruct {
  ModelCarMasterModelStruct({
    String? brandId,
    String? code,
    String? name,
    String? vehGroup,
    String? noSeats,
    String? engineCapacity,
    String? weight,
    String? carGroup,
    String? carGroupDetail,
    String? carDoors,
    String? vehicleGroup,
    String? evFlag,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _brandId = brandId,
        _code = code,
        _name = name,
        _vehGroup = vehGroup,
        _noSeats = noSeats,
        _engineCapacity = engineCapacity,
        _weight = weight,
        _carGroup = carGroup,
        _carGroupDetail = carGroupDetail,
        _carDoors = carDoors,
        _vehicleGroup = vehicleGroup,
        _evFlag = evFlag,
        super(firestoreUtilData);

  // "brand_id" field.
  String? _brandId;
  String get brandId => _brandId ?? '';
  set brandId(String? val) => _brandId = val;

  bool hasBrandId() => _brandId != null;

  // "code" field.
  String? _code;
  String get code => _code ?? '';
  set code(String? val) => _code = val;

  bool hasCode() => _code != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "veh_group" field.
  String? _vehGroup;
  String get vehGroup => _vehGroup ?? '';
  set vehGroup(String? val) => _vehGroup = val;

  bool hasVehGroup() => _vehGroup != null;

  // "no_seats" field.
  String? _noSeats;
  String get noSeats => _noSeats ?? '';
  set noSeats(String? val) => _noSeats = val;

  bool hasNoSeats() => _noSeats != null;

  // "engine_capacity" field.
  String? _engineCapacity;
  String get engineCapacity => _engineCapacity ?? '';
  set engineCapacity(String? val) => _engineCapacity = val;

  bool hasEngineCapacity() => _engineCapacity != null;

  // "weight" field.
  String? _weight;
  String get weight => _weight ?? '';
  set weight(String? val) => _weight = val;

  bool hasWeight() => _weight != null;

  // "car_group" field.
  String? _carGroup;
  String get carGroup => _carGroup ?? '';
  set carGroup(String? val) => _carGroup = val;

  bool hasCarGroup() => _carGroup != null;

  // "car_group_detail" field.
  String? _carGroupDetail;
  String get carGroupDetail => _carGroupDetail ?? '';
  set carGroupDetail(String? val) => _carGroupDetail = val;

  bool hasCarGroupDetail() => _carGroupDetail != null;

  // "car_doors" field.
  String? _carDoors;
  String get carDoors => _carDoors ?? '';
  set carDoors(String? val) => _carDoors = val;

  bool hasCarDoors() => _carDoors != null;

  // "vehicle_group" field.
  String? _vehicleGroup;
  String get vehicleGroup => _vehicleGroup ?? '';
  set vehicleGroup(String? val) => _vehicleGroup = val;

  bool hasVehicleGroup() => _vehicleGroup != null;

  // "ev_flag" field.
  String? _evFlag;
  String get evFlag => _evFlag ?? '';
  set evFlag(String? val) => _evFlag = val;

  bool hasEvFlag() => _evFlag != null;

  static ModelCarMasterModelStruct fromMap(Map<String, dynamic> data) =>
      ModelCarMasterModelStruct(
        brandId: data['brand_id'] as String?,
        code: data['code'] as String?,
        name: data['name'] as String?,
        vehGroup: data['veh_group'] as String?,
        noSeats: data['no_seats'] as String?,
        engineCapacity: data['engine_capacity'] as String?,
        weight: data['weight'] as String?,
        carGroup: data['car_group'] as String?,
        carGroupDetail: data['car_group_detail'] as String?,
        carDoors: data['car_doors'] as String?,
        vehicleGroup: data['vehicle_group'] as String?,
        evFlag: data['ev_flag'] as String?,
      );

  static ModelCarMasterModelStruct? maybeFromMap(dynamic data) => data is Map
      ? ModelCarMasterModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'brand_id': _brandId,
        'code': _code,
        'name': _name,
        'veh_group': _vehGroup,
        'no_seats': _noSeats,
        'engine_capacity': _engineCapacity,
        'weight': _weight,
        'car_group': _carGroup,
        'car_group_detail': _carGroupDetail,
        'car_doors': _carDoors,
        'vehicle_group': _vehicleGroup,
        'ev_flag': _evFlag,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'brand_id': serializeParam(
          _brandId,
          ParamType.String,
        ),
        'code': serializeParam(
          _code,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'veh_group': serializeParam(
          _vehGroup,
          ParamType.String,
        ),
        'no_seats': serializeParam(
          _noSeats,
          ParamType.String,
        ),
        'engine_capacity': serializeParam(
          _engineCapacity,
          ParamType.String,
        ),
        'weight': serializeParam(
          _weight,
          ParamType.String,
        ),
        'car_group': serializeParam(
          _carGroup,
          ParamType.String,
        ),
        'car_group_detail': serializeParam(
          _carGroupDetail,
          ParamType.String,
        ),
        'car_doors': serializeParam(
          _carDoors,
          ParamType.String,
        ),
        'vehicle_group': serializeParam(
          _vehicleGroup,
          ParamType.String,
        ),
        'ev_flag': serializeParam(
          _evFlag,
          ParamType.String,
        ),
      }.withoutNulls;

  static ModelCarMasterModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ModelCarMasterModelStruct(
        brandId: deserializeParam(
          data['brand_id'],
          ParamType.String,
          false,
        ),
        code: deserializeParam(
          data['code'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        vehGroup: deserializeParam(
          data['veh_group'],
          ParamType.String,
          false,
        ),
        noSeats: deserializeParam(
          data['no_seats'],
          ParamType.String,
          false,
        ),
        engineCapacity: deserializeParam(
          data['engine_capacity'],
          ParamType.String,
          false,
        ),
        weight: deserializeParam(
          data['weight'],
          ParamType.String,
          false,
        ),
        carGroup: deserializeParam(
          data['car_group'],
          ParamType.String,
          false,
        ),
        carGroupDetail: deserializeParam(
          data['car_group_detail'],
          ParamType.String,
          false,
        ),
        carDoors: deserializeParam(
          data['car_doors'],
          ParamType.String,
          false,
        ),
        vehicleGroup: deserializeParam(
          data['vehicle_group'],
          ParamType.String,
          false,
        ),
        evFlag: deserializeParam(
          data['ev_flag'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ModelCarMasterModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ModelCarMasterModelStruct &&
        brandId == other.brandId &&
        code == other.code &&
        name == other.name &&
        vehGroup == other.vehGroup &&
        noSeats == other.noSeats &&
        engineCapacity == other.engineCapacity &&
        weight == other.weight &&
        carGroup == other.carGroup &&
        carGroupDetail == other.carGroupDetail &&
        carDoors == other.carDoors &&
        vehicleGroup == other.vehicleGroup &&
        evFlag == other.evFlag;
  }

  @override
  int get hashCode => const ListEquality().hash([
        brandId,
        code,
        name,
        vehGroup,
        noSeats,
        engineCapacity,
        weight,
        carGroup,
        carGroupDetail,
        carDoors,
        vehicleGroup,
        evFlag
      ]);
}

ModelCarMasterModelStruct createModelCarMasterModelStruct({
  String? brandId,
  String? code,
  String? name,
  String? vehGroup,
  String? noSeats,
  String? engineCapacity,
  String? weight,
  String? carGroup,
  String? carGroupDetail,
  String? carDoors,
  String? vehicleGroup,
  String? evFlag,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ModelCarMasterModelStruct(
      brandId: brandId,
      code: code,
      name: name,
      vehGroup: vehGroup,
      noSeats: noSeats,
      engineCapacity: engineCapacity,
      weight: weight,
      carGroup: carGroup,
      carGroupDetail: carGroupDetail,
      carDoors: carDoors,
      vehicleGroup: vehicleGroup,
      evFlag: evFlag,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ModelCarMasterModelStruct? updateModelCarMasterModelStruct(
  ModelCarMasterModelStruct? modelCarMasterModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    modelCarMasterModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addModelCarMasterModelStructData(
  Map<String, dynamic> firestoreData,
  ModelCarMasterModelStruct? modelCarMasterModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (modelCarMasterModel == null) {
    return;
  }
  if (modelCarMasterModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && modelCarMasterModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final modelCarMasterModelData =
      getModelCarMasterModelFirestoreData(modelCarMasterModel, forFieldValue);
  final nestedData =
      modelCarMasterModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      modelCarMasterModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getModelCarMasterModelFirestoreData(
  ModelCarMasterModelStruct? modelCarMasterModel, [
  bool forFieldValue = false,
]) {
  if (modelCarMasterModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(modelCarMasterModel.toMap());

  // Add any Firestore field values
  modelCarMasterModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getModelCarMasterModelListFirestoreData(
  List<ModelCarMasterModelStruct>? modelCarMasterModels,
) =>
    modelCarMasterModels
        ?.map((e) => getModelCarMasterModelFirestoreData(e, true))
        .toList() ??
    [];
