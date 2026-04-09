// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class AuthenticationDataModelStruct extends FFFirebaseStruct {
  AuthenticationDataModelStruct({
    String? accessToken,
    String? tokenType,
    String? expiresAt,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _accessToken = accessToken,
        _tokenType = tokenType,
        _expiresAt = expiresAt,
        super(firestoreUtilData);

  // "access_token" field.
  String? _accessToken;
  String get accessToken => _accessToken ?? '';
  set accessToken(String? val) => _accessToken = val;

  bool hasAccessToken() => _accessToken != null;

  // "token_type" field.
  String? _tokenType;
  String get tokenType => _tokenType ?? '';
  set tokenType(String? val) => _tokenType = val;

  bool hasTokenType() => _tokenType != null;

  // "expires_at" field.
  String? _expiresAt;
  String get expiresAt => _expiresAt ?? '';
  set expiresAt(String? val) => _expiresAt = val;

  bool hasExpiresAt() => _expiresAt != null;

  static AuthenticationDataModelStruct fromMap(Map<String, dynamic> data) =>
      AuthenticationDataModelStruct(
        accessToken: data['access_token'] as String?,
        tokenType: data['token_type'] as String?,
        expiresAt: data['expires_at'] as String?,
      );

  static AuthenticationDataModelStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? AuthenticationDataModelStruct.fromMap(data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'access_token': _accessToken,
        'token_type': _tokenType,
        'expires_at': _expiresAt,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'access_token': serializeParam(
          _accessToken,
          ParamType.String,
        ),
        'token_type': serializeParam(
          _tokenType,
          ParamType.String,
        ),
        'expires_at': serializeParam(
          _expiresAt,
          ParamType.String,
        ),
      }.withoutNulls;

  static AuthenticationDataModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      AuthenticationDataModelStruct(
        accessToken: deserializeParam(
          data['access_token'],
          ParamType.String,
          false,
        ),
        tokenType: deserializeParam(
          data['token_type'],
          ParamType.String,
          false,
        ),
        expiresAt: deserializeParam(
          data['expires_at'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AuthenticationDataModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AuthenticationDataModelStruct &&
        accessToken == other.accessToken &&
        tokenType == other.tokenType &&
        expiresAt == other.expiresAt;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([accessToken, tokenType, expiresAt]);
}

AuthenticationDataModelStruct createAuthenticationDataModelStruct({
  String? accessToken,
  String? tokenType,
  String? expiresAt,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AuthenticationDataModelStruct(
      accessToken: accessToken,
      tokenType: tokenType,
      expiresAt: expiresAt,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AuthenticationDataModelStruct? updateAuthenticationDataModelStruct(
  AuthenticationDataModelStruct? authenticationDataModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    authenticationDataModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAuthenticationDataModelStructData(
  Map<String, dynamic> firestoreData,
  AuthenticationDataModelStruct? authenticationDataModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (authenticationDataModel == null) {
    return;
  }
  if (authenticationDataModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      authenticationDataModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final authenticationDataModelData = getAuthenticationDataModelFirestoreData(
      authenticationDataModel, forFieldValue);
  final nestedData =
      authenticationDataModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      authenticationDataModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAuthenticationDataModelFirestoreData(
  AuthenticationDataModelStruct? authenticationDataModel, [
  bool forFieldValue = false,
]) {
  if (authenticationDataModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(authenticationDataModel.toMap());

  // Add any Firestore field values
  mapToFirestore(authenticationDataModel.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAuthenticationDataModelListFirestoreData(
  List<AuthenticationDataModelStruct>? authenticationDataModels,
) =>
    authenticationDataModels
        ?.map((e) => getAuthenticationDataModelFirestoreData(e, true))
        .toList() ??
    [];
