// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OCRResultsModelStruct extends FFFirebaseStruct {
  OCRResultsModelStruct({
    String? language,
    List<int>? bbox,
    double? score,
    String? text,
    String? croppedFile,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _language = language,
        _bbox = bbox,
        _score = score,
        _text = text,
        _croppedFile = croppedFile,
        super(firestoreUtilData);

  // "language" field.
  String? _language;
  String get language => _language ?? '';
  set language(String? val) => _language = val;

  bool hasLanguage() => _language != null;

  // "bbox" field.
  List<int>? _bbox;
  List<int> get bbox => _bbox ?? const [];
  set bbox(List<int>? val) => _bbox = val;

  void updateBbox(Function(List<int>) updateFn) {
    updateFn(_bbox ??= []);
  }

  bool hasBbox() => _bbox != null;

  // "score" field.
  double? _score;
  double get score => _score ?? 0.0;
  set score(double? val) => _score = val;

  void incrementScore(double amount) => score = score + amount;

  bool hasScore() => _score != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;

  bool hasText() => _text != null;

  // "cropped_file" field.
  String? _croppedFile;
  String get croppedFile => _croppedFile ?? '';
  set croppedFile(String? val) => _croppedFile = val;

  bool hasCroppedFile() => _croppedFile != null;

  static OCRResultsModelStruct fromMap(Map<String, dynamic> data) =>
      OCRResultsModelStruct(
        language: data['language'] as String?,
        bbox: getDataList(data['bbox']),
        score: castToType<double>(data['score']),
        text: data['text'] as String?,
        croppedFile: data['cropped_file'] as String?,
      );

  static OCRResultsModelStruct? maybeFromMap(dynamic data) => data is Map
      ? OCRResultsModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'language': _language,
        'bbox': _bbox,
        'score': _score,
        'text': _text,
        'cropped_file': _croppedFile,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'language': serializeParam(
          _language,
          ParamType.String,
        ),
        'bbox': serializeParam(
          _bbox,
          ParamType.int,
          isList: true,
        ),
        'score': serializeParam(
          _score,
          ParamType.double,
        ),
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
        'cropped_file': serializeParam(
          _croppedFile,
          ParamType.String,
        ),
      }.withoutNulls;

  static OCRResultsModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      OCRResultsModelStruct(
        language: deserializeParam(
          data['language'],
          ParamType.String,
          false,
        ),
        bbox: deserializeParam<int>(
          data['bbox'],
          ParamType.int,
          true,
        ),
        score: deserializeParam(
          data['score'],
          ParamType.double,
          false,
        ),
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
        croppedFile: deserializeParam(
          data['cropped_file'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'OCRResultsModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is OCRResultsModelStruct &&
        language == other.language &&
        listEquality.equals(bbox, other.bbox) &&
        score == other.score &&
        text == other.text &&
        croppedFile == other.croppedFile;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([language, bbox, score, text, croppedFile]);
}

OCRResultsModelStruct createOCRResultsModelStruct({
  String? language,
  double? score,
  String? text,
  String? croppedFile,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    OCRResultsModelStruct(
      language: language,
      score: score,
      text: text,
      croppedFile: croppedFile,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

OCRResultsModelStruct? updateOCRResultsModelStruct(
  OCRResultsModelStruct? oCRResultsModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    oCRResultsModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addOCRResultsModelStructData(
  Map<String, dynamic> firestoreData,
  OCRResultsModelStruct? oCRResultsModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (oCRResultsModel == null) {
    return;
  }
  if (oCRResultsModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && oCRResultsModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final oCRResultsModelData =
      getOCRResultsModelFirestoreData(oCRResultsModel, forFieldValue);
  final nestedData =
      oCRResultsModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = oCRResultsModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getOCRResultsModelFirestoreData(
  OCRResultsModelStruct? oCRResultsModel, [
  bool forFieldValue = false,
]) {
  if (oCRResultsModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(oCRResultsModel.toMap());

  // Add any Firestore field values
  oCRResultsModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getOCRResultsModelListFirestoreData(
  List<OCRResultsModelStruct>? oCRResultsModels,
) =>
    oCRResultsModels
        ?.map((e) => getOCRResultsModelFirestoreData(e, true))
        .toList() ??
    [];
