// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class SaveTopupLHModelStruct extends FFFirebaseStruct {
  SaveTopupLHModelStruct({
    String? branchCode,
    String? branchName,
    String? titleId,
    String? titleName,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? birthDate,
    String? age,
    String? email,
    String? contractThaiId,
    String? pdpaFlg,
    String? pdpaDate,
    String? utmSource,
    String? utmMedium,
    String? utmCampaign,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _branchCode = branchCode,
        _branchName = branchName,
        _titleId = titleId,
        _titleName = titleName,
        _firstName = firstName,
        _lastName = lastName,
        _phoneNumber = phoneNumber,
        _birthDate = birthDate,
        _age = age,
        _email = email,
        _contractThaiId = contractThaiId,
        _pdpaFlg = pdpaFlg,
        _pdpaDate = pdpaDate,
        _utmSource = utmSource,
        _utmMedium = utmMedium,
        _utmCampaign = utmCampaign,
        super(firestoreUtilData);

  // "branch_code" field.
  String? _branchCode;
  String get branchCode => _branchCode ?? '';
  set branchCode(String? val) => _branchCode = val;

  bool hasBranchCode() => _branchCode != null;

  // "branch_name" field.
  String? _branchName;
  String get branchName => _branchName ?? '';
  set branchName(String? val) => _branchName = val;

  bool hasBranchName() => _branchName != null;

  // "title_id" field.
  String? _titleId;
  String get titleId => _titleId ?? '';
  set titleId(String? val) => _titleId = val;

  bool hasTitleId() => _titleId != null;

  // "title_name" field.
  String? _titleName;
  String get titleName => _titleName ?? '';
  set titleName(String? val) => _titleName = val;

  bool hasTitleName() => _titleName != null;

  // "first_name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  set firstName(String? val) => _firstName = val;

  bool hasFirstName() => _firstName != null;

  // "last_name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  set lastName(String? val) => _lastName = val;

  bool hasLastName() => _lastName != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  set phoneNumber(String? val) => _phoneNumber = val;

  bool hasPhoneNumber() => _phoneNumber != null;

  // "birth_date" field.
  String? _birthDate;
  String get birthDate => _birthDate ?? '';
  set birthDate(String? val) => _birthDate = val;

  bool hasBirthDate() => _birthDate != null;

  // "age" field.
  String? _age;
  String get age => _age ?? '';
  set age(String? val) => _age = val;

  bool hasAge() => _age != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "contract_thai_id" field.
  String? _contractThaiId;
  String get contractThaiId => _contractThaiId ?? '';
  set contractThaiId(String? val) => _contractThaiId = val;

  bool hasContractThaiId() => _contractThaiId != null;

  // "pdpa_flg" field.
  String? _pdpaFlg;
  String get pdpaFlg => _pdpaFlg ?? '';
  set pdpaFlg(String? val) => _pdpaFlg = val;

  bool hasPdpaFlg() => _pdpaFlg != null;

  // "pdpa_date" field.
  String? _pdpaDate;
  String get pdpaDate => _pdpaDate ?? '';
  set pdpaDate(String? val) => _pdpaDate = val;

  bool hasPdpaDate() => _pdpaDate != null;

  // "utm_source" field.
  String? _utmSource;
  String get utmSource => _utmSource ?? '';
  set utmSource(String? val) => _utmSource = val;

  bool hasUtmSource() => _utmSource != null;

  // "utm_medium" field.
  String? _utmMedium;
  String get utmMedium => _utmMedium ?? '';
  set utmMedium(String? val) => _utmMedium = val;

  bool hasUtmMedium() => _utmMedium != null;

  // "utm_campaign" field.
  String? _utmCampaign;
  String get utmCampaign => _utmCampaign ?? '';
  set utmCampaign(String? val) => _utmCampaign = val;

  bool hasUtmCampaign() => _utmCampaign != null;

  static SaveTopupLHModelStruct fromMap(Map<String, dynamic> data) =>
      SaveTopupLHModelStruct(
        branchCode: data['branch_code'] as String?,
        branchName: data['branch_name'] as String?,
        titleId: data['title_id'] as String?,
        titleName: data['title_name'] as String?,
        firstName: data['first_name'] as String?,
        lastName: data['last_name'] as String?,
        phoneNumber: data['phone_number'] as String?,
        birthDate: data['birth_date'] as String?,
        age: data['age'] as String?,
        email: data['email'] as String?,
        contractThaiId: data['contract_thai_id'] as String?,
        pdpaFlg: data['pdpa_flg'] as String?,
        pdpaDate: data['pdpa_date'] as String?,
        utmSource: data['utm_source'] as String?,
        utmMedium: data['utm_medium'] as String?,
        utmCampaign: data['utm_campaign'] as String?,
      );

  static SaveTopupLHModelStruct? maybeFromMap(dynamic data) => data is Map
      ? SaveTopupLHModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'branch_code': _branchCode,
        'branch_name': _branchName,
        'title_id': _titleId,
        'title_name': _titleName,
        'first_name': _firstName,
        'last_name': _lastName,
        'phone_number': _phoneNumber,
        'birth_date': _birthDate,
        'age': _age,
        'email': _email,
        'contract_thai_id': _contractThaiId,
        'pdpa_flg': _pdpaFlg,
        'pdpa_date': _pdpaDate,
        'utm_source': _utmSource,
        'utm_medium': _utmMedium,
        'utm_campaign': _utmCampaign,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'branch_code': serializeParam(
          _branchCode,
          ParamType.String,
        ),
        'branch_name': serializeParam(
          _branchName,
          ParamType.String,
        ),
        'title_id': serializeParam(
          _titleId,
          ParamType.String,
        ),
        'title_name': serializeParam(
          _titleName,
          ParamType.String,
        ),
        'first_name': serializeParam(
          _firstName,
          ParamType.String,
        ),
        'last_name': serializeParam(
          _lastName,
          ParamType.String,
        ),
        'phone_number': serializeParam(
          _phoneNumber,
          ParamType.String,
        ),
        'birth_date': serializeParam(
          _birthDate,
          ParamType.String,
        ),
        'age': serializeParam(
          _age,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'contract_thai_id': serializeParam(
          _contractThaiId,
          ParamType.String,
        ),
        'pdpa_flg': serializeParam(
          _pdpaFlg,
          ParamType.String,
        ),
        'pdpa_date': serializeParam(
          _pdpaDate,
          ParamType.String,
        ),
        'utm_source': serializeParam(
          _utmSource,
          ParamType.String,
        ),
        'utm_medium': serializeParam(
          _utmMedium,
          ParamType.String,
        ),
        'utm_campaign': serializeParam(
          _utmCampaign,
          ParamType.String,
        ),
      }.withoutNulls;

  static SaveTopupLHModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      SaveTopupLHModelStruct(
        branchCode: deserializeParam(
          data['branch_code'],
          ParamType.String,
          false,
        ),
        branchName: deserializeParam(
          data['branch_name'],
          ParamType.String,
          false,
        ),
        titleId: deserializeParam(
          data['title_id'],
          ParamType.String,
          false,
        ),
        titleName: deserializeParam(
          data['title_name'],
          ParamType.String,
          false,
        ),
        firstName: deserializeParam(
          data['first_name'],
          ParamType.String,
          false,
        ),
        lastName: deserializeParam(
          data['last_name'],
          ParamType.String,
          false,
        ),
        phoneNumber: deserializeParam(
          data['phone_number'],
          ParamType.String,
          false,
        ),
        birthDate: deserializeParam(
          data['birth_date'],
          ParamType.String,
          false,
        ),
        age: deserializeParam(
          data['age'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        contractThaiId: deserializeParam(
          data['contract_thai_id'],
          ParamType.String,
          false,
        ),
        pdpaFlg: deserializeParam(
          data['pdpa_flg'],
          ParamType.String,
          false,
        ),
        pdpaDate: deserializeParam(
          data['pdpa_date'],
          ParamType.String,
          false,
        ),
        utmSource: deserializeParam(
          data['utm_source'],
          ParamType.String,
          false,
        ),
        utmMedium: deserializeParam(
          data['utm_medium'],
          ParamType.String,
          false,
        ),
        utmCampaign: deserializeParam(
          data['utm_campaign'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SaveTopupLHModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SaveTopupLHModelStruct &&
        branchCode == other.branchCode &&
        branchName == other.branchName &&
        titleId == other.titleId &&
        titleName == other.titleName &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        phoneNumber == other.phoneNumber &&
        birthDate == other.birthDate &&
        age == other.age &&
        email == other.email &&
        contractThaiId == other.contractThaiId &&
        pdpaFlg == other.pdpaFlg &&
        pdpaDate == other.pdpaDate &&
        utmSource == other.utmSource &&
        utmMedium == other.utmMedium &&
        utmCampaign == other.utmCampaign;
  }

  @override
  int get hashCode => const ListEquality().hash([
        branchCode,
        branchName,
        titleId,
        titleName,
        firstName,
        lastName,
        phoneNumber,
        birthDate,
        age,
        email,
        contractThaiId,
        pdpaFlg,
        pdpaDate,
        utmSource,
        utmMedium,
        utmCampaign
      ]);
}

SaveTopupLHModelStruct createSaveTopupLHModelStruct({
  String? branchCode,
  String? branchName,
  String? titleId,
  String? titleName,
  String? firstName,
  String? lastName,
  String? phoneNumber,
  String? birthDate,
  String? age,
  String? email,
  String? contractThaiId,
  String? pdpaFlg,
  String? pdpaDate,
  String? utmSource,
  String? utmMedium,
  String? utmCampaign,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SaveTopupLHModelStruct(
      branchCode: branchCode,
      branchName: branchName,
      titleId: titleId,
      titleName: titleName,
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
      birthDate: birthDate,
      age: age,
      email: email,
      contractThaiId: contractThaiId,
      pdpaFlg: pdpaFlg,
      pdpaDate: pdpaDate,
      utmSource: utmSource,
      utmMedium: utmMedium,
      utmCampaign: utmCampaign,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SaveTopupLHModelStruct? updateSaveTopupLHModelStruct(
  SaveTopupLHModelStruct? saveTopupLHModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    saveTopupLHModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSaveTopupLHModelStructData(
  Map<String, dynamic> firestoreData,
  SaveTopupLHModelStruct? saveTopupLHModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (saveTopupLHModel == null) {
    return;
  }
  if (saveTopupLHModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && saveTopupLHModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final saveTopupLHModelData =
      getSaveTopupLHModelFirestoreData(saveTopupLHModel, forFieldValue);
  final nestedData =
      saveTopupLHModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = saveTopupLHModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSaveTopupLHModelFirestoreData(
  SaveTopupLHModelStruct? saveTopupLHModel, [
  bool forFieldValue = false,
]) {
  if (saveTopupLHModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(saveTopupLHModel.toMap());

  // Add any Firestore field values
  mapToFirestore(saveTopupLHModel.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSaveTopupLHModelListFirestoreData(
  List<SaveTopupLHModelStruct>? saveTopupLHModels,
) =>
    saveTopupLHModels
        ?.map((e) => getSaveTopupLHModelFirestoreData(e, true))
        .toList() ??
    [];
