import 'dart:convert';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start API Master Group Code

class APIMasterGroup {
  static String getBaseUrl({
    String? url = '',
  }) =>
      '${url}';
  static Map<String, String> headers = {};
  static GetMasterAddressCall getMasterAddressCall = GetMasterAddressCall();
}

class GetMasterAddressCall {
  Future<ApiCallResponse> call({
    String? url = '',
  }) async {
    final baseUrl = APIMasterGroup.getBaseUrl(
      url: url,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GetMasterAddress',
      apiUrl: '${baseUrl}/api/insurance/master/get_zipcode',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? statuscode(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  int? total(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.total''',
      ));
  List<String>? provinceid(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].province_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? provincename(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].province_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? districtid(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].district_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? districtname(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].district_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? subdistrictid(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].subdistrict_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? subdistrictname(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].subdistrict_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? zipcode(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].zip_code''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? keyword(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:].keyword''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<AddressDataModelStruct>? data(dynamic response) => (getJsonField(
        response,
        r'''$.results.data[:]''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => AddressDataModelStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
}

/// End API Master Group Code

/// Start Srisawad api Group Code

class SrisawadApiGroup {
  static String getBaseUrl({
    String? apiUrl = '',
  }) =>
      '${apiUrl}';
  static Map<String, String> headers = {
    'x-srisawad': 'x1',
  };
  static ReturnTopupConfigsThatControllTopupUICall
      returnTopupConfigsThatControllTopupUICall =
      ReturnTopupConfigsThatControllTopupUICall();
  static UpdateMemberGetMemberContentThatWikkCall
      updateMemberGetMemberContentThatWikkCall =
      UpdateMemberGetMemberContentThatWikkCall();
  static UpdateRankContentCall updateRankContentCall = UpdateRankContentCall();
  static UpdateRankContentTechDoc451Call updateRankContentTechDoc451Call =
      UpdateRankContentTechDoc451Call();
  static GetListOfLoanCall getListOfLoanCall = GetListOfLoanCall();
  static GetTopupStatusDetailCall getTopupStatusDetailCall =
      GetTopupStatusDetailCall();
  static GetDetailOfLoanCall getDetailOfLoanCall = GetDetailOfLoanCall();
  static UserLogoutCall userLogoutCall = UserLogoutCall();
  static UserLoginCall userLoginCall = UserLoginCall();
  static UserRegisterCall userRegisterCall = UserRegisterCall();
  static ToVerifyWhetherAUserIsASrisawadUserOrAGuestUserCall
      toVerifyWhetherAUserIsASrisawadUserOrAGuestUserCall =
      ToVerifyWhetherAUserIsASrisawadUserOrAGuestUserCall();
  static ToVerifyAndValidateOneUserPerOneDeviceThisEndpointWillNotificationToExisingDifferentDeviceLoginUserToLogoutCall
      toVerifyAndValidateOneUserPerOneDeviceThisEndpointWillNotificationToExisingDifferentDeviceLoginUserToLogoutCall =
      ToVerifyAndValidateOneUserPerOneDeviceThisEndpointWillNotificationToExisingDifferentDeviceLoginUserToLogoutCall();
  static CheckLatestVersionCall checkLatestVersionCall =
      CheckLatestVersionCall();
  static GetApplicationVersionCall getApplicationVersionCall =
      GetApplicationVersionCall();
  static SrisawadAdminManualApiSetApplicationLatestVersionCall
      srisawadAdminManualApiSetApplicationLatestVersionCall =
      SrisawadAdminManualApiSetApplicationLatestVersionCall();
  static GetProvinceMasterCall getProvinceMasterCall = GetProvinceMasterCall();
  static SrisawadAdminManualApiSetRetentionLoanNumberCall
      srisawadAdminManualApiSetRetentionLoanNumberCall =
      SrisawadAdminManualApiSetRetentionLoanNumberCall();
  static GetRetentionLoanNumberCall getRetentionLoanNumberCall =
      GetRetentionLoanNumberCall();
  static SearchBranchByCharacterCall searchBranchByCharacterCall =
      SearchBranchByCharacterCall();
  static SearchBranchByCenterAndRadiusKMCall
      searchBranchByCenterAndRadiusKMCall =
      SearchBranchByCenterAndRadiusKMCall();
  static SrisawadAdminManualApiInitFileBranchDataToDataStoreCall
      srisawadAdminManualApiInitFileBranchDataToDataStoreCall =
      SrisawadAdminManualApiInitFileBranchDataToDataStoreCall();
  static SrisawadAdminManualApiEditDeleteInsertAndBranchBybranchInitialsCall
      srisawadAdminManualApiEditDeleteInsertAndBranchBybranchInitialsCall =
      SrisawadAdminManualApiEditDeleteInsertAndBranchBybranchInitialsCall();
  static GetMemberRankCall getMemberRankCall = GetMemberRankCall();
  static GetMemberRankContentCall getMemberRankContentCall =
      GetMemberRankContentCall();
  static SrisawadAdminManualApiSendNotificationgroupCall
      srisawadAdminManualApiSendNotificationgroupCall =
      SrisawadAdminManualApiSendNotificationgroupCall();
  static SendAnOtpToUserCall sendAnOtpToUserCall = SendAnOtpToUserCall();
  static GetPaymentDetailByIdCall getPaymentDetailByIdCall =
      GetPaymentDetailByIdCall();
  static GetPaymentHistoryDetailByIdCall getPaymentHistoryDetailByIdCall =
      GetPaymentHistoryDetailByIdCall();
  static SaveUserAttachmentToTheDatabaseCall
      saveUserAttachmentToTheDatabaseCall =
      SaveUserAttachmentToTheDatabaseCall();
  static SendAnPdfToUserCall sendAnPdfToUserCall = SendAnPdfToUserCall();
  static GetLoanProductListCall getLoanProductListCall =
      GetLoanProductListCall();
  static GetInsuranceProductListCall getInsuranceProductListCall =
      GetInsuranceProductListCall();
  static GetProductDetailCall getProductDetailCall = GetProductDetailCall();
  static GetProductDetailInsuranceCall getProductDetailInsuranceCall =
      GetProductDetailInsuranceCall();
  static GetProductListCall getProductListCall = GetProductListCall();
  static GetProductListInsuranceCall getProductListInsuranceCall =
      GetProductListInsuranceCall();
  static UpdateUserInformationCall updateUserInformationCall =
      UpdateUserInformationCall();
  static GetUserInformationCall getUserInformationCall =
      GetUserInformationCall();
  static GetUserAddressInformationCall getUserAddressInformationCall =
      GetUserAddressInformationCall();
  static UpdateUserPhoneNumberCall updateUserPhoneNumberCall =
      UpdateUserPhoneNumberCall();
  static GenerateQRCodeCall generateQRCodeCall = GenerateQRCodeCall();
  static GetReferralLinkCall getReferralLinkCall = GetReferralLinkCall();
  static GetReferralLinkContentCall getReferralLinkContentCall =
      GetReferralLinkContentCall();
  static GetListOfRewardCall getListOfRewardCall = GetListOfRewardCall();
  static GetListOfRewardHistoryCall getListOfRewardHistoryCall =
      GetListOfRewardHistoryCall();
  static GetRewarpointByPassingHashThaiIdCall
      getRewarpointByPassingHashThaiIdCall =
      GetRewarpointByPassingHashThaiIdCall();
  static AddEarnPointListCall addEarnPointListCall = AddEarnPointListCall();
  static SaveNewTopupCall saveNewTopupCall = SaveNewTopupCall();
  static PostToCalculatorToGetNewTopupCall postToCalculatorToGetNewTopupCall =
      PostToCalculatorToGetNewTopupCall();
  static GetTopupDetailCall getTopupDetailCall = GetTopupDetailCall();
  static InterestpaymentAPICall interestpaymentAPICall =
      InterestpaymentAPICall();
  static VisionThaiIdCall visionThaiIdCall = VisionThaiIdCall();
}

class ReturnTopupConfigsThatControllTopupUICall {
  Future<ApiCallResponse> call({
    String? bearerAuth = '',
    String? xSrisawad = '',
    String? apiUrl = '',
  }) async {
    final baseUrl = SrisawadApiGroup.getBaseUrl(
      apiUrl: apiUrl,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'return topup configs that controll topup UI .',
      apiUrl: '${baseUrl}/config/',
      callType: ApiCallType.GET,
      headers: {
        'x-srisawad': 'x1',
        'Authorization': 'Bearer ${bearerAuth}',
        'x-srisawad': '${xSrisawad}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateMemberGetMemberContentThatWikkCall {
  Future<ApiCallResponse> call({
    String? basicAuth = '',
    String? xSrisawad = '',
    String? apiUrl = '',
  }) async {
    final baseUrl = SrisawadApiGroup.getBaseUrl(
      apiUrl: apiUrl,
    );

    final ffApiRequestBody = '''
{
  "link_message": "",
  "condition": [
    ""
  ],
  "banner": "",
  "id": "",
  "introduction_steps": [
    ""
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update member get member content that wikk.',
      apiUrl: '${baseUrl}/config/mgm-content',
      callType: ApiCallType.POST,
      headers: {
        'x-srisawad': 'x1',
        'Authorization': 'Basic ${basicAuth}',
        'x-srisawad': '${xSrisawad}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateRankContentCall {
  Future<ApiCallResponse> call({
    String? basicAuth = '',
    String? xSrisawad = '',
    String? apiUrl = '',
  }) async {
    final baseUrl = SrisawadApiGroup.getBaseUrl(
      apiUrl: apiUrl,
    );

    final ffApiRequestBody = '''
{
  "mgm_rank_content": "",
  "ranks": [
    {
      "style_color": {},
      "logo": "",
      "text_color": "",
      "privilege": "",
      "id": "",
      "title": "",
      "conditions": ""
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update rank content.',
      apiUrl: '${baseUrl}/config/rank-content',
      callType: ApiCallType.POST,
      headers: {
        'x-srisawad': 'x1',
        'Authorization': 'Basic ${basicAuth}',
        'x-srisawad': '${xSrisawad}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateRankContentTechDoc451Call {
  Future<ApiCallResponse> call({
    String? basicAuth = '',
    String? xSrisawad = '',
    String? apiUrl = '',
  }) async {
    final baseUrl = SrisawadApiGroup.getBaseUrl(
      apiUrl: apiUrl,
    );

    final ffApiRequestBody = '''
{
  "render_topup_list": false,
  "render_topup_status_list": false
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update rank content. // Tech doc :4.5.1',
      apiUrl: '${baseUrl}/config/ui-render',
      callType: ApiCallType.POST,
      headers: {
        'x-srisawad': 'x1',
        'Authorization': 'Basic ${basicAuth}',
        'x-srisawad': '${xSrisawad}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetListOfLoanCall {
  Future<ApiCallResponse> call({
    String? hashThaiId = '',
    String? authorization = '',
    String? apiUrl = '',
  }) async {
    final baseUrl = SrisawadApiGroup.getBaseUrl(
      apiUrl: apiUrl,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'get list of loan.',
      apiUrl: '${baseUrl}/loan/list',
      callType: ApiCallType.GET,
      headers: {
        'x-srisawad': 'x1',
        'Authorization': 'Bearer ${authorization}',
      },
      params: {
        'hash_thai_id': hashThaiId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<GetLoanListAPIDataTypeStruct>? results(dynamic response) =>
      (getJsonField(
        response,
        r'''$.results''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => GetLoanListAPIDataTypeStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
  List<String>? cantopup(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].topup_detail.can_topup''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetTopupStatusDetailCall {
  Future<ApiCallResponse> call({
    String? hashThaiId = '',
    String? authorization = '',
    String? dbName = '',
    String? transNo = '',
    String? apiUrl = '',
  }) async {
    final baseUrl = SrisawadApiGroup.getBaseUrl(
      apiUrl: apiUrl,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'get topup status detail ',
      apiUrl:
          '${baseUrl}/topup/status-detail/${hashThaiId}/${dbName}/${transNo}',
      callType: ApiCallType.GET,
      headers: {
        'x-srisawad': 'x1',
        'Authorization': 'Bearer ${authorization}',
      },
      params: {
        'hash_thai_id': hashThaiId,
        'db_name': dbName,
        'trans_no': transNo,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  TopupStatusModelStruct? results(dynamic response) =>
      TopupStatusModelStruct.maybeFromMap(getJsonField(
        response,
        r'''$''',
      ));
  String? code(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.code''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class GetDetailOfLoanCall {
  Future<ApiCallResponse> call({
    String? contractNo = '',
    String? dbName = '',
    String? bearerAuth = '',
    String? xSrisawad = '',
    String? apiUrl = '',
  }) async {
    final baseUrl = SrisawadApiGroup.getBaseUrl(
      apiUrl: apiUrl,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'get detail of loan.',
      apiUrl: '${baseUrl}/loan/detail',
      callType: ApiCallType.GET,
      headers: {
        'x-srisawad': 'x1',
        'Authorization': 'Bearer ${bearerAuth}',
        'x-srisawad': '${xSrisawad}',
      },
      params: {
        'contract_no': contractNo,
        'db_name': dbName,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UserLogoutCall {
  Future<ApiCallResponse> call({
    String? xSrisawad = '',
    String? apiUrl = '',
  }) async {
    final baseUrl = SrisawadApiGroup.getBaseUrl(
      apiUrl: apiUrl,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'User logout.',
      apiUrl: '${baseUrl}/auth/logout',
      callType: ApiCallType.POST,
      headers: {
        'x-srisawad': 'x1',
        'x-srisawad': '${xSrisawad}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UserLoginCall {
  Future<ApiCallResponse> call({
    String? xSrisawad = '',
    String? apiUrl = '',
  }) async {
    final baseUrl = SrisawadApiGroup.getBaseUrl(
      apiUrl: apiUrl,
    );

    final ffApiRequestBody = '''
{
  "thai_id": "",
  "phone_number": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'User login.',
      apiUrl: '${baseUrl}/auth/login',
      callType: ApiCallType.POST,
      headers: {
        'x-srisawad': 'x1',
        'x-srisawad': '${xSrisawad}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UserRegisterCall {
  Future<ApiCallResponse> call({
    String? xSrisawad = '',
    String? apiUrl = '',
  }) async {
    final baseUrl = SrisawadApiGroup.getBaseUrl(
      apiUrl: apiUrl,
    );

    final ffApiRequestBody = '''
{
  "thai_id": "",
  "phone_number": "",
  "first_name": "",
  "last_name": "",
  "title": "",
  "dob": "",
  "email": "",
  "address_details": "",
  "address_sub_district": "",
  "address_district": "",
  "address_province": "",
  "address_postal_code": "",
  "line_id": "",
  "referrer_hash_thai_id": "",
  "is_mgm": false
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'User register.',
      apiUrl: '${baseUrl}/auth/register',
      callType: ApiCallType.POST,
      headers: {
        'x-srisawad': 'x1',
        'x-srisawad': '${xSrisawad}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ToVerifyWhetherAUserIsASrisawadUserOrAGuestUserCall {
  Future<ApiCallResponse> call({
    String? xSrisawad = '',
    String? apiUrl = '',
  }) async {
    final baseUrl = SrisawadApiGroup.getBaseUrl(
      apiUrl: apiUrl,
    );

    final ffApiRequestBody = '''
{
  "thai_id": "",
  "phone_number": "",
  "device_id": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'To verify whether a user is a Srisawad user or a guest user.',
      apiUrl: '${baseUrl}/auth/verify',
      callType: ApiCallType.POST,
      headers: {
        'x-srisawad': 'x1',
        'x-srisawad': '${xSrisawad}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ToVerifyAndValidateOneUserPerOneDeviceThisEndpointWillNotificationToExisingDifferentDeviceLoginUserToLogoutCall {
  Future<ApiCallResponse> call({
    String? xSrisawad = '',
    String? apiUrl = '',
  }) async {
    final baseUrl = SrisawadApiGroup.getBaseUrl(
      apiUrl: apiUrl,
    );

    final ffApiRequestBody = '''
{
  "hash_thai_id": "",
  "fcm_token": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName:
          'To verify and validate one user per one device. This endpoint will notification to exising  different device login user to logout.',
      apiUrl: '${baseUrl}/auth/active-device',
      callType: ApiCallType.POST,
      headers: {
        'x-srisawad': 'x1',
        'x-srisawad': '${xSrisawad}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CheckLatestVersionCall {
  Future<ApiCallResponse> call({
    String? version = '',
    String? xSrisawad = '',
    String? apiUrl = '',
  }) async {
    final baseUrl = SrisawadApiGroup.getBaseUrl(
      apiUrl: apiUrl,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Check latest version.',
      apiUrl: '${baseUrl}/version/check/${version}',
      callType: ApiCallType.GET,
      headers: {
        'x-srisawad': 'x1',
        'x-srisawad': '${xSrisawad}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetApplicationVersionCall {
  Future<ApiCallResponse> call({
    String? basicAuth = '',
    String? apiUrl = '',
  }) async {
    final baseUrl = SrisawadApiGroup.getBaseUrl(
      apiUrl: apiUrl,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get application version.',
      apiUrl: '${baseUrl}/version',
      callType: ApiCallType.GET,
      headers: {
        'x-srisawad': 'x1',
        'Authorization': 'Basic ${basicAuth}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SrisawadAdminManualApiSetApplicationLatestVersionCall {
  Future<ApiCallResponse> call({
    String? basicAuth = '',
    String? apiUrl = '',
  }) async {
    final baseUrl = SrisawadApiGroup.getBaseUrl(
      apiUrl: apiUrl,
    );

    final ffApiRequestBody = '''
{
  "version": "1.0.0"
}''';
    return ApiManager.instance.makeApiCall(
      callName: '[Srisawad admin manual api] Set application latest version.',
      apiUrl: '${baseUrl}/version',
      callType: ApiCallType.POST,
      headers: {
        'x-srisawad': 'x1',
        'Authorization': 'Basic ${basicAuth}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetProvinceMasterCall {
  Future<ApiCallResponse> call({
    String? getBy = '',
    String? apiUrl = '',
  }) async {
    final baseUrl = SrisawadApiGroup.getBaseUrl(
      apiUrl: apiUrl,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'get province master',
      apiUrl: '${baseUrl}/addressMaster',
      callType: ApiCallType.GET,
      headers: {
        'x-srisawad': 'x1',
      },
      params: {
        'getBy': getBy,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SrisawadAdminManualApiSetRetentionLoanNumberCall {
  Future<ApiCallResponse> call({
    String? basicAuth = '',
    String? apiUrl = '',
  }) async {
    final baseUrl = SrisawadApiGroup.getBaseUrl(
      apiUrl: apiUrl,
    );

    final ffApiRequestBody = '''
{
  "loan_retention_number": 1
}''';
    return ApiManager.instance.makeApiCall(
      callName: '[Srisawad admin manual api] Set retention loan number.',
      apiUrl: '${baseUrl}/retentionLoanNumber',
      callType: ApiCallType.POST,
      headers: {
        'x-srisawad': 'x1',
        'Authorization': 'Basic ${basicAuth}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetRetentionLoanNumberCall {
  Future<ApiCallResponse> call({
    String? xSrisawad = '',
    String? apiUrl = '',
  }) async {
    final baseUrl = SrisawadApiGroup.getBaseUrl(
      apiUrl: apiUrl,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get retention loan number.',
      apiUrl: '${baseUrl}/retentionLoanNumber',
      callType: ApiCallType.GET,
      headers: {
        'x-srisawad': 'x1',
        'x-srisawad': '${xSrisawad}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SearchBranchByCharacterCall {
  Future<ApiCallResponse> call({
    String? search = '',
    String? limit = '',
    String? lat = '',
    String? lng = '',
    String? bearerAuth = '',
    String? xSrisawad = '',
    String? apiUrl = '',
  }) async {
    final baseUrl = SrisawadApiGroup.getBaseUrl(
      apiUrl: apiUrl,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Search branch by Character.',
      apiUrl: '${baseUrl}/map/search',
      callType: ApiCallType.GET,
      headers: {
        'x-srisawad': 'x1',
        'Authorization': 'Bearer ${bearerAuth}',
        'x-srisawad': '${xSrisawad}',
      },
      params: {
        'search': search,
        'limit': limit,
        'lat': lat,
        'lng': lng,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SearchBranchByCenterAndRadiusKMCall {
  Future<ApiCallResponse> call({
    String? lat = '',
    String? lng = '',
    String? distanceKM = '',
    String? bearerAuth = '',
    String? xSrisawad = '',
    String? apiUrl = '',
  }) async {
    final baseUrl = SrisawadApiGroup.getBaseUrl(
      apiUrl: apiUrl,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Search branch by center and radius KM.',
      apiUrl: '${baseUrl}/map/nearby',
      callType: ApiCallType.GET,
      headers: {
        'x-srisawad': 'x1',
        'Authorization': 'Bearer ${bearerAuth}',
        'x-srisawad': '${xSrisawad}',
      },
      params: {
        'lat': lat,
        'lng': lng,
        'distanceKM': distanceKM,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SrisawadAdminManualApiInitFileBranchDataToDataStoreCall {
  Future<ApiCallResponse> call({
    String? basicAuth = '',
    String? apiUrl = '',
  }) async {
    final baseUrl = SrisawadApiGroup.getBaseUrl(
      apiUrl: apiUrl,
    );

    return ApiManager.instance.makeApiCall(
      callName:
          '[Srisawad admin manual api] init file branch data to data store',
      apiUrl: '${baseUrl}/map/initfile',
      callType: ApiCallType.GET,
      headers: {
        'x-srisawad': 'x1',
        'Authorization': 'Basic ${basicAuth}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SrisawadAdminManualApiEditDeleteInsertAndBranchBybranchInitialsCall {
  Future<ApiCallResponse> call({
    String? basicAuth = '',
    String? apiUrl = '',
  }) async {
    final baseUrl = SrisawadApiGroup.getBaseUrl(
      apiUrl: apiUrl,
    );

    final ffApiRequestBody = '''
{
  "update": [
    {
      "Latitude": "",
      "Longtitude": "",
      "address_province": "",
      "branch_initials": "",
      "branch_name": "",
      "address_sub_district": "",
      "address_details": "",
      "branch_id": "",
      "address_postal_code": "",
      "address_district": "",
      "email": "",
      "branch_phone_number": "",
      "phone_number": ""
    }
  ],
  "delete": [
    {
      "branch_initials": ""
    }
  ],
  "insert": [
    {
      "Latitude": "",
      "Longtitude": "",
      "address_province": "",
      "branch_initials": "",
      "branch_name": "",
      "address_sub_district": "",
      "address_details": "",
      "branch_id": "",
      "address_postal_code": "",
      "address_district": "",
      "email": "",
      "branch_phone_number": "",
      "phone_number": ""
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName:
          '[Srisawad admin manual api] Edit Delete Insert and branch by \'branch_initials\'.',
      apiUrl: '${baseUrl}/map/edit-branch',
      callType: ApiCallType.POST,
      headers: {
        'x-srisawad': 'x1',
        'Authorization': 'Basic ${basicAuth}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetMemberRankCall {
  Future<ApiCallResponse> call({
    String? hashThaiId = '',
    String? bearerAuth = '',
    String? xSrisawad = '',
    String? apiUrl = '',
  }) async {
    final baseUrl = SrisawadApiGroup.getBaseUrl(
      apiUrl: apiUrl,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get member rank.',
      apiUrl: '${baseUrl}/member-rank',
      callType: ApiCallType.POST,
      headers: {
        'x-srisawad': 'x1',
        'Authorization': 'Bearer ${bearerAuth}',
        'x-srisawad': '${xSrisawad}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetMemberRankContentCall {
  Future<ApiCallResponse> call({
    String? bearerAuth = '',
    String? xSrisawad = '',
    String? apiUrl = '',
  }) async {
    final baseUrl = SrisawadApiGroup.getBaseUrl(
      apiUrl: apiUrl,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get member rank content',
      apiUrl: '${baseUrl}/member-rank/content',
      callType: ApiCallType.GET,
      headers: {
        'x-srisawad': 'x1',
        'Authorization': 'Bearer ${bearerAuth}',
        'x-srisawad': '${xSrisawad}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SrisawadAdminManualApiSendNotificationgroupCall {
  Future<ApiCallResponse> call({
    String? basicAuth = '',
    String? apiUrl = '',
  }) async {
    final baseUrl = SrisawadApiGroup.getBaseUrl(
      apiUrl: apiUrl,
    );

    final ffApiRequestBody = '''
{
  "data": [
    {
      "title": "แจ้งครบกำหนดชำระ",
      "body": "คุณมียอดครบกำหนดชำระ 5000 บาทกำหนดชำระภายในวันที่ 20/10/2565",
      "hash_thai_id": "aef3d7798933c52201bc34b8fe47589ae68b8da6da00788557e0b179fd0c7d3a"
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: '[Srisawad admin manual api] send notification(group).',
      apiUrl: '${baseUrl}/notification',
      callType: ApiCallType.POST,
      headers: {
        'x-srisawad': 'x1',
        'Authorization': 'Basic ${basicAuth}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SendAnOtpToUserCall {
  Future<ApiCallResponse> call({
    String? bearerAuth = '',
    String? xSrisawad = '',
    String? apiUrl = '',
  }) async {
    final baseUrl = SrisawadApiGroup.getBaseUrl(
      apiUrl: apiUrl,
    );

    final ffApiRequestBody = '''
{
  "phone_number": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Send an otp to user',
      apiUrl: '${baseUrl}/otp',
      callType: ApiCallType.POST,
      headers: {
        'x-srisawad': 'x1',
        'Authorization': 'Bearer ${bearerAuth}',
        'x-srisawad': '${xSrisawad}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetPaymentDetailByIdCall {
  Future<ApiCallResponse> call({
    String? dbName = '',
    String? id = '',
    String? bearerAuth = '',
    String? xSrisawad = '',
    String? apiUrl = '',
  }) async {
    final baseUrl = SrisawadApiGroup.getBaseUrl(
      apiUrl: apiUrl,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'get payment detail by id',
      apiUrl: '${baseUrl}/payment',
      callType: ApiCallType.GET,
      headers: {
        'x-srisawad': 'x1',
        'Authorization': 'Bearer ${bearerAuth}',
        'x-srisawad': '${xSrisawad}',
      },
      params: {
        'db_name': dbName,
        'id': id,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetPaymentHistoryDetailByIdCall {
  Future<ApiCallResponse> call({
    String? contractNo = '',
    String? bearerAuth = '',
    String? xSrisawad = '',
    String? apiUrl = '',
  }) async {
    final baseUrl = SrisawadApiGroup.getBaseUrl(
      apiUrl: apiUrl,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'get payment history detail by id',
      apiUrl: '${baseUrl}/payment/history/${contractNo}',
      callType: ApiCallType.GET,
      headers: {
        'x-srisawad': 'x1',
        'Authorization': 'Bearer ${bearerAuth}',
        'x-srisawad': '${xSrisawad}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SaveUserAttachmentToTheDatabaseCall {
  Future<ApiCallResponse> call({
    String? hashThaiId = '',
    String? bearerAuth = '',
    String? xSrisawad = '',
    String? apiUrl = '',
  }) async {
    final baseUrl = SrisawadApiGroup.getBaseUrl(
      apiUrl: apiUrl,
    );

    final ffApiRequestBody = '''
{
  "vloan_contract_no": "",
  "first_name": "",
  "last_name": "",
  "national_thai_id": "",
  "hash_thai_id": "",
  "image_slip": "",
  "payment_date": "",
  "db_name": "",
  "ref1": "",
  "ref2": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Save user attachment to the database.',
      apiUrl: '${baseUrl}/payment/attachment/${hashThaiId}',
      callType: ApiCallType.POST,
      headers: {
        'x-srisawad': 'x1',
        'Authorization': 'Bearer ${bearerAuth}',
        'x-srisawad': '${xSrisawad}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SendAnPdfToUserCall {
  Future<ApiCallResponse> call({
    String? bearerAuth = '',
    String? contractNo = '',
    String? dbName = '',
    int? amount,
    String? from = '',
    String? vehicleType = '',
    String? contractBankAccount = '',
    String? contractBankBrandname = '',
    String? contractBankBranch = '',
    String? contractBankType = '',
    String? hashThaiId = '',
    double? interestRate,
    int? installmentNumber,
    double? amountPerInstallment,
    String? startInstallmentDate = '',
    String? installmentDate = '',
    String? apiUrl = '',
  }) async {
    final baseUrl = SrisawadApiGroup.getBaseUrl(
      apiUrl: apiUrl,
    );

    final ffApiRequestBody = '''
{
  "contract_no": "${escapeStringForJson(contractNo)}",
  "db_name": "${escapeStringForJson(dbName)}",
  "amount": ${amount},
  "from": "${escapeStringForJson(from)}",
  "vehicle_type": "${escapeStringForJson(vehicleType)}",
  "contract_bank_account": "${escapeStringForJson(contractBankAccount)}",
  "contract_bank_brandname": "${escapeStringForJson(contractBankBrandname)}",
  "contract_bank_branch": "${escapeStringForJson(contractBankBranch)}",
  "contract_bank_type": "${escapeStringForJson(contractBankType)}",
  "hash_thai_id": "${escapeStringForJson(hashThaiId)}",
  "interest_rate": ${interestRate},
  "installment_number": ${installmentNumber},
  "amount_per_installment": ${amountPerInstallment},
  "start_installment_date": "${escapeStringForJson(startInstallmentDate)}",
  "installment_date": "${escapeStringForJson(installmentDate)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Send an pdf to user',
      apiUrl: '${baseUrl}/pdf/loan',
      callType: ApiCallType.POST,
      headers: {
        'x-srisawad': 'x1',
        'Authorization': 'Bearer ${bearerAuth}',
        'x-srisawad': 'x1_c3Jpc2F3YWQ',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? requestPdfBase64(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.request''',
      ));
  String? receiptPdfBase64(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.receipt''',
      ));
  String? agreementPdfBase64(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.agreement''',
      ));
  PdfLoanDocDataModelStruct? pdfLoanDataJson(dynamic response) =>
      PdfLoanDocDataModelStruct.maybeFromMap(getJsonField(
        response,
        r'''$''',
      ));
}

class GetLoanProductListCall {
  Future<ApiCallResponse> call({
    String? bearerAuth = '',
    String? xSrisawad = '',
    String? apiUrl = '',
  }) async {
    final baseUrl = SrisawadApiGroup.getBaseUrl(
      apiUrl: apiUrl,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'get loan product list.',
      apiUrl: '${baseUrl}/product/list/loan',
      callType: ApiCallType.GET,
      headers: {
        'x-srisawad': 'x1',
        'Authorization': 'Bearer ${bearerAuth}',
        'x-srisawad': '${xSrisawad}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetInsuranceProductListCall {
  Future<ApiCallResponse> call({
    String? bearerAuth = '',
    String? xSrisawad = '',
    String? apiUrl = '',
  }) async {
    final baseUrl = SrisawadApiGroup.getBaseUrl(
      apiUrl: apiUrl,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'get insurance product list.',
      apiUrl: '${baseUrl}/product/list/insurance',
      callType: ApiCallType.GET,
      headers: {
        'x-srisawad': 'x1',
        'Authorization': 'Bearer ${bearerAuth}',
        'x-srisawad': '${xSrisawad}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetProductDetailCall {
  Future<ApiCallResponse> call({
    String? productId = '',
    String? bearerAuth = '',
    String? xSrisawad = '',
    String? apiUrl = '',
  }) async {
    final baseUrl = SrisawadApiGroup.getBaseUrl(
      apiUrl: apiUrl,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'get product detail.',
      apiUrl: '${baseUrl}/product/detail/loan',
      callType: ApiCallType.GET,
      headers: {
        'x-srisawad': 'x1',
        'Authorization': 'Bearer ${bearerAuth}',
      },
      params: {
        'product_id': productId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetProductDetailInsuranceCall {
  Future<ApiCallResponse> call({
    String? productId = '',
    String? bearerAuth = '',
    String? xSrisawad = '',
    String? apiUrl = '',
  }) async {
    final baseUrl = SrisawadApiGroup.getBaseUrl(
      apiUrl: apiUrl,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'get product detail insurance',
      apiUrl: '${baseUrl}/product/detail/insurance',
      callType: ApiCallType.GET,
      headers: {
        'x-srisawad': 'x1',
        'Authorization': 'Bearer ${bearerAuth}',
        'x-srisawad': '${xSrisawad}',
      },
      params: {
        'product_id': productId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetProductListCall {
  Future<ApiCallResponse> call({
    String? bearerAuth = '',
    String? xSrisawad = '',
    String? apiUrl = '',
  }) async {
    final baseUrl = SrisawadApiGroup.getBaseUrl(
      apiUrl: apiUrl,
    );

    final ffApiRequestBody = '''
{
  "hash_thai_id": 11111111119,
  "product_type": "loan",
  "data": {
    "name": "ทดสอบ",
    "surname": "สมมุติ",
    "phone_number": "098-213-1322",
    "asset_type": "รถยนต์",
    "installment_status": "ทดสอบ",
    "credit_limit": "ทดสอบ",
    "expected_date": "ภายในเดือนนี้",
    "avalible_time_to_contract": "ทดสอบ"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'get product list.',
      apiUrl: '${baseUrl}/product/save/loan',
      callType: ApiCallType.POST,
      headers: {
        'x-srisawad': 'x1',
        'Authorization': 'Bearer ${bearerAuth}',
        'x-srisawad': '${xSrisawad}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetProductListInsuranceCall {
  Future<ApiCallResponse> call({
    String? bearerAuth = '',
    String? xSrisawad = '',
    String? apiUrl = '',
  }) async {
    final baseUrl = SrisawadApiGroup.getBaseUrl(
      apiUrl: apiUrl,
    );

    final ffApiRequestBody = '''
{
  "hash_thai_id": 11111111119,
  "product_type": "insurrance",
  "data": {
    "name": "ทดสอบ",
    "surname": "สมมุติ",
    "asset_type": "รถยนต์",
    "phone_number": "098-213-1322",
    "insurance_type": "ประกันรถยนต์",
    "insurance_class": "2+",
    "expected_date": "ภายในเดือนนี้",
    "avalible_time_to_contract": "ทดสอบ"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'get product list insurance',
      apiUrl: '${baseUrl}/product/save/insurance',
      callType: ApiCallType.POST,
      headers: {
        'x-srisawad': 'x1',
        'Authorization': 'Bearer ${bearerAuth}',
        'x-srisawad': '${xSrisawad}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateUserInformationCall {
  Future<ApiCallResponse> call({
    String? hashThaiId = '',
    String? bearerAuth = '',
    String? xSrisawad = '',
    String? apiUrl = '',
  }) async {
    final baseUrl = SrisawadApiGroup.getBaseUrl(
      apiUrl: apiUrl,
    );

    final ffApiRequestBody = '''
{
  "HASH_THAI_ID": "",
  "THAI_ID": "",
  "TITLE": "",
  "FIRST_NAME": "",
  "LAST_NAME": "",
  "PHONE_NUMBER": "",
  "DOB": "",
  "EMAIL": "",
  "ADDR_DETAILS": "",
  "ADDR_SUB_DISTRICT_DESC": "",
  "ADDR_DISTRICT_DESC": "",
  "ADDR_PROVICE_DESC": "",
  "ADDR_POSTAL_CODE": "",
  "LINE_ID": "",
  "STATUS": "",
  "DEVICE_ID": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'update user information.',
      apiUrl: '${baseUrl}/profile/${hashThaiId}',
      callType: ApiCallType.POST,
      headers: {
        'x-srisawad': 'x1',
        'Authorization': 'Bearer ${bearerAuth}',
        'x-srisawad': '${xSrisawad}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetUserInformationCall {
  Future<ApiCallResponse> call({
    String? hashThaiId = '',
    String? bearerAuth = '',
    String? xSrisawad = '',
    String? apiUrl = '',
  }) async {
    final baseUrl = SrisawadApiGroup.getBaseUrl(
      apiUrl: apiUrl,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get user information.',
      apiUrl: '${baseUrl}/profile/${hashThaiId}',
      callType: ApiCallType.GET,
      headers: {
        'x-srisawad': 'x1',
        'Authorization': 'Bearer ${bearerAuth}',
        'x-srisawad': '${xSrisawad}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetUserAddressInformationCall {
  Future<ApiCallResponse> call({
    String? hashThaiId = '',
    String? bearerAuth = '',
    String? xSrisawad = '',
    String? apiUrl = '',
  }) async {
    final baseUrl = SrisawadApiGroup.getBaseUrl(
      apiUrl: apiUrl,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get user address information.',
      apiUrl: '${baseUrl}/profile/address/${hashThaiId}',
      callType: ApiCallType.GET,
      headers: {
        'x-srisawad': 'x1',
        'Authorization': 'Bearer ${bearerAuth}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  UserAllAddressDataModelStruct? addressDataJson(dynamic response) =>
      UserAllAddressDataModelStruct.maybeFromMap(getJsonField(
        response,
        r'''$''',
      ));
}

class UpdateUserPhoneNumberCall {
  Future<ApiCallResponse> call({
    String? hashThaiId = '',
    String? bearerAuth = '',
    String? xSrisawad = '',
    String? apiUrl = '',
  }) async {
    final baseUrl = SrisawadApiGroup.getBaseUrl(
      apiUrl: apiUrl,
    );

    final ffApiRequestBody = '''
{
  "phone_number": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update user phone number.',
      apiUrl: '${baseUrl}/profile/update/phonenumber/${hashThaiId}',
      callType: ApiCallType.POST,
      headers: {
        'x-srisawad': 'x1',
        'Authorization': 'Bearer ${bearerAuth}',
        'x-srisawad': '${xSrisawad}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GenerateQRCodeCall {
  Future<ApiCallResponse> call({
    String? loanType = '',
    String? keySearch = '',
    String? bearerAuth = '',
    String? xSrisawad = '',
    String? apiUrl = '',
  }) async {
    final baseUrl = SrisawadApiGroup.getBaseUrl(
      apiUrl: apiUrl,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Generate QR Code.',
      apiUrl: '${baseUrl}/code/qrcode',
      callType: ApiCallType.GET,
      headers: {
        'x-srisawad': 'x1',
        'Authorization': 'Bearer ${bearerAuth}',
        'x-srisawad': '${xSrisawad}',
      },
      params: {
        'loan_type': loanType,
        'key_search': keySearch,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetReferralLinkCall {
  Future<ApiCallResponse> call({
    String? hashThaiId = '',
    String? fullName = '',
    String? bearerAuth = '',
    String? xSrisawad = '',
    String? apiUrl = '',
  }) async {
    final baseUrl = SrisawadApiGroup.getBaseUrl(
      apiUrl: apiUrl,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'get referral link.',
      apiUrl: '${baseUrl}/referral/link',
      callType: ApiCallType.GET,
      headers: {
        'x-srisawad': 'x1',
        'Authorization': 'Bearer ${bearerAuth}',
        'x-srisawad': '${xSrisawad}',
      },
      params: {
        'hash_thai_id': hashThaiId,
        'full_name': fullName,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetReferralLinkContentCall {
  Future<ApiCallResponse> call({
    String? bearerAuth = '',
    String? xSrisawad = '',
    String? apiUrl = '',
  }) async {
    final baseUrl = SrisawadApiGroup.getBaseUrl(
      apiUrl: apiUrl,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'get referral link content',
      apiUrl: '${baseUrl}/referral/content',
      callType: ApiCallType.GET,
      headers: {
        'x-srisawad': 'x1',
        'Authorization': 'Bearer ${bearerAuth}',
        'x-srisawad': '${xSrisawad}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetListOfRewardCall {
  Future<ApiCallResponse> call({
    String? basicAuth = '',
    String? xSrisawad = '',
    String? apiUrl = '',
  }) async {
    final baseUrl = SrisawadApiGroup.getBaseUrl(
      apiUrl: apiUrl,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'get list of reward.',
      apiUrl: '${baseUrl}/reward/mobile-list',
      callType: ApiCallType.GET,
      headers: {
        'x-srisawad': 'x1',
        'Authorization': 'Basic ${basicAuth}',
        'x-srisawad': '${xSrisawad}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetListOfRewardHistoryCall {
  Future<ApiCallResponse> call({
    String? hashThaiId = '',
    String? bearerAuth = '',
    String? xSrisawad = '',
    String? apiUrl = '',
  }) async {
    final baseUrl = SrisawadApiGroup.getBaseUrl(
      apiUrl: apiUrl,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'get list of reward history.',
      apiUrl: '${baseUrl}/reward-point',
      callType: ApiCallType.GET,
      headers: {
        'x-srisawad': 'x1',
        'Authorization': 'Bearer ${bearerAuth}',
        'x-srisawad': '${xSrisawad}',
      },
      params: {
        'hash_thai_id': hashThaiId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetRewarpointByPassingHashThaiIdCall {
  Future<ApiCallResponse> call({
    String? bearerAuth = '',
    String? xSrisawad = '',
    String? apiUrl = '',
  }) async {
    final baseUrl = SrisawadApiGroup.getBaseUrl(
      apiUrl: apiUrl,
    );

    final ffApiRequestBody = '''
{
  "hash_thai_id": "",
  "reward_id": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'get rewarpoint by passing hash thai id.',
      apiUrl: '${baseUrl}/reward-point',
      callType: ApiCallType.POST,
      headers: {
        'x-srisawad': 'x1',
        'Authorization': 'Bearer ${bearerAuth}',
        'x-srisawad': '${xSrisawad}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AddEarnPointListCall {
  Future<ApiCallResponse> call({
    String? bearerAuth = '',
    String? xSrisawad = '',
    String? apiUrl = '',
  }) async {
    final baseUrl = SrisawadApiGroup.getBaseUrl(
      apiUrl: apiUrl,
    );

    final ffApiRequestBody = '''
{
  "hash_thai_id": "",
  "status": "",
  "type": "",
  "id": "",
  "label": "",
  "point": 0
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add earn point list.',
      apiUrl: '${baseUrl}/reward-point/earn',
      callType: ApiCallType.POST,
      headers: {
        'x-srisawad': 'x1',
        'Authorization': 'Bearer ${bearerAuth}',
        'x-srisawad': '${xSrisawad}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SaveNewTopupCall {
  Future<ApiCallResponse> call({
    String? bearerAuth = '',
    String? lifeInsureAmt = '',
    String? transno = '',
    String? dbName = '',
    String? hashThaiId = '',
    String? contractNo = '',
    String? marketingConsent = '',
    String? sensitiveConsent = '',
    String? latitude = '',
    String? longitude = '',
    double? loanAmount,
    double? topupFee,
    double? feeAmount,
    double? transferAmount,
    double? interestRate,
    double? interestAmount,
    double? totalAmount,
    double? creditLimit,
    double? termPeriod,
    double? regularPeriod,
    double? lastPeriod,
    double? lastPeriodPromo,
    String? actImage = '',
    String? propertyImage = '',
    String? topupRequestFile = '',
    String? topupArgeementFile = '',
    String? topupReceiptFile = '',
    dynamic savePdfJson,
    String? customerImage2 = '',
    String? customerImage3 = '',
    String? carImageFront = '',
    String? carImageBack = '',
    String? carImageLeft = '',
    String? carImageRight = '',
    String? carImageMile = '',
    String? source = '',
    String? referId = '',
    String? apiUrl = '',
  }) async {
    final baseUrl = SrisawadApiGroup.getBaseUrl(
      apiUrl: apiUrl,
    );

    final savePdf = _serializeJson(savePdfJson);
    final ffApiRequestBody = '''
{
"save_pdf":${savePdf},
 "topup_receipt_file": "${escapeStringForJson(topupReceiptFile)}",
"customer_image_2":"${escapeStringForJson(customerImage2)}",
"customer_image_3":"${escapeStringForJson(customerImage3)}",
"car_image_front":"${escapeStringForJson(carImageFront)}",
"car_image_back":"${escapeStringForJson(carImageBack)}",
"car_image_left":"${escapeStringForJson(carImageLeft)}",
"car_image_right":"${escapeStringForJson(carImageRight)}",
"car_image_mile":"${escapeStringForJson(carImageMile)}",
"source":"${escapeStringForJson(source)}",
"refer_id":"${escapeStringForJson(referId)}",
  "life_insure_amt": "${escapeStringForJson(lifeInsureAmt)}",
  "transno": "${escapeStringForJson(transno)}",
  "db_name": "${escapeStringForJson(dbName)}",
  "hash_thai_id": "${escapeStringForJson(hashThaiId)}",
  "contract_no": "${escapeStringForJson(contractNo)}",
  "marketing_consent": "${escapeStringForJson(marketingConsent)}",
  "sensitive_consent": "${escapeStringForJson(sensitiveConsent)}",
  "latitude": "${escapeStringForJson(latitude)}",
  "longitude": "${escapeStringForJson(longitude)}",
  "loan_amount": ${loanAmount},
  "topup_fee": ${topupFee},
  "fee_amount": ${feeAmount},
  "transfer_amount": ${transferAmount},
  "interest_rate": ${interestRate},
  "interest_amount": ${interestAmount},
  "total_amount": ${totalAmount},
  "credit_limit": ${creditLimit},
  "term_period": ${termPeriod},
  "regular_period": ${regularPeriod},
  "last_period": ${lastPeriod},
  "last_period_promo": ${lastPeriodPromo},
  "act_image": "${escapeStringForJson(actImage)}",
  "property_image": "${escapeStringForJson(propertyImage)}",
  "topup_request_file": "${escapeStringForJson(topupRequestFile)}",
  "topup_argeement_file": "${escapeStringForJson(topupArgeementFile)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Save new topup',
      apiUrl: '${baseUrl}/topup',
      callType: ApiCallType.POST,
      headers: {
        'x-srisawad': 'x1',
        'Authorization': 'Bearer ${bearerAuth}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PostToCalculatorToGetNewTopupCall {
  Future<ApiCallResponse> call({
    String? bearerAuth = '',
    String? transno = '',
    String? dbName = '',
    String? contractNo = '',
    double? loanAmount,
    double? interestRate,
    double? topupFeeAmount,
    double? feeAmount,
    String? apiUrl = '',
  }) async {
    final baseUrl = SrisawadApiGroup.getBaseUrl(
      apiUrl: apiUrl,
    );

    final ffApiRequestBody = '''
{
  "transno": "${escapeStringForJson(transno)}",
  "db_name": "${escapeStringForJson(dbName)}",
  "contract_no": "${escapeStringForJson(contractNo)}",
  "loan_amount": ${loanAmount},
  "interest_rate": ${interestRate},
  "topup_fee_amount": ${topupFeeAmount},
  "fee_amount": ${feeAmount}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'post to calculator to get new topup',
      apiUrl: '${baseUrl}/topup/calculator',
      callType: ApiCallType.POST,
      headers: {
        'x-srisawad': 'x1',
        'Authorization': 'Bearer ${bearerAuth}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetTopupDetailCall {
  Future<ApiCallResponse> call({
    String? dbName = '',
    String? contractNo = '',
    String? bearerAuth = '',
    String? apiUrl = '',
  }) async {
    final baseUrl = SrisawadApiGroup.getBaseUrl(
      apiUrl: apiUrl,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get topup detail ',
      apiUrl: '${baseUrl}/topup/detail',
      callType: ApiCallType.GET,
      headers: {
        'x-srisawad': 'x1',
        'Authorization': 'Bearer ${bearerAuth}',
      },
      params: {
        'db_name': dbName,
        'contract_no': contractNo,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  ContractDetailsStruct? contractdetails(dynamic response) =>
      ContractDetailsStruct.maybeFromMap(getJsonField(
        response,
        r'''$.contract_details''',
      ));
  CarDetailsStruct? cardetails(dynamic response) =>
      CarDetailsStruct.maybeFromMap(getJsonField(
        response,
        r'''$.car_details''',
      ));
  String? code(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.code''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  String? dbname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.db_name''',
      ));
  String? contractno(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.contract_no''',
      ));
  String? firstDueDate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.first_due_date''',
      ));
  int? dueday(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.due_day''',
      ));
  String? contractdate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.contract_date''',
      ));
  int? defaulttopupamount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.default_topup_amount''',
      ));
  int? installmentnumber(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.installment_number''',
      ));
  int? installmentamount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.installment_amount''',
      ));
  int? minamountwithrate(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.min_amount_with_rate''',
      ));
  int? maxtopupamount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.max_topup_amount''',
      ));
  double? interestrate(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.interest_rate''',
      ));
  int? transferamount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.transfer_amount''',
      ));
  int? osbalance(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.os_balance''',
      ));
  String? datadate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data_date''',
      ));
  String? lifeinsureamt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.life_insure_amt''',
      ));
  int? mintopupamount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.min_topup_amount''',
      ));
  int? topupextra(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.topup_extra''',
      ));
  int? topupactual(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.topup_actual''',
      ));
  int? feeamount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.fee_amount''',
      ));
  int? balancereceivable(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.balance_receivable''',
      ));
  int? collectionfee(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.collection_fee''',
      ));
  int? penaltyfee(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.penalty_fee''',
      ));
  int? topupYield(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.yield''',
      ));
  int? overDueAmount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.overdue_amount''',
      ));
  String? overDuefrom(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.overdue_from''',
      ));
  String? overDueto(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.overdue_to''',
      ));
  String? interestPaidflag(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.interest_paid_flag''',
      ));
}

class InterestpaymentAPICall {
  Future<ApiCallResponse> call({
    String? comcode = '',
    String? contractNo = '',
    String? contractName = '',
    String? firstname = '',
    String? lastname = '',
    String? nationalThaiId = '',
    String? hashThaiId = '',
    int? interestAmount,
    int? collectionFee,
    int? penaltyFee,
    String? db = '',
    String? barcodeRef1 = '',
    String? barcodeRef2 = '',
    String? apiUrl = '',
  }) async {
    final baseUrl = SrisawadApiGroup.getBaseUrl(
      apiUrl: apiUrl,
    );

    final ffApiRequestBody = '''
{
  "comcode": "${escapeStringForJson(comcode)}",
  "contract_no": "${escapeStringForJson(contractNo)}",
  "contract_name": "${escapeStringForJson(contractName)}",
  "firstname": "${escapeStringForJson(firstname)}",
  "lastname": "${escapeStringForJson(lastname)}",
  "national_thai_id": "${escapeStringForJson(nationalThaiId)}",
  "hash_thai_id": "${escapeStringForJson(hashThaiId)}",
  "interest_amount": ${interestAmount},
  "collection_fee": ${collectionFee},
  "penalty_fee": ${penaltyFee},
  "db": "${escapeStringForJson(db)}",
  "barcode_ref1": "${escapeStringForJson(barcodeRef1)}",
  "barcode_ref2": "${escapeStringForJson(barcodeRef2)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'interestpaymentAPI',
      apiUrl: '${baseUrl}/payment/interest',
      callType: ApiCallType.POST,
      headers: {
        'x-srisawad': 'x1',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? code(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.code''',
      ));
  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
}

class VisionThaiIdCall {
  Future<ApiCallResponse> call({
    FFUploadedFile? file,
    String? apiUrl = '',
  }) async {
    final baseUrl = SrisawadApiGroup.getBaseUrl(
      apiUrl: apiUrl,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'visionThaiId',
      apiUrl: '${baseUrl}/vision/thai-id-validate',
      callType: ApiCallType.POST,
      headers: {
        'x-srisawad': 'x1',
      },
      params: {
        'file': file,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Srisawad api Group Code

class CheckRateApiCall {
  static Future<ApiCallResponse> call({
    String? chanodNo = '',
    String? changwatName = '',
    String? amphurName = '',
    String? landAreaRai = '',
    String? landAreaNgan = '',
    String? landAreaWa = '',
    String? utmmap = '',
    String? landNo = '',
    String? surveyNo = '',
    String? apiUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
"CHANOD_NO":"${chanodNo}",
"CHANGWAT_NAME":"${changwatName}",
 "AMPHUR_NAME":"${amphurName}",
"LAND_AREA_RAI":"${landAreaRai}",
"LAND_AREA_NGAN":"${landAreaNgan}",
"LAND_AREA_WA":"${landAreaWa}",
"UTMMAP":"${utmmap}",
"LAND_NO":"${landNo}",
"SURVEY_NO":"${surveyNo}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'checkRateApi',
      apiUrl: '${apiUrl}/api/rate/v2/check-rate-ltv',
      callType: ApiCallType.POST,
      headers: {
        'x-api-key': 'YXBpIGludGVybmFsIHRyYW5zZmVyIGdzYg==',
        'Authorization': 'bearer LPXBrHOLgSYVWoK25zOKmgIxou3MQ430',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static ChanodDataModelStruct? results(dynamic response) =>
      ChanodDataModelStruct.maybeFromMap(getJsonField(
        response,
        r'''$.results[:]''',
      ));
  static String? statuscode(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.code''',
      ));
}

class SaveRateApiCall {
  static Future<ApiCallResponse> call({
    String? chanodNo = '',
    String? changwatName = '',
    String? amphurName = '',
    String? landAreaRai = '',
    String? landAreaNgan = '',
    String? landAreaWa = '',
    String? utmmap = '',
    String? landNo = '',
    String? surveyNo = '',
    String? firstName = '',
    String? lastName = '',
    String? phoneNumber = '',
    String? birthDate = '',
    String? email = '',
    String? titleName = '',
    String? hashId = '',
    String? idNumber = '',
    FFUploadedFile? imageChanodFront,
    FFUploadedFile? imageChanodBack,
    dynamic ratesDataJson,
    String? apiUrl = '',
    String? consentDate = '',
  }) async {
    final ratesData = _serializeJson(ratesDataJson);

    return ApiManager.instance.makeApiCall(
      callName: 'saveRateApi ',
      apiUrl: '${apiUrl}/api/rate/leads/save',
      callType: ApiCallType.POST,
      headers: {
        'x-api-key': 'YXBpIGludGVybmFsIHRyYW5zZmVyIGdzYg==',
        'Authorization': 'bearer LPXBrHOLgSYVWoK25zOKmgIxou3MQ430',
      },
      params: {
        'CHANODE_NO': chanodNo,
        'CHANGWAT_NAME': changwatName,
        'AMPHUR_NAME': amphurName,
        'LAND_AREA_RAI': landAreaRai,
        'LAND_AREA_NGAN': landAreaNgan,
        'LAND_AREA_WA': landAreaWa,
        'UTMMAP': utmmap,
        'LAND_NO': landNo,
        'SURVEY_NO': surveyNo,
        'first_name': firstName,
        'last_name': lastName,
        'phone_number': phoneNumber,
        'birth_date': birthDate,
        'email': email,
        'title_name': titleName,
        'hash_id': hashId,
        'id_number': idNumber,
        'image_chanod_front': imageChanodFront,
        'image_chanod_back': imageChanodBack,
        'rates_data': ratesData,
        'consent_date': consentDate,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? statuscode(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.code''',
      ));
}

class SaveRateApiWebCall {
  static Future<ApiCallResponse> call({
    String? chanodNo = '',
    String? changwatName = '',
    String? amphurName = '',
    String? landAreaRai = '',
    String? landAreaNgan = '',
    String? landAreaWa = '',
    String? utmmap = '',
    String? landNo = '',
    String? surveyNo = '',
    String? firstName = '',
    String? lastName = '',
    String? phoneNumber = '',
    String? birthDate = '',
    String? email = '',
    String? titleName = '',
    String? hashId = '',
    String? idNumber = '',
    FFUploadedFile? imageChanodFront,
    FFUploadedFile? imageChanodBack,
    dynamic ratesDataJson,
    String? apiUrl = '',
    String? consentDate = '',
    String? leadSource = '',
    String? consentFlg = '',
    String? step = '',
    String? leadsId = '',
    String? utmSource = '',
    String? utmMedium = '',
    String? utmCampaign = '',
    String? thaiId = '',
  }) async {
    final ratesData = _serializeJson(ratesDataJson);

    return ApiManager.instance.makeApiCall(
      callName: 'saveRateApiWeb',
      apiUrl: '${apiUrl}/api/rate/leads-web/save',
      callType: ApiCallType.POST,
      headers: {
        'x-api-key': 'YXBpIGludGVybmFsIHRyYW5zZmVyIGdzYg==',
        'Authorization': 'bearer LPXBrHOLgSYVWoK25zOKmgIxou3MQ430',
      },
      params: {
        'CHANODE_NO': chanodNo,
        'CHANGWAT_NAME': changwatName,
        'AMPHUR_NAME': amphurName,
        'LAND_AREA_RAI': landAreaRai,
        'LAND_AREA_NGAN': landAreaNgan,
        'LAND_AREA_WA': landAreaWa,
        'UTMMAP': utmmap,
        'LAND_NO': landNo,
        'SURVEY_NO': surveyNo,
        'first_name': firstName,
        'last_name': lastName,
        'phone_number': phoneNumber,
        'birth_date': birthDate,
        'email': email,
        'title_name': titleName,
        'hash_id': hashId,
        'id_number': idNumber,
        'image_chanod_front': imageChanodFront,
        'image_chanod_back': imageChanodBack,
        'rates_data': ratesData,
        'consent_date': consentDate,
        'lead_source': leadSource,
        'consent_flg': consentFlg,
        'step': step,
        'leads_id': leadsId,
        'utm_source': utmSource,
        'utm_medium': utmMedium,
        'utm_campaign': utmCampaign,
        'thai_id': thaiId,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? statuscode(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.code''',
      ));
  static int? leadsid(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.data.leads_id''',
      ));
}

class TopupLeadLHMobileAppCall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? branchCode = '',
    String? branchName = '',
    String? titleId = '',
    String? titleName = '',
    String? firstName = '',
    String? lastName = '',
    String? phoneNumber = '',
    String? birthDate = '',
    String? age = '',
    String? email = '',
    String? contractThaiId = '',
    String? pdpaFlg = '',
    String? pdpaDate = '',
    String? utmSource = '',
    String? utmMedium = '',
    String? utmCampaign = '',
    dynamic contractDetailsJson,
    dynamic carDetailsJson,
    dynamic paymentDetailsJson,
    dynamic topupDetailJson,
    dynamic barcodeDetailsJson,
    dynamic insurancesJson,
    String? dataDate = '',
    String? contractName = '',
    String? dbName = '',
    String? contractNo = '',
    String? contractNoBlinding = '',
    String? contractBankType = '',
    String? contractBankAccount = '',
    String? contractBankBrandname = '',
    String? contractDate = '',
    String? contractCloseDate = '',
    String? transno = '',
    String? requestTopupAmount = '',
    String? requestDate = '',
    String? requestStatus = '',
    String? loanAmount = '',
    String? thaiId = '',
    String? hashThaiId = '',
  }) async {
    final contractDetails = _serializeJson(contractDetailsJson);
    final carDetails = _serializeJson(carDetailsJson);
    final paymentDetails = _serializeJson(paymentDetailsJson);
    final topupDetail = _serializeJson(topupDetailJson);
    final barcodeDetails = _serializeJson(barcodeDetailsJson);
    final insurances = _serializeJson(insurancesJson);
    final ffApiRequestBody = '''
{
"thai_id":"${thaiId}",
"hash_thai_id":"${hashThaiId}",
  "contract_details": ${contractDetails},
  "car_details": ${carDetails},
  "payment_details": ${paymentDetails},
  "topup_detail": ${topupDetail},
  "barcode_details": ${barcodeDetails},
  "insurances": ${insurances},
  "data_date": "${dataDate}",
  "contract_name": "${contractName}",
  "db_name": "${dbName}",
  "contract_no": "${contractNo}",
  "contract_no_blinding": "${contractNoBlinding}",
  "contract_bank_type": "${contractBankType}",
  "contract_bank_account": "${contractBankAccount}",
  "contract_bank_brandname": "${contractBankBrandname}",
  "contract_date": "${contractDate}",
  "contract_close_date": "${contractCloseDate}",
  "transno": "${transno}",
  "request_topup_amount": "${requestTopupAmount}",
  "request_date": "${requestDate}",
  "request_status": "${requestStatus}",
  "loan_amount": "${loanAmount}",
  "branch_code": "${branchCode}",
  "branch_name": "${branchName}",
  "title_id": "${titleId}",
  "title_name": "${titleName}",
  "first_name": "${firstName}",
  "last_name": "${lastName}",
  "phone_number": "${phoneNumber}",
  "birth_date": "${birthDate}",
  "age": "${age}",
  "email": "${email}",
  "contract_thai_id": "${contractThaiId}",
  "pdpa_flg": "${pdpaFlg}",
  "pdpa_date": "${pdpaDate}",
  "utm_source": "${utmSource}",
  "utm_medium": "${utmMedium}",
  "utm_campaign": "${utmCampaign}"

}''';
    return ApiManager.instance.makeApiCall(
      callName: 'topupLeadLHMobileApp',
      apiUrl: '${apiUrl}/ssw_service_api/api/leads/lh-save',
      callType: ApiCallType.POST,
      headers: {
        'x-api-key': 'YXBpIGludGVybmFsIHRyYW5zZmVyIGdzYg==',
        'Authorization': 'bearer LPXBrHOLgSYVWoK25zOKmgIxou3MQ430',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? statuscode(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.code''',
      ));
  static int? leadsid(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.results.data.leads_id''',
      ));
}

class SendNotificationCall {
  static Future<ApiCallResponse> call({
    String? title = '',
    String? body = '',
    String? type = '',
    String? hashThaiId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "data": [
    {
      "title": "${escapeStringForJson(title)}",
      "body": "${escapeStringForJson(body)}",
      "hash_thai_id": "${escapeStringForJson(hashThaiId)}"
}
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'sendNotification',
      apiUrl: 'https://mobile-api.swpfin.com/notification',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Basic c2F3YWRhcGlfcHJkOlByb2R1Y3Rpb25TYXdhZEFkbUAyMDIzeDE=',
        'accept': '*/*',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UserDetailCall {
  static Future<ApiCallResponse> call({
    String? hashId = '',
    String? url = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'userDetail',
      apiUrl: '${url}/user/detail?hash_thai_id=${hashId}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static CustomerDetailStruct? results(dynamic response) =>
      CustomerDetailStruct.maybeFromMap(getJsonField(
        response,
        r'''$.results''',
      ));
  static String? statuscode(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.code''',
      ));
  static bool? isexistingcustomer(dynamic response) =>
      castToType<bool>(getJsonField(
        response,
        r'''$.results.is_existing_customer''',
      ));
  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.message''',
      ));
}

class GetTopupCardApiCall {
  static Future<ApiCallResponse> call({
    String? hashId = '',
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getTopupCardApi',
      apiUrl: 'https://dev.swpfin.com:7076/loan/list?hash_thai_id=${hashId}',
      callType: ApiCallType.GET,
      headers: {
        'x-srisawad': 'x1_c3Jpc2F3YWQ',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<TopupCardDataModelStruct>? results(dynamic response) =>
      (getJsonField(
        response,
        r'''$.results''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => TopupCardDataModelStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
  static double? sumCurrentDueAmount(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.sum_current_due_amount''',
      ));
}

class GetFirebaseTokenCall {
  static Future<ApiCallResponse> call({
    String? thaiId = '',
    String? phoneNumber = '',
  }) async {
    final ffApiRequestBody = '''
{
  "thai_id": "${escapeStringForJson(thaiId)}",
  "phone_number": "${escapeStringForJson(phoneNumber)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getFirebaseToken',
      apiUrl: 'https://mobile-api.swpfin.com/auth/login',
      callType: ApiCallType.POST,
      headers: {
        'x-srisawad': 'x1_c3Jpc2F3YWQ',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static CustomerDetailStruct? results(dynamic response) =>
      CustomerDetailStruct.maybeFromMap(getJsonField(
        response,
        r'''$.results''',
      ));
  static String? statuscode(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results.code''',
      ));
  static bool? isexistingcustomer(dynamic response) =>
      castToType<bool>(getJsonField(
        response,
        r'''$.results.is_existing_customer''',
      ));
  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results.message''',
      ));
}

class GetlocationAPICall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? branch = '',
    String? apiUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "token": "${escapeStringForJson(token)}",
  "branch": "${escapeStringForJson(branch)}",
  "api_url": "${escapeStringForJson(apiUrl)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetlocationAPI',
      apiUrl: '${apiUrl}/api/check-in/location',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? group(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.Detail.Group''',
      ));
  static List<String>? branchCode(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.Location[:].BRANCH_CODE''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? branchName(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.Location[:].BRANCH_NAME''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? branchLat(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.Location[:].LATITUDE''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? branchLong(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.Location[:].LONGITUDE''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? branchRadius(dynamic response) => (getJsonField(
        response,
        r'''$.Detail.Location[:].RADIUS''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static int? statusLayer2(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.Detail.status''',
      ));
  static dynamic statusLayer3(dynamic response) => getJsonField(
        response,
        r'''$.Detail.Location.status''',
      );
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static List<BranchLocationModelStruct>? branchdata(dynamic response) =>
      (getJsonField(
        response,
        r'''$.Detail.Location''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => BranchLocationModelStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
}

class GetListChanodCall {
  static Future<ApiCallResponse> call({
    String? empCode = '',
    String? mode = '',
    String? regionCode = '',
    String? apiUrl = '',
    String? areaCode = '',
  }) async {
    final ffApiRequestBody = '''
{
  "emp_code": "${escapeStringForJson(empCode)}",
  "mode": "${escapeStringForJson(mode)}",
  "region_code": "${escapeStringForJson(regionCode)}",
  "area_code": "${escapeStringForJson(areaCode)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetListChanod',
      apiUrl: '${apiUrl}/api/rate/region/all',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statuslayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  static List<ChanodDataListStruct>? data(dynamic response) => (getJsonField(
        response,
        r'''$.results.data''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => ChanodDataListStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
  static List<ChanodData3Struct>? assignTodData(dynamic response) =>
      (getJsonField(
        response,
        r'''$.results.data.assign_to''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => ChanodData3Struct.maybeFromMap(x))
          .withoutNulls
          .toList();
  static List<ChanodData3Struct>? assignForData(dynamic response) =>
      (getJsonField(
        response,
        r'''$.results.data.assign_for''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => ChanodData3Struct.maybeFromMap(x))
          .withoutNulls
          .toList();
}

class GetListGroceryCall {
  static Future<ApiCallResponse> call({
    String? empCode = '',
    String? mode = '',
    String? regionCode = '',
    String? apiUrl = '',
    String? areaCode = '',
  }) async {
    final ffApiRequestBody = '''
{
  "emp_code": "${escapeStringForJson(empCode)}",
  "mode": "${escapeStringForJson(mode)}",
  "region_code": "${escapeStringForJson(regionCode)}",
  "area_code": "${escapeStringForJson(areaCode)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetListGrocery',
      apiUrl: '${apiUrl}/api/grocery/region/all',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statuslayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  static List<ChanodDataListStruct>? data(dynamic response) => (getJsonField(
        response,
        r'''$.results.data''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => ChanodDataListStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
  static List<ChanodData3Struct>? assignTodData(dynamic response) =>
      (getJsonField(
        response,
        r'''$.results.data.assign_to''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => ChanodData3Struct.maybeFromMap(x))
          .withoutNulls
          .toList();
  static List<ChanodData3Struct>? assignForData(dynamic response) =>
      (getJsonField(
        response,
        r'''$.results.data.assign_for''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => ChanodData3Struct.maybeFromMap(x))
          .withoutNulls
          .toList();
}

class SaveAssignBranchApiCall {
  static Future<ApiCallResponse> call({
    String? empCode = '',
    String? mode = '',
    String? regionCode = '',
    String? leadId = '',
    String? branchCode = '',
    String? assignType = '',
    String? remark = '',
    String? apiUrl = '',
    String? areaCode = '',
  }) async {
    final ffApiRequestBody = '''
{
  "emp_code": "${escapeStringForJson(empCode)}",
  "mode": "${escapeStringForJson(mode)}",
  "region_code": "${escapeStringForJson(regionCode)}",
  "lead_id": "${escapeStringForJson(leadId)}",
  "branch_code": "${escapeStringForJson(branchCode)}",
  "assign_type": "${escapeStringForJson(assignType)}",
  "remark": "${escapeStringForJson(remark)}",
  "area_code": "${escapeStringForJson(areaCode)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SaveAssignBranchApi',
      apiUrl: '${apiUrl}/api/rate/region/save-assign',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statuslayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  static List<ChanodDataListStruct>? data(dynamic response) => (getJsonField(
        response,
        r'''$.results.data''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => ChanodDataListStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
  static dynamic assignTodData(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads''',
      );
  static String? messagelayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class SaveAssignGroceryApiCall {
  static Future<ApiCallResponse> call({
    String? empCode = '',
    String? mode = '',
    String? regionCode = '',
    String? leadId = '',
    String? branchCode = '',
    String? assignType = '',
    String? remark = '',
    String? apiUrl = '',
    String? areaCode = '',
  }) async {
    final ffApiRequestBody = '''
{
  "emp_code": "${escapeStringForJson(empCode)}",
  "mode": "${escapeStringForJson(mode)}",
  "region_code": "${escapeStringForJson(regionCode)}",
  "lead_id": "${escapeStringForJson(leadId)}",
  "branch_code": "${escapeStringForJson(branchCode)}",
  "assign_type": "${escapeStringForJson(assignType)}",
  "remark": "${escapeStringForJson(remark)}",
  "area_code": "${escapeStringForJson(areaCode)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SaveAssignGroceryApi',
      apiUrl: '${apiUrl}/api/grocery/region/save-assign',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statuslayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  static List<ChanodDataListStruct>? data(dynamic response) => (getJsonField(
        response,
        r'''$.results.data''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => ChanodDataListStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
  static dynamic assignTodData(dynamic response) => getJsonField(
        response,
        r'''$.results.data.leads''',
      );
  static String? messagelayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class SaveAssignLeadsCall {
  static Future<ApiCallResponse> call({
    String? empCode = '',
    String? mode = '',
    String? regionCode = '',
    String? leadId = '',
    String? branchCode = '',
    String? assignType = '',
    String? remark = '',
  }) async {
    final ffApiRequestBody = '''
{
  "emp_code": "${escapeStringForJson(empCode)}",
  "mode": "${escapeStringForJson(mode)}",
  "region_code": "${escapeStringForJson(regionCode)}",
  "lead_id": "${escapeStringForJson(leadId)}",
  "branch_code": "${escapeStringForJson(branchCode)}",
  "assign_type": "${escapeStringForJson(assignType)}",
  "remark": "${escapeStringForJson(remark)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'saveAssignLeads',
      apiUrl:
          'https://2f24-49-231-1-82.ngrok-free.app/ssw_arunsawad_api/api/rate/region/save-assign',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetLeadCalledStatusDropdownAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
    String? leadChannel = '',
  }) async {
    final ffApiRequestBody = '''
{
  "token": "${escapeStringForJson(token)}",
  "leadChannel": "${escapeStringForJson(leadChannel)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getLeadCalledStatusDropdownAPI',
      apiUrl: '${apiUrl}/api/lead/statuscall',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static List<String>? callStatusID(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].CallStatusID''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? channel(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].Channel''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? callStatusType(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].CallStatusType''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? callStatusCode(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].CallStatusCode''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? callStatusName(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].CallStatusName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class SaveCallStatusAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
    String? leadID = '',
    String? statusCallID = '',
    String? reasonID = '',
    String? reasonDetail = '',
  }) async {
    final ffApiRequestBody = '''
{
  "token": "${escapeStringForJson(token)}",
  "leadID": "${escapeStringForJson(leadID)}",
  "statusCall_ID": "${escapeStringForJson(statusCallID)}",
  "reason_ID": "${escapeStringForJson(reasonID)}",
  "reasonDetail": "${escapeStringForJson(reasonDetail)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'saveCallStatusAPI',
      apiUrl: '${apiUrl}/api/lead/save-call',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic statusLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info[:].status''',
      );
  static dynamic messageLayer2(dynamic response) => getJsonField(
        response,
        r'''$.info[:].message''',
      );
  static dynamic info(dynamic response) => getJsonField(
        response,
        r'''$.info[:].info''',
      );
  static dynamic callStatus(dynamic response) => getJsonField(
        response,
        r'''$.info[:].statusCall.call''',
      );
  static dynamic callStatusReason(dynamic response) => getJsonField(
        response,
        r'''$.info[:].statusCall.callStatus''',
      );
  static dynamic statusReasonDetail(dynamic response) => getJsonField(
        response,
        r'''$.info[:].statusCall.callReason''',
      );
}

class GetLeadReasonCallDropdownAPICall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
    String? callStatusId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "token": "${escapeStringForJson(token)}",
  "call_status_id": "${escapeStringForJson(callStatusId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getLeadReasonCallDropdownAPI',
      apiUrl: '${apiUrl}/api/lead/reasoncall/${callStatusId}',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Basic dGFra286MTIzNDU2',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? statusLayer1(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? messageLayer1(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static List<String>? reasonID(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].ReasonID''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? callStatusID(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].CallStatusID''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? reasonName(dynamic response) => (getJsonField(
        response,
        r'''$.info[:].ReasonName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class ApproveInstallmentListApiCall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'ApproveInstallmentListApi',
      apiUrl: '${apiUrl}/api/quotations/approve-installment-list',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<InsuranceInfoDataModelStruct>? approvedJson(dynamic response) =>
      (getJsonField(
        response,
        r'''$.results.data.approved''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => InsuranceInfoDataModelStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
  static List<TenorListDataModelStruct>? tenorListApproved(dynamic response) =>
      (getJsonField(
        response,
        r'''$.results.data.approved[:].tenor_list.*''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => TenorListDataModelStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
  static List<TenorListDataModelStruct>? tenorListWaiting(dynamic response) =>
      (getJsonField(
        response,
        r'''$.results.data.waiting_approve[:].tenor_list.*''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => TenorListDataModelStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
  static List<InsuranceInfoDataModelStruct>? waitingApprovedJson(
          dynamic response) =>
      (getJsonField(
        response,
        r'''$.results.data.waiting_approve''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => InsuranceInfoDataModelStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
  static dynamic tenorListJson(dynamic response) => getJsonField(
        response,
        r'''$.results.data.waiting_approve[:].tenor_list''',
      );
}

class ApproveInstallmentAPISaveCall {
  static Future<ApiCallResponse> call({
    String? apiUrl = '',
    String? token = '',
    String? quotationId = '',
    String? tenorFirstDue = '',
  }) async {
    final ffApiRequestBody = '''
{
  "quotation_id": "${escapeStringForJson(quotationId)}",
  "tenor_first_due": "${escapeStringForJson(tenorFirstDue)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ApproveInstallmentAPISave',
      apiUrl: '${apiUrl}/api/payment/approve-save',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<InsuranceInfoDataModelStruct>? approvedJson(dynamic response) =>
      (getJsonField(
        response,
        r'''$.results.data.approved''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => InsuranceInfoDataModelStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
  static List<TenorListDataModelStruct>? tenorListApproved(dynamic response) =>
      (getJsonField(
        response,
        r'''$.results.data.approved[:].tenor_list.*''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => TenorListDataModelStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
  static List<TenorListDataModelStruct>? tenorListWaiting(dynamic response) =>
      (getJsonField(
        response,
        r'''$.results.data.waiting_approve[:].tenor_list.*''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => TenorListDataModelStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
  static List<InsuranceInfoDataModelStruct>? waitingApprovedJson(
          dynamic response) =>
      (getJsonField(
        response,
        r'''$.results.data.waiting_approve''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => InsuranceInfoDataModelStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
  static dynamic tenorListJson(dynamic response) => getJsonField(
        response,
        r'''$.results.data.waiting_approve[:].tenor_list''',
      );
  static int? code(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  static dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
