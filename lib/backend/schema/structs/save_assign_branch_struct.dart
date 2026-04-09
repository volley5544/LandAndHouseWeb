// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class SaveAssignBranchStruct extends FFFirebaseStruct {
  SaveAssignBranchStruct({
    String? empCode,
    String? mode,
    String? leadId,
    String? branchCode,
    String? assignType,
    String? remark,
    String? regionCode,
    String? token,
    String? level,
    String? level2,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _empCode = empCode,
        _mode = mode,
        _leadId = leadId,
        _branchCode = branchCode,
        _assignType = assignType,
        _remark = remark,
        _regionCode = regionCode,
        _token = token,
        _level = level,
        _level2 = level2,
        super(firestoreUtilData);

  // "emp_code" field.
  String? _empCode;
  String get empCode => _empCode ?? '';
  set empCode(String? val) => _empCode = val;

  bool hasEmpCode() => _empCode != null;

  // "mode" field.
  String? _mode;
  String get mode => _mode ?? '';
  set mode(String? val) => _mode = val;

  bool hasMode() => _mode != null;

  // "lead_id" field.
  String? _leadId;
  String get leadId => _leadId ?? '';
  set leadId(String? val) => _leadId = val;

  bool hasLeadId() => _leadId != null;

  // "branch_code" field.
  String? _branchCode;
  String get branchCode => _branchCode ?? '';
  set branchCode(String? val) => _branchCode = val;

  bool hasBranchCode() => _branchCode != null;

  // "assign_type" field.
  String? _assignType;
  String get assignType => _assignType ?? '';
  set assignType(String? val) => _assignType = val;

  bool hasAssignType() => _assignType != null;

  // "remark" field.
  String? _remark;
  String get remark => _remark ?? '';
  set remark(String? val) => _remark = val;

  bool hasRemark() => _remark != null;

  // "region_code" field.
  String? _regionCode;
  String get regionCode => _regionCode ?? '';
  set regionCode(String? val) => _regionCode = val;

  bool hasRegionCode() => _regionCode != null;

  // "token" field.
  String? _token;
  String get token => _token ?? '';
  set token(String? val) => _token = val;

  bool hasToken() => _token != null;

  // "level" field.
  String? _level;
  String get level => _level ?? '';
  set level(String? val) => _level = val;

  bool hasLevel() => _level != null;

  // "level2" field.
  String? _level2;
  String get level2 => _level2 ?? '';
  set level2(String? val) => _level2 = val;

  bool hasLevel2() => _level2 != null;

  static SaveAssignBranchStruct fromMap(Map<String, dynamic> data) =>
      SaveAssignBranchStruct(
        empCode: data['emp_code'] as String?,
        mode: data['mode'] as String?,
        leadId: data['lead_id'] as String?,
        branchCode: data['branch_code'] as String?,
        assignType: data['assign_type'] as String?,
        remark: data['remark'] as String?,
        regionCode: data['region_code'] as String?,
        token: data['token'] as String?,
        level: data['level'] as String?,
        level2: data['level2'] as String?,
      );

  static SaveAssignBranchStruct? maybeFromMap(dynamic data) => data is Map
      ? SaveAssignBranchStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'emp_code': _empCode,
        'mode': _mode,
        'lead_id': _leadId,
        'branch_code': _branchCode,
        'assign_type': _assignType,
        'remark': _remark,
        'region_code': _regionCode,
        'token': _token,
        'level': _level,
        'level2': _level2,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'emp_code': serializeParam(
          _empCode,
          ParamType.String,
        ),
        'mode': serializeParam(
          _mode,
          ParamType.String,
        ),
        'lead_id': serializeParam(
          _leadId,
          ParamType.String,
        ),
        'branch_code': serializeParam(
          _branchCode,
          ParamType.String,
        ),
        'assign_type': serializeParam(
          _assignType,
          ParamType.String,
        ),
        'remark': serializeParam(
          _remark,
          ParamType.String,
        ),
        'region_code': serializeParam(
          _regionCode,
          ParamType.String,
        ),
        'token': serializeParam(
          _token,
          ParamType.String,
        ),
        'level': serializeParam(
          _level,
          ParamType.String,
        ),
        'level2': serializeParam(
          _level2,
          ParamType.String,
        ),
      }.withoutNulls;

  static SaveAssignBranchStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      SaveAssignBranchStruct(
        empCode: deserializeParam(
          data['emp_code'],
          ParamType.String,
          false,
        ),
        mode: deserializeParam(
          data['mode'],
          ParamType.String,
          false,
        ),
        leadId: deserializeParam(
          data['lead_id'],
          ParamType.String,
          false,
        ),
        branchCode: deserializeParam(
          data['branch_code'],
          ParamType.String,
          false,
        ),
        assignType: deserializeParam(
          data['assign_type'],
          ParamType.String,
          false,
        ),
        remark: deserializeParam(
          data['remark'],
          ParamType.String,
          false,
        ),
        regionCode: deserializeParam(
          data['region_code'],
          ParamType.String,
          false,
        ),
        token: deserializeParam(
          data['token'],
          ParamType.String,
          false,
        ),
        level: deserializeParam(
          data['level'],
          ParamType.String,
          false,
        ),
        level2: deserializeParam(
          data['level2'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SaveAssignBranchStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SaveAssignBranchStruct &&
        empCode == other.empCode &&
        mode == other.mode &&
        leadId == other.leadId &&
        branchCode == other.branchCode &&
        assignType == other.assignType &&
        remark == other.remark &&
        regionCode == other.regionCode &&
        token == other.token &&
        level == other.level &&
        level2 == other.level2;
  }

  @override
  int get hashCode => const ListEquality().hash([
        empCode,
        mode,
        leadId,
        branchCode,
        assignType,
        remark,
        regionCode,
        token,
        level,
        level2
      ]);
}

SaveAssignBranchStruct createSaveAssignBranchStruct({
  String? empCode,
  String? mode,
  String? leadId,
  String? branchCode,
  String? assignType,
  String? remark,
  String? regionCode,
  String? token,
  String? level,
  String? level2,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SaveAssignBranchStruct(
      empCode: empCode,
      mode: mode,
      leadId: leadId,
      branchCode: branchCode,
      assignType: assignType,
      remark: remark,
      regionCode: regionCode,
      token: token,
      level: level,
      level2: level2,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SaveAssignBranchStruct? updateSaveAssignBranchStruct(
  SaveAssignBranchStruct? saveAssignBranch, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    saveAssignBranch
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSaveAssignBranchStructData(
  Map<String, dynamic> firestoreData,
  SaveAssignBranchStruct? saveAssignBranch,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (saveAssignBranch == null) {
    return;
  }
  if (saveAssignBranch.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && saveAssignBranch.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final saveAssignBranchData =
      getSaveAssignBranchFirestoreData(saveAssignBranch, forFieldValue);
  final nestedData =
      saveAssignBranchData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = saveAssignBranch.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSaveAssignBranchFirestoreData(
  SaveAssignBranchStruct? saveAssignBranch, [
  bool forFieldValue = false,
]) {
  if (saveAssignBranch == null) {
    return {};
  }
  final firestoreData = mapToFirestore(saveAssignBranch.toMap());

  // Add any Firestore field values
  mapToFirestore(saveAssignBranch.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSaveAssignBranchListFirestoreData(
  List<SaveAssignBranchStruct>? saveAssignBranchs,
) =>
    saveAssignBranchs
        ?.map((e) => getSaveAssignBranchFirestoreData(e, true))
        .toList() ??
    [];
